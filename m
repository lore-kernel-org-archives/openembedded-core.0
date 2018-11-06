Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2483379456
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Nov 2018 12:24:33 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d10-v6so13266015wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Nov 2018 04:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=7QFEYDA3JtlZP3e5rfQ2C+gDAaFK1IukmkeegQxfkSI=;
	b=kLgoi7nR0zB2aW0Ff78BxxO4iI6k66wslw5VqYBjSVHngHNLwsk8yKf+ThBYPuIdR3
	BTYu1edSc7sUIz41Bt0vg1axOGBNBgEXkpJupdE9ozZleRqkLOQDuqjOUtdW8zHmVw6V
	2alkk8XA+VM17IrHeM1dA775z+g93hkczdX4ZXoI/KCfn7KemThEAXFc3IMigs3EydtC
	whrpYBF63zZ2rAsw+pBD9gZgsjpUsFhv+UkzZopgLKZnI1wgyDBusodpe2jQBlp8Kr8w
	lWBmpgLr1MvmZhP7f8Yuj6/VXJBNtFbdJwKK0LON6ocmYGT6x92a6QLsCSFQA6YNdkXB
	zaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7QFEYDA3JtlZP3e5rfQ2C+gDAaFK1IukmkeegQxfkSI=;
	b=DsfqZzXVdW1tHiCM3nGNUNvH4Xo2yZjnMxGiavfi+Eo6ZeaZ8HUmSVG7pcchf3M+BT
	aig/MKP7Dl/tZPMyIE1H32A3Gk1G9D0PbxAuxrGgvdHQmgNR5NGTn2iuXyh9yRm8KPxr
	ERp7yaVebzLfp6SYlsmBrvB5ydbjHh+dPtcWWiuDBDhNSikorzghw+wBT3BoWya7pew/
	/4vJS0TMM2idizKneYckz/nJIg9/cpcfIyO0OKxfqPw1284pu6+qcqwLPDOnE2oiEuqG
	YGFxzFIRE4WOeCegOd5t8awV7DDa4nOFPuGQV32N9266+xuu1+Zt7bG9mb5ibE8gpHyZ
	Zbsw==
X-Gm-Message-State: AGRZ1gKSW11PEN5oKBbr1lTPj5Rq8OQpwGblOq7oamLf8kt1hsYPydSu
	lSfh5EBkH3RwdQFY8Ph6xjYIcSuH9PI=
X-Google-Smtp-Source: AJdET5elgfPnwIF1A4m1ZE+7bg2BLkF8TReLLy3Ov4vzsGxQRwHlC57ju3AAqYsnWH0+dPRZ9U+iDA==
X-Received: by 2002:a5d:4306:: with SMTP id
	h6-v6mr24623848wrq.189.1541507073529; 
	Tue, 06 Nov 2018 04:24:33 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f67-v6sm1601114wme.22.2018.11.06.04.24.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Nov 2018 04:24:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Nov 2018 12:24:29 +0000
Message-Id: <20181106122429.24563-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] pseudo: fix link with new sqlite3
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
X-List-Received-Date: Tue, 06 Nov 2018 12:24:33 -0000

If sqlite3 is built with FTS5 it uses log() from libm, but that linkage is lost
if we manually statically link so explicitly link to libm.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/pseudo/files/libm.patch | 33 +++++++++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/libm.patch

diff --git a/meta/recipes-devtools/pseudo/files/libm.patch b/meta/recipes-devtools/pseudo/files/libm.patch
new file mode 100644
index 00000000000..1a82979313d
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/libm.patch
@@ -0,0 +1,33 @@
+If sqlite3 is built with FTS5 enabled then it links to libm.so for log(), but if
+we statically link to libsqlite3.a then this linkage is lost.
+
+Work around this by always linking to libm.so.
+
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 4633a8750f0966621d258548fba82bc6aa5aa997 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 6 Nov 2018 12:13:17 +0000
+Subject: [PATCH] Makefile: sqlite can need libm
+
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index ad6541b..28b5ecb 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -73,7 +73,7 @@ WRAPOBJS=pseudo_wrappers.o
+ 
+ # needed for anything that links with pseduo_client.o, pretty much
+ CLIENT_LDFLAGS=-ldl -lpthread
+-DB_LDFLAGS=@SQLITE_LDARG@ -lpthread
++DB_LDFLAGS=@SQLITE_LDARG@ -lpthread -lm
+ 
+ PSEUDO=$(BIN)/pseudo
+ PSEUDODB=$(BIN)/pseudodb
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 79e0b6bd21a..c9a4ecd2e23 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,6 +2,7 @@ require pseudo.inc
 
 SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://0001-configure-Prune-PIE-flags.patch \
+           file://libm.patch \
            file://fallback-passwd \
            file://fallback-group \
            file://moreretries.patch \
-- 
2.11.0


