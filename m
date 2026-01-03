Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A862FC619A
	for <webhook@archiver.kernel.org>; Sat,  3 Jan 2026 21:12:08 +0000 (UTC)
Received: from dwarf.ash.relay.mailchannels.net (dwarf.ash.relay.mailchannels.net [23.83.222.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32201.1767474722298098348
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Jan 2026 13:12:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=KJAFm554;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.53, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 587257E1339
	for <openembedded-core@lists.openembedded.org>; Sat, 03 Jan 2026 21:12:01 +0000 (UTC)
Received: from fr-int-smtpout26.hostinger.io (100-113-120-63.trex-nlb.outbound.svc.cluster.local [100.113.120.63])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id AAE4E7E1393
	for <openembedded-core@lists.openembedded.org>; Sat, 03 Jan 2026 21:12:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1767474721;
	b=JFc+d9qMw8Is7gHR4EpZm42bdHpAzsWoMeKYCpJYGj92D9hPMxMdzrDcaSoUt1VgPZDw34
	ZqJH8l6cS8ciu+ab+SRm+t6/kYAaL1JSB5q5VFc5s5rNzT9yq3ozKl4BTDnNMuRhUcm6dG
	BrLBXYusGPHX32k/kGu6pP0L3LRiV/rskWrxWsl/INTRk3p3OEG2lwjuoFqLR7oGLypOao
	Bvxbg1v9NR/FunaNgpr3xj76Wc+n7syQ5voguJsqocVSBJBIq0JILdSRtUmDbPrliz72Y4
	gQe/7TQlBIdzBRi+I8Bo/9M30NoAzV7ggkXSu+wxiWfyVvLDr2NIpy8x7NP+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1767474721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=uM8bvRVrhIhGBarRbX5Z+jEfqa/PWw4a562XAsvG2dc=;
	b=1KGuM88GYJwopT1B9S4yZ7K24pe5PQ+AtRlhuEzaw/1+pjNzBAcNZWMGtC/+5Hm5l9l9CC
	mwqOonHJc3ASHF4Q1vKMBOclPKmNOZk8YA7X3vZy9CWOo3M4cAtL22qttwf8OUA88aw9U2
	xyeEIdhtGELpIM4rH8w4ILtgcQfXHxmVkJ5UAWyg65YFYTyHYa/Wc0IGww36tZL9Z0h+8u
	NCy3Sw7cd6vaQWmBHe/Iel3tiR6qqkXXS4g/X9lvSHsLkCOWB+8rdte87cGEFh4Tc26Mcd
	BymGsSxsfz6ig4Yv0/96QngehJKqOzchKHYEE4Y90+j1lxkTn2OW1lMgxt1ldQ==
ARC-Authentication-Results: i=1;
	rspamd-85db7f4c96-sq457;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Chemical-Ski: 7712230d31984c3d_1767474721244_3517937402
X-MC-Loop-Signature: 1767474721244:2709099411
X-MC-Ingress-Time: 1767474721244
Received: from fr-int-smtpout26.hostinger.io (fr-int-smtpout26.hostinger.io
 [148.222.54.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.113.120.63 (trex/7.1.3);
	Sat, 03 Jan 2026 21:12:01 +0000
Received: from a8.lan (unknown [IPv6:2001:861:4450:d360:a56a:87e3:7fae:367e])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dkCtQ63jFz1xwv;
	Sat,  3 Jan 2026 21:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1767474718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uM8bvRVrhIhGBarRbX5Z+jEfqa/PWw4a562XAsvG2dc=;
	b=KJAFm5542023fygpzoQDysb833MXDoE8xYohwBoxtGz+3+1SxMGe4Yk506U/czNmo6kLII
	GWZCtVahzMKtSscvbTRHv/Xaqv+Rkguinj18qDAHGhxR/MQDeZFmma86brxgjNSs667vx3
	2kEmbN4kLLoE79c6AVq3bH1sQ6daeIbB1mxGu6hdGCb9zO34JJVITfn2GLB2Ec8HRqt7fV
	Hrau0J7d4pmgAGBVkgJz8nHUFRwEaZ4TZYIUdUxj0K4cWc1yiRKQuCN4I8lChxJDeD/LYR
	0sXCz2UJcn7oyhgDKv72WKUnuaa4mQox1BOPxF0mbxzhea7yPQaDLmwy5UtsoA==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 3/4] alsa-ucm-conf: upgrade 1.2.15 -> 1.2.15.1
Message-ID: <20260103211155.51433-3-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260103211155.51433-1-michael.opdenacker@rootcommit.com>
References: <20260103211155.51433-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Sat,  3 Jan 2026 21:11:58 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=NuiDcNdJ c=1 sm=1 tr=0 ts=6959861e a=j106YqD2ESRJk0lKD0wP4w==:617 a=xqWC_Br6kY4A:10 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=jbaUnLBT-8YrQ6gR8GoA:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfIpIEgetZaFUNi41hg8LT8SRReNqnpOLgIkwDyw20iP8VCA5ZtwP6KwyYfuO90A00H07D4YCQG1n/BMqyN5udEWRg3wN2HR934KWEQ4nsQvjr6kyXBDK nmdlhajwaKaMllpkgJTDzAUStYF43/Rk6kIV26nHLtsguxbi6ZdImPJmHpvCMQJDRDc6bb4I8+AWgplmOEqA57S/XMC4dGaEKTxUCL0PRWdjH7coaTNPiBa3 Nh7JGoDIzBUdmWCfZ29y2kdCAsxRHYFfEkwncXwFq9WQ4AnRVTzSP7CEov7IJ1mlZdqM5qDxqjyDzqkW2ClZ1h7uITd4wBpBvC4DuHCkuWI=
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Jan 2026 21:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228852

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Upstream changes: various fixes
https://www.alsa-project.org/wiki/Changes_v1.2.15_v1.2.15.1

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 .../alsa/{alsa-ucm-conf_1.2.15.bb =3D> alsa-ucm-conf_1.2.15.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.15.bb =3D> alsa-u=
cm-conf_1.2.15.1.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.bb b/meta/=
recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.1.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.1.bb
index 1eaec98e3b..961a1444e3 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.1.bb
@@ -8,7 +8,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D20d74d74db9741697903372ad001d=
3b4"
=20
 SRC_URI =3D "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] =3D "5510cb0947a3bb877b5ce218e3ecedd78bfa6643e372346c=
87d93d4844a45ffa"
+SRC_URI[sha256sum] =3D "246c5d59d217b6f7f47a11fd10f1b766d25abcb0d9c996af=
3079bb9c9ac5a1b0"
 # Something went wrong at upstream tarballing
=20
 inherit allarch

