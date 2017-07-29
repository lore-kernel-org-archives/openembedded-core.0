Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id B5C8178590
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 00:13:17 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id u207so9200631ywc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 17:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WlDZCEqo0iHi5NlQRIsf9FZ+e/U9LBcBA1Yjj7jDP6k=;
	b=Hy+V6lliq7a7Q2rrtNnFXv5s5ZQXQQ8qKm698Y5YiI4ZGIT/PQOTrZLpKxF3G1QQd4
	/igW4/+JZWu24+uXg+VU96yEy2VsEKHnnESAj7//Cl7QhfnD4V8CVvmX5mGlVHJWXtHa
	SsgC00ON0OCUXwKGcJVy05PP85+QXUoxqDHRddqB1axy/hC2m5GrSkX9hPQV7coAb6hg
	B51oNxfjj9EmkJwcxTLFeCnRdCMEzSWZBtQog4SW5ojP1QyP0MywBdvwRaAF/5jAUUMw
	045rITdrYreE4+14f/Tcc7atq+SVvIfoEOenopxevRYaeI9lG/+W1KTIFenfTsItSFk9
	hDWg==
X-Gm-Message-State: AIVw111NgT+pAMa1Ug/CK7Kma1NORWxnJ5FnDsAT3C/+/0MJHxb2ucU3
	N/mLcUubp/NFVthn
X-Received: by 10.37.188.76 with SMTP id d12mr7867422ybk.193.1501287199061;
	Fri, 28 Jul 2017 17:13:19 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-0-58.ec.res.rr.com.
	[174.106.0.58])
	by smtp.gmail.com with ESMTPSA id l7sm8368499ywl.92.2017.07.28.17.13.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Jul 2017 17:13:18 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jul 2017 20:14:34 -0400
Message-Id: <1501287276-28699-3-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1501287276-28699-1-git-send-email-trini@konsulko.com>
References: <1501287276-28699-1-git-send-email-trini@konsulko.com>
Subject: [PATCHv4 3/5] imagefeatures: Extend test_bmap to validate gzip
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
X-List-Received-Date: Sat, 29 Jul 2017 00:13:18 -0000

We extend the existing test_bmap test to also produce an ext4.bmap.gz
file and then have gzip confirm that it contains valid gzip data.  This
tests that we are able to chain at least 2 CONVERSION_CMDs together.

Cc: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
Changes in v2: New patch
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 91d8e9b5017c..dac74ba72b37 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -106,7 +106,7 @@ class ImageFeatures(OESelftestTestCase):
         Author:      Ed Bartosh <ed.bartosh@linux.intel.com>
         """
 
-        features = 'IMAGE_FSTYPES += " ext4 ext4.bmap"'
+        features = 'IMAGE_FSTYPES += " ext4 ext4.bmap ext4.bmap.gz"'
         self.write_config(features)
 
         image_name = 'core-image-minimal'
@@ -116,15 +116,21 @@ class ImageFeatures(OESelftestTestCase):
         link_name = get_bb_var('IMAGE_LINK_NAME', image_name)
         image_path = os.path.join(deploy_dir_image, "%s.ext4" % link_name)
         bmap_path = "%s.bmap" % image_path
+        gzip_path = "%s.gz" % bmap_path
 
-        # check if result image and bmap file are in deploy directory
+        # check if result image, bmap and bmap.gz files are in deploy directory
         self.assertTrue(os.path.exists(image_path))
         self.assertTrue(os.path.exists(bmap_path))
+        self.assertTrue(os.path.exists(gzip_path))
 
         # check if result image is sparse
         image_stat = os.stat(image_path)
         self.assertTrue(image_stat.st_size > image_stat.st_blocks * 512)
 
+        # check if the resulting gzip is valid
+        self.assertTrue(runCmd('gzip -t %s' % gzip_path))
+
+
     def test_image_fstypes(self):
         """
         Summary:     Check if image of supported image fstypes can be built
-- 
1.9.1


