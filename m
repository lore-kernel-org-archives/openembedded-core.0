Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QI1v7-0004KC-0u
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 19:00:57 +0200
Received: by pvc30 with SMTP id 30so1084601pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2011 09:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=kkZ3nZovLut3lx8maEekPxGF2m6Mg6OCuDcBzTIgodo=;
	b=P/WKQAedjnPMQvqSHYFZjQLCXGNP+d+YcJk1BOlnfQg/PSX+Y0oeuflh6OdMclV6PR
	mQzBAwIzy+avWz5FXawuGJqLfXBXuPKv4pHMwnwXicJhBb7c1T8UjcugWudWDi8bSCiJ
	7UG/LTLEnG5VeOynaOCm3Sy7YnKktykqxB9Dk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=vH/Z35Rq880L+x2L7Y9LGSLW3WRUDNP5v2Fq35P0W9fTP8z2eGij75wJX5Kk479Pn4
	wlFEPFxG3j/gR8sbmG6ItDS8mXQBmu6eo+RYpDKSCE4ACyrIDUWs6sqoSDrq1w7aX+rm
	kw6eRBOwU7Ey4WY7GYJM7AZbMsP2lYxWLFCFo=
Received: by 10.68.41.36 with SMTP id c4mr3381297pbl.479.1304614696007;
	Thu, 05 May 2011 09:58:16 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q2sm1544750pbs.5.2011.05.05.09.58.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 May 2011 09:58:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu,  5 May 2011 09:57:56 -0700
Message-Id: <1304614676-7334-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] gettext.bbclass, bitbake.conf: Append nls options to EXTRA_OECONF instead of +=
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
X-List-Received-Date: Thu, 05 May 2011 17:00:57 -0000

Some recipes do not defined EXTRA_OECONF in such cases += drops
the --enable|--disable-nls options. In another case where recipe
defines EXTRA_OECONF instead of adding/appending to it then
--enable|--disable-nls options are lost from EXTRA_OECONF

We define EXTRA_OECONF = "" in bitbake.conf so the variable exists
always.

We use _append instead of += so the option is added at very end
and not lost.

We only return empty gettext dependencies if its a target recipe
in case when USE_NLS is not set because the native/cross/nativesdk recipes still
need the gettext dependencies

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/gettext.bbclass |    6 +++---
 meta/conf/bitbake.conf       |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index 6f79e5e..86b505b 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -1,7 +1,7 @@
 def gettext_dependencies(d):
-    if d.getVar('USE_NLS', True) == 'no':
+    if d.getVar('USE_NLS', True) == 'no' and not oe.utils.inherits(d, 'native', 'nativesdk', 'cross'):
         return ""
-    if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True) and not oe.utils.inherits(d, 'cross-canadian'):
+    if d.getVar('INHIBIT_DEFAULT_DEPS', True) and not oe.utils.inherits(d, 'cross-canadian'):
         return ""
     return d.getVar('DEPENDS_GETTEXT', False)
 
@@ -14,4 +14,4 @@ def gettext_oeconf(d):
 DEPENDS_GETTEXT = "virtual/gettext gettext-native"
 
 BASEDEPENDS =+ "${@gettext_dependencies(d)}"
-EXTRA_OECONF += "${@gettext_oeconf(d)}"
+EXTRA_OECONF_append = " ${@gettext_oeconf(d)}"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a2b36bd..4a1bfa1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -395,7 +395,7 @@ export BUILD_NM = "${BUILD_PREFIX}nm"
 
 export MAKE = "make"
 EXTRA_OEMAKE = "-e MAKEFLAGS="
-
+EXTRA_OECONF = ""
 export LC_ALL = "C"
 
 ##################################################################
-- 
1.7.4.1



