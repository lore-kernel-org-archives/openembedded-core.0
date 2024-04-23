Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D39AC4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 11:51:52 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.16489.1713873110200587311
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 04:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RBXG/orL;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.181, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-61816fc256dso48443667b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 04:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713873109; x=1714477909; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNsdE63YTJ4RXc5KJBwQ7QC/+mqhV1I4bMda6kDt/WU=;
        b=RBXG/orLIWEmb/NnyVj3jmmnPR7rkCdnms8LfWtRRDwhXwq8J0K3DTkrTVfVTAC8Ny
         0oVR6hbVt5OSXP/hVvb6x/C19TSf5FEX7ctSx6KoONG/+7E9R0BH8joVHHcTX19WECNN
         oyOek1vi+XpZAAfQq5Ah9ghF/SwobV+RMSlodIPaRuS9w3FMKJgaJEHl4qdgHsAoHyrJ
         hoSyG2dCkq8eJq7mHAQeiXDdqHuRsn+yqvT5ZPP5ycydXvI48oj9VSUYCupjUpkOTFVc
         B3HPEYcju7IFtz+2iPzjLl4DkfI+qEBLnKAnrbpqPler4D26YUMXC8Vs2mLNpV26B32T
         Cosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713873109; x=1714477909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wNsdE63YTJ4RXc5KJBwQ7QC/+mqhV1I4bMda6kDt/WU=;
        b=b4KfGvufG2aaL79Kf6G4IOzVUNvlO1kaNIkHtoZVjQRXbAYIaP1Q53Fhc1bFYROjAX
         /zWFak4LaSQW/cGjfsQSNS9vr8rJBQPYnyc3gtplleeYd+bGm6KSqSJq46Y9scMioCU9
         eYiC2Gry/Nt+bYwM0B0iDAplqJ3pVQExdNoy6BC1BrzqqEbbMJ6E/RFeXAyfdUT/QhUl
         YoweWFiMpEAvscPb0sIMpvG0ilbuBjm9FXwwm3mintJI0vGvRR+PddYmyiB5nmV0vr4y
         YAlWQp4ija6DZ81uSsYspSqVmPjovw2eAx4THaoXuTjFozw65aeiSAvAG8+ZBNkwUXI6
         FQgA==
X-Gm-Message-State: AOJu0YzxzKx39EBNsfODOreiWWcQOZUHZVzTOaWiy2wn7lBXDbwThljJ
	GQokWP+7yQaG2Gd1fcFHIrPPNJ4sHRLuoxGCfv4kfbhQ1VQgeSeUpD1R/PiQ6m7OIKCL4DI50uA
	CMuJ1h3FYEmSPAG9je7Cbd3zQLCfU33DcxteHTA==
X-Google-Smtp-Source: AGHT+IGbWObFJtSYh0PdOrwcdQtsP8Zft7Ylhz+df12RQHEUEvMbhGl7vB/XdZuuD8+p2cMpCfQELKXu33wNU9+SCjg=
X-Received: by 2002:a05:690c:630d:b0:61a:c19f:fc4c with SMTP id
 ho13-20020a05690c630d00b0061ac19ffc4cmr13277308ywb.3.1713873109229; Tue, 23
 Apr 2024 04:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240423082037.558896-1-virendrak@kpit.com>
In-Reply-To: <20240423082037.558896-1-virendrak@kpit.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 23 Apr 2024 04:51:37 -0700
Message-ID: <CAOSpxdZro7CY341uOsi+RypN6kSAUgbxhD1OjqvPz4-ZQ8NNNQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] perl: Fix CVE-2023-31486
To: virendra thakur <thakur.virendra1810@gmail.com>
Cc: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com, 
	Soumya <soumya.sambu@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 11:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198617

Dunfell has reached end of life and we are no longer taking changes.
The final build was done on April 15.

Steve

On Tue, Apr 23, 2024 at 1:21=E2=80=AFAM virendra thakur
<thakur.virendra1810@gmail.com> wrote:
>
> From: Soumya <soumya.sambu@windriver.com>
>
> HTTP::Tiny before 0.083, a Perl core module since 5.13.9 and available
> standalone on CPAN, has an insecure default TLS configuration where
> users must opt in to verify certificates.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-31486
>
> Upstream patches:
> https://github.com/chansen/p5-http-tiny/commit/77f557ef84698efeb6eed04e4a=
9704eaf85b741d
> https://github.com/chansen/p5-http-tiny/commit/a22785783b17cbaa28afaee4a0=
24d81a1903701d
>
> (From OE-Core rev: 5819c839e1de92ab7669a0d4997886d0306c4cc1)
>
> Signed-off-by: Soumya <soumya.sambu@windriver.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> (cherry picked from commit 80ecd63cc84d7eb9db26ec47d4afcf5a59d598e8)
>
> Signed-off-by: virendra thakur <virendrak@kpit.com>
> ---
>  .../perl/files/CVE-2023-31486-0001.patch      | 216 ++++++++++++++++++
>  .../perl/files/CVE-2023-31486-0002.patch      |  36 +++
>  meta/recipes-devtools/perl/perl_5.30.1.bb     |   2 +
>  3 files changed, 254 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486-0001.=
patch
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486-0002.=
patch
>
> diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch b=
/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch
> new file mode 100644
> index 0000000000..d8326b4ef8
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch
> @@ -0,0 +1,216 @@
> +From 77f557ef84698efeb6eed04e4a9704eaf85b741d
> +From: Stig Palmquist <git@stig.io>
> +Date: Mon Jun 5 16:46:22 2023 +0200
> +Subject: [PATCH] Change verify_SSL default to 1, add ENV var to enable
> + insecure default - Changes the `verify_SSL` default parameter from `0` =
to `1`
> +
> +  Based on patch by Dominic Hargreaves:
> +  https://salsa.debian.org/perl-team/interpreter/perl/-/commit/1490431e4=
0e22052f75a0b3449f1f53cbd27ba92
> +
> +  CVE: CVE-2023-31486
> +
> +- Add check for `$ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT}` that
> +  enables the previous insecure default behaviour if set to `1`.
> +
> +  This provides a workaround for users who encounter problems with the
> +  new `verify_SSL` default.
> +
> +  Example to disable certificate checks:
> +  ```
> +    $ PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT=3D1 ./script.pl
> +  ```
> +
> +- Updates to documentation:
> +  - Describe changing the verify_SSL value
> +  - Describe the escape-hatch environment variable
> +  - Remove rationale for not enabling verify_SSL
> +  - Add missing certificate search paths
> +  - Replace "SSL" with "TLS/SSL" where appropriate
> +  - Use "machine-in-the-middle" instead of "man-in-the-middle"
> +
> +Upstream-Status: Backport [https://github.com/chansen/p5-http-tiny/commi=
t/77f557ef84698efeb6eed04e4a9704eaf85b741d]
> +
> +Signed-off-by: Soumya <soumya.sambu@windriver.com>
> +Signed-off-by: virendra thakur <virendrak@kpit.com>
> +---
> + cpan/HTTP-Tiny/lib/HTTP/Tiny.pm | 86 ++++++++++++++++++++++-----------
> + 1 file changed, 57 insertions(+), 29 deletions(-)
> +
> +diff --git a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm b/cpan/HTTP-Tiny/lib/HTTP/T=
iny.pm
> +index 5803e45..1808c41 100644
> +--- a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
> ++++ b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
> +@@ -39,10 +39,14 @@ sub _croak { require Carp; Carp::croak(@_) }
> + #pod   C<$ENV{no_proxy}> =E2=80=94)
> + #pod * C<timeout> =E2=80=94 Request timeout in seconds (default is 60) =
If a socket open,
> + #pod   read or write takes longer than the timeout, an exception is thr=
own.
> +-#pod * C<verify_SSL> =E2=80=94 A boolean that indicates whether to vali=
date the SSL
> +-#pod   certificate of an C<https> =E2=80=94 connection (default is fals=
e)
> ++#pod * C<verify_SSL> =E2=80=94 A boolean that indicates whether to vali=
date the TLS/SSL
> ++#pod   certificate of an C<https> =E2=80=94 connection (default is true=
). Changed from false
> ++#pod   to true in version 0.083.
> + #pod * C<SSL_options> =E2=80=94 A hashref of C<SSL_*> =E2=80=94 options=
 to pass through to
> + #pod   L<IO::Socket::SSL>
> ++#pod * C<$ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT}> - Changes the de=
fault
> ++#pod   certificate verification behavior to not check server identity i=
f set to 1.
> ++#pod   Only effective if C<verify_SSL> is not set. Added in version 0.0=
83.
> + #pod
> + #pod Passing an explicit C<undef> for C<proxy>, C<http_proxy> or C<http=
s_proxy> will
> + #pod prevent getting the corresponding proxies from the environment.
> +@@ -108,11 +112,17 @@ sub timeout {
> + sub new {
> +     my($class, %args) =3D @_;
> +
> ++    # Support lower case verify_ssl argument, but only if verify_SSL is=
 not
> ++    # true.
> ++    if ( exists $args{verify_ssl} ) {
> ++        $args{verify_SSL}  ||=3D $args{verify_ssl};
> ++    }
> ++
> +     my $self =3D {
> +         max_redirect =3D> 5,
> +         timeout      =3D> defined $args{timeout} ? $args{timeout} : 60,
> +         keep_alive   =3D> 1,
> +-        verify_SSL   =3D> $args{verify_SSL} || $args{verify_ssl} || 0, =
# no verification by default
> ++        verify_SSL   =3D> defined $args{verify_SSL} ? $args{verify_SSL}=
 : _verify_SSL_default(),
> +         no_proxy     =3D> $ENV{no_proxy},
> +     };
> +
> +@@ -131,6 +141,13 @@ sub new {
> +     return $self;
> + }
> +
> ++sub _verify_SSL_default {
> ++    my ($self) =3D @_;
> ++    # Check if insecure default certificate verification behaviour has =
been
> ++    # changed by the user by setting PERL_HTTP_TINY_SSL_INSECURE_BY_DEF=
AULT=3D1
> ++    return (($ENV{PERL_HTTP_TINY_INSECURE_BY_DEFAULT} || '') eq '1') ? =
0 : 1;
> ++}
> ++
> + sub _set_proxies {
> +     my ($self) =3D @_;
> +
> +@@ -1038,7 +1055,7 @@ sub new {
> +         timeout          =3D> 60,
> +         max_line_size    =3D> 16384,
> +         max_header_lines =3D> 64,
> +-        verify_SSL       =3D> 0,
> ++        verify_SSL       =3D> HTTP::Tiny::_verify_SSL_default(),
> +         SSL_options      =3D> {},
> +         %args
> +     }, $class;
> +@@ -2009,11 +2026,11 @@ proxy
> + timeout
> + verify_SSL
> +
> +-=3Dhead1 SSL SUPPORT
> ++=3Dhead1 TLS/SSL SUPPORT
> +
> + Direct C<https> connections are supported only if L<IO::Socket::SSL> 1.=
56 or
> + greater and L<Net::SSLeay> 1.49 or greater are installed. An exception =
will be
> +-thrown if new enough versions of these modules are not installed or if =
the SSL
> ++thrown if new enough versions of these modules are not installed or if =
the TLS
> + encryption fails. You can also use C<HTTP::Tiny::can_ssl()> utility fun=
ction
> + that returns boolean to see if the required modules are installed.
> +
> +@@ -2021,7 +2038,7 @@ An C<https> connection may be made via an C<http> =
proxy that supports the CONNEC
> + command (i.e. RFC 2817).  You may not proxy C<https> via a proxy that i=
tself
> + requires C<https> to communicate.
> +
> +-SSL provides two distinct capabilities:
> ++TLS/SSL provides two distinct capabilities:
> +
> + =3Dover 4
> +
> +@@ -2035,24 +2052,17 @@ Verification of server identity
> +
> + =3Dback
> +
> +-B<By default, HTTP::Tiny does not verify server identity>.
> +-
> +-Server identity verification is controversial and potentially tricky be=
cause it
> +-depends on a (usually paid) third-party Certificate Authority (CA) trus=
t model
> +-to validate a certificate as legitimate.  This discriminates against se=
rvers
> +-with self-signed certificates or certificates signed by free, community=
-driven
> +-CA's such as L<CAcert.org|http://cacert.org>.
> ++B<By default, HTTP::Tiny verifies server identity>.
> +
> +-By default, HTTP::Tiny does not make any assumptions about your trust m=
odel,
> +-threat level or risk tolerance.  It just aims to give you an encrypted =
channel
> +-when you need one.
> ++This was changed in version 0.083 due to security concerns. The previou=
s default
> ++behavior can be enabled by setting C<$ENV{PERL_HTTP_TINY_SSL_INSECURE_B=
Y_DEFAULT}>
> ++to 1.
> +
> +-Setting the C<verify_SSL> attribute to a true value will make HTTP::Tin=
y verify
> +-that an SSL connection has a valid SSL certificate corresponding to the=
 host
> +-name of the connection and that the SSL certificate has been verified b=
y a CA.
> +-Assuming you trust the CA, this will protect against a L<man-in-the-mid=
dle
> +-attack|http://en.wikipedia.org/wiki/Man-in-the-middle_attack>.  If you =
are
> +-concerned about security, you should enable this option.
> ++Verification is done by checking that that the TLS/SSL connection has a=
 valid
> ++certificate corresponding to the host name of the connection and that t=
he
> ++certificate has been verified by a CA. Assuming you trust the CA, this =
will
> ++protect against L<machine-in-the-middle
> ++attacks|http://en.wikipedia.org/wiki/Machine-in-the-middle_attack>.
> +
> + Certificate verification requires a file containing trusted CA certific=
ates.
> +
> +@@ -2060,9 +2070,7 @@ If the environment variable C<SSL_CERT_FILE> is pr=
esent, HTTP::Tiny
> + will try to find a CA certificate file in that location.
> +
> + If the L<Mozilla::CA> module is installed, HTTP::Tiny will use the CA f=
ile
> +-included with it as a source of trusted CA's.  (This means you trust Mo=
zilla,
> +-the author of Mozilla::CA, the CPAN mirror where you got Mozilla::CA, t=
he
> +-toolchain used to install it, and your operating system security, right=
?)
> ++included with it as a source of trusted CA's.
> +
> + If that module is not available, then HTTP::Tiny will search several
> + system-specific default locations for a CA certificate file:
> +@@ -2081,13 +2089,33 @@ system-specific default locations for a CA certi=
ficate file:
> +
> + /etc/ssl/ca-bundle.pem
> +
> ++=3Ditem *
> ++
> ++/etc/openssl/certs/ca-certificates.crt
> ++
> ++=3Ditem *
> ++
> ++/etc/ssl/cert.pem
> ++
> ++=3Ditem *
> ++
> ++/usr/local/share/certs/ca-root-nss.crt
> ++
> ++=3Ditem *
> ++
> ++/etc/pki/tls/cacert.pem
> ++
> ++=3Ditem *
> ++
> ++/etc/certs/ca-certificates.crt
> ++
> + =3Dback
> +
> + An exception will be raised if C<verify_SSL> is true and no CA certific=
ate file
> + is available.
> +
> +-If you desire complete control over SSL connections, the C<SSL_options>=
 attribute
> +-lets you provide a hash reference that will be passed through to
> ++If you desire complete control over TLS/SSL connections, the C<SSL_opti=
ons>
> ++attribute lets you provide a hash reference that will be passed through=
 to
> + C<IO::Socket::SSL::start_SSL()>, overriding any options set by HTTP::Ti=
ny. For
> + example, to provide your own trusted CA file:
> +
> +@@ -2097,7 +2125,7 @@ example, to provide your own trusted CA file:
> +
> + The C<SSL_options> attribute could also be used for such things as prov=
iding a
> + client certificate for authentication to a server or controlling the ch=
oice of
> +-cipher used for the SSL connection. See L<IO::Socket::SSL> documentatio=
n for
> ++cipher used for the TLS/SSL connection. See L<IO::Socket::SSL> document=
ation for
> + details.
> +
> + =3Dhead1 PROXY SUPPORT
> +--
> +2.40.0
> diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch b=
/meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch
> new file mode 100644
> index 0000000000..45452be389
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch
> @@ -0,0 +1,36 @@
> +From a22785783b17cbaa28afaee4a024d81a1903701d
> +From: Stig Palmquist <git@stig.io>
> +Date: Sun Jun 18 11:36:05 2023 +0200
> +Subject: [PATCH] Fix incorrect env var name for verify_SSL default
> +
> +The variable to override the verify_SSL default differed slightly in the
> +documentation from what was checked for in the code.
> +
> +This commit makes the code use `PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT`
> +as documented, instead of `PERL_HTTP_TINY_INSECURE_BY_DEFAULT` which was
> +missing `SSL_`
> +
> +CVE: CVE-2023-31486
> +
> +Upstream-Status: Backport [https://github.com/chansen/p5-http-tiny/commi=
t/a22785783b17cbaa28afaee4a024d81a1903701d]
> +
> +Signed-off-by: Soumya <soumya.sambu@windriver.com>
> +---
> + cpan/HTTP-Tiny/lib/HTTP/Tiny.pm | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm b/cpan/HTTP-Tiny/lib/HTTP/T=
iny.pm
> +index ebc34a1..65ac8ff 100644
> +--- a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
> ++++ b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
> +@@ -148,7 +148,7 @@ sub _verify_SSL_default {
> +     my ($self) =3D @_;
> +     # Check if insecure default certificate verification behaviour has =
been
> +     # changed by the user by setting PERL_HTTP_TINY_SSL_INSECURE_BY_DEF=
AULT=3D1
> +-    return (($ENV{PERL_HTTP_TINY_INSECURE_BY_DEFAULT} || '') eq '1') ? =
0 : 1;
> ++    return (($ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT} || '') eq '1'=
) ? 0 : 1;
> + }
> +
> + sub _set_proxies {
> +--
> +2.40.0
> diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-dev=
tools/perl/perl_5.30.1.bb
> index bf81a023b8..b7c864b6dc 100644
> --- a/meta/recipes-devtools/perl/perl_5.30.1.bb
> +++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
> @@ -31,6 +31,8 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.ta=
r.gz;name=3Dperl \
>             file://CVE-2020-12723.patch \
>             file://CVE-2023-31484.patch \
>             file://CVE-2023-47038.patch \
> +           file://CVE-2023-31486-0001.patch \
> +           file://CVE-2023-31486-0002.patch \
>             "
>  SRC_URI_append_class-native =3D " \
>             file://perl-configpm-switch.patch \
> --
> 2.25.1
>

