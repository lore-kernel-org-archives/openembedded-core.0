Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2686678493
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 13:54:42 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id u207so8385979ywc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 06:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WlDZCEqo0iHi5NlQRIsf9FZ+e/U9LBcBA1Yjj7jDP6k=;
	b=N5fuHZ2C4FrtPQaxbdFo9f1CUp5TtqbKopYAI0atuUFj98NrX8luHWhBPfDLOOKnSz
	29LhB7X5c30a3jQ7d43rXgUoyOXu/xoAPk0gmx5KFS8U/4CB5L9yoyMdJFo6DoBS0Em5
	BCnYtn+a/A7NumCFR3bBoqGMklBTHYsKaylEzQKpbZ34cBjNsudWEHlozz0+EUmYIDx6
	6zG/+Q2tzMncn1NflYp5lnYEyxlGXlkqewIm+1gEQQosu5qTMUyJRba7x4o4eMtzZCD5
	cEWLQ57pCu6MfdLT61AHQ1+5KqahPmLKWINaPnc+Xf2bz8+seldPL/KZWspvJIEP9EFp
	N6cA==
X-Gm-Message-State: AIVw11361EEP/eVQpMJYycVUSor7TpuM+e4E1egSk8IWytOuN1D7BzGK
	Un2EhPJ07t/AaXVK
X-Received: by 10.129.112.150 with SMTP id l144mr6416167ywc.272.1501250083346; 
	Fri, 28 Jul 2017 06:54:43 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-0-58.ec.res.rr.com.
	[174.106.0.58]) by smtp.gmail.com with ESMTPSA id
	p127sm7984263ywf.46.2017.07.28.06.54.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Jul 2017 06:54:41 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jul 2017 09:55:56 -0400
Message-Id: <1501250158-32429-3-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1501250158-32429-1-git-send-email-trini@konsulko.com>
References: <1501250158-32429-1-git-send-email-trini@konsulko.com>
Subject: [PATCHv3 3/5] imagefeatures: Extend test_bmap to validate gzip
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
X-List-Received-Date: Fri, 28 Jul 2017 13:54:42 -0000

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


