Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0A44E6B7A0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2014 02:24:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s022OsE3027949
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jan 2014 18:24:54 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 1 Jan 2014 18:24:53 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Jan 2014 10:25:04 +0800
Message-ID: <7ddc616565a80346dd323664d0c36490a698fb89.1388629298.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1388629298.git.Qi.Chen@windriver.com>
References: <cover.1388629298.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/2] initscripts: split the functions script into a separate package
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
X-List-Received-Date: Thu, 02 Jan 2014 02:24:53 -0000
Content-Type: text/plain

Many SysV init scripts need the /etc/init.d/functions script. But
this script is part of the initscripts package. As a result, the
initscripts package should always be installed into the system to
avoid errors when starting daemons. However, it makes no sense to
install the initscripts package into a systemd based image, because
what the init scripts provide has already been provided by the systemd.
On the other hand, the functions script might be still needed in a
systemd based image because other init scripts such as distcc might need
it.

The above situation leads to a natural separation of the functions script
from the initscripts package. And this patch does so. It separates the
functions script into initscripts-functions packages.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 5951e0c..ea28672 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -42,8 +42,12 @@ KERNEL_VERSION = ""
 inherit update-alternatives
 DEPENDS_append = " update-rc.d-native"
 
-ALTERNATIVE_PRIORITY = "90"
-ALTERNATIVE_${PN} = "functions"
+PACKAGES =+ "${PN}-functions"
+RDEPENDS_${PN} = "${PN}-functions"
+FILES_${PN}-functions = "${sysconfdir}/init.d/functions.${PN}"
+
+ALTERNATIVE_PRIORITY_${PN}-functions = "90"
+ALTERNATIVE_${PN}-functions = "functions"
 ALTERNATIVE_LINK_NAME[functions] = "${sysconfdir}/init.d/functions"
 
 HALTARGS ?= "-d -f"
-- 
1.7.9.5


