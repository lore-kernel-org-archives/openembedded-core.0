Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SHoFF-0004pj-K0
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 05:29:21 +0200
Received: by yenm3 with SMTP id m3so291435yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 20:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Ly88EzyNOwmmUxHNi5/AVENvuKTz2Dg7gJi8G+unEO0=;
	b=noAajMprfagMfeNF05IEu5KRReEQPRFNE/uJrUEN14LsZ4hVS8HFeSn4ZxHqlxrDOw
	C8D5AWuspMfU4Q7ou+NZojGy/7MLtHBhbsqD37nxeg4TLUeoefNzoFuMX0bABGkGjbr8
	544Nyc/4gk1w8iYokedoddpJHgMzvDPcQq5cYTrKOlNx9CB2nsZTKHXwHB13NYXhMXqW
	q6GxdgwfdnrBbQ/ATe4v8UP2UsGPFsTnOlk60K7rGB1Pm5MyPphapH0MZVJdz5RGgkME
	GBRfi9+O4p8+FPy4cwvMhewI4pcQxb3ENtwpriwALyokf0SWMlXXtQJhH20sEOG19VwO
	UgrA==
Received: by 10.236.153.73 with SMTP id e49mr12009995yhk.4.1334114402937;
	Tue, 10 Apr 2012 20:20:02 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id r62sm5091146yhb.14.2012.04.10.20.20.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 20:20:01 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 03:19:50 +0000
Message-Id: <8260c81f0251e639f853303fb94defcb58cf846b.1334114318.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1334114318.git.otavio@ossystems.com.br>
References: <cover.1334114318.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1334114318.git.otavio@ossystems.com.br>
References: <cover.1334114318.git.otavio@ossystems.com.br>
Subject: [PATCH 1/3] connman: backport test script fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2012 03:29:21 -0000

Those fixes are required to get the test scripts to work with current
0.79 DBus API.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../connman/test-set-ipv4-method-api-fix.patch     |   50 ++++++++++++++++++
 .../connman/test-set-ipv6-method-api-fix.patch     |   55 ++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_0.79.bb  |    4 ++
 3 files changed, 109 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch

diff --git a/meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch b/meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
new file mode 100644
index 0000000..78eb19a
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
@@ -0,0 +1,50 @@
+From 0b817dd3096f5c3ca8f0b868ee55ea550054137b Mon Sep 17 00:00:00 2001
+From: Daniel Wagner <daniel.wagner@bmw-carit.de>
+Date: Mon, 19 Mar 2012 14:03:27 +0100
+Subject: [PATCH 3/3] set-ipv4-method: The arguments have to be wrapped into a
+ variant
+
+Fixes BMC#24986
+
+Upstream-Status: Backport
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ test/set-ipv4-method |   11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/test/set-ipv4-method b/test/set-ipv4-method
+index 820b24b..235113f 100755
+--- a/test/set-ipv4-method
++++ b/test/set-ipv4-method
+@@ -3,6 +3,9 @@
+ import sys
+ import dbus
+ 
++def make_variant(string):
++	return dbus.String(string, variant_level=1)
++
+ def print_usage():
+ 	print "Usage: %s <service> [off|dhcp|manual <address> [netmask] [gateway]]" % (sys.argv[0])
+ 
+@@ -20,13 +23,13 @@ properties = service.GetProperties()
+ 
+ print "Setting method %s for %s" % (sys.argv[2], sys.argv[1])
+ 
+-ipv4_configuration = { "Method": sys.argv[2] }
++ipv4_configuration = { "Method": make_variant(sys.argv[2]) }
+ if (len(sys.argv) > 3):
+-	ipv4_configuration["Address"] = sys.argv[3]
++	ipv4_configuration["Address"] = make_variant(sys.argv[3])
+ if (len(sys.argv) > 4):
+-	ipv4_configuration["Netmask"] = sys.argv[4]
++	ipv4_configuration["Netmask"] = make_variant(sys.argv[4])
+ if (len(sys.argv) > 5):
+-        ipv4_configuration["Gateway"] = sys.argv[5]
++        ipv4_configuration["Gateway"] = make_variant(sys.argv[5])
+ 
+ service.SetProperty("IPv4.Configuration", ipv4_configuration)
+ print "New IPv4.Configuration: ", ipv4_configuration
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch b/meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
new file mode 100644
index 0000000..773127b
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
@@ -0,0 +1,55 @@
+From 2885e71c9c0df7ea9866e91ab79d255eaa8de53d Mon Sep 17 00:00:00 2001
+From: Daniel Wagner <daniel.wagner@bmw-carit.de>
+Date: Mon, 19 Mar 2012 14:03:28 +0100
+Subject: [PATCH 2/3] set-ipv6-method: The arguments have to be wrapped into a
+ variant
+
+Fixes BMC#24986
+
+Upstream-Status: Backport
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ test/set-ipv6-method |   13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/test/set-ipv6-method b/test/set-ipv6-method
+index 7f60b88..4f2de09 100755
+--- a/test/set-ipv6-method
++++ b/test/set-ipv6-method
+@@ -3,6 +3,9 @@
+ import sys
+ import dbus
+ 
++def make_variant(string):
++	return dbus.String(string, variant_level=1)
++
+ def print_usage():
+ 	print "Usage: %s <service> off|manual|auto [<address> [prefixlen] [gateway]] [<privacy>]" % (sys.argv[0])
+ 
+@@ -19,17 +22,17 @@ properties = service.GetProperties()
+ 
+ print "Setting method %s for %s" % (sys.argv[2], sys.argv[1])
+ 
+-ipv6_configuration = { "Method": sys.argv[2] }
++ipv6_configuration = { "Method": make_variant(sys.argv[2])}
+ if sys.argv[2] == "auto":
+ 	if (len(sys.argv) > 3):
+-		ipv6_configuration["Privacy"] = sys.argv[3]
++		ipv6_configuration["Privacy"] = make_variant(sys.argv[3])
+ else:
+ 	if (len(sys.argv) > 3):
+-		ipv6_configuration["Address"] = sys.argv[3]
++		ipv6_configuration["Address"] = make_variant(sys.argv[3])
+ 	if (len(sys.argv) > 4):
+-		ipv6_configuration["PrefixLength"] = sys.argv[4]
++		ipv6_configuration["PrefixLength"] = make_variant(sys.argv[4])
+ 	if (len(sys.argv) > 5):
+-		ipv6_configuration["Gateway"] = sys.argv[5]
++		ipv6_configuration["Gateway"] = make_variant(sys.argv[5])
+ 
+ service.SetProperty("IPv6.Configuration", ipv6_configuration)
+ print "New IPv6.Configuration: ", ipv6_configuration
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/connman/connman_0.79.bb b/meta/recipes-connectivity/connman/connman_0.79.bb
index f87c4dd..c0b1618 100644
--- a/meta/recipes-connectivity/connman/connman_0.79.bb
+++ b/meta/recipes-connectivity/connman/connman_0.79.bb
@@ -1,11 +1,15 @@
 require connman.inc
 
+PR = "r1"
+
 # 0.79 tag
 SRCREV = "442b1fe603e005814f592a3dbcf0d0bfb13f961c"
 SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://add_xuser_dbus_permission.patch \
             file://ethernet_default.patch \
             file://disable_alg-test.patch \
+            file://test-set-ipv4-method-api-fix.patch \
+            file://test-set-ipv6-method-api-fix.patch \
             file://connman"
 S = "${WORKDIR}/git"
 PR = "r1"
-- 
1.7.2.5



