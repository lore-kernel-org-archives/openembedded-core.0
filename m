Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id AF3256DC8B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:19:42 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0NCIbJl004451 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:19:38 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vGwcDBsygC8G
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:19:38 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0NCJWgv004501
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:19:34 GMT
Message-ID: <1390479566.17424.99.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 12:19:26 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] libtool-cross/native: Force usage of bash due to sstate inconsistencies
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
X-List-Received-Date: Thu, 23 Jan 2014 12:19:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Scenario:
a) libtool script is built on system with bash as /bin/sh
b) machine B installs sstate from build a)
c) machine B has dash as /bin/sh

In this scenario, the script fails to work properly since its expecting
/bin/sh to have bash like syntax and it no longer does have it.

This patch forces the configure process to use /bin/bash, not /bin/sh
and hence allows the scripts to work correctly when used from sstate.

(From OE-Core rev: 2c66aa0fc98b092ebb37baee94e92d1965afd76b)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
index 34aae0b..72fad37 100644
--- a/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
+++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
@@ -39,3 +39,5 @@ libtoolcross_sysroot_preprocess () {
 }
 
 SSTATE_SCAN_FILES += "libtoolize *-libtool"
+
+export CONFIG_SHELL="/bin/bash"
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
index df73f08..f1051d8 100644
--- a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
+++ b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
@@ -22,3 +22,4 @@ do_install () {
 	install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/${HOST_SYS}-libtool
 }
 
+export CONFIG_SHELL="/bin/bash"



