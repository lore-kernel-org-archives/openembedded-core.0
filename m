Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1130D65C78
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 16:05:57 +0000 (UTC)
Received: from rusty.tulip.relay.mailchannels.net (rusty.tulip.relay.mailchannels.net [23.83.218.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18521.1765987552916468011
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 08:05:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=MxJaGH9p;
 spf=pass (domain: rootcommit.com, ip: 23.83.218.252, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 5EC21541B0C
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 16:05:52 +0000 (UTC)
Received: from fr-int-smtpout20.hostinger.io (100-109-39-174.trex-nlb.outbound.svc.cluster.local [100.109.39.174])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 7DFF5541082
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 16:05:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765987550;
	b=YIg8wE7l45C1Wj5qgjkYH27AYvSZqH8LFIPclHo8w5utqo3ifjflFG7mh3cck+sGeXLoFo
	Q1tyxhCjSIQiAn9Vwf2RoCRw5WWHtpM6c7gen1isPX4D8CnNRW0seSocmOXBaJ7sFymmxE
	yvUtm4s/xSdSQVvh3L50GqTV6olGVOeFFC9sFIlFqbMEvUt3e91oFbB/cJteGv+5FiFCDB
	7rA4MsZL52+Pkii/b+wD6ARcTO24XYdN2lq+MEp+AY+Wtiz5llcZfWPqvbQMZJWg6rkzfw
	0ob2a7L7AHGgZk3Lx77KDILK8A2Ylw9sMnVz4s9s7FvGxpMUZ5OfVVQASlBopA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765987550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=C26md0zUiMBb0COf3eQmIKpq4KIyWAFSot7JcYgyTMc=;
	b=orWDPLUO1GTbam4Z/Si29/c6g1g6efBEPKIezvEXTFi1QhLX20k/12a9w2LHg23eKhMdp3
	EGJf2+GycyCSvsEeSNjAec7RQvKWGh5PPfko+unhnK4CveULndBOamgcxkfiSAxDn6ooNA
	l0qd/khbsRFzxwPYh0DFeKQMb2ZhwdW1evvSw8WVmjlwxHlrU4nIJuNz+9H6gqUZbGYAZu
	iH4zQWpOiKI74iDO9oPk8emEKTbi0jiIsvCwqVuDoB1/xvhRG7QQiGt/9dVvXrXPI1UxRw
	3EDM7snfjKbpOU1DNF0y94MXaTAJ6w5S0vl6YZr+Qr4URM92NSRu8lY3R4RRtw==
ARC-Authentication-Results: i=1;
	rspamd-6ccd5b4cc5-s8m8f;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Bitter-Illustrious: 68b753623387d59c_1765987551026_4180446894
X-MC-Loop-Signature: 1765987551026:1251164586
X-MC-Ingress-Time: 1765987551026
Received: from fr-int-smtpout20.hostinger.io (fr-int-smtpout20.hostinger.io
 [148.222.54.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.109.39.174 (trex/7.1.3);
	Wed, 17 Dec 2025 16:05:51 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:ea5c:9c0:3076:4dda])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dWdv059gPz1xsy;
	Wed, 17 Dec 2025 16:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765987548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C26md0zUiMBb0COf3eQmIKpq4KIyWAFSot7JcYgyTMc=;
	b=MxJaGH9pi7xUcfVLuPiFaagI8B8OalhcbnLQLktmuYb/n4iV4hgdFYCdsamQIWvgRbwh/G
	aXN4o6gbGjmzN0sntaykK1O5fzaiNYznvzH0uAC+koXKn4JGeWb+/aFUIxAr8Qs5pneGpQ
	ZeLbVOVG7M3sgyb8xiIS8q8jpmxOYWJXzsoLFYST997iTdCLcjCEdvAKM+qNw6dhKjHMHw
	GRx7sdGKSv8z7S+JtXalU5GhRAcNgZ3F33wl0buMbiY9lP1TMfyJQ5AbjIqG8z77QA/0hg
	yk1DktH7fcys7AcMCbX9UvnpEaz0GTVsQnQ6A529Qk8bYCzdKCSWn+v3yGQIsw==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v2 2/5] alsa-utils: upgrade 1.2.14 -> 1.2.15
Message-ID: <20251217160533.600164-3-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217160533.600164-1-michael.opdenacker@rootcommit.com>
References: <20251217160533.600164-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 16:05:48 +0000 (UTC)
X-CM-Envelope: MS4xfL7Y2ivbSQQpcdtaF1PpjipglCLq0vB1wHTAQYRIheQsd1D2makPSGR3dPl+DqBM9sOfHe9slJiVQQQPkUQOTKmus0WJZNP0EX0Sb/3q7OSXWPfb3cdb fP9m2Amjq3Br4iUpUA24rUGHCQNAE6OijYrQMtDW3RIxjzXx4a55hueOxyAYGG8LQNpoNjQr1uB+EZ28OGtLsf1OhQxwVJIcjhKh+pkFTi2XqnsFpBXtBoWu c+xONVQur3cmRF+1U/YKfV383KBWMcTAFRPKfdN7jFiizRD5NjT1YnV1w6e/QQkzqXgEx8wIo5AnB/PkshxTQKGw4PeBxyKW+cGvyLIoxDG0G1LAqcOTXzWu TKtGexNs
X-CM-Analysis: v=2.4 cv=B9fr0/tM c=1 sm=1 tr=0 ts=6942d4dc a=MKCPbgLKPPUpDiypvfdhzA==:617 a=xqWC_Br6kY4A:10 a=NEAV23lmAAAA:8 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=cmWlzMUdAAAA:8 a=dH4SncJJTOH0aEAj5-sA:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22 a=93ApFmx_MQ_BoSUK457J:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 16:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228068

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Include a fix from upstream fixing a build issue:
https://github.com/alsa-project/alsa-utils/commit/10587067fcf5b05e7fa5a84=
c38238dbffd079c4f

Upstream changes:
https://www.alsa-project.org/wiki/Changes_v1.2.14_v1.2.15#alsa-utils

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 ...sactl-fix-build-when-in-subdirectory.patch | 29 +++++++++++++++++++
 ...a-utils_1.2.14.bb =3D> alsa-utils_1.2.15.bb} |  7 +++--
 2 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils-1.2.15/0001-a=
lsactl-fix-build-when-in-subdirectory.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.14.bb =3D> alsa-util=
s_1.2.15.bb} (96%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.2.15/0001-alsactl-=
fix-build-when-in-subdirectory.patch b/meta/recipes-multimedia/alsa/alsa-=
utils-1.2.15/0001-alsactl-fix-build-when-in-subdirectory.patch
new file mode 100644
index 0000000000..d1c6b3d830
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils-1.2.15/0001-alsactl-fix-bui=
ld-when-in-subdirectory.patch
@@ -0,0 +1,29 @@
+From 10587067fcf5b05e7fa5a84c38238dbffd079c4f Mon Sep 17 00:00:00 2001
+From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
+Date: Mon, 8 Dec 2025 11:12:34 +0000
+Subject: [PATCH] alsactl: fix build when in subdirectory
+
+From: Rudi Heitbaum <rudi@heitbaum.com>
+
+create the conf directory as part of the edit recipe
+
+Closes: https://github.com/alsa-project/alsa-utils/pull/311
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+Upstream-Status: Backport [10587067fcf5b05e7fa5a84c38238dbffd079c4f]
+---
+ alsactl/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/alsactl/Makefile.am b/alsactl/Makefile.am
+index 48b7c7a..c8729e0 100644
+--- a/alsactl/Makefile.am
++++ b/alsactl/Makefile.am
+@@ -47,6 +47,7 @@ endif
+ edit =3D \
+ 	extratest=3D$$(echo ' $(ALSACTL_UDEV_EXTRATEST)' | sed -e 's/__/ /g' -=
e 's/^ $$//'); \
+ 	args=3D$$(echo ' $(ALSACTL_UDEV_ARGS)' | sed -e 's/__/ /g' -e 's/^ $$/=
/'); \
++	mkdir -p conf; \
+ 	$(SED) -r -e 's,@sbindir\@,$(sbindir),g' \
+ 		  -e 's,@mydatadir\@,$(mydatadir),g' \
+ 		  -e 's,@daemonswitch\@,$(ALSACTL_DAEMONSWITCH),g' \
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb b/meta/rec=
ipes-multimedia/alsa/alsa-utils_1.2.15.bb
similarity index 96%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
index 3cbb9b464b..8fae1cfd9e 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
@@ -24,14 +24,15 @@ PACKAGECONFIG[udev] =3D "--with-udev-rules-dir=3D`pkg=
-config --variable=3Dudevdir udev
 PACKAGECONFIG[manpages] =3D "--enable-xmlto, --disable-xmlto, xmlto-nati=
ve docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
=20
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
-SRC_URI =3D "https://www.alsa-project.org/files/pub/utils/alsa-utils-${P=
V}.tar.bz2"
-SRC_URI[sha256sum] =3D "0794c74d33fed943e7c50609c13089e409312b6c403d6ae8=
984fc429c0960741"
+SRC_URI =3D "https://www.alsa-project.org/files/pub/utils/alsa-utils-${P=
V}.tar.bz2 \
+	   file://0001-alsactl-fix-build-when-in-subdirectory.patch"
+SRC_URI[sha256sum] =3D "d3183d2ed2d69e9143c5beb97036267c3fdabfe8bfbea8bc=
6863f17b1f0b568e"
=20
 # On build machines with python-docutils (not python3-docutils !!) insta=
lled
 # rst2man (not rst2man.py) is detected and compile fails with
 # | make[1]: *** No rule to make target 'alsaucm.1', needed by 'all-am'.=
  Stop.
 # Avoid this by disabling expicitly
-EXTRA_OECONF =3D "--disable-rst2man"
+# EXTRA_OECONF =3D "--disable-rst2man"
=20
 inherit autotools gettext pkgconfig manpages
=20

