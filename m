Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1200F6010D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 07:59:51 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id v199so108775318wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 00:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=K6aPc9pR96LKDjFYnBkSRXnSBa96xo6VQeoelHoLH/8=;
	b=bouyyU2UxeB6Ck7C7DSCEaMsvJ5GxAl5pipA8gU04E2RM47VQg38qOo0yPDfnvja1Y
	GaLPadcLNmcWPNYlx4W/fQT5n1uD+RB3V4Yw30iXtkmvnx/9t6BNLlHBrhr1dgIb6lim
	LmzCT5hppC2j7kyi4BYhJQk5CDk9FEK5sDU4f+fqM0rdE89sK2U8kVzEYFTJyHJmjJ/S
	+VQDOvGUOQcA/wRnB2tikzeTCV5iEDgREi6Mh69biKhi/xBFveWCWGFSlJ+Qc5ejFH8V
	6KQbhPy0rbBQlMycHBFovox61BXWudKsKe6Vm8+Ar/2X0MRp4R/oykU2Zl43RifEyc22
	CaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=K6aPc9pR96LKDjFYnBkSRXnSBa96xo6VQeoelHoLH/8=;
	b=dRBhS195fHnmC/Lp9JuFysw6qO2+oSXksDYJhPSe2NjiubuoL20YILul534l1Xcp8c
	8jOnGG6uh+GxHv8mOCculkJUQhdpeY9cNS8CYGAmEpwcxT4ktZ7Zif40SFxDXRc8fUsW
	9bs8yOKFlBhL+6oDEAEzvPhlEbWkNfMRMjdhEQXkekVSzr9wQPoKHt0SoUVxzX3Ru9ql
	oQUNF2oCDXkKQp1W4ubALzJpUeDw1eAluTa/Q5fze5I5vkR3q2FyyyEj0VvvxtlXbTIe
	7d10xaWZGCdsgL25z56+nXj5mbP42vRboZQW4BX2kSWKX4ve/WTmtm0ljc57xJtwMBpj
	7zLg==
X-Gm-Message-State: ALyK8tJqhEcF5CjHQdVErW+LO11CR2y/b5aRMwB1iabjAGLw6u+VqykidnVYADEPnpjlkqbD
X-Received: by 10.28.137.67 with SMTP id l64mr4637970wmd.51.1465891191568;
	Tue, 14 Jun 2016 00:59:51 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	e133sm2730425wma.6.2016.06.14.00.59.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jun 2016 00:59:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 08:59:39 +0100
Message-Id: <1465891179-20779-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1465891179-20779-1-git-send-email-ross.burton@intel.com>
References: <1465891179-20779-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/4] classes/package: save/restore cwd in split_and_strip_files
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
X-List-Received-Date: Tue, 14 Jun 2016 07:59:52 -0000

This function uses chdir() heavily, so save and restore the cwd so that it
doesn't affect the system state.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/package.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index c9e2aa8..d6204cf 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -841,6 +841,9 @@ python split_and_strip_files () {
     dvar = d.getVar('PKGD', True)
     pn = d.getVar('PN', True)
 
+    oldcwd = os.getcwd()
+    os.chdir(dvar)
+
     # We default to '.debug' style
     if d.getVar('PACKAGE_DEBUG_SPLIT_STYLE', True) == 'debug-file-directory':
         # Single debug-file-directory style debug info
@@ -864,8 +867,6 @@ python split_and_strip_files () {
     sourcefile = d.expand("${WORKDIR}/debugsources.list")
     bb.utils.remove(sourcefile)
 
-    os.chdir(dvar)
-
     # Return type (bits):
     # 0 - not elf
     # 1 - ELF
@@ -1052,6 +1053,7 @@ python split_and_strip_files () {
     #
     # End of strip
     #
+    os.chdir(oldcwd)
 }
 
 python populate_packages () {
@@ -2129,4 +2131,3 @@ def mapping_rename_hook(d):
     runtime_mapping_rename("RDEPENDS", pkg, d)
     runtime_mapping_rename("RRECOMMENDS", pkg, d)
     runtime_mapping_rename("RSUGGESTS", pkg, d)
-
-- 
2.8.0.rc3


