Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id BED6D7F89C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 13:01:30 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j42so49462294wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2020 05:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=4HG8KN+fesjGrJArTTXYc4UBmPKue5TCPQCjktQvnj0=;
	b=p6hNIULUbWrva7g04whut3XgVkuwbyCC14HYQF7mtKb6nQXUCREh3LnTDntQoaJfij
	f/QIerlnVNSi3KVBhgZJTMexvrDQOX4+qx4Z1oSVfQa3mSTHXFf1qewPvtmFPH0L51v/
	v6r1KtZCWA2T6Sc+9Mew5pKxVANskFc1Ftml+iXaWtBiAwOVnCwYYTXtBc0sHslcWpMI
	UlRod8UDms9psrFw0M+wcPGxhh2kMvFqYSFcP3Xeb2QUVdVLK6cs2M2BYKg+x7XIqRO7
	aWmylKyZ6YLnnOsTW0f4vKAt44Yexm+9dx9Xsm/FsFrBGuF5CQZVDsBWEuew2je1nzrK
	mbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=4HG8KN+fesjGrJArTTXYc4UBmPKue5TCPQCjktQvnj0=;
	b=sIgSi6uyD8V81jjZBdgacp0J69Xx4RA+L+Ux8VeF3lZnAHNXO0ySaT6khn1Qqyopks
	b2+IgOkLoTTpnVWR7/IX20o6EyHvI8R6ExX5RhUdbRvC/GSDHmg8PQxYQodauYSuDejW
	3F8GFLaorHE1+4HdWfcwFsWTcKnY/ROGOt8tfWEP2BSpd4f/+UsUY+cfLMIVWB5R5sUH
	odsqqN0Ltnyy2Uf4DQ+npssDACm5gu+FaMQKuJkzOvqgfzdhLb7Y1owFpLKqwR4WuPMS
	UQKjG3RHC+pC7WLQqddrWm6XgUkcoY1fJkltbZ/lB2b7aFFOorc8jETbcASyycV17bip
	fMTA==
X-Gm-Message-State: APjAAAWYM2Zfuz0qBv/iktwnN7JDLKO+EtkxX7PpPLajHzmNqseajgqM
	6+WwI4rB0hNK06ftXUJh0Hll9TNF980=
X-Google-Smtp-Source: APXvYqw65WWyZc9C31nYBhdhBkdglzwx+ShoAZvwVFzeBwsv5SkgQvkqNq5U8mmidLjUaH0uc2yFRw==
X-Received: by 2002:a5d:50cf:: with SMTP id
	f15mr103578520wrt.381.1578315691136; 
	Mon, 06 Jan 2020 05:01:31 -0800 (PST)
Received: from beaker.muppets.liwing.de (p5B25B970.dip0.t-ipconnect.de.
	[91.37.185.112]) by smtp.gmail.com with ESMTPSA id
	w13sm72710836wru.38.2020.01.06.05.01.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 05:01:26 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 14:01:14 +0100
Message-Id: <20200106130114.11970-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-oe][PATCH v2] perl-sanity: support cpan versions of core modules
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
X-List-Received-Date: Mon, 06 Jan 2020 13:01:31 -0000

Most of perl core modules are dual-life modules which exists on CPAN
as well as they do in perl core. Sometime, fixes are uploaded to CPAN
before a new perl is released which contains the fix of the core
module. Also, some modules recent releases aren't fully backported
to earlier releases (out of support, lack of specific feature, ...),
which makes it up to the distribution build to choose between core
or CPAN version, respectively.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-devtools/perl/perl_5.30.1.bb | 47 +++++++++++++++++++----
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index 6e0b2007fb..8d9708639f 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -172,13 +172,13 @@ perl_package_preprocess () {
                -e "s,${STAGING_BINDIR_NATIVE}/,,g" \
                -e "s,${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX},${bindir},g" \
                -e 's:${RECIPE_SYSROOT}::g' \
-            ${PKGD}${bindir}/h2xs \
-            ${PKGD}${bindir}/h2ph \
-            ${PKGD}${bindir}/pod2man \
-            ${PKGD}${bindir}/pod2text \
-            ${PKGD}${bindir}/pod2usage \
-            ${PKGD}${bindir}/podchecker \
-            ${PKGD}${bindir}/podselect \
+            ${PKGD}${bindir}/h2xs.perl \
+            ${PKGD}${bindir}/h2ph.perl \
+            ${PKGD}${bindir}/pod2man.perl \
+            ${PKGD}${bindir}/pod2text.perl \
+            ${PKGD}${bindir}/pod2usage.perl \
+            ${PKGD}${bindir}/podchecker.perl \
+            ${PKGD}${bindir}/podselect.perl \
             ${PKGD}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/config.h \
             ${PKGD}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/perl.h \
             ${PKGD}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/pp.h \
@@ -193,6 +193,39 @@ perl_package_preprocess () {
             ${PKGD}${libdir}/perl5/config.sh
 }
 
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN}-misc = "corelist cpan enc2xs encguess h2ph h2xs instmodsh json_pp libnetcfg \
+                     piconv pl2pm pod2html pod2man pod2text pod2usage podchecker podselect \
+                     prove ptar ptardiff ptargrep shasum splain xsubpp zipdetails"
+ALTERNATIVE_LINK_NAME[corelist] = "${bindir}/corelist"
+ALTERNATIVE_LINK_NAME[cpan] = "${bindir}/cpan"
+ALTERNATIVE_LINK_NAME[enc2xs] = "${bindir}/enc2xs"
+ALTERNATIVE_LINK_NAME[encguess] = "${bindir}/encguess"
+ALTERNATIVE_LINK_NAME[h2ph] = "${bindir}/h2ph"
+ALTERNATIVE_LINK_NAME[h2xs] = "${bindir}/h2xs"
+ALTERNATIVE_LINK_NAME[instmodsh] = "${bindir}/instmodsh"
+ALTERNATIVE_LINK_NAME[json_pp] = "${bindir}/json_pp"
+ALTERNATIVE_LINK_NAME[libnetcfg] = "${bindir}/libnetcfg"
+ALTERNATIVE_LINK_NAME[piconv] = "${bindir}/piconv"
+ALTERNATIVE_LINK_NAME[pl2pm] = "${bindir}/pl2pm"
+ALTERNATIVE_LINK_NAME[pod2html] = "${bindir}/pod2html"
+ALTERNATIVE_LINK_NAME[pod2man] = "${bindir}/pod2man"
+ALTERNATIVE_LINK_NAME[pod2text] = "${bindir}/pod2text"
+ALTERNATIVE_LINK_NAME[pod2usage] = "${bindir}/pod2usage"
+ALTERNATIVE_LINK_NAME[podchecker] = "${bindir}/podchecker"
+ALTERNATIVE_LINK_NAME[podselect] = "${bindir}/podselect"
+ALTERNATIVE_LINK_NAME[prove] = "${bindir}/prove"
+ALTERNATIVE_LINK_NAME[ptar] = "${bindir}/ptar"
+ALTERNATIVE_LINK_NAME[ptardiff] = "${bindir}/ptardiff"
+ALTERNATIVE_LINK_NAME[ptargrep] = "${bindir}/ptargrep"
+ALTERNATIVE_LINK_NAME[shasum] = "${bindir}/shasum"
+ALTERNATIVE_LINK_NAME[splain] = "${bindir}/splain"
+ALTERNATIVE_LINK_NAME[xsubpp] = "${bindir}/xsubpp"
+ALTERNATIVE_LINK_NAME[zipdetails] = "${bindir}/zipdetails"
+
 require perl-ptest.inc
 
 FILES_${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/libperl.so* \
-- 
2.17.1


