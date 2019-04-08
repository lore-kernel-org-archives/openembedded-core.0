Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 072DA7D65D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 11:59:36 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q16so14033951wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2019 04:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wok9nz4gDwvlxIBs84px7dJZJgcuiaK8D7DTkGT0Ujg=;
	b=WdDpY3pfBaw9qDrAeFQh5k6WKijsxpxZH+XPv+pg54DOgp2nAZdLjNcmkDP9HhAzJ6
	4qFpfpwPWrXwJw8VqgKRHLENj+63EY/1fqxHAWQlcWGOweiGdZxzXncZcsNQHrEAZWEW
	dlJ5QQOzJfbltXVuiHHK3THzshu0ZCgjy0dSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wok9nz4gDwvlxIBs84px7dJZJgcuiaK8D7DTkGT0Ujg=;
	b=CjnNOVxv4BEZi74U6mtYIInin1vFN9j5/RzDqNfcQ9WNOwHTAuw/m3nD0rgbD27CTk
	KMEC7dYfAHtey73wW3x4sSvv+g+c6c5VNFKcvhDWddwC37RE3JZvs9s9RkFjYx+H9qXk
	MAgLTnFHnuQCIyRSEqpzOv+Qo4LWRICNgnEwvbMc6t0A19UnUB+k5pO334ihcCDXwurD
	XitSNJtx1UuCHCYa+I5naWkbGn2kNDzyYpY9nvKKB9RVg2XKrgdjZSBLwA6dp7x13DaV
	jVuAVTzDkdVc7+9MBetzpf1s71x7vu/6jvkJEji95zKx3CnPbTtIkIuZjRLGw5LN0JJH
	2Usw==
X-Gm-Message-State: APjAAAWIA874lcnEsToQIC6U3jCEHVA49coBhyLiEHkhB3EZoQKIcvjq
	lTYuWHZigDQM96WQMY/x7kiX/ZSBCyE=
X-Google-Smtp-Source: APXvYqwyvSdfN58lGhL6z7C3upcpKZ9j4MDzhiBHlEWzbNqEgNl8V0TG3xsPvlDF0guCkd5f1qrCvg==
X-Received: by 2002:a1c:a9cb:: with SMTP id s194mr18054162wme.62.1554724777416;
	Mon, 08 Apr 2019 04:59:37 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s1sm21654036wrt.43.2019.04.08.04.59.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Apr 2019 04:59:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2019 12:59:33 +0100
Message-Id: <20190408115935.16945-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] python3: Avoid hanging test
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
X-List-Received-Date: Mon, 08 Apr 2019 11:59:37 -0000
Content-Transfer-Encoding: 8bit

There is a python test which hangs with recent kernels, 5.0 onwards. This causes
ptest to timeout for python3. Disable the problematic test until we better understand
the real cause and fix of the issue (discussions are happening with upstream).

See the patch for details/links.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3/ptesthack.patch            | 49 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.2.bb |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/ptesthack.patch

diff --git a/meta/recipes-devtools/python/python3/ptesthack.patch b/meta/recipes-devtools/python/python3/ptesthack.patch
new file mode 100644
index 00000000000..3f5589645ed
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/ptesthack.patch
@@ -0,0 +1,49 @@
+This test hangs under 5.0 kernels onwards. It appears to be caused by the commit in the kernel:
+
+commit 4f693b55c3d2d2239b8a0094b518a1e533cf75d5 (HEAD, refs/bisect/bad)
+Author: Eric Dumazet <edumazet@google.com>
+Date:   Tue Nov 27 14:42:03 2018 -0800
+
+    tcp: implement coalescing on backlog queue
+    
+    In case GRO is not as efficient as it should be or disabled,
+    we might have a user thread trapped in __release_sock() while
+    softirq handler flood packets up to the point we have to drop.
+    
+    This patch balances work done from user thread and softirq,
+    to give more chances to __release_sock() to complete its work
+    before new packets are added the the backlog.
+    
+    This also helps if we receive many ACK packets, since GRO
+    does not aggregate them.
+    
+    This patch brings ~60% throughput increase on a receiver
+    without GRO, but the spectacular gain is really on
+    1000x release_sock() latency reduction I have measured.
+    
+    Signed-off-by: Eric Dumazet <edumazet@google.com>
+    Cc: Neal Cardwell <ncardwell@google.com>
+    Cc: Yuchung Cheng <ycheng@google.com>
+    Acked-by: Neal Cardwell <ncardwell@google.com>
+    Signed-off-by: David S. Miller <davem@davemloft.net>
+
+
+Reported to upstream kernel for advice: https://lore.kernel.org/netdev/85aabf9d4f41b6c57629e736993233f80a037e59.camel@linuxfoundation.org/T/#u
+
+Disable the test for now to stop ptests hanging
+
+Upstream-Status: Inappropriate [real cause of issue still TBD]
+
+Index: Python-3.7.2/Lib/test/test_httplib.py
+===================================================================
+--- Python-3.7.2.orig/Lib/test/test_httplib.py
++++ Python-3.7.2/Lib/test/test_httplib.py
+@@ -1114,7 +1114,7 @@ class BasicTest(TestCase):
+         self.assertEqual(sock.file.read(), extradata) #we read to the end
+         resp.close()
+ 
+-    def test_response_fileno(self):
++    def atest_response_fileno(self):
+         # Make sure fd returned by fileno is valid.
+         serv = socket.socket(
+             socket.AF_INET, socket.SOCK_STREAM, socket.IPPROTO_TCP)
diff --git a/meta/recipes-devtools/python/python3_3.7.2.bb b/meta/recipes-devtools/python/python3_3.7.2.bb
index 5c64bc8aa2a..3d44bdca911 100644
--- a/meta/recipes-devtools/python/python3_3.7.2.bb
+++ b/meta/recipes-devtools/python/python3_3.7.2.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
            file://0002-Don-t-do-runtime-test-to-get-float-byte-order.patch \
            file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
+           file://ptesthack.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.20.1


