Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 97F8779AAF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 09:21:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9F9IjIV021840
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 02:21:01 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 15 Oct 2018 02:20:04 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Oct 2018 17:25:27 +0800
Message-ID: <882acfddf8f632ed2bdfbd5883fc8eb681bfa52e.1539595482.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1539595482.git.Qi.Chen@windriver.com>
References: <cover.1539595482.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bind: fix startup failure in sysvinit
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
X-List-Received-Date: Mon, 15 Oct 2018 09:21:10 -0000
Content-Type: text/plain

The generated key file should try to have bind group so that if
the named daemon is started via '-u bind' option, which is the
default in OE core, we will not get startup failure because of
'permission denied' error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch  | 27 ++++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.11.4.bb      |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
new file mode 100644
index 0000000..8db96ec
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -0,0 +1,27 @@
+From 31dde3562f287429eea94b77250d184818b49063 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 15 Oct 2018 16:55:09 +0800
+Subject: [PATCH] avoid start failure with bind user
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ init.d | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/init.d b/init.d
+index b2eec60..6e03936 100644
+--- a/init.d
++++ b/init.d
+@@ -57,6 +57,7 @@ case "$1" in
+ 	modprobe capability >/dev/null 2>&1 || true
+ 	if [ ! -f /etc/bind/rndc.key ]; then
+ 	    /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
++	    chown root:bind /etc/bind/rndc.key >/dev/null 2>&1 || true
+ 	    chmod 0640 /etc/bind/rndc.key
+ 	fi
+ 	if [ -f /var/run/named/named.pid ]; then
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/bind/bind_9.11.4.bb b/meta/recipes-connectivity/bind/bind_9.11.4.bb
index 63d8b0b..cb4a21a 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.4.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-lib-dns-gen.c-fix-too-long-error.patch \
            file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
+           file://0001-avoid-start-failure-with-bind-user.patch \
            file://CVE-2018-5740.patch \
 "
 
-- 
1.9.1


