Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B52D65C41
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 12:17:26 +0000 (UTC)
Received: from dwarf.ash.relay.mailchannels.net (dwarf.ash.relay.mailchannels.net [23.83.222.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13294.1765973843478874194
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 04:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=WaaWxa8L;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.53, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C1F2F92191A
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:17:21 +0000 (UTC)
Received: from de-fra-smtpout7.hostinger.io (trex-green-5.trex.outbound.svc.cluster.local [100.108.115.134])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 336DA92195C
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:17:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765973840;
	b=aONe8+hfHZz9W9rLXngQcgkssLlsIZZURGC3RNI/tQC3vkHTkOLDWa5CVRJNyxoPuFnCce
	mxwwxPhgmvaaPJAXVM2IjJwBC1HvQpk4NyQl2EEs/RAK7JTELDpXPND22czSl4XwOtr7oa
	Uqk3nnZ6CsOe1kJeWxJUdQ+13j+AzyU0+nSd3IsnXEb//6Uu/UMIj0Q/nqLRhqtq0Etoti
	MiXJJum0c2na6soBxMKXcXtadI5PT3SJLwHHirTICUufFEU3IvhZkS38ZWnzVosvdd5YA5
	Zzqec3qyQQWXNSf0Lk1A1D0oRokISEIHClB4r10ZCDlz4f3noeoQoLHoxkbTMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765973840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=txs5wolPA6Yn+Zz/AcDk8oz93py+Sop7DHpvYD1eBN4=;
	b=Ohrm7u2gRqNnViKjeOdB/dvdDXMPW2GjB0tkj3DHJjZuI+wqrvPkAR6lsNPSxggXYGL7qK
	VBQx5iWFwQvT5l3zSmnz17TAglNeIXKvZgza6Aq2SI9VkH/VRK9xS4ystBoqxHyXQJTDwJ
	XO5ni5qKySmVRiSdwDNtiw4OYcwGexQQKIwmL7IeFGqyhxJTmnzmrfAFVQuojkuUzk2Xwj
	1roHSu4irnM+rp7fPXGHcTfvZDRtW8sEI1zDi+4IDPSxp+BtP1YGo/ap8zyGwGOVfDQByP
	v1UhreMQjyZ6SUC1+kjsE+XZqzMpWHz6vuTKYzo+SLXZBVcu5VwJQYNlOPlrgw==
ARC-Authentication-Results: i=1;
	rspamd-6ccd5b4cc5-kn4k9;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Cooing-Lonely: 4426dc5b19d1ee9f_1765973841584_2286654142
X-MC-Loop-Signature: 1765973841584:768936929
X-MC-Ingress-Time: 1765973841584
Received: from de-fra-smtpout7.hostinger.io (de-fra-smtpout7.hostinger.io
 [148.222.55.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.115.134 (trex/7.1.3);
	Wed, 17 Dec 2025 12:17:21 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:8e2b:fce5:ec42:f176])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dWXqL2GrMz3wbk;
	Wed, 17 Dec 2025 12:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765973838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=txs5wolPA6Yn+Zz/AcDk8oz93py+Sop7DHpvYD1eBN4=;
	b=WaaWxa8L0TxlqyYptYdyAMe0cYM1M1iM1//pRiex+ofd8ZAlRiiiqhyjHgT9fKB7CMbPJb
	A343fIkm65lxvj1njwogONEtjrMFRE51/BHMzuAT9z+trAmNk+NEdebN6uKdliQ9I6FFn6
	GT+kmH/G9jLDhJ1rLZpbtiJBkKu5NoNm7az2cUPwN54Yp5hT3YhCZhq/48SG9V9eDhzDom
	GdwVsfRgFVBMtjz/A8JmcYfJnTreP2OAPJafUrNetI2l5D1KZYAh7mDAYF6DdZxWqkn23y
	yN9Bzj6VI6FRXVcA5lm9d7GV89gVzhDEtNStYF0v+jkOrAC+zIQ2TJvTtqbQow==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 0/5] ALSA 1.2.15 updates
Message-ID: <20251217121705.391288-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 12:17:18 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=69429f4e a=JY/OoRUBqPoXaiLUhbiEKg==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=qHOs-Wk2d_12whudgo0A:9 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfD+9imT2lgqan23ITegz9BGv8P/Bk62XQe6VJN3x28e+3B+RdF2QgeT0RxmJBj7wpXqVu+1QehE9BdYPGNhZRWtTv0Zpz6Fq399gt0g+xC3PCNowGQhD YgTCuyy36yRD3cOu7RpOsekMJEOsAUoFGBm7PITweAII3lNNzqspmVfcDCv3LKTx4Q/l3DrimlZTbdfncCwQstBDYFNby4GoD6MA1LpBTyItX9jmfFJy1TWW +kc5tzfn+OroT0WHTnORrh1K0g+rAiQVzxQZduFKnw2vOl8OtOErWW+xA6CgyE/JElZNTEegPEsg46aWsSlcFDwohIsjdj3a6ftnKp6wBr7CZTIsN2/thwW6 03Cbyqck
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228031

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

These changes update alsa-lib, alsa-utils, alsa-tools
and alsa-ucm-conf to the latest version: 1.2.15

Michael Opdenacker (5):
  alsa-lib: upgrade 1.2.14 -> 1.2.15
  alsa-utils: upgrade 1.2.14 -> 1.2.15
  alsa-tools: upgrade 1.2.14 -> 1.2.15
  alsa-ucm-conf: upgrade 1.2.14 -> 1.2.15
  maintainers.inc: update e-mail address

 meta/conf/distro/include/maintainers.inc      | 22 +++++++-------
 ...{alsa-lib_1.2.14.bb =3D> alsa-lib_1.2.15.bb} |  2 +-
 ...a-tools_1.2.14.bb =3D> alsa-tools_1.2.15.bb} |  2 +-
 ...conf_1.2.14.bb =3D> alsa-ucm-conf_1.2.15.bb} |  2 +-
 ...sactl-fix-build-when-in-subdirectory.patch | 29 +++++++++++++++++++
 ...a-utils_1.2.14.bb =3D> alsa-utils_1.2.15.bb} |  7 +++--
 6 files changed, 47 insertions(+), 17 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.14.bb =3D> alsa-lib_1.=
2.15.bb} (94%)
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.2.14.bb =3D> alsa-tool=
s_1.2.15.bb} (97%)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.14.bb =3D> alsa-u=
cm-conf_1.2.15.bb} (89%)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils-1.2.15/0001-a=
lsactl-fix-build-when-in-subdirectory.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.14.bb =3D> alsa-util=
s_1.2.15.bb} (96%)


