Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E388C77B7C
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 14:25:45 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.25261.1751466343251422879
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 07:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JiSxoQCy;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso7096110a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751466342; x=1752071142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CuUUbrQEktYoXUaPuhKPw7TVMbptRattgROApghoQ10=;
        b=JiSxoQCybxD9tu9jrC1T/4iIXB6e+1Mo8OmNaJUqTyOAP9+lsncK/1pE1hjKpdVUUp
         qZrVSlyxNPfUvThxLdgtS4xUWTRTwZSoT/8yw1Jxts3tuNCRCNXtzBwy/pHiCohQgK9r
         K0ZvGYqTrzRT45sKD814F928bs0uoSfybY4NbNd01X71hQRuuLJp6kaRS7WimNzqeDgk
         Il7nhjoTqcxtM6Tq1J5LDf7slsT7+za+4xGEqgDj8ZRPcvtWfHPsMF94EXLUqvRGovuS
         B4Xqm2uEf19ub449NEvB274QHsaAF5BOAEbiCRD27UXw/fV+A5Qx97srwIYKJpzQdEk2
         25Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466342; x=1752071142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CuUUbrQEktYoXUaPuhKPw7TVMbptRattgROApghoQ10=;
        b=fpJsA8lKz/2l0JxfNFtQxklnx40GOqMCvngAeAY0+vafzy9jeQKpItQxuefAbtq0lY
         75U5p98e7D8IgwUPk/caMSyNnCzGY20136+fRsxkxZH0hzVa+JQ0zN00gtFJyGLV90oS
         Fgm8uAumOaWakuSXfHV17dOH2q1wSXp16Pql6e8Xuw9PK8rAGV47WbI+MyF42wo1yVA6
         FjLicwDVC+PSN530y8v4Bjd2po2T0RoPPQMue7mbyAJkdRfAXgLIf8MC/FDqIeNohf7Q
         MZqAwR391VgjjJ7mwhGzZ8kpVZfH2nZyplVHWtqoFTeiSNIKQvQPmhTRS5Q8r1gTN67z
         dahA==
X-Gm-Message-State: AOJu0YzB5H8bjsjCs+NqTzfV2vw0kS+tTYdduosFe1eR7ko1WrHNElix
	r/IuORKOe32teh7b5p3XPdAYZD4ZjBGQrTf9qKAGqYVLIzirNMj3EkRkvCBkxW5u+j7oEoc1pEn
	ce4vp
X-Gm-Gg: ASbGncvv/rw6m2wNSLl4LsKRQGpQkp6v9nE4UTQA/FdmjtU8iyl9Ey8mnDcOpluqwQ2
	JF02biwzJ6GXqr8yZkLXt/oUSX2+Mtb6dl5AGoUufawE8Ylczh5h5Zppcohjyt1KmtRlMsUmZ8g
	27g7oGHXzHyLC6jcy+bCGjVWnGsbg3dlDFdjYq4CWyfiNe7jvpWWA0GtYVtfd2totFi0cIEL7gf
	bZXGMBhwnyOAjcwL1I/i5mEy3yiTb2kj5SYLKoJgdM56YtYXmmvjiuEOAlWix2VEO7taKG19WkO
	MDzuCQBiJr8QSYM4rDR6EHsi/Irv6ItW3F5hGLU93iC0fs46K7sbgg==
X-Google-Smtp-Source: AGHT+IGRBTErNCaA9WJB+iwZ3ppvGOp0ltKiNsNjg9obCLxcY0opjraqItBoIQ67MmHXZklo009dyg==
X-Received: by 2002:a17:90b:2d8d:b0:314:2939:efdc with SMTP id 98e67ed59e1d1-31a90b2ff4bmr4769416a91.13.1751466342290;
        Wed, 02 Jul 2025 07:25:42 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:acee:7642:9516:37b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c15232c9sm14871637a91.45.2025.07.02.07.25.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:25:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 9/9] tcf-agent: correct the SRC_URI
Date: Wed,  2 Jul 2025 07:25:23 -0700
Message-ID: <eed926581cf1d25094d6902f7d552366953695f5.1751466215.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751466215.git.steve@sakoman.com>
References: <cover.1751466215.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 14:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219842

From: Guocai He <guocai.he.cn@windriver.com>

The SRC_URI is changed to git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 59b9d7de78..f930500de6 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Target Communication Framework for the Eclipse IDE"
-HOMEPAGE = "http://wiki.eclipse.org/TCF"
+HOMEPAGE = "https://gitlab.eclipse.org/eclipse/tcf/"
 DESCRIPTION = "TCF is a vendor-neutral, lightweight, extensible network protocol mainly for communicating with embedded systems (targets)."
 BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 
@@ -10,7 +10,7 @@ SRCREV = "1f11747e83ebf4f53e8d17f430136f92ec378709"
 PV = "1.8.0+git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-SRC_URI = "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=https;branch=master \
+SRC_URI = "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=https;branch=master \
            file://ldflags.patch \
            file://tcf-agent.init \
            file://tcf-agent.service \
-- 
2.43.0


