Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EB7C6FA89
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:21:15 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.8305.1662560464956453561
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Ye6KnURW;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so11031121pjl.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=kf3S3MC+IU4IcSNosaOc15KjoVwosxzA5sUbpIEY7uY=;
        b=Ye6KnURW/k1VQnzJg2B/QJGxpUi4MfPQX7grni9Fa4yHGjkeu/sKyERWoMD4irViiP
         LYKcOynZuoq/IG5cn4sApy6CabyFq56S0FsFKrcoqX9qJMOpX8JJIWrQCXnwJAB7DGgH
         THqRKDCLekCIw1TJXOdOfhA3/HIg+D08dud3FeAsMoPbl+qKb0/63JjmCJCa1wfopi3t
         M/QCMDD/oZyWgzUBOzXOlOWXvIqCNX4eF+w+1JYLj6X39oU6vmNvU00a+uMNUnqcc1G3
         RG+De5TCcftt1+m8bnA7qoZEso36skpON+AAp9Pz4+Vv0QWTgZikYJQvWs73+5YxFbPF
         ERpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kf3S3MC+IU4IcSNosaOc15KjoVwosxzA5sUbpIEY7uY=;
        b=yDNLSmm+Tv2ah/XtXaDyba/jFuJMoDYwtEDrNZiXdDdXJOsouJ9IzQe/abYE8vpDVp
         m2+eCnzOkMMnibbxHM7GH04s2qXJ0Ul5GmTm8sTVT94nNSSjxCMmNDIoOWWw+oa+18f1
         RVCmeawEECP/hh8J4bAQ1nIbThfAniG1uosWbzCs+FAytF/8rAEovPuC+tyZKE8QE/sE
         WUlUR2Z2Yh/NaZ+Q6ih6Ureu5vZZhXRnHFZrEq5z4ifYAjfGD2C1+vTncB1M/l6Pvbjh
         egJ0ihnQKSc28cgQ6SYH4Pgb7mMc/l8WhUE+E3jibyhtFmmyNWYKDNpcRLtiRVOrt6bI
         7ecw==
X-Gm-Message-State: ACgBeo1PrJwhZkREZ39mcCK1TEgsoFu0yjyaPNhhO38og5yddcb3ufdA
	WFJtYtZrdwWy4mIVqfZOxf/nSrkBY3gclu3y
X-Google-Smtp-Source: 
 AA6agR7dQuDaWoT08q4ns7OvnGclnMtaqRw0r6KvInLlFBIL1gfrRZh0QXtNkNNUnitoSHf/GQ0bUw==
X-Received: by 2002:a17:902:694a:b0:172:bd15:3ece with SMTP id
 k10-20020a170902694a00b00172bd153ecemr4114159plt.116.1662560463987;
        Wed, 07 Sep 2022 07:21:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.21.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:21:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/24] insane.bbclass: Skip patches not in
 oe-core by full path
Date: Wed,  7 Sep 2022 04:20:13 -1000
Message-Id: 
 <f29dd96233bf9c323ab1b3887d2357f3c7312f94.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:21:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170407

From: Yang Xu <yang.xu@mediatek.com>

The full path of patch may contain '/meta/' but not in oe-core, skip
patches by checking it starts with oe-core full path or not.

Signed-off-by: Yang Xu <yang.xu@mediatek.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d8a525afdfb5d371e76b09301c8b2741d23d1d10)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/insane.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f3f80334f6..0d93d50e58 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1196,11 +1196,12 @@ python do_qa_patch() {
     import re
     from oe import patch
 
+    coremeta_path = os.path.join(d.getVar('COREBASE'), 'meta', '')
     for url in patch.src_patches(d):
        (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
 
        # skip patches not in oe-core
-       if '/meta/' not in fullpath:
+       if not os.path.abspath(fullpath).startswith(coremeta_path):
            continue
 
        kinda_status_re = re.compile(r"^.*upstream.*status.*$", re.IGNORECASE | re.MULTILINE)
-- 
2.25.1


