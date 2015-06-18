Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1F222606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 17:07:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 18 Jun 2015 10:07:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,640,1427785200"; d="scan'208";a="749125490"
Received: from irsmsx151.ger.corp.intel.com ([163.33.192.59])
	by orsmga002.jf.intel.com with ESMTP; 18 Jun 2015 10:07:35 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.245]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.108]) with mapi id
	14.03.0224.002; Thu, 18 Jun 2015 18:07:34 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH V2] openssl: fix building on x32 systems
Thread-Index: AQHQp7LHgo42JX+7y0OBVYFkJn6+iZ2uFl6ggARst8A=
Date: Thu, 18 Jun 2015 17:07:33 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB44AED4F9@irsmsx105.ger.corp.intel.com>
References: <1434403935-20264-1-git-send-email-cristian.iorga@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB44AD479C@irsmsx105.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB44AD479C@irsmsx105.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH V2] openssl: fix building on x32 systems
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
X-List-Received-Date: Thu, 18 Jun 2015 17:07:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Iorga, Cristian
Sent: Tuesday, June 16, 2015 12:34 AM
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V2] openssl: fix building on x32 systems

Signed off the original patch for V2.
/Cristian

-----Original Message-----
From: Iorga, Cristian
Sent: Tuesday, June 16, 2015 12:32 AM
To: openembedded-core@lists.openembedded.org
Cc: Iorga, Cristian
Subject: [PATCH V2] openssl: fix building on x32 systems

Fix build on Fedora 21 i686.

When building on x32 systems where the default type is 32bit, make sure tha=
t 64bit integers can be represented transparently.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../openssl/openssl/openssl-1.0.2a-x32-asm.patch   | 46 ++++++++++++++++++=
++++
 .../recipes-connectivity/openssl/openssl_1.0.2a.bb |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-1.0.2=
a-x32-asm.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-1.0.2a-x32-a=
sm.patch b/meta/recipes-connectivity/openssl/openssl/openssl-1.0.2a-x32-asm=
.patch
new file mode 100644
index 0000000..1e5bfa1
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/openssl-1.0.2a-x32-asm.p
+++ atch
@@ -0,0 +1,46 @@
+https://rt.openssl.org/Ticket/Display.html?id=3D3759&user=3Dguest&pass=3Dg=
ues
+t
+
+From 6257d59b3a68d2feb9d64317a1c556dc3813ee61 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Sat, 21 Mar 2015 06:01:25 -0400
+Subject: [PATCH] crypto: use bigint in x86-64 perl
+
+Upstream-Status: Pending
+Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
+
+When building on x32 systems where the default type is 32bit, make sure=20
+we can transparently represent 64bit integers.  Otherwise we end up=20
+with build errors like:
+/usr/bin/perl asm/ghash-x86_64.pl elf > ghash-x86_64.s Integer overflow=20
+in hexadecimal number at asm/../../perlasm/x86_64-xlate.pl line 201, <> li=
ne 890.
+...
+ghash-x86_64.s: Assembler messages:
+ghash-x86_64.s:890: Error: junk '.15473355479995e+19' after expression
+
+We don't enable this globally as there are some cases where we'd get=20
+32bit values interpreted as unsigned when we need them as signed.
+
+Reported-by: Bertrand Jacquin <bertrand@jacquin.bzh>
+URL: https://bugs.gentoo.org/542618
+---
+ crypto/perlasm/x86_64-xlate.pl | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/crypto/perlasm/x86_64-xlate.pl=20
+b/crypto/perlasm/x86_64-xlate.pl index aae8288..0bf9774 100755
+--- a/crypto/perlasm/x86_64-xlate.pl
++++ b/crypto/perlasm/x86_64-xlate.pl
+@@ -195,6 +195,10 @@ my %globals;
+     sub out {
+     	my $self =3D shift;
+=20
++	# When building on x32 ABIs, the expanded hex value might be too
++	# big to fit into 32bits.  Enable transparent 64bit support here
++	# so we can safely print it out.
++	use bigint;
+ 	if ($gas) {
+ 	    # Solaris /usr/ccs/bin/as can't handle multiplications
+ 	    # in $self->{value}
+--
+2.3.3
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb b/meta/rec=
ipes-connectivity/openssl/openssl_1.0.2a.bb
index f4006f6..d7f0259 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2a.bb
@@ -37,6 +37,7 @@ SRC_URI +=3D "file://configure-targets.patch \
             file://run-ptest \
             file://crypto_use_bigint_in_x86-64_perl.patch \
             file://0001-bn-bn_lcl.h-fix-MIPS-specific-gcc-version-check.pa=
tch \
+            file://openssl-1.0.2a-x32-asm.patch \
            "
=20
 SRC_URI[md5sum] =3D "a06c547dac9044161a477211049f60ef"
--
2.1.4

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

