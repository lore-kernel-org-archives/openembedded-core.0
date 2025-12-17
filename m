Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F2D2D6555B
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 12:17:26 +0000 (UTC)
Received: from bumble.maple.relay.mailchannels.net (bumble.maple.relay.mailchannels.net [23.83.214.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13291.1765973842231426733
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 04:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=nwAtRyf2;
 spf=pass (domain: rootcommit.com, ip: 23.83.214.25, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id A507E5419C0
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:17:21 +0000 (UTC)
Received: from de-fra-smtpout7.hostinger.io (100-109-2-65.trex-nlb.outbound.svc.cluster.local [100.109.2.65])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 04058540814
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:17:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765973841;
	b=uYMVgnpyudt3ZgD/x3LoUXeTg76+3fgF4+Buw9/AgVBsm9jr0gEBV8i/8jJpWzKGH64Hqk
	vBFtllINOdFh/4t+KFDanomRMYKB9DZV9OTbk7HFuNOq0FtStlo+C993rIMdYNGmovfBiP
	B/y75dgyvllvdedJaHmoZwvf2DwkvptYUxoPfWesQE1ZXt9026Mi9Jr7jKByMSMkmmSL63
	MPT3/MrOcQNwUK/zbkzpoHxhvECW3EhEswIwlOqiLBjmzVXjbHXPQI4cZhaGUgy9/NLIkg
	VsH3cdjmpHMWWnMvLG1SVbXjhO7Yl8O7bHvHuhtFSr3s5CtiCB7LZRMBjAgwfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765973841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=eEYxLYju4z4EVLWNfoShMB5Qgkc7XNa7GF450IS6Q8c=;
	b=fABEE8HX47oAXm0/qcLreFAgq4NqNLwgFhXyDTQsLmQGF60oaO2tGjycrLVnobDL1zDo58
	JzaWaSOzvsC+EJzPYZ7O9qQ2ceD9QhjFw0sf+qQGAzT1pwIrjzzI3+nqN//bchad/ZqO3C
	2YfKYkOLdIFfg6FB+Qe4kU7aCnFNS3HXxIrln7ZT3530OPAeb/xLjr5jGNYpLyIh5pDkg4
	8EnDmzwW9/c6AtH+hnGocXcnlkJfe7t0C5VHBEgEktS+ty7H32Ee/g2x42tH/jfT2wRonO
	W70sRkvtpKhk9NxMGjidZ5/VqyIvpOdJubeKN1zwVWS9PrVo01ihXr48s5a0kw==
ARC-Authentication-Results: i=1;
	rspamd-6ccd5b4cc5-69dlj;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Cellar-Share: 25dd1d956a06b643_1765973841545_1384765014
X-MC-Loop-Signature: 1765973841545:1145612791
X-MC-Ingress-Time: 1765973841545
Received: from de-fra-smtpout7.hostinger.io (de-fra-smtpout7.hostinger.io
 [148.222.55.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.109.2.65 (trex/7.1.3);
	Wed, 17 Dec 2025 12:17:21 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:8e2b:fce5:ec42:f176])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dWXqM18Jkz46kK;
	Wed, 17 Dec 2025 12:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765973839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eEYxLYju4z4EVLWNfoShMB5Qgkc7XNa7GF450IS6Q8c=;
	b=nwAtRyf2Yf1bBbxbA5VGFdSXEbWTMyOJn/rDB6D+jPMYbOhnnVEzaAzoKfIltefWutHfa9
	IKgI6d4fodejK2XMSWIkRFV9woVB4Ptjy0AdXZ2ROgsmoYFrXgrNZGQ+RZ8I12RvU5xP4/
	9yAScZPKbHrw8HcUwSzPMK1x0MW+paBkLvCs22sIXQi4aHzjo8SBrBP4iv/xg2UmLcbc+I
	6IHh0fRRgAFKLvz8GsKuMg9KWNbw5QlT/w6EK2vESF0Hmg4g1CsFqpc+pPgfWgBNKvnNBe
	h0lKXntEMC/I1UpTrDBbeJ9loKIaCPcQebbLUXjIQXkoJIRgM9DW32S9T8sJYw==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 3/5] alsa-tools: upgrade 1.2.14 -> 1.2.15
Message-ID: <20251217121705.391288-4-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217121705.391288-1-michael.opdenacker@rootcommit.com>
References: <20251217121705.391288-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 12:17:19 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=69429f4f a=JY/OoRUBqPoXaiLUhbiEKg==:617 a=xqWC_Br6kY4A:10 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=MWf8dILs5OcirjABKMoA:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfLu2sNLMStNBhwV7LQCMgNvqaZK9RRMVZunRril+MrmPEi8v/BVxfjshMwyakc5cqA6Mg6cMRAaXXUG5lsjzMHgbiRE8HShgulc1AGfFbw667yKfYPu8 rq8plbKn8rSJ2VziOezqd8QRx979PIx2sfdjBPtBGZNTteRfADuVxMy2MByBcBJEOga/zr6HjXxnATkoEdpItw/9/B3z9ahKJSizML1/tnE8g4POlaRvNQPQ +BYAv/apRtFAoiIiQ3FA/rq5mVyLGMEtllPHffDN+SaXbspz5C6VZQNDPbYFx7WU1H/pLg8Co8v+J1KIEQALotz23yYbj1T1tYaF1rYXifb9jjmIgb0XslLN yX0LIzDb
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228028

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Upstream changes:
https://www.alsa-project.org/wiki/Changes_v1.2.14_v1.2.15#alsa-tools

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 .../alsa/{alsa-tools_1.2.14.bb =3D> alsa-tools_1.2.15.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.2.14.bb =3D> alsa-tool=
s_1.2.15.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.2.14.bb b/meta/rec=
ipes-multimedia/alsa/alsa-tools_1.2.15.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-tools_1.2.14.bb
rename to meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb
index 751d9e8a76..1228176fb9 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.2.14.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "file://hdsploader/COPYING;md5=3D5=
9530bdf33659b29e73d4adb9f9f65
=20
 SRC_URI =3D "https://www.alsa-project.org/files/pub/tools/${BP}.tar.bz2"
=20
-SRC_URI[sha256sum] =3D "faef6fdd39ec79c9a5473dc63aa1b6331bf7664a9d452a0a=
8198cec7016cbc6f"
+SRC_URI[sha256sum] =3D "800498d35233672ef67f4bf74cc6e1d37e1fe70c0540e2d2=
e062f2319e7b5df7"
=20
 inherit autotools-brokensep pkgconfig
 # brokensep as as10k1 (and probably more) fail out of tree

