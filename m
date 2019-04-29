Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2B4097DAA0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 11:58:17 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a12so15589841wrq.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 04:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nT6g58L1yn6U+DcSU2I7dbK8RLF25TqnQhz0M/u1I4E=;
	b=PcUCug/d0siYLWZIJwRze47zY5U4AtSs4pnlJIp88+kjtJAKbJ8tmSkUW09d4VLXnp
	cbegWYU2EgNFngYFpGKUQvQ1l3G1ZkU9lgxm3ucGkZuR89enHgSa1bmgcLGojLnxI7nZ
	2aciC9vIpFGk5WTbuE7k0Xi3I578cODwwdRuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nT6g58L1yn6U+DcSU2I7dbK8RLF25TqnQhz0M/u1I4E=;
	b=cTQHtQw92y1Knqk166wGgwFX4jr2h/9wfrV2Hb8E4NPDfOw7/7M+OQ6fGR0uHtVSTo
	GYM8Ya0/uPtgPIjIl1PiHBvfN77FHg1jC7z94ymD3OGJFiVQlkQMtBCvdQwAfd1CYK6O
	TW154BOt6kAX2xYv1yltLDjoBmPwsEdiwM90TbfGt+W09Ta+YQA+CoB9rt0pSLsP5sno
	EBfWmcD2aTHzs6DOlxtyuFmT66gCO8Sx5NlhN+Ol8RolQAyFok3semtV3VETfZ9+C9VJ
	dVXHFrtDDZeA5p+oZDZsxh2s51+SDfxH+1hlhCPIfF9ZU9Y7v44tRtyurFM+At+oWge+
	jaeQ==
X-Gm-Message-State: APjAAAW96xBlwHZjm7UodA6bVbndA32Iyp8Ttc55ZUPmOn00VYJa1voJ
	PdR9Kg+o8wE+iz65ICg4fzRv/fYQCw0=
X-Google-Smtp-Source: APXvYqzzDmzFVEK1sJ53cmFIoohDLSMiUP7dngaLQTc0Le5Bnyz7I+6/eCaSpVHHFoyxhCeWTs2egw==
X-Received: by 2002:adf:f791:: with SMTP id q17mr8554000wrp.223.1556539098289; 
	Mon, 29 Apr 2019 04:58:18 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u8sm9634172wmc.14.2019.04.29.04.58.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 04:58:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2019 12:58:14 +0100
Message-Id: <20190429115815.20734-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] python3: Drop ptest hack
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
X-List-Received-Date: Mon, 29 Apr 2019 11:58:18 -0000
Content-Transfer-Encoding: 8bit

With the kernel TCP backlog queue coalescing bug fixed in the 5.0 kernels
we don't need this patch anymore and can run the tests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3/ptesthack.patch            | 60 -------------------
 meta/recipes-devtools/python/python3_3.7.3.bb |  1 -
 2 files changed, 61 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/ptesthack.patch

diff --git a/meta/recipes-devtools/python/python3/ptesthack.patch b/meta/recipes-devtools/python/python3/ptesthack.patch
deleted file mode 100644
index 8cfa92f9e81..00000000000
--- a/meta/recipes-devtools/python/python3/ptesthack.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-This test hangs under 5.0 kernels onwards. It appears to be caused by the commit in the kernel:
-
-commit 4f693b55c3d2d2239b8a0094b518a1e533cf75d5 (HEAD, refs/bisect/bad)
-Author: Eric Dumazet <edumazet@google.com>
-Date:   Tue Nov 27 14:42:03 2018 -0800
-
-    tcp: implement coalescing on backlog queue
-    
-    In case GRO is not as efficient as it should be or disabled,
-    we might have a user thread trapped in __release_sock() while
-    softirq handler flood packets up to the point we have to drop.
-    
-    This patch balances work done from user thread and softirq,
-    to give more chances to __release_sock() to complete its work
-    before new packets are added the the backlog.
-    
-    This also helps if we receive many ACK packets, since GRO
-    does not aggregate them.
-    
-    This patch brings ~60% throughput increase on a receiver
-    without GRO, but the spectacular gain is really on
-    1000x release_sock() latency reduction I have measured.
-    
-    Signed-off-by: Eric Dumazet <edumazet@google.com>
-    Cc: Neal Cardwell <ncardwell@google.com>
-    Cc: Yuchung Cheng <ycheng@google.com>
-    Acked-by: Neal Cardwell <ncardwell@google.com>
-    Signed-off-by: David S. Miller <davem@davemloft.net>
-
-
-Reported to upstream kernel for advice: https://lore.kernel.org/netdev/85aabf9d4f41b6c57629e736993233f80a037e59.camel@linuxfoundation.org/T/#u
-
-Disable the test for now to stop ptests hanging
-
-Upstream-Status: Inappropriate [real cause of issue still TBD]
-
-Index: Python-3.7.2/Lib/test/test_httplib.py
-===================================================================
---- Python-3.7.2.orig/Lib/test/test_httplib.py
-+++ Python-3.7.2/Lib/test/test_httplib.py
-@@ -1114,6 +1114,7 @@ class BasicTest(TestCase):
-         self.assertEqual(sock.file.read(), extradata) #we read to the end
-         resp.close()
- 
-+    @unittest.skip("broken on newer kernels")
-     def test_response_fileno(self):
-         # Make sure fd returned by fileno is valid.
-         serv = socket.socket(
-Index: Python-3.7.2/Lib/test/test_ssl.py
-===================================================================
---- Python-3.7.2.orig/Lib/test/test_ssl.py
-+++ Python-3.7.2/Lib/test/test_ssl.py
-@@ -4146,6 +4146,7 @@ class ThreadedTests(unittest.TestCase):
-         self.assertEqual(sess_stat['accept'], 4)
-         self.assertEqual(sess_stat['hits'], 2)
- 
-+    @unittest.skip("broken on newer kernels")
-     def test_session_handling(self):
-         client_context, server_context, hostname = testing_context()
-         client_context2, _, _ = testing_context()
diff --git a/meta/recipes-devtools/python/python3_3.7.3.bb b/meta/recipes-devtools/python/python3_3.7.3.bb
index eee01c3af61..081ecf4beea 100644
--- a/meta/recipes-devtools/python/python3_3.7.3.bb
+++ b/meta/recipes-devtools/python/python3_3.7.3.bb
@@ -21,7 +21,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
            file://0002-Don-t-do-runtime-test-to-get-float-byte-order.patch \
            file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
-           file://ptesthack.patch \
            file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
            "
 
-- 
2.20.1


