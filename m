Return-Path: <twoerner@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7CA4D60107
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:11:07 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id k90so123643735qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 20:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=H+3OQJMJItCBkmmWa/OeN6Cl9UJPiIiKf0DBSVuAJZI=;
	b=eo9bxoMRLBG6+TvZAFUG0UNcT8V4jy1vpTB7IBKKziFr95nFPMTwn+5igr9xreLS2c
	vFEDSRABe6omTomGqiasYZE1PptwGrqReudII2zod3agl6IswprPu3oc74zK3t92Gn6v
	whIxfqf7y+2V8IKcCSIf6y4qPszzDqm5VrYzvQ5w5lqRMsRJe85aR+ykFRYXXb6l2uv0
	4qfSL6JMjU3BjIbECkfvHd2hvIuimv8XJEqGE9AXvsThoNybxdj8YGZzHKl950BY9Ks/
	iSjlIGhcUtTdtV9zSgCg8eF3sotqQGoiq3k0ngCfOMaIqpVDhsmsYqDCRxRuMaWPgRbN
	1siw==
X-Received: by 10.140.109.100 with SMTP id k91mr29992911qgf.23.1450757467799; 
	Mon, 21 Dec 2015 20:11:07 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	y65sm15291784qhc.12.2015.12.21.20.11.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Dec 2015 20:11:07 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Dec 2015 23:10:48 -0500
Message-Id: <1450757450-17359-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.6.3.368.gf34be46
Subject: [meta-oe][PATCH v3 0/1] nodejs cleanup and update
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
X-List-Received-Date: Tue, 22 Dec 2015 04:11:08 -0000

My third attempt to update and cleanup the nodejs recipes.

This patch removes the older nodejs recipes and replaces them with a recipe
for nodejs 4.2.3 (the latest stable at this time).

Nodejs is picky about which architectures it supports. Add COMPATIBLE_MACHINE
and cleanup the architecture mapping function to reflect what is currently
supported. Nodejs dropped support for ARMv5 around V8 version 3.22. Also, gcc
no longer supports -mfpu=vfpv2 (which is what the nodejs build thinks it
should be using).

Successfully built for:
  qemuarm, qemuarm64, qemumips, qemumips64, qemuppc, qemuppc64, qemux86,
  qemux86-64, beaglebone, intel-corei7-64, genericx86, genericx86-64

Successfully ran on:
  qemuarm64, qemumips, qemux86, qemux86-64, intel-corei7-64 (turbot)

Failed to run for:
  qemuppc:
    unhandled signal 4 at 2ee3bf48 nip 2ee3bf48 lr 2ee3ed70 code 30001
    Illegal instruction
  qemuppc64:
    I wasn't able to successfully run a qemuppc64 VM

Changes from v2:
  handle qemuarm build failure

Changes from v1:
  don't try to keep and unite the old recipe versions, just replace them with
  the latest stable

Trevor Woerner (1):
  nodejs: cleanup and update

 .../nodejs/nodejs/enable-armv5e-build.patch        | 22 ----------
 .../nodejs/nodejs4/libev-cross-cc_0.4.12.patch     | 13 ------
 meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb  | 49 ----------------------
 .../nodejs/{nodejs_0.12.7.bb => nodejs_4.2.3.bb}   | 23 ++++++----
 4 files changed, 16 insertions(+), 91 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.12.7.bb => nodejs_4.2.3.bb} (81%)

-- 
2.6.0.rc3


