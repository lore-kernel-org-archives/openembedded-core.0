Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44BB47229E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 14:27:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0JERZkB000764
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 06:27:35 -0800 (PST)
Received: from otp-ovpserver-d1.corp.ad.wrs.com (128.224.124.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 19 Jan 2015 06:27:34 -0800
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Jan 2015 16:27:33 +0200
Message-ID: <1421677653-1166-1-git-send-email-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Subject: [PATCH] libgcc-common: Fix file ownership for installed files
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
X-List-Received-Date: Mon, 19 Jan 2015 14:27:36 -0000
Content-Type: text/plain

Fix two QA warnings caused by setting the wrong user and group for
files installed in the destination directory on do_install task.

WARNING: log_check: There is a warn message in the logfile
WARNING: log_check: Matched keyword: [warn]
WARNING: log_check: warning: user xxxx does not exist - using root

WARNING: log_check: There is a warn message in the logfile
WARNING: log_check: Matched keyword: [warn]
WARNING: log_check: warning: group xxxx does not exist - using root

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
---
 meta/recipes-devtools/gcc/libgcc-common.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index c81a80c..eba8ec2 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -41,6 +41,8 @@ do_install () {
 	# as well as target gcc and they are identical so we dont
 	# ship one with libgcc here
 	rm -rf ${D}${libdir}/${TARGET_SYS}/${BINV}/include
+	
+	chown -R root:root ${D}
 }
 
 BBCLASSEXTEND = "nativesdk"
-- 
1.8.1.4


