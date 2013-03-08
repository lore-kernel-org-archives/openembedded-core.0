Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1UDxKQ-0006Yo-C6
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 14:27:23 +0100
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 8C4EA20B81
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2013 08:10:46 -0500 (EST)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute4.internal (MEProxy); Fri, 08 Mar 2013 08:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:content-type:date
	:message-id:mime-version; s=smtpout; bh=wA47w9CrTIEOjMzbovz3Xod5
	LdM=; b=QaTe9qWRwUuDxHIk+uPkF4IV5IOoeBvxYb3++Z40h+11JjcC3m8Nh89y
	DYwTr3QCXpTjdOJKqvPAC6Hs6X2tRaYOW1c0pg/8Q1M0r1QLCY8dP0TCtNoSWIEz
	JLTAdmxISv5d18Ys4KCDIcYlWZdBk13CPj0sHUaBZARBGQE8dYY=
X-Sasl-enc: 5/j1D1fMvoAj+CXbH0yMQ11z8dCmoQQzp8eH0FKqoWIU 1362748246
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id 428CF20119F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2013 08:10:46 -0500 (EST)
From: Colin Walters <walters@verbum.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 08 Mar 2013 08:10:45 -0500
Message-ID: <1362748245.6076.748.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-30.el6) 
Subject: [PATCH] cracklib: Generate compiled dict using default dictionary
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
X-List-Received-Date: Fri, 08 Mar 2013 13:27:28 -0000
X-Groupsio-MsgNum: 36325
Content-Type: multipart/mixed; boundary="=-Lq2SNg0praa9ApIjq4VK"

--=-Lq2SNg0praa9ApIjq4VK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

While cracklib compiles, the generated library's FascistCheck() API
will look for the default compiled dictionary, fail to find it, and
invoke exit(1), which then in turn breaks gnome-initial-setup that
uses cracklib via libpwquality.  (Quality here obviously referring to
the password, and not the libraries...)

What we do here is basically the same as what happens in the current
Fedora spec file, except the latter uses a far larger dictionary.

To make this work, we need to build cracklib-native because the
dictionary compiler is written in native code.

Signed-off-by: Colin Walters <walters@verbum.org>
---
 meta/recipes-extended/cracklib/cracklib_2.8.22.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)



--=-Lq2SNg0praa9ApIjq4VK
Content-Disposition: attachment; filename*0=0001-cracklib-Generate-compiled-dict-using-default-dictio.pat; filename*1=ch
Content-Type: text/x-patch; name="0001-cracklib-Generate-compiled-dict-using-default-dictio.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 6d47136d108d4063e3faa9c91de33710a5a66855 Mon Sep 17 00:00:00 2001
From: Colin Walters <walters@verbum.org>
Date: Thu, 7 Mar 2013 18:45:22 -0500
Subject: [PATCH] cracklib: Generate compiled dict using default dictionary

While cracklib compiles, the generated library's FascistCheck() API
will look for the default compiled dictionary, fail to find it, and
invoke exit(1), which then in turn breaks gnome-initial-setup that
uses cracklib via libpwquality.  (Quality here obviously referring to
the password, and not the libraries...)

What we do here is basically the same as what happens in the current
Fedora spec file, except the latter uses a far larger dictionary.

To make this work, we need to build cracklib-native because the
dictionary compiler is written in native code.

Signed-off-by: Colin Walters <walters@verbum.org>
---
 meta/recipes-extended/cracklib/cracklib_2.8.22.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.8.22.bb b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
index 1ae1aca..63d4c24 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
@@ -4,7 +4,8 @@ HOMEPAGE = "http://sourceforge.net/projects/cracklib"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-DEPENDS = "zlib"
+DEPENDS = "cracklib-native zlib"
+DEPENDS_class-native = "zlib"
 PR ="r0"
 
 EXTRA_OECONF = "--without-python"
@@ -15,3 +16,12 @@ SRC_URI[md5sum] = "463177b5c29c7a598c991e12a4898e06"
 SRC_URI[sha256sum] = "feaff49bfb513ec10b2618c00d2f7f60776ba93fcc5fa22dd3479dd9cad9f770"
 
 inherit autotools gettext
+
+BBCLASSEXTEND = "native"
+
+do_install_append() {
+	create-cracklib-dict -o ${D}${datadir}/cracklib/pw_dict ${D}${datadir}/cracklib/cracklib-small
+}
+
+do_install_append_virtclass-native() {
+}
-- 
1.8.1.2


--=-Lq2SNg0praa9ApIjq4VK--
