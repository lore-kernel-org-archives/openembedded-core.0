Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 27BDF7C32A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 06:25:34 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n2so4081910pgm.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 22:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yDssCePUagdNrB5iPc4mOVHOpAVx2HwDq8YX/0I4Xgw=;
	b=usgfvstp7g4vbYNGfuSTr19BC3VEdFsG6SACvSzPmUbkBhGGaXXeVDT4QkHDrvlaJD
	UIqpnEyKdLczZg2hcU7BNQDpnBNx25IGN56BGOduCJFxy506+boPqOv1K7T90oDlZhg3
	5cldsGmfDGyHRclAw6Jk+Afb85ThfL8GQkq52pzId4T1lcpPVaUq25smdV6NwhIzwznu
	5K0K/79L89UFzs8FAxV2xx0NPbcJ5XhdaBVj3qN9wq91Hjo/ZsMoS0mld5VeL3zW6uWA
	+TdiCHOOUyP183SZcaS/WyTlOQ9X4fIF+sxTKAw+AIQojlYenluS8zFchYwn2V9GGPZt
	BT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yDssCePUagdNrB5iPc4mOVHOpAVx2HwDq8YX/0I4Xgw=;
	b=EiP7H6UGU94+DiBTHRi+halvQYaJTDi9fHuXqAOXH2urGhUh1TElpJefFyAMDiCfhZ
	vHo1TjiISWd3HpDd9tirxl6KIygd/qpLyyQA4JMz0afAezTwWr3Hdht2bN0veaqJDKnM
	n9CcjeHwt/mPJw5ndIYri1Jx4PQiq/MZnzP29VqUVwrSmybHLTTWejUQeUsWlzOuq05A
	2hlZqPiI7bdcP0SkeWGpgHp2eUwuUR1YKQV/Wvn9Wl1LVtVDzlDSDdIZ3zqsiISChf7f
	9ZgZ2eskxEN0SUuejkdn3EaG4IscZqkp1o4/V+t3iiRR9Tj3LCMEbaoio168/7g1qS7D
	7TDQ==
X-Gm-Message-State: AHQUAuYbyhfBpJEqGs2Noc41Nl4LfAnjLgsW8tPAf1ZzzGrc0kGuXh3q
	GJlj3ccPpwusD+i6HMBAfh8zl+No
X-Google-Smtp-Source: AHgI3IbkUaIbf6A3iHWMnurrY/YBgMks5y8dGyu3MUhyk86Y368LBm/hXkYcIYT7Hcl9R03Vxm9erQ==
X-Received: by 2002:a62:6e07:: with SMTP id j7mr14960464pfc.135.1549520735625; 
	Wed, 06 Feb 2019 22:25:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id
	u70sm13294896pfa.176.2019.02.06.22.25.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Feb 2019 22:25:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Feb 2019 22:25:26 -0800
Message-Id: <20190207062526.33944-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] openssl10: Fix mutliple include assumptions for bn.h in opensslconf.h
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
X-List-Received-Date: Thu, 07 Feb 2019 06:25:35 -0000
Content-Transfer-Encoding: 8bit

After adding #pragma once to wrapper header ( opensslconf.h ) this
latent issue got to bite us, where it expect bn.h to be including
openssl.h to define BN_* defines, which is fragile. This patch removes
the contraints for nested includes for bn.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-BN_LLONG-breakage.patch          | 33 +++++++++++++++++++
 .../openssl/openssl10_1.0.2q.bb               |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl10/0001-Fix-BN_LLONG-breakage.patch

diff --git a/meta/recipes-connectivity/openssl/openssl10/0001-Fix-BN_LLONG-breakage.patch b/meta/recipes-connectivity/openssl/openssl10/0001-Fix-BN_LLONG-breakage.patch
new file mode 100644
index 0000000000..13d39c918c
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl10/0001-Fix-BN_LLONG-breakage.patch
@@ -0,0 +1,33 @@
+From 247b3188cde5f3347091cd54271127386d3aece0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 6 Feb 2019 22:10:33 -0800
+Subject: [PATCH] Fix BN_LLONG breakage
+
+opensslconf.h is un-defining BN_LLONG only when included from bn.h which
+is not robust at all, especially when include guards are used and
+multiple inclusions of a given header is not allowed. so lets take out
+the nesting constraint and add OPENSSL_SYS_UEFI constraint instead
+
+Upstream-Status: Inappropriate [ fixed differently with OpenSSL 1.1+ ]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ crypto/opensslconf.h.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/crypto/opensslconf.h.in b/crypto/opensslconf.h.in
+index 7a1c85d..a10c10f 100644
+--- a/crypto/opensslconf.h.in
++++ b/crypto/opensslconf.h.in
+@@ -56,7 +56,7 @@
+ #endif
+ #endif
+ 
+-#if defined(HEADER_BN_H) && !defined(CONFIG_HEADER_BN_H)
++#if !defined(OPENSSL_SYS_UEFI) && !defined(CONFIG_HEADER_BN_H)
+ #define CONFIG_HEADER_BN_H
+ #undef BN_LLONG
+ 
+-- 
+2.20.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
index 809634f6c0..88aefdea4f 100644
--- a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
+++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
@@ -40,6 +40,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-Fix-build-with-clang-using-external-assembler.patch \
            file://0001-openssl-force-soft-link-to-avoid-rare-race.patch \
            file://0001-allow-manpages-to-be-disabled.patch \
+           file://0001-Fix-BN_LLONG-breakage.patch \
            "
 
 SRC_URI_append_class-target = " \
-- 
2.20.1


