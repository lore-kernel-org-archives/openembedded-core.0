Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53373C433FE
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:57 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.1203.1652811950371007692
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=OJJDFYdp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id q18so18061577pln.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=whasVBZP8fLzQdgkOXoU5cCeZjYihBkRC8cbddtHu2E=;
        b=OJJDFYdpPaO2Uo/UYMjWAu2KPqEqdcDtX6swnQrrKzF9M8aRMErFhpBm3riAyfPtye
         gBZQsdBLmQlkVwwZMvvv0w8e9pO3IPZZbJbbcZrg9nPIWtNfQePNOeWtZLHbYGckOs2q
         QzAqN2OBIYNOJEi1qBBRXwt+5GpVOtDE8QJFw1zOiJtqcU0UcybqLt9BJ0EoMgQC54Jr
         Ovs3NvCLFLi3TLiORkM2de5IBCKHDrOi1Utxk6TY5TMveDEQCNguFzqUNG2nVLbrA+0y
         CePdvfvp797QpH8mwmVohNhqFfwK8ryVHeA18j1kQrPZSxg7DV5Qp7VhnKfw4BPw1z8b
         g4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=whasVBZP8fLzQdgkOXoU5cCeZjYihBkRC8cbddtHu2E=;
        b=SqIX86rsOQhhvDiJIT92sfJEdew48Goo0outtZ9HpmiY1MNZCsa3D0vYS3NGmc9r7S
         +CSliUWYQnaNsKZVFQNB9429doInK9V0M2vGmX1U47u9Xzq/xAJb/VPcRmWVjr2xesj9
         ynRjmpywoNqVX1qC8u0njSorXLV5POo48kYIDqRaASqUNG7bVpFqZKd82AaySZFW90K1
         667WV5AaujLezZGi+TUReyXGW+cFfnELjqxJZKVj4qD/0Gm8s+jCjMFpVk/sBNXjIknx
         oJtrSoM9xmxI4gtyB0IjUmLZq7WC//SkAENx+12AmNtltGfSkKpiM/gev/xVWNEmYfI2
         b3JA==
X-Gm-Message-State: AOAM5313zqZodYjwGUbghphdL4VBMhy5NmfPBTaNjgFQaQQBe8GFh/f8
	l+UFPf0qdIT9cgv+KupNzISDZqNArpeLw9uM
X-Google-Smtp-Source: 
 ABdhPJzT157bEBBJ2WeTVXWf0u8GVlpTA3ph64uhTwNFYvX1polofhni2n0P07XXgIRER/rNqVlMZg==
X-Received: by 2002:a17:902:6b41:b0:15f:2c60:2459 with SMTP id
 g1-20020a1709026b4100b0015f2c602459mr23550463plt.41.1652811948856;
        Tue, 17 May 2022 11:25:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 29/31] sed: Specify shell for "nobody" user in
 run-ptest
Date: Tue, 17 May 2022 08:24:15 -1000
Message-Id: 
 <175001feb3b0e5b29cba94a8cdac18b429f84645.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165774

From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>

ptest testsuite/panic-tests.sh of sed need to be run as a non-root user
so that the expected "sed: couldn't open temporary file <filename>:
Permission denied" error can be generated. After disabling default
shell for "nobody", a shell needs to be specified for running ptest.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c6d7216772f76af4429fdaaca518858cf014293f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/sed/sed/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sed/sed/run-ptest b/meta/recipes-extended/sed/sed/run-ptest
index 993d7d5d75..0460c7961f 100644
--- a/meta/recipes-extended/sed/sed/run-ptest
+++ b/meta/recipes-extended/sed/sed/run-ptest
@@ -2,4 +2,4 @@
 
 chown nobody testsuite
 chown nobody ../ptest
-su nobody -c "make test-suite.log"
+su nobody -s /bin/sh -c "make test-suite.log"
-- 
2.25.1


