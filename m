Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phycard.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id DE3E67665F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 13:35:23 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 927A4A00414
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 15:27:58 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016080415275724-19327 ;
	Thu, 4 Aug 2016 15:27:57 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 4 Aug 2016 15:27:49 +0200
Message-Id: <1470317274-27771-3-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1470317274-27771-1-git-send-email-s.mueller-klieser@phytec.de>
References: <1470317274-27771-1-git-send-email-s.mueller-klieser@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 04.08.2016 15:27:57,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 04.08.2016 15:27:57
X-TNEFEvaluated: 1
Subject: [PATCH 2/7] openssl: remove dangling patch
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
X-List-Received-Date: Thu, 04 Aug 2016 13:35:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 .../openssl/crypto=5Fuse=5Fbigint=5Fin=5Fx86-64=5Fperl.patch | 35 --------=
--------------
 1 file changed, 35 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/crypto=5Fuse=
=5Fbigint=5Fin=5Fx86-64=5Fperl.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/crypto=5Fuse=5Fbigin=
t=5Fin=5Fx86-64=5Fperl.patch b/meta/recipes-connectivity/openssl/openssl/cr=
ypto=5Fuse=5Fbigint=5Fin=5Fx86-64=5Fperl.patch
deleted file mode 100644
index 4f81d85..0000000
--- a/meta/recipes-connectivity/openssl/openssl/crypto=5Fuse=5Fbigint=5Fin=
=5Fx86-64=5Fperl.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Backport
-
-When building on x32 systems where the default type is 32bit, make sure
-we can transparently represent 64bit integers.  Otherwise we end up with
-build errors like:
-/usr/bin/perl asm/ghash-x86=5F64.pl elf > ghash-x86=5F64.s
-Integer overflow in hexadecimal number at asm/../../perlasm/x86=5F64-xlate=
.pl line 201, <> line 890.
-...
-ghash-x86=5F64.s: Assembler messages:
-ghash-x86=5F64.s:890: Error: junk '.15473355479995e+19' after expression
-
-We don't enable this globally as there are some cases where we'd get
-32bit values interpreted as unsigned when we need them as signed.
-
-Reported-by: Bertrand Jacquin <bertrand@jacquin.bzh>
-URL: https://bugs.gentoo.org/542618
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
-Index: openssl-1.0.2a/crypto/perlasm/x86=5F64-xlate.pl
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openssl-1.0.2a.orig/crypto/perlasm/x86=5F64-xlate.pl
-+++ openssl-1.0.2a/crypto/perlasm/x86=5F64-xlate.pl
-@@ -194,7 +194,10 @@ my %globals;
-     }
-     sub out {
-     	my $self =3D shift;
--
-+	# When building on x32 ABIs, the expanded hex value might be too
-+	# big to fit into 32bits. Enable transparent 64bit support here
-+	# so we can safely print it out.
-+	use bigint;
- 	if ($gas) {
- 	    # Solaris /usr/ccs/bin/as can't handle multiplications
- 	    # in $self->{value}
--=20
1.9.1


