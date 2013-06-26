Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id AB89460780
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 12:10:38 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r5QCAb4C026270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 14:10:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1372248638;
	bh=8qGFgN5NoYbxRnTE4km7y5swU32djWbm+l5BfByjopA=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=E3uXh7c8rlxJh/xva9T6ixlUdH+5Of2jJk79edV814ZqUgTISdM32XxL6ED1Y4DQo
	V7WhVBTIMIzqApvSH4oUkElVvIFsc2YcMa8MbKS6W9t1mnhOjo8AkzCuczImNASAAr
	RtQkvH6GlTJ/6fVPasDSHD3gvTpy3yBI4q3j2s34=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r5QCAWgO007271
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 26 Jun 2013 14:10:33 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1UroYR-0001rU-D2; Wed, 26 Jun 2013 14:10:31 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2013 14:10:25 +0200
Message-Id: <1372248625-6484-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.8.1.4
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.9575
X-Spam-Score: -5.4
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] image_types.bbclass: set 'filetype' ext4 feature
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
X-List-Received-Date: Wed, 26 Jun 2013 12:10:39 -0000

Generating filesystems with this flag allows more efficient directory
traversals because getdents() returns the filetype in 'd_type' which
allows to avoid an extra lstat() call.

Creating ext4 filesystems with 'mkfs.ext4' sets this flag by default
too.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 9146b21..c03d914 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -158,7 +158,7 @@ IMAGE_CMD_ext3 () {
 
 oe_mkext4fs () {
 	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} $1
-	tune2fs -O extents,uninit_bg,dir_index,has_journal $1
+	tune2fs -O extents,uninit_bg,dir_index,has_journal,filetype $1
 	e2fsck -yfDC0 $1 || chk=$?
 	case $chk in
 	0|1|2)
-- 
1.8.1.4


