Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E447BC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 07:16:33 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.22323.1647414993347969942
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 00:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nRfGz8iQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id t2so2766937pfj.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 00:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k+TvrHtqgb85P2rzR+YJLVC//6QKKsL5GjnGYAmdURI=;
        b=nRfGz8iQXWvdoCbNc9cGsDx8rXb9XabPUwglH9osNSXAKg9nfjmM+gAEW+3qxrpRoL
         dbMLT+2D+angW3iYQWfWMCAdo1IZOiWJW9KI72AWSmruzYV/t1MDmSMAeN2RRAWrcrsU
         bvbhSP62Jdk6cgnz6TigmilE5yhX/Av4v4BCO6tjEX+Y7FUePi5lEFs2aSn2esAMl47I
         xf6+b2giCEE66PVjiyOtbgIgBsji0nGT3zLs5qHaapKu7Isdovs34ccIi2fxXbdAqYU0
         28xuzc5bOzd7bh7nvv1/E+Qrajp57WEuYFOMJL83PPsQ0Ec6loc3b6PtXevJM379WSj1
         kVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k+TvrHtqgb85P2rzR+YJLVC//6QKKsL5GjnGYAmdURI=;
        b=l9G2hwj3mpa1X4/GQMJ4cKB3Dhy3N2VGV+odGWAkiJtRDu1s3ME3OcHED3JareXR+v
         jIh8KFmZmqEOqdtDLAPl1cESCyFWFNMzf/0g8VdtXFgB+wXJ3pBt5pkgX35ocT+ByEob
         +cWPw1AsmViuK8Eah8RO5XpK79SXbzDkNLspZ1+zrpxGa7PhZi+vNaOgVmxaLpq3hYqY
         EdpYq9swFs/jfwC3E9cL1Nybh+X+QU43S9i+6M6xhFAAZMAhVNP4m6cigmC1SflHnAs5
         IPf1AUeSLCkrDuU8bbpOchiSK1Lfl8M3C7uaJEmmQLAnZFNLApp4PUZLOMQEQzVnXkx2
         x7Rw==
X-Gm-Message-State: AOAM5326oKDJigokn3HMzdG9jxYDuidmqCPtGVmQ3+Hqp9d1I++zCizz
	+TeJzP5+/YYiMpHYjHYN5Sj4aiihOVA1xw==
X-Google-Smtp-Source: 
 ABdhPJyO2OG6tJ4HPABpsJQ4Mr9lqciTCE//9JLwYdYWmBbPRA32wpyTLd+fg9AGlP7cUIH7A3cfJw==
X-Received: by 2002:a05:6a00:1a4a:b0:4f7:be32:3184 with SMTP id
 h10-20020a056a001a4a00b004f7be323184mr16452769pfv.65.1647414992644;
        Wed, 16 Mar 2022 00:16:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 u25-20020a62ed19000000b004f140515d56sm1567648pfh.46.2022.03.16.00.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 00:16:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] qemuppc64: Use smp = 2
Date: Wed, 16 Mar 2022 00:16:29 -0700
Message-Id: <20220316071629.3494348-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316071629.3494348-1-raj.khem@gmail.com>
References: <20220316071629.3494348-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 07:16:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163322

Speeds up the system a bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/qemuppc64.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
index 5f4f68b9816..304f06a30d2 100644
--- a/meta/conf/machine/qemuppc64.conf
+++ b/meta/conf/machine/qemuppc64.conf
@@ -13,6 +13,8 @@ SERIAL_CONSOLES ?= "115200;hvc0"
 QB_SYSTEM_NAME = "qemu-system-ppc64"
 QB_MACHINE = "-machine pseries"
 QB_CPU = "-cpu POWER9"
+QB_SMP = "-smp 2"
+
 QB_KERNEL_CMDLINE_APPEND = "console=hvc0 nohugevmalloc"
 #QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
 QB_OPT_APPEND = "-usb -device usb-tablet"
-- 
2.35.1


