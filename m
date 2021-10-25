Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1D9C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 20:10:11 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.2480.1635192610411850083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 13:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZaHJHxaQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id w15so11278739wra.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 13:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mHyMFK+F+CqEyx3hRR0dIg11cSYOkO8RUm1ghQL9Zbc=;
        b=ZaHJHxaQFH+zU7EQQW0Hv0ZO2e8PA5sS/QABM3GUq8+XXbYaV5WGef8kXZuEsdxMnY
         Kta1WDbM+bHNStHpJ3zd24cn24tRxgwV3BDSvID3ZmWHyhcuTn3aCp3Moh093tUvEkWO
         E/Dil36Kya0u14SfE2QL/hRwT17t0AuU/VjuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mHyMFK+F+CqEyx3hRR0dIg11cSYOkO8RUm1ghQL9Zbc=;
        b=k7q6Mge9Jcu90WeuKcgLAGMXiIPqpKXpDu+kUdtKtUlaHg3h13Lw4Jpvyn8+ocx1td
         ZmiO4z11IK1Vfw8stZ4qLMcy1FaLzymnm2QpjIDRN7uurb/ETWfEZM+FmZtdQprAxbBG
         Kaw9guNP3vMCG9Eoiwsh4cSbPP93XY2cDEIxwi+DyEo1sK+cYBmBKt1RJzvKpx0oVBvt
         p+Wim4Stq3ajNKWgDE/KE/46Q0YJswB4nhoZD7cxR0c+AS6mefdgZDe0W4Bm8IERYKPM
         K5wXzL0LcgMHPEQWAw0/v14wsV9zS9Swo9gnkD5jfPs5uSIvm5m/ctV85VFr6Wnhkbcs
         gBAA==
X-Gm-Message-State: AOAM532HasVDu/gJrbDoahVDPWuGZQ5c9OMF3KDGwN93XpJ5UxPOttL1
	M65l1IpQatR1dWJePStZB9mDD3TB2FqwTA==
X-Google-Smtp-Source: 
 ABdhPJwONWPPJRQDEpIb75Nlw7kzSwRHyRzuEXcECPF/ty18/wOGalyuOnKuykMEg7Qu5w/5Y0JZJA==
X-Received: by 2002:a5d:588a:: with SMTP id
 n10mr14954776wrf.285.1635192608730;
        Mon, 25 Oct 2021 13:10:08 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5fb2:414a:7b8b:6fb3])
        by smtp.gmail.com with ESMTPSA id
 d16sm9495556wrq.66.2021.10.25.13.10.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 13:10:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] patch: Fix exception reporting with repr()
Date: Mon, 25 Oct 2021 21:10:07 +0100
Message-Id: <20211025201007.3281452-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211025201007.3281452-1-richard.purdie@linuxfoundation.org>
References: <20211025201007.3281452-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 20:10:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157363

The exceptions generated with repre are more detailed but escaped the
newlines making them unreadable. Fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/patch.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index fdf3c633bc8..8de70254919 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -150,12 +150,12 @@ python patch_do_patch() {
             patchset.Import({"file":local, "strippath": parm['striplevel']}, True)
         except Exception as exc:
             bb.utils.remove(process_tmpdir, True)
-            bb.fatal("Importing patch '%s' with striplevel '%s'\n%s" % (parm['patchname'], parm['striplevel'], repr(exc)))
+            bb.fatal("Importing patch '%s' with striplevel '%s'\n%s" % (parm['patchname'], parm['striplevel'], repr(exc).replace("\\n", "\n")))
         try:
             resolver.Resolve()
         except bb.BBHandledException as e:
             bb.utils.remove(process_tmpdir, True)
-            bb.fatal("Applying patch '%s' on target directory '%s'\n%s" % (parm['patchname'], patchdir, repr(e)))
+            bb.fatal("Applying patch '%s' on target directory '%s'\n%s" % (parm['patchname'], patchdir, repr(e).replace("\\n", "\n")))
 
     bb.utils.remove(process_tmpdir, True)
     del os.environ['TMPDIR']
-- 
2.32.0


