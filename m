Return-Path: <quentin.schulz@streamunlimited.com>
Received: from bsmtp7.bon.at (bsmtp7.bon.at [213.33.87.19])
	by mail.openembedded.org (Postfix) with ESMTP id EF6FC7E62D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 14:26:22 +0000 (UTC)
Received: from qschulz.sue.net (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp7.bon.at (Postfix) with ESMTPSA id 45NXP91xcBz5tlB;
	Tue, 11 Jun 2019 16:26:21 +0200 (CEST)
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2019 16:26:06 +0200
Message-Id: <20190611142607.18038-1-quentin.schulz@streamunlimited.com>
X-Mailer: git-send-email 2.17.1
Cc: Quentin Schulz <quentin.schulz@streamunlimited.com>,
	andriy.danylovskyy@streamunlimited.com, bunk@stusta.de
Subject: [PATCH v4 1/2] meta: license: fix non-SPDX license being removed from INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Tue, 11 Jun 2019 14:26:23 -0000

A non-SPDX license (which is not an alias to an SPDX license) cannot
currently be marked as incompatible in INCOMPATIBLE_LICENSE.
In the current state, we take all INCOMPATIBLE_LICENSE and pass them
through expand_wildcard_licenses which is only adding SPDX licenses that
match the glob regexp of what is in INCOMPATIBLE_LICENSE (be it a direct
match to an SPDX license or via an alias).

This does not work well with custom licenses.

E.g.:

foo.bb:
LICENSE = "FooLicense"

conf/local.conf:
INCOMPATIBLE_LICENSE = "FooLicense"

`bitbake foo`

Gives no warning, no error, builds and packages successfully, because
INCOMPATIBLE_LICENSE is basically empty since FooLicense is neither in
SPDXLICENSEMAP nor in SRC_DISTRIBUTE_LICENSES.

Let's add the original licenses to the list returned by
expand_wildcard_licenses to be able to handle the aforementioned case.

INCOMPATIBLE_LICENSE = "FooLicense GPLv2 GPLv3+" used to "resolve" to
"GPLv2 GPLv3". It now resolves to "FooLicense GPLv2 GPLv3 GPLv3+" which
fixes the issue with custom licenses not being in SPDXLICENSEMAP or
SRC_DISTRIBUTE_LICENSES and thus being left out of the blacklisted
licenses.

I needed to pass a list to expand_wildcard_licenses from the
license_image class instead of the current output of map() because the
operator [:] does not work on this kind of type, and list(map()) or
anything that iterates over map() actually moves the iterator and breaks
the forloop right after in expand_wildcard_licenses.

Signed-off-by: Quentin Schulz <quentin.schulz@streamunlimited.com>
---

v3:
  - fix git context from v2, patch cleanly applies on master branch now,

v2:
  - fixed image building by replacing map(lambda) by a comprehensive list so
that we have a consistent input type for expand_wildcard_licenses,

 meta/classes/license.bbclass       | 2 +-
 meta/classes/license_image.bbclass | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index ed91a4b4db..adca881c85 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -268,7 +268,7 @@ def expand_wildcard_licenses(d, wildcard_licenses):
     wildcards from SPDXLICENSEMAP flags and SRC_DISTRIBUTE_LICENSES values.
     """
     import fnmatch
-    licenses = []
+    licenses = wildcard_licenses[:]
     spdxmapkeys = d.getVarFlags('SPDXLICENSEMAP').keys()
     for wld_lic in wildcard_licenses:
         spdxflags = fnmatch.filter(spdxmapkeys, wld_lic)
diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 6fb76be48e..2cfda81c99 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -40,7 +40,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
     import stat
 
     bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
-    bad_licenses = map(lambda l: canonical_license(d, l), bad_licenses)
+    bad_licenses = [canonical_license(d, l) for l in bad_licenses]
     bad_licenses = expand_wildcard_licenses(d, bad_licenses)
 
     with open(license_manifest, "w") as license_file:
-- 
2.17.1


