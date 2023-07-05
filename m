Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F99CEB64DD
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 18:49:15 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web10.3220.1688582945833119554
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 11:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LABsh6+Y;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: quaresma.jose@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3456fda4ed1so35939235ab.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 11:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688582945; x=1691174945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LCUD54bjNO1CniWGLCo5u3wVOMVOwQ+4Iu2v8r7qUE=;
        b=LABsh6+YUSxb8JsRHaRy5JX6wC5AlwVEwKXJ3O2ramTBe4h4QsBvozv3wk+Upgvuob
         FgisM4SWwKJe5Zu06nz+Tns8bkbehyRlrwQ3hPl48KCxIZ1lHjEbxZwfYlJzCg6EKVID
         MYU08fHReU4SQDJFi4yLpsEiVMf4PQDga85VRUp9+1ngRWjc1hbaUd+XEcQfZKVOWbIO
         6kBGc7Z9o4woMUGwI2vYjsAAMtv9SdLRYGucSgvfSzWFS9vso6Q+M01n6rbwlqrP3E0U
         vuBqJXD5dATz1RjgHHg1dj7oxBnWvRzVR34/0u5OqdUmPAibxIiFELbJiBlb3xnuTBxJ
         E3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688582945; x=1691174945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0LCUD54bjNO1CniWGLCo5u3wVOMVOwQ+4Iu2v8r7qUE=;
        b=aemaZa6/uHe9XcVfJgKCacKa8l1f3jlj3ZawKsT47IdRzhIwdCKjLHMAqYIIp+iycR
         BCOZ2TQke3NYt+ZIqk9dJBZcVHpuBc6h/Ae3lg98XRGShx6z3E/Ws4Recc7jqILOkQAB
         M6H0OSjHFfBYwLqOb2kDQ4i1zDXRJsluRdYuSdxCoaOGoWFNxXimN4DUWyEPzbYe9hzm
         5v3QHDN1DmIBebphSNFcLuZhgTsAor0H2xgRMk0zwJd8neR+mhhhqEVejk2Cv4AvLXuD
         f58OqEbGi7u7Ay3A7MgbTWsMJNJEtrQP6BqxpijVq8baXLf/W7HB8PBPQ/2FdnghdLAS
         FJ9Q==
X-Gm-Message-State: ABy/qLaeW/sJOHeJ69Ze4cq0Ja+OLxuoqfFGDxjH5nJopj5+ugjph/7D
	Cai1vGYDE/3Ih6vKCpPD9kiCF2Kg5ZI7Pf1q
X-Google-Smtp-Source: APBJJlFUbPQ/hnSrBNPCQyIZcoKwCvrZ7zIdeL+doYM3UYSOemfN7dopixg4igypJe0/fXjuvOqgKQ==
X-Received: by 2002:a92:d2c8:0:b0:345:af82:dc3a with SMTP id w8-20020a92d2c8000000b00345af82dc3amr17755759ilg.14.1688582944875;
        Wed, 05 Jul 2023 11:49:04 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id n13-20020a92dd0d000000b003423af2fda6sm8379868ilm.83.2023.07.05.11.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 11:49:04 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v2 2/2] openssl: fix the PERLEXTERNAL path
Date: Wed,  5 Jul 2023 18:48:47 +0000
Message-Id: <20230705184847.587503-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705184847.587503-1-jose.quaresma@foundries.io>
References: <20230705184847.587503-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 18:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183907

The Text-Template was updated from 1.46 to 1.56

| ERROR: openssl-native-3.1.1-r0 do_configure: PERLEXTERNAL '/build/tmp/work/x86_64-linux/openssl-native/3.1.1-r0/openssl-3.1.1/external/perl/Text-Template-1.46/lib' not found!

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-connectivity/openssl/openssl_3.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
index b849f9ca79..5f30a37c8a 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
@@ -137,7 +137,7 @@ do_configure () {
 	fi
 	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
 	# environment variables set by bitbake. Adjust the environment variables instead.
-	PERLEXTERNAL="${S}/external/perl/Text-Template-1.46/lib"
+	PERLEXTERNAL="${S}/external/perl/Text-Template-1.56/lib"
 	test -d "$PERLEXTERNAL" || bberror "PERLEXTERNAL '$PERLEXTERNAL' not found!"
 	HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="$PERLEXTERNAL" \
 	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=$useprefix --openssldir=${libdir}/ssl-3 --libdir=${libdir} $target
-- 
2.34.1


