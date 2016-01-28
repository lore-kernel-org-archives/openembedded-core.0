Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D3D03762B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 06:10:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0S6A32O001420
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 22:10:03 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 27 Jan 2016 22:10:03 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jan 2016 14:08:48 +0800
Message-ID: <1453961328-22030-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] kexec: package kdump init script/configuration file correctly
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
X-List-Received-Date: Thu, 28 Jan 2016 06:10:04 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

kdump init script/configuration files are under ${sysconfdir}, not ${sysconfig}
and should be packaged into kdump sub-package

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-kernel/kexec/kexec-tools_2.0.11.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.11.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.11.bb
index 8ca6f27..c1c97af 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.11.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.11.bb
@@ -18,9 +18,9 @@ PACKAGES =+ "kexec kdump vmcore-dmesg"
 ALLOW_EMPTY_${PN} = "1"
 RRECOMMENDS_${PN} = "kexec kdump vmcore-dmesg"
 
-FILES_${PN} =+ "${sysconfig}/init.d/kdump ${sysconfig}/sysconfig/kdump.conf"
 FILES_kexec = "${sbindir}/kexec"
-FILES_kdump = "${sbindir}/kdump"
+FILES_kdump = "${sbindir}/kdump ${sysconfdir}/init.d/kdump \
+               ${sysconfdir}/sysconfig/kdump.conf"
 FILES_vmcore-dmesg = "${sbindir}/vmcore-dmesg"
 
 inherit update-rc.d
-- 
1.9.1


