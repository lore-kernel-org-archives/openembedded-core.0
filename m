Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D810104BECF
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 10:20:08 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17904.1773224401341548922
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 03:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=X7M1dIzh;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 354F7C41585
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 10:20:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E520260004;
	Wed, 11 Mar 2026 10:19:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A27B10369CA2;
	Wed, 11 Mar 2026 11:19:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773224398; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=tcI0j6tAeFYzvj+nhlQJoVwDmOlRvJiM3dvCfcon3C0=;
	b=X7M1dIzh0uhiqj3kEWUC+zbl+JOIlyj05p8wBAdivhZIscj4pWSpfgcQ1sFPRn8ksasop0
	sMMrhTKCHmsecoADpuCEVpE0SzWe/tpt2NDrdwA3/dE85Rth8xgqtOs0mZFYakayfrq4ej
	NMP0AqGiesJatXmHim4ASt/EskOF8DO5mUohEipG6QLzJ2xeXWj6XQeHsZprRg043TS0Ze
	NZrBEbIg8SxX3/zn64QQKJznhdAi6FlCEQjdPkTZyMBYvoZ3xvBxKe0tR6j09tTkDDM12d
	7SCFySEUAg4pwlYAA9eWFBFQMWFSMwnf5SeH88Iq/8/DckRENH84AQ45uVRRQA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Subject: [PATCH v4] sbom-cve-check: add CVE analysis tool and class
Date: Wed, 11 Mar 2026 11:19:41 +0100
Message-Id: <20260311-add-sbom-cve-check-v4-0-f4e6c4cee8ca@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23N0QrCIBTG8VcZXmfo0bnqqveILqYem9RmzCHF2
 LvnBsGiXf4/OL8zkoi9x0hOxUh6TD760OWQu4KYpu5uSL3NTYCBYgCC1tbSqENLTUJqGjR36oR
 UXGouK2tIPnz26PxrQS/X3I2PQ+jfy4/E5/XLyS0uccooN5Vy2laOcX3WIQwP3+1NaMkMJlgj5
 SYCGUF0roZDqY+M/yNijahNRGQEUDEJwkkryl9kmqYPkPknYkABAAA=
X-Change-ID: 20260223-add-sbom-cve-check-f34614b147dc
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15-dev
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 10:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232861

This patch series introduces the `sbom-cve-check` tool and its
dependencies. The tool requires `python3-spdx-python-model`, which has
the following build-time dependencies (not required at runtime):
- `python3-hatch-build-scripts`
- `python3-shacl2code`

Note: This part was already merged into master.

Additionally, this series includes a post-build CVE analysis class,
similar to the existing `cve-check` functionality, which this v4 try
to provide.

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

[1] https://lists.openembedded.org/g/openembedded-core/topic/117638558
[2] https://sbom-cve-check.readthedocs.io/
[3] https://lists.openembedded.org/g/openembedded-core/message/231519

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
Changes in v4:
- Remove the `nostamp` flag from the `do_sbom_cve_check` task.
- Remove the unnecessary "recrdeptask" on `do_create_image_sbom_spdx`.
  The only required dependency is to run after the
  `do_create_image_sbom_spdx` task of the image recipe.
- Add the `do_sbom_cve_check_setscene` task.
- Update the dependency for the two CVE database-fetching recipes: the
  `do_sbom_cve_check` task now runs after their `do_populate_sysroot`.
- In the two CVE database-fetching recipes, include a file in the
  sysroot containing the Git revision of the fetched CVE database. This
  leverages BitBake's checksum computation for sysroot files to
  determine if dependent tasks need re-execution.
- Add missing `HOMEPAGE` links to `sbom-cve-check-update-*-native.bb`.
- Move the code in `sbom-cve-check-update-db.bbclass` to a simple
  include file. Other layers that may want to add a new recipe to
  download another database can still include it using:
  `require recipes-core/meta/sbom-cve-check-update-db.inc`.
- Rename configuration variables for clarity.
- Add `SBOM_CVE_CHECK_DATABASES_DIR` to define the base directory for
  CVE databases, allowing users to configure an alternate storage
  location.
- Improve documentation for all configuration variables.
- By default, the class now generates a JSON file in the `cve-check`
  format in addition to the exported SPDX 3.0 output.
- Link to v3: https://lore.kernel.org/r/20260226-add-sbom-cve-check-v3-0-2e60423f4d35@bootlin.com

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
Benjamin Robin (1):
      sbom-cve-check: Add class for post-build CVE analysis

 meta/classes-recipe/sbom-cve-check.bbclass         | 115 +++++++++++++++++++++
 meta/conf/distro/include/maintainers.inc           |   2 +
 meta/recipes-core/meta/sbom-cve-check-config.inc   |   4 +
 .../meta/sbom-cve-check-update-cvelist-native.bb   |   8 ++
 .../recipes-core/meta/sbom-cve-check-update-db.inc |  98 ++++++++++++++++++
 .../meta/sbom-cve-check-update-nvd-native.bb       |   8 ++
 6 files changed, 235 insertions(+)
---
base-commit: 57fe3e411faec8cc60853f2e499661f9ede4f453
change-id: 20260223-add-sbom-cve-check-f34614b147dc

Best regards,
--  
Benjamin Robin <benjamin.robin@bootlin.com>


