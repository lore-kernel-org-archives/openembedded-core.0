Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5ACF67F895
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 21:38:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47731f5wBdzHg
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:38:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572989895;
	bh=l+KLi24m/ifZ9xdUypSiZYT//10ar/wDi87WfYSI2Ng=;
	h=From:To:Subject:Date:From;
	b=QDH3q+uAqLoLCVfpCmjZfgNd4NDB0EgsHybvj75NocZbZ10hyAWWCewT89efpvlqp
	8sEArNkhoU41noaabTOT1gonu4kJdG3R0pUfUCIXwJt50h3Bwh4M+abWPWku8lKWtl
	v/N7txBnKY5DuD3H53wS0TaYE/A9q1K1hR1r/0JYQ27XE2EbN8nydR2DPyRngJia9G
	cT4GheivZ+w9fERD33xvKfrdhwte7t4Yr7LoLcBlq1+d+GtCn6Bh7okcve8WzN2Lrz
	+3ZsCSEwH9BJRSmJTR9r4KQ81pAc9D66qh0NrUKlUOp0cmLLfgUX1aH8BPQsxti/Kg
	25WHg0JE81DEDUBHOJC41BvYCbD67nE3vLdz7bh4VlXP7VqqVobdA2rNfv7wZxRd0n
	LDvfuozqK4TqAnLBDnYrqzDLkm0Zr7EsBq9oePWsW1vaUrGGi37pjGMuGNEys6Kvah
	PkAGi4/VKm8qdFknlVLBRbYXU0ZmOwBFsQLDsAznKnAVKBze6Pe/idB9pxyRECJI+c
	C8WMAaWb72f9kWxAwOdhBpTHYvCB7WxGRZIT3O7rFWlsG40a7C/DmZonX6L3G0lJUk
	Z1pcTuT64GNjDo7gj5lER5zsxzhcvhjy5VsYu4M7ZYFmiUEqaR2lw1pLPawXkaj2fd
	lHfmHYriQh1MgUg7jHv0Bs/I=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:38:10 +0200
Message-Id: <20191105213813.27546-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [zeus][PATCH] libsndfile1: whitelist CVE-2018-13419
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
X-List-Received-Date: Tue, 05 Nov 2019 21:38:15 -0000

From: Ross Burton <ross.burton@intel.com>

This is a memory leak that nobody else can replicate and has been rejected by
upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index ffb45855a4..7855008f3d 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -33,3 +33,7 @@ PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[regtest] = "--enable-sqlite,--disable-sqlite,sqlite3"
 
 inherit autotools lib_package pkgconfig
+
+# This can't be replicated and is just a memory leak.
+# https://github.com/erikd/libsndfile/issues/398
+CVE_CHECK_WHITELIST += "CVE-2018-13419"
-- 
2.17.1


