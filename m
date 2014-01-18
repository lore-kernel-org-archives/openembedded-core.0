Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0536DC93
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 14:01:24 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e53so2567922eek.25
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 06:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=izuUjQg3197QdwcHgWXoikjJ0OPuZjnCEqW037vzpVY=;
	b=m6PyD6OqAKpYEu6HtQpRDa0+kVtGTzOH6g539ToyiO4566cuq0n00fgJv63qb4C6gF
	1yfxmrPYOkfuhQZw+pPKOcnVBv8XOZ7rD43bEawbJlxZJUPpwhurbrqR/DC44bdj3m7W
	goe8UZ9MXoOLHpifz3C8XjmcXTd2xJ40VXNIr7uIStT24cBOuE2bShXWYbB/mWJeeO9r
	mb1cqAi9j04SI4Z7l4LoHPUvp1/9hcRQoL0TWErVdviB9WiNV2SSjFbylmuFd6zXJI2M
	9MAuCAK8zI9nM/6UHb1L6zyaSjkqpdOjrLXv+1gkBW6z0Q4lzvfRUFUeZxkFhgDe5ZbQ
	mQYQ==
X-Received: by 10.15.98.196 with SMTP id bj44mr1914867eeb.75.1390053684574;
	Sat, 18 Jan 2014 06:01:24 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	j46sm35498577eew.18.2014.01.18.06.01.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 06:01:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2014 15:01:44 +0100
Message-Id: <f602cd87ea3835fa46465e207c8c86745d4cf662.1390052658.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1390052658.git.Martin.Jansa@gmail.com>
References: <cover.1390052658.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390052658.git.Martin.Jansa@gmail.com>
References: <cover.1390052658.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] package_{ipk, deb, rpm}.bbclass: support additional user-defined metadata
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
X-List-Received-Date: Sat, 18 Jan 2014 14:01:24 -0000

From: Leonid Borisenko <ive.found@gmail.com>

Additional metadata from user-defined variable is written into
control/spec file of binary package.

Three variables are searched for adiitional package metadata:

  * PACKAGE_ADD_METADATA_<PKGTYPE>_<PN>
  * PACKAGE_ADD_METADATA_<PKGTYPE>
  * PACKAGE_ADD_METADATA

First found variable with defined value wins.

<PN> is a package name. <PKGTYPE> is a distinct name of specific
package type:

  * IPK for .ipk packages
  * DEB for .deb packages
  * RPM for .rpm packages

Variable can contain multiple [one-line] metadata fields separated by
literal sequence '\n'. Separator can be redefined through variable flag
'separator'. In package control/spec file separator is replaced by
newline character.

Signed-off-by: Leonid Borisenko <ive.found@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package_deb.bbclass | 5 +++++
 meta/classes/package_ipk.bbclass | 5 +++++
 meta/classes/package_rpm.bbclass | 7 +++++++
 3 files changed, 17 insertions(+)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 82ff432..5d316aa 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -318,6 +318,11 @@ python do_package_deb () {
             raise bb.build.FuncFailed("Missing field for deb generation: %s" % value)
         # more fields
 
+        custom_fields_chunk = get_package_additional_metadata("deb", localdata)
+        if custom_fields_chunk is not None:
+            ctrlfile.write(unicode(custom_fields_chunk))
+            ctrlfile.write("\n")
+
         mapping_rename_hook(localdata)
 
         def debian_cmp_remap(var):
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index e7b2755..2d8e459 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -331,6 +331,11 @@ python do_package_ipk () {
             raise bb.build.FuncFailed("Missing field for ipk generation: %s" % value)
         # more fields
 
+        custom_fields_chunk = get_package_additional_metadata("ipk", localdata)
+        if custom_fields_chunk is not None:
+            ctrlfile.write(custom_fields_chunk)
+            ctrlfile.write("\n")
+
         mapping_rename_hook(localdata)
 
         def debian_cmp_remap(var):
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index acbb18d..2d193b7 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -737,6 +737,7 @@ python write_specfile () {
     srcmaintainer  = d.getVar('MAINTAINER', True)
     srchomepage    = d.getVar('HOMEPAGE', True)
     srcdescription = d.getVar('DESCRIPTION', True) or "."
+    srccustomtagschunk = get_package_additional_metadata("rpm", d)
 
     srcdepends     = strip_multilib_deps(d.getVar('DEPENDS', True), d)
     srcrdepends    = []
@@ -790,6 +791,7 @@ python write_specfile () {
         splitlicense = (localdata.getVar('LICENSE', True) or "")
         splitsection = (localdata.getVar('SECTION', True) or "")
         splitdescription = (localdata.getVar('DESCRIPTION', True) or ".")
+        splitcustomtagschunk = get_package_additional_metadata("rpm", localdata)
 
         translate_vers('RDEPENDS', localdata)
         translate_vers('RRECOMMENDS', localdata)
@@ -863,6 +865,9 @@ python write_specfile () {
             spec_preamble_bottom.append('License: %s' % splitlicense)
         spec_preamble_bottom.append('Group: %s' % splitsection)
 
+        if srccustomtagschunk != splitcustomtagschunk:
+            spec_preamble_bottom.append(splitcustomtagschunk)
+
         # Replaces == Obsoletes && Provides
         robsoletes = bb.utils.explode_dep_versions2(splitrobsoletes or "")
         rprovides = bb.utils.explode_dep_versions2(splitrprovides or "")
@@ -965,6 +970,8 @@ python write_specfile () {
     spec_preamble_top.append('Group: %s' % srcsection)
     spec_preamble_top.append('Packager: %s' % srcmaintainer)
     spec_preamble_top.append('URL: %s' % srchomepage)
+    if srccustomtagschunk:
+        spec_preamble_top.append(srccustomtagschunk)
     tail_source(d)
 
     # Replaces == Obsoletes && Provides
-- 
1.8.5.2


