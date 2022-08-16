Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF2DC32773
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 20:58:00 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.20999.1660683472567690759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JoryBqJC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id e27so9295010wra.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=fiInH00GK9jkpm8Cx0VetHpuRkJgFr2ZgLQeb0pDF78=;
        b=JoryBqJCnvbbw4+yGyWb+AStskpEzxDNPZeXNjrat2tx5l/xCrSxiAjDD7UhAkSVXU
         rEBoHOGT6oakdo1S+5xNPrmdLo0UWoEcF0kP0GZwEGRw0B8aRWbW+JLYG++xjFijoqa8
         FZoq3EFBkOtOPc4SkSZe7uX2lEz083o01IO6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=fiInH00GK9jkpm8Cx0VetHpuRkJgFr2ZgLQeb0pDF78=;
        b=vAq7dWZgzhPeGkuywIHlLSr0LlihZkf4GfiO9ijMORmEM+EwnpestKHUvBNlCvLYUr
         8kcx1av0EOLCb75kG9IRyuSe5loZeGH0hQ/yCRPlF0NWPxFPzQ7+YwlTmGSouOaEI2pR
         ZLiI9RzjBvrv1A6ITtnESM4VNDG2gzZHvyPy+UfJA9V/YCee+fPHfSKSCncG/aEwRDKc
         B9c0FHnvMRu2NRHYcrrpVj4KZkXxslWW8/BkQzfWRqLykVzZXl5rSwgn99o9idvFLVi9
         iOhiwSF2Up068dC+6hBPjgiv1PQ4sy4vPFyjSNNnSOP/0Ko5W1NQSrKBNx7C+ns9IOPx
         oNoA==
X-Gm-Message-State: ACgBeo0lPJALBG7We/SNPQJuIcFMrjb6KHkgNKKSAPEkDaLYemg9g1th
	GV7GVf+JiSQIRmuJgQGBdhKVUGT+Ddm3sA==
X-Google-Smtp-Source: 
 AA6agR7x67cXZ9J67E4asUZmD7i6+17MgGd3i2FuVONAR/d9ao8tv9rAn2tCTNoJeonAQeX9JS3rWw==
X-Received: by 2002:a05:6000:9:b0:225:17e1:788d with SMTP id
 h9-20020a056000000900b0022517e1788dmr2371292wrx.156.1660683470805;
        Tue, 16 Aug 2022 13:57:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3694:2ef4:2932:37d5])
        by smtp.gmail.com with ESMTPSA id
 m18-20020adffa12000000b002250f9abdefsm5349460wrr.117.2022.08.16.13.57.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:57:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] gcc-cross: Fix relative links
Date: Tue, 16 Aug 2022 21:57:43 +0100
Message-Id: <20220816205746.1672987-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816205746.1672987-1-richard.purdie@linuxfoundation.org>
References: <20220816205746.1672987-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 20:58:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169459

Now that we're using absolute paths to run configure, there are absolute
path symlinks within gcc's output. Use our script that fixes these so
that the sstate objects work correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-cross.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 3ffa1f0c460..a540fb2434a 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -149,6 +149,7 @@ do_gcc_stash_builddir () {
 	# Makefile does move-if-change which can end up with 'timestamp' as file contents so break links to those files
 	rm $dest/gcc/include/*.h
 	cp gcc/include/*.h $dest/gcc/include/
+	sysroot-relativelinks.py $dest
 }
 addtask do_gcc_stash_builddir after do_compile before do_install
 SSTATETASKS += "do_gcc_stash_builddir"
-- 
2.34.1


