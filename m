Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D112EC4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 08:21:10 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.13566.1713860463073534223
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 01:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fsE9ptN0;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ecf05fd12fso5026222b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 01:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713860462; x=1714465262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kK1CAINexJpBp20KFAJpyWmV8OE4AHLL2xXub11EbB0=;
        b=fsE9ptN0X9cE7cgbtR6OjNtJvieZLX2v+n84yScUCYYLoZn2euLpF49ExtcZem+Fvb
         tRc9Sm/UAuiBZsTDc1O0SoMeMVMvM8jhvfek/lk66LEZC9nSqLRQUNU4F+vEy5t9iOAn
         vMzX1EGUrOEpWtoTLHmpGqs1jEVKbtEodhPYAoao0wGx7GA9xcO8TRs+qMRBPs7Xkm+P
         VzHGyjhPGE2ZXimByP4xapeyeLRtHr95StXEuAbvYnOQFRbyuYcYHl+jKvlu7v78xsE1
         Nt6Eqlev/d9J4eSI++TH9c1Gvhld2F+a6tJKIdhSO8mzyCWoiEC5+P1K+El8UGf0DzXP
         FSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713860462; x=1714465262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kK1CAINexJpBp20KFAJpyWmV8OE4AHLL2xXub11EbB0=;
        b=TT4Ew6hvC3o7BrDeKwfhaIfKUyRwwKshui4IyH9wfNO6D8WQWa4/Sh/7sZjqoHk4H2
         sMMl6gfT8NRCVkrhsOoRwMjyaZ7XOdGcYuioA2Kg9zw8LWAwpEjHDc9+VAz/5nf62jom
         4T0sqvTE5QdUgMlvFg5r8eOr0xBsRtYwx8JQpIntLbUrAw1pLjdnvMMKI9o/Tv37/Cxl
         FOHNqISaxO7HdwjJKcckUO7onV3k2aBkw2QP73O3o37umwk0+kxzdEuUyQSV4e1ls25z
         nYQDiKS9McTWaM6FMsf9RcDchyEvFue7EEXGLGLvppxk+a1dg3pTxButawziPxBP+Hd6
         OGnQ==
X-Gm-Message-State: AOJu0YxD5IrJF1uasw8Rfz4DAz425Pkt2SDHxpFTRzWqIWJJ3ZUMu8t/
	aHCRC0a30bPDQd3+4RooN16chEjOluhjIC2R28XQ6fqDZTImT8Z10a5a5w==
X-Google-Smtp-Source: AGHT+IEa9/+eNs4IfcH+IDdows00nTDki7nq3/5xG6OWLRMugkP/ymX+H/qE9PCnlPp4G7UM/bftaA==
X-Received: by 2002:a05:6a21:9217:b0:1ad:682d:55b3 with SMTP id tl23-20020a056a21921700b001ad682d55b3mr352692pzb.3.1713860461765;
        Tue, 23 Apr 2024 01:21:01 -0700 (PDT)
Received: from L-18076.kpit.com ([223.233.81.5])
        by smtp.gmail.com with ESMTPSA id fe12-20020a056a002f0c00b006ea918dab9csm9046918pfb.157.2024.04.23.01.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 01:21:00 -0700 (PDT)
From: virendra thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: virendra thakur <virendrak@kpit.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: Soumya <soumya.sambu@windriver.com>,
	Steve Sakoman <steve@sakoman.com>
Subject: [OE-core][dunfell][PATCH] perl: Fix CVE-2023-31486
Date: Tue, 23 Apr 2024 13:50:37 +0530
Message-Id: <20240423082037.558896-1-virendrak@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 08:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198610

From: Soumya <soumya.sambu@windriver.com>

HTTP::Tiny before 0.083, a Perl core module since 5.13.9 and available
standalone on CPAN, has an insecure default TLS configuration where
users must opt in to verify certificates.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-31486

Upstream patches:
https://github.com/chansen/p5-http-tiny/commit/77f557ef84698efeb6eed04e4a9704eaf85b741d
https://github.com/chansen/p5-http-tiny/commit/a22785783b17cbaa28afaee4a024d81a1903701d

(From OE-Core rev: 5819c839e1de92ab7669a0d4997886d0306c4cc1)

Signed-off-by: Soumya <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 80ecd63cc84d7eb9db26ec47d4afcf5a59d598e8)

Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 .../perl/files/CVE-2023-31486-0001.patch      | 216 ++++++++++++++++++
 .../perl/files/CVE-2023-31486-0002.patch      |  36 +++
 meta/recipes-devtools/perl/perl_5.30.1.bb     |   2 +
 3 files changed, 254 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch b/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch
new file mode 100644
index 0000000000..d8326b4ef8
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch
@@ -0,0 +1,216 @@
+From 77f557ef84698efeb6eed04e4a9704eaf85b741d
+From: Stig Palmquist <git@stig.io>
+Date: Mon Jun 5 16:46:22 2023 +0200
+Subject: [PATCH] Change verify_SSL default to 1, add ENV var to enable
+ insecure default - Changes the `verify_SSL` default parameter from `0` to `1`
+
+  Based on patch by Dominic Hargreaves:
+  https://salsa.debian.org/perl-team/interpreter/perl/-/commit/1490431e40e22052f75a0b3449f1f53cbd27ba92
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
+    $ PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT=1 ./script.pl
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
+Upstream-Status: Backport [https://github.com/chansen/p5-http-tiny/commit/77f557ef84698efeb6eed04e4a9704eaf85b741d]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+Signed-off-by: virendra thakur <virendrak@kpit.com>
+---
+ cpan/HTTP-Tiny/lib/HTTP/Tiny.pm | 86 ++++++++++++++++++++++-----------
+ 1 file changed, 57 insertions(+), 29 deletions(-)
+
+diff --git a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
+index 5803e45..1808c41 100644
+--- a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
++++ b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
+@@ -39,10 +39,14 @@ sub _croak { require Carp; Carp::croak(@_) }
+ #pod   C<$ENV{no_proxy}> —)
+ #pod * C<timeout> — Request timeout in seconds (default is 60) If a socket open,
+ #pod   read or write takes longer than the timeout, an exception is thrown.
+-#pod * C<verify_SSL> — A boolean that indicates whether to validate the SSL
+-#pod   certificate of an C<https> — connection (default is false)
++#pod * C<verify_SSL> — A boolean that indicates whether to validate the TLS/SSL
++#pod   certificate of an C<https> — connection (default is true). Changed from false
++#pod   to true in version 0.083.
+ #pod * C<SSL_options> — A hashref of C<SSL_*> — options to pass through to
+ #pod   L<IO::Socket::SSL>
++#pod * C<$ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT}> - Changes the default
++#pod   certificate verification behavior to not check server identity if set to 1.
++#pod   Only effective if C<verify_SSL> is not set. Added in version 0.083.
+ #pod
+ #pod Passing an explicit C<undef> for C<proxy>, C<http_proxy> or C<https_proxy> will
+ #pod prevent getting the corresponding proxies from the environment.
+@@ -108,11 +112,17 @@ sub timeout {
+ sub new {
+     my($class, %args) = @_;
+
++    # Support lower case verify_ssl argument, but only if verify_SSL is not
++    # true.
++    if ( exists $args{verify_ssl} ) {
++        $args{verify_SSL}  ||= $args{verify_ssl};
++    }
++
+     my $self = {
+         max_redirect => 5,
+         timeout      => defined $args{timeout} ? $args{timeout} : 60,
+         keep_alive   => 1,
+-        verify_SSL   => $args{verify_SSL} || $args{verify_ssl} || 0, # no verification by default
++        verify_SSL   => defined $args{verify_SSL} ? $args{verify_SSL} : _verify_SSL_default(),
+         no_proxy     => $ENV{no_proxy},
+     };
+
+@@ -131,6 +141,13 @@ sub new {
+     return $self;
+ }
+
++sub _verify_SSL_default {
++    my ($self) = @_;
++    # Check if insecure default certificate verification behaviour has been
++    # changed by the user by setting PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT=1
++    return (($ENV{PERL_HTTP_TINY_INSECURE_BY_DEFAULT} || '') eq '1') ? 0 : 1;
++}
++
+ sub _set_proxies {
+     my ($self) = @_;
+
+@@ -1038,7 +1055,7 @@ sub new {
+         timeout          => 60,
+         max_line_size    => 16384,
+         max_header_lines => 64,
+-        verify_SSL       => 0,
++        verify_SSL       => HTTP::Tiny::_verify_SSL_default(),
+         SSL_options      => {},
+         %args
+     }, $class;
+@@ -2009,11 +2026,11 @@ proxy
+ timeout
+ verify_SSL
+
+-=head1 SSL SUPPORT
++=head1 TLS/SSL SUPPORT
+
+ Direct C<https> connections are supported only if L<IO::Socket::SSL> 1.56 or
+ greater and L<Net::SSLeay> 1.49 or greater are installed. An exception will be
+-thrown if new enough versions of these modules are not installed or if the SSL
++thrown if new enough versions of these modules are not installed or if the TLS
+ encryption fails. You can also use C<HTTP::Tiny::can_ssl()> utility function
+ that returns boolean to see if the required modules are installed.
+
+@@ -2021,7 +2038,7 @@ An C<https> connection may be made via an C<http> proxy that supports the CONNEC
+ command (i.e. RFC 2817).  You may not proxy C<https> via a proxy that itself
+ requires C<https> to communicate.
+
+-SSL provides two distinct capabilities:
++TLS/SSL provides two distinct capabilities:
+
+ =over 4
+
+@@ -2035,24 +2052,17 @@ Verification of server identity
+
+ =back
+
+-B<By default, HTTP::Tiny does not verify server identity>.
+-
+-Server identity verification is controversial and potentially tricky because it
+-depends on a (usually paid) third-party Certificate Authority (CA) trust model
+-to validate a certificate as legitimate.  This discriminates against servers
+-with self-signed certificates or certificates signed by free, community-driven
+-CA's such as L<CAcert.org|http://cacert.org>.
++B<By default, HTTP::Tiny verifies server identity>.
+
+-By default, HTTP::Tiny does not make any assumptions about your trust model,
+-threat level or risk tolerance.  It just aims to give you an encrypted channel
+-when you need one.
++This was changed in version 0.083 due to security concerns. The previous default
++behavior can be enabled by setting C<$ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT}>
++to 1.
+
+-Setting the C<verify_SSL> attribute to a true value will make HTTP::Tiny verify
+-that an SSL connection has a valid SSL certificate corresponding to the host
+-name of the connection and that the SSL certificate has been verified by a CA.
+-Assuming you trust the CA, this will protect against a L<man-in-the-middle
+-attack|http://en.wikipedia.org/wiki/Man-in-the-middle_attack>.  If you are
+-concerned about security, you should enable this option.
++Verification is done by checking that that the TLS/SSL connection has a valid
++certificate corresponding to the host name of the connection and that the
++certificate has been verified by a CA. Assuming you trust the CA, this will
++protect against L<machine-in-the-middle
++attacks|http://en.wikipedia.org/wiki/Machine-in-the-middle_attack>.
+
+ Certificate verification requires a file containing trusted CA certificates.
+
+@@ -2060,9 +2070,7 @@ If the environment variable C<SSL_CERT_FILE> is present, HTTP::Tiny
+ will try to find a CA certificate file in that location.
+
+ If the L<Mozilla::CA> module is installed, HTTP::Tiny will use the CA file
+-included with it as a source of trusted CA's.  (This means you trust Mozilla,
+-the author of Mozilla::CA, the CPAN mirror where you got Mozilla::CA, the
+-toolchain used to install it, and your operating system security, right?)
++included with it as a source of trusted CA's.
+
+ If that module is not available, then HTTP::Tiny will search several
+ system-specific default locations for a CA certificate file:
+@@ -2081,13 +2089,33 @@ system-specific default locations for a CA certificate file:
+
+ /etc/ssl/ca-bundle.pem
+
++=item *
++
++/etc/openssl/certs/ca-certificates.crt
++
++=item *
++
++/etc/ssl/cert.pem
++
++=item *
++
++/usr/local/share/certs/ca-root-nss.crt
++
++=item *
++
++/etc/pki/tls/cacert.pem
++
++=item *
++
++/etc/certs/ca-certificates.crt
++
+ =back
+
+ An exception will be raised if C<verify_SSL> is true and no CA certificate file
+ is available.
+
+-If you desire complete control over SSL connections, the C<SSL_options> attribute
+-lets you provide a hash reference that will be passed through to
++If you desire complete control over TLS/SSL connections, the C<SSL_options>
++attribute lets you provide a hash reference that will be passed through to
+ C<IO::Socket::SSL::start_SSL()>, overriding any options set by HTTP::Tiny. For
+ example, to provide your own trusted CA file:
+
+@@ -2097,7 +2125,7 @@ example, to provide your own trusted CA file:
+
+ The C<SSL_options> attribute could also be used for such things as providing a
+ client certificate for authentication to a server or controlling the choice of
+-cipher used for the SSL connection. See L<IO::Socket::SSL> documentation for
++cipher used for the TLS/SSL connection. See L<IO::Socket::SSL> documentation for
+ details.
+
+ =head1 PROXY SUPPORT
+--
+2.40.0
diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch b/meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch
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
+Upstream-Status: Backport [https://github.com/chansen/p5-http-tiny/commit/a22785783b17cbaa28afaee4a024d81a1903701d]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ cpan/HTTP-Tiny/lib/HTTP/Tiny.pm | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
+index ebc34a1..65ac8ff 100644
+--- a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
++++ b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
+@@ -148,7 +148,7 @@ sub _verify_SSL_default {
+     my ($self) = @_;
+     # Check if insecure default certificate verification behaviour has been
+     # changed by the user by setting PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT=1
+-    return (($ENV{PERL_HTTP_TINY_INSECURE_BY_DEFAULT} || '') eq '1') ? 0 : 1;
++    return (($ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT} || '') eq '1') ? 0 : 1;
+ }
+
+ sub _set_proxies {
+--
+2.40.0
diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index bf81a023b8..b7c864b6dc 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -31,6 +31,8 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://CVE-2020-12723.patch \
            file://CVE-2023-31484.patch \
            file://CVE-2023-47038.patch \
+           file://CVE-2023-31486-0001.patch \
+           file://CVE-2023-31486-0002.patch \
            "
 SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.25.1


