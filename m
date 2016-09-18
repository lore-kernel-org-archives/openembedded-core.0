Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 13302731DA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 07:39:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8I7daLJ003114
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 00:39:37 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 18 Sep 2016 00:39:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Sep 2016 00:39:29 -0700
Message-ID: <3819381c175c5db4f761841e43c2f31fd66f42a5.1474183984.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1474183984.git.liezhi.yang@windriver.com>
References: <cover.1474183984.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 7/8] runqemu: use OECORE_NATIVE_SYSROOT from sdk
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
X-List-Received-Date: Sun, 18 Sep 2016 07:39:36 -0000
Content-Type: text/plain

There is no STAGING_DIR_NATIVE or bitbake in a extracted sdk,
so check OECORE_NATIVE_SYSROOT and use it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 10122af..60e2093 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -619,18 +619,25 @@ class BaseConfig(object):
                         self.set(nv, s.group(1))
             else:
                 # when we're invoked from a running bitbake instance we won't
-                # be able to call `bitbake -e` but should have OE_TMPDIR set in
-                # the environment and can guess paths based on it
+                # be able to call `bitbake -e`, then try:
+                # - get OE_TMPDIR from environment and guess paths based on it
+                # - get OECORE_NATIVE_SYSROOT from environment (for sdk)
                 tmpdir = os.environ.get('OE_TMPDIR', None)
+                oecore_native_sysroot = os.environ.get('OECORE_NATIVE_SYSROOT', None)
                 if tmpdir:
                     logger.info('Setting STAGING_DIR_NATIVE and STAGING_BINDIR_NATIVE relative to OE_TMPDIR (%s)' % tmpdir)
                     hostos, _, _, _, machine = os.uname()
                     buildsys = '%s-%s' % (machine, hostos.lower())
                     staging_dir_native = '%s/sysroots/%s' % (tmpdir, buildsys)
                     self.set('STAGING_DIR_NATIVE', staging_dir_native)
+                elif oecore_native_sysroot:
+                    logger.info('Setting STAGING_DIR_NATIVE to OECORE_NATIVE_SYSROOT (%s)' % oecore_native_sysroot)
+                    self.set('STAGING_DIR_NATIVE', oecore_native_sysroot)
+                if self.get('STAGING_DIR_NATIVE'):
                     # we have to assume that STAGING_BINDIR_NATIVE is at usr/bin
-                    staging_bindir_native = '%s/usr/bin' % staging_dir_native
-                    self.set('STAGING_BINDIR_NATIVE', staging_bindir_native)
+                    staging_bindir_native = '%s/usr/bin' % self.get('STAGING_DIR_NATIVE')
+                    logger.info('Setting STAGING_BINDIR_NATIVE to %s' % staging_bindir_native)
+                    self.set('STAGING_BINDIR_NATIVE', '%s/usr/bin' % self.get('STAGING_DIR_NATIVE'))
 
     def print_config(self):
         logger.info('Continuing with the following parameters:\n')
-- 
2.9.0


