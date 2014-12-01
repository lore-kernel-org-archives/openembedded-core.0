Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 02F41723EB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 13:26:07 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id l15so24573113wiw.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Dec 2014 05:26:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cP0R4ej2e1q9ut++UJLAlP7R3m62Beqc8GjrNxHpuBs=;
	b=IZQYoxaf5I8ErXXugOuLN9lm0FP1+fbTzFrMCnxxF6UbXXKuysSeNwcS1kKlFiNl5A
	s5dxztmUSdJ0jqFCAN+1sXTWAlEqDjh/3E4/64NhU8pX2wSvIe7QcOxagAT50AHpHH0m
	E8IHwyAE8Z/00r2PNuYISGAKGvU5KxvDwns/5odmP6kAReU0bZnxr/i43YiuS0JNko/D
	vCFuuIA2fc/M6j0qeHdW/WP+V38u+0w7WuTeHjR35RtihhNmF9ix38olfF3UUAxSjPxU
	GeYYCsdVAq6fr9mXMLknr7tR6TFO2Cvd6gG/h89bCgj1XNuuwsgsEPCh8rWQUEkFX6tg
	Uwzg==
X-Gm-Message-State: ALoCoQkzAbhENrKFw3EPuIQlcPeRKvSbNx1vYq6GcH13ivb+eVTy5SBLE1O7TKWEbwUWgnk2BIq5
X-Received: by 10.180.85.34 with SMTP id e2mr80656907wiz.0.1417440368139;
	Mon, 01 Dec 2014 05:26:08 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id n8sm27603462wjx.0.2014.12.01.05.26.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Dec 2014 05:26:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Dec 2014 13:25:44 +0000
Message-Id: <1417440344-9557-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] gdb: disable Guile
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
X-List-Received-Date: Mon, 01 Dec 2014 13:26:14 -0000

GDB 7.8 added Guile support, and it will auto-detect if Guile is present (which
is non-deterministic, so bad), and if it's present will fail to find the guild
binary as it doesn't consider the sysroot.

For now disable Guile support in GDB, if there is a need to have it enabled in
the future then GDB/Guile can be fixed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 599b405..a902f9a 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -38,7 +38,7 @@ EXPAT = "--with-expat --with-libexpat-prefix=${STAGING_DIR_HOST}"
 
 EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x --disable-werror \
                 --with-curses --disable-multilib --with-system-readline --disable-sim \
-                --without-lzma \
+                --without-lzma --without-guile \
                 ${GDBPROPREFIX} ${EXPAT} \
                 ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
                 --disable-rpath \
-- 
1.7.10.4


