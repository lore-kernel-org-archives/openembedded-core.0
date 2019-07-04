Return-Path: <zhangzl2013@126.com>
X-Greylist: delayed 1814 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 04 Jul 2019 11:02:05 UTC
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
	by mail.openembedded.org (Postfix) with ESMTP id 637BA7EB0A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 11:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=b6BMFlVg4y7CxY3oQe
	LWatcdbEummlx8ReIS6m+c4a8=; b=YTzNSyBvjgluTmwcoIUdwBLqczeLaLOkTB
	ht8F85t3Ioa13rXJhy9h8X90O14QiITA5MH06sbu/BlwQ0quAzGqDtOdU7P+ajWZ
	VpFc615nuHydudUkbuRNFsvmZOkZqEgzCFq+yG756Ad2kJaU9Sn3FS+xOQF/npwY
	vpf2nIhrU=
Received: from pek-zhang3-d1.corp.ad.wrs.com (unknown [60.247.85.82])
	by smtp8 (Coremail) with SMTP id NORpCgC3hSyS1R1doNgAEQ--.43S2;
	Thu, 04 Jul 2019 18:31:50 +0800 (CST)
From: Zhaolong Zhang <zhangzl2013@126.com>
To: openembedded-core@lists.openembedded.org,
	zhangzl2013@126.com
Date: Thu,  4 Jul 2019 18:29:43 +0800
Message-Id: <1562236183-6069-1-git-send-email-zhangzl2013@126.com>
X-Mailer: git-send-email 1.9.1
X-CM-TRANSID: NORpCgC3hSyS1R1doNgAEQ--.43S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4fGrWrXr4UWF47Xr13urg_yoW8ZF1DpF
	WxGr1xWFW7JFWxGas3A3WUuFWUKw1kWa4agrsagr18urW5Kw10qF48Kr1093W7KFsIq347
	tF45ZF9Fgw4qga7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2_MfUUUUU=
X-Originating-IP: [60.247.85.82]
X-CM-SenderInfo: x2kd0wt2osiiat6rjloofrz/1tbitBbnz1pD9fYqOwAAsB
Subject: [PATCH] kernel-yocto: checksum indirect cfg and scc files
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
X-List-Received-Date: Thu, 04 Jul 2019 11:02:06 -0000

Currently, Yocto can not realize the modification of the cfg/scc files indirectly
introduced by scc files in custom layers.

Instead of introducing complicated scc parser code, this patch walks though
FILESEXTRAPATHS and takes all the cfg/scc files into account when calculating
checksums.

Signed-off-by: Zhaolong Zhang <zhangzl2013@126.com>
---
 meta/classes/kernel-yocto.bbclass | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index ed9bcfa57c..a9aac8a9d9 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -69,6 +69,24 @@ def get_machine_branch(d, default):
 	    
     return default
 
+def get_files_in_filesextrapaths(d):
+    extrapaths = []
+    extrafiles = []
+    extrapathsvalue = (d.getVar("FILESEXTRAPATHS") or "")
+    # Remove default flag which was used for checking
+    extrapathsvalue = extrapathsvalue.replace("__default:", "")
+    extrapaths = extrapathsvalue.split(":")
+    for path in extrapaths:
+        for root, dirs, files in os.walk(path):
+            for name in files:
+                base, ext = os.path.splitext(name)
+                if ext and ext in [".scc", ".cfg"]:
+                    filepath = os.path.join(root, name)
+                    extrafiles.append(filepath + ":" + str(os.path.exists(filepath)))
+    return " ".join(extrafiles)
+
+
+
 do_kernel_metadata() {
 	set +e
 	cd ${S}
@@ -296,6 +314,7 @@ do_kernel_checkout[dirs] = "${S}"
 addtask kernel_checkout before do_kernel_metadata after do_unpack
 addtask kernel_metadata after do_validate_branches do_unpack before do_patch
 do_kernel_metadata[depends] = "kern-tools-native:do_populate_sysroot"
+do_kernel_metadata[file-checksums] = " ${@get_files_in_filesextrapaths(d)}"
 do_validate_branches[depends] = "kern-tools-native:do_populate_sysroot"
 
 do_kernel_configme[depends] += "virtual/${TARGET_PREFIX}binutils:do_populate_sysroot"
-- 
2.19.1


