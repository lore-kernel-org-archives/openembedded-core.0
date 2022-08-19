Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813F9C32774
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:43:55 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.50704.1660877030724476985
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rdDrxi15;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id y4so3049102plb.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=sSZwc3hWfVtZ8TbuHjx2nfWGNNtO1inH26ayZ6yEYzs=;
        b=rdDrxi15+Seeo9tXf14LbbjOP4FCIqmGAW1EKBfny/P37DSVogayFwlaADtQJg+QDA
         NnkFNiN0zYBsvqNxfV3Lx4vdjsxxfaBruG18jVfVHyFo3mzUk45uW9YD9H6UPZcaafLU
         JqJSkFNokFMgl8CADgigUsfSI698jkhSut51BAoXrKi8LN4doZg0UKHwZ+aCvF7aoGKZ
         W2R2rC9Uu1cbk9i2eRfgmqCqUyKo56qL2H3innJQDo5R6fDG5kyoRbY13CwxyiR5Fh3N
         5/lqLjOCXFz2pkkTK1vHiQTnH+GtkVuEKT4iOt29GMMiWh+Al+zLlaJbfvbeXiylFvhl
         BftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=sSZwc3hWfVtZ8TbuHjx2nfWGNNtO1inH26ayZ6yEYzs=;
        b=BSZf+MjWylMkkS9zPXClyl4JwoLrnEqis19lAwhQ6q/bz9i18SPorQvbZx169oZQ9F
         C7dRGT2WSmGojVxNisSC/wq2jQUdAPdgXd5U+omGL2fhCLARzKmHA2HweAnHaa9qp2WC
         RDC5+tH38HS8eJmAsyFL21zhAvTzhHHX4Lf5KH3SgwPQ5KAr0435FgFKC20LAVMjI7PJ
         SnSUaZLoqg2l5TxstBo9Dk4M/lkM0DXHfQlrwfn0dCDgIozEzktH7mwJ1RMjdBCL2pdh
         KnLBJOdvvcyC4OXFySnE+lclSmAd79Ss2tnTbLheJKsCwd4f0lfk657Ue7PoZ0bBuHpF
         VZ4g==
X-Gm-Message-State: ACgBeo2y0Y8zt8mIovctCP/92WdSskBJ3Q7e3q73EKHc2QRNFKgBqBXH
	Dj2c1TV3y8YnK3pz0f7hHl9l81TPAY/gYovt
X-Google-Smtp-Source: 
 AA6agR4zvN4d2/nDF6IwRrYhpQnWlzMclJ9WQeHRb41wf3X1CpiDqzEach8qlS6Rho4WGCAzYQLY/A==
X-Received: by 2002:a17:902:dac7:b0:16e:fc21:4e17 with SMTP id
 q7-20020a170902dac700b0016efc214e17mr5073405plx.168.1660877029803;
        Thu, 18 Aug 2022 19:43:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/26] scripts/oe-setup-builddir: make it known
 where configurations come from
Date: Thu, 18 Aug 2022 16:42:42 -1000
Message-Id: 
 <b60f4c7f3205b354469c1aa8b56ceaacc11d486b.1660876844.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 02:43:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169563

From: Alexander Kanavin <alex.kanavin@gmail.com>

"with some default values" isn't clear; if the user wants to change or
inspect the default values and their history, we should help them find
where they are. This becomes especially important when using template
configs other than poky's.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit ec34783ffc34eb9e9697f1b192c5a0043f1ca2c6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/oe-setup-builddir | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 54048e62ec..5d644168cb 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -74,9 +74,10 @@ fi
 if [ ! -r "$BUILDDIR/conf/local.conf" ]; then
     cat <<EOM
 You had no conf/local.conf file. This configuration file has therefore been
-created for you with some default values. You may wish to edit it to, for
-example, select a different MACHINE (target hardware). See conf/local.conf
-for more information as common configuration options are commented.
+created for you from $OECORELOCALCONF
+You may wish to edit it to, for example, select a different MACHINE (target
+hardware). See conf/local.conf for more information as common configuration
+options are commented.
 
 EOM
     cp -f "$OECORELOCALCONF" "$BUILDDIR/conf/local.conf"
@@ -89,8 +90,9 @@ fi
 if [ ! -r "$BUILDDIR/conf/bblayers.conf" ]; then
     cat <<EOM
 You had no conf/bblayers.conf file. This configuration file has therefore been
-created for you with some default values. To add additional metadata layers
-into your configuration please add entries to conf/bblayers.conf.
+created for you from $OECORELAYERCONF
+To add additional metadata layers into your configuration please add entries
+to conf/bblayers.conf.
 
 EOM
 
-- 
2.25.1


