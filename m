Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C173360DF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 13:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7EDYjXQ014270 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:34:45 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id C6ZZAc4uNSjB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:34:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7EDYg5P014267
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:34:43 +0100
Message-ID: <1408023282.22187.104.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Aug 2014 14:34:42 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] glib-2.0: Allow correct printf configuration on darwin/mingw
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
X-List-Received-Date: Thu, 14 Aug 2014 13:34:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

mingw and darwin builds need to change the value of printf from no
to yes. Whilst you can do this from a bbappend, its currently a bit ugly
and assumes knowledge of the other conf arguments. Fixing this in the glib
recipe directly is cleaner in this case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 373f962..f797ab3 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -31,7 +31,10 @@ S = "${WORKDIR}/glib-${PV}"
 
 CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap --disable-man"
 
-EXTRA_OECONF = "--enable-included-printf=no ${CORECONF}"
+PRINTF = "--enable-included-printf=no"
+PRINTF_darwin = "--enable-included-printf=yes"
+PRINTF_mingw32 = "--enable-included-printf=yes"
+EXTRA_OECONF = "${PRINTF} ${CORECONF}"
 EXTRA_OECONF_class-native = "${CORECONF} --disable-selinux"
 EXTRA_OECONF_append_libc-uclibc = " --with-libiconv=gnu"
 



