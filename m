Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B4CC433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 15:37:03 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.7493.1639755422457331830
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 07:37:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=PV8Rwhvz;
 spf=pass (domain: madison.systems, ip: 209.85.214.181,
 mailfrom: matt@madison.systems)
Received: by mail-pl1-f181.google.com with SMTP id p18so2145619pld.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 07:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=29WWtFtdk4ZzY7hzLGwGRfyWsr+2FrV5eNXimnj7DGk=;
        b=PV8RwhvzACRlOveDB6priMJojcjNXEhfUYv8mxR7V3Co3QEUCcGV55Zg/vNah4GrU3
         X8THFmR3RBPcjsG1K+HgQYATtrLZ/SXJCy+s527kMZSuFfNkKremC1zrWaqC966+nSAb
         Sqh4LrY9UMuF9xjqGRhIAuOwJWUnDdYgSCxo2R/eetMvUno/Y2Fs29hqZZSHMqM9uBZi
         ew9Zt+na11VcqJI6XIbQX5nWfQ7jiKC75yeTVwwj8/uSMWEyUXoa8jdVN7pygki/6sS6
         y4WTb3SVyWruMGRFfghMEsmRvUIa8MgY711s46I9aFWvWXzZRfD3cMQOEP4b4QjvsGsG
         me+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=29WWtFtdk4ZzY7hzLGwGRfyWsr+2FrV5eNXimnj7DGk=;
        b=ji6SPI0s3iLBgWI+KrIjydLhDiaTwhZWZjL7rU++Foc44bX8ZKl7BT7udUfroHKvu3
         20e3ratL7pZpvm67q+5m6eok8A2Mg11yMrz8SIxQtFu6cI7D57x0gxW1fU4++uIxiYN8
         PfYj26kP/vZuvkyxjZRBHwvPWSx4UTVfTg4dH2t56XHfhva8H95wp5ArIjT86ztwDwPZ
         QL+P6hdm3K0ulwPh77hFfACe621K8LR0XM01Y/I6KG+/0j4vOvJUYPG2YTLxXqSUxRQk
         LaQo9RP6RRa9xJNuFBmdyBmiu5/qZMRV2c95p1mfiaytBvii4Xk0rNZWynP6gyENAxAK
         /bTg==
X-Gm-Message-State: AOAM532zFordHbfeZjgJ5/J3V5F3euJVn8P/hV1ceWggPki4ZqJBjUY8
	G1Ktv6R3anjE8Lc0mtIHC5sknGwBISSaVw==
X-Google-Smtp-Source: 
 ABdhPJy+/Z8vKg4Er+LregJBcbabFDXPa4GW/7CgfugXdQkK3HS0Izq4065hNPUVblhpHQvTdvOaCQ==
X-Received: by 2002:a17:902:ea03:b0:148:ea19:557 with SMTP id
 s3-20020a170902ea0300b00148ea190557mr659573plg.129.1639755421464;
        Fri, 17 Dec 2021 07:37:01 -0800 (PST)
Received: from visar.local (76-209-242-28.lightspeed.mtryca.sbcglobal.net.
 [76.209.242.28])
        by smtp.gmail.com with ESMTPSA id
 ip5sm8271631pjb.1.2021.12.17.07.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 07:37:00 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <jpewhacker@gmail.com>,
	Matt Madison <matt@madison.systems>
Subject: [OE-core][PATCH 1/4] lib/crate.py: install crate fetcher on import
Date: Fri, 17 Dec 2021 07:36:27 -0800
Message-Id: <20211217153630.1746217-2-matt@madison.systems>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217153630.1746217-1-matt@madison.systems>
References: <20211217153630.1746217-1-matt@madison.systems>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 15:37:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159829

to enable the move to using OE_IMPORTS for adding
this fetcher.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/lib/crate.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/crate.py b/meta/lib/crate.py
index d10f441875..f9db7c28cd 100644
--- a/meta/lib/crate.py
+++ b/meta/lib/crate.py
@@ -147,3 +147,5 @@ class Crate(Wget):
             mdpath = os.path.join(bbpath, cratepath, mdfile)
             with open(mdpath, "w") as f:
                 json.dump(metadata, f)
+
+bb.fetch2.methods.append(Crate())
-- 
2.32.0


