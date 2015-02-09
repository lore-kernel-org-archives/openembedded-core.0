Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 31E2165C97
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 12:43:57 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YKnh0-0004oN-I0 from Nathan_Lynch@mentor.com ;
	Mon, 09 Feb 2015 04:43:58 -0800
Received: from [127.0.0.1] (147.34.91.1) by SVR-ORW-FEM-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 Feb 2015 04:43:58 -0800
Message-ID: <54D8AB8D.8000500@mentor.com>
Date: Mon, 9 Feb 2015 06:43:57 -0600
From: Nathan Lynch <Nathan_Lynch@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1423263383-15461-1-git-send-email-nathan_lynch@mentor.com>
	<CAP9ODKqwuOnwWH3Otue31U8z1S_ypiFdwhHnY3t=3yG_Z5MLnQ@mail.gmail.com>
In-Reply-To: <CAP9ODKqwuOnwWH3Otue31U8z1S_ypiFdwhHnY3t=3yG_Z5MLnQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng-tools: use perl-misc, perl-modules in ptest deps
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
X-List-Received-Date: Mon, 09 Feb 2015 12:44:01 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 02/07/2015 03:48 PM, Otavio Salvador wrote:
> On Fri, Feb 6, 2015 at 8:56 PM, Nathan Lynch <nathan_lynch@mentor.com> wrote:
>> The testcases for lttng-tools use the "prove" command from perl-misc,
>> which needs many modules not in the base perl package.
>>
>> Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
> 
> Wouldn't be better to specify the modules needed for the prove
> command? This avoids unneeded packages to be installed.

I had thought so too (sort of -- why doesn't perl-misc depend on the
necessary module packages?), but I encountered runtime errors such
as this (using perl-module-app-prove instead of perl-modules):

 ./run.sh unit_tests
Base class package "TAP::Base" is empty.
    (Perhaps you need to 'use' the module which defines that package first,
    or make that module available in @INC (@INC contains: /etc/perl /usr/lib/perl/sit
e_perl/5.20.0/ /usr/lib/perl/site_perl/5.20.0 /usr/lib/perl/vendor_perl/5.20.0/ /usr/
lib/perl/vendor_perl/5.20.0 /usr/lib/perl/5.20.0/ /usr/lib/perl/5.20.0 /usr/local/lib
/site_perl /usr/lib/perl/5.20.0 .).                                                 
 at /usr/lib/perl/5.20.0/TAP/Harness.pm line 11.
BEGIN failed--compilation aborted at /usr/lib/perl/5.20.0/TAP/Harness.pm line 11.
Compilation failed in require at /usr/lib/perl/5.20.0/App/Prove.pm line 6.
BEGIN failed--compilation aborted at /usr/lib/perl/5.20.0/App/Prove.pm line 6.
Compilation failed in require at /usr/bin/prove line 8.
BEGIN failed--compilation aborted at /usr/bin/prove line 8.
Makefile:664: recipe for target 'installcheck-am' failed


The patch below is how far I got into manually fixing perl dependencies
before settling on the current patch.  This allows the lttng-tools tests
to run, although I see warnings:

./run.sh unit_tests
Warning: failed to load Config_git.pl, something strange about this perl...

This message is emitted from one of:

/usr/lib/perl/5.20.0/Config_heavy-target.pl
/usr/lib/perl/5.20.0/Config_heavy.pl

These are in perl-lib; Config_git.pl is supplied by
perl-module-config-git.

In any case, I think I need to amend this patch since it looks like the
testcases expect the sleep command from coreutils as well as babeltrace.


diff --git b/meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc a/meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc
index 041471a046bb..6264f11937f8 100644
--- b/meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc
+++ a/meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc
@@ -13,6 +13,10 @@
 #| egrep -wv '=>|module-a|module-apache.?|module-apr|module-authen-sasl|module-b-asmdata|module-build-.*|module-convert-ebcdic|module-devel-size|module-digest-perl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extutils-xssymset|module-file-bsdglob|module-for|module-it|module-io-string|module-ipc-system-simple|module-lexical|module-local-lib|metadata|module-modperl-util|module-pluggable-object|module-test-builder-io-scalar|module-text-unidecode|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' > /tmp/
 
 RDEPENDS_perl-misc += "perl"
+# rdepends for /usr/bin/prove
+RDEPENDS_perl-misc += "perl-module-app-prove"
+RDEPENDS_perl-misc += "perl-module-tap-formatter-file"
+
 RDEPENDS_${PN}-pod += "perl"
 
 # Some additional dependencies that the above doesn't manage to figure out
@@ -49,6 +53,9 @@ RDEPENDS_${PN}-module-app-prove += "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-app-prove += "${PN}-module-getopt-long"
 RDEPENDS_${PN}-module-app-prove += "${PN}-module-strict"
 RDEPENDS_${PN}-module-app-prove += "${PN}-module-tap-harness"
+RDEPENDS_${PN}-module-app-prove += "${PN}-module-tap-parser"
+RDEPENDS_${PN}-module-app-prove += "${PN}-module-tap-parser-aggregator"
+RDEPENDS_${PN}-module-app-prove += "${PN}-module-tap-parser-scheduler"
 RDEPENDS_${PN}-module-app-prove += "${PN}-module-text-parsewords"
 RDEPENDS_${PN}-module-app-prove += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-app-prove-state += "${PN}-module-app-prove-state-result"
@@ -56,6 +63,7 @@ RDEPENDS_${PN}-module-app-prove-state += "${PN}-module-base"
 RDEPENDS_${PN}-module-app-prove-state += "${PN}-module-carp"
 RDEPENDS_${PN}-module-app-prove-state += "${PN}-module-constant"
 RDEPENDS_${PN}-module-app-prove-state += "${PN}-module-file-find"
+RDEPENDS_${PN}-module-app-prove-state += "${PN}-module-file-glob"
 RDEPENDS_${PN}-module-app-prove-state += "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-app-prove-state += "${PN}-module-strict"
 RDEPENDS_${PN}-module-app-prove-state += "${PN}-module-tap-parser-yamlish-reader"
@@ -1839,6 +1847,7 @@ RDEPENDS_${PN}-module-ops += "${PN}-module-opcode"
 RDEPENDS_${PN}-module-overloading += "${PN}-module-overload-numbers"
 RDEPENDS_${PN}-module-overloading += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-overload += "${PN}-module-mro"
+RDEPENDS_${PN}-module-overload += "${PN}-module-overloading"
 RDEPENDS_${PN}-module-overload += "${PN}-module-scalar-util"
 RDEPENDS_${PN}-module-overload += "${PN}-module-warnings-register"
 RDEPENDS_${PN}-module-package-constants += "${PN}-module-if"
@@ -2177,6 +2186,7 @@ RDEPENDS_${PN}-module-sys-syslog += "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-tap-base += "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-base += "${PN}-module-constant"
 RDEPENDS_${PN}-module-tap-base += "${PN}-module-strict"
+RDEPENDS_${PN}-module-tap-base += "${PN}-module-tap-object"
 RDEPENDS_${PN}-module-tap-base += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-tap-formatter-base += "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-formatter-base += "${PN}-module-posix"
@@ -2204,10 +2214,12 @@ RDEPENDS_${PN}-module-tap-formatter-console-session += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-tap-formatter-file += "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-formatter-file += "${PN}-module-posix"
 RDEPENDS_${PN}-module-tap-formatter-file += "${PN}-module-strict"
+RDEPENDS_${PN}-module-tap-formatter-file += "${PN}-module-tap-formatter-base"
 RDEPENDS_${PN}-module-tap-formatter-file += "${PN}-module-tap-formatter-file-session"
 RDEPENDS_${PN}-module-tap-formatter-file += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-tap-formatter-file-session += "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-formatter-file-session += "${PN}-module-strict"
+RDEPENDS_${PN}-module-tap-formatter-file-session += "${PN}-module-tap-formatter-session"
 RDEPENDS_${PN}-module-tap-formatter-file-session += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-tap-formatter-session += "${PN}-module-base"
 RDEPENDS_${PN}-module-tap-formatter-session += "${PN}-module-strict"
@@ -2223,6 +2235,7 @@ RDEPENDS_${PN}-module-tap-harness += "${PN}-module-file-path"
 RDEPENDS_${PN}-module-tap-harness += "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-tap-harness += "${PN}-module-io-handle"
 RDEPENDS_${PN}-module-tap-harness += "${PN}-module-strict"
+RDEPENDS_${PN}-module-tap-harness += "${PN}-module-tap-base"
 RDEPENDS_${PN}-module-tap-harness += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-tap-object += "${PN}-module-carp"
 RDEPENDS_${PN}-module-tap-object += "${PN}-module-strict"


