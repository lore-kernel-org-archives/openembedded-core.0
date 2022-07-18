Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F52CCA479
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:50:22 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.28066.1658155815349390085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=KRA7P9Vw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id bh13so10805199pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fxpJBEGf1Qz2eeO7UEVf2BMF/vtGa3Y1e3/h3fbP+fs=;
        b=KRA7P9VwgMbhQKE+p8VBN7swPj20pWWedR9FvptKcbgYhy1hnN2bht3qDLIeCGZwCQ
         KWrzLSbVKyWXGAcTgkkbyUeOo01eVfVY9nzIIqMbbJ5W1t3zpVe9Epoyi/eARdsrHTqA
         7Zfzb+xWXyAmCA5zjfH6eopdaSFmZWj6gsK/UtEfs3I5IIYcdBmwLwFivtLgYLoD3YZF
         igbmO3ghN1SrfuCIBBR0erHvDT/G+YLU2KLmkUQP3qcT6PntG96i0EpXU0tq8J8tGWUe
         tvvNOjuZzA/2eF94d6DK3UCGZq6NWUK15fCTV+Ja7XJWssbZBEvrYH6foSyd7W2IrONR
         666w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fxpJBEGf1Qz2eeO7UEVf2BMF/vtGa3Y1e3/h3fbP+fs=;
        b=UclITuzY1sbXn+gxVjX05vlwcoYvmvI8D8aAwzRks7Mk2qeoBSlMofLhnJmGTjM0K5
         32NwhGTR9LdbgfevpmqaIPfReDijzDJlWUWk0qMK+y3SHcO4hO38yjTXDk6FE1cua+bt
         LXYQfBghVrsI198FH6KXXlXKugCjnvJjuZkM41ramLEWuPKYltlGbpc2JtwLpg5aXVrk
         v0fAq5lkf47APZZBMTooGRJaOfs7v+YEM8WSZAhqdf2yj6pXC545+4X9fnz4pBosqje5
         WIrGuUnjg6x66/hbgxQKsFD5bFzRF6VNrI09TkQ+QPBSJ8I2MU+Tan8E1oxz6LhYhURE
         qlFw==
X-Gm-Message-State: AJIora86wp2GVeASkZUzXCDrv5XrWls1z9CsQH6zZ4V9Hkx7Hz/mh2hF
	jItXXMvOclZfirI2lUqqhsdh9ny2OhKyhJva
X-Google-Smtp-Source: 
 AGRyM1vAsKxje+xLP4Lf1ruDoFU4h+BPTYUox1SagMcmrkw2k6sDJkYOozkhvsFPjwLaxMXvV8hPSg==
X-Received: by 2002:a62:4e89:0:b0:52b:6c56:7aea with SMTP id
 c131-20020a624e89000000b0052b6c567aeamr6413345pfb.19.1658155814245;
        Mon, 18 Jul 2022 07:50:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.50.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:50:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/35] libmodule-build-perl: Use env utility to
 find perl interpreter
Date: Mon, 18 Jul 2022 04:48:45 -1000
Message-Id: 
 <3829ac3bca34a1aa5c54ba1d24d23af7a6630215.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:50:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168220

From: Khem Raj <raj.khem@gmail.com>

Fixes
ERROR: QA Issue: : /work/x86_64-linux/libmodule-build-perl-native/0.4231-r0/sysroot-destdir/work/x86_64-linux/libmodule-build-perl-native/0.4231-r0/recipe-sysroot-native/usr/bin/config_data maximum shebang size exceeded, the maximum size is 128. [shebang-size]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 54ecb2d3f2523293383103cbe590ebdd037ee483)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
index e2c79d962b..881d5e672e 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
@@ -37,6 +37,7 @@ EXTRA_CPAN_BUILD_FLAGS = "--create_packlist=0"
 
 do_install:append () {
         rm -rf ${D}${docdir}/perl/html
+        sed -i "s:^#!.*:#!/usr/bin/env perl:" ${D}${bindir}/config_data
 }
 
 do_install_ptest() {
-- 
2.25.1


