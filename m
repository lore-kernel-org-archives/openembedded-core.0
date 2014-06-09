Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id B47596A87C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 07:19:57 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id n15so2831342lbi.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jun 2014 00:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=lEy+cplD+aivjCHpWBtI/koLqrTu5HeJtJp1rDfPf8A=;
	b=fqftLia7Dli+Tk6WSj5MlAtuEdp37+bi2tbLO5KFzYO1kLiVxyi40XW66pBJi3z067
	SAbiY5n0k14G7anmwD8g2n0lOYwN2o8Ky4aN70UV1vqg8UoI7aDx7+sQeqAnDiCR6bcs
	h5TJy+MKVoEbuL8xVPRIvc5Loo0zv4/BM/7nRD4irrGnoL7mSAAAMV9Ub20Fl7MBuEQJ
	7YCfB4Fj0pGnmbi/BS+3n7JDDcMlTcnOYUSlCVdr9/vwXWbvFjiWDskYqZBZOdqpWjYI
	VKjqJub4Pv1G0EqJ3/DmUWnM+sxCLPR5VtAQ6OVj1Iovc3qqKO7Z9RDCsvNDjEal+jyM
	Fk+w==
X-Received: by 10.112.146.234 with SMTP id tf10mr15223264lbb.1.1402298397640; 
	Mon, 09 Jun 2014 00:19:57 -0700 (PDT)
Received: from localhost.localdomain (fw.mikrodidakt.se. [213.185.29.22])
	by mx.google.com with ESMTPSA id b3sm17298368lbi.15.2014.06.09.00.19.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jun 2014 00:19:57 -0700 (PDT)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 09:19:44 +0200
Message-Id: <1402298384-23611-1-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.9.3
Subject: [RFC][PATCH] libc-package.bbclass: Improve handling of GLIBC_GENERATE_LOCALES
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
X-List-Received-Date: Mon, 09 Jun 2014 07:20:00 -0000

Currently, setting GLIBC_GENERATE_LOCALES to the empty string means that
all supported binary locales are generated.

Improve the situation by adding a weak assignment to "all",
in order to keep current default behaviour when GLIBC_GENERATE_LOCALES
is not set by the user, and change the code to do no special handling of
the empty string value. This makes it possible to skip generating
binary locales altogether by setting GLIBC_GENERATE_LOCALES = "".

Since locales directory can now be empty, make sure it is not packaged
in this situation.

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
---
 meta/classes/libc-package.bbclass | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index c1bc399..c2f7f2f 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -2,11 +2,15 @@
 # This class knows how to package up [e]glibc. Its shared since prebuild binary toolchains
 # may need packaging and its pointless to duplicate this code.
 #
+# Caller should set GLIBC_GENERATE_LOCALES to a space-separated list of
+# locales to generate. "all" will generate all supported locales
+#
 # Caller should set GLIBC_INTERNAL_USE_BINARY_LOCALE to one of:
 #  "compile" - Use QEMU to generate the binary locale files
 #  "precompiled" - The binary locale files are pregenerated and already present
 #  "ondevice" - The device will build the locale files upon first boot through the postinst
 
+GLIBC_GENERATE_LOCALES ?= "all"
 GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "ondevice"
 
 python __anonymous () {
@@ -111,6 +115,12 @@ do_prep_locale_tree() {
 do_collect_bins_from_locale_tree() {
 	treedir=${WORKDIR}/locale-tree
 
+	# When no binary locales are generated we return early in order
+	# to skip creating empty directories that QA will warn about.
+	if [ -z "$(ls $treedir/${localedir})" ]; then
+		return
+	fi
+
 	parent=$(dirname ${localedir})
 	mkdir -p ${PKGD}/$parent
 	tar -cf - -C $treedir/$parent -p $(basename ${localedir}) | tar -xf - -C ${PKGD}$parent
@@ -220,9 +230,8 @@ python package_do_split_gconvs () {
                 continue
             supported[locale] = charset
 
-    # GLIBC_GENERATE_LOCALES var specifies which locales to be generated. empty or "all" means all locales
     to_generate = d.getVar('GLIBC_GENERATE_LOCALES', True)
-    if not to_generate or to_generate == 'all':
+    if to_generate == 'all':
         to_generate = supported.keys()
     else:
         to_generate = to_generate.split()
-- 
1.9.3


