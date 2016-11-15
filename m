Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 48A117198F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 09:52:39 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id c47so65322781qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 01:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=5qhV2DDiMycv5YVBGvLB19oC80fab0HgroSbXjNfe3E=;
	b=zxTi/9mSQ7GocTUckYPUnzfzN/23SNA4kAh4lIbW9FDw/vBhXiyBu9hcAQ+pdV41aC
	Oix3OdauyDFRF67Pjvhgz6LhFoXHT9QHdOH9NcfKrdfONs/WIBrZGPpGegBnhflFpC+H
	mYXyhJ40F5+nnNOmVZvV8gxlrl6Ybrq0tWl8G+yfJBjdd11HGGl6NKFhTZ4dFYB+oe0p
	0u/py1P4vPek5wDRJLpjgB4zIMs/KUo+DFFiatHIyGQ5yiW9ZHvLjZEXZMxyL+MQiJMs
	DFYMswZ8pkK+Dn50SglkXCjkSQacIn5k/dZLHggONRCBUOvP2hcz/iSRQkMVtvXPO89p
	P67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=5qhV2DDiMycv5YVBGvLB19oC80fab0HgroSbXjNfe3E=;
	b=FchlyhVQLr4LBzd0H+zoJCir6pCkPjHOk/AuWb25LFd8azb+i2p8LMwiqbYKROYN5n
	ohK4BMmiwkBrzxiPz2MyPrZaPMpuRnCq7ZLivEgs/U6gnRkWKst3SZHKo73bDcu6BCy/
	E7++KS83J/MxzP0UCUd+Ii0GMCCgDZM0RxFRe8Wpu9ormeKMXRLfFKJ4dGA2tYHHK5NM
	lUqhMZoz/HOq4gEBMCVWRmVI2raGEQ6jJHa6T/++YMh/vI9uvZJZPllbTsgd5+hYEw86
	PJVdsXb0d35FUb2uqjgcGQneW1BRMAnpy1ZSl5WYdXl1uxYIN43iuGaYUnZIY69v3JPK
	8mQQ==
X-Gm-Message-State: ABUngvf7sXUJsz55qFJoXYFDLz4TkA3IXfq7Ih1ra3QPStInAOfiJHeAvOFGrMVbrgqeRg==
X-Received: by 10.25.221.213 with SMTP id w82mr9066935lfi.141.1479203560872;
	Tue, 15 Nov 2016 01:52:40 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	u204sm6093118lja.5.2016.11.15.01.52.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Nov 2016 01:52:40 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 10:52:08 +0100
Message-Id: <11fa0ee398a9efcd9e77e20e7ca2ab69f78934b8.1479203195.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479201985.git.maciej.borzecki@rndity.com>
References: <cover.1479201985.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1479203195.git.maciej.borzecki@rndity.com>
References: <cover.1479203195.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v3 08/11] wic: selftest: do not assume bzImage kernel image
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
X-List-Received-Date: Tue, 15 Nov 2016 09:52:41 -0000

Instead of assuming that bzImage is available, query bitbake enviroment
for KERNEL_IMAGETYPE.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 37ed2c6de5a7f22f982f921476fa392304995b2e..ad783043b92130a023fd70120becec479c6253a7 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -369,7 +369,8 @@ class Wic(oeSelfTest):
     def test_sdimage_bootpart(self):
         """Test creation of sdimage-bootpart image"""
         image = "sdimage-bootpart"
-        self.write_config('IMAGE_BOOT_FILES = "bzImage"\n')
+        kimgtype = get_bb_var('KERNEL_IMAGETYPE', self.OE_IMAGE)
+        self.write_config('IMAGE_BOOT_FILES = "%s"\n' % kimgtype)
         wic_cmd_vars = {
             'wks': image,
             'image': self.OE_IMAGE,
-- 
2.5.0


