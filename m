Return-Path: <joshuagloe@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 25FE1773B5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 13:59:36 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a143so6565686pfa.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 06:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=aDzRE89YvaEogL+ZLZTJiBERG5yg6t+0mEUETtlmZR8=;
	b=hb06MBT7pvUCbSycYNtGnqfwuuYK2o2rzY/iDDtRDkTyOj7tZoapI7TumSDNCbY8oO
	9x2r4mqbq5M/I2UTxDCHpbPpdx6hqxnjkA/werzgFMxKqo41bz81xCGRAxjCiShbNN17
	DQW4cdgyjDW2rFW+JpCL9Mt5yGnEdzRxxUPmIkseTtxTE2jN8mwUD9+dstizJyRyAonC
	YDgEZ+PSkyIV26LoccOlRfC4Vn9qCbvAICBFZR5MEgxbaDjMNinBEbjaXfueWCZSRTYF
	dXTbT8zOOk8O38zqfbeKcunUDwsSgcp+gNOMAd8dUAqNnuXSZ779r6A6UJjdjsns0MLu
	bvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=aDzRE89YvaEogL+ZLZTJiBERG5yg6t+0mEUETtlmZR8=;
	b=mALVAHfqRcuEybrifk7KzYsk6HYuo+CpWBvQssl0m9UBN42pMOYu5y0ElY3LxMJ+fZ
	S6OjPj1iEUlfTUvnPhUHWvtbsl2MR7L/cFMvro2e5x1d/0pxaMCRFK9K2P7dX7sB5zRv
	U7UYvghY+9oTHkrfCFj1GfQuPnpD/aHUVx/2WB2BSD8Fgd/V0FRlIoYFC6mgbbpKIS2E
	r9gx75KSrFAbNATmPbu+VYofWOzdbGX8nRbmQCtuUM8D4g4OPPz6oJPaGsffXZrQlkR4
	QJZzW+E7QAaFJjzE27w5ThqukfWswATg88HaTZxTygwg3k5yKH0CiTrZgmEVZ7QHySOo
	JtHQ==
X-Gm-Message-State: AE9vXwMPGJHtqPF/j2dtTLotZPbGhlI3mrUvPD1YdPK01iyJQ5ljcNdXIFOQbzUeEbQQzA==
X-Received: by 10.98.158.3 with SMTP id s3mr21003359pfd.117.1473083976884;
	Mon, 05 Sep 2016 06:59:36 -0700 (PDT)
Received: from jlock-mobl1.ger.corp.intel.com ([192.55.54.42])
	by smtp.gmail.com with ESMTPSA id
	u1sm33982460pfu.12.2016.09.05.06.59.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 06:59:36 -0700 (PDT)
From: Joshua Lock <joshuagloe@gmail.com>
X-Google-Original-From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2016 14:59:12 +0100
Message-Id: <6180658762c54732ad9d8db624f2f0502996ff9b.1473083836.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1473083836.git.joshua.g.lock@intel.com>
References: <cover.1473083836.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1473083836.git.joshua.g.lock@intel.com>
References: <cover.1473083836.git.joshua.g.lock@intel.com>
Subject: [PATCH 4/4] runqemu: get NATIVE dirs from env when in source OE build dir
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
X-List-Received-Date: Mon, 05 Sep 2016 13:59:36 -0000

When we're running from a sourced OE build directory parse the
STAGING_* directories from the bitbake environment, rather than
using those hard-coded in the conf file.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/runqemu | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index cfe7bff..5a97802 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -555,6 +555,16 @@ class BaseConfig(object):
                 logger.info('Setting DEPLOY_DIR_IMAGE to folder containing %s (%s)' % (self.qemuboot, imgdir))
                 self.set('DEPLOY_DIR_IMAGE', imgdir)
 
+        # When we're running from a sourced OE environment use the STAGING_*
+        # directories from the environment.
+        if self.bitbake_e:
+            native_vars = ['STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE']
+            for nv in native_vars:
+                s = re.search('^%s="(.*)"' % nv, self.bitbake_e, re.M)
+                if s and s.group(1) != self.get(nv):
+                    logger.info('Overriding conf file setting of %s to %s from Bitbake environment' % (nv, s.group(1)))
+                    self.set(nv, s.group(1))
+
     def print_config(self):
         logger.info('Continuing with the following parameters:\n')
         if not self.fstype in self.vmtypes:
@@ -815,6 +825,17 @@ class BaseConfig(object):
             shutil.rmtree(self.nfs_dir)
             shutil.rmtree('%s.pseudo_state' % self.nfs_dir)
 
+    def check_sourced_env(self):
+        bitbake = shutil.which('bitbake')
+        if bitbake and not self.bitbake_e:
+            mach = self.get('MACHINE')
+            if mach:
+                cmd = 'MACHINE=%s bitbake -e' % mach
+            else:
+                cmd = 'bitbake -e'
+            logger.info('Running %s...' % cmd)
+            self.bitbake_e = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
+
 def main():
     if len(sys.argv) == 1 or "help" in sys.argv:
         print_usage()
@@ -826,6 +847,7 @@ def main():
         logger.error(esc)
         logger.error("Try 'runqemu help' on how to use it")
         return 1
+    config.check_sourced_env()
     config.read_qemuboot()
     config.check_and_set()
     config.print_config()
-- 
2.7.4


