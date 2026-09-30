Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66843CA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:43:55 +0000 (UTC)
Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18035.1790786320626804621
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=SKWYv1xo;
 spf=pass (domain: baylibre.com, ip: 74.125.230.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-914446005e8so45459796d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786319; x=1791391119; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vSZmKbVKVe3q7NNO4td5Nrcd3CK2x1iPrUDJzvYXJyU=;
        b=SKWYv1xobHGEOy6CgKdiHeKrz51NsHrDC8uk1h7dpBeGrzCO25vJumsJFYX7JL5ewl
         nK+2oi2siTG1a0WtzOjCdAn75qpTKJppNCmLsUwnPzxAvLTc+lt1UBbW8Jd3zLwiA2mn
         bXQtikQUrAMp/b55QMx3aMhM/1syjchR7xLWS7cpA/deq+Yc+mxOFkMSYAQ3brvtd3ZQ
         6i44LHrh8Eft3jNtFvqZ9xruEC2B/sre783ggVpgzcaiKnLFaZ+fY3CE1sTfOdq6CCxX
         UQnOHn50md9jPnd9At6h16oP2i24Jvnj3RqHLFjwmAmB08XnCmBXNMDAcqsYWbXMduwG
         TFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786319; x=1791391119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vSZmKbVKVe3q7NNO4td5Nrcd3CK2x1iPrUDJzvYXJyU=;
        b=Jj6zrKBcwOqgZR62nntJmeWGG/CxWGnt4+EQymqBM2RlNKF2B+s9wnTnHg5IdIuXEQ
         1cJtUdxjmkXTsVrxswUId3t44t7gm/B9Mj0pKPY4DdMwbLS06iWkWZaab/ys6i8fD34L
         lI1SnnfOCkPYWQQxdPPPXFH63xsj0esb8DiqrXNp6HH8CLTjSvpzCfniIBeqNNFhIB/F
         mzvkmJVktTIFnrjFl2cQ1jNeCgLs9B+MLJCdJMiiZVOCJ2a1ygtj4Kz7k51E4KQOCKcg
         +64g9J7JNguAOyJG/jPgU/4TkQJmJnhz63eEHrCr+o2yTHPnhrSBUkrOSyUQr0xEvbYG
         GAyg==
X-Gm-Message-State: AFuF++ljs7Mbw6azQ6qhvdKhMi6eVMG7i438cv3ToIvXIbS/ky9ddSrh
	Arp9l2VRw00gE/Ml1GUMkZ0pATdad0ssVLbT0a6SmL9HASryhseQvQ4ygD3yueGlzb8=
X-Gm-Gg: AYBFou1sSFrqPPlfP8gGoKWsoDRdTQNCMUp/jbXmAkIQRDtIeaELiMEJSftJ17j467D
	G2qbKBAa2v65wG0iD58W6KCSMkw2amMtH4Hwj6z2o7oHfNUm9S7VZv7zUcGwKiSZCz0XmI6cjax
	iI7qDbhQniaFbJAo9Jw1ZzxBUTAp0atRjgT7LlbnPNQjt/gddE1widoSSjGzD0XLL11Q5NExO5r
	jeGUPzKSkQlkuNcY7xv68luiXvSeVfDlBSK01bJaitQFWSI329YJZS9EdmRS8C3fFDHlH+QlLhE
	oLSaQkadH1EuW3EBhDo+p0djAol8ZeNOvPUwziVQCyoR2suvh3Y6PVZma+dpkOVY0wo3aRbzgF3
	0F9uta8luTIZ85zcu8X2Tne09undOxWTOkzwUb6LRZCWJZmIRXtRKb4Ssl50H0nh52dFLy4NWHm
	u8liez/Jlg766t0pW16Ri9gYxx03K047NZC+iGLIh2Vu+FMRtdTWvclzl0D98+lu2hINKt/SUR0
	/BGnY6I6Bh+FwicIt0mfjySykYysStML8+oOdjWjD0=
X-Received: by 2002:a05:620a:84ca:b0:93c:6ac4:1dde with SMTP id af79cd13be357-93cac20dcc4mr269689185a.54.1790786319626;
        Wed, 30 Sep 2026 09:38:39 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:39 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Date: Wed, 30 Sep 2026 12:38:21 -0400
Subject: [OE-core][PATCH RFC v2 17/19] tune-riscv.inc: clarify zifencei comment
MIME-Version: 1.0
Message-Id: <20260930-riscv-tuning-rework-v2-17-9e29f3531d0e@baylibre.com>
References: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
In-Reply-To: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, mark.hatle@kernel.crashing.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246997

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/tune-riscv.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index b31d903172..76c7dad713 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -15,7 +15,8 @@ RISCV_PKGARCH_RVA22 = "rva22u64_zifencei"
 # (they lack the 'v' extension) but rva23 is, so split it out for comprehension.
 RISCV_PKGARCH_GCV = "riscv64imafdcv_zicsr_zifencei"
 
-# Linux kernel requires it, so add it on top of the profile's extensions.
+# zifencei isn't a mandatory extension in these profiles, but the Linux
+# kernel requires it, so add it on top of the profile's extensions.
 TUNE_FEATURES:tune-rva20u64 := "${@oe.tune.riscv_isa_to_tune("rva20u64")} zifencei"
 PACKAGE_EXTRA_ARCHS:tune-rva20u64 = "${RISCV_PKGARCH_GC} ${TUNE_RISCV_PKGARCH}"
 

-- 
2.55.0


