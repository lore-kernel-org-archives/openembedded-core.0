Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A7FC63797
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 22:16:41 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.114.1675289796588847861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 14:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lNACKDY3;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 78so13585687pgb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eD/yHGojyXNaSXnjHjfXyQanfEHEORhk+4sp9UvY1zk=;
        b=lNACKDY3nDHZ2K6QS0H7OBZj4datX819A+2Cdq8sdhcYAO0HKzRevJwWAAW0rgroKF
         kgueMdSr9ZAOe9qQhJfoB8NMJkYGXBOnya3lb6kI5Rvc5M1k7l2a/jRDzJnn1O0qPQml
         uq2UYOxTErJZgPB19CbSX7MqiGpCzzrZEuzYrwlWNDogTzjyXl99GOGrEJw217ovN1EJ
         Lgy3zC59Sr2BWbFcYy9gwkFTntU/85oePBWSDeFeF1BOw5wGT1m6qcP5SUT6ZCsy4nfz
         sTItRE43hni94Dbq9//54EoCUOM/Z18SWAP07M55hnOU9bL3KyjjwcgsIpe/ssMcmTmy
         JaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eD/yHGojyXNaSXnjHjfXyQanfEHEORhk+4sp9UvY1zk=;
        b=3TXMA9lx0sslBcnfTSV00UQhxlLH0AwLsqjb7njuR/u9LJAglm4RaldJH8aio2Xcuz
         2tjW/UQqpf8aPOjVjE9eiQd8915mmE3PSVFwKqG/EqiWTAfMrxg6zeHsHQ1oqSIzRTdl
         pD7gNOd17YprHq+pJEMrE4M2gEnIHXEiEEh526k2KHkShFJMZM6kQhna3SQK86/kuWcf
         e2l/VQrbVTaVIsEzzeswvYogxDQH+EZknBaspL8IzEBHKnar2fb4NOusQ0GFg93e5cPW
         01UIOTpMQdX92tHGIUI2I1STn1yuM95OYBEZUElU9OYB1ZQzJBYx/YcM4spAEHi15Mzq
         mBkw==
X-Gm-Message-State: AO0yUKXs6GAUgHYiTx3XoZTNT/zP2NeE6zPjpozHi5hJib/FJK71GWXs
	kqVpPdB8f4hCgOItE1AoyUDYlQ5mUV+7IyL5bZw=
X-Google-Smtp-Source: AK7set8k+FlbloyNsdqNvumec+8t9OxlovVEes59r4NFcVD5L0Djvs8gKIEPXWYukBhppKB+SjWhjA==
X-Received: by 2002:a05:6a00:22d6:b0:593:bc80:2d2d with SMTP id f22-20020a056a0022d600b00593bc802d2dmr4747673pfj.17.1675289795623;
        Wed, 01 Feb 2023 14:16:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a001a4a00b0058df440d51esm11904810pfv.193.2023.02.01.14.16.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 14:16:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/13] numactl: skip test case when target platform doesn't have 2 CPU node
Date: Wed,  1 Feb 2023 12:16:03 -1000
Message-Id: <218cf38bd3879df009e70f516c0dcb484376bf2e.1675289652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675289652.git.steve@sakoman.com>
References: <cover.1675289652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 22:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176669

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


