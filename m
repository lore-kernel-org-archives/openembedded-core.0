Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A825A6E50A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 08:53:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBH8rLGp004030
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 00:53:21 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 17 Dec 2013 00:53:20 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Dec 2013 16:54:22 +0800
Message-ID: <e2ef71afaed27a2ea2d295132b725fe687da7b62.1387270422.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1387270422.git.Qi.Chen@windriver.com>
References: <cover.1387270422.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rootfs_rpm.bbclass: make complementary packages not attempt-only
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
X-List-Received-Date: Tue, 17 Dec 2013 08:53:21 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Installing complementary packages should not be attempt-only, otherwise,
errors would be hidden. For example, if we enable ptest distro feature,
and we add 'ptest-pkgs' to IMAGE_FEATRUES, then building a minimal image
would succeed without reporting any error. However, the systemd-ptest
is not installed because of lack of the perl package.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/rootfs_rpm.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 1a0c225..9a88330 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -170,8 +170,8 @@ rpm_setup_smart_target_config() {
 
 rootfs_install_packages() {
 	# Note - we expect the variables not set here to already have been set
-	export INSTALL_PACKAGES_RPM=""
-	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="`cat $1`"
+	export INSTALL_PACKAGES_RPM="`cat $1`"
+	export INSTALL_PACKAGES_ATTEMPTONLY_RPM=""
 	export INSTALL_PROVIDENAME_RPM=""
 	export INSTALL_TASK_RPM="rootfs_install_packages"
 	export INSTALL_COMPLEMENTARY_RPM="1"
-- 
1.7.9.5


