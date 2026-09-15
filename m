Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1767C88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:38:45 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4497.1789499022173599954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=PoaPEanh;
 spf=pass (domain: baylibre.com, ip: 74.125.230.204, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530de452c33so517451cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 12:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789499021; x=1790103821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PxNZRZfh3q1orOtYnMN1CqOuxdaiJUhAckG3IiEVP3o=;
        b=PoaPEanhIXvkQkBDGy6RJRkkjIZH0/fMPhzQHLGJaye13ZwUmSBijEua2d73Cg8FKc
         GEluzfbNt9PSeQyl9MX0X1TxkQq6W2iFcnfymkH/QmYcIsPhNdLDNOfS6LrM2YF7IopZ
         HMTmjH97TSTzoQjLxw+IxTWRjzkZSeppG6HCeFwQtOE4NflXQsnWYAZyroaMAQvZKT9t
         d6kvQ/p/QUw6MiwWCMqzctknpZJbSO6P3fO5PVFq1ppEneVxjJCYZaw5aJtRPd4hL5Wc
         4z5VCxHOsAkoNqy3BFTSTDziIMHSOsdqSQmszMySrjIo04irdcdENy4HtQvtHxamKplD
         Omog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499021; x=1790103821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PxNZRZfh3q1orOtYnMN1CqOuxdaiJUhAckG3IiEVP3o=;
        b=sULTiMzZvbDlD+c1ouGzuQDZW7m3wT1CK7nINO663c+UaCu9XCBuLnqcopSptPWVR5
         yKiNiaPwQzYxtAqxrg7g29jzgA3lWuEwrJ2nc/CODaojgwPc2QKSHDNjIGUqCFYbTGxi
         EKhCsnIwiPP0rf/FA6DLkkt4tlQRCJB/TCITPsQXEVvx/WMaxylb1Iknq3aAJ9gYbapI
         1ZiTKU5AbSqqrYq+sSQd2TpFI77dTscojTyc1BOFwkwGkUNjXFoGmWqTJ2ocQkOPWcff
         snowBSXEK3N/tVJyKgjndhWdAa6goL68yWasTsBkxDgyFBjtFoKf2A79MvZ01EysIGmO
         YBYQ==
X-Gm-Message-State: AFuF++m76YVaxaPEmmjk1nwaSS2d4NUTaSeyXrP6OyaT+fSHPT2Xfo9q
	q7BQz7IZQURWi36XrEJegLBhKgpym/0yXnJFoz0F6bui3//aYZloob4ftkLGMAjvK8Nx9T7ET5E
	6/uc7
X-Gm-Gg: AYBFou3FI3JBB3SbxwrUXnDWfKeidIvrS1kttQwdbTftwWt6nTjUKSStSSzcoDiBwv4
	XOWHsU8TkfYyuWIfkPZhV8SsBRICE2JmUI28kBMs1LWjrrfkFSzqv3eXtb294ANK2MvsxWzJNlT
	DzxZDqgpTuEzrnIBSapCNLAFW14P3N5FcNt5UDLjw6aak6pJW6pPVxH9S+aOTul/6dFwEF01tX9
	ug6Fz4Ix1uhPnm2cIFybcjQfKO5Fzwz6S/g1Y+o7kWbfLBw1v4GJWOUl8TFTE4zneC87ZOCpX5p
	jWCGdQNCdaITCEM6Bvjysoy2oKuez6l6uFvO75oiR+az1Vq6/KdGjfB5yKI/yLkznZHB414MeRK
	Vwpi5OebVQJf/+7urVZpMNB/hfFWoGcLpznLtHFfyC3ZAPGojmiGQ2l0tzBLh8QcYZ6vOttuf0Q
	LrUcFcUaucTX5F59a7h69zaX2xteFn2GI2Fu819lFATXbpkUP9OY09/hHd7ew0GfQUXTswQkg4g
	Cw9V7+seVqU8WJgeAtLDgn04l1s75bIJA==
X-Received: by 2002:a05:622a:3cb:b0:530:ec4e:67d7 with SMTP id d75a77b69052e-5310cf8c96fmr131978301cf.27.1789499020859;
        Tue, 15 Sep 2026 12:03:40 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53259aedff4sm1878951cf.4.2026.09.15.12.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:40 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org
Subject: [OE-core][RFC PATCH 08/14] tune-riscv.inc: add rva22u64 to AVAILTUNES
Date: Tue, 15 Sep 2026 15:02:38 -0400
Message-ID: <20260915190244.2983746-9-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915190244.2983746-1-tgamblin@baylibre.com>
References: <20260915190244.2983746-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245883

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/tune-riscv.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index e41a6ccc85..e8544ba8ce 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -2,11 +2,14 @@ require conf/machine/include/riscv/arch-riscv.inc
 
 DEFAULTTUNE ?= "riscv64gc"
 
-AVAILTUNES += "rva20u64 riscv64gcv riscv64gc riscv32gc riscv64nc riscv64nf riscv32nf"
+AVAILTUNES += "rva22u64 rva20u64 riscv64gcv riscv64gc riscv32gc riscv64nc riscv64nf riscv32nf"
 
 TUNE_FEATURES:tune-rva20u64 := "${@oe.tune.riscv_isa_to_tune("rva20u64")}"
 PACKAGE_EXTRA_ARCHS:tune-rva20u64 = "${TUNE_RISCV_PKGARCH}"
 
+TUNE_FEATURES:tune-rva22u64 := "${@oe.tune.riscv_isa_to_tune("rva22u64")}"
+PACKAGE_EXTRA_ARCHS:tune-rva22u64 = "${TUNE_RISCV_PKGARCH}"
+
 # Default
 TUNE_FEATURES:tune-riscv64gc := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"
 PACKAGE_EXTRA_ARCHS:tune-riscv64gc = "${TUNE_RISCV_PKGARCH}"
-- 
2.55.0


