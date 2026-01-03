Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACEBCFC619D
	for <webhook@archiver.kernel.org>; Sat,  3 Jan 2026 21:12:08 +0000 (UTC)
Received: from zebra.cherry.relay.mailchannels.net (zebra.cherry.relay.mailchannels.net [23.83.223.195])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32200.1767474721947066500
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Jan 2026 13:12:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=eI9eXBGd;
 spf=pass (domain: rootcommit.com, ip: 23.83.223.195, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 096077E13C2
	for <openembedded-core@lists.openembedded.org>; Sat, 03 Jan 2026 21:12:01 +0000 (UTC)
Received: from fr-int-smtpout26.hostinger.io (100-112-123-69.trex-nlb.outbound.svc.cluster.local [100.112.123.69])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 5D93A7E1339
	for <openembedded-core@lists.openembedded.org>; Sat, 03 Jan 2026 21:12:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1767474720;
	b=vtalLStYouNr+jAOEk2VI1iCT8wExw3KidBIx/r/JzQLaIVtKtRqBLqTaxbTzknJ+td8YX
	m1EpX89xsYo4k8Brwttwt8ZACVdwcJgLohjtc73SOi8hXiVZS+KQfKn6pyH2iHYBeLxCKd
	/FYZdsbvmuHImyaZLoUuNjysCZa33vsp7ter0djtDQJqCYnoHycaDSoNnrASE8EBec8kKc
	7A+aUdrXLSZi5d/XivdJCwwJh24IHOg/pyoTVzeshC6pugC9vdNr8/UubyFbEagFaVpF0H
	oIBPovH/GgYfoZopghKv9EiLyj5lQmYozFsTiZ49Bt9vWjm/ss3uvDzwqOsszg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1767474720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=nnLk/bEMV4yyUAC2oc5TPeuOqvdDQ2upBeVD0D0Yt5s=;
	b=LZFFWVtWWZraJAnlQMs5LYhGhWIgMCTlebdD/mUk52PmfQ0E2Rz+/wzOxWQO27ZjlNO004
	PROWWbypbJV7Osl/Q/u483HB6oY3lh0PfikeshnPcOrGPmSTXvqk6zixy3SxRUQL4xIR4v
	hUq9pHuTpgMiaM84GoVC9SkD2peYgxwmmdxGJTqEcnuBnWUospg+YJgz3A4N5xP4yftx80
	U56UbDrsydo65+u85CDjJ7xX4Foc52VW7uljxL97HC9MlYnSsdA+OlgVbYsGO62MRWv+3z
	vsfW/emIfSCFeS5YYWla6oNbjD2XxjRuKVZHQlGSNYmgZzVrxekn59/WR7wyaw==
ARC-Authentication-Results: i=1;
	rspamd-85db7f4c96-bqrz9;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Shoe-Stretch: 00db45660c925401_1767474720893_2602424502
X-MC-Loop-Signature: 1767474720893:2084310685
X-MC-Ingress-Time: 1767474720892
Received: from fr-int-smtpout26.hostinger.io (fr-int-smtpout26.hostinger.io
 [148.222.54.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.112.123.69 (trex/7.1.3);
	Sat, 03 Jan 2026 21:12:00 +0000
Received: from a8.lan (unknown [IPv6:2001:861:4450:d360:a56a:87e3:7fae:367e])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dkCtQ4JJxz1xrG;
	Sat,  3 Jan 2026 21:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1767474718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nnLk/bEMV4yyUAC2oc5TPeuOqvdDQ2upBeVD0D0Yt5s=;
	b=eI9eXBGdw/PgH0ll0vpq4OvqODaR+FTpH81vldxcDuStkq2MhdaO06gKq+jwOyTa5Ze6QM
	Q5JmgEGmH+rOrMP5pFZwzLiumUqj5/SV8G0dldNzv1FkXdZMWzbNEnRBHFU9fkHgtB9R45
	YLlXi729+DlJbkhD165FeVJIhyUVO2gt7Z++joLLbWH3giFy9+X9S8iaH6UQ1QwDsmCm/k
	OurWByJePm9tAHsbrhEFALSJR9AQ7H3Z3juK0PE+rr2jUfWufbcxSSlN7yH6QcfS/sqHwQ
	/T5ruV9a0PhUs2LnjLTzifMIVS65ljRT3h+RflNZ9k8HohQ3YX7Rl6sNfCAN7Q==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 2/4] alsa-utils: upgrade 1.2.15 -> 1.2.15.1
Message-ID: <20260103211155.51433-2-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260103211155.51433-1-michael.opdenacker@rootcommit.com>
References: <20260103211155.51433-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Sat,  3 Jan 2026 21:11:58 +0000 (UTC)
X-CM-Envelope: MS4xfJkCFXlGhg44i86Z4Rkc99BhtZEw94irC9aZPIrs13x245aXzBb/s5QwACmFMMxcDTHiLo3Fq1V+7LiZQthJFE9WTyvMO2yap2k4Vk5ZiX+tlYEMsy+T IWOBfsy5P9VkxGN2n7Tku4frVzJz0b/xctXpsAQ/IoOPGf5GXFv41gAgV/pxq2mR2t+obGMrW6I9TbystGSDwCLuJ/sfR2J3OErF/onEv1iNRAyZuA10gZ2e Yd1V6Tw9SfOhzc39zg6e0+lV8wo8OeiBOq9xExZbPdwzLLIolemE5pMCuUvPUAqTQWWSAmIQN12S0rEWj9dHmOXyFedWd4zijCRHVZkFI8c=
X-CM-Analysis: v=2.4 cv=B9fr0/tM c=1 sm=1 tr=0 ts=6959861e a=j106YqD2ESRJk0lKD0wP4w==:617 a=xqWC_Br6kY4A:10 a=foHCeV_ZAAAA:8 a=NEAV23lmAAAA:8 a=d70CFdQeAAAA:8 a=cmWlzMUdAAAA:8 a=ZaYKwEXCwNSZvG51DJQA:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22 a=93ApFmx_MQ_BoSUK457J:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Jan 2026 21:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228850

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Upstream changes: alsactl and aplay fixes
https://www.alsa-project.org/wiki/Changes_v1.2.15_v1.2.15.1

Remove no longer necessary patch:
0001-alsactl-fix-build-when-in-subdirectory.patch

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 ...sactl-fix-build-when-in-subdirectory.patch | 29 -------------------
 ...utils_1.2.15.bb =3D> alsa-utils_1.2.15.1.bb} |  5 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils-1.2.15/0001-a=
lsactl-fix-build-when-in-subdirectory.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.15.bb =3D> alsa-util=
s_1.2.15.1.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.2.15/0001-alsactl-=
fix-build-when-in-subdirectory.patch b/meta/recipes-multimedia/alsa/alsa-=
utils-1.2.15/0001-alsactl-fix-build-when-in-subdirectory.patch
deleted file mode 100644
index d1c6b3d830..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-utils-1.2.15/0001-alsactl-fix-bui=
ld-when-in-subdirectory.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 10587067fcf5b05e7fa5a84c38238dbffd079c4f Mon Sep 17 00:00:00 2001
-From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
-Date: Mon, 8 Dec 2025 11:12:34 +0000
-Subject: [PATCH] alsactl: fix build when in subdirectory
-
-From: Rudi Heitbaum <rudi@heitbaum.com>
-
-create the conf directory as part of the edit recipe
-
-Closes: https://github.com/alsa-project/alsa-utils/pull/311
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-Upstream-Status: Backport [10587067fcf5b05e7fa5a84c38238dbffd079c4f]
----
- alsactl/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/alsactl/Makefile.am b/alsactl/Makefile.am
-index 48b7c7a..c8729e0 100644
---- a/alsactl/Makefile.am
-+++ b/alsactl/Makefile.am
-@@ -47,6 +47,7 @@ endif
- edit =3D \
- 	extratest=3D$$(echo ' $(ALSACTL_UDEV_EXTRATEST)' | sed -e 's/__/ /g' -=
e 's/^ $$//'); \
- 	args=3D$$(echo ' $(ALSACTL_UDEV_ARGS)' | sed -e 's/__/ /g' -e 's/^ $$/=
/'); \
-+	mkdir -p conf; \
- 	$(SED) -r -e 's,@sbindir\@,$(sbindir),g' \
- 		  -e 's,@mydatadir\@,$(mydatadir),g' \
- 		  -e 's,@daemonswitch\@,$(ALSACTL_DAEMONSWITCH),g' \
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb b/meta/rec=
ipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
index 09b3de81f4..dad5478f39 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
@@ -24,9 +24,8 @@ PACKAGECONFIG[udev] =3D "--with-udev-rules-dir=3D`pkg-c=
onfig --variable=3Dudevdir udev
 PACKAGECONFIG[manpages] =3D "--enable-xmlto, --disable-xmlto, xmlto-nati=
ve docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
=20
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
-SRC_URI =3D "https://www.alsa-project.org/files/pub/utils/alsa-utils-${P=
V}.tar.bz2 \
-	   file://0001-alsactl-fix-build-when-in-subdirectory.patch"
-SRC_URI[sha256sum] =3D "d3183d2ed2d69e9143c5beb97036267c3fdabfe8bfbea8bc=
6863f17b1f0b568e"
+SRC_URI =3D "https://www.alsa-project.org/files/pub/utils/alsa-utils-${P=
V}.tar.bz2"
+SRC_URI[sha256sum] =3D "5ad79f349e59c30c9a4929ad4995ebee33267473e0e632d7=
c1a30e2b093d3327"
=20
 # On build machines with python-docutils (not python3-docutils !!) insta=
lled
 # rst2man (not rst2man.py) is detected and compile fails with

