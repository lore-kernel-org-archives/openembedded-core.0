Return-Path: <dwagenknecht@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20403C88E53
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 13:05:35 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22415.1789477528440499034
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 06:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=pIUz83qo;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=pIUz83qo;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: dwagenknecht@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1789477525;
	bh=5lJVhSG/+dHxXv3C7/dgfkdmOEiFfCGgEx1gOO4vHyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pIUz83qoxHOknRnmyPDRowWIjrdOx/JfIGd2yOcHpL7YMRW673pkL4lFDc4PlOBqu
	 HPgKGY3Eq6oXxbe2ArIYKHqPLhHtGLVQ3fQHsVXVGesea8EGPBAAd5+3FMDBOnkQkH
	 cAkazIZ7rKlDDvxBFdvGNxI8jLCV5Cp9nIcHIIhFb9hju/8cdphDNL32FNgiosS3Fb
	 Bgk/unVl8OK515hn3HQkv9f3UTIsmqQnSIJAvusn+PvKZSY/9WQ4r16gW04GUHJhGA
	 mLIjYXMvQ1WBFsoRoOLcNa2jKKowc+i3Lr1WG2RMEy7Hzng24vUATOkT32NtQFRRMc
	 c1zVv/8gKnykw==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id DB3585F7E1
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 15:05:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1789477525;
	bh=5lJVhSG/+dHxXv3C7/dgfkdmOEiFfCGgEx1gOO4vHyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pIUz83qoxHOknRnmyPDRowWIjrdOx/JfIGd2yOcHpL7YMRW673pkL4lFDc4PlOBqu
	 HPgKGY3Eq6oXxbe2ArIYKHqPLhHtGLVQ3fQHsVXVGesea8EGPBAAd5+3FMDBOnkQkH
	 cAkazIZ7rKlDDvxBFdvGNxI8jLCV5Cp9nIcHIIhFb9hju/8cdphDNL32FNgiosS3Fb
	 Bgk/unVl8OK515hn3HQkv9f3UTIsmqQnSIJAvusn+PvKZSY/9WQ4r16gW04GUHJhGA
	 mLIjYXMvQ1WBFsoRoOLcNa2jKKowc+i3Lr1WG2RMEy7Hzng24vUATOkT32NtQFRRMc
	 c1zVv/8gKnykw==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id CB1595F7D7
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 15:05:25 +0200 (CEST)
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Wagenknecht <dwagenknecht@emlix.com>
Subject: [PATCH v2 0/2] Add meta layer information to spdx
Date: Tue, 15 Sep 2026 15:04:58 +0200
Message-ID: <20260915130509.2184318-1-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <DLFQEDRDYFEW.1N7Q1KDCOBXUD@bootlin.com>
References: <DLFQEDRDYFEW.1N7Q1KDCOBXUD@bootlin.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 13:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245840

v2 of the patch series to fix the build failures on the autobuilder repor=
ted by
Antonin Godard.

The questions from the initial patch series are still open and additional=
ly
the final document seems to be deployed from sstate cache even if inputs =
(layer
revisions) change. Please continue to consider this as a draft for discus=
sion only!

v2:
- fix build failures on clean build (layers.spdx.json created before bitb=
ake.spdx.json)
- rebase onto current master branch
- remove commented out parts for overwriting the layer commit id


Daniel Wagenknecht (2):
  spdx: add entries for meta-layers
  spdx: link files to the meta-layer providing them

 meta/classes/create-spdx-3.0.bbclass |   1 +
 meta/classes/spdx-common.bbclass     |   3 +
 meta/lib/oe/sbom30.py                |  12 +++
 meta/lib/oe/spdx30_tasks.py          | 116 ++++++++++++++++++++++++++-
 4 files changed, 128 insertions(+), 4 deletions(-)

--=20
2.54.0


