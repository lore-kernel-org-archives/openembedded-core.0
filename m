Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A69C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 09:43:16 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.8271.1645695795175180591
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:43:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HFg9zrPo;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id m14so2839996lfu.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eE4k65GzdS3Bh29hEw2JNBKjNozmzAUpffkPY4X7iOc=;
        b=HFg9zrPokSFBhhu4ql4AMi77r9TQycS6IQhdcIRE1oyTvphhx2rjb6kDT094M58Tt6
         mDIt/jsk+4zP9Q0NQG46gL5Glz69ugQF/4J0QSK2f/tHPOGfYq67FzjrdMFzhhSXd7md
         Ag+DdY4kkoI80a9KkzHPng9RMM/sqXsSrTpa+Ha/Cas3mvd+wIx98SHlMhzmsfqkZBpm
         hseOD96JEEhthCpyvAsoomVJs98PIzMe2ezDTL6J8RXln83e5BCdXMQaCVRRL+XHiIcW
         bwSeKqbP6AkgxsHxNtkVhhVoYEOTFk96lqIWA4oTgVVyv1MXkikfeeaNLx70H4YmWkec
         aXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eE4k65GzdS3Bh29hEw2JNBKjNozmzAUpffkPY4X7iOc=;
        b=Ks4VjvEXgUHxFtiAXGHQEbl5t78mKuR9+OIDTHIHhc/nGhiCcy+Sul11Siex1T79kQ
         rUTzth0aKVmLN8yya+HCDI2jGFop3fjoEQiarv3yQqxbzAiioql86L8uRzrbFpLTkYM+
         yq6Io1hvxoCAfumByYlo+psB/3vE7J3+1bPjajPLwxCkBgJUwbWfoPEgtH7kJyG/Kxpn
         QQnkfZBbhgOAem1Nqm6c4sHSTjdUXc79xjynzBLJVabV5UKwMMwlvA4eq005wqowmZRF
         un9E0d44hFbQCaLnCy7aV6NI7h1036xu/EaZG1V5H/8ECIuXZgYybUhlnA1IfSwfFaiG
         AxKQ==
X-Gm-Message-State: AOAM533nkie6pw5EZtwpZjWsLAWFhcclUifRUgS2jswoXurseD1Y5waD
	t1q3uiwj2e+tDwYpsR3eGPf78gbifj3Dkw==
X-Google-Smtp-Source: 
 ABdhPJw6EXWenfVpob+V23FYF/NyUjVzZ3EKZHcypM/pFcXVV/mEGzBPmfro4THqcBW+EWNeGVjOpw==
X-Received: by 2002:ac2:5fb2:0:b0:443:14a8:d89b with SMTP id
 s18-20020ac25fb2000000b0044314a8d89bmr1316353lfe.6.1645695793110;
        Thu, 24 Feb 2022 01:43:13 -0800 (PST)
Received: from peterliu-Precision-7530.lan
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 z5sm163892lfd.244.2022.02.24.01.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 01:43:12 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <ming.liu@toradex.com>
Subject: [OE-core] [PATCH V2 0/1] depmodwrapper-cross: add config directory
 option
Date: Thu, 24 Feb 2022 10:43:07 +0100
Message-Id: <20220224094308.58744-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 09:43:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162306

From: Ming Liu <ming.liu@toradex.com>

Changes in V2:
- Replace hard-coded /etc to ${sysconfdir}

Oleksandr Suvorov (1):
  depmodwrapper-cross: add config directory option

 meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1


