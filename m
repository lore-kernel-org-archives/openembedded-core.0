Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F2F47ECA6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 15:08:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x8RF8QVv007845
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 08:08:26 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 27 Sep 2019 08:07:41 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Sep 2019 11:07:40 -0400
Message-ID: <20190927150740.22453-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] systemd.bbclass: add RMINITDIR for nativesdk builds
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
X-List-Received-Date: Fri, 27 Sep 2019 15:08:25 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

nativesdk builds such as nativesdk-dnf are installing systemd
service files, leading bitbake to throw installed-vs-shipped
warnings, but these are not needed in nativesdk:

 WARNING: nativesdk-dnf-4.2.2-r0 do_package: QA Issue: nativesdk-dnf: Files/directories were installed but not shipped in any package:
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-automatic.timer
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-makecache.timer
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-automatic.service
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-makecache.service
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-automatic-notifyonly.timer
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-automatic-download.service
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-automatic-download.timer
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-automatic-notifyonly.service
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-automatic-install.timer
      /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/systemd/system/dnf-automatic-install.service
    Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
    nativesdk-dnf: 13 installed and not shipped files. [installed-vs-shipped]

Rather than have each recipe remove the files, an RMINITDIR case
for nativesdk builds should be added to systemd.bbclass.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/classes/systemd.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 747055b8fa..1dca09964b 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -231,5 +231,6 @@ python rm_sysvinit_initddir (){
 
 do_install[postfuncs] += "${RMINITDIR} "
 RMINITDIR_class-target = " rm_sysvinit_initddir rm_systemd_unitdir "
+RMINITDIR_class-nativesdk = " rm_sysvinit_initddir rm_systemd_unitdir "
 RMINITDIR = ""
 
-- 
2.21.0


