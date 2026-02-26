Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FEEFD8FDA
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 17:01:42 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74935.1772125294603165314
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 09:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wG5Hrd3U;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8368C1A1577
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 17:01:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5746D5FDE9;
	Thu, 26 Feb 2026 17:01:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E9A7103693FF;
	Thu, 26 Feb 2026 18:01:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772125287; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=DYM0EJIDTvoOvhVgjt8xm5dKHMMR4dcYwu3P0YMoDGA=;
	b=wG5Hrd3U+Xq3KhoWCsfUXToDrx5Hh5LhuxqFhwF1M+oWerg0p8q7n4mez2dSixUSj8u2R+
	dts6UHL1Kuj44zRNRHT02HdBLCEYc95Ls/6tGKjlbR5srtaAfa7VY81RzJyYkurDJHyST5
	y7wfEiJYcmIXk67g2JCnAYF0feSUav6ikR41iEC/ESWU+nHxf5viJ7ZwP4FyAK4NXgkzUm
	lse+q6TIM9Eszx2ZD0KFazg5Rri482m5ULaj2W5DMkHcaSgkd8bfP+8+hwVSYaB6CrU83r
	VKOqW6And8INWOwlPAtqNcdHMIqWasiWkDgxTTAKeWzfuEixSGWgJkWYH45kSQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Subject: [PATCH v3 0/6] sbom-cve-check: add CVE analysis tool and class
Date: Thu, 26 Feb 2026 18:01:14 +0100
Message-Id: <20260226-add-sbom-cve-check-v3-0-2e60423f4d35@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NQQrCMBCF4auUrB1JpmmrrryHuGiSiQ3aRpISl
 NK7mxYEhS7/B/PNxCIFR5GdiokFSi46P+QodwXTXTvcCJzJzZBjzRFLaI2BqHwPOhHojvQdbCl
 rIZWQjdEsHz4DWfda0cs1d+fi6MN7/ZHEsn45ucUlARyEbmqrTGO5UGfl/fhww177ni1gwl+k2
 kQwI0TWtnio1JGLf2Se5w+pVpn9+wAAAA==
X-Change-ID: 20260223-add-sbom-cve-check-f34614b147dc
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 17:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232039

This patch series introduces the `sbom-cve-check` tool and its
dependencies. The tool requires `python3-spdx-python-model`, which has
the following build-time dependencies (not required at runtime):
- `python3-hatch-build-scripts`
- `python3-shacl2code`

Additionally, this series includes a post-build CVE analysis class,
similar to the existing `cve-check` functionality.

`sbom-cve-check` is a lightweight SBOM CVE analysis tool, which
supports SBOMs in SPDX 2.2 or SPDX 3.0 formats. The tool is designed as
an efficient replacement for the `cve-check` logic currently available
in Yocto Project. It fetches data from multiple databases, including NVD
and the CVE List, and supports various annotation formats, such as
OpenVEX and the Yocto Project's custom VEX manifest.

For export, `sbom-cve-check` can generate a SPDX 3.0 file, a
`cve-check`-compatible JSON file, and a summary report that lists all
vulnerabilities per component, styled similarly to the output of the
Yocto Project's `cve-check` class.

For more context on the inclusion of `sbom-cve-check` in OpenEmbedded
Core, see the discussion [1].

For detailed documentation about `sbom-cve-check`, visit [2].

After the inclusion of SPDX3 Joshua changes ("Add SPDX 3 Recipe
Information") in OE-Core [3], and after the release of sbom-cve-check
1.2.0, I am going to submit a very small follow-up series.

[1] https://lists.openembedded.org/g/openembedded-core/topic/117638558
[2] https://sbom-cve-check.readthedocs.io/
[3] https://lists.openembedded.org/g/openembedded-core/message/231519

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
Changes in v3:
- Improve first commit message about sorting maintainers.inc.
- Add missing maintainers information for sbom-cve-check-update-*-native
  recipes...
- Link to v2: https://lore.kernel.org/r/20260225-add-sbom-cve-check-v2-0-eeffa285b901@bootlin.com

Changes in v2:
- Sort maintainers.inc list in alphabetical order.
- Add missing maintainers information for new recipes.
- python3-spdx-python-model depends on native shacl2code and
  hatch-build-scripts recipes.
- Link to v1: https://lore.kernel.org/r/20260224-add-sbom-cve-check-v1-0-1c76fbd7f01b@bootlin.com

---
Benjamin Robin (6):
      maintainers.inc: Sort list in alphabetical order
      python3-shacl2code: add recipe
      python3-hatch-build-scripts: add recipe
      python3-spdx-python-model: add recipe
      sbom-cve-check: add recipe
      sbom-cve-check.bbclass: Add class for post-build CVE analysis

 .../sbom-cve-check-update-db.bbclass               | 87 ++++++++++++++++++++
 meta/classes-recipe/sbom-cve-check.bbclass         | 96 ++++++++++++++++++++++
 meta/conf/distro/include/maintainers.inc           | 74 +++++++++--------
 .../meta/sbom-cve-check-update-cvelist-native.bb   |  7 ++
 .../meta/sbom-cve-check-update-nvd-native.bb       |  7 ++
 .../python/python3-hatch-build-scripts_1.0.0.bb    | 12 +++
 .../python/python3-sbom-cve-check_1.1.0.bb         | 17 ++++
 .../python/python3-shacl2code_0.0.24.bb            | 17 ++++
 ...enerate-bindings-allow-to-use-local-files.patch | 58 +++++++++++++
 .../python/python3-spdx-python-model_0.0.4.bb      | 37 +++++++++
 10 files changed, 378 insertions(+), 34 deletions(-)
---
base-commit: c0c2339a52c689be13c96b66c54b11aed227ca04
change-id: 20260223-add-sbom-cve-check-f34614b147dc

Best regards,
-- 
Benjamin Robin <benjamin.robin@bootlin.com>


