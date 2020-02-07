Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id C35DC60EC6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 14:41:00 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t3so2969040wru.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 06:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=1YGlRllhFqPwBgUqfQIzwI7Hnis1egzFU7AicMqeeyw=;
	b=UVGIuAXMKjm+YzjZvmGt7hCgMlvfGdfI4wloxyNt91nZDea+4kyyCz+15QPA55rjTQ
	1lPKudpTYbz/FhD9Se/uX1rjcBg6XXW89RoPrRhcP/RzmeOrIZ3GGXAvjXHQMg+HgSdV
	fzXs55h87taZM9ls35cgSPKNCyP86CqNfTGt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1YGlRllhFqPwBgUqfQIzwI7Hnis1egzFU7AicMqeeyw=;
	b=nFPKELvuBiub4BlqtPnNk9C0HfWOldDJ9lV69ZTujNusnTU2nYVXr/1hqjejZlzGEG
	KYQvYt4j2GAMBKGTiyuV2bojbcF7hBOQIFhtBSiJCq33kOjtIAf4qpk8Yk8vhou9PKk/
	48A5oDyqgUiJw/td4QwppkqTrGzTvV8ldGawnrOeTGan97XHbAqkDEfOqQclrEioZRuI
	9z6AAke8+4Qv73uqee4GMaSuDLhkfMuU9vtrtQaxzySp88o7Aa6V2LXpplCKGKwqNVR4
	j6qIgd6KRYuXB32qE8PNkgTPX7LbYbGjH5ixdZ/tOB6so2/bY25fmWQKRCZX7h6ozCX/
	f/Kg==
X-Gm-Message-State: APjAAAXvnlGm0O9Ry3OMWo1dDPRJVQUeObku9OrpJBWcW2DkL+RBVHEY
	rBNFahgX2csB1PIevat2k4hDojzDrK0=
X-Google-Smtp-Source: APXvYqyWF55M484pH+SbvK2xTX/o+8ZHYYFpOa4X5Drxna17ox7+RxQXNMyd7kC1Z+GY/VsgCZ9qrw==
X-Received: by 2002:adf:fc4b:: with SMTP id e11mr5232512wrs.326.1581086460927; 
	Fri, 07 Feb 2020 06:41:00 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a16sm3526412wrx.87.2020.02.07.06.41.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 06:41:00 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 14:40:57 +0000
Message-Id: <20200207144057.6121-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200207144057.6121-1-richard.purdie@linuxfoundation.org>
References: <20200207144057.6121-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/3] perl: Fix various reproducibile build issues
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
X-List-Received-Date: Fri, 07 Feb 2020 14:41:01 -0000
Content-Transfer-Encoding: 8bit

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

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../perl/files/determinism.patch              | 81 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.30.1.bb     |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/determinism.patch

diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
new file mode 100644
index 00000000000..ed4d06f5ec6
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
diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index dcdabb692dd..5d762710df3 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-enc2xs-Add-environment-variable-to-suppress-comments.patch \
            file://0002-Constant-Fix-up-shebang.patch \
            file://0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch \
+           file://determinism.patch  \
            "
 SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.20.1


