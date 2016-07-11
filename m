Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1B0EE607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 15:25:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6BFPqBc009120
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 08:25:52 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Jul 2016 08:25:51 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jul 2016 08:25:50 -0700
Message-ID: <79dae44dd3953f60e78853750ecc059dd1ec7921.1468250724.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1468250724.git.liezhi.yang@windriver.com>
References: <cover.1468250724.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] xuser-account: remove GROUPADD_PARAM
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
X-List-Received-Date: Mon, 11 Jul 2016 15:25:51 -0000
Content-Type: text/plain

The group shutdown had been provided by base-passwd, otherwise, it may cause
sysvinit failed to build:

$ bitbake xuser-account sysvinit && bitbake xuser-account sysvinit -ccleansstate && bitbake sysvinit
[snip]
| chown: invalid user: root.shutdown
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/user-creation/xuser-account_0.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb b/meta/recipes-support/user-creation/xuser-account_0.1.bb
index 13ba677..81817d1 100644
--- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
+++ b/meta/recipes-support/user-creation/xuser-account_0.1.bb
@@ -21,7 +21,6 @@ do_install() {
 FILES_${PN} = "${sysconfdir}/dbus-1/system.d/system-xuser.conf"
 
 USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "--system shutdown"
 USERADD_PARAM_${PN} = "--create-home \
                        --groups video,tty,audio,input,shutdown,disk \
                        --user-group xuser"
-- 
2.9.0


