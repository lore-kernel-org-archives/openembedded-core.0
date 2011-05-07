Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIcNI-0006sR-RO
	for openembedded-core@lists.openembedded.org;
	Sat, 07 May 2011 09:56:29 +0200
Received: by mail-pv0-f175.google.com with SMTP id 30so1799429pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 May 2011 00:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=kkZ3nZovLut3lx8maEekPxGF2m6Mg6OCuDcBzTIgodo=;
	b=NdSQLUFy2qK3Hut1/l9XW0dp0g9MBmsPHvalkrXW7mFGUxfMO29tKfo0ojrhObY1Hv
	DyC7sgaAE9QVpC2YBhsmLZa/ixEBypuhLqXtAkk6o1MNOO6pjPt7DPgXjsAk3MX3fCM4
	wOd7R3+ahWi1rlPE03qscAR2Yky/5e/Znrzzk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=LwBG6aAWFu5SOuBbEieLiEfzGHxCCB1FpgHX6OKUSD2HxRlT5K9ELK5FG4OEoWVrwU
	UpJ/edWRGz/58xdBjoVc86qD+JNivCHDRVFtO96VcvWxsDpTwXtbNTVGgAcnvJoPfwhP
	wLyHqU0CMgfV3JvRBF3MOj99u2s/+o1tXsvvQ=
Received: by 10.143.20.31 with SMTP id x31mr2508207wfi.152.1304754828993;
	Sat, 07 May 2011 00:53:48 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w11sm5207934wfh.18.2011.05.07.00.53.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 00:53:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat,  7 May 2011 00:53:44 -0700
Message-Id: <ef12c5f6e265c21b668bb7761d4519ad23ea9a0e.1304754527.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1304754527.git.raj.khem@gmail.com>
References: <cover.1304754527.git.raj.khem@gmail.com>
Subject: [PATCH 3/8] gettext.bbclass, bitbake.conf: Append nls options to EXTRA_OECONF instead of +=
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
X-List-Received-Date: Sat, 07 May 2011 07:56:29 -0000

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



