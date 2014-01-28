Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id AA8A86E7EF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 14:26:14 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so273784ead.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 06:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=smHW5N4IIm/pRUma6cu1feiae4ZgtruFBGxGwWSahKw=;
	b=r+LZkSXt/9q8e5fkMEWVZisQMma4LztyBJiIAcfjkLRcpaYHnmBPCFxxhwO8FpnZGj
	leGknCyWtjGcw2sXyZmE4aDb2QOwJjaj2ifQFm2ekhlDzRJ4JuwaJxwv1uYM/Sb0Vfjk
	dA7ytadHkLVZ5USzgfUxwA16HK5LR0FLjnF0UIsLfDOmaAGYDp5pJY3kPUxmNn8XY90+
	aXzknkF3xa5y8H6EvYBGwee99M7neP+E+jmX5falDaIHgS/JTxmQ7W1iEp8WrPgJim4j
	m86L96TUh2DMAmlVgZGTxzisDpSeYAgG6oV/7o9WP8fJJ5otBvbQu4qaYXC2smZshKGh
	fpCw==
X-Received: by 10.14.172.69 with SMTP id s45mr2158949eel.9.1390919174988;
	Tue, 28 Jan 2014 06:26:14 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id u7sm56282880eep.11.2014.01.28.06.26.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jan 2014 06:26:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2014 15:26:10 +0100
Message-Id: <89c5cb4ca5699c59c4b71298dff154e3561dc609.1390919033.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1390919033.git.Martin.Jansa@gmail.com>
References: <cover.1390919033.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390919033.git.Martin.Jansa@gmail.com>
References: <cover.1390919033.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 1/3] package.bbclass: Don't search for providers of PRIVATE_LIBS
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
X-List-Received-Date: Tue, 28 Jan 2014 14:26:15 -0000

* split PRIVATE_LIBS and don't use find(), so that libfoo cannot be
  found in PRIVATE_LIBS = "libfoobar"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 70f9aaa..ed88daf 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1402,7 +1402,7 @@ python package_do_shlibs() {
                 this_soname = m.group(1)
                 if not this_soname in sonames:
                     # if library is private (only used by package) then do not build shlib for it
-                    if not private_libs or -1 == private_libs.find(this_soname):
+                    if not private_libs or this_soname not in private_libs:
                         sonames.append(this_soname)
                 if libdir_re.match(os.path.dirname(file)):
                     needs_ldconfig = True
@@ -1486,7 +1486,8 @@ python package_do_shlibs() {
     read_shlib_providers()
 
     for pkg in packages.split():
-        private_libs = d.getVar('PRIVATE_LIBS_' + pkg, True) or d.getVar('PRIVATE_LIBS', True)
+        private_libs = d.getVar('PRIVATE_LIBS_' + pkg, True) or d.getVar('PRIVATE_LIBS', True) or ""
+        private_libs = private_libs.split()
         needs_ldconfig = False
         bb.debug(2, "calculating shlib provides for %s" % pkg)
 
@@ -1556,6 +1557,14 @@ python package_do_shlibs() {
 
         deps = list()
         for n in needed[pkg]:
+            # if n is in private libraries, don't try to search provider for it
+            # this could cause problem in case some abc.bb provides private
+            # /opt/abc/lib/libfoo.so.1 and contains /usr/bin/abc depending on system library libfoo.so.1
+            # but skipping it is still better alternative than providing own
+            # version and then adding runtime dependency for the same system library
+            if private_libs and n in private_libs:
+                bb.debug(2, '%s: Dependency %s covered by PRIVATE_LIBS' % (pkg, n))
+                continue
             if n in shlib_provider.keys():
                 (dep_pkg, ver_needed) = shlib_provider[n]
 
-- 
1.8.5.3


