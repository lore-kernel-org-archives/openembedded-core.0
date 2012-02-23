Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S0ZuW-0001fg-TQ
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 15:44:45 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NElnCU002875 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:47:50 GMT
X-Quarantine-ID: <eIb7GBdMHxfu>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eIb7GBdMHxfu
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:47:49 +0000 (GMT)
Received: from ted (ted.config [192.168.1.68]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NEllwX002870
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:47:49 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S0Ysp-0004sQ-CG
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 13:38:55 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:38:19 +0000
Message-Id: <5aab97771d0b0bdd9e7655e83f897a78e07b1593.1330004039.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
References: <5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
References: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 10/16] glib-2.0: Fix unpackaged files warning
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
X-List-Received-Date: Thu, 23 Feb 2012 14:44:45 -0000

WARNING: For recipe glib-2.0, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/lib/gio
WARNING:   /usr/lib/gio/modules

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
index 111f9a4..e2170bc 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r4"
+PR = "r5"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
@@ -35,6 +35,9 @@ do_install_append() {
   # remove some unpackaged files
   rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyc
   rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyo
+  # and empty dirs
+  rmdir ${D}${libdir}/gio/modules/
+  rmdir ${D}${libdir}/gio/
 }
 
 PACKAGES += "${PN}-codegen"
-- 
1.7.5.4



