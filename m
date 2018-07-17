Return-Path: <nick83ola@gmail.com>
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
	[209.85.161.176])
	by mail.openembedded.org (Postfix) with ESMTP id 306D178862
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 10:48:53 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id t18-v6so211751ywg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 03:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xIRrdMKTxz24dPErd0Al33rf8vSU/ELvLHwgLSD2ZDA=;
	b=DF8isz/D4wjieqAcLoTjFCE7sxctM7v1ooCR9riu+by2joNm4JC1x4RxUT9QHpO+RL
	SpyBeEe78BcG6f37OIPdAC29PMZC1+hr/KWDDVtTzC2PokOB1zDb+7ylGNxw7oV886YW
	NdUCvQgKaWP5A8yoaszYkPCUCqM18CZofPdvGuTbuFLMbECOL4T63VGlC58P0iqp1auD
	N6t96PqvAbHM//SW80MlaNm+ejI8wZE0B2LE+oA2I9IvqALYxU8lKKYuWd4SBL6u6Lb4
	7qe4QROGYXSXs0h8zfgPDqDFqNg20r0TqMeKRiYlWFSpri3t7huqLf3zXBqdR4MuYt20
	8ztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xIRrdMKTxz24dPErd0Al33rf8vSU/ELvLHwgLSD2ZDA=;
	b=BB0r/yNrXJ8lJnfTZtsKbsooMPpW0sp9k5MDgGTGcr2rBAiw2kniPZpKDlVg8OVV8B
	3fSmJCUUbORuJq69mg4vPyzXlNkLdpFkWlAAg5eNW0Xl+iI5cqhCy5ssRZeqHcX5aIxv
	5U7knRlHbiFUeFMh12mndoiE4iSQB3CEPUG94DW5vzzbw4BofA6VZ891HWnYrpIqj3VR
	9+oK+bdWhW6ZG2ZIwmHcNC33WapxROmLPnxnX933iAJC82DMoc90xwsiOCezHpmQBQef
	dO1H5GaUmklRfTF+mLwe2L9Tckj0TEcLEeYmzDmBWSYm6f7/ykqicXladRRbFtiXnP9s
	o5yA==
X-Gm-Message-State: AOUpUlHHFVqGrFEVIHOJZHwP3sV5Prc6zKiwjfuu/dF7ocr3r8/PBQws
	5w0v4utIjARzNVci8KG1f/EqsQ==
X-Google-Smtp-Source: AAOMgpfjBLFduiY4mR1aA/gfiVWLpznI+jvY9DQTtY7UUiMtjENaxPe6Rm4Zl6l+DVHrDAWiOycLSQ==
X-Received: by 2002:a0d:d516:: with SMTP id
	x22-v6mr508293ywd.230.1531824533790; 
	Tue, 17 Jul 2018 03:48:53 -0700 (PDT)
Received: from nick-laptop.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	f187-v6sm230014ywa.39.2018.07.17.03.48.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 03:48:53 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 11:48:42 +0100
Message-Id: <20180717104842.10111-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Nicola Lunghi <nicola.lunghi@jci.com>
Subject: [meta-oe][poky][PATCH] systemd: fix build systemd-resolved with musl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2018 10:48:53 -0000

From: Nicola Lunghi <nicola.lunghi@jci.com>

systemd-resolved build was broken with musl because musl was
missing the nss.h header and some symbol (NETDB_INTERNAL and
NETDB_SUCCESS)

Add a patch to define those symbol to fix the build

Signed-off-by: Nicola Lunghi <nicola.lunghi@jci.com>
---
 ...systemd-resolved-fix-build-with-musl.patch | 67 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_237.bb      |  2 +-
 2 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0037-systemd-resolved-fix-build-with-musl.patch

diff --git a/meta/recipes-core/systemd/systemd/0037-systemd-resolved-fix-build-with-musl.patch b/meta/recipes-core/systemd/systemd/0037-systemd-resolved-fix-build-with-musl.patch
new file mode 100644
index 0000000000..dc64214e18
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0037-systemd-resolved-fix-build-with-musl.patch
@@ -0,0 +1,67 @@
+From 7ebcea5054d11f28c9a6601c6613bcef741df576 Mon Sep 17 00:00:00 2001
+From: Nicola Lunghi <nicola.lunghi@jci.com>
+Date: Mon, 16 Jul 2018 17:32:55 +0000
+Subject: [PATCH] systemd-resolve: fix build with musl
+
+musl doesn't provide nss.h and the symbol
+NETDB_INTERNAL and NETDB_SUCCESS.
+define those symbol to permit compilation of systemd-resolved
+
+Signed-off-by: Nicola Lunghi <nicola.lunghi@jci.com>
+---
+ src/basic/nss-util.h          | 19 +++++++++++++++++++
+ src/nss-resolve/nss-resolve.c |  7 ++++++-
+ 2 files changed, 25 insertions(+), 1 deletion(-)
+
+diff --git a/src/basic/nss-util.h b/src/basic/nss-util.h
+index 4fc676395..111834d62 100644
+--- a/src/basic/nss-util.h
++++ b/src/basic/nss-util.h
+@@ -22,7 +22,26 @@
+ 
+ #include <grp.h>
+ #include <netdb.h>
++#ifdef __GLIBC__
+ #include <nss.h>
++#else
++#include <stdint.h>
++enum nss_status {
++    NSS_STATUS_TRYAGAIN = -2,
++    NSS_STATUS_UNAVAIL,
++    NSS_STATUS_NOTFOUND,
++    NSS_STATUS_SUCCESS,
++    NSS_STATUS_RETURN
++};
++/* Data structure used for the 'gethostbyname4_r' function.  */
++struct gaih_addrtuple {
++    struct gaih_addrtuple *next;
++    char *name;
++    int family;
++    uint32_t addr[4];
++    uint32_t scopeid;
++};
++#endif
+ #include <pwd.h>
+ #include <resolv.h>
+ 
+diff --git a/src/nss-resolve/nss-resolve.c b/src/nss-resolve/nss-resolve.c
+index fe6ce4cbb..67ce1d9ea 100644
+--- a/src/nss-resolve/nss-resolve.c
++++ b/src/nss-resolve/nss-resolve.c
+@@ -20,7 +20,12 @@
+ 
+ #include <errno.h>
+ #include <netdb.h>
+-#include <nss.h>
++#ifndef NETDB_INTERNAL
++#define NETDB_INTERNAL (-1)
++#endif
++#ifndef NETDB_SUCCESS
++#define NETDB_SUCCESS (0)
++#endif
+ #include <stdlib.h>
+ #include <string.h>
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index bd6dcef637..0a832733fc 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -55,6 +55,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0034-Fix-format-truncation-compile-failure-by-typecasting.patch \
            file://0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
            file://0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch \
+           file://0037-systemd-resolved-fix-build-with-musl.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
@@ -101,7 +102,6 @@ PACKAGECONFIG_remove_libc-musl = " \
     localed \
     myhostname \
     nss \
-    resolved \
     selinux \
     smack \
     sysusers \
-- 
2.17.1


