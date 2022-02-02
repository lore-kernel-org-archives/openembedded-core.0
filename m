Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D47C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:12 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web09.2288.1643826490761447500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AOUPZqsb;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id u18so399308edt.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xWcDtGlg/ahRDF+kHUVWLDwiJX0FoUoElxpKQAeQedA=;
        b=AOUPZqsbRSh8iq59iKIeRN6PhwDwvqFn3agaQFgVwh4d4Cnqq0s2Dw8r6YXRSaqKlI
         T6+fAy+C9AJDG9Kpk75N4m8b8jZSQBY2li0L+3QFllAPYXqSs9ooUoJiOk78c99JM8hG
         64rqFWTUex8yLH+9HJJzqLdrGLw0Iv39FOFcPeLHfKAaZP8JcwOnIBEtPkkmA8Qn6fdo
         08E4nTVBMdosu7Z0snGBHj1HUqQLCx+HYGT2f5wdyoCa/BOQZGG0yuj7LBCyKC/uNkz+
         r7t3AURnFn0t3lPiQBVceUfnj+BFwoYVgXWlnPQOQ3gQ+xU5EbFuGWh8xjbpJc7PKFt3
         3VgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xWcDtGlg/ahRDF+kHUVWLDwiJX0FoUoElxpKQAeQedA=;
        b=x7sya1gTfnNSzb+D/wfpaJe+r5JdgDBsS6VU2lFh/L4e+CWpC6pKY4sy/Q3IjD4ZLb
         71jaGCXZGPeZBL9CDpMuuM4nwD/3Ef9Ji8k37a0nt3IZkO2q3M4N5FWk86firoMwHnLe
         oqtyCp5SHQCU9eVtnHa1oS7hLNMp58n2LrmB56tnqClAxYY9wmk03ese1cv51Q7Za7Pk
         TkxJPCI1v8223VSHRPTqNT+5w5Wm5oaL+f+/AoyvPx4EulNGEuyIZQyfhAo86Etr1QSz
         tQN+I0ph95vU0uf6oOc1iSrnjUaE1AXg2d771Z0BJPH80q7tK+uHZ1rL7A97xSIE816J
         fB7w==
X-Gm-Message-State: AOAM531tsH3LIw7dTv0DlAKVyBVIWW8gLr+TxWykx0CjAuNlzaB0u09f
	tk0SMKgnmjMiFqQSLoF0jCb25zsA+rc=
X-Google-Smtp-Source: 
 ABdhPJwkpIH2g6OOgMSh+2ZLuFqkPE46eH77M2ODuOP0m2Bamk8msADreMmoHpBvkdW7aVkq1oY4jA==
X-Received: by 2002:a05:6402:26d6:: with SMTP id
 x22mr31422696edd.366.1643826489389;
        Wed, 02 Feb 2022 10:28:09 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/33] git: build manpages from source subject to manpages
 PACKAGECONFIG
Date: Wed,  2 Feb 2022 19:27:33 +0100
Message-Id: <20220202182758.919991-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161233

This allows automated updates, and better aligns with how
documentation is handled in oe-core.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/git/git_2.34.1.bb | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/git/git_2.34.1.bb b/meta/recipes-devtools/git/git_2.34.1.bb
index a762ebac99..71ff6d444c 100644
--- a/meta/recipes-devtools/git/git_2.34.1.bb
+++ b/meta/recipes-devtools/git/git_2.34.1.bb
@@ -8,7 +8,6 @@ DEPENDS = "openssl curl zlib expat"
 PROVIDES:append:class-native = " git-replacement-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
-           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
            file://fixsort.patch \
 "
 
@@ -21,6 +20,7 @@ CVE_PRODUCT = "git-scm:git"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cvsserver] = ""
 PACKAGECONFIG[svn] = ""
+PACKAGECONFIG[manpages] = ",,asciidoc-native xmlto-native"
 
 EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl \
 		--without-tcltk \
@@ -29,7 +29,7 @@ EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl \
 EXTRA_OECONF:append:class-nativesdk = " --with-gitconfig=/etc/gitconfig "
 
 # Needs brokensep as this doesn't use automake
-inherit autotools-brokensep perlnative bash-completion
+inherit autotools-brokensep perlnative bash-completion manpages
 
 EXTRA_OEMAKE = "NO_PYTHON=1 CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
 EXTRA_OEMAKE += "'PERL_PATH=/usr/bin/env perl'"
@@ -40,19 +40,22 @@ do_compile:prepend () {
 	# Remove perl/perl.mak to fix the out-of-date perl.mak error
 	# during rebuild
 	rm -f perl/perl.mak
+
+        if [ "${@bb.utils.filter('PACKAGECONFIG', 'manpages', d)}" ]; then
+            oe_runmake man
+        fi
 }
 
 do_install () {
 	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
 		template_dir=${datadir}/git-core/templates
 
-	for section in man1 man5 man7; do
-		install -d ${D}/${mandir}/$section
-		install -t ${D}/${mandir}/$section ${WORKDIR}/$section/*
-	done
-
 	install -d ${D}/${datadir}/bash-completion/completions/
 	install -m 644 ${S}/contrib/completion/git-completion.bash ${D}/${datadir}/bash-completion/completions/git
+
+        if [ "${@bb.utils.filter('PACKAGECONFIG', 'manpages', d)}" ]; then
+            oe_runmake install-man DESTDIR="${D}"
+        fi
 }
 
 perl_native_fixup () {
@@ -146,4 +149,3 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
 SRC_URI[tarball.sha256sum] = "fc4eb5ecb9299db91cdd156c06cdeb41833f53adc5631ddf8c0cb13eaa2911c1"
-SRC_URI[manpages.sha256sum] = "220f1ed68582caeddf79c4db15e4eaa4808ec01fd11889e19232f0a74d7f31b0"
-- 
2.20.1


