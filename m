Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A3BECAAA1
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 22:04:56 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web09.1844.1662761094118589692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 15:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm3
 header.b=l3Xp9ebG;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 992285C00F7;
	Fri,  9 Sep 2022 18:04:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 09 Sep 2022 18:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1662761091; x=1662847491; bh=CD
	U0VDdSa6Cki/cPLSH2NZRjhMuZ2t6g0GaG/DSATIQ=; b=l3Xp9ebGvSo89WERB0
	p36FlxgXuk1AF5F73GWaEzYaq23SnHftbticjG9fYPp/2c7iYrzd4o7Aov1D6r/x
	FWnzVFhIHw5j9SDw2kDPK63HU1QpyX7UHQyA2ikB8/gnG64+F7fnVXAU5dWWzn+J
	/Qc+3YNxbmVx1ABbry+v8fPwvqKzJ8qcryvqXSJqp+j96ub92Gcn25oEC8ff9n5p
	rTiEY07BlIv31LroeaEBVOuA7+HrqasTfpVqloZtpw74d6oR3IN8FBhq9lR3pzcq
	OtPW1gJSpX92NC1j+464z7tYSqwI1Ii3u9ymoXYoSNfgebxGdpQxb2e9gspwz/uk
	Graw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1662761091; x=1662847491; bh=CDU0VDdSa6Cki
	/cPLSH2NZRjhMuZ2t6g0GaG/DSATIQ=; b=cHDm+a6JwBw+OHm6ibNj+8oGgCKL9
	GX+8iX5++WW+6ydyVFKxqdB4kQYlpWsh12PH+hF6Azxk8VrOHhOmLMh1fMZZIu61
	KXquFap7Q7HFKo9lYaDzoPUReVE3rmiN2HyWTFuOw0ToCnHRPZSx4LXxQRe42oyP
	IaBuRgWePg6qwWb+1QI/slN+91c+UHBvzT+C6HvtTrzQbqGkhIi7RpRS0842c0Nz
	GZ3lLMUHE4hdHTLjdPNNgtYLiR89p3QmKBKKlTSM3Ac6wmIifIfkuGjmgqmTo5pj
	tGcVYLIDaFyzeIpY0lejJi0I8T7wzHbN7T/YbA5sxO0vGXRI7jC8R6iaw==
X-ME-Sender: <xms:g7gbYxLe0dNLlcDoxxdgTIFwWW4AcFfTy7Cntrw4ApQL_F1OrzmP-A>
    <xme:g7gbY9LVbVr5EsZnnZQidFGyVEN-oVtpDV7CTWTLgP3HIPZyv9l2apZKpeK6hgYq5
    7UukHmx62RKwld7K9g>
X-ME-Received: 
 <xmr:g7gbY5sO11-67r-vwTJ44SRKImfNew-pCeVq57yqnlb-E2-9E9IeEXz-FAUxrfTuZLZLuDUYx8t89RhQSO8iqxPdbZE_Tr8359Ihu_1DzEz2E2duyVcgwEse>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrfedtiedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjefhvefhgefgffejgeelke
    ejleeiffejgffgkeeggfffgfffieeffeeghefhtdffnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtoh
    hm
X-ME-Proxy: <xmx:g7gbYybmdyvAv42oFKXmAJNUFTY-ciXHGxY-zr2i8-pYpImwfBpMvw>
    <xmx:g7gbY4bmHpYUvJgoPhlrdpMfbbtDGq7nI-Kv7-gkE9NNrfzNHkntRQ>
    <xmx:g7gbY2Ans-Ypaz4HVwWl0nuMfZj17BVH0-knG0F-22akqOK8bOynMg>
    <xmx:g7gbYzxQOwtCFI5lzgYVP1zghEm0NzOr1RxVYnGkNthxyaBVtvq_cg>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Sep 2022 18:04:50 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH 4/4] rootfs.py: Run depmod(wrapper) against each compiled
 kernel
Date: Sat, 10 Sep 2022 00:04:25 +0200
Message-Id: <20220909220425.2737985-4-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220909220425.2737985-1-andrei@gherzan.com>
References: <20220909220425.2737985-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 22:04:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170508

From: Andrei Gherzan <andrei.gherzan@huawei.com>

We run depmod (through depmodwrapper) at the end of the rootfs
generation process. This part of the process assumes in its current
implementation that the kernel package name is always 'kernel' and that
there is only one set of kernel modules for which we need to generate
the modules.dep and map files.

The kernel package name can be configured via a variable
(KERNEL_PACKAGE_NAME) and becomes a namespace that enables the build
system to deal with multiple compiled kernel recipes. This patch checks
for all the depmod pkgdata and runs depmod for each of the detected
kernel versions/kernel package name.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/lib/oe/rootfs.py | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 0b9911e3a6..a02dddf23d 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -325,19 +325,29 @@ class Rootfs(object, metaclass=ABCMeta):
             bb.note("No Kernel Modules found, not running depmod")
             return
 
-        kernel_abi_ver_file = oe.path.join(self.d.getVar('PKGDATA_DIR'), "kernel-depmod",
-                                           'kernel-abiversion')
-        if not os.path.exists(kernel_abi_ver_file):
-            bb.fatal("No kernel-abiversion file found (%s), cannot run depmod, aborting" % kernel_abi_ver_file)
+        pkgdatadir = self.d.getVar('PKGDATA_DIR')
 
-        with open(kernel_abi_ver_file) as f:
-            kernel_ver = f.read().strip(' \n')
+        # PKGDATA_DIR can include multiple kernels so we run depmod for each
+        # one of them.
+        for direntry in os.listdir(pkgdatadir):
+            match = re.match('(.*)-depmod', direntry)
+            if not match:
+                continue
+            kernel_package_name = match.group(1)
+
+            kernel_abi_ver_file = oe.path.join(pkgdatadir, direntry, kernel_package_name + '-abiversion')
+            if not os.path.exists(kernel_abi_ver_file):
+                bb.fatal("No kernel-abiversion file found (%s), cannot run depmod, aborting" % kernel_abi_ver_file)
+
+            with open(kernel_abi_ver_file) as f:
+                kernel_ver = f.read().strip(' \n')
 
-        versioned_modules_dir = os.path.join(self.image_rootfs, modules_dir, kernel_ver)
+            versioned_modules_dir = os.path.join(self.image_rootfs, modules_dir, kernel_ver)
 
-        bb.utils.mkdirhier(versioned_modules_dir)
+            bb.utils.mkdirhier(versioned_modules_dir)
 
-        self._exec_shell_cmd(['depmodwrapper', '-a', '-b', self.image_rootfs, kernel_ver])
+            bb.note("Running depmodwrapper for %s ..." % versioned_modules_dir)
+            self._exec_shell_cmd(['depmodwrapper', '-a', '-b', self.image_rootfs, kernel_ver, kernel_package_name])
 
     """
     Create devfs:
-- 
2.25.1


