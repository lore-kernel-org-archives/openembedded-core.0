Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F6B4C636D3
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:14:32 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.24362.1675260862736279107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:14:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=zBOe+0Vl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id e6so10340507plg.12
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 06:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eD/yHGojyXNaSXnjHjfXyQanfEHEORhk+4sp9UvY1zk=;
        b=zBOe+0VlAjuVG6TKT7qhSuYMZPTno4Gurk5kYUoCliVJzkoNvrQs88F3ynfhjO9X0V
         oho/i/sbdoDuTJMN+2Dvo8/Q3V+gLVlSYG9u6VeropqoPPlO0k4ehSSsamkrSBPCwMcG
         4o7iuTVxoalPKeRE7aIFWWzlyp/Rap/OkBizrhxvLCmVmmvI2h4iRqXHnlaPKJRieTt9
         G1po59AuVEyiru/Cepk4bgSi4dvJIskwjo7SrY652Uj5s6nmRuc5Yag62WNZ8y1P9fkR
         m7c5ru5wGdFxMTAtxCoqnWSAMfsO1jyzWUhZ22VgzL/dKQMdIqaxHQuIB68jzLZdjtEi
         uCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eD/yHGojyXNaSXnjHjfXyQanfEHEORhk+4sp9UvY1zk=;
        b=FBfIy8Aernoo+JjLhm46yrM/8gyUIjs5pq4V06LQX7+L4M+hPQq+orVUP/RkLRDj4w
         RZ3EiZMnBEItMSfr+kl6y8M0Oy64m2U2W/gaYYBA2qM2ed49EJ/nKdG5QfQLjzY0bRY2
         GyPLq1hTkZFsraRqf6aw1NklpC9v1aicjVMqRviTMI+o9ZAGWalmoK9P9jGFM75rBkMg
         Qip4pGMfnDLuGaUf6xI6ar08Oub9EHbmDyDR5waE2Hor0B7Lw/LRizrHmzXzzFk8CLMp
         /epUt8xe61dXyT9cwooBHTvrAHlEWCnUBgxDS+tNvIy7F+X3l2kRWzY4Aphq08HeRHe9
         dC4A==
X-Gm-Message-State: AO0yUKUvv3nfF11ajdaH3fQCsWRXzQx8jbHhl8zHu4u/C15xIRtpz6zo
	8i4mNHelnrtSibxMuo84Ut28Lxf4wKK+8M/u8G0=
X-Google-Smtp-Source: AK7set8byudPkCQqocL3/NowW9sUgtaRdeVzT/JE1+65njBYbsqIy+4Vi5dEw9FpzeMWmsDsHohVmA==
X-Received: by 2002:a17:903:1245:b0:198:adc4:2285 with SMTP id u5-20020a170903124500b00198adc42285mr1767802plh.0.1675260861700;
        Wed, 01 Feb 2023 06:14:21 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id n20-20020a62e514000000b00589c467ed88sm11456612pff.69.2023.02.01.06.14.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 06:14:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 10/17] numactl: skip test case when target platform doesn't have 2 CPU node
Date: Wed,  1 Feb 2023 04:13:48 -1000
Message-Id: <da48bc443fec5bbc1fce356c3d5fd551a38a0705.1675260556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675260556.git.steve@sakoman.com>
References: <cover.1675260556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176545

From: Xiangyu Chen <xiangyu.chen@windriver.com>

when current test platform doesn't have 2 or more CPU node, the test
case would report FAIL, according to numa test script and numademo
code, when return code=77 should be skip test, so using SKIP instead
of FAIL in test script.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fd0a82400d419bce8605a9445db9b20b8ddc01a7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../numactl/numactl/Fix-the-test-output-format.patch        | 3 ++-
 meta/recipes-support/numactl/numactl/run-ptest              | 6 +++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
index 9812ecc8b3..a7bc8d322e 100644
--- a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
+++ b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
@@ -7,6 +7,7 @@ Upstream-Status: Pending
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
 ---
  test/regress  |  6 +++---
  test/regress2 | 11 +++++------
@@ -20,7 +21,7 @@ index 2ce1705..d086a47 100755
  	if [ $numnodes -lt 2 ] ; then
  	    echo "need at least two nodes with at least $NEEDPAGES each of"
  	    echo "free memory for mempolicy regression tests"
-+	    echo "FAIL: numa regress"
++	    echo "SKIP: numa regress"
 	    exit 77  # Skip test
  	fi
  }
diff --git a/meta/recipes-support/numactl/numactl/run-ptest b/meta/recipes-support/numactl/numactl/run-ptest
index bf269da755..e019b0d364 100755
--- a/meta/recipes-support/numactl/numactl/run-ptest
+++ b/meta/recipes-support/numactl/numactl/run-ptest
@@ -8,7 +8,11 @@ if ! numactl -s | grep -q "No NUMA support available on this system."; then
 	if  numademo -t -e 10M; then
 		echo "PASS: numademo"
 	else
-		echo "FAIL: numademo"
+		if [ "$?" = 77 ] ; then
+			echo "SKIP: numademo"
+		else
+			echo "FAIL: numademo"
+		fi
 	fi
 else
 	echo "SKIP: ./../test/bind_range"
-- 
2.25.1


