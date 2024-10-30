Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44CBAD6B6DF
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 22:55:03 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.15.1730328901152704835
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Oct 2024 15:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K6luQ2qx;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e3686088c3so270126a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 15:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730328900; x=1730933700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XfwnJoxtkne6vJUtDTa6TVni0fUD+EGkw4dtNCulHT4=;
        b=K6luQ2qxJspAjnS3eilCMDfGu7Dxy8S2nGZX3hb7MEqE0cQshieR8d34BhzleqI9TK
         Ahb1gz1/aqDxbvS0OYADp6G2fa5uU037S9uzUOshFiNfKd8WzVRvjDKs3bh1KeZD4/Sg
         3Eh/safhlUvb3QhDVjDV82EtUrORuczF6byjqiMepcZs1RT5qw3FMjX988iZyY6xc+yR
         gc116QnskXpIW8IDqxKdNW1iHyDKKeWqJ4iVqhtjbFDFGfa2xAZJqdf106XuZSnmCpYQ
         /febcsHgXbbTVNoBCg8RNkjg0nfYH3GOTrtHu8DyCijJhMmAwVyzAIvGRAeFZWkQbNsO
         YYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730328900; x=1730933700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfwnJoxtkne6vJUtDTa6TVni0fUD+EGkw4dtNCulHT4=;
        b=W6hQgl5S+zJHuzmOH4AC+I9Vvt93etsXajyH+VSrcg+YT4QSTI9C4/zfySZt8mDMct
         bbF9vCzpePToXMI3iRK/Kmlq7eQgmZaOhcVzVk0dqWlOz1YqmjmGNKHYJS+gMDT++yVc
         eP68w1YlmUBTxbH9oAFTGX8gvc2EnfrP6TU5ZQ7TB9z+/zwAdB4psfO/skrRjigH0pcP
         5yYvrePfbBQAbA6pRmzAC+VdaSn6KniigcNjt3lIlmSGRVTOOcWbCTIYwVOMSqn0/iZL
         +aW0YJDveEJQjt2TeESJGOuNDiZrc8MAtZS77J6m9Hrebkx/z4e4mURpCjDKW2e1gCwb
         w+aA==
X-Gm-Message-State: AOJu0YzGkdd49+wekRUh6YwL5VF7hby7XcKZ2LrERMHc4ntj7iVOIW+I
	OhErNnvADEhfCtFimuS0l65fe1XENsKWCq8GT4KiHyxlf3SFeov6MYJpfQAa
X-Google-Smtp-Source: AGHT+IGz/NT02YP6/DJQ8G9X8COQw2rKkaofeAyPabQLBtAOr8xjbos7Xxv0XD4BbLwYOtqUuEdSnw==
X-Received: by 2002:a17:90b:3908:b0:2d8:e7db:9996 with SMTP id 98e67ed59e1d1-2e92ce50f8dmr5526583a91.13.1730328900238;
        Wed, 30 Oct 2024 15:55:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::35b3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9201b2586sm4519849a91.0.2024.10.30.15.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 15:54:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ppp: Add pam and openssl via packageconfig
Date: Wed, 30 Oct 2024 15:54:57 -0700
Message-ID: <20241030225457.1522289-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 22:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206565

Explicitly enable pam support, otherwise it goes into
detection mode and ends up poking at build host

Turn openssl into packageconfig as well

cc1: warning: include location "/usr/include" is unsafe for cross-compilation [-Wpoison-system-directories]
conftest.c: In function 'main':
conftest.c:68:1: warning: argument 1 null where non-null expected [-Wnonnull]
   68 | pam_authenticate(NULL, 0);
      | ^~~~~~~~~~~~~~~~
In file included from conftest.c:63:
/usr/include/security/pam_appl.h:38:1: note: in a call to function 'pam_authenticate' declared 'nonnull'
   38 | pam_authenticate(pam_handle_t *pamh, int flags);
      | ^~~~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/ppp/ppp_2.5.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.1.bb b/meta/recipes-connectivity/ppp/ppp_2.5.1.bb
index 5b8c49ca850..2b917905b24 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.1.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.1.bb
@@ -4,7 +4,7 @@ the Point-to-Point Protocol (PPP) on Linux and Solaris systems."
 SECTION = "console/network"
 HOMEPAGE = "http://samba.org/ppp/"
 BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
-DEPENDS = "libpcap openssl virtual/crypt"
+DEPENDS = "libpcap virtual/crypt"
 LICENSE = "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-later & LGPL-2.0-or-later & PD & RSA-MD & MIT"
 LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=1bea10e81fc6f2df105b1f8b733cb149 \
                     file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
@@ -29,7 +29,9 @@ SRC_URI[sha256sum] = "733b7f5840b613da4eab0429a5081293275f06ba8b528e1b8eea6964fa
 
 inherit autotools systemd
 
-EXTRA_OECONF += "--with-openssl=${STAGING_EXECPREFIXDIR}"
+PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} openssl"
+PACKAGECONFIG[pam] = "--with-pam=${STAGING_EXECPREFIXDIR},--with-pam=no,libpam"
+PACKAGECONFIG[openssl] = "--with-openssl=${STAGING_EXECPREFIXDIR},--with-openssl=no,openssl"
 
 do_install:append () {
 	mkdir -p ${D}${bindir}/ ${D}${sysconfdir}/init.d

