Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADA1CCA490
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:03:43 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5681.1792188216319980297
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ZiZg4wUA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20261016220334316770443400020793-dsmpho@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20261016220334316770443400020793
        for <openembedded-core@lists.openembedded.org>;
        Sat, 17 Oct 2026 00:03:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=3CaDwxp1TYVIoS4H8dR7BOQSyC+XdcV/hMa+F+xiHbM=;
 b=ZiZg4wUAUNPySeUzvUF4ahKnOz3dvjAiyXiruFK21fzpCLlL/iN9h4Pg/fN9ncWgdTh4fb
 fwdvIdlhwDyB14tIpLLz+0ONKayRz7vQGsEwzraoa3ftfYLCDb+MJgfyE9wvrbiRSK3jmzyq
 3Hgi+x1DGSH6gp0awbx1T9x+9gGKCTa3g9P1FzeSgGkLL4E7E8BvC3GSeHaDdz/fyWnSosb+
 6/PZKL4qiBTuklzfCXjLVrz6Hzq5gq98R+CRugPMqsBfs1AQel/1UrUR9gUBihdQW+ZVAyru
 pmixXpLILCvMYy3w9EsUGtV1QsgjGkQduPwlMLgttcVCNb11a+3IpzUw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] libpcre2: update to latest release branch hash 50b3c0d7ce
Date: Sat, 17 Oct 2026 00:02:49 +0200
Message-ID: <20261016220249.3564587-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248041

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2026-103111, CVE-2026-86145, CVE-2026-89158, CVE-2026-89160,
CVE-2026-89157, CVE-2026-89156 and CVE-2026-89161.

The project committed to have 5 year security support for each release
on a dedicated release branch.
Switch from release tarball to git fetcher to use this feature.

Git log with all changes and manually created CVE annotations:
$ git log --oneline pcre2-10.43..50b3c0d7ceaf23578d04e644c02781c322ef6cb0
50b3c0d7 Backport of pcre2-10.49-Fix-large-stack-allocation.patch [CVE-2026-103111]
b7d3ffd4 Backport of pcre2-10.48-Fix-DFA-workspace-overflows.patch [CVE-2026-86145]
9c11f0dc Backport of pcre2-10.48-Fix-compiler-integer-overflows.patch [CVE-2026-89158]
2866e543 Backport of pcre2-10.48-Fix-invalid-UTF-backwards-scans.patch [CVE-2026-89160]
714e1062 Backport of pcre2-10.48-Fix-allocation-byte-sizing.patch [CVE-2026-89157]
91759151 Backport of pcre2-10.48-Check-JIT-mode-before-validation.patch [CVE-2026-89156]
87f50503 Backport of pcre2-10.48-Fix-JIT-match-context-reuse.patch [CVE-2026-89161]
ed0e58f5 Backport of pcre2-10.48-Fix-JIT-STR_END.patch
dc733f56 Backport of pcre2-10.44-Fix-incorrect-compiling.patch
7f3e5400 Backport of pcre2-10.44-Fix-locking-region.patch

Diff of release tarball and git repository is:
Only in pcre2-10.43/: aclocal.m4
Only in pcre2-10.43/: ar-lib
Only in libpcre2-10.43+git/: autogen.sh
Only in libpcre2-10.43+git/: .bazelrc
Only in libpcre2-10.43+git/: BUILD.bazel
Only in libpcre2-10.43+git/: build.zig
Only in pcre2-10.43/: compile
Only in pcre2-10.43/: config.guess
Only in pcre2-10.43/: config.sub
Only in pcre2-10.43/: configure
Only in pcre2-10.43/: depcomp
Only in libpcre2-10.43+git/: .git
Only in libpcre2-10.43+git/: .github
Only in libpcre2-10.43+git/: .gitignore
Only in libpcre2-10.43+git/: index.md
Only in pcre2-10.43/: INSTALL
Only in pcre2-10.43/: install-sh
Only in pcre2-10.43/: ltmain.sh
Only in pcre2-10.43/m4: libtool.m4
Only in pcre2-10.43/m4: lt~obsolete.m4
Only in pcre2-10.43/m4: ltoptions.m4
Only in pcre2-10.43/m4: ltsugar.m4
Only in pcre2-10.43/m4: ltversion.m4
Only in libpcre2-10.43+git/: maint
Only in pcre2-10.43/: Makefile.in
Only in pcre2-10.43/: missing
Only in libpcre2-10.43+git/: MODULE.bazel
Only in libpcre2-10.43+git/: pcre2_fuzzer_16.dict
Only in libpcre2-10.43+git/: pcre2_fuzzer_16.options
Only in libpcre2-10.43+git/: pcre2_fuzzer_32.dict
Only in libpcre2-10.43+git/: pcre2_fuzzer_32.options
Only in libpcre2-10.43+git/: pcre2_fuzzer.dict
Only in libpcre2-10.43+git/: pcre2_fuzzer.options
Only in libpcre2-10.43+git/: README.md
Only in pcre2-10.43/: test-driver
Only in libpcre2-10.43+git/: WORKSPACE.bazel

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-support/libpcre/libpcre2_10.43.bb | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.43.bb b/meta/recipes-support/libpcre/libpcre2_10.43.bb
index f744df88fad..743b0ec04e5 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.43.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.43.bb
@@ -10,23 +10,27 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=321a5eb46acae6b6c1ff2c7a866d836a"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
-
-GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
-UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
-
-SRC_URI[sha256sum] = "e2a53984ff0b07dfdb5ae4486bbb9b21cca8e7df2434096cc9bf1b728c350bcb"
+BASE_VER = "${@d.getVar('PV').split('+')[0]}"
+SRC_URI = "git://github.com/PCRE2Project/pcre2;protocol=https;branch=release/pcre2-${BASE_VER}"
+SRCREV = "50b3c0d7ceaf23578d04e644c02781c322ef6cb0"
+PV .= "+git"
 
 CVE_PRODUCT = "pcre2"
 
-S = "${WORKDIR}/pcre2-${PV}"
+CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2026-103111 CVE-2026-86145 CVE-2026-89158 CVE-2026-89160 \
+    CVE-2026-89157 CVE-2026-89156 CVE-2026-89161 \
+"
+CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
+
+S = "${WORKDIR}/git"
 
 PROVIDES += "pcre2"
 DEPENDS += "bzip2 zlib"
 
 BINCONFIG = "${bindir}/pcre2-config"
 
-inherit autotools binconfig-disabled github-releases
+inherit autotools binconfig-disabled
 
 EXTRA_OECONF = "\
     --enable-newline-is-lf \

