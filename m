Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8868376BD7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 16:02:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Nov 2015 08:01:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,243,1444719600"; d="scan'208";a="843033797"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga002.fm.intel.com with ESMTP; 04 Nov 2015 08:01:50 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Nov 2015 07:50:46 +0000
Message-Id: <58a39a11dc10e593c68fd4faf042eb0e19b6981c.1446623061.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1446623061.git.mariano.lopez@linux.intel.com>
References: <cover.1446623061.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1446623061.git.mariano.lopez@linux.intel.com>
References: <cover.1446623061.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/3] runtime/_ptest.py: Delete WORKDIR/installed_pkgs.txt
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
X-List-Received-Date: Wed, 04 Nov 2015 16:02:00 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The file WORKDIR/installed_pkgs.txt is an internal file
used for package installation, neverteless it is left in
the WORKDIR and this can cause confusion.

ptest use this file internally also (it overwrites the file
left when creating the rootfs) and don't remove the file in
WORKDIR, this changes deletes the file once is used.

[YOCTO #8444]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/runtime/_ptest.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/_ptest.py b/meta/lib/oeqa/runtime/_ptest.py
index 0621028..fefc576 100644
--- a/meta/lib/oeqa/runtime/_ptest.py
+++ b/meta/lib/oeqa/runtime/_ptest.py
@@ -91,7 +91,9 @@ class PtestRunnerTest(oeRuntimeTest):
         try:
             bb.note("Installing complementary packages ...")
             complementary_pkgs = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+            os.remove(installed_pkgs_file)
         except subprocess.CalledProcessError as e:
+            os.remove(installed_pkgs_file)
             bb.fatal("Could not compute complementary packages list. Command "
                      "'%s' returned %d:\n%s" %
                      (' '.join(cmd), e.returncode, e.output))
-- 
1.8.4.5


