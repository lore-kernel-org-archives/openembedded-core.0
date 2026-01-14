Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C678ED30CF6
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 00:36:00 +0000 (UTC)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.165.1768350958202269095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 16:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ievb0nkH;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-121a0bcd376so6229814c88.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 16:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768350957; x=1768955757; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lguc/yXTzinhLvplsKCqLPZ0noko3vjgA227S9dM8c4=;
        b=Ievb0nkHB9DxOQR2HbZ36+ysbHn1arnmYx9n2q5uaSc2rTLh0RUedQG7z1xRsKZ/3T
         OL+OkMc7HyCQeZkDNtqpW81GQ1jKeph/O8FN8VoriGV0R6TAzEd+HtKQySB+X5VHgnKO
         3Aso/fO5hTonwDT0JydXFHuVL13QhEkbVry2Kjf0MOg/8iWESDYHSyZ4T4//tJ04ThUD
         16JxqwCNzUNghWYQrBrE7NbMBcf4TSed/qDVPguHsmIsMGsywoFilJeb1pvjxK9CJ9ql
         r2oMDHBFFwZ7Qxpz7bH52mEOk/3IxuRddSYPiCv3ofN7cj6+u5y80OQZY6tZAVPUZqBl
         uDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768350957; x=1768955757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lguc/yXTzinhLvplsKCqLPZ0noko3vjgA227S9dM8c4=;
        b=VBcM+W/gRvSDMdOdbxHcddNT9Cnk+CrAZRF4R6LtCM/HblawOd4NCz05TbL9C/i6F/
         rpDkT4TOn4cRHnehLdLK1b7ZwDUfOVdjr02Bfgs4zG6g9N8OZcGhlsXMJ66RQRCCPhd3
         iuR4ZXd+tLVmDT8xFZULfn1CQk9AAmNl7Q0klJJYA/R2x0gM9wNouriw37ygcLOK4SA/
         tzAj0mg9kVZ2Sev1cgt19i/13KeUey2YhT3rLK3h9RUDcBRwmIiSw+iB/6y8KI53Lige
         Izrt9Y639QF5WC4onqmGT/3wHz/zerudBD7bf1bbP4lqQABS2f+vZoMfiHbLr7CLqbjx
         Gibg==
X-Gm-Message-State: AOJu0YwYY6eYEC4R2lwa1wgjYh+btZRtlUCQxTUb53Y8a/UK03Zzl9fy
	k0ZzYVvK340oasmLACooXRQOkPKChUn1Ikz11WkAo+Px+Z7uJYruva447x4Z8w==
X-Gm-Gg: AY/fxX6WCF3s9uGgHcFfXzRtKIMbOl3FoQSNVdOGixIt85lI7F5ELJ9+bA1ZDFiv3M4
	h7NpVsid0+CRHYnWSx5WMfqQhDOB8PhgtkoNA9CBkKbEnrA4aRxt/aHn+2mENXXR/HKEXrBeNLo
	SR7+2VeG77RcXUIiWSrhx5OI5c+BOwUb3euG80DHPbAxBWSiEpV8wwflsPBgTDNW4VJvdgvCOQ6
	2hTuPkD4tmh0++2eMlCWRI4/yjB3Xq+AUfIDJwJzHsVv6I3gabsZ5vzVlbCg+ysSnnmxT7x7S4A
	YZQK4NgbbT7lO5BIsROO0w8+raul63uQbEDefBPhyotXmZXcbxEZCQdbgEv7ipDnU7gSLWOXPUC
	Wq2JULamLidFdJj/Heup/TGqzX2uKfRSm4gPQ0dZt5xypLYAYWfAmgO08FxWzkd5jiwyZ9h4fA4
	BFWxNEurYOxVLG+5trM3ccJrxJi++RPspsCnEw+dIiP/KbO/GbrvpoQ1YpjoHVC/meeKHp05ra0
	hzW5O4XSfTKBTinoqIUcnqu0StgBBI=
X-Received: by 2002:a05:701b:2089:20b0:11b:3742:1257 with SMTP id a92af1059eb24-12336a89a23mr937098c88.34.1768350957077;
        Tue, 13 Jan 2026 16:35:57 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::28b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248c246sm29297192c88.11.2026.01.13.16.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 16:35:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libpcre2: Limit the undefined-version to non-native variants
Date: Tue, 13 Jan 2026 16:35:53 -0800
Message-ID: <20260114003553.44099-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 00:36:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229299

Native variant maybe built with GNU linker which does not recognize.

Fixes build on ubuntu 22.04
/home/kraj200/yoe/build/tmp/hosttools/ld: unrecognized option '--undefined-version'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libpcre/libpcre2_10.47.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipes-support/libpcre/libpcre2_10.47.bb
index 2ac249f05b..217a60aae9 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -39,7 +39,8 @@ EXTRA_OECONF = "\
 "
 CFLAGS += "-D_REENTRANT"
 CXXFLAGS:append:powerpc = " -lstdc++"
-LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '-Wl,--undefined-version', '', d)}"
+LDFLAGS:append:class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '-Wl,--undefined-version', '', d)}"
+LDFLAGS:append:class-nativesdk = " ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '-Wl,--undefined-version', '', d)}"
 
 PACKAGES =+ "libpcre2-16 libpcre2-32 pcre2grep pcre2grep-doc pcre2test pcre2test-doc"
 

