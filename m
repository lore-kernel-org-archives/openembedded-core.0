Return-Path: <admin1@stacktrust.org>
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
	by mail.openembedded.org (Postfix) with ESMTP id C22C361B5C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 23:02:46 +0000 (UTC)
Received: from autometa.com ([173.245.215.243]) by mrelay.perfora.net
	(mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id
	0Mb6pp-1ivgek44p1-00KklR; Tue, 10 Mar 2020 00:02:46 +0100
Received: by autometa.com (Postfix, from userid 1000)
	id 724854A92A2; Mon,  9 Mar 2020 18:55:19 -0400 (EDT)
From: Rich Persaud <rp@stacktrust.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 18:55:07 -0400
Message-Id: <20200309225507.29578-1-rp@stacktrust.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:wqNaI/of8cdzQ7KH8NFgJUxHVxLqTBw81YK/W02RU1hUM5zFgnw
	exSJ9ji3M5z4R3pzG7wZ2/4sV84MIP6z0DQ68q4LLZfxjbXXVCCD1ByZsez2uAaq4nbdcxJ
	RoMns/XBng4zhNNAPXW9RHInM9Z3uEHE9asBzxPD4EuyprrVe3e4oidEBhCvmNIWhd35lBE
	kYfB2tZtqiITRPIvYSLDQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sDbZ+Lxw3yo=:KkjNR7VHhMTvMWwKRDTUS3
	Tqt9nj3eoQuWyn7jNxqsYkJMCfRFPAfy/J/w0kkS3lXt8dTRN5fq1WFhifi2YG+MQTKDrs5Nr
	8QwpHR9jBPow+tL2YdsS3mmBUCG3kxPWDsa8MMvLU6vNUG/DGemM9B5m7nHKQVuja3VbD2zx5
	zlCEMXf6UhkKieJ8YOew5lqbyolfsgYEIkkNA0RuIvZODK1WbCVgUKJsoaBrYW6flR+M/MkY0
	6+sipXkG25vy9DnIoj1Lz6pbUzgwojZoQl387yBcRbT788InPL0Ssbvjx81y+6M3dtdF/6yDK
	nrOAV1Xg7r/EPiAIySSY68MppeMAt3Bl9iLge16rCx5oDry6Fcl4QsU3Vv3fUB4xYt6KWmNwp
	Ko7BoHoHrgYHKiDwrDR7aCmZvpgAD7RKuuya47pe+5O1+q5cr+Gcx8dQ+1M3IPq5xhwz77s+q
	1Rpe0IMoxjLZbRnKG+MDiV09v1WSmpPCBywM9PLoyM4YsT9oKCkVhCEsv4+Zo6JrFacd6TY/i
	S7tSiUt85utKiIrORxv5ko7BbTp7B1lyU5C7+dS/t5OeDMTPZak/tLOLVIsRBTSxU2lFcAmQI
	+M7kSnLUzxh3skcEDdwxBMCZ5hzfjnf5oRQeMNp+Zf2jeU4yXSsOeMexg2Ecw/KqrAWMwVLv2
	ZelXES/J8ZcAkU8PVcYWehk3qxK7UoJzBdbZWO+TkyDgkW8Swt/jY2CVY74K6fBowKOvM2jz4
	29fBCM2M8WCtC8fC+GqvFnwvD6TP4tVb14YYnpCHNM9m1LKYtnDDTe0xRUfxISYZuUaDOkPXE
	7uMcxLo57vC8Sg+OUdSGPiG1IFjxSHjuaLBsS2HtVdtsz/D44WaCmTQfXhV1I9f5P0f6fq5
Cc: Rich Persaud <rp@stacktrust.org>
Subject: [PATCH] image-live: multiconfig ISO generation
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
X-List-Received-Date: Mon, 09 Mar 2020 23:02:48 -0000
Content-Transfer-Encoding: 8bit

When a target is specified for INITRD_IMAGE_LIVE, a task dependency is
added for do_image_complete. At present, image-live initrd will not
accept multiconfig dependency targets.

If BBMULTICONFIG is non-empty and INITRD_IMAGE_LIVE is a multiconfig
target, use mcdepends instead of depends. The packaging recipe must
also override machine-specific path construction of INITRD_LIVE.

Required to build an ISO with mixed machine types, a primary use case
for multiconfig. This is a minimal fix to make multiconfig ISOs
possible.

Signed-off-by: Rich Persaud <rp@stacktrust.org>
---
 meta/classes/image-live.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 54058b350d..1afd48005a 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -50,11 +50,14 @@ IMAGE_TYPES_MASKED += "live hddimg iso"
 python() {
     image_b = d.getVar('IMAGE_BASENAME')
     initrd_i = d.getVar('INITRD_IMAGE_LIVE')
+    depends_type = ('mcdepends' if (d.getVar('BBMULTICONFIG')
+                                    and initrd_i.count(':') == 3)
+                                else 'depends')
     if image_b == initrd_i:
         bb.error('INITRD_IMAGE_LIVE %s cannot use image live, hddimg or iso.' % initrd_i)
         bb.fatal('Check IMAGE_FSTYPES and INITRAMFS_FSTYPES settings.')
     elif initrd_i:
-        d.appendVarFlag('do_bootimg', 'depends', ' %s:do_image_complete' % initrd_i)
+        d.appendVarFlag('do_bootimg', depends_type, ' %s:do_image_complete' % initrd_i)
 }
 
 HDDDIR = "${S}/hddimg"
-- 
2.20.1


