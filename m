Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C7AEB64D7
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 14:42:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13973.1688136127238975462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 07:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=gvHUgHen;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=654570f755=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35UEUf5A009563
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 14:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=RJ+dHS7jP9wkIXU2f5
	E1bkCG9V31y65Pk9I+w5ywVto=; b=gvHUgHenUWEn5qCSu2m+SkyhsoTAQ/xvr/
	5n6P1AINqHW2qIqLPK/NI020JC7lKDQM4eJfzgj3Maly6mGa1yFDL+tq2vZOTTJC
	E3jpciN7kzncPnwTSjGY8iz8qAV1QJQo8PmvIrTc7CzpyCFFjedBFd05kEmPrdja
	gDOHIeC5rb1k20ngKRILvfntGvMO2nZ3qLGJBL6/5y51nmqyrjtNdbxTt/DUtiqk
	omDcdvyojJkr8XeJfFrgg4PIsB2BXXXQvjz3r8G8D35ClqHGg0DJLESu2lav7B2C
	eQU9tSpsPDSjCMUYDMBH8L211uQtrzrV0OMhWdQY++bS5pRiJ3Gg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdqf4dwnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 14:42:06 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 07:42:04 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Fri, 30 Jun 2023 07:42:03 -0700
From: Soumya <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>, Soumya <soumya.sambu@windriver.com>
Subject: [oe-core][mickledore][PATCH 1/1] perl: Fix CVE-2023-31484 & CVE-2023-31486
Date: Fri, 30 Jun 2023 14:41:57 +0000
Message-ID: <20230630144157.36409-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
X-Proofpoint-ORIG-GUID: eXX-eyw6Dzrki9CtjVWwxuIZkOjoLg7M
X-Proofpoint-GUID: eXX-eyw6Dzrki9CtjVWwxuIZkOjoLg7M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_05,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306300124
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 35UEUf5A009563
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 14:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183698

CPAN.pm before 2.35 does not verify TLS certificates when downloading
distributions over HTTPS.

HTTP::Tiny before 0.083, a Perl core module since 5.13.9 and
available standalone on CPAN, has an insecure default TLS
configuration where users must opt in to verify certificates.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-31484
https://nvd.nist.gov/vuln/detail/CVE-2023-31486

Upstream patches:
https://github.com/andk/cpanpm/commit/9c98370287f4e709924aee7c58ef21c8528=
9a7f0
https://github.com/chansen/p5-http-tiny/commit/77f557ef84698efeb6eed04e4a=
9704eaf85b741d
https://github.com/chansen/p5-http-tiny/commit/a22785783b17cbaa28afaee4a0=
24d81a1903701d

Signed-off-by: Soumya <soumya.sambu@windriver.com>
---
 .../perl/files/CVE-2023-31484.patch           |  29 +++
 .../perl/files/CVE-2023-31486-0001.patch      | 217 ++++++++++++++++++
 .../perl/files/CVE-2023-31486-0002.patch      |  30 +++
 meta/recipes-devtools/perl/perl_5.36.0.bb     |   3 +
 4 files changed, 279 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31484.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486-0001.=
patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486-0002.=
patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31484.patch b/meta=
/recipes-devtools/perl/files/CVE-2023-31484.patch
new file mode 100644
index 0000000000..1f7cbd0da1
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2023-31484.patch
@@ -0,0 +1,29 @@
+From a625ec2cc3a0b6116c1f8b831d3480deb621c245 Mon Sep 17 00:00:00 2001
+From: Stig Palmquist <git@stig.io>
+Date: Tue, 28 Feb 2023 11:54:06 +0100
+Subject: [PATCH] Add verify_SSL=3D>1 to HTTP::Tiny to verify https serve=
r
+ identity
+
+Upstream-Status: Backport [https://github.com/andk/cpanpm/commit/9c98370=
287f4e709924aee7c58ef21c85289a7f0]
+
+CVE: CVE-2023-31484
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ cpan/CPAN/lib/CPAN/HTTP/Client.pm | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cpan/CPAN/lib/CPAN/HTTP/Client.pm b/cpan/CPAN/lib/CPAN/HTTP=
/Client.pm
+index 4fc792c..a616fee 100644
+--- a/cpan/CPAN/lib/CPAN/HTTP/Client.pm
++++ b/cpan/CPAN/lib/CPAN/HTTP/Client.pm
+@@ -32,6 +32,7 @@ sub mirror {
+
+     my $want_proxy =3D $self->_want_proxy($uri);
+     my $http =3D HTTP::Tiny->new(
++        verify_SSL =3D> 1,
+         $want_proxy ? (proxy =3D> $self->{proxy}) : ()
+     );
+
+--
+2.40.0
diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch b=
/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch
new file mode 100644
index 0000000000..e2a2216a0d
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch
@@ -0,0 +1,217 @@
+From e1ca8defeff496000fc96600ebfca7250065c1f1 Mon Sep 17 00:00:00 2001
+From: Stig Palmquist <git@stig.io>
+Date: Thu, 29 Jun 2023 14:36:05 +0000
+Subject: [PATCH] Change verify_SSL default to 1, add ENV var to enable
+ insecure default
+
+- Changes the `verify_SSL` default parameter from `0` to `1`
+
+  Based on patch by Dominic Hargreaves:
+  https://salsa.debian.org/perl-team/interpreter/perl/-/commit/1490431e4=
0e22052f75a0b3449f1f53cbd27ba92
+
+  Fixes CVE-2023-31486
+
+- Add check for `$ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT}` that
+  enables the previous insecure default behaviour if set to `1`.
+
+  This provides a workaround for users who encounter problems with the
+  new `verify_SSL` default.
+
+  Example to disable certificate checks:
+  ```
+    $ PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT=3D1 ./script.pl
+  ```
+
+- Updates to documentation:
+  - Describe changing the verify_SSL value
+  - Describe the escape-hatch environment variable
+  - Remove rationale for not enabling verify_SSL
+  - Add missing certificate search paths
+  - Replace "SSL" with "TLS/SSL" where appropriate
+  - Use "machine-in-the-middle" instead of "man-in-the-middle"
+
+Upstream-Status: Backport [https://github.com/chansen/p5-http-tiny/commi=
t/77f557ef84698efeb6eed04e4a9704eaf85b741d]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ cpan/HTTP-Tiny/lib/HTTP/Tiny.pm | 86 ++++++++++++++++++++++-----------
+ 1 file changed, 57 insertions(+), 29 deletions(-)
+
+diff --git a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm b/cpan/HTTP-Tiny/lib/HTTP/T=
iny.pm
+index 83ca06d..5f6ced8 100644
+--- a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
++++ b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
+@@ -40,10 +40,14 @@ sub _croak { require Carp; Carp::croak(@_) }
+ #pod * C<timeout> =E2=80=94 Request timeout in seconds (default is 60) =
If a socket open,
+ #pod   read or write takes longer than the timeout, the request respons=
e status code
+ #pod   will be 599.
+-#pod * C<verify_SSL> =E2=80=94 A boolean that indicates whether to vali=
date the SSL
+-#pod   certificate of an C<https> =E2=80=94 connection (default is fals=
e)
++#pod * C<verify_SSL> =E2=80=94 A boolean that indicates whether to vali=
date the TLS/SSL
++#pod   certificate of an C<https> =E2=80=94 connection (default is true=
). Changed from false
++#pod   to true in version 0.083.
+ #pod * C<SSL_options> =E2=80=94 A hashref of C<SSL_*> =E2=80=94 options=
 to pass through to
+ #pod   L<IO::Socket::SSL>
++#pod * C<$ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT}> - Changes the de=
fault
++#pod   certificate verification behavior to not check server identity i=
f set to 1.
++#pod   Only effective if C<verify_SSL> is not set. Added in version 0.0=
83.
+ #pod
+ #pod An accessor/mutator method exists for each attribute.
+ #pod
+@@ -111,11 +115,17 @@ sub timeout {
+ sub new {
+     my($class, %args) =3D @_;
+
++    # Support lower case verify_ssl argument, but only if verify_SSL is=
 not
++    # true.
++    if ( exists $args{verify_ssl} ) {
++        $args{verify_SSL}  ||=3D $args{verify_ssl};
++    }
++
+     my $self =3D {
+         max_redirect =3D> 5,
+         timeout      =3D> defined $args{timeout} ? $args{timeout} : 60,
+         keep_alive   =3D> 1,
+-        verify_SSL   =3D> $args{verify_SSL} || $args{verify_ssl} || 0, =
# no verification by default
++        verify_SSL   =3D> defined $args{verify_SSL} ? $args{verify_SSL}=
 : _verify_SSL_default(),
+         no_proxy     =3D> $ENV{no_proxy},
+     };
+
+@@ -134,6 +144,13 @@ sub new {
+     return $self;
+ }
+
++sub _verify_SSL_default {
++    my ($self) =3D @_;
++    # Check if insecure default certificate verification behaviour has =
been
++    # changed by the user by setting PERL_HTTP_TINY_SSL_INSECURE_BY_DEF=
AULT=3D1
++    return (($ENV{PERL_HTTP_TINY_INSECURE_BY_DEFAULT} || '') eq '1') ? =
0 : 1;
++}
++
+ sub _set_proxies {
+     my ($self) =3D @_;
+
+@@ -1055,7 +1072,7 @@ sub new {
+         timeout          =3D> 60,
+         max_line_size    =3D> 16384,
+         max_header_lines =3D> 64,
+-        verify_SSL       =3D> 0,
++        verify_SSL       =3D> HTTP::Tiny::_verify_SSL_default(),
+         SSL_options      =3D> {},
+         %args
+     }, $class;
+@@ -2043,11 +2060,11 @@ proxy
+ timeout
+ verify_SSL
+
+-=3Dhead1 SSL SUPPORT
++=3Dhead1 TLS/SSL SUPPORT
+
+ Direct C<https> connections are supported only if L<IO::Socket::SSL> 1.=
56 or
+ greater and L<Net::SSLeay> 1.49 or greater are installed. An error will=
 occur
+-if new enough versions of these modules are not installed or if the SSL
++if new enough versions of these modules are not installed or if the TLS
+ encryption fails. You can also use C<HTTP::Tiny::can_ssl()> utility fun=
ction
+ that returns boolean to see if the required modules are installed.
+
+@@ -2055,7 +2072,7 @@ An C<https> connection may be made via an C<http> =
proxy that supports the CONNEC
+ command (i.e. RFC 2817).  You may not proxy C<https> via a proxy that i=
tself
+ requires C<https> to communicate.
+
+-SSL provides two distinct capabilities:
++TLS/SSL provides two distinct capabilities:
+
+ =3Dover 4
+
+@@ -2069,24 +2086,17 @@ Verification of server identity
+
+ =3Dback
+
+-B<By default, HTTP::Tiny does not verify server identity>.
+-
+-Server identity verification is controversial and potentially tricky be=
cause it
+-depends on a (usually paid) third-party Certificate Authority (CA) trus=
t model
+-to validate a certificate as legitimate.  This discriminates against se=
rvers
+-with self-signed certificates or certificates signed by free, community=
-driven
+-CA's such as L<CAcert.org|http://cacert.org>.
++B<By default, HTTP::Tiny verifies server identity>.
+
+-By default, HTTP::Tiny does not make any assumptions about your trust m=
odel,
+-threat level or risk tolerance.  It just aims to give you an encrypted =
channel
+-when you need one.
++This was changed in version 0.083 due to security concerns. The previou=
s default
++behavior can be enabled by setting C<$ENV{PERL_HTTP_TINY_SSL_INSECURE_B=
Y_DEFAULT}>
++to 1.
+
+-Setting the C<verify_SSL> attribute to a true value will make HTTP::Tin=
y verify
+-that an SSL connection has a valid SSL certificate corresponding to the=
 host
+-name of the connection and that the SSL certificate has been verified b=
y a CA.
+-Assuming you trust the CA, this will protect against a L<man-in-the-mid=
dle
+-attack|http://en.wikipedia.org/wiki/Man-in-the-middle_attack>.  If you =
are
+-concerned about security, you should enable this option.
++Verification is done by checking that that the TLS/SSL connection has a=
 valid
++certificate corresponding to the host name of the connection and that t=
he
++certificate has been verified by a CA. Assuming you trust the CA, this =
will
++protect against L<machine-in-the-middle
++attacks|http://en.wikipedia.org/wiki/Machine-in-the-middle_attack>.
+
+ Certificate verification requires a file containing trusted CA certific=
ates.
+
+@@ -2094,9 +2104,7 @@ If the environment variable C<SSL_CERT_FILE> is pr=
esent, HTTP::Tiny
+ will try to find a CA certificate file in that location.
+
+ If the L<Mozilla::CA> module is installed, HTTP::Tiny will use the CA f=
ile
+-included with it as a source of trusted CA's.  (This means you trust Mo=
zilla,
+-the author of Mozilla::CA, the CPAN mirror where you got Mozilla::CA, t=
he
+-toolchain used to install it, and your operating system security, right=
?)
++included with it as a source of trusted CA's.
+
+ If that module is not available, then HTTP::Tiny will search several
+ system-specific default locations for a CA certificate file:
+@@ -2115,13 +2123,33 @@ system-specific default locations for a CA certi=
ficate file:
+
+ /etc/ssl/ca-bundle.pem
+
++=3Ditem *
++
++/etc/openssl/certs/ca-certificates.crt
++
++=3Ditem *
++
++/etc/ssl/cert.pem
++
++=3Ditem *
++
++/usr/local/share/certs/ca-root-nss.crt
++
++=3Ditem *
++
++/etc/pki/tls/cacert.pem
++
++=3Ditem *
++
++/etc/certs/ca-certificates.crt
++
+ =3Dback
+
+ An error will be occur if C<verify_SSL> is true and no CA certificate f=
ile
+ is available.
+
+-If you desire complete control over SSL connections, the C<SSL_options>=
 attribute
+-lets you provide a hash reference that will be passed through to
++If you desire complete control over TLS/SSL connections, the C<SSL_opti=
ons>
++attribute lets you provide a hash reference that will be passed through=
 to
+ C<IO::Socket::SSL::start_SSL()>, overriding any options set by HTTP::Ti=
ny. For
+ example, to provide your own trusted CA file:
+
+@@ -2131,7 +2159,7 @@ example, to provide your own trusted CA file:
+
+ The C<SSL_options> attribute could also be used for such things as prov=
iding a
+ client certificate for authentication to a server or controlling the ch=
oice of
+-cipher used for the SSL connection. See L<IO::Socket::SSL> documentatio=
n for
++cipher used for the TLS/SSL connection. See L<IO::Socket::SSL> document=
ation for
+ details.
+
+ =3Dhead1 PROXY SUPPORT
+--
+2.40.0
diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch b=
/meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch
new file mode 100644
index 0000000000..e41e140cf9
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch
@@ -0,0 +1,30 @@
+commit a22785783b17cbaa28afaee4a024d81a1903701d
+From: Stig Palmquist <git@stig.io>
+Date:   Sun Jun 18 11:36:05 2023 +0200
+
+    Fix incorrect env var name for verify_SSL default
+
+    The variable to override the verify_SSL default differed slightly in=
 the
+    documentation from what was checked for in the code.
+
+    This commit makes the code use `PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAU=
LT`
+    as documented, instead of `PERL_HTTP_TINY_INSECURE_BY_DEFAULT` which=
 was
+    missing `SSL_`
+
+Upstream-Status: Backport [https://github.com/chansen/p5-http-tiny/commi=
t/a22785783b17cbaa28afaee4a024d81a1903701d]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+diff --git a/lib/HTTP/Tiny.pm b/lib/HTTP/Tiny.pm
+index bf455b6..7240b65 100644
+--- a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
++++ b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
+@@ -149,7 +149,7 @@ sub _verify_SSL_default {
+     my ($self) =3D @_;
+     # Check if insecure default certificate verification behaviour has =
been
+     # changed by the user by setting PERL_HTTP_TINY_SSL_INSECURE_BY_DEF=
AULT=3D1
+-    return (($ENV{PERL_HTTP_TINY_INSECURE_BY_DEFAULT} || '') eq '1') ? =
0 : 1;
++    return (($ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT} || '') eq '1'=
) ? 0 : 1;
+ }
+
+ sub _set_proxies {
diff --git a/meta/recipes-devtools/perl/perl_5.36.0.bb b/meta/recipes-dev=
tools/perl/perl_5.36.0.bb
index b8dba00f18..c3ca28ed23 100644
--- a/meta/recipes-devtools/perl/perl_5.36.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.36.0.bb
@@ -18,6 +18,9 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.ta=
r.gz;name=3Dperl \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-det=
erm.patch \
            file://0001-Fix-build-with-gcc-12.patch \
+           file://CVE-2023-31484.patch \
+           file://CVE-2023-31486-0001.patch \
+           file://CVE-2023-31486-0002.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://perl-configpm-switch.patch \
--=20
2.40.0


