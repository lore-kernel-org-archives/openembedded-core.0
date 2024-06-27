Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD0EC2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 07:51:11 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.2996.1719474663572033899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 00:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=apCeG27O;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fa07e4f44eso44958965ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 00:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719474662; x=1720079462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=70zEQmNHHtoE2ZmOX1Lzpycqxi/fIokEfHLGW53IRFA=;
        b=apCeG27OesEhOBW06nfMZCY59uJsZaCYFKN7IqQOTsKtXR3S+vGqFla9x2greg1EwA
         hSzdfpLxLd6a3ue4Xv/j2oig0GmQiouVXhduMSMDmA+cvtLIqnw7GBRayTYxhOTO+y9R
         mstRKiy/qyBSvPZTVnsyFxRhltivprxQYvVJhWH8oqqHlvj0TE00WUGDPuezrltmJGp6
         35v7nn+gApYq2g22eAXqldnFJDsJblKpOr18b4rqihyduoaQ6oKgoug3SdCSsgoeErC6
         mLgvebZPRI9Cs52cTa/oYG3ocI0Ebz99QpCM0Qj3cu2m6UjxmoKsYUKDVYHZUtfioOdE
         +0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719474662; x=1720079462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=70zEQmNHHtoE2ZmOX1Lzpycqxi/fIokEfHLGW53IRFA=;
        b=B84ob4OkC0GdlvV23z4CfHqHQfPI7axYDZ8rubfHeup2U7pYpHYdmS+LRCC2FtjTla
         LwItMFwcwM7i6434K2nj54YR3b8xGcVIbHu+/ZpY0F2CVL75o6XkNRhRlrqwq2lhOrja
         byh3m5JgOtL2sHEuXxox1jTJ7OEXkMz1AuUQ1Qq3IfzTTrp93o207L+4Q5bE1nDm5Hgs
         wQZ0haoB4r8dKtUuZH+s9UxnH8QnwpU3LMCHYTZ0RunQPuMd8ZA6KctBdGPKbvRDdpez
         KVtpsD4g8wR1chsaW2QrbH+piwP88UaS2vhmkxEB9j7SoRSVEnNpAqSgGSLKck4xomLr
         TYtA==
X-Gm-Message-State: AOJu0YzHvjWwSaYEz+NwmpRMBGvEty4jPPVESMma8vWRUJmH1txsB/4B
	kJ5piBQAW6OnUiYK6LXsN7KcVPocJ6DBm0CRMyMW7Q+z6jFBGaCUXaOzwA==
X-Google-Smtp-Source: AGHT+IHL3krgiJBzNaOEA7w424bXOU6tiC8oYvo6bDXgJ74s4RcrYQj+nR7/oCImkwy7HE4o/cFSRg==
X-Received: by 2002:a17:902:ccce:b0:1f7:19b4:c7f5 with SMTP id d9443c01a7336-1fa238e44f8mr149971665ad.12.1719474662383;
        Thu, 27 Jun 2024 00:51:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac9c3376sm7018975ad.280.2024.06.27.00.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:51:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] gcc: Fix wrong order of gcc include paths on musl systems
Date: Thu, 27 Jun 2024 00:50:59 -0700
Message-ID: <20240627075059.1235703-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 07:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201189

musl does not use gcc private system headers, however, the path gets
prepended since gcc driver passes -iprefix option to cc1 based on its
installation location. This starts to prefer these headers instead of
musl provided equivalent system headers which is not as per musl's
design. This patch switches prepend to append for musl systems.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use a runtime check instead of build time check

 meta/recipes-devtools/gcc/gcc-14.1.inc        |  1 +
 ...te-include-paths-on-musl-instead-of-.patch | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-Append-GCC-private-include-paths-on-musl-instead-of-.patch

diff --git a/meta/recipes-devtools/gcc/gcc-14.1.inc b/meta/recipes-devtools/gcc/gcc-14.1.inc
index b057e570f3b..c4bc4c72664 100644
--- a/meta/recipes-devtools/gcc/gcc-14.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-14.1.inc
@@ -68,6 +68,7 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
+           file://0026-Append-GCC-private-include-paths-on-musl-instead-of-.patch \
 "
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
diff --git a/meta/recipes-devtools/gcc/gcc/0026-Append-GCC-private-include-paths-on-musl-instead-of-.patch b/meta/recipes-devtools/gcc/gcc/0026-Append-GCC-private-include-paths-on-musl-instead-of-.patch
new file mode 100644
index 00000000000..cbf5083085a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-Append-GCC-private-include-paths-on-musl-instead-of-.patch
@@ -0,0 +1,36 @@
+From 636cb6e700856c3d0f8b86ab408032ceeb7e5d2a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Jun 2024 22:56:12 -0700
+Subject: [PATCH] Append GCC private include paths on musl instead of
+ prepending
+
+Musl does not need gcc private compiler headers, therefore use them
+after standard system header search paths.
+
+This fixes packages like python builds to detect the musl systems
+correclty, as it looks for musl specific stuff in stdarg.h system
+header, which is wrongly picked from gcc private headers in OE
+
+Upstream-Status: Submitted [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=115368]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/gcc.cc | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/gcc.cc b/gcc/gcc.cc
+index 01968001c44..f0fcaebc3ae 100644
+--- a/gcc/gcc.cc
++++ b/gcc/gcc.cc
+@@ -6589,7 +6589,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
+ 
+ 	      if (gcc_exec_prefix)
+ 		{
+-		  do_spec_1 ("-iprefix", 1, NULL);
++      if (OPTION_MUSL)
++		    do_spec_1 ("-idirafter", 1, NULL);
++      else
++		    do_spec_1 ("-iprefix", 1, NULL);
++
+ 		  /* Make this a separate argument.  */
+ 		  do_spec_1 (" ", 0, NULL);
+ 		  do_spec_1 (gcc_exec_prefix, 1, NULL);

