Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1TYqym-0002X0-Ez
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 05:23:04 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAF2Rsw3019345
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 18:27:54 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 14 Nov 2012 18:27:54 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Nov 2012 10:27:54 +0800
Message-ID: <1c275366d6f37e1e160b30e18d2138c0ae41439e.1352946202.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1352946202.git.rongqing.li@windriver.com>
References: <cover.1352946202.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bind: make "/etc/init.d/bind stop" work
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
X-List-Received-Date: Thu, 15 Nov 2012 04:23:04 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Add some configurations, make rndc command be able to controls
the named daemon.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../bind/bind-9.8.1/conf.patch                     |   15 +++++--
 .../bind-9.8.1/make-etc-initd-bind-stop-work.patch |   42 ++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.8.1.bb       |    3 +-
 3 files changed, 55 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/make-etc-initd-bind-stop-work.patch

diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/conf.patch b/meta/recipes-connectivity/bind/bind-9.8.1/conf.patch
index fd5606e..6fea70e 100644
--- a/meta/recipes-connectivity/bind/bind-9.8.1/conf.patch
+++ b/meta/recipes-connectivity/bind/bind-9.8.1/conf.patch
@@ -241,7 +241,7 @@ diff -urN bind-9.3.1.orig/conf/zones.rfc1918 bind-9.3.1/conf/zones.rfc1918
 diff -urN bind-9.3.1.orig/init.d bind-9.3.1/init.d
 --- bind-9.3.1.orig/init.d	1970-01-01 01:00:00.000000000 +0100
 +++ bind-9.3.1/init.d	2005-07-10 23:09:58.000000000 +0200
-@@ -0,0 +1,63 @@
+@@ -0,0 +1,70 @@
 +#!/bin/sh
 +
 +PATH=/sbin:/bin:/usr/sbin:/usr/bin
@@ -259,9 +259,16 @@ diff -urN bind-9.3.1.orig/init.d bind-9.3.1/init.d
 +	echo -n "Starting domain name service: named"
 +
 +	modprobe capability >/dev/null 2>&1 || true
++	if [ ! -f /etc/bind/rndc.key ]; then
++	    /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
++	    chown 0640 /etc/bind/rndc.key
++	fi
++	if [ -f /var/run/named/named.pid ]; then
++	    ps `cat /var/run/named/named.pid` > /dev/null && exit 1
++	fi
 +
 +	# dirs under /var/run can go away on reboots.
-+	mkdir -p /var/run/bind/run
++	mkdir -p /var/run/named
 +	mkdir -p /var/cache/bind
 +	chmod 775 /var/run/bind/run
 +	chown root:bind /var/run/bind/run >/dev/null 2>&1 || true
@@ -271,7 +278,7 @@ diff -urN bind-9.3.1.orig/init.d bind-9.3.1/init.d
 +	    exit 1
 +	fi
 +	if start-stop-daemon --start --quiet --exec /usr/sbin/named \
-+		--pidfile /var/run/bind/run/named.pid -- $OPTIONS; then
++		--pidfile /var/run/named/named.pid -- $OPTIONS; then
 +	    if [ -x /sbin/resolvconf ] ; then
 +		echo "nameserver 127.0.0.1" | /sbin/resolvconf -a lo
 +	    fi
@@ -284,7 +291,7 @@ diff -urN bind-9.3.1.orig/init.d bind-9.3.1/init.d
 +	if [ -x /sbin/resolvconf ]; then
 +	    /sbin/resolvconf -d lo
 +	fi
-+	/usr/sbin/rndc stop
++	/usr/sbin/rndc stop >/dev/null 2>&1
 +	echo "."	
 +    ;;
 +
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.8.1/make-etc-initd-bind-stop-work.patch
new file mode 100644
index 0000000..146f3e3
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.8.1/make-etc-initd-bind-stop-work.patch
@@ -0,0 +1,42 @@
+bind: make "/etc/init.d/bind stop" work
+
+Upstream-Status: Inappropriate [configuration]
+
+Add some configurations, make rndc command be able to controls
+the named daemon.
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ conf/named.conf |    5 +++++
+ conf/rndc.conf  |    5 +++++
+ 2 files changed, 10 insertions(+), 0 deletions(-)
+ create mode 100644 conf/rndc.conf
+
+diff --git a/conf/named.conf b/conf/named.conf
+index 95829cf..c8899e7 100644
+--- a/conf/named.conf
++++ b/conf/named.conf
+@@ -47,3 +47,8 @@ zone "255.in-addr.arpa" {
+ // root-delegation-only exclude { "DE"; "MUSEUM"; };
+ 
+ include "/etc/bind/named.conf.local";
++include "/etc/bind/rndc.key" ;
++controls {
++	inet 127.0.0.1 allow { localhost; }
++	keys { rndc-key; };
++};
+diff --git a/conf/rndc.conf b/conf/rndc.conf
+new file mode 100644
+index 0000000..a0b481d
+--- /dev/null
++++ b/conf/rndc.conf
+@@ -0,0 +1,5 @@
++include "/etc/bind/rndc.key";
++options {
++	default-server  localhost;
++	default-key     rndc-key;
++};
+
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-connectivity/bind/bind_9.8.1.bb b/meta/recipes-connectivity/bind/bind_9.8.1.bb
index 2efd09d..23ff0b4 100644
--- a/meta/recipes-connectivity/bind/bind_9.8.1.bb
+++ b/meta/recipes-connectivity/bind/bind_9.8.1.bb
@@ -6,11 +6,12 @@ LICENSE = "ISC & BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0fbe2a3ab3c68ac3fea3cad13093877c"
 
 DEPENDS = "openssl libcap"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://conf.patch \
            file://cross-build-fix.patch \
+           file://make-etc-initd-bind-stop-work.patch \
 	   "
 
 SRC_URI[md5sum] = "cf31117c5d35af34d4c0702970ad9fb7"
-- 
1.7.4.1



