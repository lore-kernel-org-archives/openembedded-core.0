Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6B38A797DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 13:31:34 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z96-v6so21960963wrb.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=vvYtUa/jxFAvJwlnxecKhQF/hl+Gf/SMjXCAAmg+q6Y=;
	b=msRW/NC8hhhrrrV/OnIC5G8SYJLUYzUn99lXlAqJ3qXX1XnoNvv2OcXOp+iszqfS8k
	2y+v0p0KS7HgSel2YSL/uRR9f4li1HBQhlXez6U+WEVX6w5dnl8Oozu98ih4ws0DYTd7
	0ye/zIlHPJ+8ELld+bquHRkOYxziHIFtaZrjG+Q3R9Je9F4GUmWczQmkqJmfzhPetcJN
	52+zWoCRG2REiNhZZbi+3L2V4JFR+XIYZke1U9u97iaabEe5j2DyPR4igrwsvhvRxiGk
	EucyUqV1ZlFSiCkfnKd8CPSg/DTAEjFQ8ggH8qMMtKpYtLU/aychV1jc3QvyUrHSOceN
	e9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vvYtUa/jxFAvJwlnxecKhQF/hl+Gf/SMjXCAAmg+q6Y=;
	b=XAqXRdWVmkCdx+0ZOT00/ZckQaZVX2tH7myTGrdK/5WaP/HuPU4SaiWuEl+9f3eObS
	Eor8vpBaHDQ5XsMuuKAybyOdFqKudUQNoSV83Gm7zlkSO/qJB6qDZlROvlMAW1M5IkBm
	jKpXfwE4Zz+fLMFVT5K15+zCZCckHspDls25Ozkf0X3piTEI/tr1pExSrQ3bxkE85VJ9
	pg1NFLvk1pE+xWVP0kpjvnR5Eu4St/sJDe8c7lJikwZkQxHL3AzWbp6yfg/Km+4pGtMO
	AnidAkqYaOX6RCLBUHD6ej829mNunRhdtMVKiWNB2x/3AVCPjknRBqXZ2EOtZLGoo6RV
	SU9Q==
X-Gm-Message-State: APzg51DaorZ+OR6s+tYP3XVXZhBq0WIApQOXUQocEonZTlCbwWqn6Bih
	o3vjEEugGPQz9YzGhQ1l8B6T2DDTuRQ=
X-Google-Smtp-Source: ANB0VdZMUSXMC8N76JdD1VWyOfT8dJMmSNvKj2Eff0TwC30qWDHP3Mk+9Qu1r7o0HKwV2aGVjGY18w==
X-Received: by 2002:a5d:448d:: with SMTP id
	j13-v6mr15080896wrq.236.1536586289844; 
	Mon, 10 Sep 2018 06:31:29 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	p11-v6sm17695045wrd.74.2018.09.10.06.31.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Sep 2018 06:31:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Sep 2018 14:31:20 +0100
Message-Id: <20180910133123.22372-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/4] python3: fix ftplib with TLS 1.3
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
X-List-Received-Date: Mon, 10 Sep 2018 13:31:35 -0000

With OpenSSL 1.1.x TLS 1.3 can be used, so backport a patch from Python 3.6 to
fix the ftplib unit test.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3/ftplib.patch | 57 +++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.5.bb     |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/ftplib.patch

diff --git a/meta/recipes-devtools/python/python3/ftplib.patch b/meta/recipes-devtools/python/python3/ftplib.patch
new file mode 100644
index 00000000000..8bb3cd02196
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/ftplib.patch
@@ -0,0 +1,57 @@
+From cabe916dc694997d4892b58986e73a713d5a2f8d Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Thu, 16 Aug 2018 15:38:03 -0400
+Subject: [PATCH] [3.6] bpo-34391: Fix ftplib test for TLS 1.3 (GH-8787)
+ (#8790)
+
+Read from data socket to avoid "[SSL] shutdown while in init" exception
+during shutdown of the dummy server.
+
+Signed-off-by: Christian Heimes <christian@python.org>
+
+
+<!-- issue-number: [bpo-34391](https://www.bugs.python.org/issue34391) -->
+https://bugs.python.org/issue34391
+<!-- /issue-number -->
+(cherry picked from commit 1590c393360df059160145e7475754427bfc6680)
+
+
+Co-authored-by: Christian Heimes <christian@python.org>
+---
+ Lib/test/test_ftplib.py                                         | 5 +++++
+ Misc/NEWS.d/next/Tests/2018-08-16-18-48-47.bpo-34391.ouNfxC.rst | 1 +
+ 2 files changed, 6 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Tests/2018-08-16-18-48-47.bpo-34391.ouNfxC.rst
+
+diff --git a/Lib/test/test_ftplib.py b/Lib/test/test_ftplib.py
+index 44dd73aeca..4ff2f71afb 100644
+--- a/Lib/test/test_ftplib.py
++++ b/Lib/test/test_ftplib.py
+@@ -876,18 +876,23 @@ class TestTLS_FTPClass(TestCase):
+         # clear text
+         with self.client.transfercmd('list') as sock:
+             self.assertNotIsInstance(sock, ssl.SSLSocket)
++            self.assertEqual(sock.recv(1024), LIST_DATA.encode('ascii'))
+         self.assertEqual(self.client.voidresp(), "226 transfer complete")
+ 
+         # secured, after PROT P
+         self.client.prot_p()
+         with self.client.transfercmd('list') as sock:
+             self.assertIsInstance(sock, ssl.SSLSocket)
++            # consume from SSL socket to finalize handshake and avoid
++            # "SSLError [SSL] shutdown while in init"
++            self.assertEqual(sock.recv(1024), LIST_DATA.encode('ascii'))
+         self.assertEqual(self.client.voidresp(), "226 transfer complete")
+ 
+         # PROT C is issued, the connection must be in cleartext again
+         self.client.prot_c()
+         with self.client.transfercmd('list') as sock:
+             self.assertNotIsInstance(sock, ssl.SSLSocket)
++            self.assertEqual(sock.recv(1024), LIST_DATA.encode('ascii'))
+         self.assertEqual(self.client.voidresp(), "226 transfer complete")
+ 
+     def test_login(self):
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
index 40896dbc082..93878e4e45c 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -42,6 +42,7 @@ SRC_URI += "\
             file://Use-correct-CFLAGS-for-extensions-when-cross-compili.patch \
             file://0002-Makefile-add-target-to-split-profile-generation.patch \
             file://float-endian.patch \
+            file://ftplib.patch \
            "
 SRC_URI[md5sum] = "f3763edf9824d5d3a15f5f646083b6e0"
 SRC_URI[sha256sum] = "063d2c3b0402d6191b90731e0f735c64830e7522348aeb7ed382a83165d45009"
-- 
2.11.0


