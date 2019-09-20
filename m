Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5ADEF7FEDE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 02:32:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8K2W84k023206
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 19:32:19 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 19 Sep 2019 19:31:58 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Sep 2019 10:31:55 +0800
Message-ID: <1568946715-47955-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568946715-47955-1-git-send-email-changqing.li@windriver.com>
References: <1568946715-47955-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] devtool.py: fix buildclean test
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
X-List-Received-Date: Fri, 20 Sep 2019 02:32:28 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

when build with EXTERNALSRC, checksum of EXTERNALSRC is one of inputs
for generate sigdata of task do_compile. without change any source, the
sigdata will not changed, and buildclean task only do make clean, and
not clean stampfiles like clean task, so the stampfile keep there, then
do_compile after do_buildclean will not rerun, and targetfile
tempdir_mdadm/mdadm will not be generated, report below error:

AssertionError: '/tmp/devtoolqarxv8ct6u/mdadm' does not exist

Fix by add a comments in Makefile to trigger rebuild of compile task

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index a7c6005..3a25da2 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -604,6 +604,7 @@ class DevtoolModifyTests(DevtoolBase):
             bitbake('mdadm m4 -c buildclean')
             assertNoFile(tempdir_mdadm, 'mdadm')
             assertNoFile(builddir_m4, 'src/m4')
+            runCmd('echo "#Trigger rebuild" >> %s/Makefile' % tempdir_mdadm)
             bitbake('mdadm m4 -c compile')
             assertFile(tempdir_mdadm, 'mdadm')
             assertFile(builddir_m4, 'src/m4')
-- 
2.7.4


