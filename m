Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R67zg-0002DQ-H4
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 23:36:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8KLVQnL018517
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 14:31:26 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 20 Sep 2011 14:31:25 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Sep 2011 16:33:34 -0500
Message-ID: <2539230a1b1e941f43d6b6b3b686d90dac900410.1316553828.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1316553828.git.mark.hatle@windriver.com>
References: <cover.1316553828.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/7] rootfs_rpm: Use specific MACHINE_ARCH for multilib recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Sep 2011 21:36:46 -0000
Content-Type: text/plain

From: Dongxiao Xu <dongxiao.xu@intel.com>

Currently MACHINE_ARCH deploy folder is unique in multilib system, thus
a lib32 version of rpm package will override a normal rpm package if its
PACKAGE_ARCH is ${MACHINE_ARCH}.

Take netbase as an example, which the PACKAGE_ARCH = MACHINE_ARCH. Both
the normal version of netbase package and the lib32 version are named as
"netbase-4.45-r1.qemux86_64.rpm" putting in tmp/deploy/rpm/qemux86-64
directory, so we need to differentiate them.

Here we define spedific MACHINE_virtclass-multilib-lib(xx) to override
the default MACHINE value, thus got different MACHINE_ARCH to fix this
issue.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/rootfs_rpm.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 135ca75..56c1a85 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -218,6 +218,9 @@ python () {
             default_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False)
             if default_tune:
                 localdata.setVar("DEFAULTTUNE", default_tune)
+            machine = localdata.getVar("MACHINE_virtclass-multilib-" + eext[1], False)
+            if machine:
+                localdata.setVar("MACHINE", machine)
             ml_package_archs += localdata.getVar("PACKAGE_ARCHS", True) or ""
             #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1], localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
     bb.data.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs, d)
-- 
1.7.3.4



