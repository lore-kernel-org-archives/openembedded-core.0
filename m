Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 88DE26A5CC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 12:25:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5ICPI1T007241
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 05:25:18 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.153) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 05:25:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jun 2013 20:25:14 +0800
Message-ID: <eac0003697c78bfc0dfe8f6ae322dad37f802b75.1371557553.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1371557553.git.hongxu.jia@windriver.com>
References: <cover.1371557553.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd-udevd: fix invoking init script failed
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
X-List-Received-Date: Tue, 18 Jun 2013 12:25:17 -0000
Content-Type: text/plain

root@emenlow-noemgd:~# /etc/init.d/systemd-udevd restart
Stopping udevd
Starting udev
corrupt queue file
root@emenlow-noemgd:~# /etc/init.d/systemd-udevd status
udevd is stopped
root@emenlow-noemgd:~# ps
3805 root      8728 S    /lib/systemd/systemd-udevd

The process name is systemd-udevd rather than udev which is
used in systemd-udevd's init script.

[YOCTO #4746]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/systemd/systemd/init | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/init b/meta/recipes-core/systemd/systemd/init
index 7e67a50..41c4136 100644
--- a/meta/recipes-core/systemd/systemd/init
+++ b/meta/recipes-core/systemd/systemd/init
@@ -83,7 +83,7 @@ case "$1" in
     ;;
   stop)
     echo "Stopping udevd"
-    start-stop-daemon --stop --name udevd --quiet
+    start-stop-daemon --stop --name systemd-udevd --quiet
     ;;
   restart)
     $0 stop
@@ -91,7 +91,7 @@ case "$1" in
     $0 start
     ;;
   status)
-    status udevd
+    status systemd-udevd
     ;;
   *)
     echo "Usage: $0 {start|stop|status|restart}"
-- 
1.8.1.2


