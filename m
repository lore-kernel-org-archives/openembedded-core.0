Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A890C43219
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:30 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.2226.1643826509399264104
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VsdDEsXB;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id w14so367413edd.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GN/ocqDk4xj65xoOfk9N3YYL0jheOGkWGSJYDduRNF4=;
        b=VsdDEsXBmjd3taIzbMI+5Xkj2Io3WwwZyiWi+RWkacmE8zFm44C/6ZBq38ID6LKtTF
         oLvpXu9gdvUdGlXU9YRp9Kd2jDNGqzsbA1kvjOU1Zy+qcf5dSwmTnEgb8ErvIGCTW3zc
         7VLF9ZW55HFy+j6GUZN1K59B3F01hKUAnSB+bpumre/D34+kKjW2ND5Ue7pxFFejpAe+
         O2rr36n9D8CKZJf6F6wPVm537p2zAzm2zGc4rf4IlHOgKmXyyM6ltbMmu2czLkPi9+df
         1pM2VfTXyc4He/lI+W1z/e4HWq80Vtnwz2u3qnq43cBDttiX/pWTzmIMsmgY7JmlijJG
         mMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GN/ocqDk4xj65xoOfk9N3YYL0jheOGkWGSJYDduRNF4=;
        b=j8gIjQ+JChFv1tbxYqcXxJiakhDR2iL/Ab1TJplDsIf2tNXxV/fDazA8GTFEjbVrXa
         CTC/3smW6LUf5Y4fSmfautD0q4Z1gtw7a7CltkAEniFjprXHnIYziXtRmX4apqlb4Csy
         7MDLmqOqWeRrP2e3jGe3s7Jl6gg8ITIk++GQPQbv9Xa1/NaP+roJMhL31mqGyIX8HjG4
         cY4LvMbLD0CnKhzxU1WnjvhR7S9R/ByuOzdeDlzUt8zMk3sRGmgrlHwCSTdVPbJSeCaR
         pQIfapFDnogbxi2sOmJGhUIHxSfVXVrtWtgfGDSTLekF7fAtCvLAZjCDAkcwnTJAKp6+
         86aw==
X-Gm-Message-State: AOAM531W4J1tesSD3BvVHeoVAIUofnkG1lurvpvSKSeGoP34JAtn+oSv
	ONy8thp3G6aXLgnqjd2cfbH6KAleQt8=
X-Google-Smtp-Source: 
 ABdhPJyLBhQRv36YTloXpTQUkad5ZeyZ2qzP16hKub19HHICQ2+mrXanjYe82BR/UClLw8iTWrmK8A==
X-Received: by 2002:a05:6402:1caf:: with SMTP id
 cz15mr31310450edb.61.1643826507992;
        Wed, 02 Feb 2022 10:28:27 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 29/33] puzzles: upgrade to latest revision
Date: Wed,  2 Feb 2022 19:27:54 +0100
Message-Id: <20220202182758.919991-29-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161254

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 0bf878fc96..381d3cc456 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "229d062d6ce63f0a5e00d2de62ee0fb389ccfdb6"
+SRCREV = "c43a34fbfe430d235bafc379595761880a19ed9f"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.20.1


