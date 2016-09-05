Return-Path: <joshuagloe@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id DCDB66FFCD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 20:33:17 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id g202so10266587pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 13:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=5aPzNzaMfGvVn4rc3c7fbuFJoyUVXZJxP0pfbGH6V5Y=;
	b=qOLPlnFzF2r69f4g5gt33j+CySSCpC/mLly8tZj5JiqnpyZEs2YGd64ntAOTy/Xvxc
	5NRCgZWKfrtZTNq1O4WzHPm0wswkoKeUEHZzaGOH6ZMnTzdZonHm6x4F/IRpwlRrSgLt
	ZKchAAmurVzgDpQrRlWY4D16oebKIZftjYdEdhfULTPh00KoVft5Kebgl3ub3qXXQk1q
	cWK4LjKry+WsC1aIs+EKnpes4k9MeWTMK2EV9dOqt/5RoyXW9IaCZpTMhUvWH2W+XKQ2
	I/TI1tBAyLkwxBxvZVzhMn0IV7YtgyqPfy1ih2XDGfLyWMmLWVlfhq6B2xOf+nOcBkzc
	EvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=5aPzNzaMfGvVn4rc3c7fbuFJoyUVXZJxP0pfbGH6V5Y=;
	b=iZ/AW6y5JHBTEEA3hbI4IKkDVBWQC9sbNFHxThKFKpVijF/aTKPAilGJCxPhzg9HYk
	kXKYkEKUfbC+SXTSK0PCWIi+bXVWV+/hSR39BPaTlTkWCeRK9wopKqwt+XgIzevD/Z0L
	Xb/x5N6LqfkuOMLbIu6GyHwU4mkOZCGJqCphtyrl774ZdmP8sOafco+yIXoRiHN9sKc7
	b4Kl5FOgtG2j46Qtp2B7i86U7A+9FguzAdEEjjGHMwv1jJR2NCCky0yNurKuM3CesGLr
	hI6EB0ob+fA65WFSwraY3NYWUD+DOcDyyse0HfmnVfzCT+3NiQvkrcN6yftmALV1+SfX
	y09A==
X-Gm-Message-State: AE9vXwNiRLzifnPDonSarwGB3caog8JBYNqdB38m+yn6PBjIvQEeF4A5d2yWaouNtK3xTA==
X-Received: by 10.98.35.207 with SMTP id q76mr13061155pfj.42.1473107598475;
	Mon, 05 Sep 2016 13:33:18 -0700 (PDT)
Received: from jlock-mobl1.ger.corp.intel.com ([192.55.54.43])
	by smtp.gmail.com with ESMTPSA id
	m24sm35402875pfi.34.2016.09.05.13.33.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 13:33:17 -0700 (PDT)
From: Joshua Lock <joshuagloe@gmail.com>
X-Google-Original-From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2016 21:32:57 +0100
Message-Id: <6d7be9f5a8acee63ee3968e9f6beb253e8b0a8f1.1473107499.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1473107499.git.joshua.g.lock@intel.com>
References: <cover.1473107499.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1473107499.git.joshua.g.lock@intel.com>
References: <cover.1473107499.git.joshua.g.lock@intel.com>
Subject: [PATCH v2 3/3] runqemu: better handle running on a host with different paths
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
X-List-Received-Date: Mon, 05 Sep 2016 20:33:18 -0000

If the STAGING_*_NATIVE directories from the config file don't exist
and we're in a sourced OE build directory try to extract the paths
from `bitbake -e`

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/runqemu | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 6ad0ec0..558cbc2 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -558,6 +558,22 @@ class BaseConfig(object):
                 logger.info('Setting DEPLOY_DIR_IMAGE to folder containing %s (%s)' % (self.qemuboot, imgdir))
                 self.set('DEPLOY_DIR_IMAGE', imgdir)
 
+        # If the STAGING_*_NATIVE directories from the config file don't exist
+        # and we're in a sourced OE build directory try to extract the paths
+        # from `bitbake -e`
+        havenative = os.path.exists(self.get('STAGING_DIR_NATIVE')) and \
+            os.path.exists(self.get('STAGING_BINDIR_NATIVE'))
+
+        if not havenative:
+            if not self.bitbake_e:
+                self.load_bitbake_env()
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
@@ -818,6 +834,28 @@ class BaseConfig(object):
             shutil.rmtree(self.nfs_dir)
             shutil.rmtree('%s.pseudo_state' % self.nfs_dir)
 
+    def load_bitbake_env(self, mach=None):
+        if self.bitbake_e:
+            return
+
+        bitbake = shutil.which('bitbake')
+        if not bitbake:
+            return
+
+        if not mach:
+            mach = self.get('MACHINE')
+
+        if mach:
+            cmd = 'MACHINE=%s bitbake -e' % mach
+        else:
+            cmd = 'bitbake -e'
+
+        logger.info('Running %s...' % cmd)
+        proc = subprocess.run(cmd, shell=True, stdout=subprocess.PIPE)
+        if proc.returncode != 0:
+            logger.warn("Couldn't run 'bitbake -e' to gather environment information")
+        self.bitbake_e = proc.stdout.decode('utf-8')
+
 def main():
     if len(sys.argv) == 1 or "help" in sys.argv:
         print_usage()
-- 
2.7.4


