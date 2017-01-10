Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 81BC771A62
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 12:51:01 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id v186so60501138lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 04:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=0W4BelUBmXDuNmBtlaLugvRsdfIr8kCqUOzgDl8KGbE=;
	b=fWD8tNhUgtkMWn1Zo425zs9nQyQqkadqsTHQIc/EncvUG9GdpDbCzZgp0pk6oBJ20x
	Udh9Ds1YOZHF2S/WprAkperWDNVy59AU1J1dyrXEMy1p05FAVoyfyX4jJtT8g3ENMORh
	eECKlRKqVldiT9VvlqliEdJEY8NI+oaE9IE0h5QZ/YjXD53UYN36PWolC2z71eLyS2vV
	bsiVnkHdKdknxFNJBDe7FHzlqumTURv7zSgBsY4+K9REuKi7zB12PdFAGkV3xymtDUYs
	i0SdBnVKF6Wg1ow9baZ/3DZL2Th6MoE6ks1QxcgYJ663BW0gFP6JQrcpMw7ndZJaejwR
	ErKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=0W4BelUBmXDuNmBtlaLugvRsdfIr8kCqUOzgDl8KGbE=;
	b=mcitZAUmubYfYMk/v9RvK5pBbRFAGYoQeEOr5s50+YTe1Y0MkB7nJciOH+GyuzNUWj
	MPDyKqnBcNuQCTXXkTrUV/CAOd/pGsosBXuVODGkaxBfK1vqewrjztrofwCkIeBNEtvY
	YLI9/fszQi/eAoxkaE1BaQygg2+RcRuYUdMYnoQXnhohXoyLXNI5b35/XrkHaAh6Iqqi
	XcrAdpdggmT6OCWVc5PyIw5OqDOsvqFbuQTaZbKR9X0ZVq9EtjdtrH3BEG8hEHbztU5Y
	dBK5zKd2p4vn+KFFdGBXYH+M/fcCpoT5O8MOu2El8g8OtWEnBWNnnWYYgaxjCXh73V2O
	rndw==
X-Gm-Message-State: AIkVDXIQ2aEx26/hgtGFFZE82YeB3Lwzw4bQepAJ4yh4NfNYqJeC4Ha5Sd01lwpSWS+lvw==
X-Received: by 10.25.157.5 with SMTP id g5mr924978lfe.112.1484052661606;
	Tue, 10 Jan 2017 04:51:01 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id c75sm450711lfe.28.2017.01.10.04.51.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jan 2017 04:51:00 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 13:50:14 +0100
Message-Id: <bc5e4bd1e186b9a1b4113372d5273d9de79e3a39.1484051596.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1484051596.git.maciej.borzecki@rndity.com>
References: <cover.1484051596.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1484051596.git.maciej.borzecki@rndity.com>
References: <cover.1484051596.git.maciej.borzecki@rndity.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 4/5] wic: selftest: do not assume bzImage kernel image
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
X-List-Received-Date: Tue, 10 Jan 2017 12:51:02 -0000

Instead of assuming that bzImage is available, query bitbake enviroment
for KERNEL_IMAGETYPE.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index f7aac44a9ae91e8287f868540b8ca2e9ecf3409c..ce9e9701280b758d3413aae29615f34a7bc909e4 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -223,7 +223,8 @@ class Wic(oeSelfTest):
     def test_sdimage_bootpart(self):
         """Test creation of sdimage-bootpart image"""
         cmd = "wic create sdimage-bootpart -e core-image-minimal"
-        self.write_config('IMAGE_BOOT_FILES = "bzImage"\n')
+        kimgtype = get_bb_var('KERNEL_IMAGETYPE', 'core-image-minimal')
+        self.write_config('IMAGE_BOOT_FILES = "%s"\n' % kimgtype)
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
 
-- 
2.5.5


