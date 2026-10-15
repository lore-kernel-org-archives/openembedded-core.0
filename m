Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9495BCC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:02 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32830.1792040639396385249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eyJpaLMj;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a17baef589so14326655e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040638; x=1792645438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ig14qbGi7blEt3YBga/eJ4vrdZfnH14T7Ei9E3kFZl0=;
        b=eyJpaLMjM+D8aUZuh3VmsFvbOo2Yyi8bAFHTJn3lm7BWeys9vDgJMJX6sZedLxjUd6
         UlGbNbbih6mdNOccGq94xAhx3JbLic8Tu7G5xouc8yMzvGK1Lrnj2JewpZEXYDzsTD7z
         LslKH+AyG7Rssd+MuC3bBak6GoqBV2v/E6n8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040638; x=1792645438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ig14qbGi7blEt3YBga/eJ4vrdZfnH14T7Ei9E3kFZl0=;
        b=RXYfxOQaFIZ55m2FO8v9qwf21vEDCj+7PswrTthimCRs4w2ptwAmvdl9L9qbCZAGT1
         HM5PkrIwJHkbu4w3bm75QwJp5NspKipsbo/T4rE3E/H3b1iXR2qCt7Xuffdb3aCjIytE
         8zqtL7LcJLiDQX+wOkMC/jCTOma1qGl5xi93rV5fnmRyqv70Ne8t+0qXjuWjmyGLApYY
         VMo8ZzFUGajTdfKanYN3JajB7Pl4PhR88azXWafEaXnUESCAcpCXBnkW5ymj9VU3Nmsu
         egFPy46/6RcQogp1dmJMZrftqyCZaeOMip2F7BqmHPo6mP18XAkiJ3RdwTByaCe7RA+2
         QLHA==
X-Gm-Message-State: AFq9FYL8rBShbYIpjDdHS/PVN9OU3AVUpzFNnwEmnNM4+r52HE9ukvtA
	hovJb8ElfrmQsxdGC0d1JbQFbqMBuhuzYcAQQnB4HZbNJeSW8ms20P8Y8N/GYJgUDq6Pm490ik3
	PBneFxFE=
X-Gm-Gg: AYBFou3LN2yN5GPz536vUsEjJuDtTUs0gF5K1XbSAmMYjReVnhnrMXpa2mbAAek7mPO
	kUfzOAdw/iJkRHiaKWpdSWdyAGga/2hNIHHFMP2NyS/JVdRuft53ERPFl0yt8uGWWVdtJQ4wcnD
	QSE24/Xow/dEPas+PrzoCeDxsgtp+ElPlPuXv6M7W3uNDNMr4MD7584Qx+EOqkSX1jBebvCpglP
	rvA63skXD9Kr8vUWrzu86gsTsRtj+FXpBmJav6wfQsXXrISRf+FVnqhj9Boie8zJXYJ0KjRfatP
	OTqx4QwZikg37NILsdXc6Ywx0HGWbyc+PECsmg4Zfx8zE1Cm5IVRY2Uc6Fyxl6rOsDkgDQxBZch
	0xwnXSu8EiwqlQBQWV4nq2C3qprt2KkRYgNsc37OvOty1i2rN7ZXLT3YH5T8gtSByufGnzvmhkv
	H4FNjUkQv+rODKpDTFlGTq1Ej6MjCbv5omKDAZgl0YtFCKDj0v4Pe0nhxa9EeCqRW8tYgxiJmkv
	RSkx2HzazzdPAbDYtcJjhnsMnA1+CkfYUND7kwJmuGKHk/1hIOGXmjdYNl6+J5bFvsEKK32qQ==
X-Received: by 2002:a05:600c:3e8d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a18e4aecb2mr327714315e9.32.1792040637596;
        Wed, 14 Oct 2026 22:03:57 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 30/55] curl: set CVE_STATUS for CVE-2026-12064
Date: Thu, 15 Oct 2026 07:02:53 +0200
Message-ID: <52d3f4713db2c43479e40dbef76c30c4bf1d9777.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247828

From: Devansh Patel <devanshp@cisco.com>

Analysis:
- CVE-2026-12064 affects SCP and SFTP support with libssh2. [1]
- Scarthgap keeps libssh2 optional and disables it by default. [2]
- The status reports unpatched when libssh2 is explicitly enabled.
- Hence deferring the CVE for now.

Reference:
[1] https://curl.se/docs/CVE-2026-12064.html
[2] https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/curl/curl_8.7.1.bb?h=scarthgap

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed commit title]
---
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index f3b1c32e933..ba2968fc6c4 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -61,6 +61,7 @@ CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', '
 CVE_STATUS[CVE-2026-8458] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotiate-auth', 'unpatched', 'not-applicable-config: applicable only with GSS-API-backed Negotiate authentication', d)}"
 CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is not enabled by the recipe"
 CVE_STATUS[CVE-2026-82209] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
+CVE_STATUS[CVE-2026-12064] = "${@bb.utils.contains('PACKAGECONFIG', 'libssh2', 'unpatched', 'not-applicable-config: SCP/SFTP support is not enabled in PACKAGECONFIG', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 

