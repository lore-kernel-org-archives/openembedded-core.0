Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id D43B5779AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 11:35:36 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id y193so65933630lfd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 04:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=EGnSqKmgdOyeMtmqqn6S2xqueUzhLmA7KagJ+QmseSg=;
	b=ThrGMBPupPuIyy7QNLZfnIPgVJmTmknctHVmA9TpNIhdh653LCE7mOxOTKE1C5sLP+
	muNBfK5TQ2J2GGYNmXhBqaRGnQX/LbVNATGZJfQUcAa3wNoQ/Ow9kQJ6F799foRPdNmt
	ibWx12fj5o9uwg6Ij9ULMVgvRcdrV2bLccuh50n69o6Z/CFrBvDSvBuG6mr3ohFcSwnQ
	L0WQaBCAtrLzXUVErtTW0EUl0TGTN3RnmVIySc2XyF3ug9S3catUWSaYiKK45RMNygg9
	LlrzYFR0RU2ZQ6bB4GRFqbUP2IiX3WLlTBuKKPaBTDjynmxMoJB+G9Gm+HHlDIjpgMd1
	01TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=EGnSqKmgdOyeMtmqqn6S2xqueUzhLmA7KagJ+QmseSg=;
	b=aRLrHrEB/6cGn/BXApTSUrU8r7xA3P21cST6wD5BRyzhsZYrQ8eqhiday2Xb0qwmrH
	W2gw34S0aI9Tm6IPNFwCgIVmHQ4E1qKV9FgKdir789K5+TBsp6vSw8EojFECAkzk1K7q
	hLAd3hPLgQMq0o+2SqZCF744wK92iIcd4cuwTY4ZJnK9wRsDIiei/KPfeofU8NavWTvf
	hZEom58NC3s4ddgpEyCbkEeKNSfkC48ADNSnluQSr6a3XqkW1l39EeFxjTjqyZFFWaDy
	HzFART+r1hD6yDTBD9x6TWWZ5OuiHx5LL9gZB8glCzt+Bi1lLRU/5b85lbXIHQl3jt5x
	ZBXQ==
X-Gm-Message-State: AFeK/H2GdXauhnCPmMq5TziEvySII3wsQPMkI6s0ou/1560hnGhELBiDP4WILGnxzQs9lg==
X-Received: by 10.25.67.89 with SMTP id m25mr9302784lfj.139.1490096137734;
	Tue, 21 Mar 2017 04:35:37 -0700 (PDT)
Received: from localhost.localdomain (staticline-31-182-60-238.toya.net.pl.
	[31.182.60.238]) by smtp.gmail.com with ESMTPSA id
	f28sm3516079lfi.52.2017.03.21.04.35.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Mar 2017 04:35:37 -0700 (PDT)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 12:35:04 +0100
Message-Id: <c0930a958726cf6c8bc5d2377de69af3b7462096.1490095649.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1490095649.git.maciej.borzecki@rndity.com>
References: <20170317144027.GA22297@linux.intel.com>
	<cover.1490095649.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1490095649.git.maciej.borzecki@rndity.com>
References: <cover.1490095649.git.maciej.borzecki@rndity.com>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v4 4/5] wic: selftest: do not assume bzImage kernel image
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
X-List-Received-Date: Tue, 21 Mar 2017 11:35:37 -0000

Instead of assuming that bzImage is available, query bitbake enviroment
for KERNEL_IMAGETYPE.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 224610c9d79467a5cb39e703854b76c55fd7e632..776e44aac450c545f2329332f5390f6ff1b261ac 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -228,7 +228,8 @@ class Wic(oeSelfTest):
     def test_sdimage_bootpart(self):
         """Test creation of sdimage-bootpart image"""
         cmd = "wic create sdimage-bootpart -e core-image-minimal -o %s" % self.resultdir
-        self.write_config('IMAGE_BOOT_FILES = "bzImage"\n')
+        kimgtype = get_bb_var('KERNEL_IMAGETYPE', 'core-image-minimal')
+        self.write_config('IMAGE_BOOT_FILES = "%s"\n' % kimgtype)
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
 
-- 
2.9.3


