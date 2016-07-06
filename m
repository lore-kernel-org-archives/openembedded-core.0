Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id BB9746013D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 09:57:02 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id z126so105200683wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 02:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vQ9xKU9iJuF+szN5xzgqEnvMO93SnczVs6BFhA3V234=;
	b=VxF5o9uWG0ET5opWhITEA4Yt0LsaQOlGKGfzONFtr0iB4cP/uWo+jc8EYI61FDOrWE
	/GYwS0n8tzXVmp1hiMj+GtoBNUCOo+orYxHIlS++pWhdvIfIVZ9uKFITZGeH8h5hfFMB
	VEGwipSlyfKmhgn12PGHXEEwk/plOIyYaAwBfozYquZesBocmBHJKUMXKbUFYl+GeQfT
	UcohNZXfrxYqOJh+KorNSElsevtBFBzvNCcYMSjHSm3a2JK1v5GVtDAkl5KKTrxcZuGC
	sryVy9OMw2L/V97IoSnV5AwobBJJYCliAgbGfwOx1+69kBbakBP93WICHBqHDDKlbeMw
	GChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vQ9xKU9iJuF+szN5xzgqEnvMO93SnczVs6BFhA3V234=;
	b=BLGwSxbiy0PCqusNrOKeU2vGqh+Mq0PkoQWbzGHPgl+zEVsljt0gk7s+yfLU7uiNpE
	HfCtQcIzzIwpUh05HAi3vuIxmT0EAaaT7124maG9XP34b6VpEjkR5YjL3frhwnPaEu+r
	eTUA3YkBowNWa2WJC+a2cauq8ScWu0DyigeVaNuuYaDXBbV8E/B3sphBxX6AfAwgIi8f
	7GCz0MKppRr1NYH0pfo3rTmgNc9rAV+fTtVIsCjFl/ewOjUTNgjXxLc8fIP1v/Px3syL
	1Pvn/63edOUY03Bmgw3zSwxmnDKLgxKS8g4kywAZKO1VtKpeig02ejJLHpDD8i+pA5hO
	MMzg==
X-Gm-Message-State: ALyK8tK4Nl0Cvwyle9OkHju7VE5pkE3s9pnAcxBz+xST73bQk6GIVptBZYuZYHF6QBzdh7wA
X-Received: by 10.28.18.203 with SMTP id 194mr21196161wms.75.1467799022490;
	Wed, 06 Jul 2016 02:57:02 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	bh7sm1688488wjb.22.2016.07.06.02.57.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Jul 2016 02:57:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jul 2016 10:56:54 +0100
Message-Id: <1467799014-3012-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1467799014-3012-1-git-send-email-ross.burton@intel.com>
References: <1467799014-3012-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] classes/libc-package: remove pointless copying when running localedef
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
X-List-Received-Date: Wed, 06 Jul 2016 09:57:02 -0000

localedef handles attempts to read/write the archive in parallel correctly by
creating the file atomically, gracefully handling racing to create, and has
exclusive locks when writing.  Therefore I can't see any purpose to copying the
archive to /tmp and back again when manipulating it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/libc-package.bbclass | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index a8d86cf..8c99d61 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -47,7 +47,6 @@ python __anonymous () {
 
 OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
 
-# indentation removed on purpose
 locale_base_postinst() {
 #!/bin/sh
 
@@ -55,33 +54,14 @@ if [ "x$D" != "x" ]; then
 	exit 1
 fi
 
-rm -rf ${TMP_LOCALE}
-mkdir -p ${TMP_LOCALE}
-if [ -f ${localedir}/locale-archive ]; then
-        cp ${localedir}/locale-archive ${TMP_LOCALE}/
-fi
-localedef --inputfile=${datadir}/i18n/locales/%s --charmap=%s --prefix=/tmp/locale %s
-mkdir -p ${localedir}/
-mv ${TMP_LOCALE}/locale-archive ${localedir}/
-rm -rf ${TMP_LOCALE}
+localedef --inputfile=${datadir}/i18n/locales/%s --charmap=%s %s
 }
 
-# indentation removed on purpose
 locale_base_postrm() {
 #!/bin/sh
-
-rm -rf ${TMP_LOCALE}
-mkdir -p ${TMP_LOCALE}
-if [ -f ${localedir}/locale-archive ]; then
-	cp ${localedir}/locale-archive ${TMP_LOCALE}/
-fi
-localedef --delete-from-archive --inputfile=${datadir}/locales/%s --charmap=%s --prefix=/tmp/locale %s
-mv ${TMP_LOCALE}/locale-archive ${localedir}/
-rm -rf ${TMP_LOCALE}
+localedef --delete-from-archive --inputfile=${datadir}/locales/%s --charmap=%s %s
 }
 
-
-TMP_LOCALE="/tmp/locale${localedir}"
 LOCALETREESRC ?= "${PKGD}"
 
 do_prep_locale_tree() {
-- 
2.8.1


