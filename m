Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 96F2F78CB0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 13:20:46 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id a108-v6so13598907wrc.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 06:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=8Ij2ZxoaNJ4bNQmF3I6QNib0OzImeebCyIqignz6v7Q=;
	b=YuyZ6cKRprUSGtePGLfSJ5/9TrK/kYtEMn5qDhUaqVWU7QHsgz4FFgNl5d+EA1dle0
	1QToZyqgZDtnerGCrtkCTIu7rMXLt9dDdURx6BUWJY03QPi0sOtrBlWj1vtuUrSuz1FW
	yM4saUuJgEkup7bjvAbFONks7mVGBuck0XbjHyQd/SVnv3PpqSvpWE+dxxT2E+FuJlOm
	sH5Obui57NVHKSgaMFY/63W2OKGUnuRM7HPfPJPxtEH0KretHlIGpdYN0qFOw6FesO2r
	iPtA42G+6co/QW7nQ3HGrFeHF6X+2q9q9OAeCxqEmMnCPWmIPSYCbTcPj4+mZATm7eBq
	8vZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=8Ij2ZxoaNJ4bNQmF3I6QNib0OzImeebCyIqignz6v7Q=;
	b=iTCFPkvT/Ns7ByGYmbQnc7FpbvKp1cZE7o34AeiuVYJ26iEIKoQFxGzvfcsj+jpx24
	K2tz21Xh1xE5ZS6XKMOPPhPYQR6sO8YhrwETzkWmqBCbj49X8JkgV1CVCKBGCP5o88DT
	Euf9KIVZiUh0/Jynysyb/OOuj7wExKXAeC6e7c0zlgpgDGAKvZ+Z4kp6qax9vFPg2cc8
	w0DUl9Y7fY+i5kzAvbmV5saE/i6EGl4tkwLbuMPgO8S4CJMVM3+A2AXcUAtPH19tOIcO
	laTuUv6VbahTLjTjOO3IwCqp067d/2I+8tS1Fq6g3INGGW+EdkUYxBZJOFNEiuH0itNS
	kBSA==
X-Gm-Message-State: APzg51BgxMVc7d/ldP7RGwUM1CQKAXwrJdiFTTy+m+JLUZaLZeIEMEaJ
	9q+D42Hj9CdTS9ubUHKdUUJhyfZ/
X-Google-Smtp-Source: ANB0VdZ4s4YJ8vKfyUOz/lhiQ/U7zotwB61iXqPmCZqxx98c+X2v3KAu7j7D7vtc2FAlsmPlgPLzbA==
X-Received: by 2002:adf:ec85:: with SMTP id
	z5-v6mr9325560wrn.142.1535376047220; 
	Mon, 27 Aug 2018 06:20:47 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	b124-v6sm8397263wmh.17.2018.08.27.06.20.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 06:20:46 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Aug 2018 15:20:15 +0200
Message-Id: <20180827132015.23066-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH] cpan.bbclass: make RPATH fix more general
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
X-List-Received-Date: Mon, 27 Aug 2018 13:20:46 -0000

Extract a general version of RPATH fix for libxml-parser-perl_2.44.bb
from
  292471701 libxml-parser-perl: fix "...contains bad RPATH"
into cpan.bbclass to catch most errors reported by Khem Raj via
  http://errors.yoctoproject.org/Errors/Build/66538/

Genrally, Perl 5 toolchain deals with cross-compile sysroots
as if a dependency is installed at an exostic place on a server.
This issue needs to be addressed wider into the community.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/cpan.bbclass                             | 10 ++++++++++
 meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb |  7 -------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
index 926c6358a6..a5bc301898 100644
--- a/meta/classes/cpan.bbclass
+++ b/meta/classes/cpan.bbclass
@@ -40,6 +40,16 @@ cpan_do_configure () {
 	fi
 }
 
+do_configure_append_class-target() {
+       find . -name Makefile | xargs sed -E -i \
+           -e 's:LD_RUN_PATH ?= ?"?[^"]*"?::g'
+}
+
+do_configure_append_class-nativesdk() {
+       find . -name Makefile | xargs sed -E -i \
+           -e 's:LD_RUN_PATH ?= ?"?[^"]*"?::g'
+}
+
 cpan_do_compile () {
 	oe_runmake PASTHRU_INC="${CFLAGS}" LD="${CCLD}"
 }
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
index 194ed6ac48..95af4d1de6 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
@@ -21,13 +21,6 @@ inherit cpan ptest-perl
 do_configure_append_class-target() {
 	sed -E \
 	    -e 's:-L${STAGING_LIBDIR}::g' -e 's:-I${STAGING_INCDIR}::g' \
-	    -e 's:LD_RUN_PATH ?= ?"?[^"]*"?::g' \
-	    -i Makefile Expat/Makefile
-}
-
-do_configure_append_class-nativesdk() {
-	sed -E \
-	    -e 's:LD_RUN_PATH ?= ?"?[^"]*"?::g' \
 	    -i Makefile Expat/Makefile
 }
 
-- 
2.17.1


