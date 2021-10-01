Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA12AC433FE
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 13:50:45 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.8219.1633096245332323126
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 06:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Dz1mx+qh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 g193-20020a1c20ca000000b0030d55f1d984so44102wmg.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 06:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=c4MHPZoto8FcZJk6sCcOjRDYi+IK0IfmTWH2F8EnM7s=;
        b=Dz1mx+qh+CVK1sjN7VrsQLXhMJkIrxFFzvhx5E4LjvC2jzFSOmifHq1jxmMDANjZ+E
         xa4pHuYztuylbxKsTKgchSiLXE19Iv/hnUKBB2/b7bvSicz6lUqZlTomgsc7jRdcxmEq
         iiP77LPyfZnAOzsgbIj9Lus244DUuy+jFiGXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c4MHPZoto8FcZJk6sCcOjRDYi+IK0IfmTWH2F8EnM7s=;
        b=IjGxCSe9WO64hzW4+yE+rMmYDfp2ettvccMIK//+NFHI8mRGnbLY6NIqKaak0NXEAt
         /pZCqMbqvTPfCUrEfFQZYI0xdZ/nzHGlwB8Bz5/37atZMO1Z3u8zC3Kz3yxx8cWFLRqq
         drgM8uYoPz6C87BOkX/qLXrourS8LpbIQcYCeGBq1wMrReWvpE1sUgvNjYQ+ezOq0Oi+
         22lDv1VyVBYz5aRWjw5Zcj1Bp5p6FtXzRS0M6cEgw6PEx7igF5gFZKYV5z0IoWTJlIw9
         3BXlgHSkr0FToUKAIR/j3+ffMql+ryMsmgUhXQNa4ClS679um8vZlqQuhQaeJGDh0vnG
         uZHg==
X-Gm-Message-State: AOAM532xqBsRd/ZAwnVlGnzfoOtg6nzZTdL4WKExwRh0wmkGbWOVo6K8
	xf8KEk+zlEMKI0/nMg3v+7v+EH0Ob+9lH99K
X-Google-Smtp-Source: 
 ABdhPJzjA4Ns8N6iqtJW6YIeOuEfmUP/pZOaRIrTMBCaeta45FPOXC8K2fhbjY9Jms6ul73pG7RAKA==
X-Received: by 2002:a7b:c453:: with SMTP id l19mr4497056wmi.7.1633096243732;
        Fri, 01 Oct 2021 06:50:43 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:415a:6029:9a90:9863])
        by smtp.gmail.com with ESMTPSA id
 o19sm6193155wrg.60.2021.10.01.06.50.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 06:50:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] util-linux: Fix reproducibility
Date: Fri,  1 Oct 2021 14:50:36 +0100
Message-Id: <20211001135040.2251283-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211001135040.2251283-1-richard.purdie@linuxfoundation.org>
References: <20211001135040.2251283-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 13:50:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156521

Sort the list of files to ensure the pkgdata output is deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/util-linux/util-linux_2.37.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.37.2.bb b/meta/recipes-core/util-linux/util-linux_2.37.2.bb
index 6f2808cc441..d609c30067f 100644
--- a/meta/recipes-core/util-linux/util-linux_2.37.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.37.2.bb
@@ -37,12 +37,13 @@ python util_linux_binpackages () {
                     continue
 
                 pkg = os.path.basename(os.readlink(file))
-                extras[pkg] = extras.get(pkg, '') + ' ' + file.replace(dvar, '', 1)
+                extras.setdefault(pkg, [])
+                extras[pkg].append(file.replace(dvar, '', 1))
 
     pn = d.getVar('PN')
     for pkg, links in extras.items():
         of = d.getVar('FILES:' + pn + '-' + pkg)
-        links = of + links
+        links = of + " " + " ".join(sorted(links))
         d.setVar('FILES:' + pn + '-' + pkg, links)
 }
 
-- 
2.32.0


