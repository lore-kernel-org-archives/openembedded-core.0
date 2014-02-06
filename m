Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4B8036C959
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 23:17:22 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id q59so1766302wes.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2014 15:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=fD2KSvhSPrGW/L2Q+ZdM7kwt6BzzozZSYJa0/XX0U9w=;
	b=RcvJIwjjr2zx/BQ5cogWxXfqtkKWYdlNkF5tj2pOIfnoek8C45vTh54/laGAEAMLI6
	S+qOAaTbwtrkL5+NWEcDf46jE2CdrAeMOx8MTEjME81L6wX/vhVDHqnkBr54qSVtoKbE
	NR1RbMHmnzAIpNC9wDZ5M3xBmILODmgFBXseuSQavcm/E0Gs0XMonpiZa+DIyvTBVIW9
	ynglWlIXt028P9e2k+jm1bTQpb6QOq1UNFWNCMmk2Edg/yh7TK+VBvl140xw+3+FsJJQ
	zZ5cGilf5k+9LO6tN51Q2D/eaozS3jDKyjN+NbhgbLIgc1mPY+tKGgRhA8MmpqzQ7Tce
	zfdQ==
X-Gm-Message-State: ALoCoQkv5iqWqbibaZ7vb5YP3fLYVBZA2HkiZhvFIs/yfjpAh0Q+hJ5qG96zJHzf+WScTodmTRiB
X-Received: by 10.194.185.165 with SMTP id fd5mr30631wjc.95.1391728642077;
	Thu, 06 Feb 2014 15:17:22 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id jd2sm987010wic.9.2014.02.06.15.17.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Feb 2014 15:17:21 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 23:17:18 +0000
Message-Id: <1391728638-12287-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] binconfig: mangle ${base_libdir}
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
X-List-Received-Date: Thu, 06 Feb 2014 23:17:22 -0000

Some recipes are installing libraries into ${base_libdir} (typically /lib) and
also use a foo-config binary to identify compile paths, for example
libusb-compat.  Without mangling ${base_libdir} the ${base_libdir} path is
passed to the compiler, where it looks like a host path and results in
compile-host-path QA errors.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/binconfig.bbclass |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
index 4c42602..848c744 100644
--- a/meta/classes/binconfig.bbclass
+++ b/meta/classes/binconfig.bbclass
@@ -5,6 +5,7 @@ def get_binconfig_mangle(d):
 	s = "-e ''"
 	if not bb.data.inherits_class('native', d):
 		optional_quote = r"\(\"\?\)"
+		s += " -e 's:=%s${base_libdir}:=\\1OEBASELIBDIR:;'" % optional_quote
 		s += " -e 's:=%s${libdir}:=\\1OELIBDIR:;'" % optional_quote
 		s += " -e 's:=%s${includedir}:=\\1OEINCDIR:;'" % optional_quote
 		s += " -e 's:=%s${datadir}:=\\1OEDATADIR:'" % optional_quote
@@ -12,6 +13,7 @@ def get_binconfig_mangle(d):
 		s += " -e 's:=%s${exec_prefix}/:=\\1OEEXECPREFIX/:'" % optional_quote
 		s += " -e 's:-L${libdir}:-LOELIBDIR:;'"
 		s += " -e 's:-I${includedir}:-IOEINCDIR:;'"
+		s += " -e 's:OEBASELIBDIR:${STAGING_BASELIBDIR}:;'"
 		s += " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
 		s += " -e 's:OEINCDIR:${STAGING_INCDIR}:;'"
 		s += " -e 's:OEDATADIR:${STAGING_DATADIR}:'"
@@ -31,7 +33,8 @@ PACKAGE_PREPROCESS_FUNCS += "binconfig_package_preprocess"
 binconfig_package_preprocess () {
 	for config in `find ${PKGD} -name '${BINCONFIG_GLOB}'`; do
 		sed -i \
-		    -e 's:${STAGING_LIBDIR}:${libdir}:g;' \ 
+		    -e 's:${STAGING_BASELIBDIR}:${base_libdir}:g;' \
+		    -e 's:${STAGING_LIBDIR}:${libdir}:g;' \
 		    -e 's:${STAGING_INCDIR}:${includedir}:g;' \
 		    -e 's:${STAGING_DATADIR}:${datadir}:' \
 		    -e 's:${STAGING_DIR_HOST}${prefix}:${prefix}:' \
@@ -39,6 +42,7 @@ binconfig_package_preprocess () {
 	done
 	for lafile in `find ${PKGD} -name "*.la"` ; do
 		sed -i \
+		    -e 's:${STAGING_BASELIBDIR}:${base_libdir}:g;' \
 		    -e 's:${STAGING_LIBDIR}:${libdir}:g;' \
 		    -e 's:${STAGING_INCDIR}:${includedir}:g;' \
 		    -e 's:${STAGING_DATADIR}:${datadir}:' \
-- 
1.7.10.4


