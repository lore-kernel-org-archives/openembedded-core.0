Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 56C5F7CFA4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 06:01:30 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t7so8218080plr.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 23:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jFvxJLad/U+kbNEoQdB1fblWvpv9GfsL+7JswbmtfPw=;
	b=eLeBFvlH25W/Qx+DTebvanFZPs6999Anf3/J171LXTwc5uOTCuVMMiDzeXHJR6p2b3
	oml0hgtHci5k9UEDubiL/PUdsMLa0TufNyhRsmEdWuUmYeUsFQvbrzWglcBhjrsLWhc9
	D50UscYyJiYpZ0Q7Z32kONPqaepMP28FUphxvZE23HZr+XRZa+6TkNoyl+OEj9uCi4id
	cxpGsgwTO9mpuk6rFpUgvNXQr8Wh6w0CKcbVtnzGm3sirIPnDNlB6+vYp69H1C7Jw7Og
	QtPTDaxbwKTF3aYUJP2uxPQCMMMPL7LXAzD1OSkQUrh3+ImZA5p7XPgwW6aaFWF1DpDL
	n5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jFvxJLad/U+kbNEoQdB1fblWvpv9GfsL+7JswbmtfPw=;
	b=K7oaZ0wabin5DIjns97yIo5sJdSK9PodLoN6WStnRbi2MfNofEEMj2Nn3fFtnafd2u
	cqSzDAIyzIVXNYmphvFbIQhelOKvIC97av3tvhEmZKh9tMhGsM9b1sRmsNDo7Rlw7/Og
	Llu4lMbJgwyYmaDwf6Pk6/wMO43crPgYLySDzy2oKv1ruiJ4Kqnyjby2KW6QjH6aJz+F
	pe3Ssb0h67pt0CJ+1kb1zqTqPWEz/L5Aopg8QEW8UKz2SQyHk37FofgShSsdv2eqjVtR
	1ZLrKK8CE3rQfBbTMs98o50wXbsq4Y7NOnb62iNFKzCnrqb4zUSoCo1pBTF4XYQWIR6Z
	4xpA==
X-Gm-Message-State: APjAAAU/5TgmjWGDCS52XKVsnhv5/cnWzXpm1iq5ppLHe3lohNoe9TFm
	JhK5KNiFB0Ov3+YAkjqBpTu/iflIzFQ=
X-Google-Smtp-Source: APXvYqxWwf/jbiFCWLJDvnu+WLuqNDDLgyAe1+zYy3OynzxQ8QfhTI5jp6RCx0xiVokRpwXmb44qaQ==
X-Received: by 2002:a17:902:246:: with SMTP id
	64mr80263596plc.311.1561442490995; 
	Mon, 24 Jun 2019 23:01:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dd7c])
	by smtp.gmail.com with ESMTPSA id
	f10sm11334448pgq.73.2019.06.24.23.01.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 24 Jun 2019 23:01:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2019 23:01:21 -0700
Message-Id: <20190625060121.17379-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH v2] efibootmgr: Pass correct flags to compiler from pkg-config
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
X-List-Received-Date: Tue, 25 Jun 2019 06:01:30 -0000
Content-Transfer-Encoding: 8bit

efivar.h is in usr/include/efirvar directory so it should be
added to include search path via -I to compiler cmdline to fix

make[1]: *** No rule to make target 'efivar.h', needed by 'efibootmgr.o'.  Stop.
| make[1]: *** Waiting for unfinished jobs....

When running clang to generate dependencies -MM -MG -MF it still
parses the compile unit and complains if certain header is not found
where as gcc does not do that, hence the compile error is only seen
when compiling with clang.

FIx is use a weak default assignment for PKGS var which is used by
pkg-config to deduce compiler flags, this helps in getting right
-I flags even for dep step

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@intel.com>
---
 ...failts-Set-PKGS-to-efivar-by-default.patch | 33 +++++++++++++++++++
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb  |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-bsp/efibootmgr/efibootmgr/0001-Make.defailts-Set-PKGS-to-efivar-by-default.patch

diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr/0001-Make.defailts-Set-PKGS-to-efivar-by-default.patch b/meta/recipes-bsp/efibootmgr/efibootmgr/0001-Make.defailts-Set-PKGS-to-efivar-by-default.patch
new file mode 100644
index 0000000000..415012d64c
--- /dev/null
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr/0001-Make.defailts-Set-PKGS-to-efivar-by-default.patch
@@ -0,0 +1,33 @@
+From f6c3154810938506c13e22d16935ae4d07e911dc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 24 Jun 2019 22:27:21 -0700
+Subject: [PATCH] Make.defailts: Set PKGS to efivar by default
+
+This ensures that when make dep is run then pkg-config logic can add
+efivar related variables to cflags and ldflags
+
+Fixes
+make[1]: *** No rule to make target 'efivar.h', needed by 'efibootmgr.o'.  Stop.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Make.defaults | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Make.defaults b/Make.defaults
+index c4c0592..d75c6f4 100644
+--- a/Make.defaults
++++ b/Make.defaults
+@@ -32,7 +32,7 @@ AR	:= $(CROSS_COMPILE)gcc-ar
+ NM	:= $(CROSS_COMPILE)gcc-nm
+ RANLIB	:= $(CROSS_COMPILE)gcc-ranlib
+ 
+-PKGS	=
++PKGS	?= efivar
+ 
+ SUBDIR_CFLAGS ?=
+ clang_cflags =
+-- 
+2.22.0
+
diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
index 0e5a81e316..835c7b3b81 100644
--- a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
@@ -12,6 +12,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
            file://0001-remove-extra-decl.patch \
+           file://0001-Make.defailts-Set-PKGS-to-efivar-by-default.patch \
           "
 SRCREV = "e067160ecef8208e1944002e5d50b275733211fb"
 
-- 
2.22.0


