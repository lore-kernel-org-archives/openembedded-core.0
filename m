Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4328C54E60
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 00:21:26 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.8883.1710462077556988028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 17:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=TkXwRsG5;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33e8f906f3dso1315469f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 17:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1710462075; x=1711066875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s3311SZaw18FEPOuwX2exowB+FJOnGng/T1RCU2fPZY=;
        b=TkXwRsG5zGjRdKvyVgVjPqqi3/aCsJ55BAJy/Pj3TiOGIN0I2hTxC/sM6gVUrrHmm1
         +vbIH0dzyxVWXgRZNtFRlMaLJqTniJRJppG8EZrxSXLSDUchB62UpQ6AWgv+gjw6RNSe
         8PeqdUjj7xY0oKBlwguSV/IBby4MmgmJSKCyPngKqDcNLpRXbro4qOUYB1bxQeNJmbs1
         dOacPqyCaJBgExEIGrQnzSTyHI9wxvA4v9UVYRKvOKiXjNWZYiF0AklNqrrzp2t1vmla
         Iyh4DQQkrg5QEg556EJlqYZYRhdbTcztpJ2yt72pGwoPrJAogvLo+f4kH1sQ6FD+a8we
         uvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710462075; x=1711066875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3311SZaw18FEPOuwX2exowB+FJOnGng/T1RCU2fPZY=;
        b=gGhzWfc+E/DuhW+7wpLaJPkIyVue/e2HNYUOuBjqwIBKzI7Mx+RhNbNqUXA0TjB7sP
         zx6gw2us1s5tZGZo63Q+OyKn8Z/uiY2f08Gnoy/Wm3hcySfsI11ITl4oiEF8frrAcc2V
         pYzYb94pGwG2JPh8z0wXHWibt12TpZa44+Eia31bJ/3cUnG0qQBs0xcxjFcI/SI3IwSq
         Omzcrjdz1ersVZAFbW+mCSfqM86Ny27qKG+IJXeOHhe3sgiwzoQ3te/Z2elVD/aQ5Pp9
         DtNYOoQVOeoiLrjhyA2GPk4kG3CpzxyuxF4Wm8Xtb3a9RC79Us5vLg+QnVONUIGwPrr+
         Lqnw==
X-Gm-Message-State: AOJu0YxSUjSw4Y8w/0FYe25dahYijCUs+jIj2v3k0wM66qwqjXEJ1NEf
	T7EJkWlvNkfv8cLr7ZlhIoSwaqiIttbgvQjtsIsPOoBwo2Fc2PohtyO3at3b0K8YebiwKk5uzlx
	UxgI=
X-Google-Smtp-Source: AGHT+IGfyAFQpKD2u/v5PhR5Jn19pbt6Hyc+5OGerKTr0lD4Iyi4LxsUuiVooGg0FdIFTMvNKzSCtw==
X-Received: by 2002:a5d:6751:0:b0:33e:78f3:bf76 with SMTP id l17-20020a5d6751000000b0033e78f3bf76mr1147423wrw.40.1710462075306;
        Thu, 14 Mar 2024 17:21:15 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id bs17-20020a056000071100b0033d9f0dcb35sm1868053wrb.87.2024.03.14.17.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 17:21:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 0/4] Fixes around CVE incremental update
Date: Fri, 15 Mar 2024 01:20:16 +0100
Message-Id: <20240315002020.2194310-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 00:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197117

This series should improve the incremental CVE updates (versus
full-download from scratch) and, hopefully, remove the difference
between the updated database and the "from-scratch" one.

I've tested it by comparing a full download from scratch versus a full
download on a preexisting database: no diff on the SQL dump.

Patches 1&2/4 are code cleanups
Fixes are in 3&4/4

Yoann Congal (4):
  cve-update-nvd2-native: Remove duplicated CVE_CHECK_DB_FILE definition
  cve-update-nvd2-native: nvd_request_next: Improve comment
  cve-update-nvd2-native: Fix CVE configuration update
  cve-update-nvd2-native: Remove rejected CVE from database

 meta/recipes-core/meta/cve-update-nvd2-native.bb | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

-- 
2.39.2


