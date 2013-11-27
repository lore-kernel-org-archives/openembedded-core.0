Return-Path: <Yue.Tao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 098786DDC5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 07:54:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAR7snE5007052
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 23:54:49 -0800 (PST)
Received: from localhost.localdomain (128.224.162.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 26 Nov 2013 23:54:49 -0800
From: Yue Tao <Yue.Tao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Nov 2013 15:55:44 +0800
Message-ID: <1385538944-8585-5-git-send-email-Yue.Tao@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1385538944-8585-1-git-send-email-Yue.Tao@windriver.com>
References: <1385538944-8585-1-git-send-email-Yue.Tao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Subject: [PATCH 5/5] tcf-agent: add init.d/tcf-agent status command
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
X-List-Received-Date: Wed, 27 Nov 2013 07:54:50 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 .../tcf-agent/tcf-agent/tcf-agent.init             |   75 ++++++++++++++++++++
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    4 +-
 2 files changed, 78 insertions(+), 1 deletions(-)
 create mode 100755 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
new file mode 100755
index 0000000..6303280
--- /dev/null
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
@@ -0,0 +1,75 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:          tcf-agent
+# Default-Start:     3 5
+# Default-Stop:      0 1 2 6
+# Short-Description: Target Communication Framework agent
+### END INIT INFO
+
+DAEMON_PATH=/usr/sbin/tcf-agent
+DAEMON_NAME=`basename $DAEMON_PATH`
+
+. /etc/init.d/functions
+
+test -x $DAEMON_PATH || exit 0
+
+PATH=/sbin:/usr/sbin:/bin:/usr/bin
+export PATH
+
+RETVAL=0
+
+case "$1" in
+    start)
+        echo -n "Starting $DAEMON_NAME: "
+        $DAEMON_PATH -d -L- -l0
+        RETVAL=$?
+        if [ $RETVAL -eq 0 ] ; then
+            echo "OK"
+            touch /var/lock/subsys/$DAEMON_NAME
+        else
+            echo "FAIL"
+        fi
+        ;;
+
+    stop)
+        echo -n "Stopping $DAEMON_NAME: "
+        count=0
+        while [ -n "`/bin/pidof $DAEMON_PATH`" -a $count -lt 10 ] ; do
+            killproc $DAEMON_PATH >& /dev/null
+            sleep 1
+            RETVAL=$?
+            if [ $RETVAL != 0 -o -n "`/bin/pidof $DAEMON_PATH`" ] ; then
+                sleep 3
+            fi
+            count=`expr $count + 1`
+        done
+        rm -f /var/lock/subsys/$DAEMON_NAME
+        if [ -n "`/bin/pidof $DAEMON_PATH`" ] ; then
+            echo "FAIL"
+        else
+            echo "OK"
+        fi
+        ;;
+
+    restart)
+        $0 stop
+        sleep 1
+        $0 start
+        ;;
+
+    status)
+        status $DAEMON_NAME
+        RETVAL=$?
+        ;;
+
+    condrestart)
+        [ -f /var/lock/subsys/$DAEMON_NAME ] && $0 restart
+        ;;
+
+    *)
+        echo "usage: $0 { start | stop | status | restart | condrestart | status }"
+        ;;
+esac
+
+exit $RETVAL
+
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 09b153e..e7779cd 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -11,7 +11,7 @@ PR = "r2"
 
 SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git \
            file://fix_ranlib.patch \
-           file://fix_tcf-agent.init.patch \
+           file://tcf-agent.init \
           "
 
 DEPENDS = "util-linux openssl"
@@ -42,5 +42,7 @@ do_compile() {
 
 do_install() {
 	oe_runmake install INSTALLROOT=${D}
+	install -d ${D}${sysconfdir}/init.d/
+	install -m 0755 ${WORKDIR}/tcf-agent.init ${D}${sysconfdir}/init.d/tcf-agent
 }
 
-- 
1.7.5.4


