Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id EBAF065E94
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 19:39:19 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id a41so10262548yho.19
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 12:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=vrGrYFO2pbJxw1QMue5ZadEqFHKmyyN6G3WD0gWeMFY=;
	b=XEDY/6tEsuYYk7/Sto/Co0QvXY+KhsH9YcAyLWSq6/1bpvIwUBKsExLay3XyGETb4k
	L8arODkAjaE4iMaea+HsyDletGCk8R+9D8uPhtuXO6NIcDQuLF8E4ky11EC33T6LKDdG
	nJTCgXXg9trfy3CGBwHV16lzsw55m/ZaSfjWlu9Z0B4n+p0J/1AqaO7mwWHIiQyN9hUh
	fQ8BTY2Fce8MPV9ZrdOVnkqOVTNGZy6gH77fBKOF09BNv+82Fi9Oh9mqvcMHHHKw2mbk
	cl29ueWC9K3GNgebAkEtyZ7etqOPVsM3VKeWhY/btp/YSamgbw5P/2yI+UGuh5nCfySp
	MScA==
X-Received: by 10.236.119.146 with SMTP id n18mr28597589yhh.23.1408909160871; 
	Sun, 24 Aug 2014 12:39:20 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id o43sm2937087yha.42.2014.08.24.12.39.19
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 24 Aug 2014 12:39:20 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Aug 2014 16:39:15 -0300
Message-Id: <1408909155-29559-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] libxml2: Explicitly enable zlib support
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
X-List-Received-Date: Sun, 24 Aug 2014 19:39:23 -0000

The zlib support is a must if you are using RPM backend. So this
explicitly enable it and adds a comment in the recipe to avoid its
removal by mistake.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/libxml/libxml2.inc |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 2dffc5a..24ea66a 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -39,10 +39,11 @@ do_configure_prepend_class-nativesdk () {
 	export PYTHON_SITE_PACKAGES="${PYTHON_SITEPACKAGES_DIR}"
 }
 
+# WARNING: zlib is require for RPM use
 EXTRA_OECONF = "--without-python --without-debug --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
-EXTRA_OECONF_class-native = "--with-python=${STAGING_BINDIR}/python --without-legacy --without-docbook --with-c14n --without-lzma"
-EXTRA_OECONF_class-nativesdk = "--with-python=${STAGING_BINDIR}/python --without-legacy --without-docbook --with-c14n --without-lzma"
-EXTRA_OECONF_linuxstdbase = "--without-python --with-debug --with-legacy --with-docbook --with-c14n --without-lzma"
+EXTRA_OECONF_class-native = "--with-python=${STAGING_BINDIR}/python --without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
+EXTRA_OECONF_class-nativesdk = "--with-python=${STAGING_BINDIR}/python --without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
+EXTRA_OECONF_linuxstdbase = "--without-python --with-debug --with-legacy --with-docbook --with-c14n --without-lzma --with-zlib"
 
 # required for pythong binding
 export HOST_SYS
-- 
1.7.10.4


