Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2FC1C6E9B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 19:33:08 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id x10so15068837pdj.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 11:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=FfbwgthDlNQ+ympEBKivQoMVUOZVrf9mSQfjCh/0DKU=;
	b=R3v6jzDnl6GzRqZhHZ3rXGpLvCLWwor1gcJDjOuWPw2SSB+rEutXurqr+yWlRfZhNW
	td1T0O7zBRIggdF6JtEvLeAd8G7vaqhJmyXSZHFb5e68uXe+R99Uy+spnNiA4XrwbJsm
	VjJtTb00lVpLrMzkoBQtpsYrNolMKiMw9/+cDgEh9t/qj5zF+C5wnIUMD/+iTp9a25wB
	EUqm3JcFshOjw0jNFOKUcDUb+YFuuYC0uguP7uLGRnOdeVHwRbDa6cmYNdEoQ+JM/zBY
	i69BUlUcjSInVdFDf5gm6Tr52+FlEIdHQKXdFYRC7B9FL3WRVyEs7bLS3kJXDytnuj1V
	kHvA==
X-Received: by 10.66.158.132 with SMTP id wu4mr28496343pab.66.1392665589527;
	Mon, 17 Feb 2014 11:33:09 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	nm5sm48339985pbc.29.2014.02.17.11.33.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Feb 2014 11:33:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 11:34:17 -0800
Message-Id: <0ee08a02e0750b6184e7e8f6906c1d3b31282178.1392665521.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <74162f3b1e7a4f7da6939103dfee9bb3f16c2c39.1392665521.git.raj.khem@gmail.com>
References: <74162f3b1e7a4f7da6939103dfee9bb3f16c2c39.1392665521.git.raj.khem@gmail.com>
In-Reply-To: <cover.1392665521.git.raj.khem@gmail.com>
References: <cover.1392665521.git.raj.khem@gmail.com>
Subject: [PATCH 5/6] binutils: ld-is-gold should not affect native and crosssdk recipes
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
X-List-Received-Date: Mon, 17 Feb 2014 19:33:08 -0000

gold linker does not support all architectures, currently arm and x86
are best supported, therefore we can not enable this as a full distro
option where we need to support other architectures e.g. ppc, mips
currently, if we enable ld-is-gold distro feature conditionally then it
invalidates native and sdk version of native binutils because configure
option would change. With this patch we limit ld-is-gold feature to
imapact cross binutils and target binutils only. This means that we
can reuse the sdk and native versions across architectures.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils.inc |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 6380d54..7f084b5 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -67,10 +67,14 @@ B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
 
 EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
                 --disable-werror \
-		--enable-plugins \
-		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '', d)} \
+                --enable-plugins \
+                ${LDGOLD} \
                 ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
 
+LDGOLD_class-native = ""
+LDGOLD_class-crosssdk = ""
+LDGOLD ?= "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '', d)}"
+
 # This is necessary due to a bug in the binutils Makefiles
 # EXTRA_OEMAKE = "configure-build-libiberty all"
 
-- 
1.7.10.4


