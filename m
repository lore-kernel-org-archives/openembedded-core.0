Return-Path: <diego.ml@zoho.com>
X-Greylist: delayed 904 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 18 Mar 2015 16:11:12 UTC
Received: from sender1.zohomail.com (sender1.zohomail.com [74.201.84.157])
	by mail.openembedded.org (Postfix) with ESMTP id 863F160034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 16:11:12 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id; 
	b=cxtFcmuOz2ea9eoG0ad70nu42CmfAtr5XMHqH/tVYwb1xVPT9IGbhF7fGf6nmx4AYffgfA9G06CM
	+BmLVjmAt5IlMqMtdJdaolE9gA/lX1PMHU8fo7Ro4C5+LEuYddaP  
Received: from localhost.localdomain
	(host65-246-static.10-188-b.business.telecomitalia.it
	[188.10.246.65]) by mx.zohomail.com
	with SMTPS id 1426694166083318.9358481062817;
	Wed, 18 Mar 2015 08:56:06 -0700 (PDT)
From: Diego Rondini <diego.ml@zoho.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 16:50:45 +0100
Message-Id: <1426693845-1805-1-git-send-email-diego.ml@zoho.com>
X-Mailer: git-send-email 1.7.9.5
X-ZohoMail: Ss  SS_10 UW UB UW UB  ZSF-HLOLL_2 SF_TD_EXT  SGR3_1_11025_229
X-ZohoMail-Owner: <1426693845-1805-1-git-send-email-diego.ml@zoho.com>+zmo_0_<diego.ml@zoho.com>
X-ZohoMail-Sender: 188.10.246.65
X-Zoho-Virus-Status: 2
Cc: Diego Rondini <diego.ml@zoho.com>
Subject: [PATCH] watchdog: Provide and install initscript
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
X-List-Received-Date: Wed, 18 Mar 2015 16:11:16 -0000

Provide and install an initscript for the watchdog package.
In particular:
- watchdog-init.patch adapts redhat initscript to be compatibile with
  OpenEmbedded;
- watchdog-conf.patch selects /dev/watchdog as default device;
- changes to the recipe install and configure the initscript.

Signed-off-by: Diego Rondini <diego.ml@zoho.com>
---
 .../watchdog/watchdog/watchdog-conf.patch          |   11 ++++
 .../watchdog/watchdog/watchdog-init.patch          |   53 ++++++++++++++++++++
 meta/recipes-extended/watchdog/watchdog_5.14.bb    |   12 ++++-
 3 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/watchdog/watchdog/watchdog-conf.patch
 create mode 100644 meta/recipes-extended/watchdog/watchdog/watchdog-init.patch

diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog-conf.patch b/meta/recipes-extended/watchdog/watchdog/watchdog-conf.patch
new file mode 100644
index 0000000..36f2968
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog/watchdog-conf.patch
@@ -0,0 +1,11 @@
+--- watchdog-5.13.orig/watchdog.conf	2013-02-01 12:15:44.000000000 +0100
++++ watchdog-5.13/watchdog.conf	2014-11-13 10:59:43.233943000 +0100
+@@ -20,7 +20,7 @@
+ #test-binary		= 
+ #test-timeout		= 
+ 
+-#watchdog-device	= /dev/watchdog
++watchdog-device	= /dev/watchdog
+ 
+ # Defaults compiled into the binary
+ #temperature-device	=
diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog-init.patch b/meta/recipes-extended/watchdog/watchdog/watchdog-init.patch
new file mode 100644
index 0000000..0fa8ee9
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog/watchdog-init.patch
@@ -0,0 +1,53 @@
+--- watchdog-5.13.orig/redhat/watchdog.init	2014-11-12 17:18:39.125943000 +0100
++++ watchdog-5.13/redhat/watchdog.init	2014-11-12 18:27:36.189943000 +0100
+@@ -7,7 +7,7 @@
+ #                 Henning P. Schmiedehausen <hps@tanstaafl.de>
+ 
+ # Source function library.
+-. /etc/rc.d/init.d/functions
++. /etc/init.d/functions
+ 
+ [ -x /usr/sbin/watchdog -a -e /etc/watchdog.conf ] || exit 0
+ 
+@@ -23,22 +23,22 @@
+ 
+ start() {
+ 
+-	echo -n $"Starting $prog: "
++	echo -n "Starting $prog: "
+ 	if [ -n "$(pidofproc $prog)" ]; then
+-		echo -n $"$prog: already running"
+-		echo_failure
++		echo -n "$prog: already running "
++		failure
+ 		echo
+ 		return 1
+ 	fi
+ 	if [ "$VERBOSE" = "yes" ]; then
+-	    daemon /usr/sbin/${prog} -v
++	    /usr/sbin/${prog} -v
+ 	else
+-	    daemon /usr/sbin/${prog}
++	    /usr/sbin/${prog}
+         fi
+ 	RETVAL=$?
+ 	[ $RETVAL -eq 0 ] && touch $lockfile
+-	[ $RETVAL -eq 0 ] && echo_success
+-	[ $RETVAL -ne 0 ] && echo_failure
++	[ $RETVAL -eq 0 ] && success
++	[ $RETVAL -ne 0 ] && failure
+ 	echo
+ 	return $RETVAL
+ }
+@@ -50,8 +50,10 @@
+ 	# and reboot the box.
+ 	killproc $prog -TERM
+ 	RETVAL=$?
+-	echo
+ 	[ $RETVAL -eq 0 ] && rm -f $lockfile $pidfile
++	[ $RETVAL -eq 0 ] && success
++	[ $RETVAL -ne 0 ] && failure
++	echo
+ 	return $RETVAL
+ }
+ 
diff --git a/meta/recipes-extended/watchdog/watchdog_5.14.bb b/meta/recipes-extended/watchdog/watchdog_5.14.bb
index c77d91d..9ec0a8e 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.14.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.14.bb
@@ -10,11 +10,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ecc0551bf54ad97f6b541720f84d6569"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
            file://fixsepbuild.patch \
-	   file://fix-ping-failure.patch"
+	   file://fix-ping-failure.patch \
+	   file://watchdog-init.patch \
+	   file://watchdog-conf.patch"
 
 SRC_URI[md5sum] = "5b2dba0c593942f4acc100bca0d560c4"
 SRC_URI[sha256sum] = "620b2f49e9879f2e85c73d4c1f422f9101e6b38e824fea2414befd8bb6866ad1"
 
 inherit autotools
+inherit update-rc.d
+
+INITSCRIPT_NAME = "watchdog.sh"
+INITSCRIPT_PARAMS = "start 15 1 2 3 4 5 . stop 85 0 6 ."
 
 RRECOMMENDS_${PN} = "kernel-module-softdog"
+
+do_install_append() {
+	install -D ${S}/redhat/watchdog.init ${D}/${sysconfdir}/init.d/watchdog.sh
+}
-- 
1.7.9.5



