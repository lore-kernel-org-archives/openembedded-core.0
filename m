Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id D488B6E7E8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 14:02:06 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id b10so2231568eae.19
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 06:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=auE4hvxSPBT2I8HPvX6GHcthFfll4k1ettm8dACbw7U=;
	b=QrZ43mOZSxT2UmNZ5O02luVVIXXDUfPpe2RjOqQRflE7DS7vO1YF3pOU/SVMoaF57m
	z8XKu75vAdYUxXnw6nge3METtcbKIOiY9cuQYH1fD5b1bht17jEjLjN9VavOEXDPAY+z
	Sk4vf301CNVr1enT0xTBSarD59Et8ebxdRnwncADgUpvWNCsGxYgs1WV8RBkGT38lprQ
	ZcMu7gwQM00wwQgEaEgWS8J50PAkmFTYanMqIHi+Ja0VIeAK/Gfu1GvqLT82N+l/wBYb
	Zzh6fGrsdzdZiDvZ6xCezO9X84KbfQHepxx/0sA1eMW9PLIdeyW07ck5OFSdNFDpBfob
	zpmw==
X-Received: by 10.15.23.139 with SMTP id h11mr8184868eeu.25.1390053727413;
	Sat, 18 Jan 2014 06:02:07 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k41sm11545646eey.0.2014.01.18.06.02.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 06:02:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2014 15:02:08 +0100
Message-Id: <f689af01e81dd9a6387b8f424ddf55358f846024.1390052636.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1390052636.git.Martin.Jansa@gmail.com>
References: <cover.1390052636.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390052636.git.Martin.Jansa@gmail.com>
References: <cover.1390052636.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/5] package.bbclass: add SHLIBSSEARCHDIRS to define where to search for shlib providers
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
X-List-Received-Date: Sat, 18 Jan 2014 14:02:07 -0000

* when package contains some files matching "^.*\.so", but in directory
  not default linker search paths (e.g. /opt/package/bundled-lib/libfoo.so)
  don't register it as libfoo provider, because it's possible that there
  is different package providing libfoo.so in ${libdir} and that would
  be better shlib provider for other packages to depend on
* recipes providing libs intentionally in some other directory can
  define own SHLIBSSEARCHDIRS value

[YOCTO #4628]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index aa8156d..fe25a6b 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1322,6 +1322,9 @@ python package_do_filedeps() {
 SHLIBSDIRS = "${PKGDATA_DIR}/${MLPREFIX}shlibs"
 SHLIBSWORKDIR = "${PKGDESTWORK}/${MLPREFIX}shlibs"
 
+# default search path when searching for shlibs provided by package
+SHLIBSSEARCHDIRS ?= "${baselib} ${libdir}"
+
 python package_do_shlibs() {
     import re, pipes
 
@@ -1332,6 +1335,20 @@ python package_do_shlibs() {
 
     lib_re = re.compile("^.*\.so")
     libdir_re = re.compile(".*/%s$" % d.getVar('baselib', True))
+    
+    shlibs_search_dirs = d.getVar('SHLIBSSEARCHDIRS', True)
+    shlibs_search_dirs_re_txt = ""
+    for dir in shlibs_search_dirs.split(' '):
+        # strip leading and trailing slash, it's added in regexp
+        if dir.endswith("/"):
+            dir = dir[:-1]
+        if dir.startswith("/"):
+            dir = dir[1:]
+        if shlibs_search_dirs_re_txt:
+            shlibs_search_dirs_re_txt += "|"
+        shlibs_search_dirs_re_txt += "(^.*/%s/.*$)" % dir
+    shlibs_search_dirs_re = re.compile(shlibs_search_dirs_re_txt)
+    bb.debug(2, "will use following RE to search for provides sonames %s" % shlibs_search_dirs_re_txt)
 
     packages = d.getVar('PACKAGES', True)
     targetos = d.getVar('TARGET_OS', True)
@@ -1390,9 +1407,12 @@ python package_do_shlibs() {
             if m:
                 this_soname = m.group(1)
                 if not this_soname in sonames:
-                    # if library is private (only used by package) then do not build shlib for it
-                    if not private_libs or -1 == private_libs.find(this_soname):
-                        sonames.append(this_soname)
+                    if shlibs_search_dirs_re.match(file):
+                        # if library is private (only used by package) then do not build shlib for it
+                        if not private_libs or -1 == private_libs.find(this_soname):
+                            sonames.append(this_soname)
+                    else:
+                        bb.debug(2, "ignoring soname %s from %s, because path doesn't match %s" % (this_soname, file, shlibs_search_dirs_re_txt))
                 if libdir_re.match(os.path.dirname(file)):
                     needs_ldconfig = True
                 if snap_symlinks and (os.path.basename(file) != this_soname):
-- 
1.8.5.2


