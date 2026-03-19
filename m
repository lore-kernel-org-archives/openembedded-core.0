Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DC81090242
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 15:42:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14182.1773934949880350166
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 08:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IQYYVaQN;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 077631A2ED8;
	Thu, 19 Mar 2026 15:42:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CF9955FDEB;
	Thu, 19 Mar 2026 15:42:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02C7010450A64;
	Thu, 19 Mar 2026 16:42:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773934947; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=qiYMUbU6UV/q0nRsGISzH/GUFVWP0vXtBXrJJFDBf9Y=;
	b=IQYYVaQNuYqSqN8ZW9J6WXESfGTFhlGXGI5W6aK3LrtKD9Qfe8b7jmAMZAf4pz3mEJXm4m
	FTcs0IBGty9ExN+8QAtbx1W40ZYh3u7cR2pYhxS8lCxrRmtt8k6Q96cH6cQ3/u9CjKuBuB
	LMlVNF1JDE+8qAVQsAJMS9o9UERiv6URupsDb5ExnPiS4QLMTjXW0Ss+/cc7+sLBu1ysvP
	ugNfYTOvH3e5WD/Qr/jfub9eQAzj3aE+F7QTOgq2Y7SweCiQrjdKzI9QTzb0f4yNXuchSy
	s1RV+WDLEPsezgWT6C9g5w8hL3I/LGVipAJQGFKzYRp6t7kZr9owtZnIfyUxwQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Subject: [PATCH v6] sbom-cve-check: add CVE analysis tool and class
Date: Thu, 19 Mar 2026 16:42:20 +0100
Message-Id: <20260319-add-sbom-cve-check-v6-0-cfc657daa6b7@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23PwUrEMBCA4VdZcjaSSSbp1pPvIR6aycQG3UaaJ
 ShL3910Qay0x39gvmFuovCcuIin003MXFNJeWrhHk6CxmF6Y5lCa6GVdkprI4cQZPH5IqmypJH
 pXUaDDtADdoFEW/ycOaavO/ry2npM5Zrn7/uNCuv0l8MjroJUEqhz0YcuKvDPPufrR5oeKV/EC
 la9RewhohvCHOOgz9b3CvaI2SLuEDEN0ewUahMxGLtH8A8xAIcINiQiO0JiPtOwR+wW6Q8Ru75
 jQBFxZ/o+/EeWZfkBjKUbt8oBAAA=
X-Change-ID: 20260223-add-sbom-cve-check-f34614b147dc
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, rybczynska@gmail.com, 
 ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15-dev
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 15:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233532

This patch series introduces the `sbom-cve-check` tool and its
dependencies. The tool requires `python3-spdx-python-model`, which has
the following build-time dependencies (not required at runtime):
 - `python3-hatch-build-scripts`
 - `python3-shacl2code`

Note: This part was already merged into master.

Additionally, this series includes a post-build CVE analysis class,
similar to the existing `cve-check` functionality, which this v5 try
to provide.

This v5 series requires sbom-cve-check in version 1.2.0 which is
provided by the following patch ("python3-sbom-cve-check: Update to
release 1.2.0") [4].

For context, `sbom-cve-check` is a lightweight SBOM CVE analysis tool,
which supports SBOMs in SPDX 2.2 or SPDX 3.0 formats. The tool is
designed as an efficient replacement for the `cve-check` logic currently
available in Yocto Project. It fetches data from multiple databases,
including NVD and the CVE List, and supports various annotation formats,
such as OpenVEX and the Yocto Project's custom VEX manifest.

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
[4] https://lore.kernel.org/r/20260317-update-sbom-cve-check-recipe-v1-1-49b50bf80bf2@bootlin.com

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
Changes in v6:
- Add missing BB_CONF_FRAGMENT_SUMMARY/BB_CONF_FRAGMENT_DESCRIPTION.
- Link to v5: https://patch.msgid.link/20260319-add-sbom-cve-check-v5-0-e310cce7399d@bootlin.com

Changes in v5:
- Use "cve-tou" license for sbom-cve-check-update-nvd-native.bb
- Use internal Bitbake fetcher to download the git repository.
- Execute sbom-cve-check with --disable-auto-update flag (require 1.2.0).
- Add meta/conf/fragments/yocto/sbom-cve-check.conf config fragment.
- Link to v4: https://patch.msgid.link/20260311-add-sbom-cve-check-v4-0-f4e6c4cee8ca@bootlin.com

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

 meta/classes-recipe/sbom-cve-check.bbclass         | 121 +++++++++++++++++++++
 meta/conf/distro/include/maintainers.inc           |   2 +
 meta/conf/fragments/yocto/sbom-cve-check.conf      |  14 +++
 meta/recipes-core/meta/sbom-cve-check-config.inc   |   4 +
 .../meta/sbom-cve-check-update-cvelist-native.bb   |  12 ++
 .../recipes-core/meta/sbom-cve-check-update-db.inc |  28 +++++
 .../meta/sbom-cve-check-update-nvd-native.bb       |  12 ++
 7 files changed, 193 insertions(+)
---
base-commit: 531f87111d83430615f2e20dd41a3dd5fc25c7ab
change-id: 20260223-add-sbom-cve-check-f34614b147dc

Best regards,
--  
Benjamin Robin <benjamin.robin@bootlin.com>


