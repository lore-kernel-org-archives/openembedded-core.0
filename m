Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 39FB560FCA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2013 20:53:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r93KrkBl016104
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Oct 2013 13:53:46 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 3 Oct 2013 13:53:25 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Oct 2013 15:48:45 -0500
Message-ID: <1380833325-12942-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH] package_rpm.bbclass: Workaround failure in attemptonly installs
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
X-List-Received-Date: Thu, 03 Oct 2013 20:53:46 -0000
Content-Type: text/plain

[YOCTO #5313]

When performing an attemptonly install, we should skip an errors and
continue to install everything else.  However, there is a case where two
packages can conflict, and cause a hard failure.

This workaround, ignores this and allows the image to be constructed.
Note: Some items in the failed transaction may not get installed.

To fix this properly we need to find the issue in smart, and make it ignore
or at least attempt to resolve these kinds of conflicts.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 05de1ff..98aa98b 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -478,7 +478,7 @@ EOF
 		echo "Note: see `dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}"
 		translate_oe_to_smart ${sdk_mode} --attemptonly $package_attemptonly
 		echo "Attempting $pkgs_to_install" >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}"
-		smart --data-dir=${target_rootfs}/var/lib/smart install --attempt -y ${pkgs_to_install} >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}" 2>&1
+		smart --data-dir=${target_rootfs}/var/lib/smart install --attempt -y ${pkgs_to_install} >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}" 2>&1 || :
 	fi
 }
 
-- 
1.8.1.2.545.g2f19ada


