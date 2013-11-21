Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 27FEB6DBE6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 06:53:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAL6rXiY012254
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 22:53:33 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 22:53:33 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 00:53:27 -0600
Message-ID: <1385016807-21986-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1385016807-21986-1-git-send-email-mark.hatle@windriver.com>
References: <1385016807-21986-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/2] acpid: fix acpid break down
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
X-List-Received-Date: Thu, 21 Nov 2013 06:53:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Baogen Shang <baogen.shang@windriver.com>

when execute the command "/etc/init.d/acpid stop" and "/etc/init.d/acpid
restart", it prompt "no /usr/sbin/acpid found;none killed",The acpid could
not be restarted because the script start with "!/bin/sh –e", that will
make the script stop when an error occurred. So when no 'acpid' running
(we have stopped it), the script would exit and 'restart' operation would
be stopped by ‘stop’ operation.so avoiding the error occurred, add "-o"
option,exit status 0 (not 1)if nothing done.

Signed-off-by: Baogen Shang <baogen.shang@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
---
 meta/recipes-bsp/acpid/acpid/init      | 4 ++--
 meta/recipes-bsp/acpid/acpid_1.0.10.bb | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/acpid/acpid/init b/meta/recipes-bsp/acpid/acpid/init
index 726d9ff..40ff385 100755
--- a/meta/recipes-bsp/acpid/acpid/init
+++ b/meta/recipes-bsp/acpid/acpid/init
@@ -10,13 +10,13 @@ case "$1" in
     if [ ! -d /etc/acpi/events ]; then
         echo "There is not any rule configuration file."
     else
-        start-stop-daemon -S -x /usr/sbin/acpid -- -c /etc/acpi/events
+        start-stop-daemon -o -S -x /usr/sbin/acpid -- -c /etc/acpi/events
         echo "acpid."
     fi
     ;;
   stop)
     echo -n "Stopping Advanced Configuration and Power Interface daemon: "
-    start-stop-daemon -K -x /usr/sbin/acpid
+    start-stop-daemon -o -K -x /usr/sbin/acpid
     echo "acpid."
     ;;
   restart|force-reload) 


