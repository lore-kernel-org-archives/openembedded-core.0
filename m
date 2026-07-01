Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31F9C43327
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 16:37:07 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49517.1782923821678492953
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 09:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=m/ulAvKV;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout03.t-online.de (Postfix) with SMTP id 6B0CFED1D
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 18:36:59 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.163.76]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wexvi-0fCJIg0; Wed, 1 Jul 2026 18:36:55 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][Patch 2/3] mesa.inc: enable intel raytracing support conditionally
Date: Wed,  1 Jul 2026 18:36:39 +0200
Message-ID: <20260701163640.1285581-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701163640.1285581-1-f_l_k@t-online.de>
References: <20260701163640.1285581-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1782923815-DF7FDB74-A73317E8/0/0 CLEAN NORMAL
X-TOI-MSGID: 325cc17f-b8c0-400b-9abe-5b86168402fd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782923819; i=f_l_k@t-online.de;
	bh=59TkAQBG7okXwIGDwU8499tirFQ5jCrAgKg19Uj1gq0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=m/ulAvKVsfFCYaJr70IhGZIzuZ1LCYYLIruKOqL9bHuygTc+KLdmaaGatednpjuFq
	 CrwtbwjldFbKxcPR0GJCtnjzghHqNIhzV92/P1aSDYOmvIwfcPxBpUlt5dHgAgHzE6
	 66CeLAdGviyoNeKLKyrAROkZttw4ZyPKNk71oO90fb6kMbf9EqfcWO3JPhCcAk0JDJ
	 th3CD/vz17BIT0EF9YSuObh8LmVbS+V3dNBe9m2QbrEi4eUcEwWscKpByT2DHawFLv
	 wbDlg1607tXcAjk+CvqFKdgqhTntmxelmweb1q6DI6Z0Y3NHV9GoPof9SwW2e4ILi1
	 YjUd+D6peT30A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 16:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239999

Enable intel-rt if 'libclc', 'gallium-llvm' and 'intel' are in PACKAGECON=
FIG

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 469aa789fd..f8e294076a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -127,7 +127,8 @@ PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-nativ=
e"
 PACKAGECONFIG[ethosu] =3D ""
 PACKAGECONFIG[freedreno] =3D ""
 PACKAGECONFIG[imagination] =3D "-Dimagination-srv=3Dtrue,-Dimagination-s=
rv=3Dfalse"
-PACKAGECONFIG[intel] =3D ""
+intel_rt_enabled =3D "${@bb.utils.contains('PACKAGECONFIG', 'intel libcl=
c gallium-llvm', '-Dintel-rt=3Denabled', '', d)}"
+PACKAGECONFIG[intel] =3D "${intel_rt_enabled},-Dintel-rt=3Ddisabled"
 PACKAGECONFIG[lima] =3D ""
 PACKAGECONFIG[nouveau] =3D ""
 PACKAGECONFIG[panfrost] =3D ""
--=20
2.54.0


