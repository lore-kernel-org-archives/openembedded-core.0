Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262B1EB64DD
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:42 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.16735.1690487080672662830
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=HkYYJJuj;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-55ae2075990so797571a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487080; x=1691091880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hm79ROy3gCI/ExNTnNUt72YMz2v28M0cPXPRheIK5VU=;
        b=HkYYJJujl3xx5cbcYAoM6mNpT2lB3+7D7Hfn0F9cAHceh/liBr4VwSArOCcRl42je2
         WUSGH6VAu6s2y0G3V3pYw6TbGZRAnkxiCm+lIsLVtQXio/a8ChOhAf83iYLiXZpTaF3I
         M+tCeGs6CQzTtm0zXVKloqMeQO8dmdEhyApnn9gnId0fJRXKwks+dz6vaGeG5g6hdlmz
         N0tGGCyT/kMvZgx/SXwQm59AnSKSCtH+p3tE9k8dYqJW3DcNX0tehIkorWqFyhv+xfo8
         S2giaSStRvNmoO9euH5i4I8PznmbPylJAjsVI1s3WMNx+kg8cjA8xHM/oSEWNbCwQ38e
         wfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487080; x=1691091880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hm79ROy3gCI/ExNTnNUt72YMz2v28M0cPXPRheIK5VU=;
        b=Gn5cNeoQnHH6n2gDaEtnyFz+Zek9BNQ2BjjD2VynrD3y8w97y+ljAAkiRE095+drhY
         UMQlCZHWn9lJD1xy4oQOPcR8roKfF4l01D1TZtepNe1SrpV+Bog/Vq6UhydaMbOmQlGx
         9H11utg9VCBEJvaNFASBdOL6EzlSyc5MfqWrbKu/Vvm2CMQSTaE82lvPcye030SnwpjM
         1lJCXSpOFtucWx9HOejYSZe+/UuASXBxsiZFdj45SYIXoxY+NSW7w+3o+8lol6JAZeff
         lQhFOJrt+fGHgl4D7P7bXFSrXfGy2QaBQwjUbXOVzrjzIWSDlc2aZSk2UUS91n/X496s
         AP7w==
X-Gm-Message-State: ABy/qLbwjAbyIk6dG0Y8e0F1Z7Q/xGnEJytji1ebXJq7LAox/RmfK5FX
	jmRY+5Jzgdbb+cM/zHUX1QgJJ/vciCb3c5nLeQQ=
X-Google-Smtp-Source: APBJJlEpj39rdYbCgwABGEjRW8s2M+L1opn09fKuH9LL4eoGFAklexGDNvXieJi978Xib10HBnNR8A==
X-Received: by 2002:a17:90a:558e:b0:268:5c3c:8681 with SMTP id c14-20020a17090a558e00b002685c3c8681mr242844pji.4.1690487079775;
        Thu, 27 Jul 2023 12:44:39 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 25/27] openssl: add PERLEXTERNAL path to test its existence
Date: Thu, 27 Jul 2023 09:43:43 -1000
Message-Id: <2dda294698ea6bb797531cb4796af263fbf2f6be.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185000

From: Jose Quaresma <quaresma.jose@gmail.com>

When upstream change is better to fail or removing the PERL5LIB
if they are not need anymore.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 337ac1159644678508990927923ef8af30f34cd7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


