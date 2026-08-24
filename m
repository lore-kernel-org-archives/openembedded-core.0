Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1403AC5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 09:59:42 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13312.1787565579004049874
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 02:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d/zAh1do;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so1696712f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 02:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787565577; x=1788170377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G+a/PZuQu0GonnbUl+u7Lc4lfFI602cEbCqI1Wsel1Y=;
        b=d/zAh1doqBHZ9tigMAKwJ83x8hxngoDlEPvuKQ2iRp6ZXIa0IDZBldp5Pbsjk82B1z
         1zwWIZXYwGFujvQT1K0fmwkZ74iJr7Vt/mPu0ff87pQq9Kt2+jax9SZgoFtXvRJu9AdC
         voc/OcOozlGCB1bzMpY4dWCkh/NS0fL7YBlM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787565577; x=1788170377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G+a/PZuQu0GonnbUl+u7Lc4lfFI602cEbCqI1Wsel1Y=;
        b=XvAtuxwDzFgX1D5mijWwr2arFtJiIHhnq3pm4aAfFU1vCJMvmjnfraRUc6//6F64M4
         liXDOXMSW/o2aNqx3TJBPfn3v3/Yyh+1I+T3uK2SWqVxmIfZD04/mbRQYzTNJhJw9H3n
         2tE7e+Oi0hwb363PVS1MsLmQmuoR/js+A7UFKQEmAf/okXjXu/ScPV1TyOcoGM8zJ7K6
         qDb8qbVkIK+0NcS6At8Q+yDUTPgzgAHnVvWIRAq4n+bShGpxl41fZiFskltH37GqtNOc
         Q5mgDVgrTpHRlYUH/HQpdYSKOympAfTpOBo3gYBX8V1Ic2KoIYO5xnm3/iMXgSMhI5BP
         DMPA==
X-Gm-Message-State: AFuF++nvNEIc7dDt9KIQ4uQY0BqG+MGRW7CQ3JYgIKSTXoSIUM0jMwzD
	J0rdI3kbJ3cH6G+yTNelOsoxtgLw9HbZK227rJjSNGKdlq1xHuoPLBiSkCsvEMG5bcCEa2L7vnI
	BBPV2eyk=
X-Gm-Gg: AR+sD10AA6t19PZtmQtxO6Ni+6X4clM3epLKSoO+F4h5eWexIbQENurRmHUHXGs0s9j
	J+ER9d2CizEn2BbthgQmcZObrjtlRTv8q1gilkuYZAig8JeXb9//l0t+oepC1nYuVQY2Ywzf3Mj
	22Xi0kg1kS/+4h4qq/ykrgAGJ7MKBQo4ShNpSdROT/sf8uzeLDU2USGLUmWgp8ryHtbNAJtFIF5
	bUgAymPnf+L5Cw5Ryo5G0NJHgbDH4pH5F0MM2friyYExMAXca6BsOoDQPwbIBo7PefyJW69eBos
	bTgMw8bfQ/g/Cm5GqQ6yl5PyBeaW3LCdoWVtFqIPj5a3eYyhuoc9O1cEKBM8ihNegYJKUtowo+E
	63ZlwUcJlB6oH/aQGQIZwccToSs4BUp+COaG1IHptHria9nPij0Gypigcl9ZCF9BZB/DCSuyi2Y
	WwKYIpTxIxr19czdjE81Kf2Y9YqHQrv/UqwdhEQSF2U8R9CJ9pBn90eiHd0ZH02ZI18B0zuIUqi
	pORlq99Pe+kw+y58g==
X-Received: by 2002:a05:6000:200d:b0:47f:f43e:f0cd with SMTP id ffacd0b85a97d-482c810784emr16320782f8f.4.1787565577107;
        Mon, 24 Aug 2026 02:59:37 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5c5b:7a15:ab97:8d7f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9c0869bsm7687850f8f.25.2026.08.24.02.59.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 02:59:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] pkgconf: upgrade 3.0.5 -> 3.0.6
Date: Mon, 24 Aug 2026 10:59:32 +0100
Message-ID: <20260824095933.2906404-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824095933.2906404-1-richard.purdie@linuxfoundation.org>
References: <20260824095933.2906404-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 09:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244080

Changes from 3.0.5 to 3.0.6:
----------------------------

* Command-line behavior:
  - --variable accepts multiple modules and prints the requested
    variable's value for each module, in argument order.  --path and
    --print-variables remain limited to a single module.
  - pccritic no longer reports the PC061 style finding for CRLF line endings,
    avoiding a noisy warning for normal Windows files.
    See https://github.com/pkgconf/pkgconf/issues/587.

* Build and portability fixes:
  - Improve OS/2 support by exporting libpkgconf APIs from DLL builds,
    recognizing OS/2 drive letters and path separators, comparing paths without
    case sensitivity, and using binary mode for redirected standard output and
    error.  Patches by KO Myung-Hun.
  - Declare pkgconf long-path-aware in its Windows application manifest,
    allowing paths beyond the traditional MAX_PATH limit when long paths are
    enabled by the operating system.  Patch by moi15moi.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pkgconf/{pkgconf_3.0.5.bb => pkgconf_3.0.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_3.0.5.bb => pkgconf_3.0.6.bb} (97%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb b/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
similarity index 97%
rename from meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
index 79ac3208d3e..471433e7b54 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "3acd3a8a3cce65a8d620321855d92fb602e026cbe8e13ee36bdec58483b59ace"
+SRC_URI[sha256sum] = "c88a653fbabfa2a5857a30f6b6ad6c40dbacc3b7c72cc066e5c7dc4571cbddaa"
 UPSTREAM_CHECK_REGEX = "pkgconf-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar"
 
 inherit autotools pkgconfig

