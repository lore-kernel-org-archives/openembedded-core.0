Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0ACBA77A53
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 12:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490186667; x=1521722667;
	h=from:to:cc:subject:date:message-id;
	bh=ABs4H6eycq+wKB5xudnt9lIZts1f9ximzFcIunOuJ7Y=;
	b=d6DIphcUYunicQGwO75kxZa+60tMCAfWWfHPxLGvkVp3lfxeqdsnX2IP
	IzAE1L/6CnEitE7dtsT5DgTQ3CPurQ==;
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2017 05:44:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,205,1486454400"; d="scan'208";a="837386385"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2017 05:44:25 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 14:43:35 +0200
Message-Id: <20170322124337.17061-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/3] oeqa: use WORKDIR/oe-testimage-repo to look for RPM packages
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
X-List-Received-Date: Wed, 22 Mar 2017 12:44:26 -0000

Using RPM deploy dir was causing errors when pre-built images were
used with these steps:
https://wiki.yoctoproject.org/wiki/Quality_Assurance_yocto_project

[YOCTO #11173]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oeqa/runtime/cases/dnf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index 59a263dc63a..eb3af07f0f1 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -98,7 +98,7 @@ class DnfRepoTest(DnfTest):
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_install_from_disk'])
     def test_dnf_install_from_http(self):
         output = subprocess.check_output('%s %s -name run-postinsts-dev*' % (bb.utils.which(os.getenv('PATH'), "find"),
-                                                                           self.tc.td['DEPLOY_DIR_RPM']), shell=True).decode("utf-8")
+                                                                           os.path.join(self.tc.td['WORKDIR'], 'oe-testimage-repo')), shell=True).decode("utf-8")
         rpm_path = output.split("/")[-2] + "/" + output.split("/")[-1]
         url = 'http://%s:%s/%s' %(self.target.server_ip, self.repo_server.port, rpm_path)
         self.dnf_with_repo('remove -y run-postinsts-dev')
-- 
2.11.0


