Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70457C369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 06:23:36 +0000 (UTC)
Received: from fennec.larch.relay.mailchannels.net (fennec.larch.relay.mailchannels.net [23.83.213.58])
 by mx.groups.io with SMTP id smtpd.web11.1318.1745562210078566392
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 23:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=jII8pJ2o;
 spf=pass (domain: rootcommit.com, ip: 23.83.213.58, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 976802C580D
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 06:23:29 +0000 (UTC)
Received: from nl-srv-smtpout9.hostinger.io (trex-6.trex.outbound.svc.cluster.local [100.113.55.196])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id F2A832C4974
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 06:23:28 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1745562209; a=rsa-sha256;
	cv=none;
	b=iKp0dXSzBneRTkGQ+p6fwbUM322no0EoKCGY0IlQ76QZJMNHCLrVfckGvicCFQLUPo09AR
	ZBDEcki1KttKKg+QWkMr8X5LXTxUUIKTFhguPHjGr96mb4q+2soY1L2/5ffjS6ZOJG8kKW
	OTYbbmkoadDM5QJ5fDYtKLgaw1vUWxL5N0aiuqYvoUPTn4+eAPzaYipQke/+I2GYQr6xip
	DMk7sqOA2sLVMd6ZqlHQSF+RZs6TDiBvbhtN6o4y4F61EzagJz8NvY+TPNS1w9mw3fIhUy
	0bbiPBFsmJD2rDJLIMaK7faIhZJ/2OXPL4e7o7cD1XVMOswW4zBO1rj7Kqg21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1745562209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=flLB0F0sN3Hs+vzB2XKUJUW6/t1zFrnJ2bHkDlyXLIY=;
	b=vXUgqKbBphRX1f/4GbO+YFhDDtH7AKqbTWQm5iVkqSQFMAwKJxbV2sibJaw4PK56ZVZdjp
	28tDSNz1rW8QE2T2Nx6amfGwms2eGimBJf3BBo63xUV1lns690mY749kRGiJWIy9kr0ghB
	6Q5uYKE4npR2paFf/D5hKzI0+DxBAj0bS4mwnt/EhDnGny7nuTu5jgmaLjTINn3pn2MPfG
	XDogDIZJXaxRSGGJNoX8hfSjxzuxbIlxdoau8ui38VixQLqLYHyUSHTHqRMx5xtQJfecpz
	TXiGnmYXZ5uZQb17Jjo9XwQhgWToHGdn3CD9pwS2B/BxqmID8cq847Lz2Flb5Q==
ARC-Authentication-Results: i=1;
	rspamd-5cfcf5665-8vngp;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Bad
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Minister-Shelf: 2cc3b7845b58dcd9_1745562209504_1486322055
X-MC-Loop-Signature: 1745562209504:1337713752
X-MC-Ingress-Time: 1745562209504
Received: from nl-srv-smtpout9.hostinger.io (nl-srv-smtpout9.hostinger.io
 [45.87.82.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.113.55.196 (trex/7.0.3);
	Fri, 25 Apr 2025 06:23:29 +0000
Received: from a8.lan (unknown [IPv6:2001:861:4448:6b00:49e:d65c:81ed:4ae2])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4ZkN7y5tjzzGY3Xs;
	Fri, 25 Apr 2025 06:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1745562206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=flLB0F0sN3Hs+vzB2XKUJUW6/t1zFrnJ2bHkDlyXLIY=;
	b=jII8pJ2o9gObBVR+tFGsWlS3dwy2iysYbwmHq8Y+FPwMT+IN4oCp38eV/OBKgYJf5kvWr9
	teRV16VzycmZXrgvPyKGK6tPmIdhZbHfXljn+xoWOEqaIxz2w93SjzxmSvGUDi983iVUy2
	UrNvVHi8V000Trk/fKbuvpekW4+pI6hBq4vKFiYbQMcI1WVRoJ597J1jMJMmufIYkZTqBC
	78CeL2Eagveiql3Wlj7K8q0YfFgM24K5RnIwPv17OpPHIrVcb2wUgGKjKjAMI9mnh+bwFT
	hOUEdCI4K6qM8G+frar+ayFwUym3EuxJOzSAooHDKjzO0Lw18PP8tUTAU3kmPQ==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 4/4] alsa-utils: upgrade 1.2.13 -> 1.2.14
Message-ID: <20250425062251.2825835-4-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425062251.2825835-1-michael.opdenacker@rootcommit.com>
References: <20250425062251.2825835-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Fri, 25 Apr 2025 06:23:26 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=LJs0Q4W9 c=1 sm=1 tr=0 ts=680b2a5e a=zhjrEmeF1h7dvwADATEXqg==:617 a=xqWC_Br6kY4A:10 a=foHCeV_ZAAAA:8 a=NEAV23lmAAAA:8 a=d70CFdQeAAAA:8 a=pGLkceISAAAA:8 a=DfNHnWVPAAAA:8 a=3dKqiOQ481rCDcXDbeoA:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22 a=rjTVMONInIDnV1a_A2c_:22
X-CM-Envelope: MS4xfO/U11xHBc6NKCYWvLyxZbJBge2hMnQqdgDEx0E8gWNTEiXd63UsPYSMmPit2UIkdTfKn5rXwRlWqokSC2AuznZxcrnxYi45bxZ2In2gYcePKHEC2toO 484+9RhKWDswHB9VlZ5na++nsMHoknOd9gdlsdFToAdfuipcX9WmAzQ+LOVkGNMMw8imm0rhkp9PO9/7V+xu/8emtGxq6LL1yne7f+vARDxzxcEwbSKI+DuD RMktwvx6zYUM4WEgpNSh/IPdUp3BEgtvTxNRkt468HI2+XqRWRM3zKzjdmaEJDtzI8cKdDmCyhCm6rC7QHT7YMsoH9b+a8gVzgRvJTWdgiM=
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 06:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215426

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Remove 2 patches now included upstream.

Changelog:
https://www.alsa-project.org/wiki/Changes_v1.2.13_v1.2.14

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 ...restore.rules-fix-alsa_restore_go-st.patch | 42 -------------------
 ...restore.rules-fix-AMD-acp-pdm-mach-l.patch | 35 ----------------
 ...a-utils_1.2.13.bb =3D> alsa-utils_1.2.14.bb} |  7 +---
 3 files changed, 2 insertions(+), 82 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-=
90-alsa-restore.rules-fix-alsa_restore_go-st.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0002-alsactl-=
90-alsa-restore.rules-fix-AMD-acp-pdm-mach-l.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.13.bb =3D> alsa-util=
s_1.2.14.bb} (95%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-90-alsa=
-restore.rules-fix-alsa_restore_go-st.patch b/meta/recipes-multimedia/als=
a/alsa-utils/0001-alsactl-90-alsa-restore.rules-fix-alsa_restore_go-st.pa=
tch
deleted file mode 100644
index ea02fdb8c5..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-90-alsa-restor=
e.rules-fix-alsa_restore_go-st.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From f90124c73edd050b24961197a4abcf17e53b41a8 Mon Sep 17 00:00:00 2001
-From: Jaroslav Kysela <perex@perex.cz>
-Date: Thu, 14 Nov 2024 09:38:49 +0100
-Subject: [PATCH 1/2] alsactl: 90-alsa-restore.rules - fix alsa_restore_g=
o/std
-
-Fix the label mismatch which was introduced in the transition from the
-temporary test rules.
-
-Closes: https://github.com/alsa-project/alsa-utils/issues/280
-Fixes: 8116639 ("alsactl: 90-alsa-restore.rules - add support for AMD AC=
P digital microphone")
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-Upstream-Status: Backport [https://github.com/alsa-project/alsa-utils/co=
mmit/f90124c73edd050b24961197a4abcf17e53b41a8]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- alsactl/90-alsa-restore.rules.in | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/alsactl/90-alsa-restore.rules.in b/alsactl/90-alsa-restore.=
rules.in
-index 85f0b15f4856..dae2ed8ccc8f 100644
---- a/alsactl/90-alsa-restore.rules.in
-+++ b/alsactl/90-alsa-restore.rules.in
-@@ -3,6 +3,8 @@
- ACTION=3D=3D"add", SUBSYSTEM=3D=3D"sound", KERNEL=3D=3D"controlC*", KER=
NELS!=3D"card*",@extratest@ GOTO=3D"alsa_restore_go"
- GOTO=3D"alsa_restore_end"
-=20
-+LABEL=3D"alsa_restore_go"
-+
- ENV{ALSA_CARD_NUMBER}=3D"$attr{device/number}"
-=20
- # mark HDA analog card; HDMI/DP card does not have capture devices
-@@ -21,7 +23,7 @@ TEST!=3D"/run/udev/alsa-hda-analog-card", GOTO=3D"alsa=
_restore_std"
- IMPORT{program}=3D"/usr/bin/cat /run/udev/alsa-hda-analog-card"
- ENV{ALSA_CARD_HDA_ANALOG}!=3D"", ENV{ALSA_CARD_NUMBER}=3D"$env{ALSA_CAR=
D_HDA_ANALOG}"
-=20
--LABEL=3D"alsa_restore_go"
-+LABEL=3D"alsa_restore_std"
- TEST!=3D"@daemonswitch@", RUN+=3D"@sbindir@/alsactl@args@ restore $env{=
ALSA_CARD_NUMBER}"
- TEST=3D=3D"@daemonswitch@", RUN+=3D"@sbindir@/alsactl@args@ nrestore $e=
nv{ALSA_CARD_NUMBER}"
-=20
---=20
-2.25.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0002-alsactl-90-alsa=
-restore.rules-fix-AMD-acp-pdm-mach-l.patch b/meta/recipes-multimedia/als=
a/alsa-utils/0002-alsactl-90-alsa-restore.rules-fix-AMD-acp-pdm-mach-l.pa=
tch
deleted file mode 100644
index 2299718d14..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-utils/0002-alsactl-90-alsa-restor=
e.rules-fix-AMD-acp-pdm-mach-l.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6f7ce73159c02b726a6f0fe0acff961c95e337a8 Mon Sep 17 00:00:00 2001
-From: Aaron Ma <aaron.ma@canonical.com>
-Date: Wed, 20 Nov 2024 15:55:02 +0800
-Subject: [PATCH 2/2] alsactl: 90-alsa-restore.rules - fix AMD acp-pdm-ma=
ch
- link
-
-The link name of AMD ACP digital microphones driver acp-pdm-mach
-is acp-dmic-codec. Fix it to make UCM initialize it again.
-
-Closes: https://github.com/alsa-project/alsa-utils/pull/281
-Fixes: 8116639 ("alsactl: 90-alsa-restore.rules - add support for AMD AC=
P digital microphone")
-Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-Upstream-Status: Backport [https://github.com/alsa-project/alsa-utils/co=
mmit/6f7ce73159c02b726a6f0fe0acff961c95e337a8]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- alsactl/90-alsa-restore.rules.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/alsactl/90-alsa-restore.rules.in b/alsactl/90-alsa-restore.=
rules.in
-index dae2ed8ccc8f..5db6080b0dc6 100644
---- a/alsactl/90-alsa-restore.rules.in
-+++ b/alsactl/90-alsa-restore.rules.in
-@@ -14,7 +14,7 @@ DRIVERS=3D=3D"snd_hda_intel", TEST=3D=3D"device/pcmC$e=
nv{ALSA_CARD_NUMBER}D0p", RUN+=3D"/b
- TEST=3D=3D"device/device/acp3x-dmic-capture", GOTO=3D"alsa_hda_analog"
- TEST=3D=3D"device/device/acp6x-dmic-capture", GOTO=3D"alsa_hda_analog"
- TEST=3D=3D"device/device/acp63-dmic-capture", GOTO=3D"alsa_hda_analog"
--TEST=3D=3D"device/device/acp-pdm-dmic", GOTO=3D"alsa_hda_analog"
-+TEST=3D=3D"device/device/acp-dmic-codec", GOTO=3D"alsa_hda_analog"
- GOTO=3D"alsa_restore_std"
-=20
- LABEL=3D"alsa_hda_analog"
---=20
-2.25.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.13.bb b/meta/rec=
ipes-multimedia/alsa/alsa-utils_1.2.14.bb
similarity index 95%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.13.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb
index 91dcee1453..74b36291d6 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.13.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb
@@ -24,11 +24,8 @@ PACKAGECONFIG[udev] =3D "--with-udev-rules-dir=3D`pkg-=
config --variable=3Dudevdir udev
 PACKAGECONFIG[manpages] =3D "--enable-xmlto, --disable-xmlto, xmlto-nati=
ve docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
=20
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
-SRC_URI =3D "https://www.alsa-project.org/files/pub/utils/alsa-utils-${P=
V}.tar.bz2 \
-           file://0001-alsactl-90-alsa-restore.rules-fix-alsa_restore_go=
-st.patch \
-           file://0002-alsactl-90-alsa-restore.rules-fix-AMD-acp-pdm-mac=
h-l.patch \
-           "
-SRC_URI[sha256sum] =3D "1702a6b1cdf9ba3e996ecbc1ddcf9171e6808f5961d503d0=
f27e80ee162f1daa"
+SRC_URI =3D "https://www.alsa-project.org/files/pub/utils/alsa-utils-${P=
V}.tar.bz2"
+SRC_URI[sha256sum] =3D "0794c74d33fed943e7c50609c13089e409312b6c403d6ae8=
984fc429c0960741"
=20
 # On build machines with python-docutils (not python3-docutils !!) insta=
lled
 # rst2man (not rst2man.py) is detected and compile fails with

