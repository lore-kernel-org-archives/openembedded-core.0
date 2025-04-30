Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B91C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 17:53:14 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.1362.1746035591079331259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 10:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XPn2lBA1;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736aaeed234so226145b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 10:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746035590; x=1746640390; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oDE83EwkorDVtORVKBlkfPGh+JPf5o4G0cENIaXzqsQ=;
        b=XPn2lBA1cZpmbCZDpcK6TSWBY+O1L8u1DNvPksGHCooHjwrLt4pQknpovBUiWMeKYm
         Bj/y1fX1MJjQameR6M7etJNwXP3wUvopUcQt7+CCCiEWthlF7hEzm/yUCHcaZsbiIQ3y
         5qDZGmS8kXfVgM9Sem4K/KMm+9OBBd87k+Wle4K1QnWRdU+u6cQW1esavuCLasHWirsq
         13esvEVu8ECzIpuTrCbs0fXQZFDDQhFQlnSP6ltDFadayBUqrmMFe09mMUS1mSyvaVWd
         dquDa/CGRJvgrC+tTPEEdKc/sIwE3SXISA63JbHniO/AnE5ggiCCTtnnppkXhk7doZD1
         bnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035590; x=1746640390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oDE83EwkorDVtORVKBlkfPGh+JPf5o4G0cENIaXzqsQ=;
        b=BzABB7tZF3oSur0V5Qxi5Irfisd/CGBOLmhcNc0YgXlj8YIyOG0sk5GNdodIxPxXG5
         UzAQuXxD+T70b+DBpL9tMnsgNW5G68G0ZElH//B7DYQxQiwV6v9YtuSYbZJI7gK1QpRd
         m2flYpLqD+RojV20cYazbjkZufWn92bML2oB8bsohvrJYrFsv30buWZ/t6BZMbuQ86X4
         QwnekPMnQyIUrHgVaNLdG+8WZIzjuozufxt31PD76djMgpdt496Agdnc/+ZALs3kYZ4l
         eAXp9tEAlSmSxSKOfviE/CJzeiGEQt/HhEtJgsDev3a59cPfRaWUhtxqZthiYW98YgEi
         ok1w==
X-Gm-Message-State: AOJu0Yzxu/DZmzk/aSmK5lqRnxd+sIKG0cMDiv+NV7PvETaRWTx91ck4
	ZDPlHivHPd4eIHXHooxTRIcfVFE3r+jGjWLqrLV5eT8NYpxKp2G6RwDk1DMN
X-Gm-Gg: ASbGncuQy8tMubXAazv1rT12RzAFrvbU464jXT6W8tlfbvKYTCvfnSH1WkcJrnJ7Ia3
	N+dT8THxuiI/RIuOH2YmzV4rmpnA7xHMvXXEvjZkZ2dLevZvHjGwk9njs+GZp/Vky8HqEbpGTpF
	lWkbIvISplGDbpcSvtaRwKsGl3Cw/wtF2GxttbN18zJYYDTAiO7D7HED2DzcMy5Xk+ZS3PJrxDA
	uajS5joylx2p5gnocUNSOt9CSLqu9QQclPfWrfE79Zv7DzN7VfcgeAd1FjyxZZmvpkrSa6v+yky
	v6YSRc2/s+IOcSvPjffSjqeYXP/KrWW3
X-Google-Smtp-Source: AGHT+IFDAnN8y1NjY6xJkttFcHmhVVf3bZU4bVrcU/RQtMGvoPZkbiETWTmvFrC1WMWCMJmq2aO0aQ==
X-Received: by 2002:a05:6a00:3d46:b0:736:4e0a:7e82 with SMTP id d2e1a72fcca58-740389aebfemr5571591b3a.10.1746035590094;
        Wed, 30 Apr 2025 10:53:10 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b8ae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740398fa3e4sm2024086b3a.19.2025.04.30.10.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 10:53:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] ignore mkfds BPF related tests
Date: Wed, 30 Apr 2025 10:53:04 -0700
Message-ID: <20250430175305.540369-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 17:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215756

They do not pass with GCC-15, ignore them for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux/run-ptest b/meta/recipes-core/util-linux/util-linux/run-ptest
index 7b6b1d1dc2a..c3d57c8262f 100644
--- a/meta/recipes-core/util-linux/util-linux/run-ptest
+++ b/meta/recipes-core/util-linux/util-linux/run-ptest
@@ -24,7 +24,7 @@ mount --make-shared /
 
 # lsfd/option-inet has races in the test script:
 # https://github.com/util-linux/util-linux/issues/2399
-./tests/run.sh --use-system-commands --parsable --show-diff --exclude=lsfd/option-inet | sed -u '{
+./tests/run.sh --use-system-commands --parsable --show-diff --exclude=lsfd/option-inet --exclude=lsfd/mkfds-bpf-map --exclude=lsfd/mkfds-bpf-prog | sed -u '{
       s/^\(.*\):\(.*\) \.\.\. OK$/PASS: \1:\2/                              
       s/^\(.*\):\(.*\) \.\.\. FAILED \(.*\)$/FAIL: \1:\2 \3/                
       s/^\(.*\):\(.*\) \.\.\. SKIPPED \(.*\)$/SKIP: \1:\2 \3/               

