Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AD0C369D7
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 06:23:26 +0000 (UTC)
Received: from brown.birch.relay.mailchannels.net (brown.birch.relay.mailchannels.net [23.83.209.23])
 by mx.groups.io with SMTP id smtpd.web11.1315.1745562197239800696
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 23:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=GUpwhwCT;
 spf=pass (domain: rootcommit.com, ip: 23.83.209.23, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 979B91620A2
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 06:23:16 +0000 (UTC)
Received: from nl-srv-smtpout9.hostinger.io (trex-6.trex.outbound.svc.cluster.local [100.113.55.196])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 01DB916269D
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 06:23:15 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1745562196; a=rsa-sha256;
	cv=none;
	b=fDNTsg+mkiLbrycsdV4ruPnn1f99iMCRPCsOWgwHbGbBzgW+Ig0Zw4rdfzrlYrSKBnkWT0
	IawAN/Baz+yR8i2o3PyCAS0L/GEKceHlyKbf86P2kw+ZW9lwX5MzlnIhvkmIo28r+3cfWP
	1+UVE66GYYgwLtwNZmeyxKgTyMDcmc0qgTo7cyGYP3qYA/yZhbEA90Xj8vTGm/mJMi7mXA
	Ie+WiKSOeOJ5dlFaWAYykznL/oUvzfJY8lC4uqDf8QF8XcNR/NY7k4912VrrUr1myl1eBi
	kzg+uweXWwViizIi6darG+X3mZwkHueULhT1qgmwWpNK0oHn/m2A8UYbi+3vQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1745562196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=w8vSAFvleygL2SPV8qAnUTCK9/0Ej7Y0EYd4XLUu0SY=;
	b=5Vtsg3AS0e0cH0se0wqZn5yjDL37gJplHMQ/hRlb7TRYiKDX1GLGSO59rVJsX3s5G6IYE6
	jFYEFOG0FPsX6+g+LM0gkUy+puEL6hs9V1a++mmSQKoOISUJE7k/kcgIt2gcoOzU2QC4zn
	QgiFJPXdMU9urJ7vYg9ROFv/iFtz/jrnoYd/apboHdW4KjW3oRM67UiWnQbdzzEOG5ab4c
	o/ybsPkfG2ILudmyAZoUFQdgw5hMlc0QJtq1toVjuxcq0lqHyL6QM4KdoURo7yYWYLUBRt
	ZBwPvRiRujo8OB7gh1c6Bf7TL1xUiAvb0pi2T5oisXny5xz3vAPaCauYLiLIfA==
ARC-Authentication-Results: i=1;
	rspamd-5cfcf5665-8vngp;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Bad
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Skirt-Snatch: 640a83d546e807b2_1745562196508_1232537809
X-MC-Loop-Signature: 1745562196508:985367899
X-MC-Ingress-Time: 1745562196507
Received: from nl-srv-smtpout9.hostinger.io (nl-srv-smtpout9.hostinger.io
 [45.87.82.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.113.55.196 (trex/7.0.3);
	Fri, 25 Apr 2025 06:23:16 +0000
Received: from a8.lan (unknown [IPv6:2001:861:4448:6b00:49e:d65c:81ed:4ae2])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4ZkN7j6PgCzGY3qr;
	Fri, 25 Apr 2025 06:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1745562194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w8vSAFvleygL2SPV8qAnUTCK9/0Ej7Y0EYd4XLUu0SY=;
	b=GUpwhwCTMeJ20vCxE740lbhCOTWztTp5uZMBcFzEBB4PdxHI0+ay81yUgjvRSfszDVsih5
	9g9ZRNo8xBQYphVsglk9Prkd6M7MyQsJ+7O+gzBV5jc2a42UnMS7EPHSz9j9HbU4KUTHTM
	tlVv86j3fgQxDLFQgoRrfe8yLHvxTLZcraj9ATOaTKrPlRwS65ao+QmiIaSW0LPqGrb0YE
	IUhc7JQPrXAhVHIm5g6TxAI3LnLocDqje5elUcA8ztFD56HwaKMy66u8X99eO/7FutiJMP
	QuRRxlB+2FYdJhFj1HWh5otgUQApUihCSS8BJuWg3aidbPSw6p2+M5n7+iw5gQ==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 2/4] alsa-tools: upgrade 1.2.11 -> 1.2.14
Message-ID: <20250425062251.2825835-2-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425062251.2825835-1-michael.opdenacker@rootcommit.com>
References: <20250425062251.2825835-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Fri, 25 Apr 2025 06:23:13 +0000 (UTC)
X-CM-Envelope: MS4xfNtHCUtMfFbYjAsJjWQnwm4hVxFKHxmNkx7LjOtxUO5KuMGSpTiqoQzhK+xHOc77UAsrxrk6cofOfBYFOtpWpIFLrSA3SXcQnDHZ9LSM7P7oSDfVokpM zztAr5J9iUobtopA1NbzAUNUWgoHk9d7MMJfU09OyBmCv64sjJ7fj8wCWSfAetLLQ+as9Lqy4w31lxEiJlmMmWVbVMEmfbE7MfQTP84WcEg4Azld/fJMulOD SVW8+O3nazJh6zw6+R2Kpi/Z6lmvpNhvChGi9JvkABZuCDz8RQ8TSY8QyIiW++jOeIxayrNqd2MG7yKUWsjKR/dUj42rhQ9m2Ulo3rM3xwM=
X-CM-Analysis: v=2.4 cv=LJs0Q4W9 c=1 sm=1 tr=0 ts=680b2a52 a=zhjrEmeF1h7dvwADATEXqg==:617 a=xqWC_Br6kY4A:10 a=foHCeV_ZAAAA:8 a=NEAV23lmAAAA:8 a=d70CFdQeAAAA:8 a=pGLkceISAAAA:8 a=bzZzExwL5P2RimiX--oA:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 06:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215424

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Remove 1 patch now included upstream.

Changelog:
https://www.alsa-project.org/wiki/Changes_v1.2.13_v1.2.14

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 ...k-fix-reset_changes_boot-declaration.patch | 26 -------------------
 ...a-tools_1.2.11.bb =3D> alsa-tools_1.2.14.bb} |  5 ++--
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-tools/0001-hdajackr=
etask-fix-reset_changes_boot-declaration.patch
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.2.11.bb =3D> alsa-tool=
s_1.2.14.bb} (95%)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/0001-hdajackretask-f=
ix-reset_changes_boot-declaration.patch b/meta/recipes-multimedia/alsa/al=
sa-tools/0001-hdajackretask-fix-reset_changes_boot-declaration.patch
deleted file mode 100644
index 0892957507..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-tools/0001-hdajackretask-fix-rese=
t_changes_boot-declaration.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 2b666ccbd616e0e0215241cb69b65d69d5146c8c Mon Sep 17 00:00:00 2001
-From: Jaroslav Kysela <perex@perex.cz>
-Date: Mon, 27 Jan 2025 11:02:21 +0100
-Subject: [PATCH] hdajackretask: fix reset_changes_boot() declaration
-
-Upstream-Status: Backport [https://github.com/alsa-project/alsa-tools/co=
mmit/5eaadd15bda4cf0424ee2470a6d304a0c2ce10cb]
-
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- hdajackretask/apply-changes.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hdajackretask/apply-changes.h b/hdajackretask/apply-changes=
.h
-index e08d66d..e431a0d 100644
---- a/hdajackretask/apply-changes.h
-+++ b/hdajackretask/apply-changes.h
-@@ -9,7 +9,7 @@ gboolean apply_changes_reconfig(pin_configs_t* pins, int=
 entries, int card, int
-=20
- gboolean apply_changes_boot(pin_configs_t* pins, int entries, int card,=
 int device,=20
-     const char* model, const char* hints, GError** err);
--gboolean reset_changes_boot();
-+gboolean reset_changes_boot(GError ** err);
-=20
- #endif
-=20
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.2.11.bb b/meta/rec=
ipes-multimedia/alsa/alsa-tools_1.2.14.bb
similarity index 95%
rename from meta/recipes-multimedia/alsa/alsa-tools_1.2.11.bb
rename to meta/recipes-multimedia/alsa/alsa-tools_1.2.14.bb
index 0b884e2075..751d9e8a76 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.2.11.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.2.14.bb
@@ -12,10 +12,9 @@ LIC_FILES_CHKSUM =3D "file://hdsploader/COPYING;md5=3D=
59530bdf33659b29e73d4adb9f9f65
                     file://ld10k1/COPYING.LIB;md5=3Da916467b91076e631dd8=
edb7424769c7 \
                     "
=20
-SRC_URI =3D "https://www.alsa-project.org/files/pub/tools/${BP}.tar.bz2 =
\
-           file://0001-hdajackretask-fix-reset_changes_boot-declaration.=
patch"
+SRC_URI =3D "https://www.alsa-project.org/files/pub/tools/${BP}.tar.bz2"
=20
-SRC_URI[sha256sum] =3D "0915c9634a502fd3655ca9c574d259bc9e79983d91d45aea=
cff6f3c00f8ae3e9"
+SRC_URI[sha256sum] =3D "faef6fdd39ec79c9a5473dc63aa1b6331bf7664a9d452a0a=
8198cec7016cbc6f"
=20
 inherit autotools-brokensep pkgconfig
 # brokensep as as10k1 (and probably more) fail out of tree

