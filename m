Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C4AD3B9BE
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 04:12:17 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.64891.1732680732522886928
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 20:12:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=odbnQUxp;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7ea8c4ce232so5568709a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 20:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732680732; x=1733285532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QF87IdLUt9OH85ynMkiwRlV70diyi+gR7IUWpkgdjLQ=;
        b=odbnQUxplNF5BdFuf2zQIW2bM5O2Bvp02DFsF2K97shHMLTr8N5oJ2bBj3aK6v+7Gd
         W3bUSMYstJ8C9ox4+xdDQ92nSMoOlUCH5cXzvc7KdPjJoIIGjHr8o5RxgRbxdQ0XXgWt
         lrilhm+okBYeDSunihuWPFCF4DsPDC7hlE0P2PL7hEFw5XVav14jzF7E1YNbpuaFcbE+
         xsx9Krq1TikYv1p8vKhqUVAfXK42BmFT1oZoNsxoIdswouftgIihv/ZFDjvB2eH78gGI
         nIqPHSSghTEg+J9uYvrk3hbuHSaxtdh9Ei7yt2Csa0PS8ddPD/MDr0r5e6CJZ++hm1Ah
         OTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680732; x=1733285532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QF87IdLUt9OH85ynMkiwRlV70diyi+gR7IUWpkgdjLQ=;
        b=PJ4Jt93u4CR2HtEYsTfL13aSbgPsUPXgq2zMgNogFxTtVGvuUYDZB1bnziz7+gL8Kz
         /xa5YNvcymyu90NYQOIwaAvAnDdpniRklwVfFxgrn6ntW5AdUSN1NKHbTuNRzAGlwpDr
         1uSOTXbPNyobeLTEuQGvN/H7XjsoG0QSsSxc1mWc7nR6bWPvboCvqr2puGOyjsz7vvms
         ZXOhteTWHaWIaPmy9GcKTSnk1yuWPjJGHFkQ8kOWVPrtclT+wUQOSFVivHQ0eCCZBZyw
         WLLm9QmGEPciZiRJjQDcHid/fx3leXDKap3gUTkJHxqWzFbuVLZE49XW/V8O1JTHWs1g
         OZFw==
X-Gm-Message-State: AOJu0YxC1fy0cPLEoViBvYJF2lj9XOpNRglJ36fzpu+42FumkzdBECxA
	CYFbbjtptzltdtdNrHHx+C1zje0q5RfOhEY0Wn2akr0gMEy3iknH5zjXhGgAZjiCMbNm80M4RnT
	D
X-Gm-Gg: ASbGncu8lwLllCJzldnx6b7kHZvKbvoF+Juv8ndW0zq0LdNsMnRzrkQjidpSzZV0p4m
	j56KJi7QbDLBCnMr2w+Sg+SWE9gG0lwYSYc8jh2mc5bpSq4phNfEGod79yjTNT/FoMfAmO+vXdt
	yVy67sIQkqjN+Jw7f8d3LIooVycvYesjX0SYeN+BchC6iWxZSi+EysLf1cENv/njLCKyps4TNbj
	swBek/02qYchZBOlJ8dqlNIffYirVwj0+JFA2w=
X-Google-Smtp-Source: AGHT+IE0bssANU7s1jJocPpAdCIVKSylDHgKSEobdEpNwpVW6/0Us4f5y0jSm6y6+dKI3WsemEKRsw==
X-Received: by 2002:a05:6a21:3289:b0:1e0:d14b:d54c with SMTP id adf61e73a8af0-1e0e0b58d0fmr2954492637.30.1732680731725;
        Tue, 26 Nov 2024 20:12:11 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de485c84sm9240796b3a.80.2024.11.26.20.12.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:12:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 13/18] openssl: Fix SDK environment script to avoid unbound variable
Date: Tue, 26 Nov 2024 20:11:33 -0800
Message-Id: <a57192131cbcb65e17b11f47aa0f90ef63258280.1732680538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732680538.git.steve@sakoman.com>
References: <cover.1732680538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207907

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Avoid errors like:

buildtools/sysroots/x86_64-pokysdk-linux/environment-setup.d/openssl.sh: line 6: BB_ENV_PASSTHROUGH_ADDITIONS: unbound variable

by setting an explicit empty default value.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5a2a4910a22668f25679a47deaa9e2ed28665efa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-connectivity/openssl/files/environment.d-openssl.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index f90088aab7..aadf1edcb6 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -3,4 +3,4 @@ export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
 export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
 export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
 export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
-export BB_ENV_PASSTHROUGH_ADDITIONS="$BB_ENV_PASSTHROUGH_ADDITIONS SSL_CERT_DIR SSL_CERT_FILE OPENSSL_CONF OPENSSL_MODULES OPENSSL_ENGINES"
+export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} SSL_CERT_DIR SSL_CERT_FILE OPENSSL_CONF OPENSSL_MODULES OPENSSL_ENGINES"
-- 
2.34.1


