Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 23BE4605B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 13:10:50 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vALDAooH017583
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 21 Nov 2017 13:10:51 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eH8KA-0004Tq-0q; Tue, 21 Nov 2017 13:10:50 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Nov 2017 13:10:46 +0000
Message-Id: <1511269847-17161-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511269847-17161-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1511269847-17161-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 5/6] qemuboot: Improve relative path handling
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
X-List-Received-Date: Tue, 21 Nov 2017 13:10:51 -0000

qemuconf files are currently written relative to TOPDIR. What
makes more sense is to write paths relative to the location of the
file. This makes moving them around and decoding the end paths in
runqemu much easier.

The effect of this should allow less use of bitbake to determine
variables and allow us to simplify runqemu.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/qemuboot.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 7243cc5..15a9e63 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -85,7 +85,8 @@ python do_write_qemuboot_conf() {
 
     qemuboot = "%s/%s.qemuboot.conf" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_NAME'))
     qemuboot_link = "%s/%s.qemuboot.conf" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_LINK_NAME'))
-    topdir="%s/"%(d.getVar('TOPDIR')).replace("//","/")
+    finalpath = d.getVar("DEPLOY_DIR_IMAGE")
+    topdir = d.getVar('TOPDIR')
     cf = configparser.ConfigParser()
     cf.add_section('config_bsp')
     for k in sorted(qemuboot_vars(d)):
@@ -98,7 +99,8 @@ python do_write_qemuboot_conf() {
             val = d.getVar(k)
         # we only want to write out relative paths so that we can relocate images
         # and still run them
-        val=val.replace(topdir,"")
+        if val.startswith(topdir):
+            val = os.path.relpath(val, finalpath)
         cf.set('config_bsp', k, '%s' % val)
 
     # QB_DEFAULT_KERNEL's value of KERNEL_IMAGETYPE is the name of a symlink
@@ -108,7 +110,7 @@ python do_write_qemuboot_conf() {
     kernel = os.path.realpath(kernel_link)
     # we only want to write out relative paths so that we can relocate images
     # and still run them
-    kernel=kernel.replace(topdir,"")
+    kernel = os.path.relpath(kernel, finalpath)
     cf.set('config_bsp', 'QB_DEFAULT_KERNEL', kernel)
 
     bb.utils.mkdirhier(os.path.dirname(qemuboot))
-- 
2.7.4


