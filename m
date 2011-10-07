Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCE28-0006RZ-Tm
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:16:29 +0200
Received: by ywf7 with SMTP id 7so3899836ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=OLu9ycJUkvpeW6U/pJrrAYGGtJT6aSTOFpdzF9DQD0k=;
	b=er3rmStHfHjSJghFkePCfYj7OdYDX4+CM0LNSlAPrwivqQyYR08iryCVTB9iBCUZbo
	itNAhJnlwNSN1zegejZFGwMotM1q8w/0Cbr7ZdOErolw91UVCeyXwDAA9d9wJfAUOBXW
	xBNqdhEL9Wx6Zy+edsNtP5wbQh7vja0YsnuLI=
Received: by 10.223.15.10 with SMTP id i10mr11885987faa.17.1318007269237;
	Fri, 07 Oct 2011 10:07:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g19sm13621305fai.8.2011.10.07.10.07.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:07:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:12 +0200
Message-Id: <f4da9a32bbe31efc9d1b5f1099e45988c4c1a6be.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 17/31] xserver-xorg: drop unused files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Oct 2011 17:16:29 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/files/macro_tweak.patch           |   20 --
 .../cache-xkbcomp-output-for-fast-start-up.patch   |  360 --------------------
 .../xorg-xserver/xserver-xorg/fix_macros1.patch    |   24 --
 3 files changed, 0 insertions(+), 404 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/files/macro_tweak.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/cache-xkbcomp-output-for-fast-start-up.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_macros1.patch

diff --git a/meta/recipes-graphics/xorg-xserver/files/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/files/macro_tweak.patch
deleted file mode 100644
index c4af228..0000000
--- a/meta/recipes-graphics/xorg-xserver/files/macro_tweak.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Pending
-
-Index: xorg-server-1.5.0/xorg-server.m4
-===================================================================
---- xorg-server-1.5.0.orig/xorg-server.m4	2007-05-29 20:36:51.000000000 +0100
-+++ xorg-server-1.5.0/xorg-server.m4	2008-11-04 23:56:55.000000000 +0000
-@@ -28,9 +28,12 @@
- # Checks for the $1 define in xorg-server.h (from the sdk).  If it
- # is defined, then add $1 to $REQUIRED_MODULES.
- 
-+m4_pattern_allow(PKG_CONFIG_SYSROOT_DIR)
-+
- AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
-+	PKG_PROG_PKG_CONFIG
- 	SAVE_CFLAGS="$CFLAGS"
--	CFLAGS="$CFLAGS -I`pkg-config --variable=sdkdir xorg-server`"
-+	CFLAGS="$CFLAGS -I$PKG_CONFIG_SYSROOT_DIR`pkg-config --variable=sdkdir xorg-server`"
- 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
- #include "xorg-server.h"
- #if !defined $1
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/cache-xkbcomp-output-for-fast-start-up.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/cache-xkbcomp-output-for-fast-start-up.patch
deleted file mode 100644
index 6b1b40f..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/cache-xkbcomp-output-for-fast-start-up.patch
+++ /dev/null
@@ -1,360 +0,0 @@
-From 0f70ba9d3412b17ac4e08e33e1be3c226c06ea54 Mon Sep 17 00:00:00 2001
-From: Yan Li <yan.i.li@intel.com>
-Date: Tue, 12 May 2009 17:49:07 +0800
-Subject: [PATCH] XKB: cache xkbcomp output for fast start-up v5 for 1.6.1
-Organization: Intel
-
-xkbcomp outputs will be cached in files with hashed keymap as
-names. This saves boot time for around 1s on commodity netbooks.
-
-Upstream-Status: Pending
-
-Signed-off-by: Yan Li <yan.i.li@intel.com>
----
- configure.ac        |    6 +-
- xkb/README.compiled |    8 +-
- xkb/ddxLoad.c       |  192 +++++++++++++++++++++++++++++++++++++++++---------
- 3 files changed, 164 insertions(+), 42 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4c4c797..7a5020a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -476,9 +476,9 @@ AC_ARG_WITH(default-font-path, AS_HELP_STRING([--with-default-font-path=PATH], [
- AC_ARG_WITH(xkb-path,         AS_HELP_STRING([--with-xkb-path=PATH], [Path to XKB base dir (default: ${datadir}/X11/xkb)]),
- 				[ XKBPATH="$withval" ],
- 				[ XKBPATH="${datadir}/X11/xkb" ])
--AC_ARG_WITH(xkb-output,       AS_HELP_STRING([--with-xkb-output=PATH], [Path to XKB output dir (default: ${datadir}/X11/xkb/compiled)]),
-+AC_ARG_WITH(xkb-output,       AS_HELP_STRING([--with-xkb-output=PATH], [Path to XKB output dir (default: ${localstatedir}/cache/xkb)]),
- 				[ XKBOUTPUT="$withval" ],
--				[ XKBOUTPUT="compiled" ])
-+				[ XKBOUTPUT="${localstatedir}/cache/xkb" ])
- AC_ARG_WITH(serverconfig-path, AS_HELP_STRING([--with-serverconfig-path=PATH],
- 				   [Directory where ancillary server config files are installed (default: ${libdir}/xorg)]),
- 				[ SERVERCONFIG="$withval" ],
-@@ -1757,7 +1757,7 @@ AC_DEFINE_DIR(XKB_BIN_DIRECTORY, bindir, [Path to XKB bin dir])
- XKBOUTPUT_FIRSTCHAR=`echo $XKBOUTPUT | cut -b 1`
- 
- if [[ x$XKBOUTPUT_FIRSTCHAR != x/ ]] ; then
--   XKBOUTPUT="$XKB_BASE_DIRECTORY/$XKBOUTPUT"
-+   AC_MSG_ERROR([xkb-output must be an absolute path.])
- fi
- 
- # XKM_OUTPUT_DIR (used in code) must end in / or file names get hosed
-diff --git a/xkb/README.compiled b/xkb/README.compiled
-index 71caa2f..a4a2ae0 100644
---- a/xkb/README.compiled
-+++ b/xkb/README.compiled
-@@ -4,10 +4,10 @@ current keymap and/or any scratch keymaps used by clients.  The X server
- or some other tool might destroy or replace the files in this directory,
- so it is not a safe place to store compiled keymaps for long periods of
- time.  The default keymap for any server is usually stored in:
--     X<num>-default.xkm
--where <num> is the display number of the server in question, which makes
--it possible for several servers *on the same host* to share the same 
--directory.
-+     server-<SHA1>.xkm
-+
-+where <SHA1> is the SHA1 hash of keymap source, so that compiled
-+keymap of different keymap sources are stored in different files.
- 
- Unless the X server is modified, sharing this directory between servers on
- different hosts could cause problems.
-diff --git a/xkb/ddxLoad.c b/xkb/ddxLoad.c
-index 4d5dfb6..60a68af 100644
---- a/xkb/ddxLoad.c
-+++ b/xkb/ddxLoad.c
-@@ -32,6 +32,12 @@ THE USE OR PERFORMANCE OF THIS SOFTWARE.
- #include <xkb-config.h>
- #endif
- 
-+#ifdef HAVE_SHA1_IN_LIBMD /* Use libmd for SHA1 */
-+# include <sha1.h>
-+#else /* Use OpenSSL's libcrypto */
-+# include <stddef.h>  /* buggy openssl/sha.h wants size_t */
-+# include <openssl/sha.h>
-+#endif
- #include <stdio.h>
- #include <ctype.h>
- #define	NEED_EVENTS 1
-@@ -46,24 +52,13 @@ THE USE OR PERFORMANCE OF THIS SOFTWARE.
- #define	XKBSRV_NEED_FILE_FUNCS
- #include <xkbsrv.h>
- #include <X11/extensions/XI.h>
-+#include <errno.h>
- #include "xkb.h"
- 
- #if defined(CSRG_BASED) || defined(linux) || defined(__GNU__)
- #include <paths.h>
- #endif
- 
--	/*
--	 * If XKM_OUTPUT_DIR specifies a path without a leading slash, it is
--	 * relative to the top-level XKB configuration directory.
--	 * Making the server write to a subdirectory of that directory
--	 * requires some work in the general case (install procedure
--	 * has to create links to /var or somesuch on many machines),
--	 * so we just compile into /usr/tmp for now.
--	 */
--#ifndef XKM_OUTPUT_DIR
--#define	XKM_OUTPUT_DIR	"compiled/"
--#endif
--
- #define	PRE_ERROR_MSG "\"The XKEYBOARD keymap compiler (xkbcomp) reports:\""
- #define	ERROR_PREFIX	"\"> \""
- #define	POST_ERROR_MSG1 "\"Errors from xkbcomp are not fatal to the X server\""
-@@ -179,6 +174,45 @@ OutputDirectory(
- }
- 
- static Bool    	
-+Sha1Asc(char sha1Asc[SHA_DIGEST_LENGTH*2+1], const char * input)
-+{
-+    int i;
-+    unsigned char sha1[SHA_DIGEST_LENGTH];
-+
-+#ifdef HAVE_SHA1_IN_LIBMD /* Use libmd for SHA1 */
-+    SHA1_CTX ctx;
-+
-+    SHA1Init (&ctx);
-+    SHA1Update (&ctx, input, strlen(input));
-+    SHA1Final (sha1, &ctx);
-+#else /* Use OpenSSL's libcrypto */
-+    SHA_CTX ctx;
-+    int success;
-+
-+    success = SHA1_Init (&ctx);
-+    if (! success)
-+	return BadAlloc;
-+
-+    success = SHA1_Update (&ctx, input, strlen(input));
-+    if (! success)
-+	return BadAlloc;
-+
-+    success = SHA1_Final (sha1, &ctx);
-+    if (! success)
-+	return BadAlloc;
-+#endif
-+
-+    /* convert sha1 to sha1_asc */
-+    for(i=0; i<SHA_DIGEST_LENGTH; ++i) {
-+        sprintf(sha1Asc+i*2, "%02X", sha1[i]);
-+    }
-+
-+    return Success;
-+}
-+
-+/* call xkbcomp and compile XKB keymap, return xkm file name in
-+   nameRtrn */
-+static Bool
- XkbDDXCompileKeymapByNames(	XkbDescPtr		xkb,
- 				XkbComponentNamesPtr	names,
- 				unsigned		want,
-@@ -187,7 +221,11 @@ XkbDDXCompileKeymapByNames(	XkbDescPtr		xkb,
- 				int			nameRtrnLen)
- {
-     FILE *	out;
--    char	*buf = NULL, keymap[PATH_MAX], xkm_output_dir[PATH_MAX];
-+    char *	buf = NULL, xkmfile[PATH_MAX], xkm_output_dir[PATH_MAX];
-+    char *	tmpXkmFile = NULL;
-+    char *	canonicalXkmFileName = NULL;
-+    char	sha1Asc[SHA_DIGEST_LENGTH*2+1], xkbKeyMapBuf[100*1024];
-+    int	ret, result;
- 
-     const char	*emptystring = "";
-     const char	*xkbbasedirflag = emptystring;
-@@ -198,16 +236,70 @@ XkbDDXCompileKeymapByNames(	XkbDescPtr		xkb,
-     /* WIN32 has no popen. The input must be stored in a file which is
-        used as input for xkbcomp. xkbcomp does not read from stdin. */
-     char tmpname[PATH_MAX];
--    const char *xkmfile = tmpname;
-+    const char *xkbfile = tmpname;
- #else
--    const char *xkmfile = "-";
-+    const char *xkbfile = "-";
- #endif
- 
--    snprintf(keymap, sizeof(keymap), "server-%s", display);
-+    /* Write keymap source (xkbfile) to memory buffer `xkbKeyMapBuf',
-+       of which SHA1 is generated and used as result xkm file name  */
-+    memset(xkbKeyMapBuf, 0, sizeof(xkbKeyMapBuf));
-+    out = fmemopen(xkbKeyMapBuf, sizeof(xkbKeyMapBuf), "w");
-+    if (NULL == out) {
-+        ErrorF("[xkb] Open xkbKeyMapBuf for writing failed\n");
-+        return False;
-+    }
-+    ret = XkbWriteXKBKeymapForNames(out, names, xkb, want, need);
-+    if (fclose(out) !=0)
-+    {
-+        ErrorF("[xkb] XkbWriteXKBKeymapForNames error, perhaps xkbKeyMapBuf is too small\n");
-+        return False;
-+    }
-+#ifdef DEBUG
-+    if (xkbDebugFlags) {
-+       ErrorF("[xkb] XkbDDXCompileKeymapByNames compiling keymap:\n");
-+       fputs(xkbKeyMapBuf, stderr);
-+    }
-+#endif
-+    if (!ret) {
-+        ErrorF("[xkb] Generating XKB Keymap failed, giving up compiling keymap\n");
-+        return False;
-+    }
-+
-+    DebugF("[xkb] computing SHA1 of keymap\n");
-+    if (Success == Sha1Asc(sha1Asc, xkbKeyMapBuf)) {
-+        snprintf(xkmfile, sizeof(xkmfile), "server-%s", sha1Asc);
-+    }
-+    else {
-+        ErrorF("[xkb] Computing SHA1 of keymap failed, "
-+               "using display name instead as xkm file name\n");
-+        snprintf(xkmfile, sizeof(xkmfile), "server-%s", display);
-+    }
- 
--    XkbEnsureSafeMapName(keymap);
-+    XkbEnsureSafeMapName(xkmfile);
-     OutputDirectory(xkm_output_dir, sizeof(xkm_output_dir));
- 
-+    /* set nameRtrn, fail if it's too small */
-+    if ((strlen(xkmfile)+1 > nameRtrnLen) && nameRtrn) {
-+        ErrorF("[xkb] nameRtrn too small to hold xkmfile name\n");
-+        return False;
-+    }
-+    strncpy(nameRtrn, xkmfile, nameRtrnLen);
-+
-+    /* if the xkm file already exists, reuse it */
-+    canonicalXkmFileName = Xprintf("%s%s.xkm", xkm_output_dir, xkmfile);
-+    if (access(canonicalXkmFileName, R_OK) == 0) {
-+        /* yes, we can reuse the old xkm file */
-+        LogMessage(X_INFO, "XKB: reuse xkmfile %s\n", canonicalXkmFileName);
-+        result = True;
-+        goto _ret;
-+    }
-+    LogMessage(X_INFO, "XKB: generating xkmfile %s\n", canonicalXkmFileName);
-+
-+    /* continue to call xkbcomp to compile the keymap. to avoid race
-+       condition, we compile it to a tmpfile then rename it to
-+       xkmfile */
-+
- #ifdef WIN32
-     strcpy(tmpname, Win32TempDir());
-     strcat(tmpname, "\\xkb_XXXXXX");
-@@ -230,19 +322,30 @@ XkbDDXCompileKeymapByNames(	XkbDescPtr		xkb,
- 	}
-     }
- 
-+    if ( (tmpXkmFile = tempnam(xkm_output_dir, NULL)) == NULL ) {
-+        ErrorF("[xkb] Can't generate temp xkm file name");
-+        result = False;
-+        goto _ret;
-+    }
-+
-     buf = Xprintf("\"%s%sxkbcomp\" -w %d %s -xkm \"%s\" "
--		  "-em1 %s -emp %s -eml %s \"%s%s.xkm\"",
-+		  "-em1 %s -emp %s -eml %s \"%s\"",
- 		  xkbbindir, xkbbindirsep,
- 		  ( (xkbDebugFlags < 2) ? 1 :
- 		    ((xkbDebugFlags > 10) ? 10 : (int)xkbDebugFlags) ),
--		  xkbbasedirflag, xkmfile,
-+		  xkbbasedirflag, xkbfile,
- 		  PRE_ERROR_MSG, ERROR_PREFIX, POST_ERROR_MSG1,
--		  xkm_output_dir, keymap);
-+		  tmpXkmFile);
- 
-     if (xkbbasedirflag != emptystring) {
- 	xfree(xkbbasedirflag);
-     }
-     
-+    /* there's a potential race condition between calling tempnam()
-+       and invoking xkbcomp to write the result file (potential temp
-+       file name conflicts), but since xkbcomp is a standalone
-+       program, we have to live with this */
-+
- #ifndef WIN32
-     out= Popen(buf,"w");
- #else
-@@ -250,31 +353,43 @@ XkbDDXCompileKeymapByNames(	XkbDescPtr		xkb,
- #endif
-     
-     if (out!=NULL) {
--#ifdef DEBUG
--    if (xkbDebugFlags) {
--       ErrorF("[xkb] XkbDDXCompileKeymapByNames compiling keymap:\n");
--       XkbWriteXKBKeymapForNames(stderr,names,xkb,want,need);
-+        /* write XKBKeyMapBuf to xkbcomp */
-+        if (EOF==fputs(xkbKeyMapBuf, out))
-+        {
-+            ErrorF("[xkb] Sending keymap to xkbcomp failed\n");
-+            result = False;
-+            goto _ret;
-     }
--#endif
--	XkbWriteXKBKeymapForNames(out,names,xkb,want,need);
- #ifndef WIN32
- 	if (Pclose(out)==0)
- #else
- 	if (fclose(out)==0 && System(buf) >= 0)
- #endif
- 	{
-+        /* xkbcomp success */
-             if (xkbDebugFlags)
-                 DebugF("[xkb] xkb executes: %s\n",buf);
--	    if (nameRtrn) {
--		strncpy(nameRtrn,keymap,nameRtrnLen);
--		nameRtrn[nameRtrnLen-1]= '\0';
-+
-+            /* if canonicalXkmFileName already exists now, we simply
-+               overwrite it, this is OK */
-+            ret = rename(tmpXkmFile, canonicalXkmFileName);
-+            if (0 != ret) {
-+                ErrorF("[xkb] Can't rename %s to %s, error: %s\n",
-+                       tmpXkmFile, canonicalXkmFileName,
-+                       strerror(errno));
-+
-+                /* in case of error, don't unlink tmpXkmFile, leave it
-+                   for debugging */
-+
-+                result = False;
-+                goto _ret;
- 	    }
--            if (buf != NULL)
--                xfree (buf);
--	    return True;
-+
-+            result = True;
-+            goto _ret;
- 	}
- 	else
--	    LogMessage(X_ERROR, "Error compiling keymap (%s)\n", keymap);
-+           LogMessage(X_ERROR, "Error compiling keymap (%s)\n", xkbfile);
- #ifdef WIN32
-         /* remove the temporary file */
-         unlink(tmpname);
-@@ -289,9 +404,17 @@ XkbDDXCompileKeymapByNames(	XkbDescPtr		xkb,
-     }
-     if (nameRtrn)
- 	nameRtrn[0]= '\0';
-+    result = False;
-+
-+_ret:
-+    if (tmpXkmFile)
-+        free(tmpXkmFile);
-+    if (canonicalXkmFileName)
-+        xfree(canonicalXkmFileName);
-     if (buf != NULL)
-         xfree (buf);
--    return False;
-+
-+    return result;
- }
- 
- static FILE *
-@@ -375,7 +498,6 @@ unsigned	missing;
- 	DebugF("Loaded XKB keymap %s, defined=0x%x\n",fileName,(*xkbRtrn)->defined);
-     }
-     fclose(file);
--    (void) unlink (fileName);
-     return (need|want)&(~missing);
- }
- 
--- 
-1.5.6.5
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_macros1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_macros1.patch
deleted file mode 100644
index b2c8d58..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_macros1.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-We need to insert the sysroot path into compiler commandlines for this
-kind of variable use, otherwise we're looking into /usr/include/.
-
-RP - 26/11/09
-
-Upstream-Status: Pending
-
-Index: git/xorg-server.m4
-===================================================================
---- git.orig/xorg-server.m4	2010-02-05 10:00:55.000000000 +0000
-+++ git/xorg-server.m4	2010-02-05 10:02:12.000000000 +0000
-@@ -28,10 +28,11 @@
- # Checks for the $1 define in xorg-server.h (from the sdk).  If it
- # is defined, then add $1 to $REQUIRED_MODULES.
- 
-+m4_pattern_allow([^PKG_CONFIG_SYSROOT_DIR$])
- AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
- 	AC_REQUIRE([PKG_PROG_PKG_CONFIG])
- 	SAVE_CFLAGS="$CFLAGS"
--	CFLAGS="$CFLAGS -I`$PKG_CONFIG --variable=sdkdir xorg-server`"
-+	CFLAGS="$CFLAGS -I$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=sdkdir xorg-server`"
- 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
- #include "xorg-server.h"
- #if !defined $1
-- 
1.7.7



