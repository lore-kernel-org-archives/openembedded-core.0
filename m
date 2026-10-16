Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4EDCCA46C
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:03:34 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5608.1792188208155376418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=K4nsqUTJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202610162203248f1963c86f0002070f-pehoz1@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202610162203248f1963c86f0002070f
        for <openembedded-core@lists.openembedded.org>;
        Sat, 17 Oct 2026 00:03:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=qKQYEm/YK7H81TfIfaqeneQC5fS0MrkpCzOmZ5QCzWY=;
 b=K4nsqUTJrE7FMK19CGDBo9QZcRRK14EmSV+qmHMQsAv5cxzN/eL3am5h/eTc9Kr/xv3iEc
 e9QAodDPSOEUpCRPs1G4mSCoxNr9GkoCTvwEtsR50wzMLQ0G8ojsOlGkE43wrihhNYcBi9BN
 9WrQZEq92LaVhmZTSun68ZuT6MI8bnFhf4wKHdzBQvw7I5aMudCTQL/WRK3hS0efdsGG/CVq
 OnkU4HhEHnZYI6ZdUXSEho9JFWhb8hg4L0FDuI7/lIhzpf2gr6eFT02qX6tAx5LTGJ5sCidG
 S21n1Lns0z9kF+2MFt/NpAJ3Q/KZ3u+luuDhG7CyufldSXHhEyPCCTCw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] libpcre2: update to latest release branch hash c084f99ae0
Date: Sat, 17 Oct 2026 00:02:53 +0200
Message-ID: <20261016220253.3564610-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:03:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248040

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2026-103111, CVE-2026-86145, CVE-2026-89158, CVE-2026-89160,
CVE-2026-89157, CVE-2026-89156, CVE-2026-89161, and CVE-2026-89162.

The project committed to have 5 year security support for each release
on a dedicated release branch.
Switch from release tarball to git fetcher to use this feature.

gitsm is used to fetch sljit subnmodule. It is not used by default but
can be enabled in downstream layers via configuration option.

Git log with all changes and manually created CVE annotations:
$ git log --oneline pcre2-10.47..c084f99ae0af664e86819fd1839a13c56dc0918c
c084f99a Backport of pcre2-10.49-Fix-large-stack-allocation.patch [CVE-2026-103111]
cb7193ac Backport of pcre2-10.48-Fix-DFA-workspace-overflows.patch [CVE-2026-86145]
586e2ea0 Backport of pcre2-10.48-Fix-compiler-integer-overflows.patch [CVE-2026-89158]
2c7492a0 Backport of pcre2-10.48-Fix-invalid-UTF-backwards-scans.patch [CVE-2026-89160]
1d6cc92c Backport of pcre2-10.48-Keep-escape-error-offset-in-pattern.patch
75ca1974 Backport of pcre2-10.48-Fix-allocation-byte-sizing.patch [CVE-2026-89157]
5528f329 Backport of pcre2-10.48-Check-JIT-mode-before-validation.patch [CVE-2026-89156]
69aa0df5 Backport of pcre2-10.48-Fix-JIT-match-context-reuse.patch [CVE-2026-89161]
1e058b41 Backport of pcre2-10.48-Fix-JIT-STR_END.patch
120f76cb Backport of pcre2-10.48-Fix-scan-prefix-repeat-reset.patch
e4d6d427 Backport of pcre2-10.48-Fix-repeated-substitute-escapes.patch
0ac26ee9 Backport of pcre2-10.48-Fix-character-list-generator.patch
dcfab032 Backport of pcre2-10.48-Write-serialization-padding.patch [CVE-2026-89162]

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libpcre/libpcre2_10.47.bb | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipes-support/libpcre/libpcre2_10.47.bb
index 70079e0b65..5bdb647f52 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -12,25 +12,27 @@ LIC_FILES_CHKSUM = "file://LICENCE.md;md5=6720bf3bcff57543b915c2b22e526df0 \
                     file://deps/sljit/LICENSE;md5=97268427d235c41c0be238ce8e5fda17 \
                     "
 
-SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
+BASE_VER = "${@d.getVar('PV').split('+')[0]}"
+SRC_URI = "gitsm://github.com/PCRE2Project/pcre2;protocol=https;branch=release/pcre2-${BASE_VER} \
            file://run-ptest \
 "
-
-GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
-UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
-
-SRC_URI[sha256sum] = "47fe8c99461250d42f89e6e8fdaeba9da057855d06eb7fc08d9ca03fd08d7bc7"
+SRCREV = "c084f99ae0af664e86819fd1839a13c56dc0918c"
+PV .= "+git"
 
 CVE_PRODUCT = "pcre2"
 
-S = "${UNPACKDIR}/pcre2-${PV}"
+CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2026-103111 CVE-2026-86145 CVE-2026-89158 CVE-2026-89160 \
+    CVE-2026-89157 CVE-2026-89156 CVE-2026-89161 CVE-2026-89162 \
+"
+CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 PROVIDES += "pcre2"
 DEPENDS += "bzip2 zlib"
 
 BINCONFIG = "${bindir}/pcre2-config"
 
-inherit autotools binconfig-disabled github-releases ptest
+inherit autotools binconfig-disabled ptest
 
 EXTRA_OECONF = "\
     --enable-newline-is-lf \

