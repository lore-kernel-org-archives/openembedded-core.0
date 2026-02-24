Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50501F3C99E
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 15:54:04 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23414.1771948441795103698
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 07:54:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Qoov9w9V;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B91DB1A12F1;
	Tue, 24 Feb 2026 15:53:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8E3475FD9D;
	Tue, 24 Feb 2026 15:53:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B96E103691C9;
	Tue, 24 Feb 2026 16:53:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771948438; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=vqI8EpHBxnJC6pSXlNjB1WHWqyaikLJHT0QnPQC7+1o=;
	b=Qoov9w9V3Cj+1arT0j+G1iDHBhnMrEWbKZWWwP5sp/YVVTQu3UpQXnfhO2WCX0cJSJsY5r
	yD2REa+A9BVm9laGNKOrvppA9i1+guDB1t7jIbAgJtCWkQiZf8eLNQniiDZRLX1Gg2RuAl
	02LLRjfhGyYtrwVCk1SM7EheZURH4CP1haPH9PHU9SqRugrNUm4uRPp7DMzil2uQFWf/u4
	ZjrtFuJtYliLcGPgUawQTIODSB8NhEf8FF7tPCDbVgS7UH8woVohcHSjTJPHjWTgWnEKJd
	d61DytxxBXbajPDGDRn/CLZRnpfxlBN88IsCXC9BujCl5ar01wBnXOhDMl+CAw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Subject: [PATCH 0/5] sbom-cve-check: add CVE analysis tool and class
Date: Tue, 24 Feb 2026 16:53:42 +0100
Message-Id: <20260224-add-sbom-cve-check-v1-0-1c76fbd7f01b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSQqAMAxA0atI1gY6oeBVxIVNow3iQAsiFO9uc
 fkW/xfInIQzDE2BxLdkOY8K3TZAcT5WRgnVYJTplDEW5xAw+3NHuhkpMm24WNdp57XrA0ENr8S
 LPP90nN73A5A1H1NkAAAA
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
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 15:54:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231868

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
Benjamin Robin (5):
      python3-shacl2code: add recipe
      python3-hatch-build-scripts: add recipe
      python3-spdx-python-model: add recipe
      sbom-cve-check: add recipe
      sbom-cve-check.bbclass: Add class for post-build CVE analysis

 .../sbom-cve-check-update-db.bbclass               | 87 ++++++++++++++++++++
 meta/classes-recipe/sbom-cve-check.bbclass         | 96 ++++++++++++++++++++++
 .../meta/sbom-cve-check-update-cvelist-native.bb   |  7 ++
 .../meta/sbom-cve-check-update-nvd-native.bb       |  7 ++
 .../python/python3-hatch-build-scripts_1.0.0.bb    | 12 +++
 .../python/python3-sbom-cve-check_1.1.0.bb         | 17 ++++
 .../python/python3-shacl2code_0.0.24.bb            | 17 ++++
 ...enerate-bindings-allow-to-use-local-files.patch | 58 +++++++++++++
 .../python/python3-spdx-python-model_0.0.4.bb      | 37 +++++++++
 9 files changed, 338 insertions(+)
---
base-commit: b8e48562ba273051bcf8cbc62be742ef42a1e622
change-id: 20260223-add-sbom-cve-check-f34614b147dc

Best regards,
-- 
Benjamin Robin <benjamin.robin@bootlin.com>


