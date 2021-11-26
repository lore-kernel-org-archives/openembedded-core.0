Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A41C433EF
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:29 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web12.20168.1637901388111266557
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VYwXuAk9;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id s137so7063357pgs.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=alUFk4ZSzmS2nR1AviJzq5l4+3YqgcbpjNgKZQJJ2J0=;
        b=VYwXuAk934C5Jqycq7mag48hJIEBvvnBqnX1Lvd+CorQlPcudldPtN0v16tw1/Zhad
         RS3F4+Zvq3uXUOOO0OJhUVa5xBLzqLDOFiuHu6rJ6LKLGyWl8TOHipB3WCdbeYIZvXzQ
         eNFe7T43PacK1CWR9e+EuQQAhuiZfk3hD3oNPwfoTEISqizA5lzKc3SVfJvuBLQ3PJiH
         PgNuJDRzcQ/tOkFDgVMh/s2cl8E5FWyC0pc+afWrPE0TEhCA9KGZ8aCvmE71JFiSEXkz
         PptlXD66EUdXcRBCz7vNAp9wIWpYbiCSLvvuSCcK3rBeL/xh80Co3Y6J7hyPbC/LKvJ+
         fysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=alUFk4ZSzmS2nR1AviJzq5l4+3YqgcbpjNgKZQJJ2J0=;
        b=Euh95lypGi78njIWPn6Z04A+/WYe5ifI112CB2s4LSXv64i8z/j5KAp1vYvBnmTkJ2
         tcz73CfMaZ/1zxbSSh8gsB3SniNS4bbhgOauS3ca+c4cH0Tfv8OAVr3/YpE+nGB8gDCz
         OGW0ZuTU8z4p96k8fqng/KmMstsFwHwBykmHtbG2YTyH6dWzVppuM0V7mgtpIl5eLuBX
         4T7b2T1mfcHNfpynzLbxgaGGWQRP10CpTnKio7bIbYVMSsi1d9WpR8EOTSE+rboE6KyX
         ehwYS/aQbdg3dThw1LGisKUm2KaTrl6wL54A5HfjGV7i09/PexAO69d5EUHAQOVeSVXk
         OW7g==
X-Gm-Message-State: AOAM532n80Jmo4I4c9OBRPRwTO7z2Grtm0j7g8BPsR4MeGYVf+9eq1Wz
	PGnigY5YHqIjOcg2vzhvd+NAJTx4nA8=
X-Google-Smtp-Source: 
 ABdhPJxzKghFUqMCKujGWbT/qNH5T1/vfCOTaZvSmREjxf9XQej03BksgbKiKufHrNbuAT6E8HH7BA==
X-Received: by 2002:a05:6a00:1348:b0:481:179c:ce9b with SMTP id
 k8-20020a056a00134800b00481179cce9bmr18471850pfu.27.1637901387406;
        Thu, 25 Nov 2021 20:36:27 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:26 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 15/26] python3-pygobject: setuptools instead of distutils
Date: Thu, 25 Nov 2021 20:35:54 -0800
Message-Id: 
 <e32138ebaad13e4c75a08ae8fe00a6c4e99e7df9.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158811

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-devtools/python/python3-pygobject_3.42.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
index b07969c5efb..74318337bad 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 GNOMEBASEBUILDCLASS = "meson"
 GIR_MESON_OPTION = ""
 
-inherit gnomebase distutils3-base gobject-introspection upstream-version-is-even
+inherit gnomebase setuptools3-base gobject-introspection upstream-version-is-even
 
 DEPENDS += "python3 glib-2.0"
 
-- 
2.30.2


