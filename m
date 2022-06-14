Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9386CCA47C
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 15:11:25 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.7380.1655219478821221014
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 08:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jgB2LxuH;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id a15so11720416wrh.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 08:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gd+TT2+h7sHZ8k4eCB3EylAjwP5hm50V6/bgYDIOHXA=;
        b=jgB2LxuHw1OcsSSnmKr91sONWBjnL0kbXLIacOy4vbHarA6ry4XgGeqo67ekVkUbou
         t4t7NHyP97sdFiil6aWMS/ISOJEs1d2llTA1RLUxYw+KRKI8pFMup/39EaEcy/rOhafo
         ug8cJAaiUvcTwGc2xBQRzHjRky5KQxKhKc5syu5ij0asop39HdbHEcb8rh4Z0RQaOTyZ
         fnUNPZHsDHK7JfjQGnY/5X7TsJNF7Cjk03lADBPwFn9pQvbuTiAmydWxnTFJ0s4L4dja
         8K2qbwUziar/Ngq/35Pf1qxqZtKgvgfR6/E+otJZt1VFZIy7xExlMVusvRuE+pEcrPNA
         3/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gd+TT2+h7sHZ8k4eCB3EylAjwP5hm50V6/bgYDIOHXA=;
        b=YnmRYVvusc3K+8GoKpEp0Ur9nsNBho2+C9qNBhZgI0IZM/DsG3hXwXb8u/e3GQRFJc
         i041t9rc6xCgoYHslRJ56mbbKMG/ToPE0LO0eEvSY/TTbF+3rQwzVh4ElhWQaMhqFKYY
         MG41VQaCLsMpku645v1n2HJx9saBv1fNFKtr3rgY62UTGx9Wz3W0BDRVCSBSOfGhGEQV
         ZPePwmyTibU6QYzebvK92vX0ZT64SAqGpOcTE4OmJPcNoV+m2hfAokcAQppNILgCQyrq
         xQYsQR3scpZMuRlUdsR3570Wh32twhyGf1dbdsWtWnzNzY/qeObGQj1Z85pxty238JTA
         BooA==
X-Gm-Message-State: AJIora+WAW5Ucn/4k7v7meWAsaSlZGUM+2OVPCzlrI99y7UMvdExZU3S
	q4zQeKKcYZp659W3GXHVUxRdWIgPdA==
X-Google-Smtp-Source: 
 AGRyM1sRZPXgDhIx2mElD9C36wSXv1VCKxYteB69dwsb1ow9qCgcbporBhtNQExWTc+q0eywCBSe1w==
X-Received: by 2002:adf:efc3:0:b0:210:3544:4223 with SMTP id
 i3-20020adfefc3000000b0021035444223mr5321231wrp.581.1655219477471;
        Tue, 14 Jun 2022 08:11:17 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 h62-20020a1c2141000000b0039c151298b7sm18114522wmh.10.2022.06.14.08.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 08:11:17 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v5 7/7] libcheck: Fix too long shebang for native case.
Date: Tue, 14 Jun 2022 17:11:05 +0200
Message-Id: <20220614151105.1890454-7-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614151105.1890454-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220614151105.1890454-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 15:11:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166901

It requires a shebang wrapper due to the fact that awk interpreter
has an argument.
---
 meta/recipes-support/libcheck/libcheck_0.15.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libcheck/libcheck_0.15.2.bb b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
index 188d689cc3..1393aa2a1c 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.2.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -23,6 +23,9 @@ CACHED_CONFIGUREVARS += "ac_cv_path_AWK_PATH=${bindir}/gawk"
 
 RREPLACES:${PN} = "check (<= 0.9.5)"
 
+do_install:append:class-native() {
+    create_cmdline_shebang_wrapper ${D}${bindir}/checkmk
+}
 BBCLASSEXTEND = "native nativesdk"
 
 PACKAGES =+ "checkmk"
-- 
2.25.1


