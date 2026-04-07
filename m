Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C087DFEEF59
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 15:01:31 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83424.1775574084696971821
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 08:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gk8jzXF+;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 36F29C5B18D;
	Tue,  7 Apr 2026 15:01:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68A85603C7;
	Tue,  7 Apr 2026 15:01:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72FC51045021F;
	Tue,  7 Apr 2026 17:01:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775574080; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0VoWxIvwqwydSdSrCSi7jEbcwh+FNFLw4fYtZp72grA=;
	b=gk8jzXF+KJWvh690hTLhluX30C65PximOBAfq75if3bWodk+pZMxRqPf3B1ihpfuQTaHKg
	K7MalyVgpfthrwKyOnCLRGhInoEYgHE1k6UOBh1v1xHH+iLj2TeMygJKNo45wlpAHQ+JdQ
	7Gfw3SVb9rGtNFMRMCY/FBE2CK9qnGg0h9dcKwnps1SbjNigEkWeUmMoBNIBCg1D+6KvzU
	V0VSRRSZdVItTH+XKCBjvjK0vmxmNV4lvLVBF+BQpkUo7y6cchNN8WPexRcmmQ18xdtuJ+
	JVZNM+MLONRY1+RrkPg7gmFb1jtWKmanw8DpMRjkBl3EpD7zbVX3yx62JBxVNg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Tue, 07 Apr 2026 17:01:08 +0200
Subject: [PATCH v2 2/2] sbom-cve-check-update-db: Fix unpack removing other
 databases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-fix-lic-sbom-cve-check-v2-2-f69da412fd67@bootlin.com>
References: <20260407-fix-lic-sbom-cve-check-v2-0-f69da412fd67@bootlin.com>
In-Reply-To: <20260407-fix-lic-sbom-cve-check-v2-0-f69da412fd67@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, rybczynska@gmail.com, 
 ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 15:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234746

Previously, `UNPACKDIR` was set to `${SBOM_CVE_CHECK_DEPLOY_DB_DIR}`,
which points to the `./databases/` directory and may contain multiple
databases. Since `do_unpack` cleans the `${UNPACKDIR}` directory,
`UNPACKDIR` must only contain a single database.

To address this, set `UNPACKDIR` to
`${SBOM_CVE_CHECK_DEPLOY_DB_DIR}/${SBOM_CVE_CHECK_DB_NAME}` and
configure `destsuffix` to an empty string. However, it is currently not
possible to set `BB_GIT_DEFAULT_DESTSUFFIX` to an empty string, so
`destsuffix` is configured through the SRC_URI instead.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 .../sbom-cve-check/sbom-cve-check-update-cvelist-native.bb            | 2 +-
 meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc     | 3 +--
 .../sbom-cve-check/sbom-cve-check-update-nvd-native.bb                | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
index ce204db6c51a..338712216590 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
-SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
 # 2026-03-19_baseline
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
index a318e2c40ea9..7ada67363d17 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
@@ -15,6 +15,5 @@ deltask do_install
 deltask do_populate_sysroot
 
 # Directly unpack the fetched CVE database to the deploy directory.
-UNPACKDIR = "${SBOM_CVE_CHECK_DEPLOY_DB_DIR}"
+UNPACKDIR = "${SBOM_CVE_CHECK_DEPLOY_DB_DIR}/${SBOM_CVE_CHECK_DB_NAME}"
 S = "${UNPACKDIR}"
-BB_GIT_DEFAULT_DESTSUFFIX = "${SBOM_CVE_CHECK_DB_NAME}"
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
index 30c7868b2ae7..c868ba09c18d 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Updates the NVD CVE database"
 LICENSE = "cve-tou"
-LIC_FILES_CHKSUM = "file://${SBOM_CVE_CHECK_DB_NAME}/LICENSES/cve-tou.md;md5=bc5bbf146f01e20ece63d83c8916d8fb"
+LIC_FILES_CHKSUM = "file://LICENSES/cve-tou.md;md5=bc5bbf146f01e20ece63d83c8916d8fb"
 
 HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
-SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
 # v2026.03.19-010002

-- 
2.53.0


