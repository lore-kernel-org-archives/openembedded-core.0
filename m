Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85AF9CA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 16:15:23 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.16924.1756916120407353018
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 09:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VhU9gEcw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7704f3c46ceso67700b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 09:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756916119; x=1757520919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeWFiCXvEPXDU0nRu4Zk+xhSzk8R2KZpEMUEeo15u7U=;
        b=VhU9gEcwW5bEmTjscibBtPz8mEcpQwV4NJ2bcx7jGx2TuMRAvhsZj8y3PipvTnsJye
         kIusYTzivFbkw6lx3hqKv4xOMKJbbh+E2N1N5gOOsMGkutSQ907FKdy/NSSM1Yb7Vsmn
         LYX0feB2lo3YeVw+tEPeMat+IL5SEbKrt5/RVEQDY5W5IJjXdh0/AcigrfkQPQWT/DUi
         bvT7WYPTl4GaQE/R8j3C6elJhawsIumttYYflTytgsyp1DdoVmFuG5Gnpf21s6cBHy0v
         YEgt+1aMyszD1ldm+4poE9U4gj8U7+/pMzVSALLklCV0Zj8iuFFaF67pEsiTBeeUi06m
         PqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916119; x=1757520919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeWFiCXvEPXDU0nRu4Zk+xhSzk8R2KZpEMUEeo15u7U=;
        b=ElhYQsq5XLcFJaV7cwjnf4qI+WfpHrFPJT3dYLvfX2Ygx5LlVVIRMTUWW8ybBc5Zq3
         2UbUxC1gAeE2m6dV9isQWtd5CJDYuS2P8XtJxIWxM/cjbBPAx5QTvYYAZtPVyVh+j8S3
         KM1EQN+sGNIPe5mUjr1pmXlsOZ1KPceje5rciODp2fhLVGAcP/qWKJsPzAAjQaFigeQO
         55ylif2i6Da5cVb+YTAwDGRihSsLjrEITLyx7z3K1Fa4/ezTFzASs6AOoYACpA8HyyjC
         /fG9jXu5zVy6M1Vt0qF0EAgLRThtmixqaAwjZ8Ufp8eQga+CdkgocJjtvtC33Ukvsk6g
         ay5Q==
X-Gm-Message-State: AOJu0YzEgocsd4jFSg4lAvj+FqWZzop9qyfTwvbzObWfeDQB6JCSnwaZ
	KEmUu9GyTEjUwZMWo8g1GXCxVOP7YhvPz0H5HXslGCRZxOOoFOcQJSrXX0ZgwQfnXXpCTBKznu2
	2dWL7
X-Gm-Gg: ASbGncuzb1FPlcwpmWap+rinnVpSGnBgaBveD5X9c02Fa4OIy8UTvxFu5MjJnOBkdoh
	9CG5IdhxK9f2tkKjNzh2mP+Idg7iqJF0Lp5M6LTsKq5HEa1VMe80QrUAz18DWuRunuNmlXQoK59
	bEeIhIYMIrUKUZypZwN/91RR9iDH0MlSAE5O+u76ba1+nHTCaax8qqsdvJJhoNdwoZYmUm0zkQz
	jtIYb+WCcEgs4yrImbasKptpJOgX1RofZImpiIYXuaGk+WbpruiHZ23RNAXNZaiQCXiwgEi6AH6
	z8UMnfHAAaFdo9ciENxNtMn+ENANK4De0S3FB6+aXGXqmqYnkuCsTsIREZ6MPAJ5Y82auJjf7EQ
	FoLgL0GvCZQXfiRTzeFTWYWE4
X-Google-Smtp-Source: AGHT+IGMsu9AWKnmdTmdMiIOvf4bCqQSnGA9YVRN87+ZMmnhAkX71/AJpiOx36SXHpazimCOOpMZ4Q==
X-Received: by 2002:a05:6a20:94c8:b0:243:a4de:d7f with SMTP id adf61e73a8af0-243d6dd5387mr20128517637.11.1756916119302;
        Wed, 03 Sep 2025 09:15:19 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:9ffe:4bb4:e2b3:4b1c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7724f079b88sm11027602b3a.40.2025.09.03.09.15.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:15:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/9] default-distrovars.inc: Fix CONNECTIVITY_CHECK_URIS redirect issue
Date: Wed,  3 Sep 2025 09:14:58 -0700
Message-ID: <aceb2920fbdef43db7b0b698865358e288901610.1756915922.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756915922.git.steve@sakoman.com>
References: <cover.1756915922.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 16:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222873

From: Deepak Rathore <deeratho@cisco.com>

The default CONNECTIVITY_CHECK_URIS uses "https://yoctoproject.org/connectivity.html"
which redirect to "https://www.yoctoproject.org/connectivity.html".

Some network configurations with proxies or restricted internet access
don't handle HTTP redirects properly during the sanity check phase,
causing build failures with:

ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
Following is the list of potential problems / advisories:

Fetcher failure for URL: 'https://yoctoproject.org/connectivity.html'. URL doesn't work.

Updated the default URL to use the final destination directly to avoid
redirect-related connectivity check failures.

Also updated SDK test cases in https.py to use the corrected URL for
consistency.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 60cdf960a3560f391babd559737f1afb31fb2c5c)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 meta/lib/oeqa/sdk/buildtools-cases/https.py     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 3edba1b6d0..4ed2121b04 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -52,4 +52,4 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
 # fetch from the network (and warn you if not). To disable the test set
 # the variable to be empty.
 # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master;branch=master
-CONNECTIVITY_CHECK_URIS ?= "https://yoctoproject.org/connectivity.html"
+CONNECTIVITY_CHECK_URIS ?= "https://www.yoctoproject.org/connectivity.html"
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/https.py b/meta/lib/oeqa/sdk/buildtools-cases/https.py
index 35e549eb40..828aaea55b 100644
--- a/meta/lib/oeqa/sdk/buildtools-cases/https.py
+++ b/meta/lib/oeqa/sdk/buildtools-cases/https.py
@@ -13,8 +13,8 @@ class HTTPTests(OESDKTestCase):
     """
 
     def test_wget(self):
-        self._run('env -i wget --debug --output-document /dev/null https://yoctoproject.org/connectivity.html')
+        self._run('env -i wget --debug --output-document /dev/null https://www.yoctoproject.org/connectivity.html')
 
     def test_python(self):
         # urlopen() returns a file-like object on success and throws an exception otherwise
-        self._run('python3 -c \'import urllib.request; urllib.request.urlopen("https://yoctoproject.org/connectivity.html")\'')
+        self._run('python3 -c \'import urllib.request; urllib.request.urlopen("https://www.yoctoproject.org/connectivity.html")\'')
-- 
2.43.0


