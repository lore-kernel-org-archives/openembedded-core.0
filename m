Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3AB536AE37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 05:46:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBA5kH1n018252
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Dec 2013 21:46:17 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 9 Dec 2013 21:46:16 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Dec 2013 13:46:16 +0800
Message-ID: <1386654376-13042-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] multilib: Ensure we map the SYSTEMD_PACKAGES variable
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
X-List-Received-Date: Tue, 10 Dec 2013 05:46:18 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

If we don't do this, systemd.bbclase will complain to unable to find multilib
packages since PACKAGES is expand with mlprefix, but SYSTEMD_PACKAGES is not,
like in ntp.inc:

    $grep PACKAGES meta-oe/meta-networking/recipes-support/ntp/ntp.inc
    PACKAGES += "ntpdate sntp ${PN}-tickadj ${PN}-utils"
    SYSTEMD_PACKAGES = "${PN} ntpdate sntp"
    $

    $bitbake ntp
    ERROR: ntpdate does not appear in package list, please add it
    ERROR: sntp does not appear in package list, please add it
    $

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/classes/multilib.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 9503096..5eb4a7b 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -105,6 +105,7 @@ python __anonymous () {
     clsextend.map_variable("PACKAGE_INSTALL")
     clsextend.map_variable("INITSCRIPT_PACKAGES")
     clsextend.map_variable("USERADD_PACKAGES")
+    clsextend.map_variable("SYSTEMD_PACKAGES")
 }
 
 PACKAGEFUNCS_append = " do_package_qa_multilib"
-- 
1.7.10.4


