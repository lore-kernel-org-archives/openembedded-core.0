Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TGyO4-0003r6-Ex
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 22:39:16 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 26 Sep 2012 13:26:23 -0700
Received: by weyt44 with SMTP id t44so227909wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 13:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=HSa8CKSV5AwdequiE0TFotdXzukirr1i9ZagS1ldjIw=;
	b=JqQK8/g+e3WdzuzmaZG9zSITjaJMJwqAZk8uyllZkzMI4XNW0mWqG6lWjO5KTz5W5P
	CFxKXr0WXSwVq9wUQWeD0OwTEUFEAxppRba8ZGVrPofMTmYrvr+v+W09mFwlFqDUGKA4
	pkjvrbeKwHWxinixCCFdC+3HUrih8A/ilcPyLIrxPgr6jjWZE2lKYJHwdueGKYdmdqSl
	GFitLl2v2oJ+fH48DQq+bLA+vPoiFkK32ENmnO5iwYWdrZyXnxXR23QwZgyYgY56rbom
	t1VeAH5ak9JI750enNn8wdmOY5OMTt0Fo42Eocr//kVKMZDLoX1o5RmiW693oUGpsk3G
	5pXQ==
Received: by 10.180.84.202 with SMTP id b10mr3600363wiz.13.1348691180857;
	Wed, 26 Sep 2012 13:26:20 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hv8sm34240340wib.0.2012.09.26.13.26.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 13:26:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2012 21:25:19 +0100
Message-Id: <1348691119-13561-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlM40mt6UymjgzlOf4pPGbGkcPdhjkOVcIABbv5Rqy7TJi2DmEYC7+2Ra4CwuNfRsPb/Bux
Subject: [PATCH] dbus: disable all X11 when native
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
X-List-Received-Date: Wed, 26 Sep 2012 20:39:16 -0000

Without --without-x the X11 detection would still go ahead and find the host X11
headers, which seems to cause problems at link time.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/dbus/dbus.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 5c99e11..550eb0a 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -10,7 +10,7 @@ DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X
 DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
 DEPENDS_virtclass-nativesdk = "nativesdk-expat virtual/nativesdk-libintl virtual/libx11"
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
@@ -64,7 +64,7 @@ pkg_postinst_dbus() {
 }
 
 EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
-EXTRA_OECONF_X_virtclass-native = "--disable-x11-autolaunch"
+EXTRA_OECONF_X_virtclass-native = "--without-x --disable-x11-autolaunch"
 
 EXTRA_OECONF = "--disable-tests \
                 --disable-checks \
-- 
1.7.10



