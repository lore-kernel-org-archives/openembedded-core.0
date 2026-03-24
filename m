Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F01E9A761
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 10:28:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16734.1774348132994548692
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 03:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ji/AE2jv;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1E683C58097
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:29:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D03D46011D;
	Tue, 24 Mar 2026 10:28:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F2C6104511E8;
	Tue, 24 Mar 2026 11:28:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774348130; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=wt/PJ5+3QUZmhG0nb853VOWAc5fZjL/hz+uwgN7MuA4=;
	b=Ji/AE2jv+pvq0DNNGQmoioyrqS3RRXAl5AsXl4cWZhubjyIiUMOBwun4Zq53/C3dZ1Y2Yt
	mB8vRJbmxUIOZU4Gr608vtl34+K62to0e32wkrdQVPR4BipxDVNoqOLxC1bxG2NYr1Rxma
	1ziNNTvEwqh6zJS9gSjSHodex1IsJs7SuUXOTaa2j89lH0/K4Il4WVmfg5nzTMdJAt+AmQ
	ihioVIJE0mxYr0yr5ZwqA76QQBrW3fD0bZOCP0ZlqezPKLy9DRpPYTHk11XeJJPTeW1z4W
	/si3/KOBdpI9bPQCkeGutEloKPQssy/FCPgipIe0/KH38lETKwBqxqifXWJcIw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Subject: [PATCH v8 0/2] sbom-cve-check: add CVE analysis tool and class
Date: Tue, 24 Mar 2026 11:28:35 +0100
Message-Id: <20260324-add-sbom-cve-check-v8-0-6c2e84e637ad@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XRzUrEMBAH8FdZcjaS77R78j3EQzKZ2KDbSLMEZ
 em7my6IxQY8/gfmNzPMjRRcEhZyPt3IgjWVlOcWhocTgcnNr0hTaJkIJgwTQlIXAi0+XyhUpDA
 hvNEoleHKc2UDkNb4sWBMn3f0+aXlKZVrXr7uMyrfqj+c6nGVU0Y5WBN9sJFx/+Rzvr6n+RHyh
 WxgFXtEdxHREMQYnRi0Hxk/InKPmC4iGyLQMCVkVEHqI6J+Ecl5F1ENiQoNKEAcwB0RvUfGLqK
 3cyRnAGjlOIYjYv5HTEMggtE2OGe8PSJ2h/SfXW1DBsvQD8iVdn82Wdf1G+uyoIZUAgAA
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
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:28:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233783

This patch series introduces the `sbom-cve-check` tool and its
dependencies. The tool requires `python3-spdx-python-model`, which has
the following build-time dependencies (not required at runtime):
- `python3-hatch-build-scripts`
- `python3-shacl2code`

Note: This part has already been merged into master.

Additionally, this series includes a post-build CVE analysis class,
similar to the existing `cve-check` functionality, which this v8 version
aims to provide.

This v8 series requires `sbom-cve-check` in version 1.2.0, which is
provided by the following patch: ("python3-sbom-cve-check: Update to
release 1.2.0") [4].

The series is split into two commits:
- The main part, which provides the `sbom-cve-check` class.
- A second commit that enables the use of the `sbom-cve-check` internal
  fetcher.

This is split into two commits because we may want to merge only the
first one if there is too much discussion about the second commit.

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
Changes in v8:
- Take into account Antonin Godard suggestion: Directly unpack the git
  repository to the deploy directory.
- Link to v7: https://patch.msgid.link/20260323-add-sbom-cve-check-v7-0-870eb8e145ad@bootlin.com

Changes in v7:
- Fix commit message, the databases are not longer extracted in DL_DIR.
- Add bitbake-config-build enable-fragment command in comment.
- Always use sbom-cve-check for directory name instead of sbom_cve_check.
- Change extension (suffix) for generated files, it is now:
  - .sbom-cve-check.spdx.json.
  - .sbom-cve-check.yocto.json
- Move recipes to recipes-devtools/sbom-cve-check/
- No longer install the database .rev file, and use ALLOW_EMPTY:${PN} = "1".
- Split the usage of sbom-cve-check internal fetcher to a separate commit.
- Link to v6: https://patch.msgid.link/20260319-add-sbom-cve-check-v6-0-cfc657daa6b7@bootlin.com

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
Benjamin Robin (2):
      sbom-cve-check: Add class for post-build CVE analysis
      sbom-cve-check: allows to use network and internal fetcher

 meta/classes-recipe/sbom-cve-check.bbclass         | 127 +++++++++++++++++++++
 meta/conf/distro/include/maintainers.inc           |   2 +
 meta/conf/fragments/yocto/sbom-cve-check.conf      |  14 +++
 .../sbom-cve-check/sbom-cve-check-config.inc       |  20 ++++
 .../sbom-cve-check-update-cvelist-native.bb        |  12 ++
 .../sbom-cve-check/sbom-cve-check-update-db.inc    |  21 ++++
 .../sbom-cve-check-update-nvd-native.bb            |  12 ++
 7 files changed, 208 insertions(+)
---
base-commit: 531f87111d83430615f2e20dd41a3dd5fc25c7ab
change-id: 20260223-add-sbom-cve-check-f34614b147dc

Best regards,
--  
Benjamin Robin <benjamin.robin@bootlin.com>


