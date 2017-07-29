Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 39AF978597
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 00:13:18 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id u207so9200662ywc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 17:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cQ+6UkpqDmqwiF7GLt6RyN8VveooJWoutlmicAks+9U=;
	b=mEqSrRfUwgKiGw2+AuDJjj2a1ssn3TLV9dLfHdWlrqM0v77jfstitM9koFh4+xaPuF
	QvQf/kk57T2y0CwpaIGrUiKNh4M+HOqAiH3rWQpaSGL04fpOgrPFchWIrpWdnREYqqk+
	yM1IEn2E/JQ7dTPIygrBEHAAmybDRY21HrHw80KXUFE7d1QSoZRn3VSeQIJGsgcAnroE
	zzTYdic/xSFNAF9OH2LDvu2lNEOE4TljJmp5N1VxEjq6AECfj4Q/2IotTwXBZHSPmK9i
	XKgQUHzxCDgMDimeYl5AhKO01Nyutc8I7GsHqWP/Xw433gmODrgFYGadMjJTLF4rWt3q
	JonA==
X-Gm-Message-State: AIVw110QzUJFLTVSwz7dHeAaeFus55lAcquxmsbDfRFv6N4oy/wWCiVE
	qA/iJLLWGpmws4Ge
X-Received: by 10.37.123.2 with SMTP id w2mr7700822ybc.3.1501287200076;
	Fri, 28 Jul 2017 17:13:20 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-0-58.ec.res.rr.com.
	[174.106.0.58])
	by smtp.gmail.com with ESMTPSA id l7sm8368499ywl.92.2017.07.28.17.13.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Jul 2017 17:13:19 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jul 2017 20:14:35 -0400
Message-Id: <1501287276-28699-4-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1501287276-28699-1-git-send-email-trini@konsulko.com>
References: <1501287276-28699-1-git-send-email-trini@konsulko.com>
Subject: [PATCHv4 4/5] imagefeatures: Add a test for many CONVERSION_CMDs being chained
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
X-List-Received-Date: Sat, 29 Jul 2017 00:13:19 -0000

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


