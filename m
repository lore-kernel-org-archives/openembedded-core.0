Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9EB2671AE6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 04:15:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3L4FvNo025190
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 21:15:57 -0700
Received: from pek-ddu-u1642.wrs.com (128.224.162.189) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 20 Apr 2017 21:15:57 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Apr 2017 12:15:53 +0800
Message-ID: <52fefc5493e544a598df29558e097ef0ec3340e7.1492745551.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1492745551.git.dengke.du@windriver.com>
References: <cover.1492745551.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] lsbtest: add option --ignoreos to rpm install command
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
X-List-Received-Date: Fri, 21 Apr 2017 04:15:57 -0000
Content-Type: text/plain

After change to the rpm4, the rpm packages in lsbtest, such as:

    lsb-setup-4.1.0-1.noarch.rpm
    lsb-dist-checker-5.0.0.1-1.x86_64.rpm
    ......
    lsb-cmdchk-5.0.3-1.x86_64.rpm

When install above rpm packages, the error log appears:

    package lsb-setup-4.1.0-1.noarch is intended for a different operating system
    ......

So we should add option "--ignoreos" to the rpm install command in LSB_Test.sh
in ./meta/recipes-extended/lsb/lsbtest directory. In this way we can make sure
the correct installation of those rpm packages.

The YOCTO bug #11224 didn't create logs, this is because the above test rpm
packages didn't install.

[YOCTO #11224]

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
index c31a3eb..0eb2793 100644
--- a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
+++ b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
@@ -252,8 +252,8 @@ LSB_STOP_CMD="/opt/lsb/test/manager/bin/dist-checker-stop.pl"
 
 PLATFORM_FILE="/etc/rpm/platform"
 
-RPM_INSTALL_CMD="rpm --quiet --nodeps --replacepkgs --nosignature -i"
-RPM_INSTALL_CMD_NOSCRIPTS="rpm --quiet --nodeps --replacepkgs --noscripts --nosignature -i"
+RPM_INSTALL_CMD="rpm --quiet --nodeps --replacepkgs --nosignature -i --ignoreos"
+RPM_INSTALL_CMD_NOSCRIPTS="rpm --quiet --nodeps --replacepkgs --noscripts --nosignature -i --ignoreos"
 
 # If the lsb has been started, stop it first.
 if [ -x ${LSB_STOP_CMD} ]
-- 
2.7.4


