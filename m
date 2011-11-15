Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RQQ3C-0000zg-2d for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 21:56:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAFKnqlZ029709
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 20:49:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29037-04 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 20:49:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAFKnhfc029703
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 20:49:45 GMT
Message-ID: <1321390187.26881.226.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Nov 2011 20:49:47 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] libconvert-asn1-perl/libtimedate-perl: Convert to use allarch
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
X-List-Received-Date: Tue, 15 Nov 2011 20:56:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Both these recipes generate architecture independent packages.
They can safely use the allarch class to ensure they really
are indepentent from the target compiler and so forth and
hence ensure sstate packages with good dependencies.

[YOCTO #1075]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb
index 48e107c..98ca804 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb
@@ -11,10 +11,8 @@ SRC_URI[sha256sum] = "be63d5cc715d7306e54b41d3c68c3617ca306289cff619a2ca43505e35
 
 S = "${WORKDIR}/Convert-ASN1-${PV}"
 
-inherit cpan
+inherit cpan allarch
 
 EXTRA_PERLFLAGS = "-I ${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}"
 
-BBCLASSEXTEND="native"
-
-PACKAGE_ARCH = "all"
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/perl/libtimedate-perl_1.20.bb b/meta/recipes-extended/perl/libtimedate-perl_1.20.bb
index c925980..67c5836 100644
--- a/meta/recipes-extended/perl/libtimedate-perl_1.20.bb
+++ b/meta/recipes-extended/perl/libtimedate-perl_1.20.bb
@@ -10,13 +10,12 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/TimeDate-${PV}.tar.
 
 S = "${WORKDIR}/TimeDate-${PV}"
 
-inherit cpan
+inherit cpan allarch
 
-BBCLASSEXTEND="native"
+BBCLASSEXTEND = "native"
 
 RDEPENDS_${PN}_virtclass-native = ""
 RDEPENDS_${PN} += "perl-module-carp perl-module-exporter perl-module-strict perl-module-time-local"
-PACKAGE_ARCH = "all"
 
 SRC_URI[md5sum] = "7da7452bce4c684e4238e6d09b390200"
 SRC_URI[sha256sum] = "f8251a791f6692c69952b4af697c01df93981ad1ab133279d034656a03cd3755"




