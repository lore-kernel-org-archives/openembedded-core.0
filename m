Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515B5C7EE23
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 14:44:19 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.1656.1683038649363327843
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 07:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BTKOrBrb;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1aaec6f189cso19864795ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 07:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683038648; x=1685630648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1CpMGSXryOd2vmEKc1ljM5QeiDvALO0qNm26xyveDFM=;
        b=BTKOrBrbqQfvxIxo3YnsuSIjIMuNEpM3yROrEGPjuQZXs+ZofCz2hz2wpd2bXFUIz+
         /uYrPapb14lv7nXOI8a0jtUQE0lZyF+xN7aXUqnFCExSX7s4+xfoJMlXMZJ7IAJJxm9Q
         PnHz3rxAOpQXyWiKXNFX8o2uONt5hkqJph+V5wLreuxnyaDlMIKx6ofi0dpOdIyMzMqy
         Nzo8ZUIjTYNw+lMlZlFf+eLmo69U9R4Mhz+cGvCk4rSZg0uGaPP3ywCcNOQsAE33c2d1
         agHk/0X/FfZTJGmg9pKgP6MiD89OkAczAkc6VRxbBdoDaZls8BIJmpPOBVo6nE/yLz/H
         iKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683038648; x=1685630648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CpMGSXryOd2vmEKc1ljM5QeiDvALO0qNm26xyveDFM=;
        b=dvaCL7DDBZVPtsagxFT0YjRve3Pv254wdxCKRZN9JRf3QWQgysBy5MbGH+5Y244fqM
         elrdXXrFju61IObS/95P65fvLZmSb3ZfkdcGGOPuKsQgnY6bYcZzICowEttS0hNmUY2y
         WA9YreV+9aPKbnz/Y7l7e4FkPdm73N6A6MfD6dBnnj0y/AZQrswYGnNV4lBe+mCeupXL
         iqf06e5Z5iWTZaFH5fvatdYQPp0/8or4Y73MdC6w9qRQn8KSkD2NJO/KgBAKRnxROFbY
         bseOj2kN3erZ5DDhjwQPkfsPs1ONteZzH/g5O7DPFCCTXTAuwmc+y0wKNmzMyCe7ZrKF
         w60g==
X-Gm-Message-State: AC+VfDwrqZarTDYrjCOPFwyvZOkeRz6s/tyF+JxcqoTsA7//JAV6l0FT
	r8WyturVt2oDrHVuDnclaAiZmSpzP/yZ2Q==
X-Google-Smtp-Source: ACHHUZ4d0JFDORJN373oAk37cXimn21Q9LI9zBOODjtCe0Ae3DEWvAKHsnz0Ug6PagluJyFf8SqTgQ==
X-Received: by 2002:a17:903:287:b0:1a0:4913:61f3 with SMTP id j7-20020a170903028700b001a0491361f3mr20070179plr.37.1683038648434;
        Tue, 02 May 2023 07:44:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id x12-20020a1709027c0c00b001a52e3e3745sm19785364pll.296.2023.05.02.07.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 07:44:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] musl: Update to latest master
Date: Tue,  2 May 2023 07:44:04 -0700
Message-Id: <20230502144406.2849858-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 14:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180737

Brings the following changes

* b928c723 fix return value of wmemcmp for extreme wchar_t values
* 4724793f fix wide printf numbered argument buffer overflow
* c1b42c4a wait4: fix missing rusage on x32 due to wrong success condition
* 9b12982d semtimedop: fix timespec kernel ABI mismatch for 32-bit timeouts on x32
* 6d322159 getopt: fix null pointer arithmetic ub
* 35e98311 nftw: fix use of uninitialized struct stat
* 7c410472 fix inadvertently static local var in dynlink get_lfs64
* 77327ed0 dns: check length field in tcp response message

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 531f337e82..036ac948b2 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "1d5750b95c06913a1f18a995481276d698d20fae"
+SRCREV = "b928c7234f62c35a9b4927586ff4c3cbf6e513b5"
 
 BASEVER = "1.2.3"
 
-- 
2.40.1


