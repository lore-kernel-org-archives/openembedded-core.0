Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16908716D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 10:46:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9DAkhM4006413
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Oct 2014 03:46:43 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 13 Oct 2014 03:46:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<tom.zanussi@linux.intel.com>
Date: Mon, 13 Oct 2014 18:46:34 +0800
Message-ID: <9f5aaf46212e253ed141fb5a23bc348e419604f4.1413196789.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1413196789.git.hongxu.jia@windriver.com>
References: <cover.1413196789.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] wic/bootimg-pcbios.py: checking the existance of syslinux
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
X-List-Received-Date: Mon, 13 Oct 2014 10:46:59 -0000
Content-Type: text/plain

While syslinux not existed in $bootimg_dir, there was a error:

$ wic create directdisk -e core-image-minimal
...
|Creating image(s)...
|Error: exec_cmd: install -m 444 /home/jiahongxu/yocto/
build-20141010-yocto/tmp/deploy/images/qemux86-64/syslinux/
ldlinux.sys /var/tmp/wic/build/hdd/boot/ldlinux.sys
returned '1' instead of 0
...

Add checking for the existance of syslinux to fix this issue.
If syslinux didn't exist in anywhere, prompt user to build it.

[YOCTO #6826]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index aceed20..6057bab 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -127,10 +127,19 @@ class BootimgPcbiosPlugin(SourcePlugin):
         'prepares' the partition to be incorporated into the image.
         In this case, prepare content for legacy bios boot partition.
         """
-        if not bootimg_dir:
+        def _has_syslinux(dir):
+            if dir:
+                syslinux = "%s/syslinux" % dir
+                if os.path.exists(syslinux):
+                    return True
+            return False
+
+        if not _has_syslinux(bootimg_dir):
             bootimg_dir = get_bitbake_var("STAGING_DATADIR")
             if not bootimg_dir:
                 msger.error("Couldn't find STAGING_DATADIR, exiting\n")
+            if not _has_syslinux(bootimg_dir):
+                msger.error("Please build syslinux first\n")
             # just so the result notes display it
             cr.set_bootimg_dir(bootimg_dir)
 
-- 
1.9.1


