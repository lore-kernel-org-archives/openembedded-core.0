Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A048CD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:13:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47154.1778494418754093220
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 03:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=oF4/4Ohr;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A53281A3501
	for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 10:13:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A81460646
	for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 10:13:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9326111AEA405;
	Mon, 11 May 2026 12:13:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778494416; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=cRwBTTu6i1rvDjwm/PQgPaB/ry3gOS5kjpfYv7zyzOg=;
	b=oF4/4OhrzqgRVYUdY5AkLgP1w6GKBsLos3xJGYSk0rod6QWKWc8/9TSkQYxAjQV8CXdZry
	blm3Lc6Ct2n7XhYqYHOjNA/54J94rpXDuDM3Oo7ZHeVDMHM9fwmmH/naoI4I7w2jrmj+Cj
	UGqPCwU1lAGE9ArBU03tMr3CDnJPOY7Qj662YJ+WAiWxIOxOfpvjDZXiXopu2hQxSQ+Nsn
	/cNvBEIpzM3tJPUJsW1y1cZGzNxiea4YBAPd8/c73RxNpD4URvN0kPArGXzeJeVGS54G8u
	vpmbdqetyLkOkgc0LZkViAbMjTeiLDSvAtBbTwrYKpDUGLoAu3GceQs6ij7Rsw==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] scripts/makefile-getvar: quote MAKEFILE variable
Date: Mon, 11 May 2026 12:13:27 +0200
Message-ID: <20260511101327.1171728-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 10:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236801

From: Thomas Perrot <thomas.perrot@bootlin.com>

$MAKEFILE was unquoted in the -f test and the error echo, causing
word-splitting on paths that contain spaces.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 scripts/makefile-getvar | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/makefile-getvar b/scripts/makefile-getvar
index e8a983276676..238d9567adce 100755
--- a/scripts/makefile-getvar
+++ b/scripts/makefile-getvar
@@ -20,8 +20,8 @@ fi
 MAKEFILE=3D$1
 shift
=20
-if [ ! -f $MAKEFILE ]; then
-	echo $MAKEFILE is not a file
+if [ ! -f "$MAKEFILE" ]; then
+	echo "$MAKEFILE is not a file"
 	exit 1
 fi
=20
--=20
2.54.0


