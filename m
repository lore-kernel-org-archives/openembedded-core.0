Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8068FD65559
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 12:17:26 +0000 (UTC)
Received: from beige.elm.relay.mailchannels.net (beige.elm.relay.mailchannels.net [23.83.212.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13689.1765973842035944958
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 04:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=DQR5vCYO;
 spf=pass (domain: rootcommit.com, ip: 23.83.212.16, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 5EEF08A13E4
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:17:21 +0000 (UTC)
Received: from de-fra-smtpout7.hostinger.io (trex-green-2.trex.outbound.svc.cluster.local [100.108.184.183])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id BC3298A0FEC
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:17:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765973841;
	b=ntfA+ml0Fa7lBR8B+Xmn0ZqPYNmFijZKs//y0ZPu3oXZjYAsg2G1XbVdwn50mflP/QSEG9
	MVIDuG2D1Qm3G93k5F3mlK8noaMd4n99FkqfwjJ3iPxiF9roNvBgQOHbnlqFCis1TI0p6T
	W86qO1xWk5QdnGpPfCkmSC1Umn/dnioFj/VBixN61NuE7r1vUP/9K0qdGyqnNX+b5UlEZt
	JWHNcMgpN99HQeFZbxOCtwLn0jGxpjM19z3kykb4r/SNnx/w1MmlIkihnrhZoPNijYNUKM
	11xsWU2eESIU3bVL7dKH1kADazQxI9uppv5OOatEKhLHfr3j9dA5gcCJzk7fkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765973841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=C26md0zUiMBb0COf3eQmIKpq4KIyWAFSot7JcYgyTMc=;
	b=rNrr5Kz6TGoGxlFob8JTx2EgQqTDdWED//y90i4IUt0ufjTrEdrPsIV/AAOHDpTCDLUvY8
	PhXOnKUlwAyw1frCVcoa5DKpW3ALzsFc1OB+rQ9nMoN4C5urqA4od0RdHnlJm04EH6rUeE
	s5l+ixLLeSL+eBtJorWffhtkZ+7ZG7CbLBbhYSpEFmKabUcXuntrGUsddB7mZXnxvZFRbe
	6M/z/APHiixAuLwF1j9HWGK8UE23DePkbykeyC/7yJ8VDE56GDK4dT8VNFoz70TJxSdXUp
	MujZReqJwjcsDbiE7DlyTk4UKiF16hy3OnlfawTu0+ydcZb0u+Y48fq5eVCIjA==
ARC-Authentication-Results: i=1;
	rspamd-6ccd5b4cc5-r97t4;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Squirrel-Print: 451ba484427aca5b_1765973841279_552208932
X-MC-Loop-Signature: 1765973841279:1750375499
X-MC-Ingress-Time: 1765973841279
Received: from de-fra-smtpout7.hostinger.io (de-fra-smtpout7.hostinger.io
 [148.222.55.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.184.183 (trex/7.1.3);
	Wed, 17 Dec 2025 12:17:21 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:8e2b:fce5:ec42:f176])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dWXqL6NR5z3wcJ;
	Wed, 17 Dec 2025 12:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765973839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C26md0zUiMBb0COf3eQmIKpq4KIyWAFSot7JcYgyTMc=;
	b=DQR5vCYOVS1NNGmJHL6ShHkmjRloWLO51Jt85PDq1Sj8Fly+J4d3BFrG5UZ2RdETI2949+
	Z1txO3c80TCGIJP9tuhzPAmkxhTv40Vyj43TEIe2u1tRZTeiWMNu8du43yy/2k48JfD8cs
	lBa+r+MUzvd6cPAg5Cr4yblxKgmGUKtw3Nu2lTtxoIlFrRMFI86zmqYyG7HZyMiwVkoQIY
	uVoEm9Sc9H40UZE+cgKt7S0bY26wPhFdCd9TCepMPahD42QTf9ey+c5Pi+BhzZvW6V1nln
	d3c2BFeJZsP1IEQM7SysB9A+5MNv7O70mctWne10Y7RCEZXByhUBYLhmx/lm+A==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 2/5] alsa-utils: upgrade 1.2.14 -> 1.2.15
Message-ID: <20251217121705.391288-3-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217121705.391288-1-michael.opdenacker@rootcommit.com>
References: <20251217121705.391288-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 12:17:18 +0000 (UTC)
X-CM-Envelope: MS4xfBh13Emj9WrLdGRtSdmZIATge3M1gEJy9aMlgXt4ch95ZiVCrF1mYvpVLRgoye3Ovk9C8a6phqU/TI7Ie3ByZFOPoSmUGjaVwiCWkYhNWvji7xwbp5Lx IgdX3J6q4FC2Scwai4evka9NmUjm103VzEjY0f5llIB5O7dxPjDIJwQsNF68lNEU1PWbVxIfKVTxbP9nxTv5xMNy1LYcqcqfLIaXbaTG5vH36OKn3f6u0W7e fXx1yXDalAEyaMYY3sCprEf5M9jefZlpzaNxl8Wg/OCuR03o6iytDLOKHNGNbfocQVMt3GCWIaP2dZO8lczzhwVzkubn2/VEvpEUtdDMucF+TnYTFxmJQ1V1 RW/jL7Th
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=69429f4e a=JY/OoRUBqPoXaiLUhbiEKg==:617 a=xqWC_Br6kY4A:10 a=NEAV23lmAAAA:8 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=cmWlzMUdAAAA:8 a=dH4SncJJTOH0aEAj5-sA:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22 a=93ApFmx_MQ_BoSUK457J:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228026

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

