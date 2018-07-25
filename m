Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 96801753E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 13:49:31 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id s12-v6so2856605wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 06:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mDv6S4+Elv0tGodCysOZY6mDIuDrQubYuGpALGdAY2k=;
	b=SsC63p8z0o7V6r3OmJ4WwT2x/w+z5O3NW4igpC5lIF6sSsH3cf9DrLVMs6VZu1cbcK
	wLNfeOC7GjqXueul7efrxvq9xgGxGtjuoB8bxFgUY2xEvlKbgzF9k6Zs+DbH+fc+HWuX
	+nZtIW3jZxnwIp116aCULfwhq8UfXm80vQItE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mDv6S4+Elv0tGodCysOZY6mDIuDrQubYuGpALGdAY2k=;
	b=Dxt0L11n14rPpcMX5Tvtbi+PYuUoXG2DIjr+8YfxAwuzjiqFYESb8KFLw1Wt/bSN8+
	yohsvqvHi//ibloml8ttblptS2nl+42lUIpeFbo+0iwixuMnR4KYn/yWp0+JohzdGvhW
	yxvCsqhZfpNVYxIzm6PsVPTzbhWWNFRaTf3dhFfP2PcOQWpSc6FDW90Uy3XSdJRPVUZO
	5nuscqnKmO5RKfkl7LOzFzXP8F1PKgUsNvs93C4A0cR91oS1BdwI6T20J/b9Y65hLU4q
	nSf8kXEUWzf1OzlPugRDvY5T+1zXoFjz/vCkLwfQ/jTjR0nN8qNo18TeJLAd/bP+U5sN
	cghA==
X-Gm-Message-State: AOUpUlHl0T1R24xaFji8CKxmBIm/dUlBptvzJpRpFv21wrdsVcCtKGHL
	fyHwI9Xidz4YBPwxW56u1llW3B65N5zZ+A==
X-Google-Smtp-Source: AAOMgpeZXZEKvwN8G1avQ51nPENxg/78X3KtTVVMEiItKCxzJE+Tjod0BKBuEIEzi8Oz9PVVnRpmwQ==
X-Received: by 2002:a1c:37cd:: with SMTP id
	e196-v6mr4543324wma.84.1532526572092; 
	Wed, 25 Jul 2018 06:49:32 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e12-v6sm12895471wrt.29.2018.07.25.06.49.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jul 2018 06:49:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2018 14:49:27 +0100
Message-Id: <20180725134927.5839-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180725134927.5839-1-richard.purdie@linuxfoundation.org>
References: <20180725134927.5839-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] selftest/bbtests: Add test for bitbake execution outside the build directory
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
X-List-Received-Date: Wed, 25 Jul 2018 13:49:31 -0000

Also fix a related test's error message to match what it does.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 350614967c9..005fdd09640 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -15,16 +15,26 @@ class BitbakeTests(OESelftestTestCase):
                 return l
 
     @OETestID(789)
+    # Test bitbake can run from the <builddir>/conf directory
     def test_run_bitbake_from_dir_1(self):
         os.chdir(os.path.join(self.builddir, 'conf'))
         self.assertEqual(bitbake('-e').status, 0, msg = "bitbake couldn't run from \"conf\" dir")
 
     @OETestID(790)
+    # Test bitbake can run from the <builddir>'s parent directory
     def test_run_bitbake_from_dir_2(self):
         my_env = os.environ.copy()
         my_env['BBPATH'] = my_env['BUILDDIR']
         os.chdir(os.path.dirname(os.environ['BUILDDIR']))
-        self.assertEqual(bitbake('-e', env=my_env).status, 0, msg = "bitbake couldn't run from builddir")
+        self.assertEqual(bitbake('-e', env=my_env).status, 0, msg = "bitbake couldn't run from builddir's parent directory")
+
+    # Test bitbake can run from some other random system location (we use /tmp/)
+    def test_run_bitbake_from_dir_3(self):
+        my_env = os.environ.copy()
+        my_env['BBPATH'] = my_env['BUILDDIR']
+        os.chdir("/tmp/")
+        self.assertEqual(bitbake('-e', env=my_env).status, 0, msg = "bitbake couldn't run from /tmp/")
+
 
     @OETestID(806)
     def test_event_handler(self):
-- 
2.17.1


