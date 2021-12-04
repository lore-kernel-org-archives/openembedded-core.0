Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DF7C4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:33 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.22420.1638602011690637712
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R4MMl9/x;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id j3so10602130wrp.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GGvVhjtOppa3Uvx2OzYVWbu9TnreATVduYXmpN5BXAU=;
        b=R4MMl9/xJR17PBSJlg119dBZo7RRQW81lPx7ZxamLY+qo7N3juBqukW9stoSEoMBDX
         2OP/bvWQYLkId+abs7kHqxNb1YP3usYo7gqaC5viqAMo0Fdvu3IuitY3trSpUvtht+I7
         pEZu6iChwDzSZyf1hxD1AKYy8MEGHtWLXbr0FGD+4wdR2rrc515k4Z7Zy5pRDcNy4x56
         pUElvFdfEiN8R15UMaFLkl+YVscqR50XMfTZrxMjzDX+nKqcGHzZlj8jKINQkH/3iLpm
         pk+5/wYazgTtaub4DJ/fcLTcSINrzX3lhHAqI5LykaB5kWt0qNJGx1A9iQSNVKTOaL36
         zw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GGvVhjtOppa3Uvx2OzYVWbu9TnreATVduYXmpN5BXAU=;
        b=T2quOnU+ROE1VhO8XqcaDLjYfUS97MS8h5RLJPW9Fo3Z+v283DA6D0hAt3jQVD+vCu
         4odK7/TERWDjTFea27meJgAU/WeBECQ3sd4fMIdRFR7xIt4IOAj+KINhSLDeAEnXttxT
         DRJg6lRVZaMui/nRSUFdfYAizDI6c2wRkaOsH7UKsRgzbDi1itiJvymTGFDiusGWPMNH
         QTsjPggByKyq9DHqC4QRPjVqY5dg7PoxsH3mtCM7VoMw4ZWu8i78NgS3vVScxp1mfUZ/
         JvlOpDcvoi0FS7fcWks3icUWIfvX/4t4kDNv3HT0npEZtiubfcaQw0URrT0Ty2+ss5ZX
         5cYw==
X-Gm-Message-State: AOAM533siabHvljALdlavCr69UfqW1XxTL8ONItP5Gh/ee38i0um5h/P
	taMx6q4jv49B9N9Dnrso9MzPCthzwpioIg==
X-Google-Smtp-Source: 
 ABdhPJzjgFCgpnDqc6pbdijzGAJr2QnYYPJYzCJBnEiplOu7+4P/RZZM/FnzF1cEfZnOI6TvPA6/bg==
X-Received: by 2002:a5d:64a2:: with SMTP id m2mr27872079wrp.248.1638602010340;
        Fri, 03 Dec 2021 23:13:30 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/26] perlcross: do not copy ${S}/patches into sysroot
Date: Sat,  4 Dec 2021 08:13:01 +0100
Message-Id: <20211204071323.2480163-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159151

That is not actually a part of the source tree, and will
clash with perl's own ${S}/patches.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
index 2759ef8a53..b8e1f846d7 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
@@ -34,6 +34,7 @@ do_compile () {
 do_install:class-native() {
     mkdir -p ${D}/${datadir}/perl-cross/
     cp -rf ${S}/* ${D}/${datadir}/perl-cross/
+    rm -rf ${D}/${datadir}/perl-cross/patches/
 }
 
 BBCLASSEXTEND = "native"
-- 
2.20.1


