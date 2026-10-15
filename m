Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60598CCA462
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:03 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32443.1792040638896639684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Dh3ZEwvO;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so41258615e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040637; x=1792645437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZwjP5jrqukmG+vsIzKxD1RuHLQGcHokvEKFQxJz55aY=;
        b=Dh3ZEwvOq+AoBTPiEA9hoBSQuL+P4IdPenLSk/ww2uFerU4eZUY0B8p92vpsjwqiz4
         0t5nZ46PKVW2vGXvBUP32bby8FbqvKvohY41YYrmB7gKNGabVz2SVZXQljgPnr2Xfak1
         41ADmB5tsr8gf+23bJxn17vvrW8F+lkygM1Lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040637; x=1792645437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZwjP5jrqukmG+vsIzKxD1RuHLQGcHokvEKFQxJz55aY=;
        b=iS1ldWwHr98mx3Fymau3p8swOkp5EDh+n33wTu39cB2uH0B5nkgIA5x7iT/pZdtMNN
         4LQ6xUlALNoqSLYAduRcl2mc/HDDCAG8RZOXRd7bwtfPzHqzyrJseqG4EsMfVoJCaSkX
         gCILhisMQHEtk2I9LIXQTsrWbB9T8joDlGVCH8CPPzqObTP02nUrnUbnaUvpznMtr1Sq
         C+/DYA9eR++VuZdDWJi2YWeUb4ymGylgjKn5f1/E36YegM3kuE2kuahhuT0fdrSC3LQq
         UnNfOr1g3w/i08pV+gJ6Kwb1Be1u2Be45NykXaf+zo9e0m2D2OvWG/+8zEP/gvizLIjX
         FhZg==
X-Gm-Message-State: AFq9FYKp5IUubTGBHmzI6TVi61T9eJs1IJUfqromsYG+ZJaJuOt4/s/w
	0PA2D6ywPBa6ding8K9BqQxyytCaJ00Hq5veXfVdvL5aHk+Hw/83jwLkIv5WUsiJ/D3AcEMZ32P
	6M3ugw1E=
X-Gm-Gg: AYBFou1WvqOrbFRtM42sk3vpoOgwFStBmVagwO7LjTHr5/qno744iYMMGIyQ3xN6evF
	wJOGh14kY879XYI24jUJLsO12VczCpfBCI0BHKZk65kDZKi6tihCaljTmUuu1OgzUPz2g1aGTEa
	rXHBcNWkv/SwxX+7wKGfin82Bemi37FXVPLI2HzvqLpIK3NILQoNyD1ORXkaesbQdd8Zf/06F39
	+RLwE8YmW25xQAFyltATHMoi14wKhF+a+S6OBw1iYTePSZYnmZDPki+G5PFkIQZPPYvNKPM29Wz
	uPE+b/idbJyFKp1x+c9SQJC+jCVL5V3mAiRhZNhrvtt9hlVs1iy0mF6KghWO+yyZaA+88c9AI8M
	uQ3v3V2gyuHtKh4pw9D4SMSac37iFDylNUsqcSfLSFa1ylvDybczp0zejueTdqYYI8STAyraStO
	SVQ0ldS9TZGPhVvb9MCnA8v1ZSHnSnmc0qHuDky8tgm8LU9Sgpiv79wPvuD+GHZAQVThmBrNhZ8
	r0tOMMSe6tYWZtYXxjqEtc6ZjmNgDkBWTFxjm+TRoliYIW/+WpvQHkoi7PU6IFMhkp+IauA7g==
X-Received: by 2002:a05:600c:8518:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a18e4a8ca6mr322509355e9.12.1792040637041;
        Wed, 14 Oct 2026 22:03:57 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 29/55] curl: set CVE_STATUS for CVE-2026-9547
Date: Thu, 15 Oct 2026 07:02:52 +0200
Message-ID: <9953a743d91eb59b3a3932d3544e5c8119f1adbe.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247827

From: Devansh Patel <devanshp@cisco.com>

Analysis:
- CVE-2026-9547 is tied to the libssh backend. [1]
- Scarthgap curl 8.7.1 does not enable or expose the libssh
  backend in the recipe. [2]
- Hence mark this CVE as not-applicable-config for the default
  Scarthgap recipe configuration.

Reference:
[1] https://curl.se/docs/CVE-2026-9547.html
[2] https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/curl/curl_8.7.1.bb?h=scarthgap

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index ade637adf37..f3b1c32e933 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -59,6 +59,7 @@ CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'n
 CVE_STATUS[CVE-2025-10966] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
 CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2', d)}"
 CVE_STATUS[CVE-2026-8458] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotiate-auth', 'unpatched', 'not-applicable-config: applicable only with GSS-API-backed Negotiate authentication', d)}"
+CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is not enabled by the recipe"
 CVE_STATUS[CVE-2026-82209] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
 
 inherit autotools pkgconfig binconfig multilib_header ptest

