Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1FBC5DF6B
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:22:34 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21789.1786634551436978718
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 08:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nPszeMNs;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso1092306f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786634550; x=1787239350; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k+Mx1FARql4uRwbb1fGQ//IEa7I3JeXKBcc2LccMuno=;
        b=nPszeMNsuxa+uhQWECud9DScy6M3Y7P+vGyrWjDdQMNv8LJ9NaLbf8hh9pMKO/ycPa
         ScFu6FthSBRp3XX3ahEkNvt+dTlWmKDZpvEflCc8LZZP2MPp1P+r5c+c7VKfxj/EYDoH
         wVVCdv9cIU+4gC2nQaNlKeriYEa8JzB9zM8ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786634550; x=1787239350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=k+Mx1FARql4uRwbb1fGQ//IEa7I3JeXKBcc2LccMuno=;
        b=mmFfKkcPn0DW0Fel7JSO1k2zNlriG/TDA5t65ytGnBxWHzQwEPuXWdQJqiJltQnd+S
         Ro93ID9DVXz467LgBfqYBV2FQo/YGiJU3OqPyHH7X2+UP3uQ+b3NIggZR8vWnbUFgYmP
         P5OF6oli+HmpcwCntIkLLHc3eBHIgNqAU9lemBJNCSpSlN/RNxYTdMCTIG9jIVmkPEOw
         2YM55rJ8JxnAsj8vKK1BAW6p4xpaH7kI67E+7A7U3UlfUEhGmISKWSf0drBfyaTDH1u+
         IVaT77tiUh2RA50g16/6fUrPTrTDMp6Y7hbVZvWZTI5j0vC9gx5b3l0WQBIUvfiYvjq3
         1uow==
X-Gm-Message-State: AOJu0YxKHxrQV494TgblUxim4nf1WRqIGTEk4nHm74RMSGeySjBrg9/e
	mP0pkYOVvHh1YbazkfGxUwJJGeSGoS3GGodMCP+/mOKBL6p1BMkzLW31i+55fmLoSON82ZOnPQ2
	YT4XsaU+RBw==
X-Gm-Gg: AR+sD13QVDSdqPjZSLd7V/tuywGSiuP2LzzLKoadFZ+u57CRNZTqFgdGN6e7wVZfE7a
	7m6r2Unrvh1s96qN86OIqPb7GZqw2lZvDKIIf3qPJtCvdxDQ4S+UHLuqIcMgteuZ5lpOTGSgnyl
	0wRd40qfdT6+WaDJYuNM+EGXmKccFxQbSThPHDDjGy5xvzMi2dvlLgr1s2WzcqUt49IZWAkGrBJ
	aHA5Vk3MW/QlwnkH86Go4bgJS6Kk9JIBhlqkb0MwJq1U+S7BeSN4CxdUoe1esfmZRcRerjOmQ6C
	WWPainwoAo4dThQdL9mwXC0ET1MqNJSb/fZJDlDjrByj6LpySrOdyreBAyJX7fp0UjRmr90MLX2
	SK5vJbDq+CCw8tdrlgoPGd1Lu9hpgtZA0UmzquAcd9u9XAkJdQrIB94FOEmZnZa20I2nBa8TLf2
	881ojfYrvmnEuCoo/ueYo3BG1lsvEkaaJdZUKF54NLcpO+1EtKK2sfauN34FgN+8X2wcl9B1ZsU
	BWvddz0SqOdQ/9XLscatHjW/tY9VPtKPdtl/s85SFrH3h4HclFMonx3Tr3Yv0moCCOawrZYyinW
	XErjVXGQeoKkiIcGC8WSkOz/xrt1eZWROMJkg9EO
X-Received: by 2002:adf:fdce:0:b0:47f:9750:26cc with SMTP id ffacd0b85a97d-48159ff10c6mr7227658f8f.23.1786634549532;
        Thu, 13 Aug 2026 08:22:29 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a068sm110450f8f.12.2026.08.13.08.22.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:22:29 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/17] cpan_build: disable .packlist and html doc
Date: Thu, 13 Aug 2026 17:21:59 +0200
Message-ID: <6b415937b4263c69f085c0faea426660f59b0d69.1786633048.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786633048.git.fabien.thomas@smile.fr>
References: <cover.1786633048.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 15:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243366

From: Wes Malone <wes@mitsi.com>

Currently, Makefile.PL-built Perl recipes (cpan.bbclass) exclude
.packlist files with NO_PACKLIST=1, but Build.PL recipes
(cpan_build.bbclass) do not. This now results in a QA error due to the
TMPDIR paths included in the .packlist file.

  ERROR: x do_package_qa: QA Issue: File [...]/.packlist in package x
         contains reference to TMPDIR [buildpaths]

A similar error is produced by generated html doc.

Here we add the corresponding Build.PL arg to disable packlists and html
doc.

Signed-off-by: Wes Malone <wes@mitsi.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/classes-recipe/cpan_build.bbclass                    | 7 +++++++
 meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb | 2 --
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/cpan_build.bbclass b/meta/classes-recipe/cpan_build.bbclass
index 026859b6c7..03289dc21c 100644
--- a/meta/classes-recipe/cpan_build.bbclass
+++ b/meta/classes-recipe/cpan_build.bbclass
@@ -25,6 +25,13 @@ cpan_build_do_configure () {
 	fi
 
 	perl Build.PL --installdirs vendor --destdir ${D} \
+                        --create_packlist=0 \
+                        --config installhtml1dir= \
+                        --config installhtml3dir= \
+                        --config installsitehtml1dir= \
+                        --config installsitehtml3dir= \
+                        --config installvendorhtml1dir= \
+                        --config installvendorhtml3dir= \
 			${EXTRA_CPAN_BUILD_FLAGS}
 
 	# Build.PLs can exit with success without generating a
diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
index b27a8c15e6..0f992dea6d 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
@@ -32,8 +32,6 @@ do_patch_module_build () {
 
 do_patch[postfuncs] += "do_patch_module_build"
 
-EXTRA_CPAN_BUILD_FLAGS = "--create_packlist=0"
-
 do_install:prepend () {
 	# We do not have a recipe for libpod-parser-perl which is for
 	# documentation (and is deprecated in favor of Pod::Simple)

