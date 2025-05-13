Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F15DC3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 21:40:25 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.88506.1747172416895474853
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 14:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Rqp9XBpM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-202505132140149ffeadb64473c22ceb-26b552@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202505132140149ffeadb64473c22ceb
        for <openembedded-core@lists.openembedded.org>;
        Tue, 13 May 2025 23:40:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=N+vG3xhR4jdrzLBC1S477Rr4wvWwUN2i2j1MLzY2dpA=;
 b=Rqp9XBpM7lCJca1aSXVfzewMRwgsjjwr7/zo288WqfRhh0HXkOLZfnt25dDPM3/C3ZXQuP
 XH92zObQU2BQbodX353dd41qi4t4xxPEgI49CyzyjDsri7kBUdOKvdjsGgbyjnSfHQ4bQeKh
 8Rm/aYTGguzKy/EwWcPaejt/jj19sFPocDQ447emDss/n74ts/2P27kk7YNCsphvWT156XaT
 5yguZekWSZ58oJqesPvIbYB9V0W4ydWtARHVLy3awsxiTrAYcKxcFL6ohaQPFP66BG7dtVVf
 juRzVD7mJxfq/gBhSfuxhPSp360yb03wwJ1KeH2IFvhghpR9WeHxAyKA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Rogerio Guerra Borin <rogerio.borin@toradex.com>,
	Sean Anderson <sean.anderson@seco.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2 01/22] u-boot: ensure keys are generated before assembling U-Boot FIT image
Date: Tue, 13 May 2025 23:36:43 +0200
Message-ID: <20250513213834.87830-2-adrian.freihofer@siemens.com>
In-Reply-To: <20250513213834.87830-1-adrian.freihofer@siemens.com>
References: <20250513213834.87830-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 21:40:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216451

From: Rogerio Guerra Borin <rogerio.borin@toradex.com>

Add the task dependency:

do_uboot_assemble_fitimage -> virtual/kernel:do_kernel_generate_rsa_keys

to ensure the kernel FIT image signing keys are available when creating
the U-Boot DTB. This is done only if the signing of the kernel FIT image
is enabled (UBOOT_SIGN_ENABLE="1").

The lack of the dependency causes build errors when executing a build
with no kernel FIT keys initially present in the keys directory. In such
cases one would see an output like this in the Bitbake logs:

Log data follows:
| DEBUG: Executing shell function do_uboot_assemble_fitimage
| Couldn't open RSA private key: '/workdir/build/keys/fit/dev.key': No such file or directory
| Failed to sign 'signature' signature node in 'conf-1' conf node
| FIT description: Kernel Image image with one or more FDT blobs
| ...

This issue was introduced by commit 259bfa86f384 where the dependency
between U-Boot and the kernel was removed (for good reasons). Before
that commit the dependency was set via DEPENDS so that, in terms of
tasks, one had:

u-boot:do_configure -> virtual/kernel:do_populate_sysroot

and the chain leading to the key generation was:

virtual/kernel:do_populate_sysroot -> virtual/kernel:do_install
virtual/kernel:do_install -> virtual/kernel:do_assemble_fitimage
virtual/kernel:do_assemble_fitimage -> virtual/kernel:do_kernel_generate_rsa_keys

With the removal of the first dependency, no more guarantees exist that
the keys would be present when assembling the U-Boot FIT image. That's
the situation we are solving with the present commit.

Fixes: 259bfa86f384 ("u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled")
(From OE-Core rev: 270f240a9f618c2ccfbf7107960b8226d1137cda)

Signed-off-by: Rogerio Guerra Borin <rogerio.borin@toradex.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Sean Anderson <sean.anderson@seco.com>
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/uboot-sign.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 76a81546e34..e0771b54291 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -113,6 +113,8 @@ python() {
     sign = d.getVar('UBOOT_SIGN_ENABLE') == '1'
     if d.getVar('UBOOT_FITIMAGE_ENABLE') == '1' or sign:
         d.appendVar('DEPENDS', " u-boot-tools-native dtc-native")
+    if d.getVar('FIT_GENERATE_KEYS') == '1' and sign:
+        d.appendVarFlag('do_uboot_assemble_fitimage', 'depends', ' virtual/kernel:do_kernel_generate_rsa_keys')
 }
 
 concat_dtb() {
-- 
2.49.0


