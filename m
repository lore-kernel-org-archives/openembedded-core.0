Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6D8D65C7C
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 16:05:58 +0000 (UTC)
Received: from siberian.tulip.relay.mailchannels.net (siberian.tulip.relay.mailchannels.net [23.83.218.246])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18522.1765987552955131548
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 08:05:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=Gl6i/zLO;
 spf=pass (domain: rootcommit.com, ip: 23.83.218.246, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 63C0E44177B
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 16:05:52 +0000 (UTC)
Received: from fr-int-smtpout20.hostinger.io (100-108-184-183.trex-nlb.outbound.svc.cluster.local [100.108.184.183])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 2C1D344164D
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 16:05:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765987551;
	b=r1QJ8jy7hP01PEh0J86AlMPJceIj7LVot4bJlT7LN+r4IdYn+5akJQ9btOxWBaHp2aoasJ
	c1TNrl8sKBFz03tJ8eJrtuRRZQ5WHrOJuR2fHnZ6K72hdX5UhfeFPirtxa1YILY298VJII
	O1ArkGW+5d8FgKI1XfNTaD/AZJpCGdGEQnsYyHNXo1HM5FHF9eaphE+fvUDk2v35r59NHH
	0KdnrHiSv7bJQIKlzdKqGDtioahozCX0OmVm8ymAcihtYAMg0ptb5z0ope1RA5sNbwVEgd
	QCtTnmIQieJYzuKejqaljYcZi7/mcRbre+RAcYWlo9CisnU2OJNbehSAevvjeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765987551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=D0NopQ5ntECTQB5+1paKBJrTMpVrOkDCoUgHTdDf4YU=;
	b=JO83iuIJLTY1pER0xxPqmwIJmxelEZmdTXfU90C9OuIDux+7Ozi1d02oRXudDtn/NVJrOb
	ZCr+IOKZCpSrgyQKVAoeW0DfupjNn5o3C4uxmolYJ5vjKyi1u01f9zImQZ2uDJisqxeXR9
	YDRJRCUaKk3R7WYAsIBhLABE5hYzTLYEROdQfdz3DGlXVGA2IGUhnHx1NYTsemcNNonE+e
	ptMndNqUMeniP225Fp0uWp6nsqjk0I3jnkcAf9/3wWUx38m5tvMT5FOFWy/DPP48FUXJGY
	o78tCjPMzUFFISy7m83MKOdVhDwg/TmPwX2TOC790JHnkfkf5ThKMKR2Om6GcQ==
ARC-Authentication-Results: i=1;
	rspamd-6ccd5b4cc5-kn4k9;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Lettuce-Keen: 1f265f857b1971ba_1765987551681_355661740
X-MC-Loop-Signature: 1765987551681:3072108904
X-MC-Ingress-Time: 1765987551680
Received: from fr-int-smtpout20.hostinger.io (fr-int-smtpout20.hostinger.io
 [148.222.54.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.184.183 (trex/7.1.3);
	Wed, 17 Dec 2025 16:05:51 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:ea5c:9c0:3076:4dda])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dWdv12yLkz1xxv;
	Wed, 17 Dec 2025 16:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765987549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0NopQ5ntECTQB5+1paKBJrTMpVrOkDCoUgHTdDf4YU=;
	b=Gl6i/zLOIv1Mi0izHIq+ov9IC/8XakctHWZfgGzCIWjkHFUd2BXSwrKGxTcmyZA1wJJVDv
	S9Y62nhcoxVm2zTFSYbLMWOBrrnpXo9NxpBckGCjPx3ZqicLcxRO9LK5FUliXWXW8nAhy5
	cNIORGYl4Zo0NjyCoL9TxzijuCBLDrXMFwiiY7Mkv7F8ZXuTRkmIKmE/V9pCqU7WfXX4hp
	rOu8vPJJHU0ak3mMMqcEHdsxhMIG6QhOxEXw+GRyFBxUD0gdU+FSh3uQp2ToSlo01G+Dkj
	JPJXh3DP9Q1QCfVjSdONeNxIM05JzfEc4mUDqM1kibKFGxLzJQ3E4ddHL0Y8bw==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v2 5/5] maintainers.inc: update e-mail address
Message-ID: <20251217160533.600164-6-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217160533.600164-1-michael.opdenacker@rootcommit.com>
References: <20251217160533.600164-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 16:05:49 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=B9fr0/tM c=1 sm=1 tr=0 ts=6942d4dd a=MKCPbgLKPPUpDiypvfdhzA==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=sbFYo3YMAAAA:8 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8 a=ag1SF4gXAAAA:8 a=20IyuqIVtD7Q7tfe13cA:9 a=NcxpMcIZDGm-g932nG_k:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=eQGrxjqmTwMhw5bz568X:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-CM-Envelope: MS4xfDWVLJh9PezGY66PZNm96eZh4qE+5y4xoodjUx2zW+L26WMQqWOUoU79XLt1+eKDbN8I036vLm2K+Wlr/K8/axexLjAMPJ2uZ5Y+G1lI6KkRtaKIacat +Ht6aCzjYN0jl8GYBxboqbfouZwQc98hNokwcCqZF7pUw65yjzZR20I7JKeOMEkyrA0goE4YQC7ZuHBdlO+B6bKslQPoOqDwhQOlit5ZyuCo9WG/xVDBgMpi UlMsjsO3hCthIFKiIrWOmln4BIXsDDxSUKh3EzcoYZcBwe/8g6EhzopuDbRSfeIra/Fiq0v9kNf1Il3M/xbMkniKdBt1RFs3x+GbJ1XaJD9wQugfrP5HCHHe ALJU2y+6
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 16:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228069

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

