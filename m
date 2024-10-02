Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C739CF31AF
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 10:09:13 +0000 (UTC)
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.web11.3861.1727863745305591673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 03:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=MLWD5tTq;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=gyicSNW4;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 7BB0E138051E;
	Wed,  2 Oct 2024 06:09:04 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Wed, 02 Oct 2024 06:09:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1727863744; x=1727950144; bh=9j31ZKWFkjMJPw78jBMGS
	eElPR7smlKsOFCpeXXHibA=; b=MLWD5tTq+XEBXJpRoGcz/rbIfGsWqnCjuMOt5
	EdXhT/8FusLcTnv6CIijVrCtpEngxphff+mTahiIEV2xhGTLWtM5yL8AU69upDFw
	T4S9thEtLUZtnfb00hpb8LWDq21O0En/XBDkIlAMTVSQyBgOmVQP14qwhgCd8Q5r
	TNngUIn21RwOeFFzUV04ttdZ1gQVs8DcQrsKcOb3NpFMIBdn9FnnPGmkFo1dDjhv
	sif4G9eWbbJlqdcWtp30YxuiyDaJfUH2CvKKsdwsmRqwZGBBlwSsbXFUbtlB7hvY
	q9bqAnLeIl8GUlWsIXm9ltOgpCR6w49oNuY/10s5WABtq7Oag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1727863744; x=1727950144; bh=9j31ZKWFkjMJPw78jBMGSeElPR7s
	mlKsOFCpeXXHibA=; b=gyicSNW4WVRALQ/AXNK0MqSqopW94Mm+KCN93B17JyRM
	FassssIc/iUbb5IP5tjIOk62+6KXS10aj2uaRHeLjhFvYuJ9oXiwWlAyZ2AWoZwT
	Cng8cgirkXBfIP6BeMfW9Ll9sK8yvg5TFxi4taTQfJV5wUe85NQbEwaOuJIFOKF4
	3zHlbJI/C2F2uhHZWd/ca4vl18WcLqdPyqE97Az3P+Sf3o2fsOsRN5b8ZQUgoPer
	G4A+OT4Z5gLDPzW6d3Z4fOWjUwIj8Qr7om4XaC3NLbFGIofxFJxH/NpfwN2KrFrn
	R79Q+yQLDIOjky1JFwuH04dBT8m/APoeEz6Szsy2UA==
X-ME-Sender: <xms:wBv9ZtXqK6Rjd0-W_HT2GFDa_cMJxzNEi1I8VpIBh9SmWQ7ZjOfXjw>
    <xme:wBv9Ztl2ANZmaZFTWApzikION0jA-CMQaO9Q1Tj4gZwNv0Rd-vmNuc0ApMLw4cD6y
    OF9pp4pLWQ6axDS7oA>
X-ME-Received: <xmr:wBv9ZpboZT6QR71BZEBkTL2MWDo_Z5Clvk20-XRw2Ok_1OzGEYSDzpDJMukIJUt21yVK_UhN17BtGM-DL9aZLupEfUM7x8xSSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfh
    rhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqne
    cuggftrfgrthhtvghrnhepfedvgefhuefhjeelheetveevuedvudeijedtffettdekgfej
    uefhueeuffdvuefhnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdptg
    honhhfihhgrdhsohenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepsghruhgtvgdrrghshhhfihgvlhgusehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslh
    hishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepphgruhhlsehp
    sggrrhhkvghrrdguvghv
X-ME-Proxy: <xmx:wBv9ZgU4huMicANJV_XJMJV7gQU6yN_dC4Tgg3MJVAe9s-2clm3uMQ>
    <xmx:wBv9ZnkcWq2nyV7mw34NDuS1ums1Vrm4GAA9symSvA0f_Jp6vYRmaQ>
    <xmx:wBv9ZtdxZXPsGGzXlTrK7MuXfAUuaht3-fgvLtCIXj5-01QeFy3r-A>
    <xmx:wBv9ZhE0Sh06UsLfF2L_-qkZ2yO3YL1XWKPp2lx3FPz9PPHBHlSWRQ>
    <xmx:wBv9Zlibg8TCgMtZi0D2f2k-1wafWxbWOPqgcyJkHniuu2dsXaQbt41I>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 06:09:03 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [RFC PATCH] kernel-yocto: Support in-tree config fragments
Date: Wed,  2 Oct 2024 10:09:00 +0000
Message-Id: <20241002100900.2975523-1-paul@pbarker.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 10:09:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205183

[This is currently an RFC as it depends on a separate patch to add
  support for config fragments with .config file extensions in
  yocto-kernel-tools:
  https://lists.yoctoproject.org/g/linux-yocto/message/14431]

In Linux 6.8, the in-tree rv32_defconfig file for 32-bit RISC-V support
was dropped in favour of a Makefile target which combines the RISC-V
defconfig with a config fragment '32-bit.config'. So to build for 32-bit
RISC-V using the in-tree configuration from an upstream kernel, we need
to be able to enable this 32-bit config fragment.

We can support this via KERNEL_FEATURES if we add the in-tree arch
config directory (arch/${ARCH}/configs) to the search path.

While we're here, let's also add the generic config directory
(kernel/configs) to the search path so in-tree config fragments such as
'hardening.config' can be used.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/classes-recipe/kernel-yocto.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 6d5c3b6327b6..66602d359404 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -248,6 +248,9 @@ do_kernel_metadata() {
                 fi
 	done
 
+	# allow in-tree config fragments to be used in KERNEL_FEATURES
+	includes="$includes -I${S}/arch/${ARCH}/configs -I${S}/kernel/configs"
+
 	# expand kernel features into their full path equivalents
 	bsp_definition=$(spp ${includes} --find -DKMACHINE=${KMACHINE} -DKTYPE=${LINUX_KERNEL_TYPE})
 	if [ -z "$bsp_definition" ]; then
-- 
2.39.5


