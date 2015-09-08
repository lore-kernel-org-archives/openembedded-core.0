Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0CDC276E2E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 23:08:09 +0000 (UTC)
Received: by qgt47 with SMTP id 47so96485616qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 16:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Q2Td4JVBF4I6ayigaTQjDAum/B4GWFUi+z8qGsy7dZY=;
	b=asCiN+BK7R6e1UW6u8Rd0KREIv4FFRKgBvvi7eT/dlly/KTUthcT1szK8Ks8g0lroP
	RmBg5BnvpU8pz2zwA2RB21L1jsxCZUsJbx9I7StN27V8ghCNICO3G9y99VHbrSt3UpEJ
	Ne0F/qU3F9wHexLTDDkOLLfJlUzrtmOuV/M5Adz9VICNb6SC5uWqgiWUgKxYlXdMIbmY
	Z/jmOwQSpUvKK/0gccSmRo2ps+GyZSDS3nfKTj0qJ9yosvyXeoR+RNevlazOxoAVnZgp
	j38clkUsABf97zwGp+MSvSUxDSIFm4CieDwr3SxkZzZ7ikWPv41XoUVPTJ7v0emXk0mw
	Fl8Q==
X-Received: by 10.140.202.19 with SMTP id x19mr41481406qha.42.1441753689397;
	Tue, 08 Sep 2015 16:08:09 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	h66sm2784934qkh.28.2015.09.08.16.08.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Sep 2015 16:08:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 23:07:52 +0000
Message-Id: <bfae9df4c5e59c0accc69b4f3166a558eb34fda8.1441753511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
References: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
In-Reply-To: <cover.1441753511.git.raj.khem@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
Subject: [PATCH 12/16] puzzles: Fix build with clang
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
X-List-Received-Date: Tue, 08 Sep 2015 23:08:09 -0000

Clang uncovered an error where abs() is used on long types, we shoud be
using labs()

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-Use-labs-instead-of-abs.patch       | 46 ++++++++++++++++++++++
 meta/recipes-sato/puzzles/puzzles_git.bb           |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-sato/puzzles/files/0001-Use-labs-instead-of-abs.patch

diff --git a/meta/recipes-sato/puzzles/files/0001-Use-labs-instead-of-abs.patch b/meta/recipes-sato/puzzles/files/0001-Use-labs-instead-of-abs.patch
new file mode 100644
index 0000000..f43d1df
--- /dev/null
+++ b/meta/recipes-sato/puzzles/files/0001-Use-labs-instead-of-abs.patch
@@ -0,0 +1,46 @@
+From 9808dc09e08937c9bffd858d3ded428225a4312a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Sep 2015 09:02:38 +0000
+Subject: [PATCH] Use labs instead of abs
+
+cluevals is array of longs so we have to use labs() instead of abs()
+since abs() returns int
+
+Fixes
+
+keen.c:1458:17: error: absolute value function 'abs' given an argument
+of type 'long' but has parameter of type 'int' which may cause
+truncation of value
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ keen.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/keen.c b/keen.c
+index a6a7238..1631992 100644
+--- a/keen.c
++++ b/keen.c
+@@ -1043,7 +1043,7 @@ done
+ 		    cluevals[j] *= grid[i];
+ 		    break;
+ 		  case C_SUB:
+-		    cluevals[j] = abs(cluevals[j] - grid[i]);
++		    cluevals[j] = labs(cluevals[j] - grid[i]);
+ 		    break;
+ 		  case C_DIV:
+ 		    {
+@@ -1455,7 +1455,7 @@ static int check_errors(const game_state *state, long *errors)
+ 		cluevals[j] *= state->grid[i];
+ 		break;
+ 	      case C_SUB:
+-		cluevals[j] = abs(cluevals[j] - state->grid[i]);
++		cluevals[j] = labs(cluevals[j] - state->grid[i]);
+ 		break;
+ 	      case C_DIV:
+ 		{
+-- 
+2.5.1
+
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 11e9225..95826c1 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=33bcd4bce8f3c197f2aefbdbd2d299bc"
 
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://fix-compiling-failure-with-option-g-O.patch \
+           file://0001-Use-labs-instead-of-abs.patch \
 "
 SRCREV = "c296301a06ce49b87c954c9d15452521dfeddf1a"
 PE = "1"
-- 
2.5.1


