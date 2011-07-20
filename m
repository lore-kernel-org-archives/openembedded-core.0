Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1Qjd8p-000070-TF
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 22:13:12 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6KK91Mk020211
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:09:02 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 13:09:00 -0700
Message-Id: <67a3d912c0a1497d75a717dfa3a7869224c6591c.1311192464.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311192464.git.tom_rini@mentor.com>
References: <cover.1311192464.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311192464.git.tom_rini@mentor.com>
References: <cover.1311192464.git.tom_rini@mentor.com>
Subject: [PATCH 5/5] icon-naming-utils-native: Fix long path to perl in icon-name-mapping
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
X-List-Received-Date: Wed, 20 Jul 2011 20:13:12 -0000

This is 5396e0868cf89787746fa6341ddb1f271a770595 in oe.dev but here we
instead use the nativeperl wrapper.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../icon-naming-utils-native_0.8.7.bb              |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/icon-naming-utils/icon-naming-utils-native_0.8.7.bb b/meta/recipes-devtools/icon-naming-utils/icon-naming-utils-native_0.8.7.bb
index d34fb03..4760c96 100644
--- a/meta/recipes-devtools/icon-naming-utils/icon-naming-utils-native_0.8.7.bb
+++ b/meta/recipes-devtools/icon-naming-utils/icon-naming-utils-native_0.8.7.bb
@@ -1,6 +1,6 @@
 LICENSE = "GPLv2"
 DEPENDS = "libxml-simple-perl-native"
-PR = "r2"
+PR = "r3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
@@ -9,3 +9,8 @@ SRC_URI = "http://tango.freedesktop.org/releases/icon-naming-utils-0.8.7.tar.gz"
 S = "${WORKDIR}/icon-naming-utils-${PV}"
 
 inherit autotools native perlnative
+
+do_configure_append() {
+	# Make sure we use our nativeperl wrapper.
+	sed -i -e "1s:#!.*:#!/usr/bin/env nativeperl:" ${S}/icon-name-mapping.pl.in
+}
-- 
1.7.0.4



