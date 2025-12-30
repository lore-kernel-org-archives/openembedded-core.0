Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D68EE020B
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 15:34:53 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66374.1767108886353893470
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 07:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=P4u9ZTLl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202512301534437492bc4659000207fd-qd_z0u@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202512301534437492bc4659000207fd
        for <openembedded-core@lists.openembedded.org>;
        Tue, 30 Dec 2025 16:34:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=x53f0B/aCP/QFKu7vuPvh2UVwCtviAr3fPXEcjLxdEo=;
 b=P4u9ZTLlRdvR5jixdDQTLjRgstZMtO8m2PqxjyBSPjTYNg95AlRRMfs5I7F8Nebi6tz9n/
 VJpctBwcGl1S98mjAORxu8ZGuhDNWSuB+HePCmog8fAW7SweakFm/RxGEQiXioGtoh/D7ZOu
 +sy1abSZ/mJsE9j38Ff8fR1eQiNqjo1IMqhrr1u/6nDIlsYkRpwtyecUj+J+n7ounthe5zI+
 qdfhGNx2gOBCWNJGuQk+OJsWLKa/QkoUY9QMn94Wc+pla7CU4EY1bOpSK5RAZNv1snCGAThh
 fl3EwWkTwRrsWJIJpDP9UitlJItBY3YfycWiJcmzIkSrV21fWAwT85FQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] python3: upgrade 3.13.9 -> 3.13.11
Date: Tue, 30 Dec 2025 16:34:36 +0100
Message-Id: <20251230153436.37893-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 15:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228683

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-6075 (in 3.13.10) and CVE-2025-12084 (in 3.13.11).

Release information:
* https://www.python.org/downloads/release/python-31310/
* Python 3.13.10 is the tenth maintenance release of 3.13, containing
  around 300 bugfixes, build improvements and documentation changes
  since 3.13.9.

* https://www.python.org/downloads/release/python-31311/
* Python 3.13.11 is the eleventh maintenance release of 3.13. This is
   an expedited release to fix the following regressions:
  * gh-142206: Exceptions in multiprocessing in running programs while
    upgrading Python.
  * gh-142218: Segmentation faults and assertion failures in
    insertdict.
  * gh-140797: Crash when using multiple capturing groups in re.Scanner
* And these security fixes:
  * gh-142145: Remove quadratic behavior in node ID cache clearing
    (CVE-2025-12084)
  * gh-119451: Fix a potential denial of service in http.client
  * gh-119452: Fix a potential virtual memory allocation denial of
    service in http.server

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
Since 3.14 patch series will take some time to be merged, this patch
provides security fixes meanwhile.
Also serves as a cherry-pick base for Whinlatter branch.

 .../python/{python3_3.13.9.bb => python3_3.13.11.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.13.9.bb => python3_3.13.11.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.13.9.bb b/meta/recipes-devtools/python/python3_3.13.11.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.13.9.bb
rename to meta/recipes-devtools/python/python3_3.13.11.bb
index 2e114a6c5b..2fcfd4aba1 100644
--- a/meta/recipes-devtools/python/python3_3.13.9.bb
+++ b/meta/recipes-devtools/python/python3_3.13.11.bb
@@ -35,7 +35,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "ed5ef34cda36cfa2f3a340f07cac7e7814f91c7f3c411f6d3562323a866c5c66"
+SRC_URI[sha256sum] = "16ede7bb7cdbfa895d11b0642fa0e523f291e6487194d53cf6d3b338c3a17ea2"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"

