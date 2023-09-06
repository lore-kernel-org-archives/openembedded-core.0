Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294AEEE14B9
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 16:56:52 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.4103.1694019404423890972
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 09:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=MUpSvT0t;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-52889bc61b6so5553292a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694019403; x=1694624203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+37R3eisrIvzr8pulSW6E2JXrHhqRDOEcejn0naVFyc=;
        b=MUpSvT0t3K8RjakMx9ZTDU+P6byfYPoFLuygEi71JbyiIIFTC5edcqB2j9f4XbdowZ
         cw2HTewdor8dHRYNMKB6giEfDRG+AexPDGPiBKMxvrM21q5grn+DJhOEmVFKmOgnBgDx
         NE+Kfd5WpdcobLtUYtTFtCjFx30Y4R6lGqn68vm5IZoBiudx6rKR5GmrXfEpFedQsetF
         W5l1Y/yBDb9R7hHlaKV4eJcWjFHNwrzR0XUm4SA/0ZwL8Dl9c6vyCJ7JSwQ5ZuI8VFVT
         +6yK3uta6HWV2tnVsKN3tOXkkx0NQ8QaeKWAMuSnXV+eay8a6IqZOse8zYM9vPZI7LiH
         l6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694019403; x=1694624203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+37R3eisrIvzr8pulSW6E2JXrHhqRDOEcejn0naVFyc=;
        b=K2yyCZCK/JLRZSdDqsP0bclK9QVuK71MdIAlvVu1htJN+7E637XsyKkVqpKmBNR83r
         nB9YIjj7QKZvvbQLUIBPflHOkmzD9GfFknoiF9Iua+mY9aGQi71fWCrNamWN4Y9HSF2v
         pIe7uBAl8Ox8nFMHLXSGsuZgwMqnG+brXmDR86eTXMsgNPc8lG/3VLlRS0CHc3WsCZYi
         mQ7/u1Mdw0VxRwLj+AwRngm+5ZS9EaN8HMrvdiZIZeCOgiTKTXZ1fstgt3lY7uCDIFR+
         xWNPEoStxWpiGE3WhHsOJqlDcS/OiRAPOqoS7jJ1Tl5g0arbKh1hxEuieGTpzWiHOqNx
         /DKg==
X-Gm-Message-State: AOJu0YzWjlSzPZFZVj1sDhKGrH87/497CAFjXwURt2W/qytjjBhuYNmL
	1stYXb2CGMl/lt0kxYvpA3N5ZH6MlLk=
X-Google-Smtp-Source: AGHT+IEFVo0CaP7nA5l6UBiHCdWtXOBBNpK3+SsPXf3ypcm9izyJpDn3E3vOfTz9vwGjnD+15oVLhA==
X-Received: by 2002:a17:906:8448:b0:9a2:1e03:1573 with SMTP id e8-20020a170906844800b009a21e031573mr2773931ejy.65.1694019402571;
        Wed, 06 Sep 2023 09:56:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lh7-20020a170906f8c700b0098e34446464sm9284848ejb.25.2023.09.06.09.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 09:56:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/17] perl: update 5.36.1 -> 5.38.0
Date: Wed,  6 Sep 2023 18:56:22 +0200
Message-Id: <20230906165633.2382629-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230906165633.2382629-1-alex@linutronix.de>
References: <20230906165633.2382629-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 16:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187328

Rebase perl-configpm-switch.patch.

Add a patch to perl-cross to unbreak perl's line numbers printing.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...mt.sh-add-32-bit-integer-format-defi.patch |  28 +++
 .../perl-cross/perlcross_1.5.bb               |   1 +
 .../perl/files/CVE-2023-31484.patch           |  29 ---
 .../perl/files/CVE-2023-31486-0001.patch      | 217 ------------------
 .../perl/files/CVE-2023-31486-0002.patch      |  36 ---
 .../perl/files/perl-configpm-switch.patch     |  66 +++---
 .../perl/{perl_5.36.1.bb => perl_5.38.0.bb}   |  13 +-
 7 files changed, 68 insertions(+), 322 deletions(-)
 create mode 100644 meta/recipes-devtools/perl-cross/files/0001-cnf-configure_pfmt.sh-add-32-bit-integer-format-defi.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31484.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch
 rename meta/recipes-devtools/perl/{perl_5.36.1.bb => perl_5.38.0.bb} (96%)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-cnf-configure_pfmt.sh-add-32-bit-integer-format-defi.patch b/meta/recipes-devtools/perl-cross/files/0001-cnf-configure_pfmt.sh-add-32-bit-integer-format-defi.patch
new file mode 100644
index 00000000000..4de4a5b955b
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/files/0001-cnf-configure_pfmt.sh-add-32-bit-integer-format-defi.patch
@@ -0,0 +1,28 @@
+From 920abf3dc39c851a655b719622c76a6f0dc9981d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 5 Sep 2023 19:47:33 +0200
+Subject: [PATCH] cnf/configure_pfmt.sh: add 32 bit integer format definitions
+
+These started to matter in perl 5.38 where they are used to print
+line numbers.
+
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/143]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ cnf/configure_pfmt.sh | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/cnf/configure_pfmt.sh b/cnf/configure_pfmt.sh
+index 8f93da1..7bb4b6f 100644
+--- a/cnf/configure_pfmt.sh
++++ b/cnf/configure_pfmt.sh
+@@ -52,3 +52,9 @@ else
+ 	define uvxformat '"lx"'
+ 	define uvXUformat '"lX"'
+ fi
++
++define i32dformat 'PRId32'
++define u32uformat 'PRIu32'
++define u32oformat 'PRIo32'
++define u32xformat 'PRIx32'
++define u32XUformat 'PRIX32'
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.5.bb b/meta/recipes-devtools/perl-cross/perlcross_1.5.bb
index d17945480ef..7ca4977b97e 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.5.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.5.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://determinism.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
+           file://0001-cnf-configure_pfmt.sh-add-32-bit-integer-format-defi.patch \
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31484.patch b/meta/recipes-devtools/perl/files/CVE-2023-31484.patch
deleted file mode 100644
index 9a9117c53a4..00000000000
--- a/meta/recipes-devtools/perl/files/CVE-2023-31484.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From a625ec2cc3a0b6116c1f8b831d3480deb621c245 Mon Sep 17 00:00:00 2001
-From: Stig Palmquist <git@stig.io>
-Date: Tue, 28 Feb 2023 11:54:06 +0100
-Subject: [PATCH] Add verify_SSL=>1 to HTTP::Tiny to verify https server
- identity
-
-CVE: CVE-2023-31484
-
-Upstream-Status: Backport [https://github.com/andk/cpanpm/commit/9c98370287f4e709924aee7c58ef21c85289a7f0]
-
-Signed-off-by: Soumya <soumya.sambu@windriver.com>
----
- cpan/CPAN/lib/CPAN/HTTP/Client.pm | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/cpan/CPAN/lib/CPAN/HTTP/Client.pm b/cpan/CPAN/lib/CPAN/HTTP/Client.pm
-index 4fc792c..a616fee 100644
---- a/cpan/CPAN/lib/CPAN/HTTP/Client.pm
-+++ b/cpan/CPAN/lib/CPAN/HTTP/Client.pm
-@@ -32,6 +32,7 @@ sub mirror {
-
-     my $want_proxy = $self->_want_proxy($uri);
-     my $http = HTTP::Tiny->new(
-+        verify_SSL => 1,
-         $want_proxy ? (proxy => $self->{proxy}) : ()
-     );
-
---
-2.40.0
diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch b/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch
deleted file mode 100644
index 0531e1f0992..00000000000
--- a/meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch
+++ /dev/null
@@ -1,217 +0,0 @@
-From 77f557ef84698efeb6eed04e4a9704eaf85b741d
-From: Stig Palmquist <git@stig.io>
-Date: Mon Jun 5 16:46:22 2023 +0200
-Subject: [PATCH] Change verify_SSL default to 1, add ENV var to enable
- insecure default
-
-- Changes the `verify_SSL` default parameter from `0` to `1`
-
-  Based on patch by Dominic Hargreaves:
-  https://salsa.debian.org/perl-team/interpreter/perl/-/commit/1490431e40e22052f75a0b3449f1f53cbd27ba92
-
-  CVE: CVE-2023-31486
-
-- Add check for `$ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT}` that
-  enables the previous insecure default behaviour if set to `1`.
-
-  This provides a workaround for users who encounter problems with the
-  new `verify_SSL` default.
-
-  Example to disable certificate checks:
-  ```
-    $ PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT=1 ./script.pl
-  ```
-
-- Updates to documentation:
-  - Describe changing the verify_SSL value
-  - Describe the escape-hatch environment variable
-  - Remove rationale for not enabling verify_SSL
-  - Add missing certificate search paths
-  - Replace "SSL" with "TLS/SSL" where appropriate
-  - Use "machine-in-the-middle" instead of "man-in-the-middle"
-
-Upstream-Status: Backport [https://github.com/chansen/p5-http-tiny/commit/77f557ef84698efeb6eed04e4a9704eaf85b741d]
-
-Signed-off-by: Soumya <soumya.sambu@windriver.com>
----
- cpan/HTTP-Tiny/lib/HTTP/Tiny.pm | 86 ++++++++++++++++++++++-----------
- 1 file changed, 57 insertions(+), 29 deletions(-)
-
-diff --git a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
-index 83ca06d..ebc34a1 100644
---- a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
-+++ b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
-@@ -40,10 +40,14 @@ sub _croak { require Carp; Carp::croak(@_) }
- #pod * C<timeout> — Request timeout in seconds (default is 60) If a socket open,
- #pod   read or write takes longer than the timeout, the request response status code
- #pod   will be 599.
--#pod * C<verify_SSL> — A boolean that indicates whether to validate the SSL
--#pod   certificate of an C<https> — connection (default is false)
-+#pod * C<verify_SSL> — A boolean that indicates whether to validate the TLS/SSL
-+#pod   certificate of an C<https> — connection (default is true). Changed from false
-+#pod   to true in version 0.083.
- #pod * C<SSL_options> — A hashref of C<SSL_*> — options to pass through to
- #pod   L<IO::Socket::SSL>
-+#pod * C<$ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT}> - Changes the default
-+#pod   certificate verification behavior to not check server identity if set to 1.
-+#pod   Only effective if C<verify_SSL> is not set. Added in version 0.083.
- #pod
- #pod An accessor/mutator method exists for each attribute.
- #pod
-@@ -111,11 +115,17 @@ sub timeout {
- sub new {
-     my($class, %args) = @_;
-
-+    # Support lower case verify_ssl argument, but only if verify_SSL is not
-+    # true.
-+    if ( exists $args{verify_ssl} ) {
-+        $args{verify_SSL}  ||= $args{verify_ssl};
-+    }
-+
-     my $self = {
-         max_redirect => 5,
-         timeout      => defined $args{timeout} ? $args{timeout} : 60,
-         keep_alive   => 1,
--        verify_SSL   => $args{verify_SSL} || $args{verify_ssl} || 0, # no verification by default
-+        verify_SSL   => defined $args{verify_SSL} ? $args{verify_SSL} : _verify_SSL_default(),
-         no_proxy     => $ENV{no_proxy},
-     };
-
-@@ -134,6 +144,13 @@ sub new {
-     return $self;
- }
-
-+sub _verify_SSL_default {
-+    my ($self) = @_;
-+    # Check if insecure default certificate verification behaviour has been
-+    # changed by the user by setting PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT=1
-+    return (($ENV{PERL_HTTP_TINY_INSECURE_BY_DEFAULT} || '') eq '1') ? 0 : 1;
-+}
-+
- sub _set_proxies {
-     my ($self) = @_;
-
-@@ -1055,7 +1072,7 @@ sub new {
-         timeout          => 60,
-         max_line_size    => 16384,
-         max_header_lines => 64,
--        verify_SSL       => 0,
-+        verify_SSL       => HTTP::Tiny::_verify_SSL_default(),
-         SSL_options      => {},
-         %args
-     }, $class;
-@@ -2043,11 +2060,11 @@ proxy
- timeout
- verify_SSL
-
--=head1 SSL SUPPORT
-+=head1 TLS/SSL SUPPORT
-
- Direct C<https> connections are supported only if L<IO::Socket::SSL> 1.56 or
- greater and L<Net::SSLeay> 1.49 or greater are installed. An error will occur
--if new enough versions of these modules are not installed or if the SSL
-+if new enough versions of these modules are not installed or if the TLS
- encryption fails. You can also use C<HTTP::Tiny::can_ssl()> utility function
- that returns boolean to see if the required modules are installed.
-
-@@ -2055,7 +2072,7 @@ An C<https> connection may be made via an C<http> proxy that supports the CONNEC
- command (i.e. RFC 2817).  You may not proxy C<https> via a proxy that itself
- requires C<https> to communicate.
-
--SSL provides two distinct capabilities:
-+TLS/SSL provides two distinct capabilities:
-
- =over 4
-
-@@ -2069,24 +2086,17 @@ Verification of server identity
-
- =back
-
--B<By default, HTTP::Tiny does not verify server identity>.
--
--Server identity verification is controversial and potentially tricky because it
--depends on a (usually paid) third-party Certificate Authority (CA) trust model
--to validate a certificate as legitimate.  This discriminates against servers
--with self-signed certificates or certificates signed by free, community-driven
--CA's such as L<CAcert.org|http://cacert.org>.
-+B<By default, HTTP::Tiny verifies server identity>.
-
--By default, HTTP::Tiny does not make any assumptions about your trust model,
--threat level or risk tolerance.  It just aims to give you an encrypted channel
--when you need one.
-+This was changed in version 0.083 due to security concerns. The previous default
-+behavior can be enabled by setting C<$ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT}>
-+to 1.
-
--Setting the C<verify_SSL> attribute to a true value will make HTTP::Tiny verify
--that an SSL connection has a valid SSL certificate corresponding to the host
--name of the connection and that the SSL certificate has been verified by a CA.
--Assuming you trust the CA, this will protect against a L<man-in-the-middle
--attack|http://en.wikipedia.org/wiki/Man-in-the-middle_attack>.  If you are
--concerned about security, you should enable this option.
-+Verification is done by checking that that the TLS/SSL connection has a valid
-+certificate corresponding to the host name of the connection and that the
-+certificate has been verified by a CA. Assuming you trust the CA, this will
-+protect against L<machine-in-the-middle
-+attacks|http://en.wikipedia.org/wiki/Machine-in-the-middle_attack>.
-
- Certificate verification requires a file containing trusted CA certificates.
-
-@@ -2094,9 +2104,7 @@ If the environment variable C<SSL_CERT_FILE> is present, HTTP::Tiny
- will try to find a CA certificate file in that location.
-
- If the L<Mozilla::CA> module is installed, HTTP::Tiny will use the CA file
--included with it as a source of trusted CA's.  (This means you trust Mozilla,
--the author of Mozilla::CA, the CPAN mirror where you got Mozilla::CA, the
--toolchain used to install it, and your operating system security, right?)
-+included with it as a source of trusted CA's.
-
- If that module is not available, then HTTP::Tiny will search several
- system-specific default locations for a CA certificate file:
-@@ -2115,13 +2123,33 @@ system-specific default locations for a CA certificate file:
-
- /etc/ssl/ca-bundle.pem
-
-+=item *
-+
-+/etc/openssl/certs/ca-certificates.crt
-+
-+=item *
-+
-+/etc/ssl/cert.pem
-+
-+=item *
-+
-+/usr/local/share/certs/ca-root-nss.crt
-+
-+=item *
-+
-+/etc/pki/tls/cacert.pem
-+
-+=item *
-+
-+/etc/certs/ca-certificates.crt
-+
- =back
-
- An error will be occur if C<verify_SSL> is true and no CA certificate file
- is available.
-
--If you desire complete control over SSL connections, the C<SSL_options> attribute
--lets you provide a hash reference that will be passed through to
-+If you desire complete control over TLS/SSL connections, the C<SSL_options>
-+attribute lets you provide a hash reference that will be passed through to
- C<IO::Socket::SSL::start_SSL()>, overriding any options set by HTTP::Tiny. For
- example, to provide your own trusted CA file:
-
-@@ -2131,7 +2159,7 @@ example, to provide your own trusted CA file:
-
- The C<SSL_options> attribute could also be used for such things as providing a
- client certificate for authentication to a server or controlling the choice of
--cipher used for the SSL connection. See L<IO::Socket::SSL> documentation for
-+cipher used for the TLS/SSL connection. See L<IO::Socket::SSL> documentation for
- details.
-
- =head1 PROXY SUPPORT
---
-2.40.0
diff --git a/meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch b/meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch
deleted file mode 100644
index 45452be389a..00000000000
--- a/meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From a22785783b17cbaa28afaee4a024d81a1903701d
-From: Stig Palmquist <git@stig.io>
-Date: Sun Jun 18 11:36:05 2023 +0200
-Subject: [PATCH] Fix incorrect env var name for verify_SSL default
-
-The variable to override the verify_SSL default differed slightly in the
-documentation from what was checked for in the code.
-
-This commit makes the code use `PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT`
-as documented, instead of `PERL_HTTP_TINY_INSECURE_BY_DEFAULT` which was
-missing `SSL_`
-
-CVE: CVE-2023-31486
-
-Upstream-Status: Backport [https://github.com/chansen/p5-http-tiny/commit/a22785783b17cbaa28afaee4a024d81a1903701d]
-
-Signed-off-by: Soumya <soumya.sambu@windriver.com>
----
- cpan/HTTP-Tiny/lib/HTTP/Tiny.pm | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
-index ebc34a1..65ac8ff 100644
---- a/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
-+++ b/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
-@@ -148,7 +148,7 @@ sub _verify_SSL_default {
-     my ($self) = @_;
-     # Check if insecure default certificate verification behaviour has been
-     # changed by the user by setting PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT=1
--    return (($ENV{PERL_HTTP_TINY_INSECURE_BY_DEFAULT} || '') eq '1') ? 0 : 1;
-+    return (($ENV{PERL_HTTP_TINY_SSL_INSECURE_BY_DEFAULT} || '') eq '1') ? 0 : 1;
- }
-
- sub _set_proxies {
---
-2.40.0
diff --git a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
index 7ca7c7d12fe..0be1d5a93c5 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From e789c1a0c9de5928a3b49f5b9d81b63636f5c7bb Mon Sep 17 00:00:00 2001
+From c25d460a2f00e9af25087d40447fe1a81c89710c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 27 May 2007 21:04:11 +0000
 Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
@@ -20,38 +20,38 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 16 insertions(+), 2 deletions(-)
 
 diff --git a/configpm b/configpm
-index 94a4778..99b20c9 100755
+index 07219d8..01a23fa 100755
 --- a/configpm
 +++ b/configpm
-@@ -687,7 +687,7 @@ sub FETCH {
-     my($self, $key) = @_;
- 
-     # check for cached value (which may be undef so we use exists not defined)
--    return exists $self->{$key} ? $self->{$key} : $self->fetch_string($key);
-+    return $self->fetch_string($key);
- }
- 
+@@ -718,7 +718,7 @@ $config_txt .= uncomment <<'ENDOFEND';
+ #        my($self, $key) = @_;
+ #
+ #        # check for cached value (which may be undef so we use exists not defined)
+-#        return exists $self->{$key} ? $self->{$key} : $self->fetch_string($key);
++#        return $self->fetch_string($key);
+ #    }
+ #
  ENDOFEND
-@@ -845,7 +845,21 @@ $config_txt .= sprintf <<'ENDOFTIE', $fast_config;
- sub DESTROY { }
- 
- sub AUTOLOAD {
--    require 'Config_heavy.pl';
-+    my $cfgfile = 'Config_heavy.pl';
-+    if (defined $ENV{PERLCONFIGTARGET} and $ENV{PERLCONFIGTARGET} eq "yes")
-+    {
-+        $cfgfile = 'Config_heavy-target.pl';
-+    }
-+    if (defined $ENV{PERL_ARCHLIB})
-+    {
-+        push @INC, $ENV{PERL_ARCHLIB};
-+        require $cfgfile;
-+        pop @INC;
-+    }
-+    else
-+    {
-+        require $cfgfile;
-+    }
-     goto \&launcher unless $Config::AUTOLOAD =~ /launcher$/;
-     die "&Config::AUTOLOAD failed on $Config::AUTOLOAD";
- }
+@@ -876,7 +876,21 @@ $config_txt .= sprintf uncomment <<'ENDOFTIE', $fast_config;
+ #    sub DESTROY { }
+ #
+ #    sub AUTOLOAD {
+-#        require 'Config_heavy.pl';
++#        my $cfgfile = 'Config_heavy.pl';
++#        if (defined $ENV{PERLCONFIGTARGET} and $ENV{PERLCONFIGTARGET} eq "yes")
++#        {
++#            $cfgfile = 'Config_heavy-target.pl';
++#        }
++#        if (defined $ENV{PERL_ARCHLIB})
++#        {
++#            push @INC, $ENV{PERL_ARCHLIB};
++#            require $cfgfile;
++#            pop @INC;
++#        }
++#        else
++#        {
++#            require $cfgfile;
++#        }
+ #        goto \&launcher unless $Config::AUTOLOAD =~ /launcher$/;
+ #        die "&Config::AUTOLOAD failed on $Config::AUTOLOAD";
+ #    }
diff --git a/meta/recipes-devtools/perl/perl_5.36.1.bb b/meta/recipes-devtools/perl/perl_5.38.0.bb
similarity index 96%
rename from meta/recipes-devtools/perl/perl_5.36.1.bb
rename to meta/recipes-devtools/perl/perl_5.38.0.bb
index 87768cc7f7c..2103a39dfa4 100644
--- a/meta/recipes-devtools/perl/perl_5.36.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.0.bb
@@ -17,9 +17,6 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0002-Constant-Fix-up-shebang.patch \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
-           file://CVE-2023-31484.patch \
-           file://CVE-2023-31486-0001.patch \
-           file://CVE-2023-31486-0002.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
@@ -28,7 +25,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "68203665d8ece02988fc77dc92fccbb297a83a4bb4b8d07558442f978da54cc1"
+SRC_URI[perl.sha256sum] = "213ef58089d2f2c972ea353517dc60ec3656f050dcc027666e118b508423e517"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
@@ -158,9 +155,10 @@ do_install:append:class-target() {
     # This is used to substitute target configuration when running native perl via perl-configpm-switch.patch
     ln -s Config_heavy.pl ${D}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/Config_heavy-target.pl
 
-    # This contains host-specific information used for building miniperl (a helper executable built with host compiler)
-    # and therefore isn't reproducible. I believe the file isn't actually needed on target.
-    rm ${D}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/xconfig.h
+    # xconfig.h contains references to build host architecture, and yet is included from various other places.
+    # To make it reproducible let's make it a copy of config.h patch that is specific to the target architecture.
+    # It is believed that the original header is the product of building miniperl (a helper executable built with host compiler).
+    cp ${D}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/config.h ${D}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/xconfig.h
 }
 
 do_install:append:class-nativesdk() {
@@ -205,6 +203,7 @@ perl_package_preprocess () {
             ${PKGD}${bindir}/pod2usage.perl \
             ${PKGD}${bindir}/podchecker.perl \
             ${PKGD}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/config.h \
+            ${PKGD}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/xconfig.h \
             ${PKGD}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/perl.h \
             ${PKGD}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/pp.h \
             ${PKGD}${libdir}/perl5/${PV}/Config.pm \
-- 
2.30.2


