Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id DB4BB6E7E0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 14:02:07 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so1122373eae.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 06:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=JPJHKeFQ9CCCkrEFq7hFmLzk2bNL4h7wDJD1VMGvPHU=;
	b=hs8co0dP+8Or081l/YC06Au34f72maRzNAnuE9yGd5Tc8TVHdSiCQN4Tn3NYdT8hIR
	oqcNWlxksIhi5mHyE9WQtDP4Rl+DxU3yKxkoO784hI/njyxjGr1eFmCAI09Qr5wW7WRI
	APbv0P7jt5LcvXA0sHTUzI5YG1YTvq107kwR3qbWtnJqB+yTDWXEdHnDGmIVnk/AbYBw
	4oesp4hikXRYYtq6DPCh+wz6CGJ4j19u/ToXDLBmyC+fhiIf/5AxCHuBj2wNOkIQnEYj
	+dW79Ujyq8jAZYKlpvB6n8TXen11objA+pQYCUKX9KKRhDwbT/C4r7qBXPKj97wF46Ga
	EGmw==
X-Received: by 10.14.182.199 with SMTP id o47mr8075383eem.7.1390053728519;
	Sat, 18 Jan 2014 06:02:08 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o47sm35522654eem.21.2014.01.18.06.02.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 06:02:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2014 15:02:09 +0100
Message-Id: <9f12e31c82307d4ec87b6c1069c0375dbb57c559.1390052636.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1390052636.git.Martin.Jansa@gmail.com>
References: <cover.1390052636.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390052636.git.Martin.Jansa@gmail.com>
References: <cover.1390052636.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/5] package.bbclass: Don't search for prividers of PRIVATE_LIBS
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
X-List-Received-Date: Sat, 18 Jan 2014 14:02:08 -0000

* split PRIVATE_LIBS and don't use find(), so that libfoo cannot be
  found in PRIVATE_LIBS = "libfoobar"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index fe25a6b..7820955 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1409,7 +1409,7 @@ python package_do_shlibs() {
                 if not this_soname in sonames:
                     if shlibs_search_dirs_re.match(file):
                         # if library is private (only used by package) then do not build shlib for it
-                        if not private_libs or -1 == private_libs.find(this_soname):
+                        if not private_libs or this_soname not in private_libs:
                             sonames.append(this_soname)
                     else:
                         bb.debug(2, "ignoring soname %s from %s, because path doesn't match %s" % (this_soname, file, shlibs_search_dirs_re_txt))
@@ -1495,7 +1495,8 @@ python package_do_shlibs() {
     read_shlib_providers()
 
     for pkg in packages.split():
-        private_libs = d.getVar('PRIVATE_LIBS_' + pkg, True) or d.getVar('PRIVATE_LIBS', True)
+        private_libs = d.getVar('PRIVATE_LIBS_' + pkg, True) or d.getVar('PRIVATE_LIBS', True) or ""
+        private_libs = private_libs.split()
         needs_ldconfig = False
         bb.debug(2, "calculating shlib provides for %s" % pkg)
 
@@ -1566,6 +1567,14 @@ python package_do_shlibs() {
 
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
1.8.5.2


