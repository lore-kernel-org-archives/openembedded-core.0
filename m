Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CDA9F3C98A
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:41:13 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21848.1771944068701258503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:41:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bB/4HauP;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-436234ef0f0so3695212f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771944067; x=1772548867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEDkYr68XXiM8F2X/8AfYaxxbkJhIDZ58bG5tIJGidY=;
        b=bB/4HauPOKRCbOtzhqWB1TgDXei9BZz17P81NofI87+ir1fA71OQaylmfP0zZHGvpR
         W+3BhCl9AWyjueLoz+V91Z43mAS4wVmwb04Fj0g+vpGIO6oBBpDRb2vCbweXyEB1/8Sr
         AWyGz73z68pMZE6qEbjU50jEBYv0mmdTTbDAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944067; x=1772548867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tEDkYr68XXiM8F2X/8AfYaxxbkJhIDZ58bG5tIJGidY=;
        b=Xv0JGI4cM2c3ASS6KRw7bqDSo5pZFF9Iuw03tFISuWDfLrEZWTMM0hyzBDvTeryZOl
         /qqi7ZlNyyWplLWWYy8EBLTtZQ7UdxT+UEZ0RGv2ChmFIDld2DiLbjCt2EiQatl6fmu/
         4adTdhDro7LF9hpOXb8+w4/EB66NDEKU+3RS0U/Knp/+ESVaPU1hze5rNApEklfDsOuZ
         gTI3/qOY/uDZAmUH28+nfaJbbwe17L/JPNf17oM78AjRstF8Dte8mOiOR0/wRP1JD2rC
         wT5EcpdP4GF7wlL5seJwgDcYRokJEbFo4QO9hoIdoJH+WgSfFXpeoB1X4Q69MROyjihb
         etcA==
X-Gm-Message-State: AOJu0Yw0GMCq9o4hlc3DpqVCXfqtmr3wUIEOhV1vq3SpGAU3C98dw5Fa
	mc35IyuUKC++igb4uXAX939yB7YMafh1fMO5PPEqphu3SuujUSzFLWutg9AdqYTDv5lKfJy7H/U
	ECOFs
X-Gm-Gg: ATEYQzwqcEEowtw5gBKlecSm+hoWWZxzyaXITuJVFLnuBPJx2hy/gjfAeJIoY35FCH4
	ORO40/LzWoxU1x5BjHyXyDcgBNrEsxWqeUvxfcprPni64UFq5p9MzMbFLroldMNuEZyXKtT9ycy
	5+STANtiPH9D6KVVprYAKO2jo75MfKSoUWU+NGthBsZNMbXHa/OChf3hNP6HHpuE0pIGyC+MQTW
	fQKVJPZWVt/vQ3Rb4ZOYVMt1pyYNo7BdBG0NGroLngbE1LM4vyGNaK/ZDA8Dmb75NYrpU0iu7xX
	bWSmYODUUWAhnJYe5qZb/3D17al9BsMLG+pSJswxMzhh/5XMjrQWwD26o99DGGjiV6Tdaq/MNsv
	x+Q361L8kjgimPV1/+ear7TedlfPW9/ENXs3YGCTEgHY+PS90q7PSwBzD78kzvM3xVq6dwaLF2V
	c7jjezH2w9TDCIB03mhM10JGCiiaJfPopDKoO0V1guxbt/tbAnhSVzQ8C1ZKRNW0p009wsPbns5
	DwB4QArWWgInJcTM+0y9HhfcI+pMYLyDw==
X-Received: by 2002:a5d:4c4b:0:b0:439:8bee:b985 with SMTP id ffacd0b85a97d-4398beebf33mr1732257f8f.54.1771944066739;
        Tue, 24 Feb 2026 06:41:06 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff6dsm28711195f8f.25.2026.02.24.06.41.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:41:06 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 2/9] gnutls: fix postinst script for ${PN}-fips for multilibs
Date: Tue, 24 Feb 2026 15:40:55 +0100
Message-ID: <46c5252a2b787b1672ab8fc8e7fcffe798179b75.1771943829.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943829.git.yoann.congal@smile.fr>
References: <cover.1771943829.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231854

From: Liu Yiding <liuyd.fnst@fujitsu.com>

Append "-p" parameter to mkdir to fix failure like following:

When use "gnutls-cli --fips140-mode" command in multilib environment, it shows library not found error.
  root@qemux86-64:~# gnutls-cli --fips140-mode
  library is NOT in FIPS140-2 mode

And it was caused by lacking hmac files.
  root@qemux86-64:~# ls /usr/lib64/.*hmac
  ls: cannot access '/usr/lib64/.libgnutl*': No such file or directory

The reason is as following:

  When '${sysconfdir}/gnutls' was created by 'mkdir' with lib32-gnutls, the dir will not be created again by 'mkdir' with lib-gnutls again, and the subsequent command will not be executed, so hmac files were missing in lib64 environment.
  ${bindir}/fipshmac ${libdir}/libgnutls.so.30.*.* > ${libdir}/.libgnutls.so.30.hmac

So append "-p" parameter can avoid this error.

[RP: The -p option doesn't error if the directory already exists]
Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 7b51969967e13779ed2f5a3134ff89f9f4ad8af5)

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/gnutls/gnutls_3.8.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.10.bb b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
index b07c166c0e9..d4722f084fd 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.10.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
@@ -91,7 +91,7 @@ BBCLASSEXTEND = "native nativesdk"
 pkg_postinst_ontarget:${PN}-fips () {
     if test -x ${bindir}/fipshmac
     then
-        mkdir ${sysconfdir}/gnutls
+        mkdir -p ${sysconfdir}/gnutls
         touch ${sysconfdir}/gnutls/config
         ${bindir}/fipshmac ${libdir}/libgnutls.so.30.*.* > ${libdir}/.libgnutls.so.30.hmac
         ${bindir}/fipshmac ${libdir}/libnettle.so.8.* > ${libdir}/.libnettle.so.8.hmac

