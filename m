Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 012AC6E81B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 10:04:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0OA4Bcb018759
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 02:04:11 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 24 Jan 2014 02:04:11 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jan 2014 18:04:21 +0800
Message-ID: <120acacab7c2b3a91227da2f8b1ac7c11cfbc7e6.1390557768.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1390557768.git.Qi.Chen@windriver.com>
References: <cover.1390557768.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] run-postinsts: remove the init script after a clean start-up
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
X-List-Received-Date: Fri, 24 Jan 2014 10:04:11 -0000
Content-Type: text/plain

If we enable ipk/deb package back-end, and we have 'package-management'
in our IMAGE_FEATURES, then the /etc/rcS.d/S99run-postinsts would
still exist in our system after a clean start-up.

The initial design for run-postinsts requires the related init script
to be removed if there's no more post-install script left in the system.

This patch fixes this problem.

[YOCTO #5718]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../run-postinsts/run-postinsts/run-postinsts      |   15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index c94c3e9..11141ec 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -16,7 +16,16 @@ for pm in rpm deb ipk; do
 	fi
 done
 
-[ -z "$pi_dir" ] && exit 0
+remove_rcsd_link () {
+	if [ -n "`which update-rc.d`" ]; then
+		update-rc.d -f run-postinsts remove
+	fi
+}
+
+if [ -z "$pi_dir" ]; then
+	remove_rcsd_link
+	exit 0
+fi
 
 [ -e #SYSCONFDIR#/default/postinst ] && . #SYSCONFDIR#/default/postinst
 
@@ -43,7 +52,5 @@ done
 # and the rcS.d link
 if [ $remove_pi_dir = 1 ]; then
 	rm -rf $pi_dir
-	if [ -n "`which update-rc.d`" ]; then
-		update-rc.d -f run-postinsts remove
-	fi
+	remove_rcsd_link
 fi
-- 
1.7.9.5


