Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355E6C76196
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 09:54:34 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.3710.1680861265848568725
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Apr 2023 02:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HgRGTFSl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DA35E1BF20F;
	Fri,  7 Apr 2023 09:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680861263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4c/MY5afjB9zVY6KzOg0ifpm3T9bcUQV5l2XhUhMzcs=;
	b=HgRGTFSl/3RVgKgbT+ENtfj724XjyjajzKzr1d8oAkSh4S9BSMxTGaHTn3w/OASrfzgXUg
	cVDN2zpqCztb/G0tlX7Jlfj5/Oqk964yxpYijegvxPNtLZJqKe6yF5ZGncXKCDBwB+sjkU
	zSLLmOy+nHM0+TY0D8PVSZMe/t2VNoIn1N9cAlYhUlDWRnDR5StA3uitiOs99FtzGqxK+H
	tVuNZtd0BwXA/zgVjPuPd6khTnhlyCKKdF1nHGVPZcGNSVUsEICKPc4kzEah/Xv9X3Q5Q4
	jWQgH9fp0U4MH6f2g/EMwf9RbdITOI6Tx/4Pbte3u6ZM6vqK1NQTWKVaOdgBnw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Frederic Martinsons <frederic.martinsons@gmail.com>,
	Marta Rybczynska <rybczynska@gmail.com>,
	Paul Eggleton <paul.eggleton@linux.microsoft.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH v3] migration-guides: update 4.2 migration and release notes
Date: Fri,  7 Apr 2023 11:53:57 +0200
Message-Id: <20230407095357.312892-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <175373D2D58215B5.3578@lists.openembedded.org>
References: <175373D2D58215B5.3578@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 09:54:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179816

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Frederic Martinsons <frederic.martinsons@gmail.com>
CC: Marta Rybczynska <rybczynska@gmail.com>
CC: Paul Eggleton <paul.eggleton@linux.microsoft.com>
CC: Alex Kiernan <alex.kiernan@gmail.com>
CC: Alexis Lothoré <alexis.lothore@bootlin.com

---

Changes in V3:
- Add details about ptest images as suggested by Richard Purdie
- Add details about resulttools improvements, pointing to
  Alexis' blog post about regression detection.

Changes in V2:
- Add details about filling checksums using the 'cargo-update-recipe-crates'
  class, as suggested by Frederic Martinsons.
---
 .../migration-guides/migration-4.2.rst        | 84 +++++++++++++++++-
 .../migration-guides/release-notes-4.2.rst    | 86 +++++++++++++++++--
 2 files changed, 161 insertions(+), 9 deletions(-)

diff --git a/documentation/migration-guides/migration-4.2.rst b/documentation/migration-guides/migration-4.2.rst
index 1339411b3e..3b60b9a807 100644
--- a/documentation/migration-guides/migration-4.2.rst
+++ b/documentation/migration-guides/migration-4.2.rst
@@ -18,11 +18,78 @@ BitBake and OpenEmbedded-Core are now relying on Python 3.8,
 making it a requirement to use a distribution providing at least this
 version, or to use :term:`buildtools`.
 
+.. _migration-4.2-gcc-8.0:
+
+gcc 8.0 is now the minumum required GNU C compiler version
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+This version, released in 2018, is a minimum requirement
+to build the ``mesa-native`` recipe.
+
+.. _migration-4.2-new-nvd-api:
+
+Fetching the NVD vulnerability database through the 2.0 API
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+This new version adds a new fetcher for the NVD database using the 2.0 API,
+as the 1.0 API will be retired in 2023.
+
+The implementation changes as little as possible, keeping the current
+database format (but using a different database file for the transition
+period), with a notable exception of not using the META table.
+
+Here are minor changes that you may notice:
+
+-  The database starts in 1999 instead of 2002
+-  The complete fetch is longer (30 minutes typically)
+
+.. _migration-4.2-rust-crate-checksums:
+
+Rust: mandatory checksums for crates
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+This release now supports checksums for Rust crates and make
+them mandatory for each crate in a recipe. See :yocto_git:`python3_bcrypt recipe changes
+</poky/commit/?h=mickledore&id=0dcb5ab3462fdaaf1646b05a00c7150eea711a9a>`
+for example.
+
+The ``cargo-update-recipe-crates`` utility
+:yocto_git:`has been extended </poky/commit/?h=mickledore&id=eef7fbea2c5bf59369390be4d5efa915591b7b22>`
+to include such checksums. So, in case you need to add the list of checksums
+to a recipe just inheriting the :ref:`ref-classes-cargo` class so far, you can
+follow these steps:
+
+#.  Make the recipe inherit :ref:`ref-classes-cargo-update-recipe-crates`
+#.  Remove all ``crate://`` lines from the recipe
+#.  Create an empty ``${BPN}-crates.inc`` file and make your recipe require it
+#.  Execute ``bitbake -c update_crates your_recipe``
+#.  Copy and paste the output of BitBake about the missing checksums into the
+    ``${BPN}-crates.inc`` file.
+
 .. _migration-4.2-qa-checks:
 
 QA check changes
 ~~~~~~~~~~~~~~~~
 
+.. _migration-4.2-supported-distributions:
+
+Supported distributions
+~~~~~~~~~~~~~~~~~~~~~~~
+
+This release supports running BitBake on new GNU/Linux distributions:
+
+-  Fedora 36 and 37
+-  AlmaLinux 8.7 and 9.1
+-  OpenSuse 15.4
+
+On the other hand, some earlier distributions are no longer supported:
+
+-  Debian 10.x
+-  Fedora 34 and 35
+-  AlmaLinux 8.5
+
+See :ref:`all supported distributions <system-requirements-supported-distros>`.
+
 .. _migration-4.2-misc-changes:
 
 Miscellaneous changes
@@ -30,6 +97,7 @@ Miscellaneous changes
 
 -  The ``OEBasic`` signature handler (see :term:`BB_SIGNATURE_HANDLER`) has been
    removed.
+  
 
 .. _migration-4.2-removed-variables:
 
@@ -38,7 +106,7 @@ Removed variables
 
 The following variables have been removed:
 
--  ``SERIAL_CONSOLE``, deprecated since version 2.6, replaced by :term:``SERIAL_CONSOLES``.
+-  ``SERIAL_CONSOLE``, deprecated since version 2.6, replaced by :term:`SERIAL_CONSOLES`.
 
 .. _migration-4.2-removed-recipes:
 
@@ -47,3 +115,17 @@ Removed recipes
 
 The following recipes have been removed in this release:
 
+-  ``python3-picobuild``: after switching to ``python3-build``
+-  ``python3-strict-rfc3339``: unmaintained and not needed by anything in
+   :oe_git:`openembedded-core </openembedded-core>`
+   or :oe_git:`meta-openembedded </meta-openembedded>`.
+
+.. _migration-4.2-removed-classes:
+
+Removed classes
+~~~~~~~~~~~~~~~
+
+The following classes have been removed in this release:
+
+-  ``rust-bin``: no longer used in Poky
+
diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
index edafe378b0..6fa41ce33b 100644
--- a/documentation/migration-guides/release-notes-4.2.rst
+++ b/documentation/migration-guides/release-notes-4.2.rst
@@ -6,23 +6,93 @@ Release notes for 4.2 (mickledore)
 New Features / Enhancements in 4.2
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- Python 3.8 is the minimum Python version required on the build host.
-  For host distributions that do not provide it, this is included as part of the
-  :term:`buildtools` tarball.
+-  Python 3.8 is the minimum Python version required on the build host.
+   For host distributions that do not provide it, this is included as part of the
+   :term:`buildtools` tarball.
 
-- This release now supports a new ``addpylib`` directive to enable
-  Python libraries within layers.
+-  BitBake in this release now supports a new ``addpylib`` directive to enable
+   Python libraries within layers.
 
-  This directive should be added to your layer configuration,
-  as in the below example from ``meta/conf/layer.conf``::
+   This directive should be added to your layer configuration
+   as in the below example from ``meta/conf/layer.conf``::
 
-     addpylib ${LAYERDIR}/lib oe
+      addpylib ${LAYERDIR}/lib oe
+
+-  BitBake has seen multiple internal changes that may impact
+   memory and disk usage as well as parsing time, in particular:
+
+   -  BitBake's Cooker server is now multithreaded.
+
+   -  BitBake's cache has been extended to include more hash
+      debugging data, but has also been optimized to :yocto_git:`compress
+      cache data <https://git.yoctoproject.org/poky/commit/?h=mickledore&id=7d010055e2af3294e17db862f42664ca689a9356>`.
+
+   -  BitBake's Cooker server :yocto_git:`can now be pinged
+      https://git.yoctoproject.org/poky/commit/?h=mickledore&id=26f255da09>`
+      from the UI.
 
 -  Architecture-specific enhancements:
 
+   -  This release adds initial support for the
+      :wikipedia:`LoongArch <Loongson#LoongArch>`
+      (``loongarch64``) architecture, though there is no testing for it yet.
+
 -  Kernel-related enhancements:
 
 -  QEMU/runqemu enhancements:
 
 -  Image-related enhancements:
 
+-  New variables:
+
+   - :term:`VOLATILE_TMP_DIR` allows to specify
+     whether ``/tmp`` should be on persistent storage
+     or in RAM.
+
+-  Rust improvements:
+
+   -  This release adds Cargo support on the target, and includes
+      automated QA tests for this functionality.
+
+   -  It also supports checksums for Rust crates and makes
+      them mandatory for each crate in a recipe.
+
+-  Testing:
+
+   -  The ptest images have changed structure in this release. The
+      underlying ``core-image-ptest`` recipe now uses :term:`BBCLASSEXTEND` to
+      create a variant for each ptest enabled recipe in OE-Core. 
+
+      For example, this means that ``core-image-ptest-bzip2``,
+      ``core-image-ptest-lttng-tools`` and many more image targets now exist
+      and can be built/tested individually. 
+
+      The ``core-image-ptest-all`` and ``core-image-ptest-fast`` targets are now
+      wrappers that target groups of individual images and means that the tests
+      can be executed in parallel during our automated testing. This also means
+      the dependencies are more accurately tested.
+
+   -  It is now possible to track regression changes between releases using
+      :oe_git:`resulttool </openembedded-core/tree/scripts/resulttool>`, which
+      has been massively improved to better process test results, interpret them
+      and detect regressions, eliminating noise and false positives.
+
+      Here is an example command, which allowed to spot and fix
+      a regression in the ``quilt`` ptest::
+
+         yocto_testresults_query.py regression-report 4.2_M1 4.2_M2
+
+      See this `blog post about regression detection
+      <https://bootlin.com/blog/continuous-integration-in-yocto-improving-the-regressions-detection/>`__
+      and `this example test result
+      <https://autobuilder.yocto.io/pub/non-release/20230405-6/testresults/buildperf-alma8/perf-alma8_master_20230405030047_38e3769a72.html>`__.
+
+   -  This release adds support for parallel ptest execution with a ptest per image.
+      This takes ptest execution time from 3.5 hours to around 45 minutes on the autobuilder.
+
+-  Miscellaneous changes:
+
+   -  Supporting 64 bit dates on 32 bit platforms: several packages have been
+      updated to pass Y2038 tests.
+
+   -  Many packages were updated to add large file support.
-- 
2.34.1


