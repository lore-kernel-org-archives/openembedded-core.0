Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id DF13860CEE
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:19 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id 6so2548554pgk.0
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sGMmJ3Wjtr51Iw+6St/GZYEgSznzojVOY/6k4xDyVl4=;
	b=oFeyeElj3gD4ITzgvsHLUPLKWo52jWB+bsg7AsOcZaK+PadqKCHxpdw4MJKZHbLZsY
	PhCKZ4UiuCNBJyH7wvzC1jYeT2dmJU7QlvbY9P3pLW0oQUVxvw+Wpq8BAQuqKxp3S5FZ
	wMDGuOEvw06wCA4Bma1wXrv9/fsOTxvJQ5Q58byDkulGqzeBjH34dyMgn7JTMc5QjC6m
	WuMK05KiHD63Azhvn/SOHdcexvfLT5LlfswuWgyilnBkUAZqtYv175nAPsev4DyxXPF1
	GhlEt3o6ncsMSIffMg+9qjCzuXfWti4LK8TjYjF9MBkSuw49qd0D+oLc2C5qfgFDyn/R
	RoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sGMmJ3Wjtr51Iw+6St/GZYEgSznzojVOY/6k4xDyVl4=;
	b=Kgi1gMKXGZEadLvIgVO27LQq8RwtuSRUzTEVOs6EunaM/aPlGMu/Z0H+QV2pVDbkr/
	x/9QQoIJ6MVVNVUlpq5CNZO1iqHc0LVYHmPq3S9G8ix8a2rl+XOK/2/A7ZXzPvM/dJDQ
	cTnDldly2VXPoJIOuJGfIgOKa6N+NikIwVjbLEBE9/WY01WfU+iUrCxEuwXFYm82b2jP
	7ZTupwlXyKinVZ97bxPqkajtSBM2WWAnkmNGF6i+fKfHKpggFCglsNykM8MIGbn9WZUy
	utIFuZ4AKhsnJMV2265SUTEdb4rXv+ueB81EmQN2+HoTGH3HYAa4oty/h1FrxyMwSCBZ
	EgEw==
X-Gm-Message-State: APjAAAXA9gjGkt84+PA2YA7tPAj+ScrP0V9qRiV2tu8WZxVkT7fqf0kd
	bj/DrrhopmHjiMaFPZ7qMqn8On2m
X-Google-Smtp-Source: APXvYqwAR/Ef4HAyv4NcpRXGQ2LSeYtSVMuTMWk/+Td9yFxuQd4tpNDYyhVQbaYiwSS6C2dUSDXRPw==
X-Received: by 2002:a63:7515:: with SMTP id q21mr10166088pgc.63.1581264620579; 
	Sun, 09 Feb 2020 08:10:20 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.19
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:49 -0800
Message-Id: <502af15e2639526687edc038c7e56ecd3feaed86.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 21/29] perl: Fix various reproducibile build issues
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:20 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add a patch which handles the following issues:

a) Remove the \n from configure_attr.sh since it gets quoted differently depending on
   whether the shell is bash or dash which can cause the test result to be incorrect.
   Reported upstream: https://github.com/arsv/perl-cross/issues/87

b) Sort the order of the module lists from configure_mods.sh since otherwise
   the result isn't the same leading to makefile differences.
   Reported upstream: https://github.com/arsv/perl-cross/issues/88

c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends whilst
   there for good measure)
   This needs to go to upstream perl (not done)

d) Use bash for perl-cross configure since otherwise trnl gets set to "\n" with bash
   and "" with dash
   Reported upstream: https://github.com/arsv/perl-cross/issues/87

(From OE-Core rev: 482fd0d99f989b5a72a25bdf402fb2f219420b5d)

(From OE-Core rev: def3a9d748564883d71c506726554df622701b00)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../perl/files/determinism.patch              | 81 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.30.0.bb     |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/determinism.patch

diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
new file mode 100644
index 0000000000..ed4d06f5ec
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/determinism.patch
@@ -0,0 +1,81 @@
+Fixes to make the perl build reproducible:
+
+a) Remove the \n from configure_attr.sh since it gets quoted differently depending on
+   whether the shell is bash or dash which can cause the test result to be incorrect.
+   Reported upstream: https://github.com/arsv/perl-cross/issues/87
+
+b) Sort the order of the module lists from configure_mods.sh since otherwise
+   the result isn't the same leading to makefile differences.
+   Reported upstream: https://github.com/arsv/perl-cross/issues/88
+
+c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends whilst 
+   there for good measure)
+   This needs to go to upstream perl (not done)
+
+d) Use bash for perl-cross configure since otherwise trnl gets set to "\n" with bash
+   and "" with dash
+   Reported upstream: https://github.com/arsv/perl-cross/issues/87
+
+RP 2020/2/7
+
+Upstream-Status: Pending [75% submitted]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
+
+Index: perl-5.30.1/cnf/configure_attr.sh
+===================================================================
+--- perl-5.30.1.orig/cnf/configure_attr.sh
++++ perl-5.30.1/cnf/configure_attr.sh
+@@ -131,7 +131,7 @@ if not hinted d_c99_variadic_macros 'sup
+ 	try_start
+ 	try_add '#include <stdio.h>'
+ 	try_add '#define foo(fmt, ...) printf(fmt, __VA_ARGS__)'
+-	try_add 'int main(void) { foo("%i\n", 1234); return 0; }'
++	try_add 'int main(void) { foo("%i", 1234); return 0; }'
+ 	try_compile
+ 	resdef d_c99_variadic_macros 'supported' 'missing'
+ fi
+Index: perl-5.30.1/cnf/configure_mods.sh
+===================================================================
+--- perl-5.30.1.orig/cnf/configure_mods.sh
++++ perl-5.30.1/cnf/configure_mods.sh
+@@ -82,7 +82,7 @@ extonlyif() {
+ }
+ 
+ definetrimspaces() {
+-	v=`echo "$2" | sed -r -e 's/\s+/ /g' -e 's/^\s+//' -e 's/\s+$//'`
++	v=`echo "$2" | sed -r -e 's/\s+/ /g' -e 's/^\s+//' -e 's/\s+$//' | xargs -n1 | LANG=C sort | xargs`
+ 	define $1 "$v"
+ }
+ 
+Index: perl-5.30.1/cpan/Encode/Byte/Makefile.PL
+===================================================================
+--- perl-5.30.1.orig/cpan/Encode/Byte/Makefile.PL
++++ perl-5.30.1/cpan/Encode/Byte/Makefile.PL
+@@ -171,7 +171,7 @@ sub postamble
+     my $lengthsofar = length($str);
+     my $continuator = '';
+     $str .= "$table.c : $enc2xs Makefile.PL";
+-    foreach my $file (@{$tables{$table}})
++    foreach my $file (sort (@{$tables{$table}}))
+     {
+         $str .= $continuator.' '.$self->catfile($dir,$file);
+         if ( length($str)-$lengthsofar > 128*$numlines )
+@@ -189,7 +189,7 @@ sub postamble
+         qq{\n\t\$(PERL) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
+     open (FILELIST, ">$table.fnm")
+         || die "Could not open $table.fnm: $!";
+-    foreach my $file (@{$tables{$table}})
++    foreach my $file (sort (@{$tables{$table}}))
+     {
+         print FILELIST $self->catfile($dir,$file) . "\n";
+     }
+Index: perl-5.30.1/cnf/configure
+===================================================================
+--- perl-5.30.1.orig/cnf/configure
++++ perl-5.30.1/cnf/configure
+@@ -1,4 +1,4 @@
+-#!/bin/sh
++#!/bin/bash
+ 
+ base=${0%/*}; test -z "$base" && base=.
+ 
diff --git a/meta/recipes-devtools/perl/perl_5.30.0.bb b/meta/recipes-devtools/perl/perl_5.30.0.bb
index c567d4e7a2..838e52c67b 100644
--- a/meta/recipes-devtools/perl/perl_5.30.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://fix-setgroup.patch \
            file://0001-enc2xs-Add-environment-variable-to-suppress-comments.patch \
            file://0002-Constant-Fix-up-shebang.patch \
+           file://determinism.patch  \
            "
 SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.17.1


