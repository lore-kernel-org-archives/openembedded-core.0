Return-Path: <jeremie.dautheribes@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58338CD343F
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 17:02:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80917.1778605350367997936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 10:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=JySyDA8b;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: jeremie.dautheribes@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4F8B14E42C00
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 17:02:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F11660646
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 17:02:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C41BF11AF8D50;
	Tue, 12 May 2026 19:02:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778605343; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Vm/bybd2Ztvuafna8JrpyNLbHmbQathLuPd+O2eHrUs=;
	b=JySyDA8bh72QcGMEOM3D2FUcJi9v2FYP01SqkC7jtZkNjVlBFLG0+ccznJRB1hLBaGHKEH
	tNubkZ57DRzZX7MqfCgxfiQjbdDT2W0ga7WhAn3TL5dnCFl4akHNVaVORsQQSOL4h9lFzQ
	pWlusicjbuUweypZwulDhhT9ph4znm+ZRjkPO8v/XoCl0lKzQf/yMFGqsl5U1GpLKoK7je
	D/qoCKEVJ93HRPWDVSbEL7GP+Z8osKrSRvQ9jMnFLgAO06se9Ha1vyCxqifoNqFE+a4/zW
	b5TQtcUHiwwXMstZTW0P7LvzGYT4iTEqY7tfk6PHasJ+Yf8eCqdLg+XImk7bqw==
From: =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes_=28Schneider_Electric_=29?= <jeremie.dautheribes@bootlin.com>
Subject: [OE-core][PATCH 0/2] spdx3: support SBOM compression with Zstd
Date: Tue, 12 May 2026 19:01:55 +0200
Message-Id: <20260512-sbom-zstd-support-v1-0-93273381d548@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTsJrVHQvWsPQFjYdtAxkTYzx
 RgJd7fC8i3+n0FJmBTO1QxCb1aOY4HZVeAft/FOyKEYbG2P9cFYVBdf+NUcUKeUomRsXDg5s29
 bQxZKl4QG/qzPrt+sk3uSz/9Rd72gj0I9LMsPIHtsQn4AAAA=
X-Change-ID: 20260512-sbom-zstd-support-7bd9b13881e2
To: openembedded-core@lists.openembedded.org
Cc: =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes_=28Schneider_Electric=29?= <jeremie.dautheribes@bootlin.com>, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 benjamin.robin@bootlin.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765;
 i=jeremie.dautheribes@bootlin.com; h=from:subject:message-id;
 bh=Hr1Aid3bOpV6KqpEaMEC6bHCVoI8Lt+GvuZJ3UVXHKs=;
 b=owEBbQKS/ZANAwAKASsAXqAbWo8DAcsmYgBqA10d9yHatQkRhJzdp1Wg4UvHxmIDqGiKzAhol
 ammR78LmvqJAjMEAAEKAB0WIQT7FK2Qhtu4QpBIBAkrAF6gG1qPAwUCagNdHQAKCRArAF6gG1qP
 Ayl9EACP1XU9dfx9Tql4NeWLrNP+obJ1Wju2PLm3rvUcYCxeiKmcM1KNkq/I/zVBGyHlWM7Fdee
 CqI5QLr2TXEXjXUit1FWpOVDCBxJ+fjcDynicXLAAHcCfeEnEzR0GpgABCbOzzq5cIftffOyDju
 vs/RlCrVl1lQhgvxOwzbGPJioP3ICzzwv8Q63Qi72pXlwsQlYohQU4vbtwBaKsyJaMcuWKBWASk
 9zSMbhvcWzvVpMpyjnTZ3WNOxrYLvwprEE20i82CglwrFKk2n2S4xLokgZurwHgiotOXtXqWe07
 fvnNb6356DPIZytj62D8iPf2f0S1EuGIjWwCBKAFcXPrlx1xB36LIN4Eg38Toe0qPj8r/38cUyF
 BI9gJuFdhXd297ZDiz8qj5u13N+ZsixCNrYPz8COBE8f4N/ZlD85oQDQGPzRdfqbt3vfZfdH2RS
 SHFWnWkSAPaHIIAPkRbycEN4Zv0fimQKrAyjyGybyGiKGqAdKVzuaHqeE5A3JvYbTiDoPPpf8dS
 7RqVqrfhz/g3QYzY+NjwHsz0FcPO3HuSou7NowJnYY7JkIjCkmvvkyO20xD7WsSRMNv+06xLfFE
 itUQCJM72ybHn2RE30EHMZgBE5r0vK2iKvBw3V0UHzY83EH2+FLjqFYvA1ShmTNEM/4GrlI+cqm
 +mb2HBy68Hxpgkg==
X-Developer-Key: i=jeremie.dautheribes@bootlin.com; a=openpgp;
 fpr=FB14AD9086DBB842904804092B005EA01B5A8F03
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 17:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236895

Hi,

This patch series adds support for compressing all types of SBOMs (image,
recipe, SDK) using zstd, similar to what we had previously with SPDX 2.2.

To do so, we introduce a new SPDX_SBOM_EXT variable containing the SBOM
extension name. Based on this extension, we decide whether SBOMs should b=
e
compressed or not.

This is optional and by default SBOMs are not compressed to keep the
current behavior and not to break compatibility.

This work was tested on the qemuarm64 machine on the following SBOMs:
  - core-image-minimal SBOM (image SBOM)
  - busybox SBOM (recipe SBOM)
  - core-image-minimal SDK SBOM (SDK SBOM)

At first, instead of SPDX_SBOM_EXT, I used a boolean SPDX_COMPRESSED_SBOM
variable to decide whether or not a SBOM should be compressed, but it led
to a lot of code additions to SBOM consumers (for instance sbom-cve-check=
)
to check whether the SBOM filename extension was ".spdx.json" or
".spdx.json.zst".

Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
---
J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) (2):
      spdx3: introduce SPDX_SBOM_EXT variable
      spdx3: support SBOM compression based on SPDX_SBOM_EXT

 meta/classes-recipe/sbom-cve-check.bbclass |  2 +-
 meta/classes/create-spdx-3.0.bbclass       |  4 ++++
 meta/classes/sbom-cve-check-recipe.bbclass |  2 +-
 meta/lib/oe/sbom30.py                      | 11 +++++++++--
 meta/lib/oe/spdx30_tasks.py                | 12 +++++++-----
 5 files changed, 22 insertions(+), 9 deletions(-)
---
base-commit: 4f7d1a0885d7d6f2a533f7388ed5f5a35d6f99bc
change-id: 20260512-sbom-zstd-support-7bd9b13881e2

Best regards,
-- =20
J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremie.dautheribes@b=
ootlin.com>


