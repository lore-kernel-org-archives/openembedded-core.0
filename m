Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FE7C001B0
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:29:49 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.61379.1688484583046233873
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=jZNeK/Ia;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b8a8154f9cso4076505ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484582; x=1691076582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPu5xo7ptthdWhNN0ML6dcxMqiE6t5iCy4IHWncj0rQ=;
        b=jZNeK/IaQ+MBUVP9gIOf/iv1vnqS0WCNdTmGLMsKFn4z2coGu6e0+a1v+jF01ZrjyM
         we9Tl1xCtENEa73p6tsTfYzpWeiYqZgbOqIraV2r82jLD/6zpXhVgRQHFs3ONzLSA+LD
         KD2zoKuXRDduDYPt7IDM3jYQDuVHYoewH5lzjdiSncN06xvv/LlZLFZQd4A43LOr5S6p
         WmaELfBmbdu9l5zdD8h8FdqtEhxFDX8tnhrzpZf2au5YN3EiqjBsd/NX/nrejZ1EoJY4
         60AiYxthnEYfJ5iZHLKSiHN4+mwyGRfHTbupM2iU6JNqTyPotufXZBhCEcwwNe+klQdH
         xpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484582; x=1691076582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPu5xo7ptthdWhNN0ML6dcxMqiE6t5iCy4IHWncj0rQ=;
        b=GGkZe3Qm2I86FlZlXguMXqDe58Du//FL6ECdenLpHzW/OnMr7rYU4Y7Wa/mEw8SxBg
         8zjqPRAlO14Hq43HM7ItUVylpjwieW8wqOzJhPPheeVZF+3arNXm5g/7vV6jg9QiBKjU
         K4J2vX7WswUWhOMD2KXIX/hPx4sAV778dePziG+pZniGN2KF5ImA6CU7u3ODY6Bnww4/
         9y/F7mQncdvqwafKMfbkNYlLWaWoRZHO6PWzKjS1t86KQsX/+XTUSQ7Z2FxlF9RKU27V
         7odmanJ3EKqEjhffsYuGLiG44HhzlmQ7gMn9vj2/zQ3ImK/jq7aegWwJYYtEDSn5AwoK
         Hgxg==
X-Gm-Message-State: ABy/qLauyVgl4rpdYGaInQfv04DSflgoegOPCUv5YLOcAyb8yV5eDBDG
	nU2jKJL4fmUBoIAv0G+Yqyn6YS8jiC7rFcCAmDap0w==
X-Google-Smtp-Source: APBJJlEEbovtoqWOao6svBmL8kYlw3JqXFoxFxSXRIWR3lPs5ZBFVC9QGMJi8f6lqbCOMmmL6de7rg==
X-Received: by 2002:a17:902:f54f:b0:1b8:7265:aa0 with SMTP id h15-20020a170902f54f00b001b872650aa0mr19372966plf.2.1688484581843;
        Tue, 04 Jul 2023 08:29:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.29.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:29:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/30] perl: Fix CVE-2023-31484 & CVE-2023-31486
Date: Tue,  4 Jul 2023 05:29:03 -1000
Message-Id: <f4fe9861d6aebd971a3120a0eb43f752c73ce2fb.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183836

From: Soumya <soumya.sambu@windriver.com>

CPAN.pm before 2.35 does not verify TLS certificates when downloading
distributions over HTTPS.

HTTP::Tiny before 0.083, a Perl core module since 5.13.9 and
available standalone on CPAN, has an insecure default TLS
configuration where users must opt in to verify certificates.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-31484
https://nvd.nist.gov/vuln/detail/CVE-2023-31486

Upstream patches:
https://github.com/andk/cpanpm/commit/9c98370287f4e709924aee7c58ef21c85289a7f0
https://github.com/chansen/p5-http-tiny/commit/77f557ef84698efeb6eed04e4a9704eaf85b741d
https://github.com/chansen/p5-http-tiny/commit/a22785783b17cbaa28afaee4a024d81a1903701d

Signed-off-by: Soumya <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../perl/files/CVE-2023-31484.patch           |  29 +++
 .../perl/files/CVE-2023-31486-0001.patch      | 217 ++++++++++++++++++
 .../perl/files/CVE-2023-31486-0002.patch      |  30 +++
 meta/recipes-devtools/perl/perl_5.36.0.bb     |   3 +
 4 files changed, 279 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31484.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31484.patch b/meta/recipes-devtools/perl/files/CVE-2023-31484.patch
new file mode 100644
index 0000000000..1f7cbd0da1
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2023-31484.patch
@@ -0,0 +1,29 @@
+From a625ec2cc3a0b6116c1f8b831d3480deb621c245 Mon Sep 17 00:00:00 2001
+From: Stig Palmquist <git@stig.io>
+Date: Tue, 28 Feb 2023 11:54:06 +0100
+Subject: [PATCH] Add verify_SSL=>1 to HTTP::Tiny to verify https server
+ identity
+
+Upstream-Status: Backport [https://github.com/andk/cpanpm/commit/9c98370287f4e709924aee7c58ef21c85289a7f0]
+
+CVE: CVE-2023-31484
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ cpan/CPAN/lib/CPAN/HTTP/Client.pm | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cpan/CPAN/lib/CPAN/HTTP/Client.pm b/cpan/CPAN/lib/CPAN/HTTP/Client.pm
+index 4fc792c..a616fee 100644
+--- a/cpan/CPAN/lib/CPAN/HTTP/Client.pm
++++ b/cpan/CPAN/lib/CPAN/HTTP/Client.pm
+@@ -32,6 +32,7 @@ sub mirror {
+
+     my $want_proxy = $self->_want_proxy($uri);
+     my $http = HTTP::Tiny->new(
++        verify_SSL => 1,
+         $want_proxy ? (proxy => $self->{proxy}) : ()
+     );
+
+--
+2.40.0
diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch b/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch
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
+  https://salsa.debian.org/perl-team/interpreter/perl/-/commit/1490431e40e22052f75a0b3449f1f53cbd27ba92
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
+---
+ cpan/HTTP-Tiny/lib/HTTP/Tiny.pm | 86 ++++++++++++++++++++++-----------
+ 1 file changed, 57 insertions(+), 29 deletions(-)
+
+diff --git a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
+index 83ca06d..5f6ced8 100644
+--- a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
++++ b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
+@@ -40,10 +40,14 @@ sub _croak { require Carp; Carp::croak(@_) }
+ #pod * C<timeout> — Request timeout in seconds (default is 60) If a socket open,
+ #pod   read or write takes longer than the timeout, the request response status code
+ #pod   will be 599.
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
+ #pod An accessor/mutator method exists for each attribute.
+ #pod
+@@ -111,11 +115,17 @@ sub timeout {
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
+@@ -134,6 +144,13 @@ sub new {
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
+@@ -1055,7 +1072,7 @@ sub new {
+         timeout          => 60,
+         max_line_size    => 16384,
+         max_header_lines => 64,
+-        verify_SSL       => 0,
++        verify_SSL       => HTTP::Tiny::_verify_SSL_default(),
+         SSL_options      => {},
+         %args
+     }, $class;
+@@ -2043,11 +2060,11 @@ proxy
+ timeout
+ verify_SSL
+
+-=head1 SSL SUPPORT
++=head1 TLS/SSL SUPPORT
+
+ Direct C<https> connections are supported only if L<IO::Socket::SSL> 1.56 or
+ greater and L<Net::SSLeay> 1.49 or greater are installed. An error will occur
+-if new enough versions of these modules are not installed or if the SSL
++if new enough versions of these modules are not installed or if the TLS
+ encryption fails. You can also use C<HTTP::Tiny::can_ssl()> utility function
+ that returns boolean to see if the required modules are installed.
+
+@@ -2055,7 +2072,7 @@ An C<https> connection may be made via an C<http> proxy that supports the CONNEC
+ command (i.e. RFC 2817).  You may not proxy C<https> via a proxy that itself
+ requires C<https> to communicate.
+
+-SSL provides two distinct capabilities:
++TLS/SSL provides two distinct capabilities:
+
+ =over 4
+
+@@ -2069,24 +2086,17 @@ Verification of server identity
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
+@@ -2094,9 +2104,7 @@ If the environment variable C<SSL_CERT_FILE> is present, HTTP::Tiny
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
+@@ -2115,13 +2123,33 @@ system-specific default locations for a CA certificate file:
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
+ An error will be occur if C<verify_SSL> is true and no CA certificate file
+ is available.
+
+-If you desire complete control over SSL connections, the C<SSL_options> attribute
+-lets you provide a hash reference that will be passed through to
++If you desire complete control over TLS/SSL connections, the C<SSL_options>
++attribute lets you provide a hash reference that will be passed through to
+ C<IO::Socket::SSL::start_SSL()>, overriding any options set by HTTP::Tiny. For
+ example, to provide your own trusted CA file:
+
+@@ -2131,7 +2159,7 @@ example, to provide your own trusted CA file:
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
+    The variable to override the verify_SSL default differed slightly in the
+    documentation from what was checked for in the code.
+
+    This commit makes the code use `PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT`
+    as documented, instead of `PERL_HTTP_TINY_INSECURE_BY_DEFAULT` which was
+    missing `SSL_`
+
+Upstream-Status: Backport [https://github.com/chansen/p5-http-tiny/commit/a22785783b17cbaa28afaee4a024d81a1903701d]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+diff --git a/lib/HTTP/Tiny.pm b/lib/HTTP/Tiny.pm
+index bf455b6..7240b65 100644
+--- a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
++++ b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
+@@ -149,7 +149,7 @@ sub _verify_SSL_default {
+     my ($self) = @_;
+     # Check if insecure default certificate verification behaviour has been
+     # changed by the user by setting PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT=1
+-    return (($ENV{PERL_HTTP_TINY_INSECURE_BY_DEFAULT} || '') eq '1') ? 0 : 1;
++    return (($ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT} || '') eq '1') ? 0 : 1;
+ }
+
+ sub _set_proxies {
diff --git a/meta/recipes-devtools/perl/perl_5.36.0.bb b/meta/recipes-devtools/perl/perl_5.36.0.bb
index b8dba00f18..c3ca28ed23 100644
--- a/meta/recipes-devtools/perl/perl_5.36.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.36.0.bb
@@ -18,6 +18,9 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
            file://0001-Fix-build-with-gcc-12.patch \
+           file://CVE-2023-31484.patch \
+           file://CVE-2023-31486-0001.patch \
+           file://CVE-2023-31486-0002.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.34.1


