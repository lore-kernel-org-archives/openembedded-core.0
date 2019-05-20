Return-Path: <mike@foundries.io>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE837E064
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 17:45:45 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id u17so7575301pfn.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 10:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KWnunU4GQ3lWAKujB6obN6DOOKwpJVVJkcHaMAMTfuM=;
	b=ZOtoCy1pKFCVT/cSkMOvzThbJpRmHuDB2cJZ8DfMKIjn7Nz2GIqvyVGnOZzFTdVI2q
	GIIBSVHc3nZELtAGdCoijBbiQ8ADq2QpfoFT1UexLRrQbe3W1H4wDN5txTJxZjlbosny
	iXBjpArGxmz8HjvQi1zs/U0/186E1ve+NbZAjC7Kd8VOnElaQ0H4WNwmGVQCWP/OiUxU
	l7/N8Dn8XbfBhb7gWhAN9cN4QMUbGYOAWVb2sZJZI6VUNCm9zQ6a15H9CvWLYtq6UWOI
	+5IgSK9RNC/IeHIxnCVZkC31vlpldpyvrcO6xNtWmb8FlzCYkICZTrVk/6zeVSu5LMrQ
	hO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KWnunU4GQ3lWAKujB6obN6DOOKwpJVVJkcHaMAMTfuM=;
	b=O4eOdIXUiOWZ7EskN8PSUYAQKEVAu5C3+eeaKEQujCCgEHDZqPKZzqHNVGE/93Oz88
	nSOiPGIa038/0kkLuuvhczIHiNhPp2CUk2dNkO7hnax2LJGHhkgrf7BWZfYiKOFHLzuM
	rIEkxjH+gdAmfvwExu9FbxDAg9Ir+IFAuwVLdhjR3o4B98w/+yVYco9FD4Dq7HqNKsMO
	iECc20TPfRXRNfOfBlEZeWjRre6++QW1chi37Iyw8e5ZSPKC7MdLggz7bxpUNGvzR4IG
	wl3pkKt9Bn/5AAtazyCK9hXOyMpeZx37jGfd248f+Gr6blZ7WAhAq17kzTJ0V0aTLDW4
	RRDg==
X-Gm-Message-State: APjAAAVL0xIogDMTLfDudpQ2yunFhntvtAlp8JPRRmxSssn1mPo6I+c/
	qEAX0KxZGIE99kIpJQamST0Z/RjfvHItpQ==
X-Google-Smtp-Source: APXvYqxq+HLrTtENbJ4jb0rjFdDRv5cbH/RibvV41M+4cbb2cWyvouL2NT8OyPUnEcQTjWn41kPGXg==
X-Received: by 2002:aa7:8186:: with SMTP id g6mr82348208pfi.126.1558374346922; 
	Mon, 20 May 2019 10:45:46 -0700 (PDT)
Received: from scottml-arch.lan (107-198-5-8.lightspeed.irvnca.sbcglobal.net.
	[107.198.5.8]) by smtp.googlemail.com with ESMTPSA id
	c76sm34897132pfc.43.2019.05.20.10.45.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 10:45:46 -0700 (PDT)
From: Michael Scott <mike@foundries.io>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 10:45:32 -0700
Message-Id: <20190520174532.32158-1-mike@foundries.io>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Yannick Gicquel <yannick.gicquel@iot.bzh>
Subject: [PATCH] uboot-sign: change u-boot do_deploy concat_dtb() hook to postfuncs
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
X-List-Received-Date: Mon, 20 May 2019 17:45:46 -0000
Content-Transfer-Encoding: 8bit

The u-boot signing process consists of 3 actions which must happen in
the right order in order to generate a correct u-boot.dtb with the
public key information which is appended to the u-boot binary.

This process is described in a long comment at the top of
uboot-sign.bbclass:

1. u-boot build generates initial version of u-boot binary and
   appended u-boot.dtb.  Then, via do_install_append() a copy of
   this file and a symlink are added to the datadir (part of
   do_install step)
2. Kernel build then picks up the u-boot dtb from the datadir and
   adds the public key information during mkimage call in "Step 7"
   of kernel-fitimage.bbclass::do_assemble_fitimage().  The build
   system makes sure that we add the signed version of the u-boot
   dtb by adding do_assemble_fitimage() as a dependency to u-boot's
   do_populate_sysroot() step.
3. u-boot do_deploy then executes a new *postfuncs* hook for
   "concat_dtb" which deploys a re-created u-boot binary (appended
   dtb now has public key).

However, the actual code which adds the handler to u-boot's do_deploy,
sets the hook addition as "prefuncs".  This ends up creating a very
racy build which for me was deploying the wrong u-boot binary because
concat_dtb was running before the fitimage was being assembled
(and adding the public key to the u-boot.dtb)

Let's set the concat_dtb step to "postfuncs" as the comment claims
which fixes the order of operations and generates the correct
u-boot.bin in the deploy directory.

Signed-off-by: Michael Scott <mike@foundries.io>
---
 meta/classes/uboot-sign.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 8beafff7c0..202b18502b 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -125,5 +125,5 @@ python () {
         # kernerl's do_deploy is a litle special, so we can't use
         # do_deploy_append, otherwise it would override
         # kernel_do_deploy.
-        d.appendVarFlag('do_deploy', 'prefuncs', ' concat_dtb')
+        d.appendVarFlag('do_deploy', 'postfuncs', ' concat_dtb')
 }
-- 
2.21.0


