Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 665756C123
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 12:17:46 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p4so1671549wrt.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 04:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=nVxcIcwJTDRz2daZbMOhJ6ca8EvVb4f6zb9axxIUcMI=;
	b=XF6tp4c1fqoqKUIuxkYCqCHre9lZ+kZLdDIDPTcqxp8+hnW7TZ7Oq+DqRl2/vU7AZV
	Zow9UNt+Pwl50TmdRGlXwvIdubrfpU+VTPbdfG9rZvwKOoiFYNPog8a9BLxTEyKWScqM
	1cfOLepdmdgSVCREjoKS/sjFLgbPI3LP6Vsc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nVxcIcwJTDRz2daZbMOhJ6ca8EvVb4f6zb9axxIUcMI=;
	b=dc+JdD5MwGrCiHMYeLAuul40O0QsOY9eMZKMpw3fDbxRp1bhPAp9Z7KzCYC9w9AlOq
	LJiwnOVzJVfOMmnkq3A4nGC5ks05Hzf1CPQrUXIGzU5byD36ktyW4lpaFBRocPwM5zDZ
	JdgPtmMAkl8QjMxvKTRCentPfC538JgnAmQpwpZR498LLTUNzizn7mHvlLpO2tTn6ONK
	nMBAY9JMCT1v1sz5Xl6+cBn4bb5g4egVDUDTGcFPyTMFS6Kdx5dhAYxkRDtJqQR5v5QA
	37zAKE27A1T1XHS9e1SJn1/PWSTSokXUEZq9pJ9ouW3bUxvUMxG+/KzPnm5aB9zP+22a
	73bA==
X-Gm-Message-State: AA+aEWYiKK2B3qAvuClwGB6ILKDYqWkuwYI8sCFUS4IzDyO+TLL3fcob
	rk4eCoGcwmam6DZeIgf/hxjmo2oXkDc=
X-Google-Smtp-Source: AFSGD/URH1/sOP/dDPosvb692oZiQvKPl7aHLrUfe9lBJfNPUlRc1CbC2Z6GF73uFw4QlVUsBuiT4Q==
X-Received: by 2002:a05:6000:12c4:: with SMTP id
	l4mr1185641wrx.134.1543493866906; 
	Thu, 29 Nov 2018 04:17:46 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 5sm2717625wmw.8.2018.11.29.04.17.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Nov 2018 04:17:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 12:17:41 +0000
Message-Id: <20181129121744.10052-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181129121744.10052-1-richard.purdie@linuxfoundation.org>
References: <20181129121744.10052-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/5] oeqa/selftest/runcmd: Increase timeout delta
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
X-List-Received-Date: Thu, 29 Nov 2018 12:17:46 -0000
Content-Transfer-Encoding: 8bit

Expecting 1s accuracy on a 2s timeout on a heavily loaded system has proven to be
unreliable. Update this to a 5s timeout with a 3s delta which should be achievable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runcmd.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runcmd.py b/meta/lib/oeqa/selftest/cases/runcmd.py
index d76d7063c69..a1615cfd20b 100644
--- a/meta/lib/oeqa/selftest/cases/runcmd.py
+++ b/meta/lib/oeqa/selftest/cases/runcmd.py
@@ -24,8 +24,8 @@ class RunCmdTests(OESelftestTestCase):
 
     # The delta is intentionally smaller than the timeout, to detect cases where
     # we incorrectly apply the timeout more than once.
-    TIMEOUT = 2
-    DELTA = 1
+    TIMEOUT = 5
+    DELTA = 3
 
     @OETestID(1916)
     def test_result_okay(self):
-- 
2.19.1


