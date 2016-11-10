Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0D19871A51
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 12:18:56 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id t196so188557485lff.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 04:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Q8ilvQXU5WnwT35t6gatotQ5pJusb9YWzfFwWpM3jMs=;
	b=p5+9S5/irtKUZySORWWKfqm2HwAQd6lGae7nYbV0BQvKf4jQC8JxiwH/7vZswatqnC
	Y6eENGT8FWp4TDzqGuTJ8CY/+hLyeHqtkoHjkrXMPkHRBK2G2jXQ1rwx33BFkdLIx7KV
	p4t6lsMTNpl6dn1bkUxDQVjO49PM88zDaJgc9qO2MNOSQZxlomWFiW20f2OBlVA1sjIl
	AbnzKmB8eiwQH2cB5H0TPrCQaaqM8vx52Ox2ujk7y+Gy+uZ2KDS7pO3X2YkbQMey7QkN
	0ddYww/I6YM1Sg3kGsY+mBt5TQ1By/A3hT4UdMdI9I6E97IKi7UT35bWBLc0Sgef48cd
	y0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Q8ilvQXU5WnwT35t6gatotQ5pJusb9YWzfFwWpM3jMs=;
	b=Yl+p2C5mqCoxCGJ4zG4hDRnen6/c6D2YJL3wPL6mI1u+/OipxwEeFFp800ME/PjStA
	tf02HU3cfavdJvGZxZ6LsMB7fMxYSN6MWtF2RYdW8PD6wy6kiUYSVDBHeJt4IhxItLsX
	iWf1s+1xenpEffu+Hw/3L7ERxa/kkuZMHXFnek4r2EZFYxhnYxmNM+NhTRDkLf8CZeDu
	PAAsL8d4kuqrvDFmw0e3xpgHaTo5RE0TXrpZ9EFHu8W6K5KLJUYkzLGVYb4jBppFuS/a
	8H+VA9bx1P+VZ7hZ97XH8VHougmbjlQmfzuOZniZT/r/FMuW4d8oL7jMLUN5LVA1y05f
	xjwQ==
X-Gm-Message-State: ABUngvcrZYzlF5vgAZiXQjZzd9HoH2DpkcU7yUEqh+oUo1OqPjuBZNWSgk2hu3X4MsLsaA==
X-Received: by 10.25.18.199 with SMTP id 68mr2099026lfs.180.1478780338031;
	Thu, 10 Nov 2016 04:18:58 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id g5sm934563lfe.47.2016.11.10.04.18.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Nov 2016 04:18:57 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 13:18:40 +0100
Message-Id: <956e7bef854473a8b3644e4cba3477fc10d64a3a.1478779674.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2 09/10] wic: selftest: do not assume bzImage kernel image
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
X-List-Received-Date: Thu, 10 Nov 2016 12:18:57 -0000

Instead of assuming that bzImage is available, query bitbake enviroment
for KERNEL_IMAGETYPE.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 8b86acb917134b389e38c8215a8dff6c7f91c005..799886c164a734bcc3226baf97f20d789ae55b56 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -332,7 +332,8 @@ class Wic(oeSelfTest):
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


