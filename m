Return-Path: <biannm@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 84C6C6BC99
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 08:33:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,1012,1367942400"; d="scan'208";a="8390048"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 03 Sep 2013 16:30:47 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r838XrHw004105
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2013 16:33:53 +0800
Received: from [127.0.0.1] ([10.167.226.190])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013090316314696-1174129 ;
	Tue, 3 Sep 2013 16:31:46 +0800 
Message-ID: <52259EF3.8010404@cn.fujitsu.com>
Date: Tue, 03 Sep 2013 16:33:55 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN;
	rv:1.9.2.28) Gecko/20120306 Lightning/1.0b2 Thunderbird/3.1.20
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <52259E35.4030405@cn.fujitsu.com>
In-Reply-To: <52259E35.4030405@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/09/03 16:31:46,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/09/03 16:31:48,
	Serialize complete at 2013/09/03 16:31:48
Subject: [PATCH 2/2]acpid: print message if rule directory is inexist
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
X-List-Received-Date: Tue, 03 Sep 2013 08:33:55 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

acpid: print message if rule directory is inexist

If rule directory is inexist, the acpid initscript will exit with success,
but the daemon will be not running.
Print message in this case to tell user that the daemon is not running.

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>

---
 meta/recipes-bsp/acpid/acpid/init |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/acpid/acpid/init b/meta/recipes-bsp/acpid/acpid/init
index ef08b59..9f2c0d4 100755
--- a/meta/recipes-bsp/acpid/acpid/init
+++ b/meta/recipes-bsp/acpid/acpid/init
@@ -6,8 +6,12 @@ test -d /proc/acpi || exit 0
 case "$1" in
   start)
     echo -n "Starting Advanced Configuration and Power Interface daemon: "
-    start-stop-daemon -S -x /usr/sbin/acpid -- -c /etc/acpi/events
-    echo "acpid."
+    if [ ! -d /etc/acpi/events ]; then
+        echo "There is not any rule configuration file."
+    else
+        start-stop-daemon -S -x /usr/sbin/acpid -- -c /etc/acpi/events
+        echo "acpid."
+    fi
     ;;
   stop)
     echo -n "Stopping Advanced Configuration and Power Interface daemon: "
-- 
1.7.7




