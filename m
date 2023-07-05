Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1759FEB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 18:04:15 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.2065.1688580249105897804
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 11:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dZfmIZ+R;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fbc0981755so79722095e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 11:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688580247; x=1691172247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqsGBt4R2nKHuLBDvd+GGRWUVLl7xINOsk6XgtygooQ=;
        b=dZfmIZ+R9O5rrCM74Uvuu9Sx/mMup19rFey1AsdpXDGtksKQdIDHxFCb7bsmWJDcoa
         V89xwjHQdXvvqXL/KjWoD7a4owkTQjqU5XI5KW3fjuphOJidRkjRacK/j2hFBaKkEeqK
         GKje7/EpQRJke6R/Wx+L9XP9r5GgoMMn8Nf4QnCsVwyU1Z3gFSJfIT4WEsBHaykqu6VT
         pdmQfMHu6eK5XscSIxYUYQGmoAH2sLP5FxVHmI5SZKCHBnNTkCqp3OmN7m9vyH9NG/TZ
         UeyzZGn4KCXL3vRBDz4ntluIniF47LhAVmFhK14LY0nHdmasz1COlkaSQUp1b3vgVvLm
         XMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688580247; x=1691172247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqsGBt4R2nKHuLBDvd+GGRWUVLl7xINOsk6XgtygooQ=;
        b=OS9Qr2HaRnj6PIZkXOTE4/YojtFTvst+U9gvGa/zHfJS2h1MsylYamCMR92RwTaM3Y
         VovOJQzpw4Dwj7NZPrNgwD5yBA3XFsFbpIxkmbG/rh7wTXOb89iICO12EcXGWqKQsAFm
         hhVHuRI1SUl3rVtnrCsBbD7mlkGPmA64qBrrPf2U810x2srkMjBtawxb/WXXQbtBNYdk
         N6qP5H7KEvkUvGe8MYCG7Rm4kLvq/WUBWnbwYkF6jWWCXd9Mwpp3J+eT6LZR8A3rvYqe
         BSmkTUlK6cwYWUpf6Ir5vF5ovRx38draj2KziOr0j0U8s+n7gwYQF77/P6Zg7/eYh26M
         qu9g==
X-Gm-Message-State: ABy/qLZcC9HJysIV9UZ1lVuvr6vphiKMqHUnE3XqCmc1g3atyGfxOpae
	/bi8+EkNKcA9eJ9IFdHlOW8FW7G3z77kbg==
X-Google-Smtp-Source: APBJJlGuskYQ5LZTYgiLXCfwhcJLvXT3TUug2JUjMxF3a86ngAkdvbT3nGcFI1gwKjSJ+CdRi3jcTQ==
X-Received: by 2002:a05:600c:210c:b0:3fb:d194:8332 with SMTP id u12-20020a05600c210c00b003fbd1948332mr11202807wml.30.1688580247133;
        Wed, 05 Jul 2023 11:04:07 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id d18-20020a05600c251200b003fbcf032c55sm2800484wma.7.2023.07.05.11.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 11:04:06 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 2/2] openssl: fix the PERL5LIB path
Date: Wed,  5 Jul 2023 18:03:58 +0000
Message-Id: <20230705180358.382955-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705180358.382955-1-jose.quaresma@foundries.io>
References: <20230705180358.382955-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 18:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183901

The Text-Template was updated from 1.46 to 1.56

| ERROR: openssl-native-3.1.1-r0 do_configure: PERL5LIB '/build/tmp/work/x86_64-linux/openssl-native/3.1.1-r0/openssl-3.1.1/external/perl/Text-Template-1.46/lib' not found!

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-connectivity/openssl/openssl_3.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
index 0dce7f71bc..ffb962a53f 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
@@ -139,7 +139,7 @@ do_configure () {
 	# environment variables set by bitbake. Adjust the environment variables instead.
 	export HASHBANGPERL="/usr/bin/env perl"
 	export PERL=perl
-	export PERL5LIB="${S}/external/perl/Text-Template-1.46/lib"
+	export PERL5LIB="${S}/external/perl/Text-Template-1.56/lib"
 	test -d "$PERL5LIB" || bberror "PERL5LIB '$PERL5LIB' not found!"
 	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=$useprefix --openssldir=${libdir}/ssl-3 --libdir=${libdir} $target
 	perl ${B}/configdata.pm --dump
-- 
2.34.1


