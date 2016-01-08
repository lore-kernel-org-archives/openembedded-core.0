Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id B2A6976BD7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:45 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id p186so118757253qke.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=rGCqPg+Rp76kQsia0bIMSO83K4ZIeYA/i41tsRi74wY=;
	b=Jb2JoNkDrY7sSLojUfKOv04/7WsCnipBzPZCdut/aRKOUnSpBbb2/RBpZ175BAv8nT
	QY0X7P4akl00f+FKVkMtjkJjVFdrSjutHUflRYWCcwGo9eRXwt8tA/eEBfcbfVAj0m14
	cZMvrrTn32eg1vaAK/64W+XTlNVuhA9d8zHu6WWz3m2FR2gkMZxywIP455RjT8Hu/Ta7
	9Q3EHMLnSpaey3lyiaya4Gz0eyOsL5lb5GXi6e1IEhZxaEhzIn67p1KFfWJBOeD9PI60
	5qXLstREuBsG4q+cbw2JBvn1+896Og6Ap9A+dsKoT7FbTVrleRyMFMYPa7tz2WlVccX5
	DSFw==
X-Received: by 10.55.51.203 with SMTP id z194mr144581485qkz.21.1452248386584; 
	Fri, 08 Jan 2016 02:19:46 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:57 +0000
Message-Id: <4ca0017fb4c828edd4fcebbd8e7ed0dc72916201.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 29/53] puzzles: Zero'ise structs before use
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:46 -0000

Fixes build failures with musl where gcc5 flags it used before
initialized.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...mpiler-errors-about-uninitialized-use-of-.patch | 32 ++++++++++++++++++++++
 meta/recipes-sato/puzzles/puzzles_git.bb           |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-sato/puzzles/files/0001-rect-Fix-compiler-errors-about-uninitialized-use-of-.patch

diff --git a/meta/recipes-sato/puzzles/files/0001-rect-Fix-compiler-errors-about-uninitialized-use-of-.patch b/meta/recipes-sato/puzzles/files/0001-rect-Fix-compiler-errors-about-uninitialized-use-of-.patch
new file mode 100644
index 0000000..0b971c4
--- /dev/null
+++ b/meta/recipes-sato/puzzles/files/0001-rect-Fix-compiler-errors-about-uninitialized-use-of-.patch
@@ -0,0 +1,32 @@
+From 78d6d1706c21ad467520075ff7a8bf15cfbd68b3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Dec 2015 22:13:16 +0000
+Subject: [PATCH] rect: Fix compiler errors about uninitialized use of
+ variables
+
+error: 'r2.x' may be used uninitialized in this function
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ rect.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/rect.c b/rect.c
+index 55667c0..fa3a786 100644
+--- a/rect.c
++++ b/rect.c
+@@ -1317,7 +1317,8 @@ static char *new_game_desc(const game_params *params_in, random_state *rs,
+                     if (ndirs > 0) {
+                         int which, dir;
+                         struct rect r1, r2;
+-
++                        memset(&r1, 0, sizeof(struct rect));
++                        memset(&r2, 0, sizeof(struct rect));
+                         which = random_upto(rs, ndirs);
+                         dir = dirs[which];
+ 
+-- 
+2.6.4
+
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 1e3bac7..9c8170c 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=33bcd4bce8f3c197f2aefbdbd2d299bc"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://fix-compiling-failure-with-option-g-O.patch \
            file://0001-Use-labs-instead-of-abs.patch \
+           file://0001-rect-Fix-compiler-errors-about-uninitialized-use-of-.patch \
 "
 SRCREV = "346584bf6e38232be8773c24fd7dedcbd7b3d9ed"
 PE = "1"
-- 
2.7.0


