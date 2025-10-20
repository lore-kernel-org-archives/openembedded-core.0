Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D193CCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 16:04:34 +0000 (UTC)
Received: from smarthost01c.sbp.mail.zen.net.uk (smarthost01c.sbp.mail.zen.net.uk [212.23.1.5])
 by mx.groups.io with SMTP id smtpd.web10.993.1760976272329084225
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 09:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=YgoJm8Lu;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.5, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01c.sbp.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mac@mcrowe.com>)
	id 1vAsN4-00EtZS-Gk
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Oct 2025 16:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=PTB0SYGRFqimeg/GRz52L//S8SMNb+HU7n+J/bfPOa8=; b=Yg
	oJm8LueFb35+nXgz051oJKh7HWBObjKf+mJUadVMkeZ93tySyRbbCVJFGbSjOsqT/ZnjYIomR5+yk
	UDooSPNh0flLbg1y0Yhd7pAMBStTPkOOJf2rGgI0ZxZw+BIsColQfmmTpf9USBJZqUFYevlUFvLCM
	xySLFqjzNr9oPe3BPyCD9NjHoZClr37BWM/zxnQuDSMrGXUpnDZDZqEXS4l6EVxkh87Urv4Mb6BUn
	tbkbIxAQq7puakFTzjVzXaem2t3AAWOVgEZyU4GBtcVKXmuYTYiGUWvvfVPsVTNsjhOHajzBkCxKm
	KnpFIhz3VpTPdqJLUkrIw8B68BMNmFzg==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1vAsMY-008juw-2s;
	Mon, 20 Oct 2025 17:03:58 +0100
From: mac@mcrowe.com
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] multilib.bbclass: Filter ROOTFS_RO_UNNEEDED to fix uninstallation
Date: Mon, 20 Oct 2025 17:03:53 +0100
Message-Id: <20251020160353.413127-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-smarthost01c-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 16:04:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225125

From: Mike Crowe <mac@mcrowe.com>

When building an entire multilib image (e.g. lib32-core-image-minimal)
we need to ensure that the unneeded packages in ROOTFS_RO_UNNEEDED get
the multilib prefix applied before they are compared against the list of
installed packages inside Rootfs._uninstall_unneeded() to decide whether
they need to be installed.

Before this change with local.conf containing:

 MACHINE = qemuarm64
 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE:virtclass-multilib-lib32 = "armv7at-neon"
 IMAGE_FEATURES = "read-only-rootfs"

running:
 bitbake lib32-core-image-minimal
 tar tavf tmp/deploy/images/qemuarm64/lib32-core-image-minimal-qemuarm64.rootfs.tar.zst|grep postinst

shows three files:
 -rwxr-xr-x 0/0              25 2018-03-09 12:34 ./etc/init.d/run-postinsts
 lrwxrwxrwx 0/0               0 2018-03-09 12:34 ./etc/rcS.d/S99run-postinsts -> ../init.d/run-postinsts
 -rwxr-xr-x 0/0            2153 2018-03-09 12:34 ./usr/sbin/run-postinsts

whereas with this change there are no matching files.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/multilib.bbclass | 1 +
 1 file changed, 1 insertion(+)

Rootfs._uninstall_unneeded can also try to uninstall run-postinsts
without using the multilib prefix right at the top. I could fix that
with d.expand("${MLPREFIX}run-postinsts") it feels wrong to sully the
generic code with something multilib specific. Advice welcome.

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 677dbc854a..15056dac4d 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -116,6 +116,7 @@ python __anonymous () {
         clsextend = oe.classextend.ClassExtender(variant, prefixes, d)
         clsextend.set_filter("PACKAGE_INSTALL", deps=False)
         clsextend.set_filter("LINGUAS_INSTALL", deps=False)
+        clsextend.set_filter("ROOTFS_RO_UNNEEDED", deps=False)
         clsextend.set_filter("RDEPENDS", deps=True)
         pinstall = d.getVar("LINGUAS_INSTALL") + " " + d.getVar("PACKAGE_INSTALL")
         d.setVar("PACKAGE_INSTALL", pinstall)
-- 
2.39.5


