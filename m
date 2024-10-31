Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC95CE6748A
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 22:41:20 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.25178.1730414473987000332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 15:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YshuNEkh;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20e6981ca77so16198635ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 15:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730414473; x=1731019273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zjgo1oTGQ/gmG5ySkR/rvPCbfHEvxx/pXbzbZNGu1Ig=;
        b=YshuNEkhrhAxoPfa3gI+bCgsNn8IfzJ5QeGOmvoi0rnbouwAMoSqLqmMEZpvhWZ2OE
         xAz+haPFDoLRN+/pGEijNGSEVlzU6u4YCRq4FU3Hdr7kqOkJjbgC3K8//ZdbUzKwQXAI
         KLf4jtPq0V3/XZqjuwnHhTaADt64NMDbQJ5GBsHuqAFc3K+72fRj5nNudxF5uBZLDVbZ
         BL7cV1HDvv9eGqJcyRv9qOZpoyt1C9PuG+lBLI40G40FeaHQnnU9HTBRj1HT/a8BNndn
         EbWY7jQCcAEGkQ1v0QcPgBiAKkG7gU6NYPO8rYn3JBJgUJyWOb05Wp3vQNrQBp2wBa7b
         Y9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730414473; x=1731019273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjgo1oTGQ/gmG5ySkR/rvPCbfHEvxx/pXbzbZNGu1Ig=;
        b=kZqKaewq/KKzSMh7ttq/TRNsj3ouSCxKf9pQzHpzj5hxl9k5YqXGdV6Q1opvV5qiIo
         DqaRWJRoSVZkN0v1G6FHAXX6IhQCjzO+Jo5yvzKB/bvOHdx50qf9L+NohjLY2ongdcLi
         x/Uf9rw+hhWfkAXXeZK1tuNyrC4kD+0+GXPmIVdKtNReRVkem0csFk18UeA95NRY4kzW
         Ubw1RVygVhIb1ElziIAlFVXGjD2aY299EwL/MW7G3oOtfKEvs5asM3etF9tc/yRKRynP
         Uw7yjWve4O3m6AeuK/UTmxenRshPcthAaqKFVugjz6BllBJG1GHyn5oQ9k6dKYQNJm/c
         1a2A==
X-Gm-Message-State: AOJu0YyraXt0YtqrSq61tScyccfBIgdgs9QBGGlqRvPS26SuqMgIllJI
	Jk728cFLDFZPbNOcmT8fvoesKXYLVpwMRSFcHm5tLXQwoi3cVxRte9lJHLRs
X-Google-Smtp-Source: AGHT+IEf3xMVfuoSbZ8bS2wvsj5geXgDvuA1G3hIMZVs4C8HCORBX5CRzW88hl0uuNkYoRKH2Cqfxg==
X-Received: by 2002:a17:903:32c7:b0:20c:c482:1d66 with SMTP id d9443c01a7336-21103b25486mr57097075ad.35.1730414472855;
        Thu, 31 Oct 2024 15:41:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::a3c0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee452a7ffesm1498908a12.23.2024.10.31.15.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 15:41:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] ppp: Add pam and openssl via packageconfig
Date: Thu, 31 Oct 2024 15:41:10 -0700
Message-ID: <20241031224110.1701976-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 22:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206596

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
v2: Use pkgconfig to search for openssl and pam libs

 meta/recipes-connectivity/ppp/ppp_2.5.1.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.1.bb b/meta/recipes-connectivity/ppp/ppp_2.5.1.bb
index 5b8c49ca850..89c9789b870 100644
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
@@ -27,9 +27,11 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
 
 SRC_URI[sha256sum] = "733b7f5840b613da4eab0429a5081293275f06ba8b528e1b8eea6964faf0243a"
 
-inherit autotools systemd
+inherit autotools pkgconfig systemd
 
-EXTRA_OECONF += "--with-openssl=${STAGING_EXECPREFIXDIR}"
+PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} openssl"
+PACKAGECONFIG[pam] = "--with-pam=yes,--with-pam=no,libpam"
+PACKAGECONFIG[openssl] = "--with-openssl=yes,--with-openssl=no,openssl"
 
 do_install:append () {
 	mkdir -p ${D}${bindir}/ ${D}${sysconfdir}/init.d

