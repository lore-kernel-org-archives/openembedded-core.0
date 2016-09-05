Return-Path: <joshuagloe@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id A73DC772FE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 20:33:15 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id gi6so91241pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 13:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=+9TwfdLOFLbdisBv3sHqy5N1yPeRnJ1dLlqiDAX/fMA=;
	b=jeCR1wSV3DknVgiNOqPRXJf+5Etm9cnmyO5c5rBLqOFDcXo7szwrfZic1aK27PU6nQ
	WWxMuQjVUzCMz36BQd6M9P+Wak8erSMhZdGDJWNm1NAKk45DljJZtcmjmtRlNEDfo++C
	vpKTP+sIFXX8SyL9mx5RZyr5CiMA6aByBQFyltj8q5OCvCqEVLBGpUTsq12HCkA176Nl
	RBnk7/LMHzT7VY9K5pOjv+TZ88ZfpUcFpuFpyJUF29A7/p615e3ugKApEoCY9wQGQjeV
	OxjzHeTh+Qv65shls304dSvNPA1KdvblYqL/wGuN79KKYOdXEdxCB3IumOVcdZ2DW99L
	Qm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=+9TwfdLOFLbdisBv3sHqy5N1yPeRnJ1dLlqiDAX/fMA=;
	b=Q96z19dx5biy/VWTfk0KWTASuzsWdgL9coFLGXwLqSpkfqxVwwo82WaavPWXEmRoYj
	DTGinwd4GHlVsdFzR9es1XQvOL6WtCvep6yM8LSXekxEybR+AYqHkhy+uOzL+YXMaVtK
	Uvy28Fc2qYFcYWxKVpVbrwApGQJEB3H8hnsuHT51Cbl0Rj7csiQ3H7vIUBHMOl4Kq7hb
	vsa41Wir47EuuQ7dKet6J2K0nNAzz+BUDhoeX0SgoFWtQVor/xiuPvxG+PfbaQVTecOE
	B42zrYS5JZfw0iVG+iWyLiCJxWZd/o93XMK3HLcv1nU9IX4BIUi7YtNzwS6silIWnizh
	fdOg==
X-Gm-Message-State: AE9vXwPxLYGm727thn7syaNtW2vyCM9iUB/LIL+Cn+GiUMhFTLv1UjlNETp7xxfejFMDcQ==
X-Received: by 10.66.126.131 with SMTP id my3mr59130462pab.115.1473107595786; 
	Mon, 05 Sep 2016 13:33:15 -0700 (PDT)
Received: from jlock-mobl1.ger.corp.intel.com ([192.55.54.43])
	by smtp.gmail.com with ESMTPSA id
	m24sm35402875pfi.34.2016.09.05.13.33.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 13:33:15 -0700 (PDT)
From: Joshua Lock <joshuagloe@gmail.com>
X-Google-Original-From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2016 21:32:56 +0100
Message-Id: <aecb8a92ded48d38ee5a8b56d763241c04a4f8d9.1473107499.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1473107499.git.joshua.g.lock@intel.com>
References: <cover.1473107499.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1473107499.git.joshua.g.lock@intel.com>
References: <cover.1473107499.git.joshua.g.lock@intel.com>
Subject: [PATCH v2 2/3] runqemu: assume artefacts are relative to *.qemuboot.conf
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
X-List-Received-Date: Mon, 05 Sep 2016 20:33:15 -0000

When runqemu is started with a *.qemuboot.conf arg assume that image
artefacts are relative to that file, rather than in whatever
directory the DEPLOY_DIR_IMAGE variable in the conf file points to.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/runqemu | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 72c6352..6ad0ec0 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -143,6 +143,7 @@ class BaseConfig(object):
         self.nfs_server = ''
         self.rootfs = ''
         self.qemuboot = ''
+        self.qbconfload = False
         self.kernel = ''
         self.kernel_cmdline = ''
         self.kernel_cmdline_script = ''
@@ -239,6 +240,7 @@ class BaseConfig(object):
         """
         if p.endswith('.qemuboot.conf'):
             self.qemuboot = p
+            self.qbconfload = True
         elif re.search('\.bin$', p) or re.search('bzImage', p) or \
              re.search('zImage', p) or re.search('vmlinux', p) or \
              re.search('fitImage', p) or re.search('uImage', p):
@@ -250,7 +252,8 @@ class BaseConfig(object):
             if m:
                 qb = '%s%s' % (re.sub('\.rootfs$', '', m.group(1)), '.qemuboot.conf')
                 if os.path.exists(qb):
-                    self.qemuboot = qb 
+                    self.qemuboot = qb
+                    self.qbconfload = True
                 else:
                     logger.warn("%s doesn't exist" % qb)
                 fst = m.group(2)
@@ -533,6 +536,7 @@ class BaseConfig(object):
                 qbs = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
                 if qbs:
                     self.qemuboot = qbs.split()[0]
+                    self.qbconfload = True
 
         if not os.path.exists(self.qemuboot):
             raise Exception("Failed to find <image>.qemuboot.conf!")
@@ -545,6 +549,15 @@ class BaseConfig(object):
             k_upper = k.upper()
             self.set(k_upper, v)
 
+        # When we're started with a *.qemuboot.conf arg assume that image
+        # artefacts are relative to that file, rather than in whatever
+        # directory DEPLOY_DIR_IMAGE in the conf file points to.
+        if self.qbconfload:
+            imgdir = os.path.dirname(self.qemuboot)
+            if imgdir != self.get('DEPLOY_DIR_IMAGE'):
+                logger.info('Setting DEPLOY_DIR_IMAGE to folder containing %s (%s)' % (self.qemuboot, imgdir))
+                self.set('DEPLOY_DIR_IMAGE', imgdir)
+
     def print_config(self):
         logger.info('Continuing with the following parameters:\n')
         if not self.fstype in self.vmtypes:
-- 
2.7.4


