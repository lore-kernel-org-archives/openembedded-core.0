Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FBCEB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 11:05:29 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.19383.1688641519674130449
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 04:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZUROtrkw;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso5764505e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 04:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688641518; x=1691233518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfyW5d0UVqbZhUZr02FGAoupHMkh0m0dgywoXBOpjAI=;
        b=ZUROtrkwTyTXmfQ3FT9j4ZfS3bK3mCnqse/xYts8QQZebHFcgi3xERKDIs4fcOUjuK
         HfCIs7DpVIkZGqkN2juXy3HS/NR+//nK+ZPFYm+Be/fZCs61nBkc9JRRey+v4LlgZRoK
         hHgTRv4EJ4luVb4CveNN/m+zHdRwMd+YeMzOd/i+sUjI4Ol4DatfnbN2K0eLcUHPeU1V
         WHvYtto5F7mCHAKcY/18d59ozMCNR87pq9hfELffykdS5o6ZC6yIzUZR9F3DTimQY42G
         sn6dU3UGTwvDOXZb868IvLA7G/12v7g1Ij+9wKsHEfoQ2T/f/UwhkH3kdd7N0LmdUhbg
         WgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688641518; x=1691233518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfyW5d0UVqbZhUZr02FGAoupHMkh0m0dgywoXBOpjAI=;
        b=VUleRFnQeIDzCl24MqTHjwYWs/GrBJ4sDV4LvfHxshExhKrvDf1LaIlb4dVL7VHVXQ
         uPXX3tpEQD2HVQlw34FPvKYlhEDuNrMR6pnjZs3cvIFedGmBPK6CGdat0+qnLW1POYIa
         FpS+p8UUKVjwiQKhu6K8wqvGZow4ipMNiDVMGAGXVU8ZCioOgecY4UYBufsJoIptI3+P
         0RvapRTMq2vq7396HwyggAwTUc8riMA+wuI17zVOjOYXLgMsUpeGxDGQTpGUjiOaw1/k
         CEcbwP0BRF3+DPeMP5wVxVPks657qYglR9XepeDH7+cgBLGXMhecyqXiB5rP9w4fsDq8
         vxlw==
X-Gm-Message-State: ABy/qLbx4r5tnhr7kaCyQb0AWwpzr2fD4GQ7/6XC8HeFt7biDd71mcuZ
	69kkUOFHMbBnitjBJfxbWTnCxdnquvd5ZA==
X-Google-Smtp-Source: APBJJlHPrCA/STV7iwGzSHzpmJzhR0HglYL1ZRYAsXyb7C19WxEGw9S5zkukHnOYYvTs/VMbyiZBSw==
X-Received: by 2002:a7b:c445:0:b0:3fb:a46c:7eac with SMTP id l5-20020a7bc445000000b003fba46c7eacmr1078702wmi.7.1688641517633;
        Thu, 06 Jul 2023 04:05:17 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id y6-20020a05600c364600b003fa968e9c27sm4773269wmq.9.2023.07.06.04.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 04:05:17 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v3 2/2] openssl: use a glob on the PERLEXTERNAL to track updates on the path
Date: Thu,  6 Jul 2023 11:04:56 +0000
Message-Id: <20230706110456.848167-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230706110456.848167-1-jose.quaresma@foundries.io>
References: <20230706110456.848167-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 11:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183926

The Text-Template was updated from 1.46 to 1.56

| ERROR: openssl-native-3.1.1-r0 do_configure: PERLEXTERNAL '/build/tmp/work/x86_64-linux/openssl-native/3.1.1-r0/openssl-3.1.1/external/perl/Text-Template-1.46/lib' not found!

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
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


