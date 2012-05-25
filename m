Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SXphQ-0003lK-Lm
	for openembedded-core@openembedded.org; Fri, 25 May 2012 10:16:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4P81UZV031845
	for <openembedded-core@openembedded.org>;
	Fri, 25 May 2012 09:01:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30513-05 for <openembedded-core@openembedded.org>;
	Fri, 25 May 2012 09:01:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4P81KPb031839
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@openembedded.org>;
	Fri, 25 May 2012 09:01:21 +0100
Message-ID: <1337932878.20169.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@openembedded.org>
Date: Fri, 25 May 2012 09:01:18 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] glib-2.0: Clean up OECONF flags into one variable
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
X-List-Received-Date: Fri, 25 May 2012 08:16:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Without this change, libelf was "floating" for linuxstdbase for example,
leading to build failures. This patch moves all the common options
into a common variable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
index c453941..64441ee 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
@@ -21,8 +21,6 @@ SRC_URI[sha256sum] = "b65ceb462807e4a2f91c95e4293ce6bbefca308cb44a1407bcfdd9e403
 SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
 BBCLASSEXTEND = "native nativesdk"
 
-EXTRA_OECONF = "--disable-libelf"
-
 PERLPATH = "${bindir}/env perl"
 PERLPATH_virtclass-native = "/usr/bin/env perl"
 PERLPATH_virtclass-nativesdk = "/usr/bin/env perl"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 33f7613..1dbd538 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -25,9 +25,11 @@ inherit autotools pkgconfig gettext
 
 S = "${WORKDIR}/glib-${PV}"
 
-EXTRA_OECONF = "--disable-debug --enable-included-printf=no --disable-dtrace --disable-fam"
-EXTRA_OECONF_virtclass-native = "--disable-dtrace --disable-systemtap --disable-fam"
-EXTRA_OECONF_linuxstdbase = "--enable-included-printf=no --disable-dtrace --disable-fam"
+CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap"
+
+EXTRA_OECONF = "--disable-debug --enable-included-printf=no ${CORECONF}"
+EXTRA_OECONF_virtclass-native = "${CORECONF}"
+EXTRA_OECONF_linuxstdbase = "--enable-included-printf=no ${CORECONF}"
 
 FILES_${PN} = "${libdir}/lib*${SOLIBS} ${sysconfdir}/bash_completion.d ${datadir}/glib-2.0/schemas"
 FILES_${PN}-dev += "${libdir}/glib-2.0/include \




