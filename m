Received: from mail-wg0-f65.google.com ([74.125.82.65])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ive.found@gmail.com>) id 1STZ1F-0000zt-II
	for openembedded-core@lists.openembedded.org;
	Sun, 13 May 2012 15:39:29 +0200
Received: by mail-wg0-f65.google.com with SMTP id dt11so509308wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 May 2012 06:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=gqR4JXInmg+hmNcTbU8gHTie9QWTFhM8vMPAjto26q0=;
	b=dw1eYvwmgybzMno1fw4FjY+wOOPqc2HCAw5tuIC9CcHY+gJVocnehIYdJAc72XocLe
	zBMpjXSIR1HE5XW0xWF9fVutDajbxojqnoGzhV4X2ojNLPq2UBQixguw6Eb8Djx3neh8
	xuejN0aLlOF0xu4bnZArZwGUpMyQpsReXqAeRudqbA0K+xDDt4Z6OiG28DnbHLsKYjyP
	zp6rLsxB8ztMBdayLCYHG0FGcJJy6KGEr5h9yFyFXLwIx/VQq0X/FtRCeK+lm7LjPKq4
	Hx0937e697dk6OLFzRdJ678T8eCSuUzl0CEUmGJ2LUFt8CYXs/JGb05ooNnFbETkS5OC
	996w==
Received: by 10.180.24.103 with SMTP id t7mr11626830wif.16.1336915774118;
	Sun, 13 May 2012 06:29:34 -0700 (PDT)
Received: from blackbox.local ([178.123.196.33])
	by mx.google.com with ESMTPS id b3sm27447282wib.4.2012.05.13.06.29.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 13 May 2012 06:29:33 -0700 (PDT)
From: Leonid Borisenko <ive.found@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 May 2012 16:28:42 +0300
Message-Id: <1336915722-8155-3-git-send-email-ive.found@gmail.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1336915722-8155-1-git-send-email-ive.found@gmail.com>
References: <1336915722-8155-1-git-send-email-ive.found@gmail.com>
Subject: [PATCH 2/2] package_{ipk, deb, rpm}.bbclass: support additional user-defined metadata
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
X-List-Received-Date: Sun, 13 May 2012 13:39:29 -0000

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
index 4096fa2..7a45cec 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -330,6 +330,11 @@ python do_package_deb () {
             raise bb.build.FuncFailed("Missing field for deb generation: %s" % value)
         # more fields
 
+        custom_fields_chunk = get_package_additional_metadata("deb", localdata)
+        if custom_fields_chunk is not None:
+            ctrlfile.write(unicode(custom_fields_chunk))
+            ctrlfile.write("\n")
+
         mapping_rename_hook(localdata)
 
         rdepends = bb.utils.explode_dep_versions(localdata.getVar("RDEPENDS", True) or "")
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 73ec0ee..e3a8262 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -367,6 +367,11 @@ python do_package_ipk () {
 			raise bb.build.FuncFailed("Missing field for ipk generation: %s" % value)
 		# more fields
 
+		custom_fields_chunk = get_package_additional_metadata("ipk", localdata)
+		if custom_fields_chunk is not None:
+			ctrlfile.write(custom_fields_chunk)
+			ctrlfile.write("\n")
+
 		mapping_rename_hook(localdata)
 
 		rdepends = bb.utils.explode_dep_versions(localdata.getVar("RDEPENDS", True) or "")
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 2da7a8b..799e5aa 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -638,6 +638,7 @@ python write_specfile () {
 	srcmaintainer  = d.getVar('MAINTAINER', True)
 	srchomepage    = d.getVar('HOMEPAGE', True)
 	srcdescription = d.getVar('DESCRIPTION', True) or "."
+	srccustomtagschunk = get_package_additional_metadata("rpm", d)
 
 	srcdepends     = strip_multilib(d.getVar('DEPENDS', True), d)
 	srcrdepends    = []
@@ -691,6 +692,7 @@ python write_specfile () {
 		splitlicense = (localdata.getVar('LICENSE', True) or "")
 		splitsection = (localdata.getVar('SECTION', True) or "")
 		splitdescription = (localdata.getVar('DESCRIPTION', True) or ".")
+		splitcustomtagschunk = get_package_additional_metadata("rpm", localdata)
 
 		translate_vers('RDEPENDS', localdata)
 		translate_vers('RRECOMMENDS', localdata)
@@ -759,6 +761,9 @@ python write_specfile () {
 			spec_preamble_bottom.append('License: %s' % splitlicense)
 		spec_preamble_bottom.append('Group: %s' % splitsection)
 
+		if srccustomtagschunk != splitcustomtagschunk:
+			spec_preamble_bottom.append(splitcustomtagschunk)
+
 		# Replaces == Obsoletes && Provides
 		if splitrreplaces and splitrreplaces.strip() != "":
 			for dep in splitrreplaces.split(','):
@@ -849,6 +854,8 @@ python write_specfile () {
 	spec_preamble_top.append('Group: %s' % srcsection)
 	spec_preamble_top.append('Packager: %s' % srcmaintainer)
 	spec_preamble_top.append('URL: %s' % srchomepage)
+	if srccustomtagschunk:
+		spec_preamble_top.append(srccustomtagschunk)
 	source_list = get_tarballs(d)
 	tail_source(d,source_list,None)
 
-- 
1.7.10



