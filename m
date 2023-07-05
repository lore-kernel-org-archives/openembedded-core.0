Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18680C0015E
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 18:04:15 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.2053.1688580248772662613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 11:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=rNll6mWJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fa94ea1caaso9750345e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 11:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688580247; x=1691172247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N5m9ZlYG1c0K1S04Xyy1OeYkAIOxcIPD9UDjLosXoEU=;
        b=rNll6mWJOrio+/HGbXauEYYsy+0noK1eQ4bQ5zuDkBL/m1F3XHZ0COmk7UUpC6g8Yd
         79SIzNY/kgMU0iOfHRxQSesOc6u/YhXxwEZ+KZ5hF+R9LBp6vw92zynRJvsK908eB0qy
         etP4juLdk0Ij7CeO6D/uyJ+IumpUZvo6BSg1EPDdHcSoktjg7WfdROF/ZUgFKYspgwAa
         FW6u97LzIsGviSZ8d7mCfouejOeTMR8ESjyQrO1A7Obb2lFTdvAXpCOx/g3pqOaTIzuG
         ApFwYX3MhHqYXTh3d6dV1HgRIT6iLTNJjh7lSWIr+abll1eaI6RDZGx41C6cGeU9GzpN
         fTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688580247; x=1691172247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5m9ZlYG1c0K1S04Xyy1OeYkAIOxcIPD9UDjLosXoEU=;
        b=e8muU1MbKtdMLriM+11W7tfddhl8UGWBCFtSTEC7AvVY2N0eQ0HMQZKNdT+TY70VJH
         cbOTksku46IjClkz7qO4borlN0GcQfcuwE4IRTWEAK9Cm44c/4D+CWcrpkXk8lMzIcnP
         9oqJ6g2aYr/nTrBxClYpv1jnCGwLjazgPlqT0U08aBi/uoMYujkP+6CjzipkFOzwKHnU
         ERvR24zB9H8/r79/5Mkbc3JD3sa8tsZDJGPN6Omqh9OAWMklfdmz54v0LXcrGnJWG7JR
         Dh67objO1QXBHxs+NwDNW5vf/jdV1wtHy73Os03xfRi/yGHoEfTyJZeZVBu5aEc8KdvC
         nMhQ==
X-Gm-Message-State: ABy/qLY833TZZjoLhdygVTFf1XB0TpR+TEbjRmY0GaSFCPTZUrQ0j/DO
	XF5WpFClqDSJCetfHojo9vWGhk2ZrmeHdg==
X-Google-Smtp-Source: APBJJlH8U26jLDg/Ur1KtuYpsqtwtmH1PdC+8oUI1whrWVgf9C8LIDxYKtbMXxpWa4nsE6w9khHrjA==
X-Received: by 2002:a05:600c:470e:b0:3fa:94ea:583c with SMTP id v14-20020a05600c470e00b003fa94ea583cmr3077685wmo.8.1688580246624;
        Wed, 05 Jul 2023 11:04:06 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id d18-20020a05600c251200b003fbcf032c55sm2800484wma.7.2023.07.05.11.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 11:04:06 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 1/2] openssl: check the existence of the PERL5LIB path
Date: Wed,  5 Jul 2023 18:03:57 +0000
Message-Id: <20230705180358.382955-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 18:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183900

When upstream change is better to fail or removing the PERL5LIB
if they are nott need anymore.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-connectivity/openssl/openssl_3.1.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
index f5f3f32a97..0dce7f71bc 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
@@ -137,7 +137,10 @@ do_configure () {
 	fi
 	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
 	# environment variables set by bitbake. Adjust the environment variables instead.
-	HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
+	export HASHBANGPERL="/usr/bin/env perl"
+	export PERL=perl
+	export PERL5LIB="${S}/external/perl/Text-Template-1.46/lib"
+	test -d "$PERL5LIB" || bberror "PERL5LIB '$PERL5LIB' not found!"
 	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=$useprefix --openssldir=${libdir}/ssl-3 --libdir=${libdir} $target
 	perl ${B}/configdata.pm --dump
 }
-- 
2.34.1


