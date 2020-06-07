Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.10341.1591546288422198830
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jun 2020 09:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=xmwRMJ0i;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 928C860250;
	Sun,  7 Jun 2020 18:11:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1591546286;
	bh=txoiZUbLn7OQ0EohqoERfoVd5R8rgDFwKJbPOtbmhw8=;
	h=From:To:Cc:Subject:Date:From;
	b=xmwRMJ0iZ+7/UHgOYA7vBSPz4i8WU1MbR+3LsVrE/YPnUVPmFXdXANVfPStGSjF72
	 e4Z47nZmNy+SdZ34p2dHUAAsWtu7XrsUlGynMvDmCMAku4uzGTR9xD78CLnQ1WOQZl
	 JmYMlkUXiBrVLYfzvWmJPWYQ0bcjK+oZ/i1rFns8L4JmG0BhVLS1birUODwWtve4EX
	 5xABKBbX+sPxubiSoKcNxj+eIQbS5t4YKzD1nNfoD0fBXt3G6+sZoUhHGTwM3Wf5o/
	 Sf200b1HJridxnJp2yMSQ23fwWWNIzMAwyXIHovT5XRQvjiU2QbpfQ3kT3X7NxyolE
	 TbCnwkf6EPbog==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] iptables: upgrade 1.8.4 -> 1.8.5
Date: Sun,  7 Jun 2020 18:11:23 +0200
Message-Id: <1591546283-23154-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This release contains the following fixes and enhancements:

xtables-save/xtables-restore:
- Fix parser in `--noflush' mode incorrectly rejecting chain definitions
  and empty lines.
- Fix crash when restoring or dumping while other ruleset changes happen
  in parallel.

iptables-apply:
- Install the script along with `make install'.
- Introduce parameters `-c' (run command) and `-w' (save successfully
  applied rules to file).
- Use `mktemp' instead of `tempfile' for temporary files.

iptables-translate:
- Support `time' match and `NOTRACK' target.
- Fix for special interface names `*', `+' and `eth++'.

ebtables-nft:
- Full among match support, including sets with mixed MAC and MAC+IP
  entries.

extensions:
- connlabel: Numeric labels were rejected if a connlabel.conf existed in
             the system.
- IDLETIMER: Introduce `--alarm' option.

libxtables:
- Introduce xtables_fini() to properly deinit the library and close any
  loaded shared objects.

nfnl_osf:
- Fix lockup after loading the first line from fingerprints file.
- Improve error handling, don't silently exit when deleting a
  non-existing fingerprint.

General:
- Fixes for undefined behaviour.
- Replace a few unsafe calls to strcpy().
- Fix some warnings when compiling with clang.
- Various fixes for valgrind-detected problems such as memory leaks and
  reachable memory at program exit.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-extended/iptables/{iptables_1.8.4.bb => iptables_1.8.5.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/iptables/{iptables_1.8.4.bb => iptables_1.8.5.bb} (96%)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.4.bb b/meta/recipes-extended/iptables/iptables_1.8.5.bb
similarity index 96%
rename from meta/recipes-extended/iptables/iptables_1.8.4.bb
rename to meta/recipes-extended/iptables/iptables_1.8.5.bb
index cf1388c..fa1e5c2 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.4.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.5.bb
@@ -16,8 +16,7 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://ip6tables.service \
            file://ip6tables.rules \
 "
-SRC_URI[md5sum] = "9b201107957fbf62709c3d8226239b0d"
-SRC_URI[sha256sum] = "993a3a5490a544c2cbf2ef15cf7e7ed21af1845baf228318d5c36ef8827e157c"
+SRC_URI[sha256sum] = "d457d74512e63aa3f50336e0597d4023c0e3c6845594d38532efb6ebcb294309"
 
 SYSTEMD_SERVICE_${PN} = "\
     iptables.service \
-- 
2.7.4

