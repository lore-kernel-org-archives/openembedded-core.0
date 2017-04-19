Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id A6ED16093E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 16:43:20 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id d131so4122769qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 09:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=dLzr13DfVU1FKfhpiyTNa8nUWyhw/RqSb17Jy9NcWOg=;
	b=Zesr5wCWr+R+zYnC4euggM3i15/+mWG/5Iuy9UhXRk3cWMUW3eW0FxcujeWQABYwsB
	Dop28KWE4g9eQZfKBsHij4aD6Ov+H9VveCtmw9rncYZO7dY0g117MhVdJ3kEvI34YX6l
	RiWXAwFA2T88xqsK61PJM5p0IL66A8o8vDUhs8l5o6qUlI2I9o6MZfcvKWOI47vXv5O2
	59YapIMVohGaEObx9OeJ7B/xYpLPpNCobYnzPYU4RZb4EarxIQNJghrwJA8ufnY64cpx
	hE4GomH7xOusO2GVvp8Ot3yNGxWc1HI8UzjgxpJ8RrtVxcJeLOrFfaWQOrk3IzTje/0T
	aN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=dLzr13DfVU1FKfhpiyTNa8nUWyhw/RqSb17Jy9NcWOg=;
	b=VUV0rY4lAa64sjo/b/yiS3DoHanlD1dI4IwSla1gYFnn7acc0yUma9vlbN8SrvJ0nD
	q8RYhoVhRhNzGvl7XlMt7DtLldgRA3hu9Vl7jC1DZx0Muu5ejhjeiR06GvUcaC0k9B7P
	/qcDNU6kwtVmZq56APWmL1OMcIWtWP4SJqbhmNQ0Ei70mBHe86aycJNtlPhRLxeM7JQD
	nLLuIxa236Wq31o1ieEs3dSPwNYLvYnqlIuEHr8F9F1dLxd21QXPuW0FWIbXBN8LPzfc
	eTzOYoTJWI9+6Cxp5/kgMyLKeAtTyqmmZHUyTx57WpdhV2PfCLuepIm2kh1/I1WDBTor
	PV/w==
X-Gm-Message-State: AN3rC/4k/iPOKBw7VO0ctKYDS7+/0Spbt8R3ptgdYxwFVK9lvGPEaU+h
	QdmT3Op2JAj/U1eO
X-Received: by 10.55.42.225 with SMTP id q94mr2279142qkq.178.1492620201093;
	Wed, 19 Apr 2017 09:43:21 -0700 (PDT)
Received: from centrium.lab.ossystems ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	o190sm2203171qkc.65.2017.04.19.09.43.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Apr 2017 09:43:19 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 13:42:47 -0300
Message-Id: <20170419164247.32023-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] wic: Add option to not change fstab
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
X-List-Received-Date: Wed, 19 Apr 2017 16:43:21 -0000

Create an option to wic doesn't change fstab file, the final
fstab file will be same that in rootfs and wic doesn't update
file, e.g adding a new mount point.

Users can control the fstab file content in base-files recipe.
This is useful if you want to only create an partition but not
add fstab mount point or add new mount point using label e.g:

LABEL=recovery /recovery auto defaults 0  1

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 scripts/lib/wic/help.py                  | 7 ++++++-
 scripts/lib/wic/plugins/imager/direct.py | 6 +++++-
 scripts/wic                              | 2 ++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index aee2451a72..1112192c6c 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -154,7 +154,7 @@ SYNOPSIS
         [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
         [-r, --rootfs-dir] [-b, --bootimg-dir]
         [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
-        [-c, --compress-with] [-m, --bmap]
+        [-c, --compress-with] [-m, --bmap] [--no-fstab-update]
 
 DESCRIPTION
     This command creates an OpenEmbedded image based on the 'OE
@@ -226,6 +226,11 @@ DESCRIPTION
 
     The -m option is used to produce .bmap file for the image. This file
     can be used to flash image using bmaptool utility.
+
+    The --no-fstab-update option is used to doesn't change fstab file. When
+    using this option the final fstab file will be same that in rootfs and
+    wic doesn't update file, e.g adding a new mount point. User can control
+    the fstab file content in base-files recipe.
 """
 
 wic_list_usage = """
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index f2e6127331..a5afec9a14 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -68,6 +68,7 @@ class DirectPlugin(ImagerPlugin):
         self.outdir = options.outdir
         self.compressor = options.compressor
         self.bmap = options.bmap
+        self.no_fstab_update = options.no_fstab_update
 
         self.name = "%s-%s" % (os.path.splitext(os.path.basename(wks_file))[0],
                                strftime("%Y%m%d%H%M"))
@@ -156,7 +157,10 @@ class DirectPlugin(ImagerPlugin):
         filesystems from the artifacts directly and combine them into
         a partitioned image.
         """
-        fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
+        if self.no_fstab_update:
+            fstab_path = None
+        else:
+            fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
         for part in self.parts:
             # get rootfs size from bitbake variable if it's not set in .ks file
diff --git a/scripts/wic b/scripts/wic
index a5f2dbfc6f..5907098b3a 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -133,6 +133,8 @@ def wic_create_subcommand(args, usage_str):
                       dest='compressor',
                       help="compress image with specified compressor")
     parser.add_option("-m", "--bmap", action="store_true", help="generate .bmap")
+    parser.add_option("", "--no-fstab-update" ,action="store_true",
+                      help="Do not change fstab file.")
     parser.add_option("-v", "--vars", dest='vars_dir',
                       help="directory with <image>.env files that store "
                            "bitbake variables")
-- 
2.11.0


