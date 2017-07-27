Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0F9C0780E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 02:04:57 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id u207so5749421ywc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 19:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cQ+6UkpqDmqwiF7GLt6RyN8VveooJWoutlmicAks+9U=;
	b=GydTDBwY0V2gLzG2fpQHJadA3ZfxDNhGyKuuDwR3te/9IU0wwRUC2EmwCGgNH1ZH3w
	UapTJ/5FIoXbyqhq6fTNNJ8lidUERyW1RW4tnw8cUKLcoxzy3UHRRzdWQNZemJn6odkJ
	LnngArPCqC9IGMSaB3ZzfQAwXq5MoUR3szA/XHCWVpdFSyjyToHCWXu6jO+c5z5pRLPD
	9DGWG7QJeA1K6vXae8acIkV/Bi0Aer1ITY7XSoOAe9L/WoL1E7WcyuGly8uWqVCRlI3/
	70Snu2cnxOI78bfn6iKqS4ujKpLFfxi/OmdYQwpYfuTxZVUe4IYGeFbM78534/HnlG30
	nQ9w==
X-Gm-Message-State: AIVw113q/V7f7RO3tQsBKV9lwYlu57NR7fFlLjG6NthwurWzE7RgT/Ea
	nuy1/40KzYFyOWg0
X-Received: by 10.129.69.34 with SMTP id s34mr2624993ywa.150.1501121099147;
	Wed, 26 Jul 2017 19:04:59 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-0-58.ec.res.rr.com.
	[174.106.0.58]) by smtp.gmail.com with ESMTPSA id
	p190sm6479575ywd.81.2017.07.26.19.04.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jul 2017 19:04:58 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jul 2017 22:06:12 -0400
Message-Id: <1501121173-29658-4-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1501121173-29658-1-git-send-email-trini@konsulko.com>
References: <1501121173-29658-1-git-send-email-trini@konsulko.com>
Subject: [PATCHv2 4/5] imagefeatures: Add a test for many CONVERSION_CMDs being chained
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
X-List-Received-Date: Thu, 27 Jul 2017 02:04:58 -0000

Add a new test to create a long (and not otherwise useful) image,
ext4.bmap.gz.bz2.lzo.xz.u-boot and also the sha256sum of it.  Check that
the resulting sha256sum is valid.

Cc: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
Changes in v2: New patch
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index dac74ba72b37..2c59ef6490b3 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -130,6 +130,36 @@ class ImageFeatures(OESelftestTestCase):
         # check if the resulting gzip is valid
         self.assertTrue(runCmd('gzip -t %s' % gzip_path))
 
+    def test_long_chain_conversion(self):
+        """
+        Summary:     Check for chaining many CONVERSION_CMDs together
+        Expected:    1. core-image-minimal can be built with
+                        ext4.bmap.gz.bz2.lzo.xz.u-boot and also create a
+                        sha256sum
+                     2. The above image has a valid sha256sum
+        Product:     oe-core
+        Author:      Tom Rini <trini@konsulko.com>
+        """
+
+        conv = "ext4.bmap.gz.bz2.lzo.xz.u-boot"
+        features = 'IMAGE_FSTYPES += "%s %s.sha256sum"' % (conv, conv)
+        self.write_config(features)
+
+        image_name = 'core-image-minimal'
+        bitbake(image_name)
+
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        link_name = get_bb_var('IMAGE_LINK_NAME', image_name)
+        image_path = os.path.join(deploy_dir_image, "%s.%s" %
+                                  (link_name, conv))
+
+        # check if resulting image is in the deploy directory
+        self.assertTrue(os.path.exists(image_path))
+        self.assertTrue(os.path.exists(image_path + ".sha256sum"))
+
+        # check if the resulting sha256sum agrees
+        self.assertTrue(runCmd('cd %s;sha256sum -c %s.%s.sha256sum' %
+                               (deploy_dir_image, link_name, conv)))
 
     def test_image_fstypes(self):
         """
-- 
1.9.1


