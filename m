Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3984D3B7D8
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 17:26:22 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11355.1765041977900126094
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Dec 2025 09:26:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iwkGjLUE;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4DD13C19664;
	Sat,  6 Dec 2025 17:25:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D751C606AC;
	Sat,  6 Dec 2025 17:26:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 41E92102F1956;
	Sat,  6 Dec 2025 18:26:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765041974; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=RTbEX/tECN6lM5TbjLPiWKgAswPTFzRfYl3uXqE3qNQ=;
	b=iwkGjLUEdbJjrjqGuQmgO4uddM61l/+R98GdfngrG0wX1JiQ/28hZF0Wm0asB54g8bvCbP
	3jUOzA1s42nPavUdja6CU0QQl9S/gJqxAPdhOFSOONsPnD+0CKiUW8DCT7slU9N0i9+NWx
	daZYR+9UdrOgiNy2cOjRm/hcEDovp1KRbF5KMceFkY3Q3TXNRPRcYgRmfDE/1mswanaz95
	RVKU2takgaHAnQuVi1OPBX0zYy7LvQCI/w4OFKpa93Axxq3IbCfiS/PH3POnGlhilTEgGd
	YXjS6UX8bRWaUzvHss5DcnRI8kF1K8fZ+UDe3y6XcBPVuMCLF9lxhyyp+lwdSw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 0/2] qemu: backport block image size check fix
Date: Sat, 06 Dec 2025 18:25:50 +0100
Message-Id: <20251206-mathieu-qemu-image-sizes-v1-0-144f17f417a3@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB5nNGkC/x2MSwqEMBAFryK9ngYT8YNXkVmE+NRexE96FFG8u
 2GWBVV1kyIKlNrspohDVJY5gflk5Cc3j2DpE5PNbWlsXnFwv0mw84awswSXDJULygaFd6ZuSl9
 4SvkaMcj5X3ff53kBfQ4GWGoAAAA=
X-Change-ID: 20251206-mathieu-qemu-image-sizes-1e3ca1785c3c
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jon Mason <jon.mason@arm.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765041973; l=1078;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=NnSIBzhVejntW63gJvZ7OX85SWO3l3TnLxnjl89nA+Y=;
 b=Qpcy2rdyZ+5yB4CLek4hj+y8sJfaNzDjEQEbF21i7iNKY5/AlEEyaxdkE4Sp6uzqqcMht1QN+
 tzuXC/ltbTBDvEaBduQb/37ReoXlzuilECTc/Xr83gMqxJznESELVlK
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Dec 2025 17:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227367

Update qemu to the last 10.0 patch version and backport a patch relaxing
requirements on partitions sizes when using sd devices. This should
allow to fix the underlying issue Jon Mason is trying to address with
another patch [1].

[1]: https://lists.openembedded.org/g/openembedded-core/message/226251

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (2):
      qemu: upgrade 10.0.6 -> 10.0.7
      qemu: backport block image size check fix

 ...qemu-native_10.0.6.bb => qemu-native_10.0.7.bb} |   0
 ...tive_10.0.6.bb => qemu-system-native_10.0.7.bb} |   0
 meta/recipes-devtools/qemu/qemu.inc                |   3 +-
 ...rd-Fix-size-check-for-backing-block-image.patch | 126 +++++++++++++++++++++
 .../qemu/{qemu_10.0.6.bb => qemu_10.0.7.bb}        |   0
 5 files changed, 128 insertions(+), 1 deletion(-)
---
base-commit: 293edd0d3d077d0fde7ba6671dc9a26d5b4cf5e4
change-id: 20251206-mathieu-qemu-image-sizes-1e3ca1785c3c

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


