Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 387356C72C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 10:55:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rATAtvs9023229
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 02:55:57 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Fri, 29 Nov 2013 02:55:55 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Nov 2013 18:55:53 +0800
Message-ID: <1385722553-3514-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
MIME-Version: 1.0
Subject: [PATCH] ppp: add status command
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
X-List-Received-Date: Fri, 29 Nov 2013 10:55:58 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 meta/recipes-connectivity/ppp/ppp-2.4.5/init | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/init b/meta/recipes-connectivity/ppp/ppp-2.4.5/init
index 5b3b7ab..0c01360 100755
--- a/meta/recipes-connectivity/ppp/ppp-2.4.5/init
+++ b/meta/recipes-connectivity/ppp/ppp-2.4.5/init
@@ -6,6 +6,9 @@
 # rename the /etc/ppp/no_ppp_on_boot file to /etc/ppp/ppp_on_boot, and
 # follow the instructions in the comments in that file.
 
+# Source function library.
+. /etc/init.d/functions
+
 test -x /usr/sbin/pppd -a -f /etc/ppp/ppp_on_boot || exit 0
 if [ -x /etc/ppp/ppp_on_boot ]; then RUNFILE=1; fi
 
@@ -28,6 +31,10 @@ case "$1" in
       fi
       echo "."
     ;;
+  status)
+    status /usr/sbin/pppd;
+    exit $?
+    ;;
   restart|force-reload)
     echo -n "Restarting PPP link: pppd"
     if [ "$RUNFILE" = "1" ]; then      
@@ -42,7 +49,7 @@ case "$1" in
     echo "."
     ;;
   *)
-      echo "Usage: /etc/init.d/ppp {start|stop|restart|force-reload}"
+      echo "Usage: /etc/init.d/ppp {start|stop|status|restart|force-reload}"
       exit 1
     ;;
 esac
-- 
1.8.3


