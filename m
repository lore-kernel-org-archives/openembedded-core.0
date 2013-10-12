Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4046D065
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2013 05:30:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9C5U4gJ016375
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 22:30:04 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 11 Oct 2013 22:30:03 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 12 Oct 2013 13:30:29 +0800
Message-ID: <00bd39f1abd730ccdb758ce61ead4a7be92a4305.1381555764.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1381555764.git.Qi.Chen@windriver.com>
References: <cover.1381555764.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] initscripts: insure checkroot.sh runs before anything writing to the file
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
X-List-Received-Date: Sat, 12 Oct 2013 05:30:02 -0000
Content-Type: text/plain

From: Jeffrey C Honig <jeffrey.honig@windriver.com>

If bootlogd was configured to write to a log file on the root file system,
the checkroot.sh was not able to change the rootfs to read-only because
bootlogd was started earlier and had a file descriptor open.  Lowering
the order of checkroot.sh ensures that the volatile filesystem is set
up before anything writes to it.

Signed-off-by: Jeffrey C Honig <jeffrey.honig@windriver.com>
Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 5b5085f..c2998c3 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -114,7 +114,7 @@ do_install () {
 	update-rc.d -r ${D} halt start 90 0 .
 	update-rc.d -r ${D} save-rtc.sh start 25 0 6 .
 	update-rc.d -r ${D} banner.sh start 02 S .
-	update-rc.d -r ${D} checkroot.sh start 10 S .
+	update-rc.d -r ${D} checkroot.sh start 06 S .
 	update-rc.d -r ${D} mountall.sh start 35 S .
 	update-rc.d -r ${D} hostname.sh start 39 S .
 	update-rc.d -r ${D} mountnfs.sh start 45 S .
-- 
1.7.9.5


