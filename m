Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger@moiji-mobile.com>) id 1TwDTH-0000bv-15
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 16:03:11 +0100
Received: from sangmingze-mail.local (91-66-230-199-dynip.superkabel.de
	[91.66.230.199])
	by mail.sysmocom.de (Postfix) with ESMTPSA id E786B2543409;
	Fri, 18 Jan 2013 15:01:25 +0000 (UTC)
Received: from localhost.lan ([127.0.0.1] helo=xiaoyu.lan)
	by sangmingze-mail.local with esmtp (Exim 4.80)
	(envelope-from <holger@moiji-mobile.com>)
	id 1TwDEM-0008Fl-8l; Fri, 18 Jan 2013 15:47:42 +0100
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2013 15:47:34 +0100
Message-Id: <1358520454-31595-1-git-send-email-holger@moiji-mobile.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Holger Hans Peter Freyther <holger@moiji-mobile.com>
Subject: [PATCH] dropbear: Deal with truncated host keys by removing them
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
X-List-Received-Date: Fri, 18 Jan 2013 15:03:14 -0000

Dropbear does not start when the host key is empty and it is possible
that a device is switched off before the host key is generated. This
is possible because the dropbearkey code doesn't create a temporary
file first. Detect truncated keys and then remove them which will lead
to the re-generation. This way the dropbear process will always start.
---
 meta/recipes-core/dropbear/dropbear.inc  |    2 +-
 meta/recipes-core/dropbear/dropbear/init |    6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 3e430f2..3a39c95 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Dropbear is a lightweight SSH and SCP implementation"
 HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
 SECTION = "console/network"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 # some files are from other projects and have others license terms:
 #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
diff --git a/meta/recipes-core/dropbear/dropbear/init b/meta/recipes-core/dropbear/dropbear/init
index e882bae..5cc2d65 100755
--- a/meta/recipes-core/dropbear/dropbear/init
+++ b/meta/recipes-core/dropbear/dropbear/init
@@ -58,9 +58,15 @@ gen_keys() {
 for t in $DROPBEAR_KEYTYPES; do
   case $t in
     rsa)
+        if [ -f "$DROPBEAR_RSAKEY" -a ! -s "$DROPBEAR_RSAKEY" ]; then
+                rm $DROPBEAR_RSAKEY || true
+        fi
         test -f $DROPBEAR_RSAKEY || dropbearkey -t rsa -f $DROPBEAR_RSAKEY
 	;;
     dsa)
+        if [ -f "$DROPBEAR_DSSKEY" -a ! -s "$DROPBEAR_DSSKEY" ]; then
+                rm $DROPBEAR_DSSKEY || true
+        fi
         test -f $DROPBEAR_DSSKEY || dropbearkey -t dss -f $DROPBEAR_DSSKEY
 	;;
   esac
-- 
1.7.10.4



