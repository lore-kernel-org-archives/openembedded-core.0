Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 489C06DF66
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 09:10:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB59AZmA019629
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 01:10:35 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 5 Dec 2013 01:10:34 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2013 17:11:17 +0800
Message-ID: <abf89996aa4e22d7bfd9463b4c9ee05c093dff33.1386234217.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1386234217.git.Qi.Chen@windriver.com>
References: <cover.1386234217.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] init-live.sh: remove the '-c /dev/console' for switch_root
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
X-List-Received-Date: Thu, 05 Dec 2013 09:10:35 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The '-c DEV' option is specific to the switch_root provided by busybox.
switch_root from util-linux doesn't recognize this option. As a result,
if we we this init-live.sh script together with util-linux, we would get
a kernel panic when executing switch_root.

Besides, this option doesn't seem to have any useful effect as far as I
can see. Removing it doesn't affect the behaviours of our live images.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 3f5fde8..bd259b9 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -89,7 +89,7 @@ boot_live_root() {
     mount -n --move /dev ${ROOT_MOUNT}/dev
 
     cd $ROOT_MOUNT
-    exec switch_root -c /dev/console $ROOT_MOUNT /sbin/init
+    exec switch_root $ROOT_MOUNT /sbin/init
 }
 
 fatal() {
-- 
1.7.9.5


