Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 402536A8EB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 06:13:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r576DbhN001828
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Jun 2013 23:13:37 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 6 Jun 2013 23:13:36 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Jun 2013 14:14:00 +0800
Message-ID: <7daab450268a1f607ab5699a963160265aa5dd70.1370585547.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1370585547.git.Qi.Chen@windriver.com>
References: <cover.1370585547.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 6/8] packagegroup-core-basic: set the default login manager
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
X-List-Received-Date: Fri, 07 Jun 2013 06:13:36 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Set the default login manager to 'busybox', drop the mingetty in
the RDEPENDS, use ${VIRTUAL-RUNTIME_login_manager} instead.

mingetty doesn't work with serial consoles, so if the login console
is ttyS0 for example, we get error messages on screen and cannot login
on ttyS0.

The login manager, no matter it's tinylogin or busybox, provides
getty, so we can just rdepend on it.

[YOCTO #4207]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../packagegroups/packagegroup-core-basic.bb       |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
index 31cac33..00405d6 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
@@ -92,11 +92,12 @@ RDEPENDS_packagegroup-core-dev-utils = "\
 
 VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
+VIRTUAL-RUNTIME_login_manager ?= "busybox"
 RDEPENDS_packagegroup-core-initscripts = "\
     ${VIRTUAL-RUNTIME_initscripts} \
     ${VIRTUAL-RUNTIME_init_manager} \
     ethtool \
-    mingetty \
+    ${VIRTUAL-RUNTIME_login_manager} \
     sysklogd \
     "
 
-- 
1.7.9.5


