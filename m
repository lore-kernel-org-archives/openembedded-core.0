Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id E6341786BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 16:33:34 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id s11-v6so32551065wra.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 09:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+uEM9/7RP60DdS6hjPa0RT3SjE7sTeXwfB2Ea1qPs9Y=;
	b=DfTrWMScASF4b7ybU+D1MfCMprlvUCD3CaHxgHY6/Ge/9r7Uba8YeMNsjJEUnMK8Ig
	R/MlEmKmeNJY/7ek969hT6U1HsYcK5AFA+IDQgVTK5RaAEq8ofs9Jw7hZ5568kY0z/D3
	sUHXprEIo/zoehVQAAmhhQxk4nmQLi7x7z70g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+uEM9/7RP60DdS6hjPa0RT3SjE7sTeXwfB2Ea1qPs9Y=;
	b=jszMIs8RhSsVnM+WBlmwME0A0oGB602uAA6WrELmLpwGGNnfXW/62UNLzvR2DO9DxV
	w6fJT8QOKaILPulWX21Y7xZXHV0t5NYHsRMscuU/LKjTdInLLtIG4G1zcnCw0SfjCrpr
	yZfJEx9zFAbEruBF+ZiVu+66tjzEWvyG2YpLYwhdAdWWFzva4WLVm5zctKmseURl2iVn
	pkhbTEA+hjPYqGbci2ASfWMeuheR332QZM0g3ap9/Awyv3xIeQjIm6a7i0itZ0cTFGmp
	226XRXhLqJS5FrtIjX5pvZJiBqDXkpIB9k6TN0jji3YJHF+T8R/DHgzK6bOAqnIBNcUo
	h6Sg==
X-Gm-Message-State: AOUpUlFP1qmMWzU64smiHfQvCRQpI8h6uLMda7lCwSfRc9oOexjSyUM3
	i44/d0ZMbY3d9DenWM3/VF5sa/KazU8=
X-Google-Smtp-Source: AAOMgpfeShx3NJYb9CUAdMA24V7ZEEHtuFB92WxsFgaYkaqfD8ApQFWSXsWO5GeCYCtZpWUL1aoSZw==
X-Received: by 2002:adf:efc1:: with SMTP id
	i1-v6mr6107406wrp.151.1531758815381; 
	Mon, 16 Jul 2018 09:33:35 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j65-v6sm13571188wmd.39.2018.07.16.09.33.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 09:33:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 17:33:25 +0100
Message-Id: <20180716163325.13847-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180716163325.13847-1-richard.purdie@linuxfoundation.org>
References: <20180716163325.13847-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/6] oeqa/decorator: Improve reliability
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
X-List-Received-Date: Mon, 16 Jul 2018 16:33:35 -0000

Checking if the dependency had any failure is unreliable, for example
if the underlying data doesn't get transferred and the list is empty,
success of the dependency is assumed.

Since we now have success data available, change the code to use it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/decorator/depends.py | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/core/decorator/depends.py b/meta/lib/oeqa/core/decorator/depends.py
index 69c604d8f4b..109cc88cff9 100644
--- a/meta/lib/oeqa/core/decorator/depends.py
+++ b/meta/lib/oeqa/core/decorator/depends.py
@@ -63,13 +63,15 @@ def _order_test_case_by_depends(cases, depends):
     return [cases[case_id] for case_id in cases_ordered]
 
 def _skipTestDependency(case, depends):
-    skipReasons = ['errors', 'failures', 'skipped']
-
-    for reason in skipReasons:
-        for test, _ in getattr(case.tc.results, reason):
-            if test.id() in depends:
-                raise SkipTest("Test case %s depends on %s and was in %s." \
-                        % (case.id(), test.id(), reason))
+    for dep in depends:
+        found = False
+        for test, _ in case.tc.results.successes:
+            if test.id() == dep:
+                found = True
+                break
+        if not found:
+            raise SkipTest("Test case %s depends on %s but it didn't pass/run." \
+                        % (case.id(), test.id()))
 
 @registerDecorator
 class OETestDepends(OETestDiscover):
-- 
2.17.1


