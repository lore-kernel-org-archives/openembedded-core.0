Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6697EB64DA
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 03:24:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10748.1689305056421623935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jul 2023 20:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=NL6Iq8b/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6559a1e11a=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36E32W3M029621;
	Fri, 14 Jul 2023 03:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=5HY5dJ65u24V+SXjao
	7KzgoglwlBgGE1rioXBdersa0=; b=NL6Iq8b/jJB5HC1IZpAEVQ0rmpbnvmJK56
	3bNNkurNoL5Zv4YPxf+1EBZ7gsbIINQ0gXAcyqnkKL8fO2qeGej4yGkHCiJht/rI
	ckAZCu4Ir3JLODTYb1if16gy/26y5xyOPwOYha++J15mw1WKitma4PYoFGuKFOOy
	GKyDvOekUAYuo+hNz3gmFN69Z+GgtMuMyPimn1YpomqvD6BThnuuOefQ5WkakYmu
	iDbbYKHBSZe7UGhb6RNDmWvN5Kd60trpJu23yX6+3riuvmjPazoeh+uMk9YcDyBK
	pC3GoyJrnrTrYGUv1NBusLQTPLY68SnilUIGoy+rzVp6pfIx3mvw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rtpun8c8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 14 Jul 2023 03:24:15 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 20:24:13 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 20:24:12 -0700
From: Soumya <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>, <Hari.GPillai@windriver.com>,
        Soumya
	<soumya.sambu@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] perl: Fix CVE-2023-31486
Date: Fri, 14 Jul 2023 03:21:39 +0000
Message-ID: <20230714032139.1143418-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
X-Proofpoint-ORIG-GUID: HJ94WvEIecxWf7eLZFu5PalS2cO4y9T4
X-Proofpoint-GUID: HJ94WvEIecxWf7eLZFu5PalS2cO4y9T4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_12,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2307140029
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 36E32W3M029621
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 03:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184249

HTTP::Tiny before 0.083, a Perl core module since 5.13.9 and available
standalone on CPAN, has an insecure default TLS configuration where
users must opt in to verify certificates.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-31486

Upstream patches:
https://github.com/chansen/p5-http-tiny/commit/77f557ef84698efeb6eed04e4a=
9704eaf85b741d
https://github.com/chansen/p5-http-tiny/commit/a22785783b17cbaa28afaee4a0=
24d81a1903701d

Signed-off-by: Soumya <soumya.sambu@windriver.com>
---
 .../perl/files/CVE-2023-31486-0001.patch      | 215 ++++++++++++++++++
 .../perl/files/CVE-2023-31486-0002.patch      |  36 +++
 meta/recipes-devtools/perl/perl_5.34.1.bb     |   2 +
 3 files changed, 253 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486-0001.=
patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486-0002.=
patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch b=
/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch
new file mode 100644
index 0000000000..59caf1a129
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch
@@ -0,0 +1,215 @@
+From 77f557ef84698efeb6eed04e4a9704eaf85b741d
+From: Stig Palmquist <git@stig.io>
+Date: Mon Jun 5 16:46:22 2023 +0200
+Subject: [PATCH] Change verify_SSL default to 1, add ENV var to enable
+ insecure default - Changes the `verify_SSL` default parameter from `0` =
to `1`
+
+  Based on patch by Dominic Hargreaves:
+  https://salsa.debian.org/perl-team/interpreter/perl/-/commit/1490431e4=
0e22052f75a0b3449f1f53cbd27ba92
+
+  CVE: CVE-2023-31486
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
+index 5803e45..1808c41 100644
+--- a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
++++ b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
+@@ -39,10 +39,14 @@ sub _croak { require Carp; Carp::croak(@_) }
+ #pod   C<$ENV{no_proxy}> =E2=80=94)
+ #pod * C<timeout> =E2=80=94 Request timeout in seconds (default is 60) =
If a socket open,
+ #pod   read or write takes longer than the timeout, an exception is thr=
own.
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
+ #pod Passing an explicit C<undef> for C<proxy>, C<http_proxy> or C<http=
s_proxy> will
+ #pod prevent getting the corresponding proxies from the environment.
+@@ -108,11 +112,17 @@ sub timeout {
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
+@@ -131,6 +141,13 @@ sub new {
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
+@@ -1038,7 +1055,7 @@ sub new {
+         timeout          =3D> 60,
+         max_line_size    =3D> 16384,
+         max_header_lines =3D> 64,
+-        verify_SSL       =3D> 0,
++        verify_SSL       =3D> HTTP::Tiny::_verify_SSL_default(),
+         SSL_options      =3D> {},
+         %args
+     }, $class;
+@@ -2009,11 +2026,11 @@ proxy
+ timeout
+ verify_SSL
+
+-=3Dhead1 SSL SUPPORT
++=3Dhead1 TLS/SSL SUPPORT
+
+ Direct C<https> connections are supported only if L<IO::Socket::SSL> 1.=
56 or
+ greater and L<Net::SSLeay> 1.49 or greater are installed. An exception =
will be
+-thrown if new enough versions of these modules are not installed or if =
the SSL
++thrown if new enough versions of these modules are not installed or if =
the TLS
+ encryption fails. You can also use C<HTTP::Tiny::can_ssl()> utility fun=
ction
+ that returns boolean to see if the required modules are installed.
+
+@@ -2021,7 +2038,7 @@ An C<https> connection may be made via an C<http> =
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
+@@ -2035,24 +2052,17 @@ Verification of server identity
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
+@@ -2060,9 +2070,7 @@ If the environment variable C<SSL_CERT_FILE> is pr=
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
+@@ -2081,13 +2089,33 @@ system-specific default locations for a CA certi=
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
+ An exception will be raised if C<verify_SSL> is true and no CA certific=
ate file
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
+@@ -2097,7 +2125,7 @@ example, to provide your own trusted CA file:
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
index 0000000000..45452be389
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch
@@ -0,0 +1,36 @@
+From a22785783b17cbaa28afaee4a024d81a1903701d
+From: Stig Palmquist <git@stig.io>
+Date: Sun Jun 18 11:36:05 2023 +0200
+Subject: [PATCH] Fix incorrect env var name for verify_SSL default
+
+The variable to override the verify_SSL default differed slightly in the
+documentation from what was checked for in the code.
+
+This commit makes the code use `PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT`
+as documented, instead of `PERL_HTTP_TINY_INSECURE_BY_DEFAULT` which was
+missing `SSL_`
+
+CVE: CVE-2023-31486
+
+Upstream-Status: Backport [https://github.com/chansen/p5-http-tiny/commi=
t/a22785783b17cbaa28afaee4a024d81a1903701d]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ cpan/HTTP-Tiny/lib/HTTP/Tiny.pm | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm b/cpan/HTTP-Tiny/lib/HTTP/T=
iny.pm
+index ebc34a1..65ac8ff 100644
+--- a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
++++ b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
+@@ -148,7 +148,7 @@ sub _verify_SSL_default {
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
+--
+2.40.0
diff --git a/meta/recipes-devtools/perl/perl_5.34.1.bb b/meta/recipes-dev=
tools/perl/perl_5.34.1.bb
index e0ee006e50..db306d0be3 100644
--- a/meta/recipes-devtools/perl/perl_5.34.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.1.bb
@@ -19,6 +19,8 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.ta=
r.gz;name=3Dperl \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-det=
erm.patch \
            file://0001-Fix-build-with-gcc-12.patch \
            file://CVE-2023-31484.patch \
+           file://CVE-2023-31486-0001.patch \
+           file://CVE-2023-31486-0002.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://perl-configpm-switch.patch \
--=20
2.40.0


