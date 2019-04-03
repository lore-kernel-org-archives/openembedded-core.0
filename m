Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3E0387D20A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 13:26:41 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p10so21382763wrq.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=gcpZIYYpQ9G+BXawmLeHMKlrERCiwIBOq5UHKAealgE=;
	b=mPRIpkJfT4QoaLa4PNvsiknxRi89OWmaRSW8KQBq9U5NHdheG5BXID2yFxNjxCkViM
	pJHp/SffXzCTx1XTi77laXdzji0T6WvBoJ6uy7sf8VIaPTXKSJf6pvsQTYVct0QNXaY2
	e1XIT2ZDftShHlYMcl6wtDIX4JohbTqt+bROU64UdRTHKamyXGRZoueXFsZ4WyYwuE5d
	S4p/e4jtS3HjBaJU08aaHCAob42mCLOzOX0ySRqa3VGbfC3X8LJryWuQUy4as4lUQ3Y5
	c1hNTq5yysx5LPjie76j+lvTcbLY60kVdyjvnLFXZzJqi7Z5B/vMKAqnZj1UDNXJnJ3F
	OvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=gcpZIYYpQ9G+BXawmLeHMKlrERCiwIBOq5UHKAealgE=;
	b=boEgYbCY/3wFsd3gICjMjculKWjDbaKukua8HfMvDFnKbKG+ANXaHDwrrsvpgMEk6d
	YGVPjrXg5CTuCKIBEEbXf6mO0r/yMuJaLSIbKGza2hEfV/DSaWkFX8ThfISHsJlY2F4/
	Ezgz+eAfZyfCQ6lkDNIezl+qA0r39cX+haopSW5s+7Id9UWdxJjBpzNjTSngE+UaIIfZ
	z+Z075kO8b2JWbSb4WrKQbZ+qvO3Ag/IK83eEGLW3PlW0PnxZY4F/h6XLBc4PZL82wpE
	nX0etLd+ZGGuFkFdxR2a5Lsh30sOTQ7jw0GphvaBc+FT7SjptXgwmgM+gyqvh5cQ9FI/
	mA9A==
X-Gm-Message-State: APjAAAXpT3TzGlhOGUUHpNJomMBpwfYp/wgH1wQS4hzonArEh23zrhwb
	jowCjPkpbMX/7fQYpzyHelU3fuZNZ/M=
X-Google-Smtp-Source: APXvYqzVr/ChhJlFivDU6u+QB3q91uaXQsSejxvfxcWOk2Pqi0+xTKurUZy/o+2oKSeRgUCHgWh/hw==
X-Received: by 2002:a5d:448b:: with SMTP id j11mr51001897wrq.218.1554298001568;
	Wed, 03 Apr 2019 06:26:41 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	g8sm28142535wro.77.2019.04.03.06.26.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 06:26:40 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2019 15:26:19 +0200
Message-Id: <20190403132619.17948-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH] perl-sanity: support cpan versions of core modules
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
X-List-Received-Date: Wed, 03 Apr 2019 13:26:41 -0000

Most of perl core modules are dual-life modules which exists on CPAN
as well as they do in perl core. Sometime, fixes are uploaded to CPAN
before a new perl is released which contains the fix of the core
module. Also, some modules recent releases aren't fully backported
to earlier releases (out of support, lack of specific feature, ...),
which makes it up to the distribution build to choose between core
or CPAN version, respectively.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../perl-sanity/perl_5.28.1.bb                | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
index 5aa7cd3ee1..e609c056d0 100644
--- a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
+++ b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
@@ -172,6 +172,39 @@ perl_package_preprocess () {
             ${PKGD}${libdir}/perl5/config.sh
 }
 
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN} = "corelist cpan enc2xs encguess h2ph h2xs instmodsh json_pp libnetcfg \
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


