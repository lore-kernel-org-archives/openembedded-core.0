Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1932F6011A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 08:40:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0K8eCWP015315
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 00:40:12 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 20 Jan 2016 00:40:11 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jan 2016 16:39:30 +0800
Message-ID: <1453279170-4842-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH] kexec-tools: inherit update-rc.d
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
X-List-Received-Date: Wed, 20 Jan 2016 08:40:12 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

init script kdump is added, so inherit update-rc.d

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-kernel/kexec/kexec-tools_2.0.11.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.11.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.11.bb
index 7173767..866441b 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.11.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.11.bb
@@ -22,6 +22,12 @@ FILES_kexec = "${sbindir}/kexec"
 FILES_kdump = "${sbindir}/kdump"
 FILES_vmcore-dmesg = "${sbindir}/vmcore-dmesg"
 
+inherit update-rc.d
+
+INITSCRIPT_PACKAGES = "kdump"
+INITSCRIPT_NAME_kdump = "kdump"
+INITSCRIPT_PARAMS_kdump = "start 56 2 3 4 5 . stop 56 0 1 6 ."
+
 do_install_append () {
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 ${WORKDIR}/kdump ${D}${sysconfdir}/init.d/kdump
-- 
2.5.0


