Received: from mail-we0-f172.google.com ([74.125.82.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TsC80-0002Y4-I6
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 13:48:45 +0100
Received: by mail-we0-f172.google.com with SMTP id r3so9817617wey.31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 04:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=AaWzoLKkGtYggKnFpLyTKbgBYXATbNg3+27jldnjjpU=;
	b=rfE0tZLhRFfZQ3pCFdpmfCwanTwhmMj4GKQQmjdRCNiQk3okNcwVjATfvWLtcpHT1P
	IRpU8N5Af6hhNe6s9wvUYhghnRxy5Ol2xXxTFuFJWOLruTASFvjmXYKZnNh+Qbsbub9O
	YqXLE2a+0GvUoFb6ldO3r2TytrE30MR6wvbpsP1XEBYcV7U+mZF0lR021mFp35bn2b1F
	m1m4gd5h6JXwBSmF51ucdfMXitMqMqL2z8IIFTACdGZElTbD/yUQuYc+PAUfGiaELeKO
	fXTR12BNXTCBMhvhLrsBRnAWFWvtzPbBFjXyRPoA9qw1rpS2qbkm3gBhLpVuBlHjR/6o
	0I1A==
X-Received: by 10.180.95.169 with SMTP id dl9mr8868709wib.20.1357562003591;
	Mon, 07 Jan 2013 04:33:23 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id gz3sm11952425wib.2.2013.01.07.04.33.22
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Jan 2013 04:33:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 13:33:17 +0100
Message-Id: <1357561997-7175-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1
Subject: [PATCH] perl-rdepends: be more strict in multiline comment
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 12:48:46 -0000

* fails to parse when http://patchwork.openembedded.org/patch/40997/ is used
Parsing recipes...ERROR: There is a confusing multiline, partially commented expression on line 10 of file
/OE/shr-core/openembedded-core/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc (| sed "s/\/.*\.pm: */ += /g;s/[\"\']//g;s/;.*/\"/g;s/+=
.*\(require\|use\)\> */+= \"perl-module-/g;s/CPANPLUS::.*/cpanplus/g;s/CPAN::.*/cpan/g;s/::/-/g;s/
[^+\"].*//g;s/_/-/g;s/\.pl\"$/\"/;s/\"\?\$/\"/;s/(//;" | tr [:upper:] [:lower:] \).
Please clarify whether this is all a comment or should be parsed.
ERROR: Unable to parse /OE/shr-core/openembedded-core/meta/recipes-devtools/perl/perl_5.14.2.bb: Exited with "1"
ERROR: Command execution failed: Exited with 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc b/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc
index 7672e48..87d7a32 100644
--- a/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc
+++ b/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc
@@ -6,12 +6,12 @@
 
 #1 cp -r packages-split packages-split.new && cd packages-split.new
 #2 find . -name \*.pm | xargs sed -i '/^=head/,/^=cut/d'
-#3 egrep -r "^\s*(\<use .*|\<require .*);?" perl-module-* --include="*.pm" \
-| sed "s/\/.*\.pm: */ += /g;s/[\"\']//g;s/;.*/\"/g;s/+= .*\(require\|use\)\> */+= \"perl-module-/g;s/CPANPLUS::.*/cpanplus/g;s/CPAN::.*/cpan/g;s/::/-/g;s/ [^+\"].*//g;s/_/-/g;s/\.pl\"$/\"/;s/\"\?\$/\"/;s/(//;" | tr [:upper:] [:lower:] \
-| grep -v -e "\-vms\-" -e module-5 -e "^$" -e "\\$" -e your -e tk -e autoperl -e html -e http -e parse-cpan -e perl-ostype -e ndbm-file -e module-mac -e fcgi -e lwp -e dbd -e dbix \
-| sort -u \
-| sed 's/^/RDEPENDS_/;s/perl-module-/${PN}-module-/g;s/module-\(module-\)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;' \
-| egrep -wv '=>|module-a|module-apache.?|module-apr|module-authen-sasl|module-b-asmdata|module-build-.*|module-convert-ebcdic|module-devel-size|module-digest-perl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extutils-xssymset|module-file-bsdglob|module-for|module-it|module-io-string|module-ipc-system-simple|module-lexical|module-local-lib|metadata|module-modperl-util|module-pluggable-object|module-test-builder-io-scalar|module-text-unidecode|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' > /tmp/1
+#3 egrep -r "^\s*(\<use .*|\<require .*);?" perl-module-* --include="*.pm" 
+#| sed "s/\/.*\.pm: */ += /g;s/[\"\']//g;s/;.*/\"/g;s/+= .*\(require\|use\)\> */+= \"perl-module-/g;s/CPANPLUS::.*/cpanplus/g;s/CPAN::.*/cpan/g;s/::/-/g;s/ [^+\"].*//g;s/_/-/g;s/\.pl\"$/\"/;s/\"\?\$/\"/;s/(//;" | tr [:upper:] [:lower:] 
+#| grep -v -e "\-vms\-" -e module-5 -e "^$" -e "\\$" -e your -e tk -e autoperl -e html -e http -e parse-cpan -e perl-ostype -e ndbm-file -e module-mac -e fcgi -e lwp -e dbd -e dbix 
+#| sort -u 
+#| sed 's/^/RDEPENDS_/;s/perl-module-/${PN}-module-/g;s/module-\(module-\)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;' 
+#| egrep -wv '=>|module-a|module-apache.?|module-apr|module-authen-sasl|module-b-asmdata|module-build-.*|module-convert-ebcdic|module-devel-size|module-digest-perl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extutils-xssymset|module-file-bsdglob|module-for|module-it|module-io-string|module-ipc-system-simple|module-lexical|module-local-lib|metadata|module-modperl-util|module-pluggable-object|module-test-builder-io-scalar|module-text-unidecode|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' > /tmp/
 
 
 # Some additional dependencies that the above doesn't manage to figure out
-- 
1.8.1



