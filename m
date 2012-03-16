Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8ZVV-0007qR-Rv for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 16:55:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GFlB21004752
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 15:47:11 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03426-09 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 15:47:07 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GFl3xP004746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 15:47:04 GMT
Message-ID: <1331912823.18586.196.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Mar 2012 15:47:03 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] wget: Fix bad RPATH QA warning
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
X-List-Received-Date: Fri, 16 Mar 2012 15:55:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

WARNING: QA Issue: package wget contains bad RPATH /media/build1/poky/build/tmp/sysroots/qemux86/lib in file /media/build1/poky/build/tmp/work/i586-poky-linux/wget-1.13.4-r13.1/packages-split/wget/usr/bin/wget.wget

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 02ea2b8..96d49a5 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -8,7 +8,7 @@ INC_PR = "r13"
 
 inherit autotools gettext update-alternatives
 
-EXTRA_OECONF = "--with-libc --enable-ipv6 --with-libssl-prefix=${STAGING_DIR_HOST} --with-ssl=openssl"
+EXTRA_OECONF = "--with-libc --enable-ipv6 --with-libssl-prefix=${STAGING_DIR_HOST} --with-ssl=openssl --disable-rpath"
 
 do_install_append () {
 	mv ${D}${bindir}/wget ${D}${bindir}/wget.${PN}
diff --git a/meta/recipes-extended/wget/wget_1.13.4.bb b/meta/recipes-extended/wget/wget_1.13.4.bb
index b2da52f..e20ff48 100644
--- a/meta/recipes-extended/wget/wget_1.13.4.bb
+++ b/meta/recipes-extended/wget/wget_1.13.4.bb
@@ -1,4 +1,4 @@
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://fix_makefile.patch \




