Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.8764.1593777615451848085
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 05:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=BANlZcx7;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1339-171.w193-250.abo.wanadoo.fr [193.250.150.171])
	by koncepto.io (Postfix) with ESMTPSA id C9E116014E;
	Fri,  3 Jul 2020 14:00:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1593777610;
	bh=vDCbFPOkhtJCbofUCRYXXHWCpjHNv+L72bKtG6sS2vo=;
	h=From:To:Cc:Subject:Date:From;
	b=BANlZcx7QR9yS8auTiqGkrJCnuZkoXXTwE/52RwocMyosTYj15EFhm3TQd+WOZGlh
	 jaXZS9CKI0a8SYvsb2RXLbqye/cfsx9S4SxC19125Rd/6b5dwLv6twANeyO5z7tURF
	 7WmIrfucBCTlk6mxy53swwE5vf9ucD7q4n32XlT+OT4diMHpHnqPhSUTsakq9l6Zdz
	 c5OsEdkQq4UV88uJPCyHsaJrhxVpEtpBp+4bohAlm6/fbIYmZg3EOmXmeKC8TvLtgh
	 XDNiy6LmrzMHT5nkV6Dybwdxa+/DV/n5DkxE1FRwDs7KD/GpE2H32b0cZraO/M8Oq+
	 luHEmVXcm81bw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] diffoscope: upgrade 148 -> 150
Date: Fri,  3 Jul 2020 14:00:07 +0200
Message-Id: <1593777607-9647-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This includes the following changes:

Version 149:

* Update tests for file 5.39. (Closes: reproducible-builds/diffoscope#179)
* Downgrade the tlsh warning message to an "info" level warning.
  (Closes: #888237, reproducible-builds/diffoscope#29)
* Use the CSS "word-break" property over manually adding U+200B zero-width
  spaces that make copy-pasting cumbersome.
  (Closes: reproducible-builds/diffoscope!53)
* Codebase improvements:
  - Drop some unused imports from the previous commit.
  - Prevent an unnecessary .format() when rendering difference comments.
  - Use a semantic "AbstractMissingType" type instead of remembering to check
    for both "missing" files and missing containers.
* Allow user to mask/filter reader output via --diff-mask=REGEX.
  (MR: reproducible-builds/diffoscope!51)
* Make --html-dir child pages open in new window to accommodate new web
  browser content security policies.
* Fix the --new-file option when comparing directories by merging
  DirectoryContainer.compare and Container.compare.
  (Closes: reproducible-builds/diffoscope#180)
* Fix zsh completion for --max-page-diff-block-lines.
* Do not warn about missing tlsh during tests.

Version 150:

* Don't crash when listing entries in archives if they don't have a listed
  size (such as hardlinks in .ISO files).
  (Closes: reproducible-builds/diffoscope#188)
* Dump PE32+ executables (including EFI applications) using objdump.
  (Closes: reproducible-builds/diffoscope#181)
* Tidy detection of JSON files due to missing call to File.recognizes that
  checks against the output of file(1) which was also causing us to attempt
  to parse almost every file using json.loads. (Whoops.)
* Drop accidentally-duplicated copy of the new --diff-mask tests.
* Logging improvements:
  - Split out formatting of class names into a common method.
  - Clarify that we are generating presenter formats in the opening logs.
* Remove objdjump(1) offsets before instructions to reduce diff noise.
  (Closes: reproducible-builds/diffoscope!57)

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-support/diffoscope/{diffoscope_148.bb => diffoscope_150.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_148.bb => diffoscope_150.bb} (83%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_148.bb b/meta/recipes-support/diffoscope/diffoscope_150.bb
similarity index 83%
rename from meta/recipes-support/diffoscope/diffoscope_148.bb
rename to meta/recipes-support/diffoscope/diffoscope_150.bb
index 8b81ce1..58bd60a 100644
--- a/meta/recipes-support/diffoscope/diffoscope_148.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_150.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "54e39043226045419ba37f9b7aae4b96939f5ec16f37c44cc102e3d3f8e9ab1b"
+SRC_URI[sha256sum] = "0b9e4ae401fe4cbb8ce89b0bcabe608581d0ed53b91a28f18337179c7494af57"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.7.4

