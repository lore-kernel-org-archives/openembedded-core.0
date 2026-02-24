Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D97F3C985
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:41:13 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21675.1771944069692100797
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:41:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mU50dk7k;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-436309f1ad7so4325262f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771944068; x=1772548868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMZxVMY6WUKKbAqdm29skI2ipmMDKSK261pftI8jRos=;
        b=mU50dk7kPQiXbDuxRiKSM5LvzO/G5K5/hbeDopRYyX+eZZGqige9S2PNySZ7UVGvO4
         hUcqj3ulp3DBbKERhqX4cMMNVMcjXb9dJHsmj+QPE6x/onaf65NnijIC9IPsz+GUdE9a
         bzgs32nfe3Ms7vYd7Awtz35ot55fUfJhWwcqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944068; x=1772548868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BMZxVMY6WUKKbAqdm29skI2ipmMDKSK261pftI8jRos=;
        b=Rc5pODOWcn7cjXjgWzpvgmbxM1slDbCyswcUJdOZf+YnLRqfd37mGfaDKR9RFPwk/8
         oMLLYXNsJ4LQjYDhjKT3IJHpEDN/o1s5pUbFKfbkYsRrfqc1/PUkGR8PDptigpeQdPdy
         WFo0BJoGCxAs8IkEn7QP0FCvutQWCxDQblAGiFID0kA4/ajjItW5CN4z+bKtfdwmjgmg
         F2d12/jKe9vEoPPxmOgLhYQ4CBOdgLlK8G04woZcyHmA0Dsukg+lfF0izrkehmuKdyX9
         hzuAofa0qj8eWYKRgMLR/2iEM6mnrPNw1hqIKcxxWgvwDpIb68qevXwnQ9xtqbjfLdZy
         zjiA==
X-Gm-Message-State: AOJu0YzsAR1daPTb4A6XiZYTyV+3neF1pIv5VkQQmVSPoaMqyZgnWnMB
	afqv52CQEUMYh/YKmDNTTHtfQIt5qttMHU+dlotN6TaRL5uHiffwThsPkrjqtQQMpZ7Juarn1zG
	0xWHw
X-Gm-Gg: ATEYQzwMGBGc9NA1+5UPLTd+Pl7cX0opzMisC/b3AcEUwh8Tjf2HodWx3ceWl+9r6cG
	eB9wfrQuj4C38Y0emhIicC7PF4YtXDxlx11FWbWSVy8AvLiTNFzg5ZhYJI6H4y926jYPrK2Wi8G
	CLnrGTj7ELA8ZzXrVf9mx2TooDgjnL3h3JuaBFqdr7dMyXCbjy3Yi0LhM7wtCXPhe6Gany8RZiO
	UC91CXJs8/tP3SaMXz3VNRbC+7uQY/BDJbawKDnnsb30TZWmt5qUCBHVzi9/wtujP81DDwlcV2L
	CiVRGmmd6FZrX7oIRYMmGbhu1yQ9UM0CQJ8Yozp6N9c1l0/KGsrLugpjXVensdJrHUdhYkfzbrv
	MyjhljkEP3/90jVvEE+eRbEmMIS5rIHJ3CG2I4auSx2hVEC48iAZfjPwqPOGG0cFVnuOpeezMEw
	c8hYJi1/O3jkhuHT260jBPoB75XXoycvm6R32T1r886ZxtytL+ABHnreM39O7r9E+KZe3lMvB+N
	g17uTUmJ9WDE5nu363FEjaoifq9yFLHcjqGbq2AbNLW
X-Received: by 2002:adf:e346:0:b0:437:6efe:94c5 with SMTP id ffacd0b85a97d-4396f1564b2mr17103262f8f.2.1771944067700;
        Tue, 24 Feb 2026 06:41:07 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff6dsm28711195f8f.25.2026.02.24.06.41.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:41:07 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 3/9] gnutls: use libtool to install test binaries
Date: Tue, 24 Feb 2026 15:40:56 +0100
Message-ID: <9c8e75b1ccca70e5ce12f0c0fb3c48354c194088.1771943829.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943829.git.yoann.congal@smile.fr>
References: <cover.1771943829.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231855

From: Ross Burton <ross.burton@arm.com>

If libtool builds a binary it's best to use libtool to install it, as
otherwise you might install a wrapper script or need to make assumptions
about where libtool has put the real binary (as this isn't always .libs)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 675e8c730132ae02092400a0f4f170782afdbb60)

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/gnutls/gnutls_3.8.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.10.bb b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
index d4722f084fd..5430ee20856 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.10.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
@@ -71,7 +71,7 @@ do_compile_ptest() {
 do_install:append:class-target() {
         if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)}; then
           install -d ${D}${bindir}/bin
-          install -m 0755 ${B}/lib/.libs/fipshmac ${D}/${bindir}/
+          ${B}/libtool --mode=install install -m 0755 ${B}/lib/fipshmac ${D}/${bindir}/
         fi
 }
 

