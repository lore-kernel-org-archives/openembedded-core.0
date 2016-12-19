Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 82899731D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:21:33 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id c13so51760159lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=uqpoedMUmJFtNh62pRdsXgTX4u0djt+xubZ329EQoDI=;
	b=WM4RYwacChgvFUjYThTwoa35agd7eZsv0aFNbWnZtmurPwmy1XFB6zZnOb+PX0TVar
	kMz2vhIycClqLVJjN1RLp2uoHWIO77wgLDb4JPzvj5XCWSAinCDXAeok8ncJAH7M+Dy9
	uSjjrlKj8uhPIsg/bBh13m/TCuWUxgB+f/qx70W+86U2IkjBTuE3ST7nC7yvLU2VWE3/
	du81YBVtRfnA+57LE7FHoCwzehvEj2/eIjuhdQ+iBDRjAxjwJhNMHzoNitdXKRjMTf2p
	AMYFzfnOEHqgEHI2Cbs1QaakixcccaYRbWYm3bsEQ20Q6jxeS2ubCFPogMeMaAnXhtKp
	sC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=uqpoedMUmJFtNh62pRdsXgTX4u0djt+xubZ329EQoDI=;
	b=s3nQEkLj/4rHYPIP/McIWbAplfjdxg0QwT73Du8Psb0L1vmDFWDeB6n6z2f576W0i4
	XA/gnrph5C+as/RIsRjX/1YGE58J11YGFgZi97mutx844rln21AXdTAc8K6pmP1phTNo
	QJWm+7PtW+TatN4P0bgwbPcprCygipSimL5o0lUAamQZEw90rJoAW7whs5h0eRSkM2xw
	U1UJ6Edn/QBW4fEX5NNsq97tKKMHmN27X0GiqqqJPA6SF/RWp0vWb58VGjhUs0XYAkkN
	QyHeasZzEx2CJZj4lH+fiTlMvXB5tCocrewav1chDsPSDS3FEgLubI1uoHHOZ/a4XnND
	cK4w==
X-Gm-Message-State: AIkVDXJMVdj7eL9BKE6AmhkTO31EukUudQq79sEMMgihKYt3MUHJKe2hINVC6X73UC5b9w==
X-Received: by 10.46.75.10 with SMTP id y10mr7013132lja.65.1482146494172;
	Mon, 19 Dec 2016 03:21:34 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id c2sm3681892ljb.8.2016.12.19.03.21.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Dec 2016 03:21:33 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 12:21:00 +0100
Message-Id: <fec83e65d72dab3738425c59c8ac57afcfe67cc8.1482145354.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1482145354.git.maciej.borzecki@rndity.com>
References: <20161213185317.GA6550@linux.intel.com>
	<cover.1482145354.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1482145354.git.maciej.borzecki@rndity.com>
References: <cover.1482145354.git.maciej.borzecki@rndity.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v6 4/5] wic: selftest: do not assume bzImage kernel image
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
X-List-Received-Date: Mon, 19 Dec 2016 11:21:33 -0000

Instead of assuming that bzImage is available, query bitbake enviroment
for KERNEL_IMAGETYPE.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 35cd14fb0c4a9b863a7a6324885f80da8e86d3eb..8efece3171db47ee622f2c0f712fff2c2fcf645b 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -339,7 +339,8 @@ class Wic(oeSelfTest):
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
2.5.5


