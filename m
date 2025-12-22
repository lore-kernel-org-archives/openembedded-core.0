Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C895BE67811
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 17:43:53 +0000 (UTC)
Received: from rusty.tulip.relay.mailchannels.net (rusty.tulip.relay.mailchannels.net [23.83.218.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85113.1766425431264586679
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 09:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=LnFZaas2;
 spf=pass (domain: rootcommit.com, ip: 23.83.218.252, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D7ABA1815B5
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:43:50 +0000 (UTC)
Received: from fr-int-smtpout24.hostinger.io (trex-green-8.trex.outbound.svc.cluster.local [100.109.2.81])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 249F7181DBF
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:43:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1766425430;
	b=0DEsaRcXVb6E8/fmpMBqWELs1bjiAZ+3spnh+r2u2LyKDbbGKQejPDSzlWULp6pK8uqt28
	prKr4SUmORlzNY+Edp08yu6IzBqgMO+pe7q9so02i9fpjVGU0RVqIJ4TDkuDbPUvQSy5e9
	Go94fCbLLYcqlIjIwWkV5q5+QhNqsWzgf60ED2YJmPrpgMWafhRpOUrVVXxzd1a5lFfJaC
	+QdhUgPCD24cpTQ7FrX+r6NzQezRSPNvP8WAr2qEAeigT8P8O/shgQxcYeUyDrliu2wH1V
	o07AnrHIyP2NwzH4qQXY8yyKak1lOsldyDaFc8AaCTx5bLIyW1XjqQ/l0RntKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1766425430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=D0NopQ5ntECTQB5+1paKBJrTMpVrOkDCoUgHTdDf4YU=;
	b=7QMnaA9s7TqMS0moOPPbOZB4u3O9AUnYVwZJQInEVo2kTsAaz3oVwQhgIbBy051cwTuJiL
	jKVcWIRXeWeMOvTyfts5TK0JufuYvt4nBguYS1vKx4sZMh6ljJ6wnbNYIHuM6K2TrkNui9
	O/h1YkhEGgsIFaKfNjWeUeA55wvgnVOvxBduM6xsBgX2JqbNV1W47nBz9xAjODl8wM94Nr
	72H00THuXdWGow4t7KWRAhvzYBw9dcFum9Z4TB4odPUCFztI/BmZnR55RESZu5m4Xh0/qa
	kN/Oc/q+i5CDP5aHt5N3QJi0MjOS+53vzWtoEFEKT900ROf2qgyc860XcOTx2w==
ARC-Authentication-Results: i=1;
	rspamd-55cdcc6c54-rz657;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Cooing-Fearful: 7936fba653c1d700_1766425430709_567306361
X-MC-Loop-Signature: 1766425430709:2944952102
X-MC-Ingress-Time: 1766425430708
Received: from fr-int-smtpout24.hostinger.io (fr-int-smtpout24.hostinger.io
 [148.222.54.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.109.2.81 (trex/7.1.3);
	Mon, 22 Dec 2025 17:43:50 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:7586:fd48:8d48:80a0])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dZlql46q4z1xpG;
	Mon, 22 Dec 2025 17:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1766425427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0NopQ5ntECTQB5+1paKBJrTMpVrOkDCoUgHTdDf4YU=;
	b=LnFZaas2tSpBTEj6cUBafQeVoBigXJ7jZ0uj/0s04iDazAan15hOdN/ws0jpaERP2m5Vld
	iFr3wdoZkqII7FowN8U+Qyfutkj4JE+D6xJdRq5B4JPrqd4MClKbZxeB2P8B2DDQpg9U4S
	YZdH6FRJIDnwQx8C31o0jWZDnBCJuzzhxx8FblY5lp2QSpIksQXViO2WUYRb7fEKEeJiT2
	nMST+qfFvFiJb/YJ0ocLD4BDlo0A3D9Paj9LeFZcsJ4bN/MetkWQgOk8//kBSgcnaiYQBZ
	E39PKTTAJWydz+dsh1DivHGerJxQUGXCteZUrt/moGGi5UYZQWVqlFsLRoUd/Q==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v3 5/5] maintainers.inc: update e-mail address
Message-ID: <20251222174336.1794730-6-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222174336.1794730-1-michael.opdenacker@rootcommit.com>
References: <20251222174336.1794730-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Mon, 22 Dec 2025 17:43:47 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=B9fr0/tM c=1 sm=1 tr=0 ts=69498353 a=myaG3V0YOm9nx1Em8mk9ug==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=sbFYo3YMAAAA:8 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8 a=ag1SF4gXAAAA:8 a=20IyuqIVtD7Q7tfe13cA:9 a=NcxpMcIZDGm-g932nG_k:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=eQGrxjqmTwMhw5bz568X:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-CM-Envelope: MS4xfJdygYWr7DRxhdu3hmFoXvnjnWqlL6kmP7hMRpf5Bf31OuN35oeiqaFGTW0/3fIZNqElE05nFpfKwm8xXZK4kxJnJkXQ6ofUOJSrNrn8BGjpdvq8Q/9Q I4LA8y9lh/yQ3aVw8uZwjwFl6Dx5Bao9AH/ei8rYyak8XuOxVq0BLu5la0awzjWxN8PLihs2+61UfEgpWaR8GKaSGtYtcLEboVdmYDRMGZMv/XIhv1DYS8hI nYBNfNI/b8xOP2L8obs4S+m/SLFJxt2hXNQ29m6BbsWboeLamKeFKwCgtS4/PVWTMD2lsMmEjmyoChlW0G3i7D7eOI+e4isjnnIpj05K7Di8Yu1SfDGE5a8E 04hQrVtY
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228317

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

