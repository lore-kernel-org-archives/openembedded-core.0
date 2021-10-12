Return-Path: <henry.kleynhans@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C485C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 08:56:30 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.11055.1634028988811601744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 01:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p7EnpmUp;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: henry.kleynhans@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id e12so64634456wra.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 01:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oztXraDIRJrtVx5oG8+5JmKr9JTGnKZbIpw6vumcKN8=;
        b=p7EnpmUp7+9hX2cuqwI87h4QrpRgMKya3DDDQMXlc/W7lbD2uVJM6gQiA1C4wQqMAC
         iEBD70URp75aUnjCWiahMZX83RYkUS5P9S227nzQ2Rxsx99DhIl4+ok8ZJVhZC/8ELKz
         S+Tl+UwChaKs+9mCyV/zr8vc4eVIwNufM1pRisMa6EI5BabR04t35HO4xy98xkjDEJJM
         shN/Zl74Df3Hk/uKQtAoDzSDdvvSpwoMy6rHNtXi6//3bP5oLWt7+bf7wRbOp0/SoKV1
         TrnvzODcbI2AtuQq26BdK4uGgjcdcUrn2S67b6TfNQYXZ8vxpSCSrEViB6Meq9EJMFIh
         hFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oztXraDIRJrtVx5oG8+5JmKr9JTGnKZbIpw6vumcKN8=;
        b=aVWKtDkbtdaqQdjGjVrQP4BYE/6OUXIxIQwEUSViBJhmkhZCTm7HG+baHJSUQAF+6f
         EILmkSIoUlpO/lo/s6QsT5sdxoW7ufNQPN8bQg7HKH3IkhrRVJjlR5TLNSIrm44aAK8M
         kSRODcDXzWB2zGlsJAuaWWIHFCtIzcX+2VOy4Tm1R02kUAMrrBMducqIgjzQ7z+MnslI
         +0aR5ScQ8OI64odBOpDYyJF5RWobMFNFlMeJYAihx1Tnw58/6f7FZYP7L9iBlxiKeTh7
         Z8PayKRnWySTQAOqUzvVTtP+1HzOrUC1mkTR/F7xzmaM59/dbuHS+TXT2MjsLrxu+xci
         s2Fw==
X-Gm-Message-State: AOAM5300YmyuFkcqkh5Ndf+JmTA3trhKcTH+mqhigKUBd6oEwIlyR6xl
	3Y7k4bX9RK5upBNcSRzDbCEDKz+irXdblpKo
X-Google-Smtp-Source: 
 ABdhPJzCnmbKUCAB2bQ6YOdshbCd/AzCmdGwFcpSrH7hhPEJ+FwcoMT0dCZV/BMwgWrJDplOI6aluA==
X-Received: by 2002:adf:b1c4:: with SMTP id r4mr30515352wra.428.1634028986840;
        Tue, 12 Oct 2021 01:56:26 -0700 (PDT)
Received: from localhost ([2620:10d:c092:400::4:e9f3])
        by smtp.gmail.com with ESMTPSA id
 o6sm13617490wri.49.2021.10.12.01.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 01:56:26 -0700 (PDT)
From: henry.kleynhans@gmail.com
X-Google-Original-From: hkleynhans@fb.com
To: openembedded-core@lists.openembedded.org
Cc: hkleynhans@fb.com,
	rmikey@fb.com
Subject: [PATCH][V3] sstate: Switch to Zstandard compressor 
Date: Tue, 12 Oct 2021 09:56:15 +0100
Message-Id: <20211012085616.112692-1-hkleynhans@fb.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 08:56:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156860



This patch changes the compressor used for sstate-cache archives from
Gzip to Zstandard.

 meta/classes/sstate.bbclass                 | 29 +++++++++++++++++++----------
 meta/lib/oeqa/selftest/cases/signing.py     |  8 ++++----
 meta/lib/oeqa/selftest/cases/sstatetests.py | 24 ++++++++++++------------
 scripts/sstate-cache-management.sh          | 40 ++++++++++++++++++++--------------------
 4 files changed, 55 insertions(+), 46 deletions(-)

Changes since V2:
* Use a weak default for the Zstd compression level to allow local defaults

Changes since V1:
* Fix sstatetests.SStateTests expecting '.tgz' archive extension
* Fix signing.Signing tests expecting '.tgz' archive extension


