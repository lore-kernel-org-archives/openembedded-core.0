Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE336CD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:48:12 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10443.1781682490190735649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VqEDs4YX;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-461a5a39da1so1226362f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682488; x=1782287288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KP9il0zz9mouQgh7+AQGmUhWCvuBgcrRg4Zp2rSjuww=;
        b=VqEDs4YXeVapKa7EnTPNDmg3DAZtNq4zuqhqyJh00mHLOYPZmQFE05PlSDGuhDVdkI
         zbEb1G1I1kT9KAe1F35oM6PfDq4BZJ4VpCuWsV26wutXxLNwvrYcn9FmPFnbuDxtb/kt
         aZ7XkLXjZhPnHWL4gNfjKsgWitKp4tJeJioo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682488; x=1782287288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KP9il0zz9mouQgh7+AQGmUhWCvuBgcrRg4Zp2rSjuww=;
        b=P+s5Fs7suXaEBuVSZ51yUvagoHvcF2VTI/J0oqS8Nw95STcetS2JPDnF/VurxOHQyf
         7MpPavHORAn/0lVcjEzcS3wYnPfORzmDJLaufgJhPQ1xbm0WnErHdWSU0sEvcPJHyPci
         anIvPtXvQ5xRqpuP8z3akwcUVFWFb67grsKnv7vMr4edzkE8q9/KbEGyONryGMkpmkVF
         //QNuizYk/+7FTR2/V0nr/rcReqX9yeTaqvfceA5GtZqqAy9G22pNRtwXy5YjO8YHEj0
         LuIJcpNjhU7GsUfyjY/EMmAedK8IFtYqPEvrkuVB21FYVeeNn89bZQu3jfskLM165EDw
         BgAg==
X-Gm-Message-State: AOJu0Yy5amLjj39PqWBnXhUWHVbFvW+ExhlItV+1e11DFwYAWHmAISGt
	lqz/7XORu+Hyjd9t0XYITh4rCf/fkirN7aZJ/0+rxGnzl9wAo8CD4JGr2cRS65t56JqpFHktS+h
	KW0rW
X-Gm-Gg: AfdE7ck+LgbtvDI/OGcQmGXfQkGtgQNKdhniMmKez88bpJ28kG1+163ui76OT6zddLe
	qFDkFlteLcYgBCtP4m4H1SXHCvHRqtZmjb2hpm76g3lnBjRIVqZFJI0XW4GyyIAdhhs4Qyp58Kz
	xUX2Qr7dj448f8Yzd5kPmVE4GB/JhPeWRhQHFiPdTR7/m9MIVUI74lPt19WrS9f1If7NmhT7qoL
	Y1estomLqiMCcxpWKY1unOvprm2zJpJDkAfB6qaPdfm78vIsmpnqYcVcsJ528U4K0O8+81ovL1i
	VWQlh1sB8rjlkSgkAswqqITmBTc6jCB8AP8WvtqhsnvjyeJ2WfyWvGrwTnT/VYRxzPWvFWQOuD7
	WftCF0TLI3R5N1YzH4K0O2AeFRSaAeAABqQfBUgxSCfs7d72Z1nXlcr3w8eaRBG/MOOQKZSrdxb
	HynoCg+Upk3yIwIj7GsLGoRSSN1MJcoULjagzBFA9g4rxThxoTZpAsF4hoNuS4BYPi5CW+MReRZ
	Ktw6Y6l95c7ZD8VbQ==
X-Received: by 2002:adf:f507:0:b0:455:70bc:216d with SMTP id ffacd0b85a97d-46236462342mr3364262f8f.12.1781682488472;
        Wed, 17 Jun 2026 00:48:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2dbfb1sm54721732f8f.35.2026.06.17.00.48.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:48:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 6/8] ca-certificates: upgrade 20260223 -> 20260601
Date: Wed, 17 Jun 2026 09:47:57 +0200
Message-ID: <9cc809d98301d3f05672b6a025857658dd3fd017.1781682367.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682367.git.yoann.congal@smile.fr>
References: <cover.1781682367.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239021

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: ca-certificates-local example removed[1]

[1] https://salsa.debian.org/debian/ca-certificates/-/commit/0ba2e089daf128206b0a13423ceede612bb60270

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit 366cfc1103661f98020d7b7c8d249f2b7f9432af)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...a-certificates_20260223.bb => ca-certificates_20260601.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260223.bb => ca-certificates_20260601.bb} (94%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb b/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
similarity index 94%
rename from meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
index 41690d1d088..1bc64fe34a4 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
@@ -5,7 +5,7 @@ This derived from Debian's CA Certificates."
 HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
 SECTION = "misc"
 LICENSE = "GPL-2.0-or-later & MPL-2.0"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=ae5b36b514e3f12ce1aa8e2ee67f3d7e"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=dab7c7cea776d1a1648deb0052c72647"
 
 # This is needed to ensure we can run the postinst at image creation time
 DEPENDS = ""
@@ -14,7 +14,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "2fa2b00d4360f0d14ec51640ae8aea9e563956b95ea786e3c3c01c4eead42b56"
+SRC_URI[sha256sum] = "7ab6301f7f34eef90a4d278647c260bc0762e0e14561f4649854cf4b0d4bea21"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \

