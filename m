Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DE4C433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 16:37:27 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.101.1665679047053060728
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 09:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lUqrV9+B;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id l4so2287648plb.8
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 09:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MemJ3K4bCmL1aC5Hk11AbAEUwYIt8rWpMr8WzXcSQTg=;
        b=lUqrV9+Bq3sggu1nb3fFCLoH27xCpvkPExdavXA/QQlqwdkbksxeVqcUxFDA9UYFWr
         TXOUfrnSWknKw+t52GcYDYenD+oiRPZjL0dM3L+lspiUbNxcwRMAwnnVOBLvuuuLKubf
         fl6TIaPecpE5s/TgbwVTL/9ATGjqADEg4qCOM78kNW3KQFj7JqSBBo0FfS+uWpm2sG+I
         l9OLNLb9t98whMjf1taIblOhoYexw0OEM04wglg6Vfn7Ngc965rtG+VjzZ9XlqCLeRHx
         YDFhqLvipUGKQbA4Mx8xGlwHQTx4KQ6wpBgRdgrS2OW7YbcBL0UG01bWObSAs6kAPM2O
         slLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MemJ3K4bCmL1aC5Hk11AbAEUwYIt8rWpMr8WzXcSQTg=;
        b=Z8spS+Vr+vZ0OFoSnM8jHFFON4VCosnu/ygRKr7hmbcrxU5CbofPMEQM4KQZC1NNpL
         mTc+DbvvHuXm2opbRGg/eFtlPrWULIks+i2+nwmSy25Pe2ovg2ad1Lilkd1HQZKmjVgU
         9ZlKdI2XpwcCXY+L3QJ8oubCb47FCosuLL/bh1/QYF2Jga3HalwGQgQAegEHmqU47BM0
         W5MpllH75lpwf0yrPNAI2xpzuoeFqa7eeJxifEXkQOFiVv8JutY/NG8qoXTL6JfeSNgP
         WT1J7Jj/z323zfj3IWRLbzTgkwCeXdP++PD/R/E1ccut+PMqIlANEJXH0QiervjY8s8V
         1/3g==
X-Gm-Message-State: ACrzQf31GvmMfxIsjFkWoP+xLNkSP/bSpx9UZgveNEd37oCJICK9N3Gy
	TMUZEaBWpAxzpfNBhAObjtoEyKB5o5ccdr8H
X-Google-Smtp-Source: AMsMyM46DbN9YMa1yvD7Y5mriIPQmdJxbmruDAPI7IU0d4TRLJirJxLI0uYOpEZHe3N5YUoY/AmpKg==
X-Received: by 2002:a17:902:e88b:b0:17f:93a4:e31b with SMTP id w11-20020a170902e88b00b0017f93a4e31bmr585413plg.51.1665679046118;
        Thu, 13 Oct 2022 09:37:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d29-20020a634f1d000000b0043a09d5c32bsm3460615pgb.74.2022.10.13.09.37.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 09:37:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 8/9] qemu: Add PACKAGECONFIG for rbd
Date: Thu, 13 Oct 2022 06:36:55 -1000
Message-Id: <bb32854dbe68335d834aaa80e42d6a524ea4e1b2.1665678874.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665678874.git.steve@sakoman.com>
References: <cover.1665678874.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 16:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171716

Avoid accidentally linking to the rbd library from the host by
adding a PACKAGECONFIG for the option.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index cdd615997f..d85db8f800 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -276,6 +276,7 @@ PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
 PACKAGECONFIG[libnfs] = "--enable-libnfs,--disable-libnfs,libnfs"
 PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
 PACKAGECONFIG[vde] = "--enable-vde,--disable-vde"
+PACKAGECONFIG[rbd] = "--enable-rbd,--disable-rbd"
 
 INSANE_SKIP_${PN} = "arch"
 
-- 
2.25.1


