Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id DC9AE7935C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 19:14:22 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z204-v6so10619944wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 12:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=UOcWQPRrkn9kuKUGWp3u/fY989LddiiEUtzIVSnodnM=;
	b=bWE3Lj0DzTkPA0YQjFKJoKBu4PdkECF8VNfzcxOjGHZxTFYTYiIlc0s70MC+y1LKVW
	q2+82oShvVyqmJa+XRt7bZhiakeS+tzlYw+Bnaxa8Y2rVMNBxykJZmXhSfv7071fvB9m
	4P/J/PUJCQRJ6zyNBNlqQiOEeAPEc4l/dHk5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=UOcWQPRrkn9kuKUGWp3u/fY989LddiiEUtzIVSnodnM=;
	b=sfX+kc6KDmhjzIfMi81nL3WnJJXai1qq6RqhCsizxH8fphAcQ5Hcee42W9AnM2UkPu
	VKALCtY1o5lJ9kOVZVzinLSoYAA9McYm1NKjoDwU8RtKrvxs9J68FNSXYNkIybiNMsIm
	3Mp7L3ppa4P0EC/KFzEZjvr8AUlS8LPm7ijoF5lqwyX0sGjb/NYdLn4HuN1SQrszE7+a
	Rvk33UK814qt9gt2GsOZwo9Mb8fqiUvZoGB+rhQliZrMc5avWNikweLipUD9g5PRMmeB
	a5IdSznzdyRgswIs2fG487HAIbLjZnbWjQq5dZ//nTCetHyMwH4W2fsKIyB6K7pzCLfO
	RZXw==
X-Gm-Message-State: ABuFfoiF87CZdsL4LnXkm00QY0xxkmX9cDS5HTqsuCzOzUrGmcZtnMmu
	Q4hlxi3XIbc5gDrsQKwJtU4gF1uACt0=
X-Google-Smtp-Source: ACcGV63wnBYRg6pKruiY6NUUQWphUuFze0JAGLDArQH3GRsJWw0ZV+6SlIHsuXHYCiXLkSaahh1f9w==
X-Received: by 2002:a1c:8942:: with SMTP id
	l63-v6mr2904961wmd.66.1539285263108; 
	Thu, 11 Oct 2018 12:14:23 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u76-v6sm37882728wmd.10.2018.10.11.12.14.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Oct 2018 12:14:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2018 20:14:21 +0100
Message-Id: <20181011191421.29483-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] oeqa/runtime/opkg: Ensure the test works on multilib
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
X-List-Received-Date: Thu, 11 Oct 2018 19:14:23 -0000

After allarch was disabled in multilib, this test broke. Fix the test to account
for that change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/opkg.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/opkg.py b/meta/lib/oeqa/runtime/cases/opkg.py
index 671ee06c73e..50de8001c36 100644
--- a/meta/lib/oeqa/runtime/cases/opkg.py
+++ b/meta/lib/oeqa/runtime/cases/opkg.py
@@ -17,7 +17,10 @@ class OpkgRepoTest(OpkgTest):
 
     @classmethod
     def setUpClass(cls):
-        service_repo = os.path.join(cls.tc.td['DEPLOY_DIR_IPK'], 'all')
+        allarchfeed = 'all'
+        if cls.tc.td["MULTILIB_VARIANTS"]:
+            allarchfeed = cls.tc.td["TUNE_PKGARCH"]
+        service_repo = os.path.join(cls.tc.td['DEPLOY_DIR_IPK'], allarchfeed)
         cls.repo_server = HTTPService(service_repo, cls.tc.target.server_ip)
         cls.repo_server.start()
 
-- 
2.17.1


