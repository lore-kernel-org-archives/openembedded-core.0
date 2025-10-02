Return-Path: <rtie@gmx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD933CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 09:59:35 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by mx.groups.io with SMTP id smtpd.web10.4695.1759399169679534878
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 02:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=rtie@gmx.de header.s=s31663417 header.b=X6B6bInL;
 spf=pass (domain: gmx.de, ip: 212.227.17.22, mailfrom: rtie@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1759399168; x=1760003968; i=rtie@gmx.de;
	bh=ABDA8UfhtSMfZjIzU6dU1lzLMiuFjZgML6r641Y7nzM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=X6B6bInLSbeqjpWnc8kFbXdHUPY+8aej9Yp+yUTBSvk/9CQlfhrf7spPQVlFvHjy
	 unmUyTlC+CN1RMYyVpl1gcu8TD5Vty6DeqAs/Tb2puq8d4aIPLCqV0260iXhHV016
	 qcpxASUHVM39N8pdeqSLBX/t+mc/HbZFTdwzT/MyVwgNxsTI2EaYHXccNecCzcbeR
	 wJ2JoHjD2xMwww72kOM+bDQisVtbnKexmiLCs7zXqNWSrrG5toAmabuwCxUHuQFPQ
	 QV8FIa59eJYBYdLU0fyanJAPOQDK44ZWeuMS0JAB6MivVfVt0TsPKjFl1sc1shZCa
	 mMKAovwerxH1B+46RA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from bugfish.tua.local ([87.245.7.122]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeCtj-1uTp0q3LPz-00pzJS; Thu, 02
 Oct 2025 11:59:27 +0200
From: Robert Tiemann <rtie@gmx.de>
To: openembedded-core@lists.openembedded.org
Cc: Robert Tiemann <rtie@gmx.de>
Subject: [PATCH 1/2] udev-extraconf: Speed up mount.sh
Date: Thu,  2 Oct 2025 11:59:24 +0200
Message-ID: <20251002095925.2521779-2-rtie@gmx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251002095925.2521779-1-rtie@gmx.de>
References: <20251002095925.2521779-1-rtie@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ao3iDKkTYKEhXsElQJjmOuPZXjSS1KOY0zA3kE6dBbzvBcI4ERj
 tY8/Oo2tGNUmYu7fdSnkvCJX714rZJSU+vM5tJuDmlXwkIkNUXtCkgO2mJoL0/iCE81nrdO
 CehF1JeJq2AQIRY7z4Hzoets5O3o4G0xp+Hqh7vr6BIKL/SnJ7TiChWNiKlDq+wLGhNwhoA
 krfWwFGwllOs2tQKdNI4w==
UI-OutboundReport: notjunk:1;M01:P0:zeVzZwAO0WM=;aQSr0Et4Z6g26Tth1F+GzCQnK/F
 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
 SFmyo+y5ccc13ZYdFXmIJFgvRE=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 09:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224347

On devices with many partitions, running blkid without parameters can
be rather slow because all block devices are inspected:

$ time /sbin/blkid
real    0m0.474s
user    0m0.026s
sys     0m0.172s

versus

$ time /sbin/blkid /dev/mmcblk0p10
real    0m0.027s
user    0m0.002s
sys     0m0.018s

Plugging in a device with 5 partitions means that mount.sh is going to
be executed 5 times, and so will be blkid. In the real-world case
outlined above, this adds up to an overhead of about 2.3 seconds for
blkid alone.

This commit changes mount.sh so that the block device of interest is
passed directly to blkid such that blkid inspects only that device,
leading to significant speedup.

Signed-off-by: Robert Tiemann <rtie@gmx.de>
=2D--
 meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes=
-core/udev/udev-extraconf/mount.sh
index 0cbae48729..fe78f3aba5 100644
=2D-- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -178,7 +178,7 @@ rm_dir() {
=20
 get_label_name() {
 	# Get the LABEL or PARTLABEL
-	LABEL=3D`/sbin/blkid | grep "$1:" | grep -o 'LABEL=3D".*"' | cut -d '"' =
-f2`
+	LABEL=3D`/sbin/blkid "$1" | grep -o 'LABEL=3D".*"' | cut -d '"' -f2`
 	# If the $DEVNAME has a LABEL or a PARTLABEL
 	if [ -n "$LABEL" ]; then
 	        # Set the mount location dir name to LABEL appended
=2D-=20
2.43.0


