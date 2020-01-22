Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 412C891462
	for <openembedded-core@openembedded.org>;
	Wed, 22 Jan 2020 05:48:22 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id i23so2799010pfo.2
	for <openembedded-core@openembedded.org>;
	Tue, 21 Jan 2020 21:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=o2jop5uqMxZCIKMt5XI5gxBGvPkWsbCKon+hdif4/N0=;
	b=XXxU3GXtE1P40GfICfLtnUVDTOcnwOqqwPnf4QKB1vjoA4ArrE+rPMeNIox6J4l9e8
	VPEV37YQt0veiNB/lGNLp29Ers+sVJ30vk5nkEPqmC9J9rwoch4Cvxx/qsQLsXgkK+ay
	93JJknLCip+NEGELlGbPT+jhpKXaFeXZo7Qudj69nqD0vuQXBhSWzvuKm7seebNfibNx
	JJw/W21okkTi7cgnedgVj3LkPj24XkytWG7T2zNIzpsvX6+AGxP7mVuRcb/scsrw57jq
	D0d5j2xj3Sc5RB24dJ6wcBBsT9zpGqL4Ar5HrQn50bj/F6y01uTVoubT7BL4PnHRCMkx
	0VxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=o2jop5uqMxZCIKMt5XI5gxBGvPkWsbCKon+hdif4/N0=;
	b=PvlrBtKugeaJoQnzPRPi7hhAbk++tb0LGdXIc9H4Ykne/T0HEjor/O0z5rvf8zxiHL
	X1kYVLDY3OnmmCn/Xqqr2u/z1dHRYR2BIGN7WQSbAjh4+YtAQ4hdaMWWt49RGEfVPiH2
	o3b/c5A5GGxCai56R/W5SlLbv75OFHyE74PS1KVOld/tHlnGuM272K+jiWwXvbN2QCPl
	/iZYkY3Owm3SC3fWgBf4HOMnJ6VHtoLziX/ogVDhJlpOD1dXlBwvPsaRnGMsLyeXQRoB
	lNIOPYfHuEOgqkWJY2hkuC0yPzxBkdlFF7RJxF+zN4Bd39zThfDFyphSUzTfkbgAlTXp
	Q3lA==
X-Gm-Message-State: APjAAAW3m6bofgsYXXHFEZCBsTqYNcO3nDhdRs/HZ0GYWwJNLgQrhR2q
	0bJjtPLgK1aRm1KJjKq1RpvsSGJU
X-Google-Smtp-Source: APXvYqwFXH8PwqXEpr8VnsFjkxg51y5cmZn7iTeQpPNN1hGk1BN8Hdj7qOE4+W9LcQ1M7DeUJxvbnQ==
X-Received: by 2002:a63:2808:: with SMTP id o8mr9252658pgo.39.1579672103156;
	Tue, 21 Jan 2020 21:48:23 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:682c:76b9:6d8a:bbd2])
	by smtp.gmail.com with ESMTPSA id p18sm1413247pjo.3.2020.01.21.21.48.22
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 21:48:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 21 Jan 2020 21:48:10 -0800
Message-Id: <5ed714139f91eb03871e01b68a4370784071234d.1579672034.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579672034.git.akuster808@gmail.com>
References: <cover.1579672034.git.akuster808@gmail.com>
Subject: [zeus 05/11] license.bbclass: Introduce AVAILABLE_LICENSES that lists all licenses
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
X-List-Received-Date: Wed, 22 Jan 2020 05:48:22 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Previously, there was SRC_DISTRIBUTE_LICENSES, an undocumented
variable that contained a static list of licenses. It was used by
expand_wildcard_licenses() to expand any wildcards used in, e.g.,
INCOMPATIBLE_LICENSE. However, since this static list of licenses has
not been kept up-to-date, many licenses were missing, with the result
that if one tried to use any of those licenses with a wildcard, no
licenses would be found, effectively ignoring that they should be
marked as incompatible.

This introduces a new (documented) variable, AVAILABLE_LICENSES, that
is automatically updated to contain all licenses found in any
directories specified by ${COMMON_LICENSE_DIR} and ${LICENSE_PATH},
and uses it instead of SRC_DISTRIBUTE_LICENSES when expanding
wildcards.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8c9ef587fe499c612a878a1ab42092eb79b334ef)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/license.bbclass                  | 27 ++++++++++++++++---
 meta/conf/documentation.conf                  |  1 +
 .../oeqa/selftest/cases/incompatible_lic.py   |  6 ++---
 3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index adca881c85..b0d37b119c 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -252,7 +252,7 @@ def canonical_license(d, license):
     """
     Return the canonical (SPDX) form of the license if available (so GPLv3
     becomes GPL-3.0), for the license named 'X+', return canonical form of
-    'X' if availabel and the tailing '+' (so GPLv3+ becomes GPL-3.0+), 
+    'X' if available and the tailing '+' (so GPLv3+ becomes GPL-3.0+),
     or the passed license if there is no canonical form.
     """
     lic = d.getVarFlag('SPDXLICENSEMAP', license) or ""
@@ -262,10 +262,29 @@ def canonical_license(d, license):
             lic += '+'
     return lic or license
 
+def available_licenses(d):
+    """
+    Return the available licenses by searching the directories specified by
+    COMMON_LICENSE_DIR and LICENSE_PATH.
+    """
+    lic_dirs = ((d.getVar('COMMON_LICENSE_DIR') or '') + ' ' +
+                (d.getVar('LICENSE_PATH') or '')).split()
+
+    licenses = []
+    for lic_dir in lic_dirs:
+        licenses += os.listdir(lic_dir)
+
+    licenses = sorted(licenses)
+    return licenses
+
+# Only determine the list of all available licenses once. This assumes that any
+# additions to LICENSE_PATH have been done before this file is parsed.
+AVAILABLE_LICENSES := "${@' '.join(available_licenses(d))}"
+
 def expand_wildcard_licenses(d, wildcard_licenses):
     """
-    Return actual spdx format license names if wildcard used. We expand
-    wildcards from SPDXLICENSEMAP flags and SRC_DISTRIBUTE_LICENSES values.
+    Return actual spdx format license names if wildcards are used. We expand
+    wildcards from SPDXLICENSEMAP flags and AVAILABLE_LICENSES.
     """
     import fnmatch
     licenses = wildcard_licenses[:]
@@ -274,7 +293,7 @@ def expand_wildcard_licenses(d, wildcard_licenses):
         spdxflags = fnmatch.filter(spdxmapkeys, wld_lic)
         licenses += [d.getVarFlag('SPDXLICENSEMAP', flag) for flag in spdxflags]
 
-    spdx_lics = (d.getVar('SRC_DISTRIBUTE_LICENSES', False) or '').split()
+    spdx_lics = d.getVar('AVAILABLE_LICENSES').split()
     for wld_lic in wildcard_licenses:
         licenses += fnmatch.filter(spdx_lics, wld_lic)
 
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 550df20b0f..ce2a37e0e5 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -69,6 +69,7 @@ ASSUME_SHLIBS[doc] = "List of shlib:package[_version] mappings. Useful for lib p
 AUTHOR[doc] = "Email address used to contact the original author(s) in order to send patches and forward bugs."
 AUTO_SYSLINUXMENU[doc] = "Enables creating an automatic menu for the syslinux bootloader."
 AUTOREV[doc] = "When SRCREV is set to the value of this variable, it specifies to use the latest source revision in the repository."
+AVAILABLE_LICENSES[doc] = "List of licenses found in the directories specified by COMMON_LICENSE_DIR and LICENSE_PATH."
 
 #B
 
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 8fb93af8a8..3cc5bbc35c 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -12,12 +12,12 @@ class IncompatibleLicenseTests(OESelftestTestCase):
         if error_msg not in result.output:
             raise AssertionError(result.output)
 
-    # Verify that a package with an SPDX license (from SRC_DISTRIBUTE_LICENSES)
+    # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
     # cannot be built when INCOMPATIBLE_LICENSE contains this SPDX license
     def test_incompatible_spdx_license(self):
         self.lic_test('incompatible-license', 'GPL-3.0', 'GPL-3.0')
 
-    # Verify that a package with an SPDX license (from SRC_DISTRIBUTE_LICENSES)
+    # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
     # cannot be built when INCOMPATIBLE_LICENSE contains an alias (in
     # SPDXLICENSEMAP) of this SPDX license
     def test_incompatible_alias_spdx_license(self):
@@ -35,7 +35,7 @@ class IncompatibleLicenseTests(OESelftestTestCase):
         self.lic_test('incompatible-license-alias', 'GPLv3', 'GPLv3')
 
     # Verify that a package with a non-SPDX license (neither in
-    # SRC_DISTRIBUTE_LICENSES nor in SPDXLICENSEMAP) cannot be built when
+    # AVAILABLE_LICENSES nor in SPDXLICENSEMAP) cannot be built when
     # INCOMPATIBLE_LICENSE contains this license
     def test_incompatible_nonspdx_license(self):
         self.lic_test('incompatible-nonspdx-license', 'FooLicense', 'FooLicense')
-- 
2.17.1


