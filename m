Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D268D6555F
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 12:17:26 +0000 (UTC)
Received: from panther.cherry.relay.mailchannels.net (panther.cherry.relay.mailchannels.net [23.83.223.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13691.1765973842935197455
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 04:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=YwDDu9Bm;
 spf=pass (domain: rootcommit.com, ip: 23.83.223.141, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 39C4412186A
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:17:22 +0000 (UTC)
Received: from de-fra-smtpout7.hostinger.io (trex-green-3.trex.outbound.svc.cluster.local [100.108.222.12])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 90AAA121916
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:17:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765973841;
	b=TpD/Wn/0uUzW1naMOoGMgZgc+UZHcxhLbXjcmHuN29k1RsQAOjiGRKOcc6wzCZEV5oT460
	3azobMtiOdHkVYQwPPypPArfuZkHbZc0t1cyzHgAy9OwaLGZNm6Fr+sPOieNDljBj2WMaj
	/AFSpnHBgcV5yA98JcQWjLO0tSAxeKhDkgv8CmY4zjKF9k/zJR2BZM/PnbVdH4Tz9peL23
	Ns+TnFbYHsVor0V6XiFQJnJJQoj+37iMEvEbpDBlJvFt/acC9RYXsov9ma4eSXR3f3aMg6
	j66QFuNeTQNKYbEvAMw65tEdSRQrxGXOX6CcYExrZpsyvcPaK+IGVm3Ityx+7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765973841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=D0NopQ5ntECTQB5+1paKBJrTMpVrOkDCoUgHTdDf4YU=;
	b=gH+sVJFQW1s/CwuQIXRl9icsLsPioQnJV6NPcYBONZrUQ5MsVTXBQeUZnY9OjcxBdt7G7a
	g2/uZgDjR0a1oVOJDxDCHqGmG16rW28sqqdVQZqCuNENjWfN74Cz0B88DWC9NcoBK2LlIl
	8r1aE5yHCO9gP+wMQuItYE3d/7lw6OG7Tag333+f6zunRGQj0v/MCgOQ1OC18AGgpB4bXe
	5eNPmq8hrvpPJv30T62Rjl2LedXXT08dNnsMtPDxBHUhDad0DrTF2FCADDIUkv14zDdYAJ
	g23xm03qFDS+DavV6uEkaPZqnuyXLDnjmLEWPOqkIVWCq8QoNwDNh75dcGU+sw==
ARC-Authentication-Results: i=1;
	rspamd-6ccd5b4cc5-r8ggk;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Well-Made-Harmony: 0efffb3e26e38401_1765973842124_2304864311
X-MC-Loop-Signature: 1765973842124:2035830486
X-MC-Ingress-Time: 1765973842123
Received: from de-fra-smtpout7.hostinger.io (de-fra-smtpout7.hostinger.io
 [148.222.55.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.222.12 (trex/7.1.3);
	Wed, 17 Dec 2025 12:17:22 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:8e2b:fce5:ec42:f176])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dWXqM59x6z46kv;
	Wed, 17 Dec 2025 12:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765973839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0NopQ5ntECTQB5+1paKBJrTMpVrOkDCoUgHTdDf4YU=;
	b=YwDDu9BmlEXNADyuDzpmytHCf2FrKiJldJ58KCPZS+kwut14vSChdNQDsiC8XHBbZZu4I8
	sqwuL1sG0bUJEwZwWGSGkEscNmZ2jwYEiU+43tsMkcXCPk/t89mlia+EYhBG4d0LgKB6Ip
	1AnLevVW/0vfFMQR/2oKHIAMAxufHa0VRV7fU78msCg8h4S6CDxG13h4GHdief4hRqu5IK
	MNiAIDu6zdjRhI4v5c8lrL1cDjFrvc6MTgcEsa/3JmrwgQGN/Nm5LvRBNr7XGzuCGbx4RF
	7OC8I5whNfO1DT6dF0UrwhkW/tGEjlFZjguB8D8YTwWydwzmzYl2O5Fb1iFLcA==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 5/5] maintainers.inc: update e-mail address
Message-ID: <20251217121705.391288-6-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217121705.391288-1-michael.opdenacker@rootcommit.com>
References: <20251217121705.391288-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 12:17:19 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=69429f4f a=JY/OoRUBqPoXaiLUhbiEKg==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=sbFYo3YMAAAA:8 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8 a=ag1SF4gXAAAA:8 a=20IyuqIVtD7Q7tfe13cA:9 a=NcxpMcIZDGm-g932nG_k:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=eQGrxjqmTwMhw5bz568X:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-CM-Envelope: MS4xfPZwjjFCMqMDT4NEA7My85XTWaX4JP4AR9Kuu5LSXyHCrnzPCLDllji5cC7QLJ5ugG6pUgb26Csvm/ZaV7z0C79hWlg9bLhUFzPEQS66JbUGdUCyvfrf kAr3B7KjVabvpX3tf8wNtCrEsqz1s3SHudbjQ9wR4oRX/XoKsa13XCmCNvNMPoPBu5iLDmi2BViO4FcdE27UoP0dVojRc1pX7Hkz2rig7sphcvrLH6VBBxa9 u9tL5XAwyFX0P/suhKpGqodsAy8YVvh1BvB4bNZ9caMdsnFM98lsziASADNxvcqNu35du2pMdn/Rh81imS7Y+Vr8JibSc7DGhyjFYZl5Pth3S2cf6RnQQV// aWwDtOnW
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228030

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 meta/conf/distro/include/maintainers.inc | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 8971b9b552..447faf8fb3 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -31,13 +31,13 @@ RECIPE_MAINTAINER:pn-acl =3D "Chen Qi <Qi.Chen@windri=
ver.com>"
 RECIPE_MAINTAINER:pn-acpica =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-acpid =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-adwaita-icon-theme =3D "Ross Burton <ross.burton@ar=
m.com>"
-RECIPE_MAINTAINER:pn-alsa-lib =3D "Michael Opdenacker <michael@opdenacke=
r.org>"
-RECIPE_MAINTAINER:pn-alsa-plugins =3D "Michael Opdenacker <michael@opden=
acker.org>"
-RECIPE_MAINTAINER:pn-alsa-state =3D "Michael Opdenacker <michael@opdenac=
ker.org>"
-RECIPE_MAINTAINER:pn-alsa-tools =3D "Michael Opdenacker <michael@opdenac=
ker.org>"
-RECIPE_MAINTAINER:pn-alsa-topology-conf =3D "Michael Opdenacker <michael=
@opdenacker.org>"
-RECIPE_MAINTAINER:pn-alsa-ucm-conf =3D "Michael Opdenacker <michael@opde=
nacker.org>"
-RECIPE_MAINTAINER:pn-alsa-utils =3D "Michael Opdenacker <michael@opdenac=
ker.org>"
+RECIPE_MAINTAINER:pn-alsa-lib =3D "Michael Opdenacker <michael.opdenacke=
r@rootcommit.com>"
+RECIPE_MAINTAINER:pn-alsa-plugins =3D "Michael Opdenacker <michael.opden=
acker@rootcommit.com>"
+RECIPE_MAINTAINER:pn-alsa-state =3D "Michael Opdenacker <michael.opdenac=
ker@rootcommit.com>"
+RECIPE_MAINTAINER:pn-alsa-tools =3D "Michael Opdenacker <michael.opdenac=
ker@rootcommit.com>"
+RECIPE_MAINTAINER:pn-alsa-topology-conf =3D "Michael Opdenacker <michael=
.opdenacker@rootcommit.com>"
+RECIPE_MAINTAINER:pn-alsa-ucm-conf =3D "Michael Opdenacker <michael.opde=
nacker@rootcommit.com>"
+RECIPE_MAINTAINER:pn-alsa-utils =3D "Michael Opdenacker <michael.opdenac=
ker@rootcommit.com>"
 RECIPE_MAINTAINER:pn-appstream =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-apr =3D "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-apr-util =3D "Hongxu Jia <hongxu.jia@windriver.com>=
"
@@ -182,7 +182,7 @@ RECIPE_MAINTAINER:pn-ffmpeg =3D "Unassigned <unassign=
ed@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-fastfloat =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-file =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-findutils =3D "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-flac =3D "Michael Opdenacker <michael@opdenacker.or=
g>"
+RECIPE_MAINTAINER:pn-flac =3D "Michael Opdenacker <michael.opdenacker@ro=
otcommit.com>"
 RECIPE_MAINTAINER:pn-flex =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-fmt =3D "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-font-alias =3D "Unassigned <unassigned@yoctoproject=
.org>"
@@ -311,7 +311,7 @@ RECIPE_MAINTAINER:pn-keymaps =3D "Unassigned <unassig=
ned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-kmod =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-kmscube =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-l3afpad =3D "Unassigned <unassigned@yoctoproject.or=
g>"
-RECIPE_MAINTAINER:pn-lame =3D "Michael Opdenacker <michael@opdenacker.or=
g>"
+RECIPE_MAINTAINER:pn-lame =3D "Michael Opdenacker <michael.opdenacker@ro=
otcommit.com>"
 RECIPE_MAINTAINER:pn-ldconfig-native =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-less =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libacpi =3D "Unassigned <unassigned@yoctoproject.or=
g>"
@@ -797,8 +797,8 @@ RECIPE_MAINTAINER:pn-shutdown-desktop =3D "Unassigned=
 <unassigned@yoctoproject.org
 RECIPE_MAINTAINER:pn-signing-keys =3D "Richard Purdie <richard.purdie@li=
nuxfoundation.org>"
 RECIPE_MAINTAINER:pn-slang =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-socat =3D "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER:pn-speex =3D "Michael Opdenacker <michael@opdenacker.o=
rg>"
-RECIPE_MAINTAINER:pn-speexdsp =3D "Michael Opdenacker <michael@opdenacke=
r.org>"
+RECIPE_MAINTAINER:pn-speex =3D "Michael Opdenacker <michael.opdenacker@r=
ootcommit.com>"
+RECIPE_MAINTAINER:pn-speexdsp =3D "Michael Opdenacker <michael.opdenacke=
r@rootcommit.com>"
 RECIPE_MAINTAINER:pn-spirv-headers =3D "Jose Quaresma <quaresma.jose@gma=
il.com>"
 RECIPE_MAINTAINER:pn-spirv-llvm-translator =3D "Khem Raj <raj.khem@gmail=
.com>"
 RECIPE_MAINTAINER:pn-spirv-tools =3D "Jose Quaresma <quaresma.jose@gmail=
.com>"

