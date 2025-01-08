Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B7FE77199
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:39 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.14214.1736325751935123699
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HiOCGQmm;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab2b72fb3c9so51966466b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325750; x=1736930550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rkeCj8uH+ODVV6U7z0Ub3ROhLCEfUihH+0Z6zzOW3KE=;
        b=HiOCGQmmyb3Jv51Z2z9udkScGgVr0uKkilnqes/GBwXxWOdrlCH45L+xhjxATD+sMc
         lHi4SQEwAE2zP6EodtDh8R3izzTxbGZ2dkMxSvcYOtlAC14xeL2NG8Q8NHy4JkWKw/GZ
         D89wwFOpp2oSZIwxZnJ9dBMZI82EzcdeeuYkp6IkWq6bP+RnsWqNH53KhHIELn0ySIQs
         5MQ3LplQO39y5jwlD2GYnQy7ifKQSz4fG7nd88GB9KYGM8yNPjgzjeOa/j27IqC+IqWh
         cdFt2t1+GhPgcTpnW512bcV/9PKDXJWDaNpHnnNrXe4S6JHGUraZSlfDhcq9F5xv4wcz
         OvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325750; x=1736930550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rkeCj8uH+ODVV6U7z0Ub3ROhLCEfUihH+0Z6zzOW3KE=;
        b=pkqX2tqu56y/mPuF/4iAV0lyhSLbluc9RohdMGaILTqK/+2HdmucthhzF+eK+4wl4X
         WKp6JT+ihrRo6omDgvDy9RDW+EdotR752ACWtp9Fs44V0D3qy6aODM4dBnHQkCafBTPL
         FBtqjaIKk0Q/4qNcZPHuewYl9GaK/sD3k2KqmgRHPdkPAxPRLi1KY7YnrC0hpzUSwNAa
         wGLGgO1yoNV/27tUCh0V3Tg38vsdVt6ALO11yWOLyf4DQWjGw7PnwFYRIENJkwtcJS6O
         NFfMoFBd6Gl1NawS7ZUTrR09PD72nOvXlOCdergaP1Zk6H0VPnHz3OhskDTnNIDVt6rl
         xx+Q==
X-Gm-Message-State: AOJu0YyBNJI7DaEMD1IOe0ClRVapFrasBdamOKirUyL8thD33VHPrXhF
	bSWRF7Jllu2Xw+gi/XpZFbWrJ8pVp1nVLYGcY/9ghP8kPqb9/gkuZ3vTow==
X-Gm-Gg: ASbGnctATk2US76K27m5Nexnq/3c3UdfmlqG95PginwUQXVKcm+1gie8QbWMNnKKBa5
	dbR/jljW4TiRducZpl+2mqp7mwbOQnnvoS5Mp0+FgKWC9mGNdD6HkvYgHg9HOZ+JGnOLG7VrwqB
	fbBxp+e9Y27temm/ifTjZMAYHKPsFp2EYKbBhXy8AAqXNri5HF9DAQOpXhBEna4ttUSKY1zo/y1
	ios0kjLWFx5UOTqIdg2ttwiCB7AKrB1Y3w/Zo3hckcKl5TcDdapzsi5jRIe5X1YqvJHwgEgXjL8
	vwJ0UiHQycq2h9pNGg==
X-Google-Smtp-Source: AGHT+IH6d/+qTRLwHfplfmFIHiI1DlgaVRnprJmPGoF2yvWhzYyimZLWDOiMxA6oFlXgNpVFbHJYug==
X-Received: by 2002:a17:907:97cf:b0:aa6:75f4:20df with SMTP id a640c23a62f3a-ab2905017b0mr455256666b.9.1736325749997;
        Wed, 08 Jan 2025 00:42:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/20] ppp: update 2.5.1 -> 2.5.2
Date: Wed,  8 Jan 2025 09:42:07 +0100
Message-Id: <20250108084226.117178-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209523

From: Alexander Kanavin <alex@linutronix.de>

License-Update: BSD items clarified to be 2-clause:
https://github.com/ppp-project/ppp/commit/d4ec06ec5839350bd728da0e92a8cb2e1c37d880
passprompt plugin removed upstream.

Add an enable a multilink option, as the build breaks without it at the linking
step (upstream presumably didn't test that it works): https://github.com/ppp-project/ppp/issues/541

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ppp/{ppp_2.5.1.bb => ppp_2.5.2.bb}              | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/ppp/{ppp_2.5.1.bb => ppp_2.5.2.bb} (88%)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.1.bb b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
similarity index 88%
rename from meta/recipes-connectivity/ppp/ppp_2.5.1.bb
rename to meta/recipes-connectivity/ppp/ppp_2.5.2.bb
index 89c9789b870..9ea99cc15a3 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.1.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
@@ -5,11 +5,11 @@ SECTION = "console/network"
 HOMEPAGE = "http://samba.org/ppp/"
 BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
 DEPENDS = "libpcap virtual/crypt"
-LICENSE = "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-later & LGPL-2.0-or-later & PD & RSA-MD & MIT"
-LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=1bea10e81fc6f2df105b1f8b733cb149 \
-                    file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
+LICENSE = "BSD-2-Clause & GPL-2.0-or-later & LGPL-2.0-or-later & PD & RSA-MD & MIT"
+LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=25;md5=f0463bd67ae70535c709fca554089bd8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
-                    file://chat/chat.c;beginline=1;endline=1;md5=234d7d4edd08962c0144e4604050e0b6"
+                    file://chat/chat.c;beginline=1;endline=1;md5=234d7d4edd08962c0144e4604050e0b6 \
+                    "
 
 SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://pon \
@@ -25,13 +25,14 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://ppp@.service \
            "
 
-SRC_URI[sha256sum] = "733b7f5840b613da4eab0429a5081293275f06ba8b528e1b8eea6964faf0243a"
+SRC_URI[sha256sum] = "47da358de54a10cb10bf6ff2cf9b1c03c0d3555518f6182e8f701b8e55733cb2"
 
 inherit autotools pkgconfig systemd
 
-PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} openssl"
+PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} openssl multilink"
 PACKAGECONFIG[pam] = "--with-pam=yes,--with-pam=no,libpam"
 PACKAGECONFIG[openssl] = "--with-openssl=yes,--with-openssl=no,openssl"
+PACKAGECONFIG[multilink] = "--enable-multilink,--disable-multilink"
 
 do_install:append () {
 	mkdir -p ${D}${bindir}/ ${D}${sysconfdir}/init.d
-- 
2.39.5


