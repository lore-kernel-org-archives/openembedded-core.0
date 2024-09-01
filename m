Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D04C54FC6
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 07:18:59 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.11820.1725175131832046892
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Sep 2024 00:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=efW/KJBd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42bb8cf8abeso23964765e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 00:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725175130; x=1725779930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Geu8eU2knM8uU1Ql27qHqVFOuL1p5sHRnS5gsSDLqzQ=;
        b=efW/KJBdBsuscFpQqDr2sliMHg7y/zktHiorUJz7n3noZijGuYf8/HyNXhOsEmXtux
         n0FhlVOzhSR57kURy+Fd2qG1UnIbwGEt90smSsN+dH41mS1CovjfQSZnWW4nZ4HeTHsB
         2wBdBthG6RQpC8Hy/sd/Yy0Mf60pMaQaCEJzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725175130; x=1725779930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Geu8eU2knM8uU1Ql27qHqVFOuL1p5sHRnS5gsSDLqzQ=;
        b=hjgLO5znj9SKaBmDAED4KTXVB/oExZmpGN0WjdTXXNpSPvr28/zZTATwuScqI9YmRs
         ySmXp1dBb+r9PyST9I/vYSKqwYYut+6lrgbmJwSOBQ8sPgt7xABRH5kETO3na2TQT677
         4KmPWjeF+29O28yhZ+bko/7d/dmjcJ6zC3rN5oyjni3L7gRFmbLqWrOczn7YKnK2cMr4
         FRBm5fFhuZHb+ErqUYCsj3IaWA1+fk/lWZZrCaiFlmdJJX5uCI40Ma3+6u2vbeRy7yqR
         ezSFDUe4KGSpVkc5DfS9Zu/BGFiCIhAzumlu18526jLOTx8GSWJqqYJNgo2qLabYG6GG
         wPSA==
X-Gm-Message-State: AOJu0YzY9oiOIe14JbkoK3Fv7LvUWnX48G+taTHId2RaacuLKTvu87hd
	RXWN9DLCtCPhV3+5+A5mXDFljtv43UfT80MwTj8lYlH+J12AizXHBBaYjdhJ4xsx/1wWndHhkJH
	+
X-Google-Smtp-Source: AGHT+IF9jt5k2udONsxpybr57EDvLHLKxWB86lVHD/o6SNoAb0FTwfgmwadhATo5mCIjnY6Hfjj7Hg==
X-Received: by 2002:a05:600c:1548:b0:427:ab29:30cf with SMTP id 5b1f17b1804b1-42bb01ae388mr88925565e9.4.1725175129511;
        Sun, 01 Sep 2024 00:18:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c6b5:7d2b:4127:f9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c90c6c06sm457277f8f.84.2024.09.01.00.18.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 00:18:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] abi-version/ssate: Bump to avoid systemd hash corruption issue
Date: Sun,  1 Sep 2024 08:18:48 +0100
Message-ID: <20240901071848.96558-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 07:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204040

Unfortunately some recent patches caused non-deterministic output.
One input hash lead to both good and bad output and whilst that patch
has been fixed, the problematic hash 'cross' linkage remains. Bump to
a new sstate and hash equivalence version to avoid this and work from
a clean slate.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 2 +-
 meta/conf/abi_version.conf         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index beb22f424e8..fdd529ee4e8 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-SSTATE_VERSION = "12"
+SSTATE_VERSION = "14"
 
 SSTATE_ZSTD_CLEVEL ??= "8"
 
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index 0fe91b5ddf3..ac97752c976 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -12,4 +12,4 @@ OELAYOUT_ABI = "15"
 # a reset of the equivalence, for example when reproducibility issues break the
 # existing match data. Distros can also append to this value for the same effect.
 #
-HASHEQUIV_HASH_VERSION  = "17"
+HASHEQUIV_HASH_VERSION  = "18"

