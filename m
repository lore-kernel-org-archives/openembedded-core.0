Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A75CC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:11 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.11412.1634657710841194367
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p+Xpm8es;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id
 z77-20020a1c7e50000000b0030db7b70b6bso3377526wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KGnRq6FJe6qD1hBPpZisiMdxnFvUgUmSo4QF5ULKngs=;
        b=p+Xpm8es425kMmtZkQRK9KdHCP20c6Pkvp3SZOAGYJiaPvkV+t7MP76czSdll48C+L
         8DAswkBP8KQd8gSErFgDwIQnYe8y3TZwjEkJqonh6a9CMYcQnSHzUTdDW6XT9YVSy5uf
         kOYGIgJcZk+h3AbyuAdvCj8qQNyXnfLAr/rvQaMh0NshyUSeEZbqpvwdkttbNnf7eBnE
         Imc+TlSekKqLSlFLWYc4Zca2gRlMevf/O2tm+b3t6+RcuNKwhHinhxWwrxRDiBqNUgkR
         4Cwfqy24fMN/3MhjBHT61De0zpiCQ9HnPkgEURQpssvtVBRowaCFIj4Rt26oKqyTb7TF
         FPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KGnRq6FJe6qD1hBPpZisiMdxnFvUgUmSo4QF5ULKngs=;
        b=rnOjhfuefpCgnyEhAd8IA1wHxCHFfdA2WhIq91JBeXEDyOOuyXsdfBYqfkKgvIKaSg
         2j7Rd7/HyfcAjeZScGfqYkgPHSLTuiodCKsVRbIVetFL9FZj3CoME7uBf5DeVpUGrMSm
         jmHRDHcx2eeIucCIVFnrT8H3a4+gJBItgtkvSIqHrU3VveKnmlzJRxQTS0J//cBscoeG
         qY/lf32CPPoRPsv60/PTDK3itG8u0TBodRA4DbdHOqerP037JY/0W7G/g68XIJDtEtjm
         /xthvYtEWmA7hb3LgS93Yr/Q2AtWWAPut+dgT1/jZ24ExqCa97VMN6ENDhqIfzjYcxZ8
         Q0Kg==
X-Gm-Message-State: AOAM530QNsiio/SepUf1Ws46Cmi1qWAY+7R8nPTjo6gN2bih0bew/Dgn
	bnY0slrxKmBgYMv9rHfGiky9D2T267k=
X-Google-Smtp-Source: 
 ABdhPJxhAV80tT1Q0w0YU7visH6+xMKOP6VFgWhg8jPZWJaRgoZQjRDLAS4h+/QbG2inIEkMGtb36Q==
X-Received: by 2002:a1c:4c17:: with SMTP id z23mr7155448wmf.61.1634657709423;
        Tue, 19 Oct 2021 08:35:09 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:35:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 65/65] systemd: disable seccomp on mips32
Date: Tue, 19 Oct 2021 17:34:19 +0200
Message-Id: <20211019153419.3319802-65-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157184

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/systemd/systemd_249.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.5.bb
index 70f8813895..47d5209f96 100644
--- a/meta/recipes-core/systemd/systemd_249.5.bb
+++ b/meta/recipes-core/systemd/systemd_249.5.bb
@@ -111,6 +111,9 @@ PACKAGECONFIG:remove:libc-musl = " \
     utmp \
 "
 
+# https://github.com/seccomp/libseccomp/issues/347
+PACKAGECONFIG:remove:mips = "seccomp"
+
 CFLAGS:append:libc-musl = " -D__UAPI_DEF_ETHHDR=0 "
 
 # Some of the dependencies are weak-style recommends - if not available at runtime,
-- 
2.20.1


