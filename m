Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FF3CCA47F
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 13:38:05 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.55900.1656423479227281006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 06:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Do++oNN2;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id pk21so25881272ejb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 06:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=onYm8v0+JzGoWire1TWIoYdmXxEA7jHyJ/5QF84TbC8=;
        b=Do++oNN20F8++8SKNo4jZsz8LPVB2FUPpi59PrGGqMx5TNxKcvBjnE8Im8F8k279qM
         gREG3g3NGJs4CNbPyg1if0Rng2qPz7x1j+lKw2RbATPC3drB/H+Kwj/8cM3iF68ImnBl
         Pq8U34gI1bFEmwb3CpZYzUTnmyLnosXJhpSfz6nVx566ypfrn4npLgIxENd2WfKzo35n
         IYBlgODlXy/Pue50qPBCDqkz8UDASYg85Cgkb1eC1a92QyQ+q75mQsg7kkmlgG1I7Xv2
         FAyGwTE/PsFMpsDIYlqR/RkCYgGaZLDCh/XlqqqI9t4beOtSvboIQYgQ3bbATNF3HpnY
         xzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=onYm8v0+JzGoWire1TWIoYdmXxEA7jHyJ/5QF84TbC8=;
        b=xUDpbhbjRevCRiJhnMUlRjF5WcHtKVsLFW7wftBKaov/ee0wS1PYHvM3jCIvDMmyR5
         l+Ptfg6vOW52l13KEUpLkejvtbpakmFu71DeZ7+kFMP3fJWQB5Sv2A9lyqLMW9A2nGcT
         ZY4ptOQvCXSROMY6lzj51c4FjmnOhDbzS7hWMGJFmR31VzMSv0ZwF8Hfh36s8D5Mpcev
         PdCrRD2u5bXZLDmoofO1F7teXs1EqhyK9Qo8Mwzpq44XCjdBuEy34qVMCbbS7uoYwtms
         3uIEg9xr79dTMWliMQGf/4dlIuhhshxJ193zq3FwchFTV3bxMwmV/wXXgCbNSPYwURhz
         useQ==
X-Gm-Message-State: AJIora9llndFwl3gIb/I7Ql29VPVNYjzlSzrSAbIuhs25pwV0T3P+557
	Gey1LCeF54JZilUPZvYlAJFsfsNMVQQ=
X-Google-Smtp-Source: 
 AGRyM1tF5X7QpYuxBSPkhn7FYYjvY64f/sxKC2Ojya5fcsdGbSIcFngq4sBPYQVP+EJPq+bYatZJEg==
X-Received: by 2002:a17:906:11d:b0:712:abf:3210 with SMTP id
 29-20020a170906011d00b007120abf3210mr17934703eje.292.1656423477428;
        Tue, 28 Jun 2022 06:37:57 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-162.retail.telecomitalia.it. [82.60.178.162])
        by smtp.gmail.com with ESMTPSA id
 i13-20020a170906444d00b00722eeb368cesm6451853ejp.64.2022.06.28.06.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 06:37:57 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [master][kirkstone][PATCH 3/5] lib/oe/utils: create
 get_current_recipe_layer function
Date: Tue, 28 Jun 2022 15:37:11 +0200
Message-Id: <20220628133713.3390786-3-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628133713.3390786-1-davide.gardenal@huawei.com>
References: <20220628133713.3390786-1-davide.gardenal@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 13:38:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167341

get_current_recipe_layer returns the recipe layer given its
file path.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta/lib/oe/utils.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 46fc76c261..4e17b1b40e 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -584,3 +584,11 @@ def directory_size(root, blocksize=4096):
         total += sum(roundup(getsize(os.path.join(root, name))) for name in files)
         total += roundup(getsize(root))
     return total
+
+def get_current_recipe_layer(d):
+    """
+    Extract the recipe layer from it's path.
+    Returns the layer name.
+    """
+    fdir_name  = d.getVar("FILE_DIRNAME")
+    return fdir_name.split("/")[-3]
-- 
2.34.1


