Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC4960107
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jan 2018 17:58:43 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0DHwffQ031830
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 13 Jan 2018 17:58:42 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eaQ4n-0004GX-B0; Sat, 13 Jan 2018 17:58:41 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Jan 2018 17:58:38 +0000
Message-Id: <1515866318-16353-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515866318-16353-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1515866318-16353-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/2] cross-canadian/gettext: Drop unneeded nativesdk-gettext dependency
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
X-List-Received-Date: Sat, 13 Jan 2018 17:58:45 -0000

In line with the other gettext cleanups, drop the nativesdk-gettext dependency
as it isn't needed (similarly to the previous target gettext dependencies).

This then means we can drop DEPENDS_GETTEXT as there are no other users.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cross-canadian.bbclass | 2 --
 meta/classes/gettext.bbclass        | 4 +---
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index cce09c9..ee8aa61 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -123,8 +123,6 @@ LDFLAGS = "${BUILDSDK_LDFLAGS} \
            -Wl,-rpath-link,${STAGING_LIBDIR}/.. \
            -Wl,-rpath,${libdir}/.. "
 
-DEPENDS_GETTEXT = "gettext-native nativesdk-gettext"
-
 #
 # We need chrpath >= 0.14 to ensure we can deal with 32 and 64 bit
 # binaries
diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index da68e63..be2ef3b 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -3,7 +3,7 @@ def gettext_dependencies(d):
         return ""
     if d.getVar('USE_NLS') == 'no':
         return "gettext-minimal-native"
-    return d.getVar('DEPENDS_GETTEXT', False)
+    return "gettext-native"
 
 def gettext_oeconf(d):
     if d.getVar('USE_NLS') == 'no':
@@ -13,8 +13,6 @@ def gettext_oeconf(d):
         return '--disable-nls'
     return "--enable-nls"
 
-DEPENDS_GETTEXT ??= "gettext-native"
-
 BASEDEPENDS_append = " ${@gettext_dependencies(d)}"
 EXTRA_OECONF_append = " ${@gettext_oeconf(d)}"
 
-- 
2.7.4


