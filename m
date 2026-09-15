Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD8EC982C1
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:38:15 +0000 (UTC)
Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4694.1789499014806098963
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=ZOscrAVT;
 spf=pass (domain: baylibre.com, ip: 74.125.230.140, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91071ba92a8so869316d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 12:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789499014; x=1790103814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pt7XdNMN7R3dKHPqM+iiY0UCW4cIn+/tO0VpX++TTq0=;
        b=ZOscrAVTTBo1IOE9PMmN/PambYi0Kg2jtqf1jhtS8TP52AmiQsf7gn6jejpK59T/T7
         yw4evCZ2CNwZaFZdoLtInNWv0IDFZ+AJNUjHGmLp9kL5kG9nSNUQ1VlL9vZ6bvuIqFmI
         i6ffnttBXnKRYhZfdHF4+hKfr+3NUp/AOIBWWG5lSP8SjD4rXRfHthLzwXwbnzie7Y66
         OPZRweB5U1pBn5NqJvJ6Dauy6wbpSPvsvPjYCmIF3EuhpHhLNOJ4lwY7BvE1xuyMYzSY
         1z0+P2xD6kyWtCmihJwsOzkZfgit9j/fXyhSOBR4RyS+uDK5oiNWcwWiOTldYSj1DOr4
         Wbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499014; x=1790103814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pt7XdNMN7R3dKHPqM+iiY0UCW4cIn+/tO0VpX++TTq0=;
        b=GyHGTSPL7tEx3Yh1skz/XHluF4YOSA7NPl5NTGx0W7akLXwntjNay8LaIClQ6issAT
         ShpK0jbXOueeVJt0tYeUUYmBwaxO9VqADFry51h9youcgux72Oh1J3zbe14BcI3ocxTK
         69Wfr3+4b3+7YbVAdPynEmtsMdyzqvBTu3SoZWIHqvMuz/oVNPxAS83af3Rx22MLVuuD
         j873LqvqRW11YI6SjvWG01PklGoZDBu/ROvr+aod/9sMMuxnM3XrT5GvEpVKMwTmPoL/
         tW9IztypuYMP5mrqVzaiosdrLh1hga+w4YpweAbUOKrGxO+VfiI2onYKbnTFipbZaodq
         GvNA==
X-Gm-Message-State: AFuF++n/U2e82bsGUpVr0jMIsqFTguaHX8GYXQH0kMAexuaJPkC0Jw1U
	YiEgBq5EfBA2ToBFxDyP9YSwWFtrs+MQpAJKc9ZmNsdPuWelRj0IMi8yi8VjXXk4MNhUQkjD3a0
	HPZiu
X-Gm-Gg: AYBFou0srROFYsMhJMqWueiwZzAxd6A2iymG3pN3zdknD6txhZpIYZkV41seb8Bq63T
	my2tmBnSNTQ7Ya7AIa6qtIS9FPS4pIetJ13GSEcZxw3Jnl2b80EdeY8aStKSv9XiW119dFMf+Kt
	pmG2/6WXu5iCVbW0KPpRSGenhIABJd6vV946Z9lPvcWW9XIIO4cilIAcrfQiLhrqFssxx64+mXp
	rhA3dzKnS/r55enpQnZKMgPkCWq0OxxpyvE4mX5IRNyzlnG5OlayGaDr6opw84Bz2SUJNXJQtQz
	3e3mhICOYOc6fig0YtrOdeKycEB+bkGe+rXoGkui5njfILzAnq6gFHZRXB6Un0ylUOd+If9N3Bs
	Mo1uzpklp4Kg6Roi90GqS1kmbGc6DJkZw5RywUqhM8epX9gcORotci1XNY4jy7Eycj9Nh2KTMA0
	tXOO0WRWS9Pi9Bk7jq3Rov6Ci9HC0gq1N2sofa13t992WTbP1IlraOIK1G6Ac8F+zKMN4Yb8I4z
	gSbcvHz5fXoPRxK9g42Cu/LNZZ56kXjzQ==
X-Received: by 2002:a05:6214:1304:b0:908:958f:4db with SMTP id 6a1803df08f44-9123a41e504mr42198056d6.3.1789499013489;
        Tue, 15 Sep 2026 12:03:33 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be7c43bsm5904396d6.23.2026.09.15.12.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:32 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org
Subject: [OE-core][RFC PATCH 05/14] tune-riscv.inc: add rva20u64 to AVAILTUNES
Date: Tue, 15 Sep 2026 15:02:35 -0400
Message-ID: <20260915190244.2983746-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915190244.2983746-1-tgamblin@baylibre.com>
References: <20260915190244.2983746-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245880

riscv64gc remains the default for now.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/tune-riscv.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index 3eb057680a..e41a6ccc85 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -2,7 +2,10 @@ require conf/machine/include/riscv/arch-riscv.inc
 
 DEFAULTTUNE ?= "riscv64gc"
 
-AVAILTUNES += "riscv64gcv riscv64gc riscv32gc riscv64nc riscv64nf riscv32nf"
+AVAILTUNES += "rva20u64 riscv64gcv riscv64gc riscv32gc riscv64nc riscv64nf riscv32nf"
+
+TUNE_FEATURES:tune-rva20u64 := "${@oe.tune.riscv_isa_to_tune("rva20u64")}"
+PACKAGE_EXTRA_ARCHS:tune-rva20u64 = "${TUNE_RISCV_PKGARCH}"
 
 # Default
 TUNE_FEATURES:tune-riscv64gc := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"
-- 
2.55.0


