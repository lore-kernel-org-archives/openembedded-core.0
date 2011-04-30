Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QGIM4-00024Y-5W
	for openembedded-core@lists.openembedded.org;
	Sun, 01 May 2011 00:09:36 +0200
Received: by pwj9 with SMTP id 9so2272452pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Apr 2011 15:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ncvnDkIi004JVBQrjLs+4P7G6LTGCu+4pBSM8WV9vMQ=;
	b=UmjhQnUPZXuFB7St4tP2+7icS4e30G+V4waYCUiNUNtWXJHF8aCPGk/pp68L7vxSqg
	+wGXRz0RLKUfj0WvsSr5BdOVfmwhm8/EobPfbzqsi6Ez0+pm0qsx3U0eBt7FvMdbWBvK
	pQ2oGjAml632AW2gkNAyUQUeGCkjf9sz69o2g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=SFff9qPBs+Mpqh5CZD33ENFb17Yfr6c1Nk3d+PedKnhl8ROs7hndnEST30oHjTlw+r
	C7hd0acHBv3nM8IU970bVRSdVdn5wHGmInfaBJ1/5VSnRiuX2cTqlsb9bhwyM9QumcfV
	15+jZb9Z0QyNhZfEEpFlVy5SnVn92rmOlEqmU=
Received: by 10.143.25.35 with SMTP id c35mr2406116wfj.100.1304201220540;
	Sat, 30 Apr 2011 15:07:00 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k6sm4975549wfa.17.2011.04.30.15.06.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 30 Apr 2011 15:06:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 30 Apr 2011 15:06:50 -0700
Message-Id: <7cad91d48dbbdbbce7dcd0d0c46d0c47ed9557cb.1304200899.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1304200899.git.raj.khem@gmail.com>
References: <cover.1304200899.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] gettext.bbclass: Use _append instead of =+
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
X-List-Received-Date: Sat, 30 Apr 2011 22:09:37 -0000

Ensure gettext and gettext-native are removed from DEPENDS when
not using NLS

Use append instead of += to get gettext dependecies processed
correctly in all cases

Dont remove gettext-native for native recipes as ENABLE_NLS is
only for target and not for native recipes

Replace using 1 for a boolean type with True

Honor INHIBIT_DEFAULT_DEPS

Remove the added dependencies for gettext if INHIBIT_DEFAULT_DEPS is non
null

operate on virtclass overrides individually

virtclass classes are parsed at the end hence
just doing DEPENDS munging is not enough since
it will be overridden

When inheriting cross-canadian we should not remove
gettext from default deps

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/gettext.bbclass |   30 ++++++++++++++++++++++--------
 1 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index a40e74f..492eb68 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -1,17 +1,31 @@
 def gettext_after_parse(d):
     # Remove the NLS bits if USE_NLS is no.
-    if bb.data.getVar('USE_NLS', d, 1) == 'no':
+    if bb.data.getVar('USE_NLS', d, True) == 'no':
         cfg = oe_filter_out('^--(dis|en)able-nls$', bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
         cfg += " --disable-nls"
-        depends = bb.data.getVar('DEPENDS', d, 1) or ""
-        bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libiconv|virtual/libintl)$', depends, d), d)
+        depends = bb.data.getVar('DEPENDS', d, True) or ""
+        depends = oe_filter_out('^(virtual/libiconv|virtual/libintl|virtual/gettext|gettext)$', depends, d)
+        if not oe.utils.inherits(d, 'native', 'nativesdk', 'cross', 'crosssdk'):
+            depends = oe_filter_out('^(gettext-native)$', depends, d)
+        bb.data.setVar('DEPENDS', depends, d)
         bb.data.setVar('EXTRA_OECONF', cfg, d)
-
+    # check if INHIBIT_DEFAULT_DEPS is 1 then we forcibly remove dependencies
+    # added by this class through DEPENDS_GETTEXT
+    if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True) and not oe.utils.inherits(d, 'cross-canadian'):
+        depends_native = bb.data.getVar('DEPENDS_virtclass-native', d, True) or ""
+        depends_nativesdk = bb.data.getVar('DEPENDS_virtclass-nativesdk', d, True) or ""
+        depends = bb.data.getVar('DEPENDS', d, True) or ""
+        gettext_deps = bb.data.getVar('DEPENDS_GETTEXT', d, True).replace(' ','|')
+        gettext_deps = '^(' + gettext_deps + ')$'
+        depends_native = oe_filter_out(gettext_deps, depends_native, d)
+        depends_nativesdk = oe_filter_out(gettext_deps, depends_nativesdk, d)
+        depends = oe_filter_out(gettext_deps, depends, d)
+        bb.data.setVar('DEPENDS_virtclass-native', depends, d)
+        bb.data.setVar('DEPENDS_virtclass-nativesdk', depends, d)
+        bb.data.setVar('DEPENDS', depends, d)
 python () {
     gettext_after_parse(d)
 }
-
-DEPENDS_GETTEXT = "gettext gettext-native"
-
-DEPENDS =+ "${DEPENDS_GETTEXT}"
 EXTRA_OECONF += "--enable-nls"
+DEPENDS_GETTEXT = "virtual/gettext gettext-native"
+DEPENDS =+ "${DEPENDS_GETTEXT}"
-- 
1.7.4.1



