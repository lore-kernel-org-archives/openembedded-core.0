Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 957516D47F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2018 12:39:34 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v13so3667815wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Dec 2018 04:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nVxcIcwJTDRz2daZbMOhJ6ca8EvVb4f6zb9axxIUcMI=;
	b=Ed0WtGRbdzqvzw7ciC7IW1hMpk2iiZkJiNjc2wbUTpjhdeTEinyTXiH9veryExWSVo
	DPEa49xNbUxhBhZByguFjuR+UgmhWgQE3QeYRX2OO9Famc/7glVfFf0MFMxqTNtKdNV1
	8k5MY/AQcg0612s5Oz7YLnx+RRFdF7YAmih24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nVxcIcwJTDRz2daZbMOhJ6ca8EvVb4f6zb9axxIUcMI=;
	b=BtsG7eyTA/e/bEer8JV3eo9GlZxDTpUDJA+HSvawxCav+6Ndb9aA9LfcANi5DR8b50
	1eVtBNht+GpIMN7YcEbUD/DrrzGL/6Bkvc8pzg6EROzuUh5PjtL1t6isYqydZQ4V46WR
	aECk2/NTvunFRB2v5sfPgSTSd6MhaywRJ9uHh5qlj3RgxJjXpzXN0S3ebLDzwGuMci5Y
	7IosQPEvnQBZC9sC1Mu0mxb0L1CLCwQ78SRvyc/T9MsqsmxR2/iF1uw4BN/as1L0i4gD
	GSIsuoOwfv1dj3eEOlTDSuAWA45rYYk3IHpW+H8X/0b4knxahwJFmfVvVbmul2k43P3s
	fFEg==
X-Gm-Message-State: AA+aEWZfAQlJmu6dK4syomfoWXICnkmuc9sAAmFZEom0uhnya+pzW/Z4
	554Fn0k1hMN2O5GRT2tYlmBtveCP/7k=
X-Google-Smtp-Source: AFSGD/XKb8+UXTgJ5nqohi5/kqtEC682+Oyl8J8bJNlOkbQiDWYRqSAKiJbsHLz3G5aFYki5s9hlKg==
X-Received: by 2002:adf:ea11:: with SMTP id q17mr1608274wrm.328.1544186375078; 
	Fri, 07 Dec 2018 04:39:35 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c8sm2216282wrx.42.2018.12.07.04.39.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Dec 2018 04:39:34 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Dec 2018 12:39:33 +0000
Message-Id: <20181207123933.14951-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] oeqa/selftest/runcmd: Increase timeout delta
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
X-List-Received-Date: Fri, 07 Dec 2018 12:39:35 -0000
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


