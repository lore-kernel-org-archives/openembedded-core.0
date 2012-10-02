Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TIvN0-0001x3-Tc
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 07:50:15 +0200
Received: by pbbro12 with SMTP id ro12so8587551pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Oct 2012 22:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=27vUJtrLmZjQ1XC9B1jFIPmHxq4YW0ZmZyJAUzCdI0M=;
	b=H2WY7dTTt5/l9XtgMjq7EJoM3p0NgNOaqkG51An2BHa3y1M8vTf3es/xkrIXEgVJWc
	0L2IAfurRInZQWzDTNeqJr5yrc1NnpQxPBlUne4v80+Aouo40wGkgTWUTJAkrF6ZUTqU
	UpJE7gU/q/6sP9vF3njP9areV7Bob/eK8kKW5bPqyhtSiAEF27sIO0mYPsgcP4o3hxak
	L9LG7+TiXaEbVcOjpgPNE8svvpgVO0aTjDqOG+awMstsP0UHYBbva9rzOM2WkQX+xVQB
	anGGXr4dtKJPlU4Nu+Y2SyDVabb03bhDSjcfLGa0vy2sVmdI3iQYJqzPtvas2MI6kkBA
	nJ1Q==
Received: by 10.68.138.229 with SMTP id qt5mr1432476pbb.122.1349156235983;
	Mon, 01 Oct 2012 22:37:15 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id sj5sm371438pbc.30.2012.10.01.22.37.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Oct 2012 22:37:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Oct 2012 22:36:55 -0700
Message-Id: <1349156215-16686-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] binutils-crossdk: Fix interp size expansion
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Oct 2012 05:50:15 -0000

Currently for sdk binutils we expand the size of .interp
section to 0x1000 assuming that its at the beginning of
the linker map but there may be program header before that
so actually we want to add 0x1000 - sizeof(.interp) section
to current location and not assign is absolutely to 0x1000

This fixes errors like

built in linker script:11 cannot move location counter backwards (from
0000000000401054 to 0000000000401000)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../binutils/binutils-crosssdk_2.22.bb             |    2 +-
 .../binutils/binutils/relocatable_sdk.patch        |   10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
index c936549..d3c25b6 100644
--- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
+++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
@@ -2,7 +2,7 @@ require binutils-cross_${PV}.bb
 
 inherit crosssdk
 
-PR = "r1"
+PR = "r2"
 
 PROVIDES = "virtual/${TARGET_PREFIX}binutils-crosssdk"
 
diff --git a/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch b/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
index 33f9e68..4a2494a 100644
--- a/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
+++ b/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
@@ -7,16 +7,16 @@ by the relocating script.
 
 Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
 
-Index: binutils-2.22/ld/scripttempl/elf.sc
+Index: git/ld/scripttempl/elf.sc
 ===================================================================
---- binutils-2.22.orig/ld/scripttempl/elf.sc
-+++ binutils-2.22/ld/scripttempl/elf.sc
-@@ -116,7 +116,7 @@ if test -n "${COMMONPAGESIZE}"; then
+--- git.orig/ld/scripttempl/elf.sc	2012-10-01 21:42:18.729294685 -0700
++++ git/ld/scripttempl/elf.sc	2012-10-01 22:26:35.149173335 -0700
+@@ -125,7 +125,7 @@
    DATA_SEGMENT_RELRO_END=". = DATA_SEGMENT_RELRO_END (${SEPARATE_GOTPLT-0}, .);"
  fi
  if test -z "${INITIAL_READONLY_SECTIONS}${CREATE_SHLIB}"; then
 -  INITIAL_READONLY_SECTIONS=".interp       ${RELOCATING-0} : { *(.interp) }"
-+  INITIAL_READONLY_SECTIONS=".interp       ${RELOCATING-0} : { *(.interp); . = 0x1000; }"
++  INITIAL_READONLY_SECTIONS=".interp       ${RELOCATING-0} : { *(.interp); . = (. & 0x1000) + 0x1000; }"
  fi
  if test -z "$PLT"; then
    IPLT=".iplt         ${RELOCATING-0} : { *(.iplt) }"
-- 
1.7.9.5



