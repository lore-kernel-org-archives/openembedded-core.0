Return-Path: <andrew@bradfordembedded.com>
X-Greylist: delayed 406 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 04 Aug 2016 17:48:00 UTC
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 8A67D73243
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 17:48:00 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id A2BBC206CC;
	Thu,  4 Aug 2016 13:41:14 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute2.internal (MEProxy); Thu, 04 Aug 2016 13:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	bradfordembedded.com; h=cc:date:from:message-id:subject:to
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=VbBBAkiH4mlmt8XmT2W3UDwJais
	=; b=kmZQCtdMeEEZEPwZBydSSVBRV8VVcUI3jAKVb8dXKKNGDsIMd//9gpofu1A
	kg7Io4Q7/RnRHVuIhtK0WEZJjBaTUMJkPTkTbwmFloqbFEaW/P6/BPShSOQQBzf4
	tVxxlfcl66OB/1asT9tOvVtcTVbMy8zlJf5sFqHdg+fjRmYM=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=VbBBAkiH4mlmt8XmT2W3UDwJai
	s=; b=Lij5G7dNrGHD9J/f1Q1/B7ztdYNsNoQa4gLVbwYUe8grKwvKDUOLhk+EXt
	4oCUtPdIczFmLL8FuQaSqftsL6bC3U9GUoZEgGEKPxezb2EX8Xee6TLPrWlcDZsc
	OWHhsCXM3ia3tnVCGVgsTMDsWNPtyoIDZpKbgcn20cjLTZh9E=
X-Sasl-enc: tavvJWPScWig6LH268wM8XCJox29qGcASUYkZI+btkX2 1470332474
Received: from kaim-eeyore.kodakalaris.net (clr-vpn01.kodakalaris.com
	[198.140.222.129])
	by mail.messagingengine.com (Postfix) with ESMTPA id 10DFCCCE69;
	Thu,  4 Aug 2016 13:41:14 -0400 (EDT)
From: Andrew Bradford <andrew@bradfordembedded.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2016 13:40:40 -0400
Message-Id: <1470332440-25417-1-git-send-email-andrew@bradfordembedded.com>
X-Mailer: git-send-email 2.8.1
Cc: Andrew Bradford <andrew.bradford@kodakalaris.com>
Subject: [PATCH] kernel-fitimage.bbclass: do_assemble_fitimage(): cd to $B
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
X-List-Received-Date: Thu, 04 Aug 2016 17:48:00 -0000

From: Andrew Bradford <andrew.bradford@kodakalaris.com>

Prior to assembling the fitimage, ensure that $B is the cwd due to
bitbake commit 67a7b8b021badc17d8fdf447c250e79d291e75f7 "build: don't
use $B as the default cwd for functions".

Without this change, do_assemble_fitimage() fails like:

Log data follows:
| DEBUG: Executing shell function do_assemble_fitimage
| arm-ka-linux-gnueabi-objcopy: 'vmlinux': No such file
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_assemble_fitimage

Signed-off-by: Andrew Bradford <andrew.bradford@kodakalaris.com>
---
 meta/classes/kernel-fitimage.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 9a3caf5..7cca180 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -189,6 +189,7 @@ EOF
 }
 
 do_assemble_fitimage() {
+	cd ${B}
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
 		kernelcount=1
 		dtbcount=""
-- 
2.8.1


