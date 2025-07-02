Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E404C83F05
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 14:25:45 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.25255.1751466335386163419
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 07:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MxwuVS1v;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-31393526d0dso4521372a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751466335; x=1752071135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPOOOo1XxYzhb0KdzQVuypwvyMqGAKHoexrPOv/+jNs=;
        b=MxwuVS1vTejHWQnE6I0pLgq68LYZ1f8qXQH4/ZNTSo3F1SRocP08fx4bVONel4kLV0
         H7iQfys4KjyJf3wHWmIn9eq/OkU8MVuUuSF7LLeYaDDofT+gN9hTpOPB0SvZ0RIX4coO
         YTUG357DOrGLeVf5TSzr2E6Ym6PllHc1xr3HdkLjkvqqSpCEtzf3DJP7R4aKT6Zbspu3
         xucbsu/aGAg2B/BgEcuFMhGWWhKk4J36E8sKqUw/ppf8CaPniySSUP+qRWiuh4SHeGGp
         G+OoyjJlnK89OzPM4EPWY8hRm1NTYaehCNQDg/mD3YHUdTlG0Vcu57DmUV3xQS9GRJl3
         FZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466335; x=1752071135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPOOOo1XxYzhb0KdzQVuypwvyMqGAKHoexrPOv/+jNs=;
        b=YI4IIKU+zZh1j2/CeT3V7zQznGjvPzjwDvkK6uOQ4Cgx4B5APvofH13tHfwxkDgygI
         bQLmpwMeQDfeLWvUXD8q7LubCWfFGK7RO1jjjrvDM06YedOm+cckbSun4uzstwGOuLs2
         Q0uKjN4xdh5GCb93E2GkRBIPK0e6e2MQy6r1ZWvO305/P/qxQfOT/9edHTPWQg/Wc3Fw
         PSxbcfWmwGLRXmP72GbT3cTp4hdUtWmgxQk+M9NWGBL47b8tRjjF/Jk0G7TQRo0g19nN
         8JVtYj0RemUzwwG9Rp4DwcISu0AtcA1ctpt9Al/2Afux3SxRVebFAAmQYNBMIUZBXBFR
         xKRg==
X-Gm-Message-State: AOJu0YxtLgb3UgB9hmscxl/oInv/9nBO0N67bxTg5bdNwlRDg2ralwZ9
	5qZldZV5v3hFwX2hSGaG2Sj7U2/GF8Fyx9L8gbBsc3OBKHSTHTt17lb5lSAZZ8fM+I5anrZqL0/
	r10S9
X-Gm-Gg: ASbGncuZkvwEOonxczNMFoiZ25eHwHReBg7F8Z8nWxpMFW4SoF69/Un2r6IIa6JHC7O
	fyUEJBEuitvsNbkTL3zJAq1vOg5ScFF4V769m/4X9bQdSi8tr3vQLuPhzudDJqfKBbVeKdIw88t
	vWqS+7g+7SnVUQXj7gdiObksKgiWGpz2liVIJwGqhA52xEhGuzpPRCxj5c47/9FE+UXq0AWtyrh
	+9xyxJ2eQ+19JyaIT1SpEMp4GH61zQS0VaVa82gX9snJElXTm/urKzrpOaL17dQw9ucUSw1qmY1
	PN3c56WVgsuVl1NneTttOSKc/tdXYfK2FbEICYK8533WVSLsjiDZpg==
X-Google-Smtp-Source: AGHT+IEy4Kc5xust10mbLhFkD0fg78TGk9PeTUcTOcNQ4cXXq/QJskAG4lHLN9is5afhuOoakxJFFA==
X-Received: by 2002:a17:90b:5405:b0:313:28e7:af14 with SMTP id 98e67ed59e1d1-31a90bcae32mr4305557a91.19.1751466334468;
        Wed, 02 Jul 2025 07:25:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:acee:7642:9516:37b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c15232c9sm14871637a91.45.2025.07.02.07.25.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:25:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/9] gnupg: update 2.4.5 -> 2.4.8
Date: Wed,  2 Jul 2025 07:25:18 -0700
Message-ID: <b05c723ab6a0de959643feb0d70dc5e096ed928a.1751466215.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751466215.git.steve@sakoman.com>
References: <cover.1751466215.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 14:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219837

From: Roland Kovacs <roland.kovacs@est.tech>

This release includes fix for CVE-2025-30258.
Support for --enable-gpg-is-gpg2 config option has been partially removed in
version 2.4.6.

Changelog:
 https://dev.gnupg.org/T7428

CVE: CVE-2025-30258

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnupg/{gnupg_2.4.5.bb => gnupg_2.4.8.bb}          | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.4.5.bb => gnupg_2.4.8.bb} (91%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.4.5.bb b/meta/recipes-support/gnupg/gnupg_2.4.8.bb
similarity index 91%
rename from meta/recipes-support/gnupg/gnupg_2.4.5.bb
rename to meta/recipes-support/gnupg/gnupg_2.4.8.bb
index 97b5d8856c..9c5de263c5 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.5.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.8.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "f68f7d75d06cb1635c336d34d844af97436c3f64ea14bcb7c869782f96f44277"
+SRC_URI[sha256sum] = "b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bcdd060595318616"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
@@ -31,7 +31,6 @@ EXTRA_OECONF = "--disable-ldap \
 		--with-bzip2=${STAGING_LIBDIR}/.. \
 		--with-readline=${STAGING_LIBDIR}/.. \
 		--with-mailprog=${sbindir}/sendmail \
-		--enable-gpg-is-gpg2 \
 		--disable-tests \
                "
 # yat2m can be found from recipe-sysroot-native non-deterministically with different versioning otherwise
@@ -41,7 +40,6 @@ CACHED_CONFIGUREVARS += "ac_cv_path_YAT2M=./yat2m"
 PACKAGES =+ "${PN}-gpg"
 FILES:${PN}-gpg = " \
 	${bindir}/gpg \
-	${bindir}/gpg2 \
 	${bindir}/gpg-agent \
 "
 
@@ -61,11 +59,6 @@ do_configure:prepend () {
 	rm -f ${S}/m4/libgcrypt.m4
 }
 
-do_install:append() {
-	ln -sf gpg2 ${D}${bindir}/gpg
-	ln -sf gpgv2 ${D}${bindir}/gpgv
-}
-
 do_install:append:class-native() {
 	create_wrappers ${STAGING_BINDIR_NATIVE}
 }
@@ -75,7 +68,7 @@ do_install:append:class-nativesdk() {
 }
 
 create_wrappers() {
-	for i in gpg2 gpgconf gpg-agent gpg-connect-agent; do
+	for i in gpg gpgconf gpg-agent gpg-connect-agent; do
 		create_wrapper ${D}${bindir}/$i GNUPG_BINDIR=$1
 	done
 }
-- 
2.43.0


