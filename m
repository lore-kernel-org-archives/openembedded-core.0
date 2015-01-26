Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9AAE96AC95
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 03:11:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0Q3BPAe026220
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Jan 2015 19:11:25 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 25 Jan 2015 19:11:25 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Jan 2015 11:06:26 +0800
Message-ID: <1422241586-21660-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] systemd/update-rc.d: set UPDATERCD to empty if systemd is used
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
X-List-Received-Date: Mon, 26 Jan 2015 03:11:33 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

if a package is using systemd to manager its start/stop, it does not need
UPDATERCD, so not need to add update-rc.d into its RRECOMMENDS

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/classes/systemd.bbclass     | 2 ++
 meta/classes/update-rc.d.bbclass | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 708ba89..58791fa 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -8,6 +8,8 @@ SYSTEMD_PACKAGES_class-nativesdk ?= ""
 # Whether to enable or disable the services on installation.
 SYSTEMD_AUTO_ENABLE ??= "enable"
 
+UPDATERCD = ""
+
 # This class will be included in any recipe that supports systemd init scripts,
 # even if systemd is not in DISTRO_FEATURES.  As such don't make any changes
 # directly but check the DISTRO_FEATURES first.
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index bc1aa7d..81e96ea 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -3,7 +3,7 @@ UPDATERCPN ?= "${PN}"
 DEPENDS_append = " update-rc.d-native"
 VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 DEPENDS_append_class-target = " ${VIRTUAL-RUNTIME_initscripts}"
-UPDATERCD = "update-rc.d"
+UPDATERCD ?= "update-rc.d"
 UPDATERCD_class-cross = ""
 UPDATERCD_class-native = ""
 UPDATERCD_class-nativesdk = ""
-- 
1.9.1


