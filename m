Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id B4D0A71BF0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 15:36:44 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id c14-v6so2477411wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 08:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=Yi+JnBiV4+VDdXnMWkICX7hJqLn7vPg7ksbCQkWIQts=;
	b=IAZ7L3D7aFUM5HWdVrHupvlaY+H1dFipcbsdS8d312bMqPqF+KaDdo7KkDuntBCnck
	XjXWGiQjOxE3V9M6p9s8u/1WgyLjue5qsgK7BEDECOJOgUvjO6MG9qoXXTqCTgStSfN0
	OADZeI7mv7w7myKeSAjU9mthWLpeDKwoH30+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Yi+JnBiV4+VDdXnMWkICX7hJqLn7vPg7ksbCQkWIQts=;
	b=ro6PJef0IdGnE4CMRZav5AKphGTUu7b66FXkt94gncJZEjula4RaMI3rl4IKVVNO1D
	dsQCmiznazDXkU16190Zzzkj6vD9uTiPAWMV14eMO66p4yI29SHY3jhkPz7BfqL7rxr7
	NMoiK2ZTfOc00/VN2otbavp2to2dtB//x9ahJnYjnqvpSe1uTomGtaSsiqcupATyaYCn
	WfF18+SNP9jO6DwR4tQPQ2hOrHycmiJYB+BejtPC1w8aIe37Gg5CVi/mEl1VgpKY383g
	BaMMmwJ8Cqo94kmxiYI4RV6xn0jEQmLQPIeDvIJFeOLuNVWw/67UoTGBDyrX4tsqhuxh
	4yzA==
X-Gm-Message-State: AOUpUlGWiu6nU/4r1MzUC2OV4FNaZN4XLnxtUnCZ8najWVB/HnKmqBuc
	JKa9Gcy/eDPqxVc7thT1MIBXjNFNSN4=
X-Google-Smtp-Source: AAOMgpdRPoiLuSvCv130lOX1tc9SV3hslADiKSKCLWWbzpQRTkyrgwdm/IBMIEcu7ZNLdu3Ku1jhCw==
X-Received: by 2002:a1c:70b:: with SMTP id 11-v6mr7695317wmh.151.1531669005034;
	Sun, 15 Jul 2018 08:36:45 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z9-v6sm54571558wre.49.2018.07.15.08.36.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Jul 2018 08:36:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Jul 2018 16:36:30 +0100
Message-Id: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/12] oeqa/core/runner: Improve test case comparision
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Jul 2018 15:36:45 -0000

We can directly compare the test case IDs rather than representations,
then if we're using subunit to split the tests, the comparisions still
work as intended.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 13cdf5ba523..16345fab2ec 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -88,10 +88,10 @@ class OETestResult(_TestResult):
                     break
                 scase_str = scase.test_id
             else:
-                if case == scase:
+                if case.id() == scase.id():
                     found = True
                     break
-                scase_str = str(scase)
+                scase_str = str(scase.id())
 
             # When fails at module or class level the class name is passed as string
             # so figure out to see if match
-- 
2.17.1


