Return-Path: <jsbronder@cold-front.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id D2A837814B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 16:32:31 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id C4B8C20A8D;
	Mon, 12 Feb 2018 11:32:32 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Mon, 12 Feb 2018 11:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=cc:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc; s=mesmtp; bh=3WHinrRDz8J24eAJXoccybFR9W+UYSMX9eTvhI
	qt7M4=; b=OJa4kwBkGoY8tmenBkZUmac1b5K55b2EZ4nP2hvf6SO7WspZz6r8U0
	/4e8o08QL9ceFN6l+7Lg3jXv2JQJ8b0BV/pzWp9f3hiLen6rpcVoTAOh+wWOyCr2
	3gI+zXErvG/M8zZnyZPKpLrWcGNNshXannuwtOp+PN3U9kQoP0GI0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3WHinrRDz8J24eAJX
	occybFR9W+UYSMX9eTvhIqt7M4=; b=ewt6rnRQHCKfsdAPciekoKDxaJHQR5TU7
	Yr5nHtVOVxMYlBSDfh3ogAHx7jk248wgc4qIoEVSHi+Yy8+ArVr47v74U23/M82c
	g6cwiYzKw2+ygPmt8UwEamScxFvOJkj5E+Q2LkaTKg/KxzvcW4e/8Ri1XqLFrcd0
	xTFlo84QIcx8gEN+3U74JvfPSdqIFUnq/EphRYSyvR5lzBNDiVwI+tPWqafoUwDe
	HJ+Ysyy7fEy+7WoYCxrwgzhiM79KzXnzb54l7N+ZK3PN8pm4+yuFLGct9B+SFLQK
	Oyvi3qnDPn+7XFgMaIKmz/G8K6SSgecACnmVFHmJjUb3p2dN3ohYA==
X-ME-Sender: <xms:oMGBWj3AJK1Xal4EE5li45Oh0ZRH7ceHETOAcyCmgbF67v7ZGSUVZQ>
Received: from localhost (c-24-60-203-86.hsd1.ma.comcast.net [24.60.203.86])
	by mail.messagingengine.com (Postfix) with ESMTPA id 845DF24610;
	Mon, 12 Feb 2018 11:32:32 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2018 11:32:24 -0500
Message-Id: <20180212163224.19624-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] kernel: add objtool to shared workdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Feb 2018 16:32:33 -0000

With CONFIG_UNWINDER_ORC (the default in 4.14), objtool is required for
out-of-tree modules to be able to generate object files.

For instance, meta-skeleton/hello-mod fails with:
    | make[3]: *** No rule to make target 'tools/objtool/objtool', needed by ...

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta/classes/kernel.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 943938df0e..5cdff581ef 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -479,6 +479,13 @@ do_shared_workdir () {
 		mkdir -p $kerneldir/arch/${ARCH}/include/generated/
 		cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
 	fi
+
+	# With CONFIG_UNWINDER_ORC (the default in 4.14), objtool is required for
+	# out-of-tree modules to be able to generate object files.
+	if [ -x tools/objtool/objtool ]; then
+		mkdir -p ${kerneldir}/tools/objtool
+		cp tools/objtool/objtool ${kerneldir}/tools/objtool/
+	fi
 }
 
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
-- 
2.13.6


