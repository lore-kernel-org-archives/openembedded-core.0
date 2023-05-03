Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600EBC77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 06:03:08 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.12408.1683093785067320542
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 23:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=J5MlM8HG;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ab0c697c2bso15683395ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 23:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683093784; x=1685685784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p+vv1mcK93YCnz7MlBZ1KqzI2+JXqXJCCnPVHD+FreE=;
        b=J5MlM8HGfY8xrUmqaXqr6rncIb3CoiKlVS6spalCOj6ar2k7Ib66wP8ZvAqoAmzsyq
         CQ6DL1Hr7Mu7k5F8enf5CLAggxpAHiLmCdnLbMBxPFWKbj4e0uMcWFfVk/rbCnX6N4EX
         BK46dg4p5j0Mt3s+H9DUjWN991dDpLec61Fd19Rlvn+aO9POX0zjHQpm7qezGpLWYkxW
         SaI3Satb0kXyrRxCL+JZeHM2xbShxPtPQtUtuiSt4O9NA6pm5u5IpZw3k5T2axMl8yAS
         IsvMjNsoaVdRnVLljuZcUkDeNBHTLURzGJc6bANK13vTBPXo06m5N373+N7VkIfHQXgg
         /Uzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683093784; x=1685685784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+vv1mcK93YCnz7MlBZ1KqzI2+JXqXJCCnPVHD+FreE=;
        b=i61Ucq/zh80v6RpCfQJlz6CNX7WLT6h9zNHxYU2AaRsAoAVppmr7+FZAwlqe6WARd0
         ykPhYw74sb8+ufKeKlNepssRP61VY+yAsVS3NqaeXPcwPfy6qU0hKYglCKAiDNWZ7C3d
         2l7NmdBcwAtIuFB7vI3RtlkZqK6VWDNl93XF05HgzFSR4D+YAXMyzJ3iAHJATqROSRav
         RvaMhErbmEa/OB2AVZgoQPnp/MVNaYYj1tel+KEQmPWjc5hsrNveLAf5GW9KgWkygAEB
         DHJbQ/kt1g3HgmX9f5ZwmvVLle8KDMeQlefUCYr7MDdGsToKuDlRvdlMNAE+gr1hVaQi
         KoIA==
X-Gm-Message-State: AC+VfDzrhg099FemeDjPXtMg8YBukHnvYQso736B0OQLrKaAy8aphFem
	BxjbyzyQuRdD/wwr+aiMHCqBhW0A09t9T45d
X-Google-Smtp-Source: ACHHUZ6BDOEPRNLMJy1vh+J1Epsr6LqnFcV8kaUklPYO5ZkeqAHjkpV7BWt47QHfZKxpxE6FLgHtrA==
X-Received: by 2002:a17:90a:8414:b0:24b:347b:2a0f with SMTP id j20-20020a17090a841400b0024b347b2a0fmr18777998pjn.40.1683093783771;
        Tue, 02 May 2023 23:03:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ade2])
        by smtp.gmail.com with ESMTPSA id cu19-20020a17090afa9300b0024df4cfc881sm510898pjb.10.2023.05.02.23.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 23:03:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] musl: Update to 1.2.4 release
Date: Tue,  2 May 2023 23:03:01 -0700
Message-Id: <20230503060301.69825-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 06:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180783

Brings the following changes

* f5f55d65 release 1.2.4
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
v2: Bring f5f55d65 commit which is marking 1.2.4 release

 meta/recipes-core/musl/musl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 531f337e82..4b21af8499 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,9 +4,9 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "1d5750b95c06913a1f18a995481276d698d20fae"
+SRCREV = "f5f55d6589940fd2c2188d76686efe3a530e64e0"
 
-BASEVER = "1.2.3"
+BASEVER = "1.2.4"
 
 PV = "${BASEVER}+git${SRCPV}"
 
-- 
2.40.1


