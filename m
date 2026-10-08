Return-Path: <l.stach@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB342CA600D
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 17:37:45 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.480.1791481058794691635
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 10:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@pengutronix.de header.s=20260414 header.b=RV70pnwI;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: l.stach@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id BF7CC20052C;
	Thu, 08 Oct 2026 19:37:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791481055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=km4zcZqtaC54ryP2QRagDsA9+MCguoPAV6ForbY2+I0=;
	b=RV70pnwI2Mmikg/Id9N6kojCllsHvz8RO7JEw6T2nlnX2/2lQgityAYxD7luWG69fKISJ7
	Q1k+7g3Zks3fFYARbce1I75iDQXgf98rLHHuvohG1O5CEFdbyhareBRdZJ8kmEWFYpwcjm
	gAWKoe/l9dikVFzyfzACAK0n+XP7YAAqOnlxSgY7Qne1vA8zldzuDJEU7716arMbSDHuNE
	0NbXWIp+bUqSrcxWDyxBx4S+kvgIo489TuiqG8pSJ/E/VFBuxClpb/F3vyBxzsm9Fm5j2I
	JuUhOjOdVOjiwfz+AK/gxGRVpXKdQ3mBIpaxbMb8o1joBemktDXpctOL5SAvSw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791481055; a=rsa-sha256;
	cv=none;
	b=O9UBe0evxCtHZgOIrwfNnidsI+5It0bYqLD8s2JEHnu4uw7iB3y605Wah8TPot1FWdJ5n5
	MOeZ4+iyo2n4o7qpcd8QF8Z00eZ/SX0Pd52vDlAsxO9EhCiR+GPIyN4ZKJImDTJwyxDdcb
	LWEL6octqFjWydLbF7Bf3qGxG0CUtZ5eI+7sBgRtqvFnJAMBw4lMA5xkK64YFHd6ArneFH
	L1oTiyFfDu9ezfXmH+F12LHJFd3DgDtqZEMkeHR4ATHJdcFG7Ftkf83yJY7eOdL0fAMglZ
	0KCeBum6mwDkHXNv69eBWUmw4ik0/nbhAqT05j4yxQhedfvQDgb1klwRnX6+Jw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=l.stach@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791481055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=km4zcZqtaC54ryP2QRagDsA9+MCguoPAV6ForbY2+I0=;
	b=cT2GC3sLrhwlYoeAB57fc7nCqbRXK0wYaH9TwnDr4zTotvzdLziVL5N9hoKFrOX8K2ZGu5
	+VKITfZbYrP+sI1/FwbeN51+ZeumFnN0107SKkwdi+xCIaOth1euO5KKhjilFBSQfYbcxN
	eTVDFKtRulhMI++FsG7nEojG624B8N5xtuFMNocv/yPxfjtUB/C4H03JCUjXzIuFPH3mAw
	34FYpVABIX1LyZfW5FxB85TjolnEydu1CeA7TBO52xHMXmyAtoMtBG9JLOTqJ+DgnFazO8
	kijBvMDex3giIAZUUs0RJrx5q9uBUhMUYJAPBcAJGRShuhYDO9FRSHg3tf8btg==
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <l.stach@pengutronix.de>)
	id 1xEs3j-004v1u-22;
	Thu, 08 Oct 2026 19:37:35 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH] barebox: inherit upstream-stable-release-point
Date: Thu,  8 Oct 2026 19:37:35 +0200
Message-ID: <20261008173735.2348051-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 17:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247437

Barebox uses a vYYYY.MM.stable versioning scheme, with the stable
releases only carrying bug and security fixes. Thus we can use
the upstream-stable-release-point class to mark those releases as
suitable for inclusion in the oe-core stable series.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
This patch is applicable to both master and the wrynose stable branch.
---
 meta/recipes-bsp/barebox/barebox.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/barebox/barebox.bb b/meta/recipes-bsp/bareb=
ox/barebox.bb
index a48d97941cc0..583fde5d187e 100644
--- a/meta/recipes-bsp/barebox/barebox.bb
+++ b/meta/recipes-bsp/barebox/barebox.bb
@@ -6,5 +6,5 @@ Linux kernel driver API for making driver porting easier,=
 \
 and a subset of the POSIX C library for writing more command-line utilit=
ies."
=20
 require barebox-common.inc
-inherit barebox
+inherit barebox upstream-stable-release-point
=20
--=20
2.47.3


