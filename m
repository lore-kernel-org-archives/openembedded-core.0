Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643CAEB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 18:49:05 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.3219.1688582944901203549
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 11:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bUuBiIJh;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-78362f574c9so250040839f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 11:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688582944; x=1691174944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wEa5aSWa+dRDIa1C9rI89MIRSusmfQlaOjGlHhliGkA=;
        b=bUuBiIJhptiEsJZ51kTQjZutNcbcR7BLjahe/TZbzSZdeiP3/ExzGdEFdKlB8+wFtb
         7RTQ+OeL6At23Itr62ZICAOzRAWkJJWiiaQsQLFvbXOR6Rkryjeq3+avTY2AHOSVveTk
         ruMNIXljz36Hg3mqhmxDqDDylVOrCZ2VBHhyb4lWhNqdGTQ0LBuBAwVRBVfDFXWYHoRI
         ++2OTWmgf+iCphYBZjapEvPZXmg/wCaVSVCL7k3tsm159TcVfSA/+W1K3IkbSrZmQv3Y
         j2I9tZj1sn3SSKZXlrKsaG7F3uPKnABf+HwicwOBggc73jJmxOvuLJKZlXGEYqIB1pNa
         asJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688582944; x=1691174944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEa5aSWa+dRDIa1C9rI89MIRSusmfQlaOjGlHhliGkA=;
        b=c0JycZNlziJ3m5+29bE32yfxOEyV2BEl2IJ64PwUsDFrWtAw1O6FQ5CEczDck3KEFd
         4zpQiJvb3QBy3XpsQcA8VHUKALfDt6BGoe8EbE3Re9/SfElWfnE8Ou994v2VTpfi2sqg
         9U4ssdNotTTDSQo6GBPW0ARZNUG3rv+DF+Ym1ZQLJSBnWC6vBY0XFCLtkDe3KUh8a9A/
         fQ4xxPWUeFH6JSaeiaulHbyj/ftBHZPWGyU7b2t3xmbhGxMd3B5oxtJk0280gzP0EhPA
         lV7boqW67lLG8Xg7wmW2SgnCxmOKgzNUC56LrE1xtxlO85OSQjKLWP5kAx9XEEqEGy04
         XVQg==
X-Gm-Message-State: ABy/qLYZSUFInf+IJYGoSOcOh/sUOYUplulsPglbCvs0YPSPZJN2lN5K
	bz601Al2JknRSs1ABS1HCOmfKNZARvwxa65c
X-Google-Smtp-Source: APBJJlHRxNL2QF8FyzZHcVLQE6X6TSN2w7HOUNuWCBiYPku6hJc5tkEODxToPdzHnes16rJBpHcemA==
X-Received: by 2002:a92:d64f:0:b0:346:917:3e57 with SMTP id x15-20020a92d64f000000b0034609173e57mr12083942ilp.15.1688582943876;
        Wed, 05 Jul 2023 11:49:03 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id n13-20020a92dd0d000000b003423af2fda6sm8379868ilm.83.2023.07.05.11.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 11:49:03 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v2 1/2] openssl: check the existence of the PERL5LIB path
Date: Wed,  5 Jul 2023 18:48:46 +0000
Message-Id: <20230705184847.587503-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 18:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183906

When upstream change is better to fail or removing the PERL5LIB
if they are nott need anymore.

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


