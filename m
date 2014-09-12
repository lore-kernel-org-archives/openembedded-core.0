Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4D98165C7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 08:57:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8C8vbrK009364
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 01:57:37 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 12 Sep 2014 01:57:37 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Sep 2014 04:57:34 -0400
Message-ID: <d0f3a1628526b95857ade6cadf451ff59b3c9065.1410510784.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1410510784.git.wenzong.fan@windriver.com>
References: <cover.1410510784.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dropbear: add pam modules dependencies
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
X-List-Received-Date: Fri, 12 Sep 2014 08:57:42 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

If pam distro feature enabled, dropbear will need below pam rpms
to work:

  * libpam-runtime
  * pam-plugin-deny
  * pam-plugin-permit
  * pam-plugin-unix

Just add the runtime dependencies explicitly.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-core/dropbear/dropbear.inc |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 9fec09e..947a491 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -27,6 +27,13 @@ PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \
                file://dropbear"
 
+PAM_PLUGINS = "libpam-runtime \
+	pam-plugin-deny \
+	pam-plugin-permit \
+	pam-plugin-unix \
+	"
+RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
+
 inherit autotools update-rc.d systemd
 
 INITSCRIPT_NAME = "dropbear"
-- 
1.7.9.5


