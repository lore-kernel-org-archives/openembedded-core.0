Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S0a6B-0002KQ-Cl
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 15:56:47 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NF2AKQ004020 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 15:02:10 GMT
X-Quarantine-ID: <b7UzywHuNEud>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id b7UzywHuNEud
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 15:02:10 +0000 (GMT)
Received: from ted (ted.config [192.168.1.68]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NF28Gc003998
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 15:02:09 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S0Zy2-00029U-EZ
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 14:48:22 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 14:48:11 +0000
Message-Id: <400f544b63d2934dfd512b5f0ca31f0b76557798.1330004039.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <5e4de9be889558b18c52bc0af42d19fafabfce37.1330004039.git.richard.purdie@linuxfoundation.org>
References: <5e4de9be889558b18c52bc0af42d19fafabfce37.1330004039.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
References: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 11/16] dbus-glib: Correctly package bash completion pieces to avoid QA warning
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
X-List-Received-Date: Thu, 23 Feb 2012 14:56:48 -0000

WARNING: For recipe dbus-glib, the following files/directories were installed but not shipped in any package:
WARNING:   /etc
WARNING:   /etc/bash_completion.d
WARNING:   /etc/bash_completion.d/dbus-bash-completion.sh
WARNING:   /usr/libexec/dbus-bash-completion-helper

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/dbus/dbus-glib.inc     |    4 +++-
 meta/recipes-core/dbus/dbus-glib_0.92.bb |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
index 80f68c8..da2845a 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -19,8 +19,10 @@ EXTRA_OECONF = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-in
                 --with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
 EXTRA_OECONF_virtclass-native = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml"
 
+PACKAGES += "${PN}-bash-completion"
+
 FILES_${PN} = "${libdir}/lib*${SOLIBS}"
-FILES_${PN}-bash_completion = "${sysconfdir}/bash_completion.d/dbus-bash-completion.sh \
+FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d/dbus-bash-completion.sh \
    ${libexecdir}/dbus-bash-completion-helper"
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 FILES_${PN}-dev += "${bindir}/dbus-binding-tool"
diff --git a/meta/recipes-core/dbus/dbus-glib_0.92.bb b/meta/recipes-core/dbus/dbus-glib_0.92.bb
index c7266d4..988625b 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.92.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.92.bb
@@ -1,6 +1,6 @@
 require dbus-glib.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "b595b36890c4f9f8f5d5dec131c495f8"
 SRC_URI[sha256sum] = "5a7fd4cf937cdcb7f2eed61341b70ee0f2607450a50db381618598adf60dd40e"
-- 
1.7.5.4



