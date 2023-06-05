Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9BAC7EE24
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 03:23:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3750.1685935394375203764
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jun 2023 20:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=Usi/yLXI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5520dcc9f1=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3553Jo9L027959
	for <openembedded-core@lists.openembedded.org>; Sun, 4 Jun 2023 20:23:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=jcBNd8gKq+vkm40hmEyI3AWWuxhwMoohJd2rNHXldTo=;
 b=Usi/yLXILf8FUaIr/5LVLVq9VCfk5HwetOlfXAeCDsI51k4v+Oyj2pbGQuvoKs7/D/3A
 5aroMYj2VKe2H5cnutQbc33EV4/autux3nDZoJZUQLTuulAAMQaEHd9wSotNGGYBIBm8
 tubmoQ6TMutym5JPs9VMmCM4lX+TGeaVFc4QkIM++V34KiEvxrHeWXm1POonADEy8Zhy
 wkKY+5DXLI/xCCgZxVGBhHZOqGf4XHKNznW/HbBEJdrXq2xINPI4Np2hR1u3TN/+rh/m
 lV3rTQl34JM0UxwDKoIb0vaNbpzWo52gvd1rwCxtaBONe1kjs031oNiyYx2pOTIEhubo Dw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r00t3914j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 20:23:13 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 4 Jun 2023 20:23:12 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Sun, 4 Jun 2023 20:23:11 -0700
From: Soumya <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Soumya <soumya.sambu@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] perl: Fix CVE-2023-31486
Date: Mon, 5 Jun 2023 03:23:00 +0000
Message-ID: <20230605032300.2325425-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
X-Proofpoint-GUID: P3A2pl7jcJzt31ICi5QqLKQ7VO3bO5o3
X-Proofpoint-ORIG-GUID: P3A2pl7jcJzt31ICi5QqLKQ7VO3bO5o3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-03_08,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 clxscore=1011 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306050028
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3553Jo9L027959
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 03:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182370

HTTP::Tiny 0.082, a Perl core module since 5.13.9 and available standalon=
e on CPAN,
has an insecure default TLS configuration where users must opt in to veri=
fy certificates.

Signed-off-by: Soumya <soumya.sambu@windriver.com>
---
 .../perl/files/CVE-2023-31486.patch           | 89 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.34.1.bb     |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31486.patch b/meta=
/recipes-devtools/perl/files/CVE-2023-31486.patch
new file mode 100644
index 0000000000..55c4bd1d47
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2023-31486.patch
@@ -0,0 +1,89 @@
+From 1490431e40e22052f75a0b3449f1f53cbd27ba92 Mon Sep 17 00:00:00 2001
+From: Dominic Hargreaves <dom@earth.li>
+Date: Thu, 21 May 2020 22:53:37 +0100
+Subject: [PATCH] Enable SSL by default in HTTP::Tiny
+
+Gbp-Pq: Topic debian
+Gbp-Pq: Name http-tiny-ssl.diff
+
+CVE: CVE-2023-31486
+
+Upstream-Status: Backport [https://salsa.debian.org/perl-team/interprete=
r/perl/-/commit/1490431e40e22052f75a0b3449f1f53cbd27ba92.patch]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ cpan/HTTP-Tiny/lib/HTTP/Tiny.pm | 20 +++++++++-----------
+ 1 file changed, 9 insertions(+), 11 deletions(-)
+
+diff --git a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm b/cpan/HTTP-Tiny/lib/HTTP/T=
iny.pm
+index 5803e45..88ba514 100644
+--- a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
++++ b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
+@@ -40,7 +40,7 @@ sub _croak { require Carp; Carp::croak(@_) }
+ #pod * C<timeout> =E2=80=94 Request timeout in seconds (default is 60) =
If a socket open,
+ #pod   read or write takes longer than the timeout, an exception is thr=
own.
+ #pod * C<verify_SSL> =E2=80=94 A boolean that indicates whether to vali=
date the SSL
+-#pod   certificate of an C<https> =E2=80=94 connection (default is fals=
e)
++#pod   certificate of an C<https> =E2=80=94 connection (default is true=
)
+ #pod * C<SSL_options> =E2=80=94 A hashref of C<SSL_*> =E2=80=94 options=
 to pass through to
+ #pod   L<IO::Socket::SSL>
+ #pod
+@@ -112,7 +112,7 @@ sub new {
+         max_redirect =3D> 5,
+         timeout      =3D> defined $args{timeout} ? $args{timeout} : 60,
+         keep_alive   =3D> 1,
+-        verify_SSL   =3D> $args{verify_SSL} || $args{verify_ssl} || 0, =
# no verification by default
++        verify_SSL   =3D> $args{verify_SSL} // $args{verify_ssl} // 1, =
# verification by default
+         no_proxy     =3D> $ENV{no_proxy},
+     };
+
+@@ -1038,7 +1038,7 @@ sub new {
+         timeout          =3D> 60,
+         max_line_size    =3D> 16384,
+         max_header_lines =3D> 64,
+-        verify_SSL       =3D> 0,
++        verify_SSL       =3D> 1,
+         SSL_options      =3D> {},
+         %args
+     }, $class;
+@@ -1765,7 +1765,7 @@ C<timeout> =E2=80=94 Request timeout in seconds (d=
efault is 60) If a socket open, read
+
+ =3Ditem *
+
+-C<verify_SSL> =E2=80=94 A boolean that indicates whether to validate th=
e SSL certificate of an C<https> =E2=80=94 connection (default is false)
++C<verify_SSL> =E2=80=94 A boolean that indicates whether to validate th=
e SSL certificate of an C<https> =E2=80=94 connection (default is true)
+
+ =3Ditem *
+
+@@ -2035,7 +2035,7 @@ Verification of server identity
+
+ =3Dback
+
+-B<By default, HTTP::Tiny does not verify server identity>.
++B<By default, HTTP::Tiny in Debian verifies server identity.
+
+ Server identity verification is controversial and potentially tricky be=
cause it
+ depends on a (usually paid) third-party Certificate Authority (CA) trus=
t model
+@@ -2043,16 +2043,14 @@ to validate a certificate as legitimate.  This d=
iscriminates against servers
+ with self-signed certificates or certificates signed by free, community=
-driven
+ CA's such as L<CAcert.org|http://cacert.org>.
+
+-By default, HTTP::Tiny does not make any assumptions about your trust m=
odel,
+-threat level or risk tolerance.  It just aims to give you an encrypted =
channel
+-when you need one.
+-
+ Setting the C<verify_SSL> attribute to a true value will make HTTP::Tin=
y verify
+ that an SSL connection has a valid SSL certificate corresponding to the=
 host
+ name of the connection and that the SSL certificate has been verified b=
y a CA.
+ Assuming you trust the CA, this will protect against a L<man-in-the-mid=
dle
+-attack|http://en.wikipedia.org/wiki/Man-in-the-middle_attack>.  If you =
are
+-concerned about security, you should enable this option.
++attack|http://en.wikipedia.org/wiki/Man-in-the-middle_attack>.
++
++If you are not concerned about security, and this default in Debian cau=
ses
++problems, you should disable this option.
+
+ Certificate verification requires a file containing trusted CA certific=
ates.
+
+--
+2.40.0
diff --git a/meta/recipes-devtools/perl/perl_5.34.1.bb b/meta/recipes-dev=
tools/perl/perl_5.34.1.bb
index 42bcb8b1bc..af4660091b 100644
--- a/meta/recipes-devtools/perl/perl_5.34.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.1.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.ta=
r.gz;name=3Dperl \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-det=
erm.patch \
            file://0001-Fix-build-with-gcc-12.patch \
+           file://CVE-2023-31486.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://perl-configpm-switch.patch \
--=20
2.40.0


