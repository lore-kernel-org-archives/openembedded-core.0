Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web12.22984.1629721417007143908
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 05:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=Vm6w9pcY;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mI8zH-0003g0-Ih; Mon, 23 Aug 2021 14:23:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gM470QMjv5cfvkV2KzkBSP6jbQDXuE16GxE+RHhZBwY=; b=Vm6w9pcYFkdpgxdctLk/UnCBGt
	42ajDUXb00RqetCeAv6AfqoU3j1GqCvO7nTVeii9YAe6/YJJ4yEDskZJNhNiveRvdKQEcHydnSmlz
	nCMp/Xirk09oD5XGkUOCJ+030xqNI1wcbE1pXdLbusbk+k2attsJuffJuUOtAgKoN1QTfyiYwq6Rc
	A4kFVO7VHHNBNWXYWH5R1/ZWA/ooTkKX2JOruGnO29yoTcLI2URTMdsBFSBTLO0vHJzXVNTYx8VhY
	NJDbu/ImTpqVNzu09UR3FPYJVNJ5pgN0IES+JBNSwELbzPqT3ekSE9CLJVZyAF95yglT0SDTZ2e+E
	N5+pmuPQ==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.lan)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mI8zD-0005eF-Lo; Mon, 23 Aug 2021 14:23:33 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Cc: zboszor@gmail.com
Subject: [PATCH 2/6] kernel-module-split.bbclass: Support zstd-compressed modules
Date: Mon, 23 Aug 2021 14:23:19 +0200
Message-Id: <20210823122323.97400-3-zboszor@pr.hu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823122323.97400-1-zboszor@pr.hu>
References: <20210823122323.97400-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Scan-Signature: bac636d383641ecc82643dbc9c1f3bb5
X-Spam-Tracer: backend.mail.pr.hu -0.9 20210823122333Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zoltán Böszörményi <zboszor@gmail.com>

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes/kernel-module-split.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index b56dd4a9c7..6c1de4c992 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -44,17 +44,20 @@ python split_kernel_module_packages () {
     def extract_modinfo(file):
         import tempfile, subprocess
         tempfile.tempdir = d.getVar("WORKDIR")
-        compressed = re.match( r'.*\.([xg])z$', file)
+        compressed = re.match( r'.*\.(gz|xz|zst)$', file)
         tf = tempfile.mkstemp()
         tmpfile = tf[1]
         if compressed:
             tmpkofile = tmpfile + ".ko"
-            if compressed.group(1) == 'g':
+            if compressed.group(1) == 'gz':
                 cmd = "gunzip -dc %s > %s" % (file, tmpkofile)
                 subprocess.check_call(cmd, shell=True)
-            elif compressed.group(1) == 'x':
+            elif compressed.group(1) == 'xz':
                 cmd = "xz -dc %s > %s" % (file, tmpkofile)
                 subprocess.check_call(cmd, shell=True)
+            elif compressed.group(1) == 'zst':
+                cmd = "zstd -dc %s > %s" % (file, tmpkofile)
+                subprocess.check_call(cmd, shell=True)
             else:
                 msg = "Cannot decompress '%s'" % file
                 raise msg
@@ -153,7 +156,7 @@ python split_kernel_module_packages () {
     kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME") or "kernel"
     kernel_version = d.getVar("KERNEL_VERSION")
 
-    module_regex = r'^(.*)\.k?o(?:\.[xg]z)?$'
+    module_regex = r'^(.*)\.k?o(?:\.(gz|xz|zst))?$'
 
     module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
     module_pattern_suffix = d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
-- 
2.31.1

