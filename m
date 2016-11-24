Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 265CD71B3C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 07:09:40 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id b14so21334083lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 23:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=b92OJQf+3atM0S/D0L3g1H7rOKYdeAMbTOEkoijr6xI=;
	b=MsdsZI+mAfQzdmrnE4pEW6xs0XC4PXEy+IQvnBM8OtwrYfru73AOTCbltFLiZewWpJ
	zMluhvH+nntq2JZB5XJUdZpnzDA6V4ebSMnzuAGWZREIyrW+fiAKh37w9BMN4rbTibdm
	f6LQuD+2FBIflOviHRvqe1SE9/S9Va2Hh/eBzKw4ZIvR7iFY0u3MzHhPyL0B5YSaLh4K
	ilr+qTru0+WsKe8V1Q/unAPERGgPzID+rEZDSIM+59xw/6XH+5YTk7z42zhJIxvmL7tt
	Xap9UbMXwxBZgR66D4bx+ZLUZaffaWj25K2lgaav+dLfcMQsVj8Ea4a7aSf6N8ETbyBt
	oO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=b92OJQf+3atM0S/D0L3g1H7rOKYdeAMbTOEkoijr6xI=;
	b=Jp5YBLugXR7lCqqTByg4vY3RKt6LUhgmXTZQIZQziVUw7U+pXMJGlgihQB3NKvIu/T
	RerhSZntPmV8GSkdzzYrJQAJmb3mROG6rjprPOgcGa4pkFsVDZylgHxAdiOaW7e99Tv/
	Ww8yook6vD2gv7ceoPLGeivHiocRrb1ZttQTPv7t4BhlpXD7H93LKkTBK1LtjqswZPha
	U/ycye6vbx8yaQqkGhFCfjjIvHptCNsFqUvJ9NsY+AEXw7Za7xI5Xxx2bfpgr+FD025G
	X5F5JXGAUEcx4MjoXwKUTY7VnkUynSbzx03dY/uQB9A4+Y216lj0Lp5eq53+IA8bq5al
	nItQ==
X-Gm-Message-State: AKaTC02KchrC+lIY1uK2eHSYSUXRLqoq++TssSUWTtHqTizcE9HT30zGmbAPrrFnR4Qv5g==
X-Received: by 10.25.150.210 with SMTP id y201mr385530lfd.58.1479971381848;
	Wed, 23 Nov 2016 23:09:41 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id v9sm7780542lja.0.2016.11.23.23.09.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 23:09:41 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 08:08:32 +0100
Message-Id: <6ef87cf9f8de2e21ebf1be74477cfc2d77678577.1479971185.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479970230.git.maciej.borzecki@rndity.com>
References: <cover.1479970230.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1479971185.git.maciej.borzecki@rndity.com>
References: <cover.1479971185.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v5 5/6] wic: selftest: do not assume bzImage kernel image
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
X-List-Received-Date: Thu, 24 Nov 2016 07:09:41 -0000

Instead of assuming that bzImage is available, query bitbake enviroment
for KERNEL_IMAGETYPE.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 2db14445956bc5adcf1e755844bbdb69edcb468f..84ba08675b2995812a858e78b3678b2ab325b15b 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -338,7 +338,8 @@ class Wic(oeSelfTest):
     def test_sdimage_bootpart(self):
         """Test creation of sdimage-bootpart image"""
         image = "sdimage-bootpart"
-        self.write_config('IMAGE_BOOT_FILES = "bzImage"\n')
+        kimgtype = get_bb_var('KERNEL_IMAGETYPE', 'core-image-minimal')
+        self.write_config('IMAGE_BOOT_FILES = "%s"\n' % kimgtype)
         self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
                                    % image).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
-- 
2.5.0


