Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E939CD98D9
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 00:02:07 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.5124.1696982524570990478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 17:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=B6DPVuMd;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-578b4997decso4726347a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 17:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696982523; x=1697587323; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lBjtYDZnpjWReMkVIpMjHc163Egf0K9JEyeTrCgfXU=;
        b=B6DPVuMd4zxmctvqWFy3MWbZ5fVkr4LsGPj5jQtDgPoxcOhWjjTCc9BnAIXUCkhrim
         RqsWCE67npWXAPlBPEfP428luYhxipEwmmnsYKxP+KJgzDWwlXNl9J6f5Kk0iQR6qDDQ
         A80jEYJL6zEkrWhHB3fHNuttwx98QOD9v7Qrb49osI9GvtkF+AnCB4eoljIH2sFKEb3m
         +lodcmhYd9tAoPTvwTEX/+/x4TEP0VhLw8khtHyXBseTs5M39jJVexIPWQsPi1hD+wlK
         YCjbAK1DuvcwUJmaSNn3qpHKJYi8Z2bhz6OJX+WxKQiZiAlI6VEvUZujzKFcbO7/U3ks
         TbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982523; x=1697587323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lBjtYDZnpjWReMkVIpMjHc163Egf0K9JEyeTrCgfXU=;
        b=e/UUBsZjT/1BMa7NLD9dVnz6eMHiNtREPfsbEMMmVAZ+sX5uJIvKiu6clVh72w6cFk
         vzbvOt9/lxzKoTBd20VC/GyrTtBM80cXPmpQ7G3adLOe+/Z4x31dGX5h5+3OIBRG/uEg
         1B2ChUllBaoOh3mP9dytiE5l2KsL/qPI9ui0JjfIi06XvFsgXLBv/1celozOIWi7CnOP
         QVjs0orv3xQeQ/5km3swEAygJFUmsNOF9C/H4DyWTkIcu52A7WBbTVFFgAmtHvpOLo9o
         7eCBGkwlt9Oh7lrQofSTWu72lEIEOTD2GoerA9VvR4qGasM4LvO9Vo9WA3WFN8oO9m2d
         tx4g==
X-Gm-Message-State: AOJu0YzuvovM41733iU+vLWuAa1cbvycUNKcoSr7E4w+qpRcifdxTalX
	roEscSBWOBn5wJyad0vyUKBKjlUU2FTSz8wfNZY=
X-Google-Smtp-Source: AGHT+IESIQT1fkkSfXJuWnf5VQOIZ63w1xJfOuEbjsZ64kCTryLHWeG16Za9BwhVZQBS2Y7kimKjqA==
X-Received: by 2002:a17:90a:fb41:b0:263:72fe:3ef7 with SMTP id iq1-20020a17090afb4100b0026372fe3ef7mr17598970pjb.42.1696982523505;
        Tue, 10 Oct 2023 17:02:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm10758222pgf.87.2023.10.10.17.02.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 17:02:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 09/20] openssl: build and install manpages only if they are enabled
Date: Tue, 10 Oct 2023 14:01:22 -1000
Message-Id: <d6f638c6ab891a4fd9db49eeb6f9b5f2b0c3bbeb.1696982312.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696982312.git.steve@sakoman.com>
References: <cover.1696982312.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188927

From: Alexander Kanavin <alex.kanavin@gmail.com>

This significantly speeds up the build by default.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2b5ee583c62dbe381cd429da14ecbba5ea32d506)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssl/openssl_3.1.3.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.3.bb b/meta/recipes-connectivity/openssl/openssl_3.1.3.bb
index e41bb78812..ff9df693b8 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.3.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.3.bb
@@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk = " \
 
 SRC_URI[sha256sum] = "f0316a2ebd89e7f2352976445458689f80302093788c466692fb2a188b2eacf6"
 
-inherit lib_package multilib_header multilib_script ptest perlnative
+inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
 
 PACKAGECONFIG ?= ""
@@ -30,6 +30,7 @@ PACKAGECONFIG:class-nativesdk = ""
 PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
 PACKAGECONFIG[no-tls1] = "no-tls1"
 PACKAGECONFIG[no-tls1_1] = "no-tls1_1"
+PACKAGECONFIG[manpages] = ""
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
@@ -145,7 +146,7 @@ do_configure () {
 }
 
 do_install () {
-	oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
+	oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install_sw install_ssldirs ${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'install_docs', '', d)}
 
 	oe_multilib_header openssl/opensslconf.h
 	oe_multilib_header openssl/configuration.h
-- 
2.34.1


