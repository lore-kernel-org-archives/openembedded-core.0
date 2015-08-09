Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 090D576740
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Aug 2015 22:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t79MAR21004206 for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Aug 2015 23:10:27 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gn4Wnsyrd9F7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Aug 2015 23:10:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t79MA90j004203
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Aug 2015 23:10:22 +0100
Message-ID: <1439158208.30467.140.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 09 Aug 2015 15:10:08 -0700
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] libpam: Fix patch broken during upgrade
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
X-List-Received-Date: Sun, 09 Aug 2015 22:10:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

"0x200" became "0200" during the upgrade to libpam 1.2.1 in:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=88dd997d9941b63ae9eead6690ecf2b785c0740c
and this broke the IMAGE_FEATURES like debug-tweaks.

I've converted all the values to octal here to match the original
header file convention and make it clearer.

[YOCTO #8033]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch b/meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch
index 423267f..3241e82 100644
--- a/meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch
+++ b/meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch
@@ -214,7 +214,7 @@ index 3729ce0..43cdbea 100644
  /* UNIX__PRELIM */         {NULL,              _ALL_ON_^(0600),         0200, 0},
  /* UNIX__UPDATE */         {NULL,              _ALL_ON_^(0600),         0400, 0},
 -/* UNIX__NONULL */         {NULL,              _ALL_ON_,               01000, 0},
-+/* UNIX__NONULL */         {NULL,              _ALL_ON_^(0x10000000),   0200, 0},
++/* UNIX__NONULL */         {NULL,              _ALL_ON_^(02000000000),   01000, 0},
  /* UNIX__QUIET */          {NULL,              _ALL_ON_,               02000, 0},
  /* UNIX_USE_AUTHTOK */     {"use_authtok",     _ALL_ON_,               04000, 0},
  /* UNIX_SHADOW */          {"shadow",          _ALL_ON_,              010000, 0},
@@ -222,7 +222,7 @@ index 3729ce0..43cdbea 100644
  /* UNIX_MIN_PASS_LEN */    {"minlen=",		_ALL_ON_,         0400000000, 0},
  /* UNIX_QUIET */           {"quiet",           _ALL_ON_,         01000000000, 0},
  /* UNIX_DES */             {"des",             _ALL_ON_^(0260420000),      0, 1},
-+/* UNIX_NULLOK_SECURE */   {"nullok_secure",   _ALL_ON_^(0x200),  0x10000000, 0},
++/* UNIX_NULLOK_SECURE */   {"nullok_secure",   _ALL_ON_^(01000),  02000000000, 0},
  };
  
  #define UNIX_DEFAULTS  (unix_args[UNIX__NONULL].flag)



