Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYJpn-0000e9-BY for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 16:55:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB7FmDKw015877
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Dec 2011 15:48:13 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15436-04 for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2011 15:48:08 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB7Fm3ac015871
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Dec 2011 15:48:05 GMT
Message-ID: <1323272894.30601.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 07 Dec 2011 15:48:14 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] dpkg: Fix preinst execution
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
X-List-Received-Date: Wed, 07 Dec 2011 15:55:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Add a patch to fix exeuction of pre/post install scripts. See the patch
header for more details.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/dpkg/dpkg/preinst.patch
b/meta/recipes-devtools/dpkg/dpkg/preinst.patch
new file mode 100644
index 0000000..06d2aac
--- a/dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/preinst.patch
@@ -0,0 +1,46 @@
+Our pre/postinsts expect $D to be set when running in a sysroot and
+don't expect a chroot. This matches up our system expectations with
+what dpkg does.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+RP 2011/12/07
+
+Index: dpkg-1.15.8.7/src/help.c
+===================================================================
+--- dpkg-1.15.8.7.orig/src/help.c	2010-12-20 01:25:36.000000000 +0000
++++ dpkg-1.15.8.7/src/help.c	2011-12-07 14:51:02.783461487 +0000
+@@ -181,30 +181,9 @@
+    * FIXME: none of the stuff here will work if admindir isn't inside
+    * instdir as expected.
+    */
+-  size_t instdirl;
+-
+-  if (*instdir) {
+-    if (chroot(instdir)) ohshite(_("failed to chroot to `
%.250s'"),instdir);
+-    if (chdir("/"))
+-      ohshite(_("failed to chdir to `%.255s'"), "/");
+-  }
+-  if (f_debug & dbg_scripts) {
+-    struct varbuf args = VARBUF_INIT;
+-    const char **argv = cmd->argv;
+-
+-    while (*++argv) {
+-      varbufaddc(&args, ' ');
+-      varbufaddstr(&args, *argv);
+-    }
+-    varbufaddc(&args, '\0');
+-    debug(dbg_scripts, "fork/exec %s (%s )", cmd->filename, args.buf);
+-    varbuf_destroy(&args);
+-  }
+-  instdirl= strlen(instdir);
+-  if (!instdirl)
+-    return cmd->filename;
+-  assert(strlen(cmd->filename) >= instdirl);
+-  return cmd->filename + instdirl;
++  if (*instdir)
++    setenv("D", instdir, 1);
++  return cmd->filename;
+ }  
+ 
+ void
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
b/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
index f1a0eeb..f1030fa 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
@@ -4,10 +4,11 @@ LIC_FILES_CHKSUM =
"file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI += "file://noman.patch \
             file://check_snprintf.patch \
             file://check_version.patch \
-            file://perllibdir.patch"
+            file://perllibdir.patch \
+            file://preinst.patch"
 
 SRC_URI[md5sum] = "d1731d4147c1ea3b537a4d094519a6dc"
 SRC_URI[sha256sum] =
"1ec1376471b04717a4497e5d7a27cd545248c92116898ce0c53ced8ea94267b5"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.3"
 




