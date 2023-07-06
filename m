Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC071EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 11:05:19 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.19382.1688641519157260642
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 04:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HUdLs1H4;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fbc587febfso5314175e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 04:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688641517; x=1691233517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vWc4qA+mw/4DjLkNlWRlLMp5CpiBxg2oXZWdrjOPS8s=;
        b=HUdLs1H493UPh3Z5CcJDOM7v5hFLDgZVrjDgwLv1Kqorj71k3UQg+E2x8hhSD+rgrf
         jVYIr1knb93HIjFSy37isKbq2gp9WOnVMrlCQbgrcufUFCI1QwEXdqEnAqDeJmLryzaA
         3LqQzd2unqh4UAwseNJuU0ewlo5A88tEVtHSJBQeXa7V4/nAGY95fLST4YqYzOrOAdRe
         f9mdUyWD8ktPq2YbKT1hdD1lM3p/L8eIG7PTnn20hHc2CYE6rTz8P9RY+kIoAC7O//2S
         DfDBl6qzILETnPrGdf67Bzk+nM/+vNYdrTibybCGwvcRcFYlu9U8T59v81fk1xmgndN6
         gL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688641517; x=1691233517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vWc4qA+mw/4DjLkNlWRlLMp5CpiBxg2oXZWdrjOPS8s=;
        b=l+Z6DuZXVwCePe9dAWGOu86h9vGUasyZXYIXVsk1AoHIgmwWF9e4RFf3xpx+ep1hcr
         W4EFmRwTOFhUOqwAwL5IgD34EsCMJaeUh3zu0zldsI9G7bnb2oSRHNwjUZlgXrBNSfmW
         OTmZ43AIb3QrXRaudxgX6IkVi74/UuIlEoHIJiP8YhJDZ6suL265x+fketjD7SzYllAg
         j1Q4wzW4koDD1QOy37qmyLI2tff43EUbZWzWHB4rVThNsA8y17jv7uLv2A4H5A9nOgOm
         dYcvTOYTIgVoLRnrN7KQFwzqUew2xbWL1E9/HpWp0Cx7Xh2mnIdS44x4tM3kuTLRRPy4
         5Ycg==
X-Gm-Message-State: ABy/qLZGqft+lVKq2gfdbOFLbcGYMY4U94UdnkL3c391b0CmEpRLJCm/
	0OW1mKYCewuvN4Ju1nnCE7qeurfQhINelg==
X-Google-Smtp-Source: APBJJlGUFpTvuLEZR99yjbQi2sjZrP1KwkBz77JQB2N2Mmo0feGLCNXqiLI72xoaXrfSTvBhuMyuBA==
X-Received: by 2002:a1c:4b18:0:b0:3fb:ab76:164b with SMTP id y24-20020a1c4b18000000b003fbab76164bmr1050256wma.13.1688641517173;
        Thu, 06 Jul 2023 04:05:17 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id y6-20020a05600c364600b003fa968e9c27sm4773269wmq.9.2023.07.06.04.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 04:05:16 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v3 1/2] openssl: add PERLEXTERNAL path to test its existence
Date: Thu,  6 Jul 2023 11:04:55 +0000
Message-Id: <20230706110456.848167-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 11:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183925

When upstream change is better to fail or removing the PERL5LIB
if they are not need anymore.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-connectivity/openssl/openssl_3.1.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
index f5f3f32a97..b849f9ca79 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
@@ -137,7 +137,9 @@ do_configure () {
 	fi
 	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
 	# environment variables set by bitbake. Adjust the environment variables instead.
-	HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
+	PERLEXTERNAL="${S}/external/perl/Text-Template-1.46/lib"
+	test -d "$PERLEXTERNAL" || bberror "PERLEXTERNAL '$PERLEXTERNAL' not found!"
+	HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="$PERLEXTERNAL" \
 	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=$useprefix --openssldir=${libdir}/ssl-3 --libdir=${libdir} $target
 	perl ${B}/configdata.pm --dump
 }
-- 
2.34.1


