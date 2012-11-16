Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ive.found@gmail.com>) id 1TZQth-0001Em-SJ
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 19:44:13 +0100
Received: by mail-lb0-f175.google.com with SMTP id j7so2244261lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 10:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ff5hUduWnXTPLbEVUmgjJYWIwIH26wHfjGT6Tc5aZc8=;
	b=I0eGykPOD1i0H0fkp9qNOQ0hXgdBzg25cDcb09Zsp9L4Vw45iROgXVpv6S9bHW+tgz
	FlSIAf6nW97rQEwf71DF521iJVUzDu9ODSsjR8ZAqWUP2u6d1npkwAhw3VqeFTZhKo3Q
	VVOxylziRIYW6DufSHMY0Vr2afuYqKP+bL8HYe7b2hbNBbjXhrMYbmcDvxyMVus4kNeE
	sGkjAp+clV+aZaQrBusC8jB4TStTSSeqDjBpvZgo9IW0DIHLykNDzp1THYo7Q4fiWRJ1
	mvc/skKhCp74Zocq9J9vB0qfaW/L5zw6NIJ7YiNzMWmBDZDQcMEyXMDNor5jtW0kV2fL
	LR6A==
Received: by 10.112.25.6 with SMTP id y6mr2301115lbf.17.1353090615330;
	Fri, 16 Nov 2012 10:30:15 -0800 (PST)
Received: from blackbox.local ([178.123.142.146])
	by mx.google.com with ESMTPS id sx3sm860948lab.9.2012.11.16.10.30.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Nov 2012 10:30:14 -0800 (PST)
From: Leonid Borisenko <ive.found@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Nov 2012 21:29:26 +0300
Message-Id: <1353090566-16318-3-git-send-email-ive.found@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1353090566-16318-1-git-send-email-ive.found@gmail.com>
References: <CAP9ODKo1mQFcR6+HM3A4cE6-vB5RpjyXe1eNiq+-RCKzS71DNw@mail.gmail.com>
	<1353090566-16318-1-git-send-email-ive.found@gmail.com>
Subject: [PATCH v2 2/2] package_{ipk, deb, rpm}.bbclass: support additional user-defined metadata
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
X-List-Received-Date: Fri, 16 Nov 2012 18:44:14 -0000

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
---
 meta/classes/package_deb.bbclass |    5 +++++
 meta/classes/package_ipk.bbclass |    5 +++++
 meta/classes/package_rpm.bbclass |    7 +++++++
 3 files changed, 17 insertions(+)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index d273cb0..d59a93d 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -332,6 +332,11 @@ python do_package_deb () {
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
index 4bf1b10..47f5091 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -370,6 +370,11 @@ python do_package_ipk () {
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
index 1ff92ce..6545701 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -720,6 +720,7 @@ python write_specfile () {
     srcmaintainer  = d.getVar('MAINTAINER', True)
     srchomepage    = d.getVar('HOMEPAGE', True)
     srcdescription = d.getVar('DESCRIPTION', True) or "."
+    srccustomtagschunk = get_package_additional_metadata("rpm", d)
 
     srcdepends     = strip_multilib_deps(d.getVar('DEPENDS', True), d)
     srcrdepends    = []
@@ -773,6 +774,7 @@ python write_specfile () {
         splitlicense = (localdata.getVar('LICENSE', True) or "")
         splitsection = (localdata.getVar('SECTION', True) or "")
         splitdescription = (localdata.getVar('DESCRIPTION', True) or ".")
+        splitcustomtagschunk = get_package_additional_metadata("rpm", localdata)
 
         translate_vers('RDEPENDS', localdata)
         translate_vers('RRECOMMENDS', localdata)
@@ -837,6 +839,9 @@ python write_specfile () {
             spec_preamble_bottom.append('License: %s' % splitlicense)
         spec_preamble_bottom.append('Group: %s' % splitsection)
 
+        if srccustomtagschunk != splitcustomtagschunk:
+            spec_preamble_bottom.append(splitcustomtagschunk)
+
         # Replaces == Obsoletes && Provides
         robsoletes = bb.utils.explode_dep_versions2(splitrobsoletes or "")
         rprovides = bb.utils.explode_dep_versions2(splitrprovides or "")
@@ -927,6 +932,8 @@ python write_specfile () {
     spec_preamble_top.append('Group: %s' % srcsection)
     spec_preamble_top.append('Packager: %s' % srcmaintainer)
     spec_preamble_top.append('URL: %s' % srchomepage)
+    if srccustomtagschunk:
+        spec_preamble_top.append(srccustomtagschunk)
     tail_source(d)
 
     # Replaces == Obsoletes && Provides
-- 
1.7.10.4



