Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6F465733AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 04:25:04 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id b16so606537igk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 20:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=EdBVWV3qkWsLtGqllbCTDmAuCrpRvx6K4zCK50TLujE=;
	b=AXCRx8DZOjtZPGm7Hb8Nm1yj8xSbWKI3HawXNdLSjNNZ5uUTpgjJ/H9Sl3WAg5RAAu
	A5L+YmFp/Sq2vE1MLLc9OVzq4/HLw3qpxuDVw75zAC9/L8r2rr29ZaIcr2ienoaLopun
	qOAxp0VxgzWW1FXProZPwobthJXgdEEyMwE2L6taovyWKX8By1d1W0BCHszydpb8Zsvz
	03uPC6iiJEMbVgDaVeB2w+1+75hG5Tvp0zNfoIuscdnNtLIdsMZWgiP8a9anhohppJPe
	v/OeN5467xiSuRQPiQLKJ2v5iyFg9dS0GfW7NQrhnpjCWRs/+NIIC5mz50g4XsKaIyQz
	2BOA==
X-Received: by 10.107.164.221 with SMTP id d90mr11197391ioj.13.1424406305091; 
	Thu, 19 Feb 2015 20:25:05 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205]) by mx.google.com with ESMTPSA id
	f12sm15642652ioi.21.2015.02.19.20.25.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Feb 2015 20:25:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Feb 2015 04:24:36 +0000
Message-Id: <88edecf9cc4e46b4fd3dd7e95fb2de450625364a.1424405852.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e879427a035a12a0b9040ff948fe3e22618412b8.1424405852.git.raj.khem@gmail.com>
References: <e879427a035a12a0b9040ff948fe3e22618412b8.1424405852.git.raj.khem@gmail.com>
In-Reply-To: <cover.1424405852.git.raj.khem@gmail.com>
References: <cover.1424405852.git.raj.khem@gmail.com>
Subject: [PATCH 5/5] glibc: Dont offer to be parsed for non-glibc TCLIBC selection
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
X-List-Received-Date: Fri, 20 Feb 2015 04:25:04 -0000

We now can support musl along with uclibc and glibc
earlier when only alternative was uclibc this check was fine
but now we need to consider non-glibc vs glibc case instead of
uclibc vs glibc

Change-Id: Id794ce193c6557b5435002a8f9b6eb608738b696
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.21.bb | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index 1ef494b..6e54046 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -62,17 +62,13 @@ TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
 GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn_BD te_IN es_CR.ISO-8859-1"
 
 #
-# For now, we will skip building of a gcc package if it is a uclibc one
-# and our build is not a uclibc one, and we skip a glibc one if our build
-# is a uclibc build.
+# We will skip parsing glibc when system C library selection is not glibc
+# this helps in easing out parsing for non-glibc system libraries
 #
-# See the note in gcc/gcc_3.4.0.oe
-#
-
 python __anonymous () {
     import re
-    uc_os = (re.match('.*uclibc$', d.getVar('TARGET_OS', True)) != None)
-    if uc_os:
+    notglibc = (re.match('.*uclibc$', d.getVar('TARGET_OS', True)) != None) and (re.match('.*musl$', d.getVar('TARGET_OS', True)) != None)
+    if notglibc:
         raise bb.parse.SkipPackage("incompatible with target %s" %
                                    d.getVar('TARGET_OS', True))
 }
-- 
2.1.4


