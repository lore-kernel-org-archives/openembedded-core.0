Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 4BBD97199D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 00:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6847220B1D;
	Wed, 11 Jan 2017 00:21:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Ol7pkMImCi3j; Wed, 11 Jan 2017 00:21:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4146120866;
	Wed, 11 Jan 2017 00:21:29 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 95F5716231D;
	Tue, 10 Jan 2017 19:21:28 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 19:21:28 -0500
Message-Id: <1484094088-5338-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [morty][PATCH v2] attr/ea-acl: pass --disable-gettext when USE_NLS=no
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
X-List-Received-Date: Wed, 11 Jan 2017 00:21:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

Fixes following error in configure:
  FATAL ERROR: msgfmt does not seem to be installed.
  attr cannot be built without a working gettext installation.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>

(From OE-Core rev: d044fad8a0ac5d57deb88b25106f3a39cb7c1636)

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - morty still requires expand option to d.getVar()

 meta/recipes-support/attr/ea-acl.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index 370e16f..4d6ad20 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -10,6 +10,7 @@ inherit autotools-brokensep gettext
 EXTRA_AUTORECONF += "--exclude=autoheader"
 EXTRA_OECONF = "INSTALL_USER=root INSTALL_GROUP=root"
 EXTRA_OECONF_append_class-native = " --enable-gettext=no"
+EXTRA_OECONF_append_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS', True) == 'no')]}"
 
 EXTRA_OEMAKE = "PKG_LIB_DIR=${base_libdir} PKG_DEVLIB_DIR=${libdir}"
 
-- 
2.7.4


