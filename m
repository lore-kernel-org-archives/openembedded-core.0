Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 501E47210C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 16:22:32 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id r10so3051885pdi.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 08:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=qjHGNcW5EQiWDYHlAUUNn4aXt6haHAfVs0ct+mLm4ro=;
	b=vDzanza6bOTTjiQFQnX/zGJdnzhgZIkWlDm/B7sBamXYTQ1JqBShSxAkmtTbX/KvLN
	Ekex+eQ4cp8r0l9j2pHFVare8ROVOV73ok0/dzoijws5hzfSM5Ym5386JiBHdKp60VaZ
	Ib8EusuxDzp9oeNMbV/4VXJTPz19Si4kLMqify00uHn18H/BqmxwFFTfp3eVb//xU6Tl
	+Y2uFsU0V0TSIVhK2OlkdINwOEhWWTVwKvAMzL52oo2Az1nUer7ffy+jYbn0m9A40yLl
	QHbtsgNT3cNh75H9wTLzGYqUcZidDuOreblTWeltuDM8vhxwdk0/tlOKmDhGQQbJbAIw
	tvqQ==
X-Received: by 10.70.37.4 with SMTP id u4mr33849340pdj.3.1417018953624;
	Wed, 26 Nov 2014 08:22:33 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id qn1sm4736673pdb.42.2014.11.26.08.22.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Nov 2014 08:22:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Nov 2014 08:22:09 -0800
Message-Id: <64433de26bee858e9355ef07389eea1de83b3ce7.1417018567.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <2446d3e01b365793ce2886985212bf800d14846e.1417018567.git.akuster808@gmail.com>
References: <2446d3e01b365793ce2886985212bf800d14846e.1417018567.git.akuster808@gmail.com>
In-Reply-To: <cover.1417018567.git.akuster808@gmail.com>
References: <cover.1417018567.git.akuster808@gmail.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 05/11] wic: Update bootimg-partition to use bootimg_dir
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
X-List-Received-Date: Wed, 26 Nov 2014 16:22:33 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

Update bootimg-partition to use bootimg_dir instead of img_deploy_dir,
to match similar usage in other plugins.

As mentioned elsewhere, plugins should use the passed-in value for
bootimg_dir directly if non-null, which corresponds to a user-assigned
value specified via a -b command-line param, and only fetch the value
from bitbake if that value is null.

(From OE-Core rev: 3822f8a7b33da56ecd9144b4bcae50734fb1af81)

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/wic/plugins/source/bootimg-partition.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index cc72b2f..abf2494 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -71,8 +71,13 @@ class BootimgPartitionPlugin(SourcePlugin):
         install_cmd = "install -d %s" % hdddir
         exec_cmd(install_cmd)
 
+        if not bootimg_dir:
+            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not bootimg_dir:
+                msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+
         msger.debug('Bootimg dir: %s' % bootimg_dir)
-        img_deploy_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+
         boot_files = get_bitbake_var("IMAGE_BOOT_FILES")
 
         if not boot_files:
@@ -93,7 +98,7 @@ class BootimgPartitionPlugin(SourcePlugin):
 
         for deploy_entry in deploy_files:
             src, dst = deploy_entry
-            src_path = os.path.join(img_deploy_dir, src)
+            src_path = os.path.join(bootimg_dir, src)
             dst_path = os.path.join(hdddir, dst)
 
             msger.debug('Install %s as %s' % (os.path.basename(src_path),
-- 
1.9.1


