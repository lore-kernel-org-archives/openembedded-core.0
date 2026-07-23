Return-Path: <nora.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAFBC531D2
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 12:50:20 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22721.1784811015448412474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 05:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=h+B103ku;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: nora.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Y/gB6ftHxgJ+mhTO9tvspfLghGMr4T0zKqSYfTsteDw=; b=h+B103kucxjRYnPFyj95zUJuZ0
	gMOZB2ICwzP9Sj2V4VPge1ZXGSSX9MMnTNFN7S1D79HoFtD1PTodtqzc1T9TqDF0VxJiL3R7Z+JPd
	Qp96h8AvRw5PfdB+lbWfB404I0Poy3npkQbxYk444ytO/wwBrTFaXDR9qnzdN5rV0C5RY9Zk0y/Rf
	I7MlrbAmTCdCxNKXICl9UbeSBQ7gIqrozKjlyY85uWWb6SWPR0nN3/Fxx7dX9N/xchsqNxKmWEJoh
	eX4gc6YgpK66hWr6BF2OYhLefwyr5kpk7V2gMF6v8N7TxQm4EgObynZnorHV84jmSQxzAZwGSQmY3
	OFUGOoDw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wmssP-000KwW-1e;
	Thu, 23 Jul 2026 14:50:13 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wmssO-0001T4-38;
	Thu, 23 Jul 2026 14:50:13 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH 3/3] kernel-fit-extra-artifacts: skip building linux.bin if unneeded
Date: Thu, 23 Jul 2026 14:49:44 +0200
Message-ID: <20260723124944.69070-4-nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260723124944.69070-1-nora.schiffer@ew.tq-group.com>
References: <20260723124944.69070-1-nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28069/Thu Jul 23 08:24:48 2026)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 12:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241831

With the introduction of FIT_KERNEL_FILENAME[_COMPRESSED], building
linux.bin can be skipped if any of the two variables is set to a
non-default value, as kernel-fit-image.bbclass will handle the
compression itself.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 meta/classes-recipe/kernel-fit-extra-artifacts.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fit-extra-artifacts.bbclass b/meta/classes-recipe/kernel-fit-extra-artifacts.bbclass
index 385fe9895a..02e7d1273f 100644
--- a/meta/classes-recipe/kernel-fit-extra-artifacts.bbclass
+++ b/meta/classes-recipe/kernel-fit-extra-artifacts.bbclass
@@ -11,7 +11,9 @@ inherit kernel-uboot
 
 kernel_do_deploy:append() {
 	# Provide the kernel artifacts to post processing recipes e.g. for creating a FIT image
-	uboot_prep_kimage "$deployDir"
+	if [ -z "${FIT_KERNEL_FILENAME}" ] && [ "${FIT_KERNEL_FILENAME_COMPRESSED}" = 'linux.bin' ]; then
+		uboot_prep_kimage "$deployDir"
+	fi
 	# For x86 a setup.bin needs to be include"d in a fitImage as well
 	if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
 		install -D "${B}/${KERNEL_OUTPUT_DIR}/setup.bin" "$deployDir/"
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


