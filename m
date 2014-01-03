Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1AAF560CF1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 09:24:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s039Ohwk026133
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jan 2014 01:24:43 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 3 Jan 2014 01:24:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 4 Jan 2014 01:27:12 +0800
Message-ID: <5b836adb7023cf075f9eb2246c7b2bbe420fd1cf.1388769973.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1388769973.git.liezhi.yang@windriver.com>
References: <cover.1388769973.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] gconf.bbclass: remove --disable-schemas-install
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
X-List-Received-Date: Fri, 03 Jan 2014 09:24:42 -0000
Content-Type: text/plain

Gnome has moved the schemas to the gsettings-desktop-schemas pkg, so
there is no --disable-schemas-install option any more, and we already
have the gsettings-desktop-schemas recipe, so remove it, it wil fix
the warning:

configure was passed unrecognised options: --disable-schemas-install

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/gconf.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
index e9076b2..8ebb512 100644
--- a/meta/classes/gconf.bbclass
+++ b/meta/classes/gconf.bbclass
@@ -7,12 +7,6 @@ DEPENDS += "gconf gconf-native"
 export GCONF_SCHEMA_INSTALL_SOURCE = "xml:merged:${STAGING_DIR_NATIVE}${sysconfdir}/gconf/gconf.xml.defaults"
 export GCONF_BACKEND_DIR = "${STAGING_LIBDIR_NATIVE}/GConf/2"
 
-# Disable install-time schema registration as we're a packaging system so this
-# happens in the postinst script, not at install time.  Set both the configure
-# script option and the traditional envionment variable just to make sure.
-EXTRA_OECONF += "--disable-schemas-install"
-export GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL = "1"
-
 gconf_postinst() {
 if [ "x$D" != "x" ]; then
 	export GCONF_CONFIG_SOURCE="xml::$D${sysconfdir}/gconf/gconf.xml.defaults"
-- 
1.8.3.1


