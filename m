Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id AB6D46BA81
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 09:40:39 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v18-v6so24148257wrt.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 01:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=O/kQZgo6lDRT3WFwexg+mVSAL5XGoBz7rUU7FTeqfhc=;
	b=fR1wHLJXoFLGtE/O1VtPiyhlVBQuQ74LuV4rFUC1mqHizpmznNxboxx3mlUmWer/Ge
	kgTJ1Wtmh9wjrj+22P3PgF3k8A9TysZ51PrnkhpD8h7gqP8RokEWXHt9HVPSRwZiVNui
	VwEj9RS1XezBff/lNhdQ1YJaYrIsh8Uz1lx/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=O/kQZgo6lDRT3WFwexg+mVSAL5XGoBz7rUU7FTeqfhc=;
	b=EaprxuX3G1iaOwhPkPeAxSgffRGYXQZE9q17717iCMiSg8PY+NqhOTLudQHY2DFvXU
	nizaN/nu5Ye4HgASZ1kgQf2nN4Y/63UpHcIg41l16FamAZu4QSIe0nnqV5HiEMkEoeDd
	O8+rZiOdhXd2vEChExl9ilWyA7JoScJPxBdbtMv+EYtX7PksqXF+XS3iV+C4mGJY2kLL
	IzQ/H3YXNyGnk7fg1/w5XwXoY+rKWMswpHUlq60OHK+8u4UQ7kKEZpF0bFzf7dDGzPeH
	jpk0uOGhgOqqg9z9ivhi2ATJYhNz58uH+UYFfnnhnGT6feYAXI8MfhNrmH4thF1siHhq
	PblQ==
X-Gm-Message-State: AGRZ1gKWWJrObesgKJRFRShLSSgRPY9N4CsdK0EflPgZWcxZf7i+tHSV
	9UNB73QTbhBbZrM/VAG+QcYgbVwktSo=
X-Google-Smtp-Source: AJdET5d/lsr4/sChcri3KX3sUpKx+gE0AjRBOYIuIBMB3Z4/H3gvvsbrtAuWvk0lywtHzt6o4bbOSA==
X-Received: by 2002:adf:9589:: with SMTP id
	p9-v6mr8579230wrp.270.1542361239864; 
	Fri, 16 Nov 2018 01:40:39 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o27-v6sm24554039wro.24.2018.11.16.01.40.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 01:40:39 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Nov 2018 09:40:34 +0000
Message-Id: <20181116094037.4220-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181116094037.4220-1-richard.purdie@linuxfoundation.org>
References: <20181116094037.4220-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/5] oeqa/concurrencytest: Avoid unclosed file warnings
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
X-List-Received-Date: Fri, 16 Nov 2018 09:40:39 -0000

Avoid an unclosed file per thread warning when running selftests concurrently
by closing the result stream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 6404cb4668c..f050289e612 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -115,6 +115,9 @@ class ConcurrentTestSuite(unittest.TestSuite):
             for thread, process_result in threads.values():
                 process_result.stop()
             raise
+        finally:
+            for test in tests:
+                test[0]._stream.close()
 
     def _run_test(self, test, process_result, queue):
         try:
-- 
2.17.1


