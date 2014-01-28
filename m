Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id E6F1E6EA00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 14:26:16 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c13so267175eek.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 06:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=2BUarGMbMb8Bdecw+9xrthJjt8SavgDnHEJ5FlN4osY=;
	b=iZHwJGqPROcmyBx1bq5kSvgYPQN64cjWMc86ub6PbqtqDJAh0Pik7bF/6nnDB+BsXL
	H0ePGHx6RllUtOImevfMi3yKua16HKu1GzarIgMSoGqTsRWdE83vikm3lksxduQjxY8C
	UDODysjHu13cvTjNSeJi2L73Vkh0YCtujjhbWp0773DVt4ftuW7h2VuzB86MeTq5KwY/
	bXRwU8cDoKWgZceBbfqtlRvU4LIVgzFY5vLI4SJecq0ybBZKuIO2nV4BrLaI6XxXbY59
	4HSiUs9DFs4QQopljKBGZywE6iKMh6Gxd4n3FHAq7obEJY1Nm/C6rbsK0DzWEhfK6Wsm
	igmQ==
X-Received: by 10.15.61.7 with SMTP id h7mr2101597eex.49.1390919177649;
	Tue, 28 Jan 2014 06:26:17 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k41sm56244150eey.0.2014.01.28.06.26.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jan 2014 06:26:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2014 15:26:12 +0100
Message-Id: <7ad9402d476b3efc1f3f20a7ec5de6b71e44be68.1390919033.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1390919033.git.Martin.Jansa@gmail.com>
References: <cover.1390919033.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390919033.git.Martin.Jansa@gmail.com>
References: <cover.1390919033.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 3/3] package.bbclass: add SHLIBSSEARCHDIRS to define where to search for shlib providers
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
X-List-Received-Date: Tue, 28 Jan 2014 14:26:17 -0000

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
index 1f73ad6..f9369b3 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1333,6 +1333,9 @@ python package_do_filedeps() {
 SHLIBSDIRS = "${PKGDATA_DIR}/${MLPREFIX}shlibs"
 SHLIBSWORKDIR = "${PKGDESTWORK}/${MLPREFIX}shlibs"
 
+# default search path when searching for shlibs provided by package
+SHLIBSSEARCHDIRS ?= "${baselib} ${libdir}"
+
 python package_do_shlibs() {
     import re, pipes
 
@@ -1343,6 +1346,20 @@ python package_do_shlibs() {
 
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
@@ -1404,9 +1421,12 @@ python package_do_shlibs() {
             if m:
                 this_soname = m.group(1)
                 if not this_soname in sonames:
-                    # if library is private (only used by package) then do not build shlib for it
-                    if not private_libs or this_soname not in private_libs:
-                        sonames.append(this_soname)
+                    if shlibs_search_dirs_re.match(file):
+                        # if library is private (only used by package) then do not build shlib for it
+                        if not private_libs or this_soname not in private_libs:
+                            sonames.append(this_soname)
+                    else:
+                        bb.debug(2, "ignoring soname %s from %s, because path doesn't match %s" % (this_soname, file, shlibs_search_dirs_re_txt))
                 if libdir_re.match(os.path.dirname(file)):
                     needs_ldconfig = True
                 if snap_symlinks and (os.path.basename(file) != this_soname):
-- 
1.8.5.3


