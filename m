Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4F9FC619B
	for <webhook@archiver.kernel.org>; Sat,  3 Jan 2026 21:12:08 +0000 (UTC)
Received: from beige.elm.relay.mailchannels.net (beige.elm.relay.mailchannels.net [23.83.212.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31992.1767474722041954716
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Jan 2026 13:12:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=SUapSXcx;
 spf=pass (domain: rootcommit.com, ip: 23.83.212.16, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 804167E1275
	for <openembedded-core@lists.openembedded.org>; Sat, 03 Jan 2026 21:12:01 +0000 (UTC)
Received: from fr-int-smtpout26.hostinger.io (100-113-120-63.trex-nlb.outbound.svc.cluster.local [100.113.120.63])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id D9C7C7E13A3
	for <openembedded-core@lists.openembedded.org>; Sat, 03 Jan 2026 21:12:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1767474721;
	b=0Jdi3hoDjrJi4qtUNnLzsrgFmboUC7GJRq5HvOFEZi2QO0a/vr4mOlgXDAi5PNVAXFRWFT
	k67kSaA77cftuFe0tq6Ct5kxMSKAk3+pJrF7pdxe6g4uLR2DoST50Kb5m3ULbRN4icpDBf
	Gilz5oQR21ZAqjylUtRwpOqXG5QULhXXjwuoY+BYePWHvnA6yH1tqL4jMBcVP2lG5gJlbt
	68knO0NjhKVcer6JcpWj9c2PovcZ0uJsOuzSKaWCrIBTOqIUQ6sdMwArk1fZThwAARB/Or
	oHrSLzdTgJkYVeZOn2CYUkKSWSjm3FKCUtxsPRjtXtXTmpoR2L4dt0nifBWzCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1767474721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Dio2WOeYogrTSfABzSUFEMn4mykQg1QmzkxgHsKVolg=;
	b=ucOCuX5t/SdJkeFPNnitbepbgcm2eYFNpPt2JN/XryF4cioKdWD27sMo0VmL3wNxvWK0kq
	/8TX4syKNQ+QoJKIbVIthG4ePaxVeMxJCICiDSaDwYZWrrkSNSZtIVTc07Yt+p/J3J3AZR
	rXEQ0V0V9ObevWMwrz4G9K7hoqiKgknNq/AkTPlUk9Z+oP9AvajBSI5xPamgQlxYzcMCvu
	9EXpoUUVGOeh4Ds5x8W4tw37kfzhNpfiKBhaLZqpDBoBym1k3oNfIVuapD5/5TKzH4bILw
	3uS8oMLHvX/LGADfloElCTALhaYDwKkVbhJ0QD4U5u9/p4Qd+wbNGWTrKsA0Jg==
ARC-Authentication-Results: i=1;
	rspamd-85db7f4c96-t7gj4;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Turn-Keen: 2cbbc5a453181b9e_1767474721424_4052445017
X-MC-Loop-Signature: 1767474721424:399700286
X-MC-Ingress-Time: 1767474721424
Received: from fr-int-smtpout26.hostinger.io (fr-int-smtpout26.hostinger.io
 [148.222.54.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.113.120.63 (trex/7.1.3);
	Sat, 03 Jan 2026 21:12:01 +0000
Received: from a8.lan (unknown [IPv6:2001:861:4450:d360:a56a:87e3:7fae:367e])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dkCtR0gC6z1xs9;
	Sat,  3 Jan 2026 21:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1767474719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dio2WOeYogrTSfABzSUFEMn4mykQg1QmzkxgHsKVolg=;
	b=SUapSXcxPyy+TAu8z1yuiA3MgowlOMmmjC7qR/eppKsvKz3Oq8G1X6sVevyNwIFrnEOZJ9
	bC1H0iceQPJw9wC372b6wPSRMHgG0UabeAB3g4POqTI/RqvO6pEulCJob4Q5wOpciv2jXJ
	RE7wErGd1Rn4fWsrlJQhMhgcGPwYa/4y+ohThWDFNiGcxcTEu0aX8J/rLpuNO74MrCo0Va
	xlUeYGuSqkI8EPFldytFjg9Q7TvMiCo6GZ33BP/hBiJaY33qlCy/+Xpjjtr5NT6YyIz/7y
	IMKhA5bZz2Nc483j110+iqBkmV8E6FEW4XxHmVzgKhLOFE6TPsEyz7EHKO+Nig==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 4/4] alsa-utils: remove no longer needed fixup
Message-ID: <20260103211155.51433-4-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260103211155.51433-1-michael.opdenacker@rootcommit.com>
References: <20260103211155.51433-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Sat,  3 Jan 2026 21:11:59 +0000 (UTC)
X-CM-Envelope: MS4xfFAZcSaQRj0tEXaghr5TjXGLSeiA73I0SwTSEA6/w0qJgG46SkZbN/1Sbv4rzwHRJyk4m3pNLel9Zsf/dUq+zSHroyNVXYg/0jnWrG7xczyqmeocF9Xi Ud6qIVnXeF4g9U6eOgJ0K3nnRRcQ0nHIztmjzHQFnqcMDMYiIftzmA2Tj1f6vPxCORHXjhpvpD5RZCoVQZ1xehv5vQ432rc5lhPNUaPiDUrPQ0Yu6kGAwgAc 5Cqzt1F/+bgOSTrkTNl8p5BJRdPVO/4OtkEh/+qNuqK6jYZbiSM2oaL8sc+vrCQ80y8lwR9rVQpUB4tq8fO/4UM8DEXHNwv4dU56+bRBMA8=
X-CM-Analysis: v=2.4 cv=NuiDcNdJ c=1 sm=1 tr=0 ts=6959861f a=j106YqD2ESRJk0lKD0wP4w==:617 a=xqWC_Br6kY4A:10 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=2DyfzCoovOxupKlv408A:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Jan 2026 21:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228851

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Was only relevant for build machines with python-docutils,
which is now obsoleted by python3-docutils.

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb b/meta/r=
ecipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
index dad5478f39..f9ee10d240 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
@@ -27,12 +27,6 @@ PACKAGECONFIG[manpages] =3D "--enable-xmlto, --disable=
-xmlto, xmlto-native docbook
 SRC_URI =3D "https://www.alsa-project.org/files/pub/utils/alsa-utils-${P=
V}.tar.bz2"
 SRC_URI[sha256sum] =3D "5ad79f349e59c30c9a4929ad4995ebee33267473e0e632d7=
c1a30e2b093d3327"
=20
-# On build machines with python-docutils (not python3-docutils !!) insta=
lled
-# rst2man (not rst2man.py) is detected and compile fails with
-# | make[1]: *** No rule to make target 'alsaucm.1', needed by 'all-am'.=
  Stop.
-# Avoid this by disabling expicitly
-EXTRA_OECONF =3D "--disable-rst2man"
-
 inherit autotools gettext pkgconfig manpages
=20
 # This are all packages that we need to make. Also, the now empty alsa-u=
tils

