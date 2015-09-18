Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 822 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 18 Sep 2015 06:57:49 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id AE3A676D84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 06:57:49 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id t8I6i4US012824
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 08:44:05 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.78.24])
	by mail3.siemens.de (8.15.1/8.15.1) with ESMTP id t8I6i4us004049;
	Fri, 18 Sep 2015 08:44:04 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 08:43:42 +0200
Message-Id: <1442558622-16621-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libpcre: Allow building 16 and 32bit libpcre versions
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
X-List-Received-Date: Fri, 18 Sep 2015 06:57:54 -0000

This change allows selecting the 8, 16 or 32 bit version via PACKAGECONFIG.
By default only the 8bit version is built, this corresponds to the old behavior.

Some packages like Qt5 require the 16 bit version of libpcre.
After this change the corresponding layer can easily enable the version
needed via .bbappend.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/recipes-support/libpcre/libpcre_8.37.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/libpcre/libpcre_8.37.bb b/meta/recipes-support/libpcre/libpcre_8.37.bb
index bcfc9e9..1880639 100644
--- a/meta/recipes-support/libpcre/libpcre_8.37.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.37.bb
@@ -22,6 +22,11 @@ S = "${WORKDIR}/pcre-${PV}"
 PROVIDES += "pcre"
 DEPENDS += "bzip2 zlib"
 
+PACKAGECONFIG ??= "pcre8"
+
+PACKAGECONFIG[pcre8] = "--enable-pcre8,--disable-pcre8"
+PACKAGECONFIG[pcre16] = "--enable-pcre16,--disable-pcre16"
+PACKAGECONFIG[pcre32] = "--enable-pcre32,--disable-pcre32"
 PACKAGECONFIG[pcretest-readline] = "--enable-pcretest-libreadline,--disable-pcretest-libreadline,readline,"
 
 BINCONFIG = "${bindir}/pcre-config"
-- 
2.1.4


