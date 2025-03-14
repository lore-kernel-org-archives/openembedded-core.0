Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D825C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 14:10:35 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.15406.1741961430969405998
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 07:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ebLbX4Ai;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2243803b776so60810945ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 07:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741961430; x=1742566230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PViJimqJpiRT2Y2pgSizK7mdFdDRBw0tedw/N4iN1nA=;
        b=ebLbX4Ai4/d3pxsarvOaiVmRbMO6hS6oku4T6wJsrwhrZX3Hc411BgeYDmZvRbdQsi
         W/PY55AAayuFlHyNSK/pdNkwFCuPBrbNKq0+eIBdiGmoAWa5cv2PagTXSQbPtvUxGAHg
         G+EwUBIv1I/p008ZspQtao4Yc2gOwyQsdxjHeINE2EAGjuqsNhFx9+xlwyddqHhg5whP
         FDRWcNFkb3fzZ19fEBJj+fzAmhsk5n6hbhxEDYuGf3QmEr/O4pxJ826ITiZ/gApErQSA
         us0+OESKV+/8xKjRkeDtvJrF89RXN2lD1lU6zFM1sLWKLXXIXROHklFp5r81NEwXp5oF
         Gn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741961430; x=1742566230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PViJimqJpiRT2Y2pgSizK7mdFdDRBw0tedw/N4iN1nA=;
        b=xSfOi2owawBydFwXWxxbv7WwDigBQ7CzXZ2x8r6bFf7EPWFJYalZDTknyDJnMktD7y
         q48aOOC5AZnCwjb9eKQkNZHAUR58Faoh6I2NJSde/WSDmqWfwedbIGT08uvQR70EbloE
         BsnSaK/k4Ov5+3W+wXOoQERT3vSZFqr7pS7p4J21a0Otm7EwTU4b1gw/eNYPw4WNUez8
         lNGQOnkRzDHOHL1Z39DozSZwO570pUK9udWWl7ZL61VXKI0TxSJ5ZWWAOQCNkdk3Nqou
         NhUOiP87Nv0nkp6nh8UM7xXccKLJ/OSJ6akgKvP/N5CVLF/UcEgxgxIEWARjt+rnmvWZ
         NgPw==
X-Gm-Message-State: AOJu0YxkiHsIbY7DEZ0EXS9mUHWfGzNXA9Fd6EWJ+WcK/g+CvpctxknY
	pp9PCIwl1GMP2X2fEq7Uae2gTrD6SehlOu3HwRYoGrdPmHM5fXKevi3oNyySWtCm0iM31LX5jfQ
	0
X-Gm-Gg: ASbGnctQe0WbLXczMJKYUgP548Q7zb/VZFCyuhlCnXTZJi0yp2M9UIdpAGsmb6qAVIN
	UYX/Cb67hndbmLdXCYgR89C0ctNhi5jo7y4W8xT+LGhcxmDdS8rezRkFSMuD4K9z81vEDwHxK/I
	zcZnawq/XklrgRDad9+dogK7+Jt4KcYAY2uMA8qf4xQDCrQfcntTyFf2kBkUIYTZBdj6BXd3Fr1
	QWqsXR4FWc4WoC6QGhdxKhW39ggtE6b6eBZJT+wsnuQbkjaKIGB32++DgDxTYuTerR4IqBrxZpG
	8fOeSmKrAvg5TM82+PFVotKjaq2WETsU/bw0YTKy0W3dqAY=
X-Google-Smtp-Source: AGHT+IEB/R0wv6irGcwrod7DG74eR7x9BabAb+AA+rAQjY+X6WkcKhvZu9dOlQjJvVOTFvQLnQbcRw==
X-Received: by 2002:a05:6a00:3990:b0:736:bfc4:ef2c with SMTP id d2e1a72fcca58-73722214867mr3900753b3a.0.1741961430065;
        Fri, 14 Mar 2025 07:10:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f60d:ac2a:8f85:c2ab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711559269sm3000774b3a.65.2025.03.14.07.10.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:10:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/7] vim: Upgrade 9.1.1043 -> 9.1.1115
Date: Fri, 14 Mar 2025 07:10:09 -0700
Message-ID: <acb88b244e89bc1300a24f60d0a44c21e0ab1af6.1741961309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741961309.git.steve@sakoman.com>
References: <cover.1741961309.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 14:10:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212853

From: Divya Chellam <divya.chellam@windriver.com>

This includes CVE-fix for CVE-2025-26603 and CVE-2025-1215

Changes between 9.1.1043 -> 9.1.1115
====================================
https://github.com/vim/vim/compare/v9.1.1043...v9.1.1115

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 4ac9c58c80..823cfe24c7 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1043"
-SRCREV = "9d1bed5eccdbb46a26b8a484f5e9163c40e63919"
+PV .= ".1115"
+SRCREV = "c0f0e2380e5954f4a52a131bf6b8499838ad1dae"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.43.0


