Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UKly7-000056-U1
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 09:44:30 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2R8RQoa019905
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 01:27:26 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 27 Mar 2013 01:27:25 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Mar 2013 16:27:25 +0800
Message-ID: <d4f717babe82dc5d5d12c7860affa846731f3d0b.1364372801.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1364372801.git.Qi.Chen@windriver.com>
References: <cover.1364372801.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] rc: exit psplash correctly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Mar 2013 08:44:30 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, psplash didn't go away at system startup.
The root cause is that rc checks the file '/etc/init.d/xserver-nodm' to
determine whether to exit psplash manually. So even if xserver-nodm is not
linked into runlevel 3, psplash doesn't exit.

This patch fixes this problem by letting the rc script check the file
'/etc/rc${runlevel}.d/S??xserver-nodm' to determine whether to exit psplash
manually.

[YOCTO #3904]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/sysvinit/sysvinit/rc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index 44bc9bf..655a0b0 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -171,7 +171,7 @@ startup() {
   fi
 
 #Uncomment to cause psplash to exit manually, otherwise it exits when it sees a VC switch
-if [ "x$runlevel" != "xS" ] && [ ! -x /etc/init.d/xserver-nodm ]; then
+if [ "x$runlevel" != "xS" ] && [ ! -x /etc/rc${runlevel}.d/S??xserver-nodm ]; then
     if type psplash-write >/dev/null 2>&1; then
         TMPDIR=/mnt/.psplash psplash-write "QUIT" || true
     	umount /mnt/.psplash
-- 
1.7.9.5



