Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26CCAC41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:52 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.16780.1690487082495469416
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ouipXmXz;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-38c35975545so1125561b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487081; x=1691091881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6i5UEOTXYKEf6bahwCIBjQ3LNTHMawt+yvrs8J8gLY=;
        b=ouipXmXzIhorrfYvK3Tue7iSKlVo8OCHdaOtGYzYSSRBMzb2iEv67NoYa9Y1hrfZol
         DCrQVsSy6VO6G+7ixV//rlA0OeqkF8howIFdQNW7LOOW9PZJP1eDJRQtk1zqn9fs6Y36
         Z9bwgmITdlm8Xu+QuxWC2Ci0SPsdgLqK33iaA2CtSo75U+8FjR/Cml1uk/itbrkvXbHC
         7SOtOe0KYi6np7GddXC/FLamp6P0aIwKYmFjJAJEm77HjKP2r067Kdz6U9OkF4D5P2Dc
         ancFvmQjmNRUPc0JV7Hivzg3uJALv3USfap1agOeKD+SaucGxEgfSRIikeNqr2CURK/d
         vmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487081; x=1691091881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6i5UEOTXYKEf6bahwCIBjQ3LNTHMawt+yvrs8J8gLY=;
        b=MWl97tffWm4PDCSswBvSjbSy7tpTNrWWiLnlVnVEcPHk8CY32sDz6SVciszm1nFPlm
         LEbuctpwDdLfbJQlxpncR8ha0zunbhp+1EAn5EEHiiE9E12SLimczMRs7Pr6pLepXDeS
         k7O1zS0oyA8ReDywtoMyG+hwNWnGJtdc4NFH4cgowBM5o223D9dlr8zzM9JLVW2pQNkv
         wZvXcFeqtnibG9lTepoXRY6FcxdI8vZrU+tc7ZfyJXmAiVK/p/bHYRdo1T+96VFOvppu
         gE4rKeDf6ssECaU2vqPkUApE4qjQDNpvRLviJ+G9aJSlIN5mJdWvVEIrpLO2kpkl3NFt
         4R/g==
X-Gm-Message-State: ABy/qLZFdPVqRz5+BnFPNuqqu/rMtqXpBJ9ZlClje7MSY/AODWqlImMo
	LnYTwEKsd1PWR7qiqu7/CfCOWe4s+zEwdROkk6s=
X-Google-Smtp-Source: APBJJlEodRJOgAKzeFT4wPw41DMxU7G5cLXwBbGBQcrxj66M4en2thUi8kOfsvuwcX+EJsDSb3PPsA==
X-Received: by 2002:a05:6808:408d:b0:3a4:4b42:612b with SMTP id db13-20020a056808408d00b003a44b42612bmr179526oib.42.1690487081378;
        Thu, 27 Jul 2023 12:44:41 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 26/27] openssl: use a glob on the PERLEXTERNAL to track updates on the path
Date: Thu, 27 Jul 2023 09:43:44 -1000
Message-Id: <e50a2298b10107b8ee66b2efd52c9d51d7a99fa5.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185001

From: Jose Quaresma <quaresma.jose@gmail.com>

The Text-Template was updated from 1.46 to 1.56

| ERROR: openssl-native-3.1.1-r0 do_configure: PERLEXTERNAL '/build/tmp/work/x86_64-linux/openssl-native/3.1.1-r0/openssl-3.1.1/external/perl/Text-Template-1.46/lib' not found!

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b9a7739b01e31d0cc8358d99255e3e1b02a0a1a8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssl/openssl_3.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
index b849f9ca79..432ab4032b 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
@@ -137,7 +137,7 @@ do_configure () {
 	fi
 	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
 	# environment variables set by bitbake. Adjust the environment variables instead.
-	PERLEXTERNAL="${S}/external/perl/Text-Template-1.46/lib"
+	PERLEXTERNAL="$(realpath ${S}/external/perl/Text-Template-*/lib)"
 	test -d "$PERLEXTERNAL" || bberror "PERLEXTERNAL '$PERLEXTERNAL' not found!"
 	HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="$PERLEXTERNAL" \
 	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=$useprefix --openssldir=${libdir}/ssl-3 --libdir=${libdir} $target
-- 
2.34.1


