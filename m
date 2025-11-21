Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFA6CFA764
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 09:54:25 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8127.1763718862904217623
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 01:54:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=po9oDYTQ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4FD24C10199
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 09:53:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A95EA60719;
	Fri, 21 Nov 2025 09:54:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1456C10371E69;
	Fri, 21 Nov 2025 10:54:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763718860; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Q+kRnjDGZ1CuYRtJGKjZ79JIZZcEUbbkWaZG6QawsxY=;
	b=po9oDYTQJt3LJVrc2+uzddpsXmHnrLTUIy165RCx2k3UdfjRBp8EqXGRUYJztMWn/LP4bP
	gqDaJZe/ouKITmsWyccbPCWBlIS5aAHVzn+dhv8zUZ8cYXuTlVLlV0XS9Ppn8f027jtl2A
	M8pHvIOQMuegkoJWClGFxvMAaObgIQZzhujwsSy0dLfuTt5OZySEtr8sOz6LMF9Mey6iYp
	hAFI5aAjRDPOsDWiN7xng1ZKIEKuWsEMyGh38/InPASENmert8hhXkkEqu8FrHUS89gJlL
	rQKNsiygLeSUZ3u8t1VaRB0RAuH+xwRmD2RQQV2BGbJBFOeCdg58wrWG39E6XQ==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	mathieu.dubois-briand@bootlin.com,
	miquel.raynal@bootlin.com,
	antonin.godard@bootlin.com,
	kamel.bouhara@bootlin.com,
	pascal.eberhard@se.com,
	jpewhacker@gmail.com
Subject: [scarthgap v2 0/5] backport: allow to extract all CVE_STATUS info
Date: Fri, 21 Nov 2025 10:54:08 +0100
Message-ID: <20251121095415.288301-1-benjamin.robin@bootlin.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 09:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226657

(I'm resending this series because it was blocked for spam, sorry for the=
 noise)

Currently only CVEs with "Patched" status are exported in SPDX 3.0 files.
Moreover, CVE annotations provided by the CVE_STATUS_GROUPS variable are =
not
exported, since previously this was only handled by cve-check.bbclass.

Also the vex.bbclass is missing, which will helps users to extract all th=
e
information needed to do a CVE analysis outside of Yocto.

These changes are realized since scarthgap Long Term Support ends in Apri=
l
2028. Without these improvements, it is not possible to do a proper CVE
analysis outside of Yocto, solely based on the SBOM, since there are miss=
ing
CVE annotations in the artifact files. We want to be able to extract all =
CVE
annotations provided by the CVE_STATUS and the CVE_STATUS_GROUPS variable=
s.

With this backport, great care has been taken to avoid breaking compatibi=
lity.
This is why the get_patched_cves() API was not changed. Everything that w=
as
needed is implemented in the associated .bbclass:
 - Patch 1/5 modifies spdx30_tasks to extract all CVE status. This commit=
 was
   not cherry-picked from master.
 - Patch 2/5 backports the vex.bbclass, but modify it a bit to use the ol=
d
   get_patched_cves() API.
 - Patch 3/5 and 4/5 are cherry-picked, these commits move the extraction=
 of
   CVE_STATUS_GROUPS information to lib/oe/cve_check.py
 - Patch 5/5 is cherry-picked to backport a vex.bbclass improvement

This series should be applied on top of [1]:
[scarthgap] spdx30: fix cve status for patch files in VEX

[1]: https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D40=
606

Benjamin Robin (Schneider Electric) (5):
  spdx30: provide all CVE_STATUS, not only Patched status
  vex.bbclass: add a new class
  cve-check: extract extending CVE_STATUS to library function
  spdx: extend CVE_STATUS variables
  vex: fix rootfs manifest

 meta/classes/cve-check.bbclass   |  17 +-
 meta/classes/spdx-common.bbclass |   5 +
 meta/classes/vex.bbclass         | 319 +++++++++++++++++++++++++++++++
 meta/lib/oe/cve_check.py         |  22 +++
 meta/lib/oe/spdx30_tasks.py      |  31 +--
 5 files changed, 365 insertions(+), 29 deletions(-)
 create mode 100644 meta/classes/vex.bbclass

--=20
2.51.2


