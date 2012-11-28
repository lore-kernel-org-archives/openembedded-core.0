Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TdjoY-0004ds-86
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 16:44:43 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so7328436pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 07:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=GoTR3rkO7p7dohmZHAIqV900PB3TeF2NNMHpDXNWgDg=;
	b=zEpTfgjIFd3RQ8MTM6yX+FJzVbzEbPtOOWmYE9P7B+r8ZMTchTnx0utJNMUVOhzXvC
	rBtcbrmcT1r6BOUymnXBEaN5h56iaDZQMkHZ0Vu7vZvyrA7RTPX3wxGlvSs2DvbzgRfk
	qMxLpaDrWg6UwXhyGUYhAgLnuHP/9ZCnQ4h2Ra1r9J1CVtQUkv8Il9DoN3EOvjhCWKAR
	RE/Mt6IYvnqBWa/SCDPsz9W2D7iEAi6nPrN2zMS5Vr0IQ/9lc5k6zxKwQIlHrxikytmz
	fb2TBFNHNiBstknbkA08vNKWkBWHfqzyxkLC2yBkylc0HuZ4UsP+3ek7bJD4n4iFGEju
	4A0A==
Received: by 10.68.235.71 with SMTP id uk7mr59611618pbc.10.1354116627096;
	Wed, 28 Nov 2012 07:30:27 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id gl9sm12599259pbc.51.2012.11.28.07.30.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 07:30:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2012 07:29:38 -0800
Message-Id: <8ec33689eaab4c3fa5099a8c461bd2b648e29481.1354116375.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8a0cdf9a8789439bc86ca4a8b3cbb77408659ac6.1354116375.git.raj.khem@gmail.com>
References: <8a0cdf9a8789439bc86ca4a8b3cbb77408659ac6.1354116375.git.raj.khem@gmail.com>
In-Reply-To: <cover.1354116375.git.raj.khem@gmail.com>
References: <cover.1354116375.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] oprofile: Define PACKAGE and PACKAGE_VERSION
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
X-List-Received-Date: Wed, 28 Nov 2012 15:44:45 -0000

oprofile uses bfd.h from binutils which expects
that the package which is using it is also compiled
using autotools and therefore tries to include
config.h to get above defines. We specify them
on commandline instead.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index ac8ce10..3c1c3cd 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -19,7 +19,7 @@ FILES_${PN} = "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${BPN}"
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/lib*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "file://opstart.patch \
            file://oprofile-no-query-modules.patch \
@@ -29,7 +29,7 @@ SRC_URI = "file://opstart.patch \
 inherit autotools
 
 EXTRA_OECONF = "--with-kernel-support --without-x"
-
+CFLAGS += '-DPACKAGE="${BPN}" -DPACKAGE_VERSION=${PV}'
 do_configure () {
 	cp ${WORKDIR}/acinclude.m4 ${S}/
 	autotools_do_configure
-- 
1.7.9.5



