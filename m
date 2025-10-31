Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADD5CCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 13:45:58 +0000 (UTC)
Received: from smarthost01a.ixn.mail.zen.net.uk (smarthost01a.ixn.mail.zen.net.uk [212.23.1.20])
 by mx.groups.io with SMTP id smtpd.web10.15985.1761918352623010711
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 06:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=Io2t2Jqj;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.20, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01a.ixn.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mac@mcrowe.com>)
	id 1vEpRu-00Caco-Mu;
	Fri, 31 Oct 2025 13:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description; bh=41BXxQLIG5JDxkK6d4dlwDEvEqMjJ1l2XuR/MXQCvow=; b=Io2t2
	Jqji6vjoHMNsCIht5NF004fq2d9YDeXZaejesukmyV3t1Zp4GIacnxZY5JxTufCaR62Vjq1Rq/req
	zsVJOtJW94hnDhD6RaklYhupDPCavCTBQHUrdF5w81gS3/hMvoiDqmXUNx6OHUJvaKBeBef8th+lo
	gRzDn8B4xdf8ExiGldXwClEE7Y0XjvQwWLMzOScFL+Nak9JcfTbxN0IZ4+F5qU0j44Pp9KBXfCsZl
	tBdwerpFKdyUQ2Cf5N0zwf3xF0z84K1QXlFYwZhpJMf+I4AhxnbKCDh7bdNd7uPEv801eREY0xCQE
	s9OUGK/EUtkfYX5DR7GfPE/YndH8w==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1vEpRu-008UsS-1U;
	Fri, 31 Oct 2025 13:45:50 +0000
Date: Fri, 31 Oct 2025 13:45:50 +0000
From: "mac@mcrowe.com" <mac@mcrowe.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] multilib.bbclass: Filter ROOTFS_RO_UNNEEDED to
 fix uninstallation
Message-ID: <aQS9jgRk4RiR-8BZ@mcrowe.com>
References: <20251020160353.413127-1-mac@mcrowe.com>
 <B79775E7-9442-4E1B-9F4E-A26353ADC746@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B79775E7-9442-4E1B-9F4E-A26353ADC746@arm.com>
X-Originating-smarthost01a-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 13:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225540

Hi Ross,

On Wednesday 29 October 2025 at 16:12:06 +0000, Ross Burton wrote:
>> On 20 Oct 2025, at 17:03, Mike Crowe via lists.openembedded.org <mac=mcrowe.com@lists.openembedded.org> wrote:
>>> When building an entire multilib image (e.g. lib32-core-image-minimal)
>>> we need to ensure that the unneeded packages in ROOTFS_RO_UNNEEDED get
>>> the multilib prefix applied before they are compared against the list of
>>> installed packages inside Rootfs._uninstall_unneeded() to decide whether
>>> they need to be installed.
> 
> Would you be able to make a test case in oeqa to verify that this
> behaviour works as expected in the future, and doesn’t regress?

I've never written one before and I wasn't sure whether it should fit
inside one of the existing case files, but is this the sort of thing you
mean?

Subject: [PATCH] oe-selftest: Add test of read-only multilib image

This test confirms that the fix for ROOTFS_RO_UNNEEDED with multilib
images in 77c35362fb13c75145f9f999216b3d879ab18b77 don't regress.

diff --git a/meta/lib/oeqa/selftest/cases/multilib.py b/meta/lib/oeqa/selftest/cases/multilib.py
new file mode 100644
index 0000000000..67bfb37967
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/multilib.py
@@ -0,0 +1,32 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import get_bb_var, bitbake, runCmd
+
+class MultiLib(OESelftestTestCase):
+
+    def test_read_only_multilib_image_lacks_run_postinsts(self):
+        """
+        Check that a read-only multilib image can be built and that image has had
+        ${MLPREFIX}run-postinsts correctly uninstalled.
+        """
+
+        config = """
+MACHINE = "qemuarm64"
+require conf/multilib.conf
+MULTILIBS = "multilib:lib32"
+DEFAULTTUNE:virtclass-multilib-lib32 = "armv7at-neon"
+IMAGE_FEATURES = "read-only-rootfs"
+"""
+        self.write_config(config)
+        bitbake('lib32-core-image-minimal')
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        manifest_lines = open(deploy_dir_image + "/lib32-core-image-minimal-qemuarm64.rootfs.manifest").readlines()
+
+        # lib32-run-postinsts should have been uninstalled since
+        # run-postinsts is in ROOTFS_RO_UNNEEDED.
+        self.assertEqual(list(filter(lambda l: "run-postinsts" in l, manifest_lines)), [])
--
2.39.5

Thanks.

Mike.

