Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE8EC982FF
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 13:17:36 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9903.1790083054027329302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 06:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PN2tjsXu;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e2406so21575925e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 06:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790083052; x=1790687852; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CVE+EUkPbZ2HsN8KLyg48ZT4pWoUGhd+uZfJCri937s=;
        b=PN2tjsXuU7IqZtoJD9YarODsXrQeWAV3l93wMvsXY9wvxd2ZcRmSjx2AvwhZYjiwLA
         IEr03+EoD5pu+28ZedG8tU4iS0LWOWCyF+vKA5Rw3PiMLgetci0dIRBQ2pXmBsIkrBUv
         n23qkgXSjX+CJrghR6paKVwBKCwCSBayHZyAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083052; x=1790687852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVE+EUkPbZ2HsN8KLyg48ZT4pWoUGhd+uZfJCri937s=;
        b=Mt5MzUdBGviiMIhnbZxiRA63or2woYjCwlWHWJJAYlis+FgIqX4jirRFpjLR91LuJN
         oJVBrQW1nzdIWu5SQMXYHDnGz/ygKhTyrYAwZVG8eAo65eH3R180lz6U4DBIUDmcj0KD
         lRDu8BSK9KhzJShy7tBALvl/pw4zvrlm5bpc6HXXQ22VPR1gs8icHJSQoXvh1xRD/0fO
         oTW70oA7NjOFSP7RSRvO2KrBdj6EhIAYGigcntS+306+wnjvWC6jizkS1xzVD9Ao6AuD
         hAPmfskIH59PT5e8TO+3Vg2/KpuxVA8OhI8IbAc36oXK8O5EGndhqmADV2nDC0ccOHkf
         Cqew==
X-Gm-Message-State: AFuF++lFZB8umWzZEr18doCpNlMPqZukHqwbKyZDnhpOBDTj1CdlX6JU
	cvc33whNpiEJAmCFrqOYecu/OT0Lr7U5cKpAGXX/3dNkjecXj0kEweT6Dm/eljyelxAd0jHRTqX
	j9WH5TeU=
X-Gm-Gg: AYBFou2vLEfa2bzxA3RFwtUasW/YNS5YnGAiylGiwAXguMtew9Q13dB9Lw3m9uBPhrz
	lYB9wNNUDchhRHI7XK34VrM9XnlQP1QZucNwM6ef3fk8x6vrHivKHe6MApq2JUmrz1AHWHkN3/s
	PcZHtBqRi8lEjyWuWy6m4kf14JCrXNX8Bvjyl1/X9mdwDXBK5/iGWrCR8Hu5QPN0QVE0/g5m8A2
	2RzMwh4ucc/TVEAB4CTJ8We6v/Q4gAv1LY+8UdSm+ZUos8g9qvdYFUZhXbileba8uuZe8J3NnJY
	j90VICb1ScwiF+XkHV3OjsBBaP964Z+JOJw4K5UPBusgzBxaNxNhyDGOemstGGwW4OhDKPwbIO/
	3gRj1tpyWw9JvjOcq5uFRMU17KpRN2da5RIYHielwHhD1XbiCDvgfjJNbVuackzZdyvtMgb2IVs
	Zo2pGHQxJQQKIy4PxG3eyhuvFTboEVR3t0yliMOlPYauFQmj5yc8O9oi5o1f4FV3R9RC/qN1Mcw
	Ei2TYHId7eiwy0MS09WCFlorD3fhqWToaQX8tsL0dPGRNGrg4B+88mxXuOJgsrWpsBtU5jgmahA
	tfFkLQ==
X-Received: by 2002:a05:600c:8b38:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-49fd8860a5amr45950995e9.6.1790083052049;
        Tue, 22 Sep 2026 06:17:32 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaa28fc8sm39107275e9.0.2026.09.22.06.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:17:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] cpio: fix "CVE:" marker in CVE-2026-66484.patch
Date: Tue, 22 Sep 2026 15:17:08 +0200
Message-ID: <20260922131708.1237025-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 13:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246412

From: Yoann Congal <yoann.congal@smile.fr>

"CVE-2026-66484.patch" should point to "CVE: CVE-2026-66484"

Cc: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cpio/files/CVE-2026-66484.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cpio/files/CVE-2026-66484.patch b/meta/recipes-extended/cpio/files/CVE-2026-66484.patch
index 97ce9a785cf..538f80daf9b 100644
--- a/meta/recipes-extended/cpio/files/CVE-2026-66484.patch
+++ b/meta/recipes-extended/cpio/files/CVE-2026-66484.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] The --no-absolute-filenames option affects hard link targets
 
 * src/tar.c (stash_tar_linkname): Apply cpio_safer_name_suffix.
 
-CVE: CVE-2026-66485
+CVE: CVE-2026-66484
 Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=e2b9cbdd3354d2b1569b7390d1bc15c1930559ad]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---

