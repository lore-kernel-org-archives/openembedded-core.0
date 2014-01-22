Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 85A7E615AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 00:36:16 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so3713680eek.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=kOuZgxavt3+oc4gYmvyPHYAtau59HdpivctUQGAGCcc=;
	b=VXwWwxGkTN+4aWvKzrb5yvKvS4jfejniNrKlF/o1IXLGjobIMxfFpJF1g7ITvdaOKx
	0olexoWQIX3ql3IoNFajUJ0uLsv1YDw5JUQuTXt0hbyOucjxyUub7d3Y/r5dJBtA9/IF
	kOYlgR5BQEPhOtK8Go+4BaQHEcr+Cw8STL0pbE8VhVN/+uQuphDh2DPCIeh5xPZXFw6h
	jL74KPehNdRRhHUOU7wpd/4S5DMCqLFmNU3cMUvDDqylIPdrxE/gYgLl5ueZ8TIYiUS4
	b0G7kiU8SV1Z5aZWMXXe1waFPbk2zair7OCq4TxFqBbCx/wMocC9pDnV43uLp+jKk0Ja
	q+Bw==
X-Received: by 10.15.111.6 with SMTP id ci6mr26365791eeb.59.1390350977197;
	Tue, 21 Jan 2014 16:36:17 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id i2sm20614052eem.6.2014.01.21.16.36.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 16:36:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 01:36:08 +0100
Message-Id: <9c945a5fa6dacd392f7b8af2367846450de8e8b2.1390350823.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1390350823.git.Martin.Jansa@gmail.com>
References: <cover.1390350823.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390350823.git.Martin.Jansa@gmail.com>
References: <cover.1390350823.git.Martin.Jansa@gmail.com>
Subject: [PATCH][RFC][WIP 3/6] feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding thumb suffix
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
X-List-Received-Date: Wed, 22 Jan 2014 00:36:16 -0000

* this means that recipes with ARM_INSTRUCTION_SET explicitly changed
  to arm will be built in feed without thumb suffix
* I'm not sure if the rest of system correctly supports different
  TUNE_PKGARCHs for different recipes, this is one of the reasons why
  this is WIP/RFC

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index d58c4b4..09a127a 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -5,14 +5,19 @@
 # but requires more instructions (140% for 70% smaller code) so may be
 # slower.
 TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
-ARM_THUMB_M_OPT = "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', True) == 'thumb']}"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' ${ARM_THUMB_M_OPT}', '', d)}"
+ARM_THUMB_OPT = "${@['arm', 'thumb'][d.getVar('ARM_INSTRUCTION_SET', True) == 'thumb']}"
+ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4',  't',  '', d)}"
+ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5',  't',  '', d)}"
+ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6',  't',  '', d)}"
+ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 't2', '', d)}"
+ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', 't2', '', d)}"
+ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', 't2', '', d)}"
+
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${ARM_THUMB_OPT}', '', d)}"
 OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ':thumb', '', d)}"
 
-ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', [ 'armv4', 'thumb' ], 't', '', d)}"
-ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', [ 'armv5', 'thumb' ], 't', '', d)}"
-ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', [ 'armv6', 'thumb' ], 't', '', d)}"
-ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', [ 'armv7a', 'thumb' ], 't2', '', d)}"
+# Add suffix from ARM_THUMB_SUFFIX only if after all this we still set ARM_THUMB_OPT to thumb
+ARMPKGSFX_THUMB .= "${@ d.getVar('ARM_THUMB_SUFFIX', True) if d.getVar('ARM_THUMB_OPT', True) == 'thumb'] else ''}"
 
 # Whether to compile with code to allow interworking between the two
 # instruction sets. This allows thumb code to be executed on a primarily
-- 
1.8.5.3


