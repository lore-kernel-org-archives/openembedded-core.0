Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.18081.1591961444819943682
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 04:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=BEMbEXSz;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 7680760222;
	Fri, 12 Jun 2020 13:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1591961441;
	bh=0Ox53NwyG9pg1L/LsGMk/GP+bi53mXcl8esystwGYOU=;
	h=From:To:Cc:Subject:Date:From;
	b=BEMbEXSzTU+HrGeDNR/RY1CIzNakFYd5OfufDNz05rJ4jLe5Oox/E5cBUqE+1ETks
	 wr0kghPfyIBb0yBE53ei7/gFx+bDEA5q+oUZ7ZQKwkI/7IpsTJDut/jTWQf4pwWcVf
	 QtltqGg3dMuV0eJYowapljx6suI+6ZxTdkCclPKI4h50XoaEvrWci2KkMRiT3/uPvK
	 9bS8pPkNgRM7cItWzzJ55hi+7Q5bibDLIECGOpedkhCjAcuaR3J7Z7mymqluGxh2/X
	 xSw99b2NgY6m/myg15iDqMvlWebTZuLOE+8VNdH6ISh9ZNUwNED65lBGilSDHlclhy
	 zYHlroBkCd3mg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] diffoscope: upgrade 146 -> 147
Date: Fri, 12 Jun 2020 13:30:35 +0200
Message-Id: <1591961435-14197-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This includes the following changes:

* New features:

  - Add output from strings(1) to ELF binaries. It is intended this will
    expose expose build paths that are hidden somewhere within the objdump(1)
    output. (Closes: reproducible-builds/diffoscope#148)
  - Add basic zsh shell tab-completion support.
    (Closes: reproducible-builds/diffoscope#158)

* Bug fixes:

  - Prevent a traceback when comparing a PDF document that does not contain
    any metadata, ie. it is missing a PDF "/Info" stanza.
    (Closes: reproducible-builds/diffoscope#150)
  - Fix compatibility with jsondiff 1.2.0 which was causing a traceback and
    log the version of jsondiff we are using to aid debugging in the future.
    (Closes: reproducible-builds/diffoscope#159
  - Fix an issue in GnuPG keybox handling that left filenames in the diff.
  - Don't mask an existing test name; ie. ensure it is actually run.

* Reporting:

  - Log all calls to subprocess.check_output by using our own wrapper utility.
    (Closes: reproducible-builds/diffoscope#151)

* Code improvements:

  - Replace references to "WF" with "Wagner-Fischer" for clarity.
  - Drop a large number of unused imports (list_libarchive,
    ContainerExtractionError, etc.)
  - Don't assign exception to a variable that we do not use.
  - Compare string values with the equality operator, not via "is" identity.
  - Don't alias an open file to a variable when we don't use it.
  - Don't alias "filter" builtin.
  - Refactor many small parts of the HTML generation, dropping explicit
    u"unicode" strings, tidying the generation of the "Offset X, Y lines
    modified" messages, moving to PEP 498 f-strings where appropriate, etc.
  - Inline a number of single-used utility methods.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-support/diffoscope/{diffoscope_146.bb => diffoscope_147.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_146.bb => diffoscope_147.bb} (83%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_146.bb b/meta/recipes-support/diffoscope/diffoscope_147.bb
similarity index 83%
rename from meta/recipes-support/diffoscope/diffoscope_146.bb
rename to meta/recipes-support/diffoscope/diffoscope_147.bb
index a3402d4..3db38fa 100644
--- a/meta/recipes-support/diffoscope/diffoscope_146.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_147.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a031605c043577c908052763e49b0bd9c1d4d8a169eaf41364900ff1d9566ee2"
+SRC_URI[sha256sum] = "5b5fdaa4d900c891b319e4b9a006eb16824a0b61fdbe15e75acbbe35602e2da6"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.7.4

