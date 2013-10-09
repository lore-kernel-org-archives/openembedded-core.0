Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 66EFB6CEF8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2013 22:12:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r99MC2A0006727; Wed, 9 Oct 2013 23:12:02 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IDC01UK2D6ik; Wed,  9 Oct 2013 23:12:02 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r99MBxA8006717
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 9 Oct 2013 23:12:00 +0100
Message-ID: <1381356715.29912.48.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 09 Oct 2013 23:11:55 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: gcc: Fix strange C++ repo issues
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
X-List-Received-Date: Wed, 09 Oct 2013 22:12:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

See the patch header for a better description of the c++ -frepo
issue this patch fixes.

[YOCTO #5133]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 4af98f8..8d50bf7 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -76,6 +76,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0044-gengtypes.patch \
 	   file://0045-gcc-4.8-PR57717-PowerPC-E500v2.patch \
 	   file://0046-libatomic-deptracking.patch \
+	   file://0047-repomembug.patch \
 	  "
 SRC_URI[md5sum] = "3b2386c114cd74185aa3754b58a79304"
 SRC_URI[sha256sum] = "545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0047-repomembug.patch b/meta/recipes-devtools/gcc/gcc-4.8/0047-repomembug.patch
new file mode 100644
index 0000000..ea253f4
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0047-repomembug.patch
@@ -0,0 +1,46 @@
+When compiling a project using -frepo, .rpo files are written alongside
+the .o file, the symbols either have O or C against them. During final linking,
+the objects can be recompiled with some of the entries tweaked/chosen by the 
+tlink.c code (visible with TLINK_VERBOSE=3).
+
+My tests showed that init_repo (cp/repo.c) was correcting calling 
+IDENTIFIER_REPO_CHOSEN against the right identifers.
+
+By the time finish_repo() or emit_repo_p() were called, the pointer returned
+by get_identifier() for the symbol marked during init_repo had changed and
+the chosen bit was no longer set. This lead to linking bugs like:
+
+collect: relinking
+collect2: error: '_ZNK6sudoku5ClearINS_8SequenceEEclERS1_' was assigned to 'board.rpo', but was not defined during recompilation, or vice versa
+
+The problem is that the garbage collection is getting called before
+finish_repo() is called and ggc_protect_identifiers is set to false 
+so the identifiers are not preserved. They are recreated but the 
+chosen bits get wiped out.
+
+The fix is to change ggc_protect_identifiers *after* the finish_repo 
+calls are made.
+
+Reproduction is tricky since you need to trigger the garbage collector at
+just the right moment.
+
+RP 2013/10/9
+
+Index: gcc-4.8.1/gcc/toplev.c
+===================================================================
+--- gcc-4.8.1.orig/gcc/toplev.c	2013-03-28 08:29:51.000000000 +0000
++++ gcc-4.8.1/gcc/toplev.c	2013-10-09 20:27:17.089228023 +0000
+@@ -551,11 +551,11 @@
+   if (flag_syntax_only || flag_wpa)
+     return;
+ 
+-  ggc_protect_identifiers = false;
+-
+   /* This must also call finalize_compilation_unit.  */
+   lang_hooks.decls.final_write_globals ();
+ 
++  ggc_protect_identifiers = false;
++
+   if (seen_error ())
+     return;
+ 


