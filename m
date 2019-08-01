Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9A189606D0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 04:50:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45zdBf20KVz3P
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 06:50:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564635002;
	bh=LtBDirl0m1e69JwzEYC7R9PXPl/FKYGKe3awgZj+C3k=;
	h=From:To:Subject:Date:From;
	b=ZH2IkPCIQYfFQTF2GdFHlvZ096+WteYqzxtWV58gZwCoV7h29hrZmfz+5BJIBehaq
	D2oVmb5qRZGxEyhvn7RsKmeXAicRH5HnREViXuIuXgw2wj7bhuU17VCeeiWV+IlaZ2
	Nwtjdbw2ukdfruiNhQRPLbgE6OdN69up8v8FAlQxhBPtMMgy8IGAjHMPmjLQeSOod3
	P+7sOOC1RpgLNsIdI2wFaI6qIvbol69xQCNgnSlT/Dy6BRUwec9odAv4yu5xHimy3H
	bR4D/xGuElhw5ygx8L73CxDYR6M9TjLoSdxU7tG9Sbweju6/nOQrC/GwL+7+oo33Z5
	F49kJ8RjxfE9lSvxN+hdfbyqD2BpS1Wc+7I0mKz9LWWaUr81KpeVWxRCWn8nBMuNs4
	/br0jYOqTKmiQ4HrbaQGxxSPH9v/fP7gWlSRx4qNzLxjLeuTT3aSvRykpuPVc4y2WL
	9WOlgos5thXm+hc214dpvZBLW+BNUeJGW+gCTdLYB1FZOhpb8XgseE0hnCmQGkEi+6
	9dx8G+o9Ejxia1T/JkgidnrndUtVBWIcNGAtIKoHW0YjJUsN10AMXAR6tc7mWfIcIN
	WUF/lpqJSXZUJQVcMMZYvrhSlLZH2NCptdBtW8soGBn7fOliW7+kDhmyMi+qfMW3YZ
	M6n8pdNJM3nnBKSNFrQh9Nq8=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2019 07:50:01 +0300
Message-Id: <20190801045001.19548-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] webkitgtk: Stop disabling gold on aarch64 and mips
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
X-List-Received-Date: Thu, 01 Aug 2019 04:50:02 -0000

The binutils bug appears to have gone away.

Using gold on powerpc still fails for seemingly unrelated reasons.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-sato/webkit/webkitgtk_2.24.3.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
index f65d79b0fb..81cbf34198 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
@@ -87,10 +87,6 @@ EXTRA_OECMAKE_append_armv5 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE_append_armv6 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
 
-# binutils 2.25.1 has a bug on aarch64:
-# https://sourceware.org/bugzilla/show_bug.cgi?id=18430
-EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
-EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "
 
 # JIT not supported on MIPS either
-- 
2.17.1


