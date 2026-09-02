Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33236C624DC
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 15:46:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.328.1788364009861168185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 08:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=x4kQLkaV;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2B7A01A1964
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 15:46:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0139D6053C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 15:46:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6570611C79A84;
	Wed,  2 Sep 2026 17:46:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788364007; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fwKtklsRxFRunnDLdCDefIvyhKl4MscsW1CV1W60Qf4=;
	b=x4kQLkaVdPpxhhXgvhupCPzgKgVDq6AjvCUjx0XdugNDkOOc80J2SsFK8V/RE7mjK7EMNf
	ds64sxHKqhZmiWRVXs67raD0TfMu5uZuXG44J511I8aHAl5G2okCYobRXfaVlwmDMqXreI
	HFsfdlLZP4UkMFUzknJ72qJH/OTexvT5aPSJ4pOlhd903uj3PO25OGCdJCkuiRR2XURiE0
	77kEAlhnS+rDJfhKrPJ5iQtQ7MW/q+NjsPbh5wAmZRr1mzidBMaIPtFWPhtbF6y1MdheVW
	M33Vhyld9NcXxISe6S/tEbMORNwgEvUSEW2FrjNqNExoKmFuzjaJxDhT5zA4oQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 02 Sep 2026 17:46:45 +0200
Subject: [PATCH 3/8] python3-vcs-versioning: upgrade 2.3.1 -> 2.3.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-mathieu-updates-2026-09-02-v1-3-039b74833ec7@bootlin.com>
References: <20260902-mathieu-updates-2026-09-02-v1-0-039b74833ec7@bootlin.com>
In-Reply-To: <20260902-mathieu-updates-2026-09-02-v1-0-039b74833ec7@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788364004; l=2106;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=qNU2em0Na5g0p2FWGKeNSr1NMSlFbTvn8Gnbnft4j9M=;
 b=apetcPiW/imXWdbQBwqu3Ut9ivgrPPyYfLT6jqgM3PwdskHa1wOmzOS+Xn6uPL+KzjG10zobD
 y+rOg9MOXPCDMgOWla/0w4hRi4UZxpsIwtlCL0okQNt6RFHokK45Cy7
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 15:46:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244976

Changelog:
- Fixed
  - Register the `pkginfo` workdir discovery factory in vcs-versioning
    itself. `PKG-INFO` is standard sdist metadata, not a setuptools
    artifact, but its factory was only registered by setuptools-scm --
    so a standalone vcs-versioning install could not infer a version
    from an sdist. This broke sdist builds for non-setuptools backends,
    e.g. meson-python calling `python -m vcs_versioning` from
    `project()`.
  - Fallback workdir candidates are now ordered by how much metadata
    they carry (egg-info, then archival, then `PKG-INFO`) instead of by
    entry point iteration order, so a setuptools built sdist keeps using
    its `scm_version.json` now that the two factories ship from
    different distributions.
- Miscellaneous
  - Stop shipping a per-package `uv.lock` in the sdist. It could not be
    generated correctly whenever `setuptools-scm` required an unreleased
    `vcs-versioning`, which broke the release proposal workflow.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 ...{python3-vcs-versioning_2.3.1.bb => python3-vcs-versioning_2.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_2.3.1.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.3.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_2.3.1.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.3.2.bb
index 1800475dff4c..57ea6a92273f 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_2.3.1.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.3.2.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "806635bd0ea653c96af98a70624be758d408a989f2cd0b390e63474d99f96b63"
+SRC_URI[sha256sum] = "24abddff97aecf44cf3fec727eae8d76d9c6f70f5acb39afc41f824d69f2aac5"
 
 SRC_URI += "\
     file://run-ptest \

-- 
2.47.3


