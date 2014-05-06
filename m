Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A938B65F94
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 13:50:38 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s46DoP9D011234 for <openembedded-core@lists.openembedded.org>;
	Tue, 6 May 2014 14:50:34 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uWIE_2l2-TrK
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 14:50:34 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s46DoURl011237
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 May 2014 14:50:32 +0100
Message-ID: <1399384224.12731.153.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 06 May 2014 14:50:24 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] uclibc: Set MULTILIB_DIR based on baselib
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
X-List-Received-Date: Tue, 06 May 2014 13:50:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

baselib contains the current "lib" value so pass this into
uclibc's configration to allow multilib builds to work correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
index c309e6f..6575482 100644
--- a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
+++ b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
@@ -123,6 +123,7 @@ UCLIBC_HAS_GNU_GLOB=y
 SHARED_LIB_LOADER_PREFIX="/lib"
 RUNTIME_PREFIX="/"
 DEVEL_PREFIX="//usr"
+MULTILIB_DIR="lib"
 
 #
 # Security options
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index e00de62..a86ac3d 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -81,6 +81,7 @@ configmangle = '/^KERNEL_HEADERS/d; \
                 s,^DOSTRIP.*,# DOSTRIP is not set,g; \
                 /_[EO]*ABI/d; \
                 /HAS_FPU/d; \
+                ${@["","s,.*MULTILIB_DIR.*,MULTILIB_DIR=\"${baselib}\",;"][d.getVar("baselib", True) != "lib"]} \
                '
 OE_FEATURES := "${@features_to_uclibc_conf(d)}"
 OE_DEL      := "${@features_to_uclibc_del(d)}"



