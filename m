Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A1346A621
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 15:03:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4TF3wpu016018
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 08:03:58 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 29 May 2013 08:03:57 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2013 10:09:56 -0500
Message-ID: <1369840203-21898-15-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 14/21] portmap: /etc/init.d/portmap restart complains "command not found"
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
X-List-Received-Date: Wed, 29 May 2013 15:03:57 -0000
Content-Type: text/plain

From: Amy Fong <amy.fong@windriver.com>

portmap splits pmap_dump and pmap_set into a different package:
portmap_utils. Since this package might not be installed, I introduce
another init file that tests for the existance of these apps before trying
to run the pmap_* commands.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-connectivity/portmap/portmap/portmap.init | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/portmap/portmap/portmap.init b/meta/recipes-connectivity/portmap/portmap/portmap.init
index e46513e..e7031af 100755
--- a/meta/recipes-connectivity/portmap/portmap/portmap.init
+++ b/meta/recipes-connectivity/portmap/portmap/portmap.init
@@ -40,14 +40,22 @@ case "$1" in
         $0 restart
 	;;
     restart)
-	pmap_dump >/var/run/portmap.state
+	# pmap_dump and pmap_set may be in a different package and not installed...
+	if [ -f /sbin/pmap_dump -a -f /sbin/pmap_set ]; then
+		do_state=1
+	else
+		do_state=0
+	fi
+	[ $do_state -eq 1 ] && pmap_dump >/var/run/portmap.state
         $0 stop
         $0 start
-	if [ ! -f /var/run/portmap.upgrade-state ]; then
-          sleep 1
-	  pmap_set </var/run/portmap.state
+	if [ $do_state -eq 1 ]; then
+	  if [ ! -f /var/run/portmap.upgrade-state ]; then
+            sleep 1
+	    pmap_set </var/run/portmap.state
+	  fi
+	  rm -f /var/run/portmap.state
 	fi
-	rm -f /var/run/portmap.state
 	;;
     *)
 	echo "Usage: /etc/init.d/portmap {start|stop|reload|restart}"
-- 
1.8.1.2.545.g2f19ada


