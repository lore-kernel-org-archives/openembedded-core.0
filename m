Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 16A5E77DCC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 14:47:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2017 07:47:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="1194027138"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2017 07:47:07 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 677E95804B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 07:47:06 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 17:34:24 +0300
Message-Id: <49f356ebd44f5c4133299cb83613ff70d204fd6e.1499783283.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499783283.git.ed.bartosh@linux.intel.com>
References: <cover.1499783283.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/2] runqemu: check exit code of 'ls -t'
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
X-List-Received-Date: Tue, 11 Jul 2017 14:47:06 -0000

Used check_output instead of Popen as it raises CalledProcessError
exception when command exits with non-zero exit code.

Catched the exception to produce user-friendly output.

[YOCTO #11719]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/runqemu | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c33741d..d44afc7 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -676,7 +676,10 @@ class BaseConfig(object):
             else:
                 cmd = 'ls -t %s/*.qemuboot.conf' %  deploy_dir_image
                 logger.info('Running %s...' % cmd)
-                qbs = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
+                try:
+                    qbs = subprocess.check_output(cmd, shell=True).decode('utf-8')
+                except subprocess.CalledProcessError as err:
+                    raise RunQemuError(err)
                 if qbs:
                     for qb in qbs.split():
                         # Don't use initramfs when other choices unless fstype is ramfs
-- 
2.1.4


