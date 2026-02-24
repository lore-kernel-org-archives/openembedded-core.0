Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E1EF3C989
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:41:13 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21850.1771944070801130992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:41:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zhA0We8r;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48372efa020so44844595e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771944069; x=1772548869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCNp3qdsewFay75JVx8FtciQZDBvOm0yTwMlnr6aoMQ=;
        b=zhA0We8r+JhEQ+jX0p7uawwmdIzmc+Si1iUFh/+VV8vxVHLHPT7CQCKYQSxKh+3Zvj
         iz/oMDsl58ydUVx+/pXtxZiXL1K+tIGwe95agv57e7SobpeqrJ9D2DDc8z65fkBrfg8f
         izBni6TS7RhHnVeoof5xV40KdBwwFxx8I9z+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944069; x=1772548869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sCNp3qdsewFay75JVx8FtciQZDBvOm0yTwMlnr6aoMQ=;
        b=VKEE9M0tUaO8ZZBtC0v4MHzpXdFUh2WyD9d0R9iLAhsZD1EnKqxjn6ImnnI2TPmH24
         LiIcwYcc7+Y3/JQOA9yqfoRPmwmERRXPoFCEva2WS18i/9ric0WDWEL9xLeT/aXpb/Gm
         gw12XSkeuxmZLsRyR83kWpcQm1nom0w7jBvAMDn7xHF4G48g+pFhEBPy0XdsClXl0uVZ
         Fun2JdEeHIEch+QJIQdvxaVaWsCrWnb61HXGD7+XM7yQiYlpsKEn/sQfLXydlwSK9H/K
         5jkJ48ue2N1a1S3NAEocWJwsgqvx2klf4itEJX5iS+84mlPp9s8pemaZ8BV0v8FLBUer
         YX4A==
X-Gm-Message-State: AOJu0YzdAbUECcq+rHj9dCdiHM/NZBq1JMeUQaLToRQGrj50VLEd+l3Z
	fa98iQzUxIvVhBSkFG9Wv118BdiJGiBf1YYv7rH6M6QhQSuZbfSuyxifoZMSVhqfituoWqP/NKx
	VmlSn
X-Gm-Gg: AZuq6aJ1hYJXC3Chp9j1Pkg1ORpenp/jkE9RlV3eAE/Ss9vG/0kZ7oDSDlq9WpWhRZD
	vtFsbFIULJWLVbcD8qZVwsCY3Pr9uKSYMy9xYg+sg7VbaicIiKWdSDfS36YW6EFHi5hFEuxX3YA
	WHNh1/2MKwuZAeg7OH06I41iA5oOL9JS1qmyYwu095GASdiNtImfhLL6k2Cl2i8A6o2NM5ZlSqi
	8UFKoGSwWDYBB03szblbFogFxBJZZaANXU5Z74QiN31prz0D7A1rkSF9P5l1O1LZe9F+Hzv2XpS
	IKsAHCfEr0AOPspINRAf2S1Zq1w3IhnJeXpH6x4l6aaqNd9WmQgJAbfvyerx5Ja2ZcR6MdDblPc
	tRsOjKGTy5XLNZ3FqiJ3HxURKRoBPKrrDkUf8yEJgIbv64+4AqLGoM1a28lkDht3AFm0Fy4efs4
	mcS1OLpXNxhGDIpkTp4BgWT/aFxp2ubQcdSD5JNWVa/kxulw/EtZFuX6mNxsf0b/OzTRDvTwE2R
	dQMNGD665cYwUre2SEtErcCYW5hm83fyQ==
X-Received: by 2002:a05:600c:8211:b0:483:885:f0b0 with SMTP id 5b1f17b1804b1-483a963c196mr258491565e9.35.1771944068834;
        Tue, 24 Feb 2026 06:41:08 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff6dsm28711195f8f.25.2026.02.24.06.41.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:41:08 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 5/9] libevent: merge inherit statements
Date: Tue, 24 Feb 2026 15:40:58 +0100
Message-ID: <c30525bd964c37bbfbb4a5b59211ccc75839aef5.1771943829.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943829.git.yoann.congal@smile.fr>
References: <cover.1771943829.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231857

From: Pratik Farkase <pratik.farkase@est.tech>

Merge the separate inherit statements into a single one for
improved readability and consistency with OE style.

No functional change intended.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 99792ab6ba188a7623804e587edf8de23690ad3f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/libevent/libevent_2.1.12.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipes-support/libevent/libevent_2.1.12.bb
index 2fadf109432..4fed0506db4 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
@@ -28,13 +28,11 @@ S = "${UNPACKDIR}/${BPN}-${PV}-stable"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 
-inherit autotools github-releases
+inherit autotools github-releases ptest multilib_header
 
 # Needed for Debian packaging
 LEAD_SONAME = "libevent-2.1.so"
 
-inherit ptest multilib_header
-
 DEPENDS = "zlib"
 
 PACKAGES_DYNAMIC = "^${PN}-.*$"

