Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.4761.1623729250353164159
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 20:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 15F3s8L9023846
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 20:54:09 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 15F3s89h014158
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 20:54:08 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 14 Jun 2021 20:54:08 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Mon, 14 Jun 2021 20:54:06 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] ffmpeg: link in libatomic on 32-bit mips
Date: Tue, 15 Jun 2021 11:54:04 +0800
Message-ID: <20210615035404.10376-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It needs some functions from libatomic on 32-bit mips too:

| libavformat/libavformat.so: undefined reference to `__atomic_fetch_sub_8'

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
index 3ed009bbb7..f3097f8ebf 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
@@ -130,6 +130,7 @@ EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mips32r6', '--disable-mi
 EXTRA_OECONF_append_mips = " --extra-libs=-latomic --disable-mips32r5 --disable-mipsdsp --disable-mipsdspr2 \
                              --disable-loongson2 --disable-loongson3 --disable-mmi --disable-msa --disable-msa2"
 EXTRA_OECONF_append_riscv32 = " --extra-libs=-latomic"
+EXTRA_OECONF_append_powerpc = " --extra-libs=-latomic"
 
 # gold crashes on x86, another solution is to --disable-asm but thats more hacky
 # ld.gold: internal error in relocate_section, at ../../gold/i386.cc:3684
-- 
2.17.1

