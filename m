Return-Path: <joshuagloe@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id EE70D773B5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 13:59:33 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id g202so9863803pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 06:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=W8dBtCd+sFu/QKmh6pjdHCm+bnNCmSP+HCDejzSvve8=;
	b=fWSVudWGMuVvpKxedXutji15K/ei8FGZhEzwmbQW+KT1Jq6+tJa8F08BhaZ84t97x+
	PScB4X7Ox920t52Z/N9A9miKHv6hirWaxB4apWg/7FHz3Jz37ifujo8xYJ1G1geBzUKO
	CnBvQAFfS9CjFWYt7QeBRVxMZTe2hFg/zp2zaf8LQ5ogbgIB3bQO2NYsLLlzAIod5oR1
	WuTcj5ZcYvk4ocltUEZaTEKvJ7OTfCz0dS01uz5wxDrPUcW57P0pwCzbHFXJjlu7MhWp
	Psot2hnu6W5l6yiZMUX1nJzxpW0m26LlHag9EFBn8DGt7SlSWG/aJ1yu+rf3jSNKGJQc
	82sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=W8dBtCd+sFu/QKmh6pjdHCm+bnNCmSP+HCDejzSvve8=;
	b=ljWeQrRVulVfCQWYlASMWFHtkkjko0eyFkaWnp7GH8FvTGpIgQuDHPz7hqgVYRkDTS
	+sNMuJRZn/OVJ9qTQMOymqbAXw/yo900CnQaco2Q6U7SKDyKbiHbvXXE4z6pN7y6BRYj
	VuBTa2BYzgAlou19khg8wQ3n/hm3FrreJwcqOhc9+RkR6sFQ6jXQjuCMDzyKZPK4d7H4
	N82dl8wdl7/TyB61k1iGRMWcEgEKXtz/xjJbhxp0wqn6S6RcjVOfK7rEWQcmfkLSSQmq
	Os/MtO6wjinKtVzwTJuDdrk2YUF9LYEQN3tXrPtOiH7FkpPkjgrdMpm2uNUER1KfXAyd
	qutQ==
X-Gm-Message-State: AE9vXwPb8diY7cXYRTOPZwnp0UR/X0P/hYChXr0M8nDagR3d3HAXV8J/xpsj6WxE5AZBwA==
X-Received: by 10.98.200.81 with SMTP id z78mr27129340pff.2.1473083974452;
	Mon, 05 Sep 2016 06:59:34 -0700 (PDT)
Received: from jlock-mobl1.ger.corp.intel.com ([192.55.54.42])
	by smtp.gmail.com with ESMTPSA id
	u1sm33982460pfu.12.2016.09.05.06.59.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 06:59:33 -0700 (PDT)
From: Joshua Lock <joshuagloe@gmail.com>
X-Google-Original-From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2016 14:59:11 +0100
Message-Id: <a3afe52f17b6fb3b698201ae72743c6ef9e78b3a.1473083836.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1473083836.git.joshua.g.lock@intel.com>
References: <cover.1473083836.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1473083836.git.joshua.g.lock@intel.com>
References: <cover.1473083836.git.joshua.g.lock@intel.com>
Subject: [PATCH 3/4] runqemu: assume artefacts are relative to *.qemuboot.conf
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
X-List-Received-Date: Mon, 05 Sep 2016 13:59:34 -0000

When runqemu is started with a *.qemuboot.conf arg assume that image
artefacts are relative to that file, rather than in whatever
directory the DEPLOY_DIR_IMAGE variable in the conf file points to.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/runqemu | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 1599848..cfe7bff 100755
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
@@ -544,6 +546,15 @@ class BaseConfig(object):
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


