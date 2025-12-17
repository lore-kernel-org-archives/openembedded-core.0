Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B5ED65C7E
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 16:05:58 +0000 (UTC)
Received: from beige.elm.relay.mailchannels.net (beige.elm.relay.mailchannels.net [23.83.212.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18131.1765987553168902715
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 08:05:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=LAekFj7+;
 spf=pass (domain: rootcommit.com, ip: 23.83.212.16, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 9E7547E16B3
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 16:05:52 +0000 (UTC)
Received: from fr-int-smtpout20.hostinger.io (100-107-170-83.trex-nlb.outbound.svc.cluster.local [100.107.170.83])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id D3DFB7E1409
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 16:05:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765987551;
	b=LkLbcOnP7TBfSzVFXpnCGyZHRuAwNofZSagfbC/2GBXWYZWaZvaoGka1jpdPBtrIp9wiHi
	XhFJ9dwcBX0Tdmmvn6OxL/+vs93auEP72Oo5a/QOo2hZOD5UwFj7KAbchkDLKHIeGy2gYr
	blmDj3ItRRhw2uOK3AP17St8DbD8YJbcrQ2+Ex7BWuYjblZ3TJ6mhdOhzaKBVmazheV422
	7JEa5Hqm1AJANviGpSSNE3nQWCLvhUIRtt5RH1U/vCk54nTrnqVDaIH8I9cTSZZXp918Jg
	TFPb/357CTFqUD4YXJGUeX7SWGCqY6rYxJBD82UzhnKb25no3r5d5r6/R2wi1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765987551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=eEYxLYju4z4EVLWNfoShMB5Qgkc7XNa7GF450IS6Q8c=;
	b=FkSG0kUTfAADRZKm4UCRqLvpsunbkcsQ8XahFqK42n1/sTBHIse14PjaLtZuNPXLts5jZd
	rW45ldyfyX4n4+Stv8of5yXkCurF1+zGzBMOxoiHoDDbpn2eSGiTh92/VqwJsfplAI7zfe
	spd73R86FkE33TtsZ5JVq037wESwrjMgrN++1kPUGNCrXidnQbZBetyo6fJoxzx8zeZDWC
	dmCxcowAeYpk6y1NqL3Up8YyZX9zQVKZVF/vqS87MuDt7qBoN+kzw6edQPuTqe99KiYhqa
	+97Zl0aKJDxad+enfT1GNu/HAm+T95isT8GmOC3EbZjD1K0EdCnmAcDGOwphpg==
ARC-Authentication-Results: i=1;
	rspamd-6ccd5b4cc5-r97t4;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Print-Chemical: 736c0a8638dcd502_1765987551378_1917565130
X-MC-Loop-Signature: 1765987551378:2429537162
X-MC-Ingress-Time: 1765987551378
Received: from fr-int-smtpout20.hostinger.io (fr-int-smtpout20.hostinger.io
 [148.222.54.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.170.83 (trex/7.1.3);
	Wed, 17 Dec 2025 16:05:51 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:ea5c:9c0:3076:4dda])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dWdv06jkYz1xy2;
	Wed, 17 Dec 2025 16:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765987549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eEYxLYju4z4EVLWNfoShMB5Qgkc7XNa7GF450IS6Q8c=;
	b=LAekFj7+H/kfSB2HgwqKCmpsb3yREw3K7b9T2d8yTXXfAfHWlgRdCn0EOjZbMRvQPT6Aia
	JJWzdM6a27HH7SOqvTiPm7KzYPM39DOHwkK7ZsQERni8kCCivaf9vDJnjyM8GC0Jkkem8R
	lCI73ymSEd7Sd9DQMGuuYsHsTqR4VangtJDiIRkXBkjFNz0IHShSeTkfWoixAa+oKvrZ0N
	cMF3JfqMzFCT5f2FTAEbvCU1HK8YItUwxw8/MhiY6iJWlNaxlQ7dDrDJZpJZqyMU3yRuIq
	PBy0U6dV4NrbPJUibicIPOVnsZevatVZ+l3RQs2dYq+tCNKxpeJ/6fw4EJK0sg==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v2 3/5] alsa-tools: upgrade 1.2.14 -> 1.2.15
Message-ID: <20251217160533.600164-4-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217160533.600164-1-michael.opdenacker@rootcommit.com>
References: <20251217160533.600164-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 16:05:48 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=B9fr0/tM c=1 sm=1 tr=0 ts=6942d4dd a=MKCPbgLKPPUpDiypvfdhzA==:617 a=xqWC_Br6kY4A:10 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=MWf8dILs5OcirjABKMoA:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfDWVLJh9PezGY66PZNm96eZh4qE+5y4xoodjUx2zW+L26WMQqWOUoU79XLt1+eKDbN8I036vLm2K+Wlr/K8/axexLjAMPJ2uZ5Y+G1lI6KkRtaKIacat +Ht6aCzjYN0jl8GYBxboqbfouZwQc98hNokwcCqZF7pUw65yjzZR20I7JKeOMEkyrA0goE4YQC7ZuHBdlO+B6bKslQPoOqDwhQOlit5ZyuCo9WG/xVDBgMpi UlMsjsO3hCthIFKiIrWOmln4BIXsDDxSUKh3EzcoYZcBwe/8g6EhzopuDbRSfeIra/Fiq0v9kNf1Il3M/xbMkniKdBt1RFs3x+GbJ1XaJD9wQugfrP5HCHHe ALJU2y+6
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 16:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228071

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

