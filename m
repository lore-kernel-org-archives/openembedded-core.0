Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.808.1598650196712757994
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2020 14:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mark.asselstine@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 07SLTPc2025680
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2020 14:29:45 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 28 Aug 2020
 14:29:24 -0700
From: "Mark Asselstine" <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][Patch v2 1/2] xinput-calibrator: avoid defunct process
Date: Fri, 28 Aug 2020 17:29:19 -0400
Message-ID: <20200828212920.2919-1-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The xinput_calibrator_once.sh script produces output on stdout and
stderr which the current 'Exec' doesn't consume. This results in a
[xinput_calibrator_once.sh] defunct process which will remain around
until we exit the X11 session.

Add a redirect to the Exec which will consume this output and avoid
the defunct process.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

V2: * no changes

 .../recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 4f831932e7..c59f97895c 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -31,7 +31,7 @@ do_install_append() {
     install -m 0755 ${WORKDIR}/30xinput_calibrate.sh ${D}${sysconfdir}/X11/Xsession.d/
 
     install -d ${D}${sysconfdir}/xdg/autostart
-    sed -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,' ${S}/scripts/xinput_calibrator.desktop > ${D}${sysconfdir}/xdg/autostart/xinput_calibrator.desktop
+    sed -e 's,^Exec=.*,Exec=${bindir}/sh -c "${bindir}/xinput_calibrator_once.sh 2>\&1 > /dev/null",' ${S}/scripts/xinput_calibrator.desktop > ${D}${sysconfdir}/xdg/autostart/xinput_calibrator.desktop
 }
 
 FILES_${PN} += "${sysconfdir}/xdg/autostart"
-- 
2.27.0

