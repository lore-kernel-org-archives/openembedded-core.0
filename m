Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF59C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 13:35:08 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.13173.1685712901398271936
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 06:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dOlNC6Ev;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f6077660c6so19163225e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 06:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685712899; x=1688304899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPFnWLHW9tEySVJQtiAkcBOVVoDy5/D5nm4j4zuE23M=;
        b=dOlNC6EvJkZa9AvAjLDaC3W63cuG6QVClxLg9msS9dfe453b0VsDvoR3ExbkK2OIxM
         P/AcPjGbmHg4hyTN86JaeVYBF09av5Mnt2w8XF1sGHI008rspQNg8CMG0ULc1UAqGwiX
         dVHt8ZhlJIVYQRDqY7qziN8l33FT8KujREaVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685712899; x=1688304899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPFnWLHW9tEySVJQtiAkcBOVVoDy5/D5nm4j4zuE23M=;
        b=IGffFdXM+ay9Ph8SOjcWQ+R/FgmNk/wF0EdHMl0yYKmAL+hrvDnKMfq07m6RdmuOTf
         yQA6tZdeYwPfae51kf8ItZZujjWRD+ASg2Nvgy0MsQf06aZl9ZKPRZdbMZ5QLH0Yx3LV
         GH+IGiKGXz/qLuHoq26cxh2yNCgKdiIEY20pVtJfnz2EZGQNyxe2UHYszYv6+Sok2f+8
         Z7e7xoUVdLgiVC/AE6HYwaCmUNXb6a751VCKtynaM/QJy3PVZvW/6VrvJmXmVml74QXC
         aY3LFxPLopYzwxUknsOWA3hz2Wtb61SUVSV0vLq9yFdes9eT8ChLX3QlbR4cbELlv+ed
         N/9w==
X-Gm-Message-State: AC+VfDxyD/xll/DrlIn8vjgKuSyBtdqNibOdrhy0UeKMZXnenY2KvdGd
	5oiat2zRbFaDZjLFU8L4tPjNAqsxSj1AIPLV06M=
X-Google-Smtp-Source: ACHHUZ53eKDuSC921dXCDDltOh8eyN/Fjoki59iOiUOhwnpQmqhWKL21/veGBdKtltI7rSzgJEcSyg==
X-Received: by 2002:a7b:c7ca:0:b0:3f6:cfc7:8bce with SMTP id z10-20020a7bc7ca000000b003f6cfc78bcemr2151803wmk.22.1685712899686;
        Fri, 02 Jun 2023 06:34:59 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:527f:ecab:4831:c523])
        by smtp.gmail.com with ESMTPSA id z10-20020a056000110a00b003063a92bbf5sm1734262wrw.70.2023.06.02.06.34.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:34:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/11] create-spdx-2-2: Fix packagedata usage to work with SDK packages
Date: Fri,  2 Jun 2023 14:34:47 +0100
Message-Id: <20230602133453.229023-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
References: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 13:35:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182323

There are two seperate PKGDATA_DIR directories, one for the target and one for
the SDK. Rather than fail when a package can't be found, try the SDK first.

We use a datastore copy to keep the code simple, rather than havng to parameterise
all the packagedata functions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/create-spdx-2.2.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index f9cb3add387..b8728c5705b 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -714,11 +714,16 @@ def collect_package_providers(d):
     deps.append((d.getVar("PN"), d.getVar("BB_HASHFILENAME")))
 
     for dep_pn, dep_hashfn in deps:
-        recipe_data = oe.packagedata.read_pkgdata(dep_pn, d)
+        localdata = d
+        recipe_data = oe.packagedata.read_pkgdata(dep_pn, localdata)
+        if not recipe_data:
+            localdata = bb.data.createCopy(d)
+            localdata.setVar("PKGDATA_DIR", "${PKGDATA_DIR_SDK}")
+            recipe_data = oe.packagedata.read_pkgdata(dep_pn, localdata)
 
         for pkg in recipe_data.get("PACKAGES", "").split():
 
-            pkg_data = oe.packagedata.read_subpkgdata_dict(pkg, d)
+            pkg_data = oe.packagedata.read_subpkgdata_dict(pkg, localdata)
             rprovides = set(n for n, _ in bb.utils.explode_dep_versions2(pkg_data.get("RPROVIDES", "")).items())
             rprovides.add(pkg)
 
-- 
2.39.2


