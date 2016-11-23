Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0842571AA3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 07:47:23 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id a197so64502385wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 23:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=5qhV2DDiMycv5YVBGvLB19oC80fab0HgroSbXjNfe3E=;
	b=EPoM27NZMkQ3F6TADVtuD6WhFgQQ+5EU7KxvEbWfUFJkeigWbAl+tmgSIOZBOo9QnW
	ZYfqbOF692K8nL0atgjkVMsV/IXagCP4tYhz9srqiAdaeGR+rA9O0rR/4XcP07q5kShq
	ct990c2vCsNpIhuuKQGN8dheu4ZotJwUOP9j0TP8pEYojIjVBNvCBFzIVxc1UPtt2hZx
	JtotL6F73azGZEyFIAYYxvgf/SRNrGtOFMIa6QkvHV+JCSgG172WTmwWOxKMs75tDVhC
	jox3VXEkhiUY4g1aFf69MqKZBFvKLiAYL3Gv4zf/RRIlB9ZzY4hwLlQ0e02CxQSlxmti
	MCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=5qhV2DDiMycv5YVBGvLB19oC80fab0HgroSbXjNfe3E=;
	b=gfZiSlbtat5tBAnl0eTAu4Kmu9D5alAv1ZkLttPyQ1CkU8/ibSZYPc7M9VznmvP1Jh
	N/wy6K28iFAkOp2V7mYp3FT2q2B3vkpLW+VFGGSZREpwqC70W0CZQJAbmMKsQyAAyHH9
	pbUsaTnQHzErnnUWQ4wdM7ODFXgeJfzNDWq8ecMp/jUfbbXo0PIcqTKgoMWvINBoDyd1
	AQHypXGp96GZBDSCompDT3/EWuJggLioXE2e8I7R+4cE5FvOAdNLtTDrJTzcLciknUB4
	Ty+V5fIohBIMA/AYuwl1pgHXez9vvLf9SPqMUxuj+fZAktdWFu1QdcvTrzjhWusgok7s
	2Jrg==
X-Gm-Message-State: AKaTC03/L64+Y9XXFYygHl8DXH4GRkIO8BiMYsqZRJC4ZrtpJ/75nLcOuZHagxHhhkCAkQ==
X-Received: by 10.46.76.18 with SMTP id z18mr565282lja.38.1479887244877;
	Tue, 22 Nov 2016 23:47:24 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	f25sm6988635lji.47.2016.11.22.23.47.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 23:47:24 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2016 08:46:32 +0100
Message-Id: <0a191d3a5ffdeccf9fab2082a42274ab091e357e.1479887010.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479887010.git.maciej.borzecki@rndity.com>
References: <cover.1479887010.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1479887010.git.maciej.borzecki@rndity.com>
References: <cover.1479887010.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v4 6/7] wic: selftest: do not assume bzImage kernel image
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
X-List-Received-Date: Wed, 23 Nov 2016 07:47:24 -0000

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


