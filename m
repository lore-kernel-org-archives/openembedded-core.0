Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BB5C3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 14:11:35 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.76785.1746540686038889933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 07:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ONcFrew4;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so9221892a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 07:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746540684; x=1747145484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Dl6GWN6I77pP6FE89yuh87efyW1YGNQeGztuyo6X14=;
        b=ONcFrew4zw6xWyA3kZOyBSmSC0W5pldQpvEANcWWZrJZDXHlqnTdH/gmH0U2jJdFeq
         D50uDHn2vWFgQPq0b3khNuBBS/rarWWG9hdgCAdMjBpLqWlis5k3vg5gON23CprL9b9x
         3mfbEt97nRT3wgQzSU0MZCcScwGSXlMJ2MvAPTYTE1cHFPvQ3cL3FAO9Hp7hK/9HwDxq
         GC5yqnyNuTrnsPFyFGYYXmVmV1AG5VNphunLwRGtoUIVEQS2iBQEWuM8wHzdoVHKavZY
         c2tPAP8566+8jOA0pFToE72WUSDT1iEY5r8nJhCn0X9jOEEWIn29mazeBcvDPjwH2Hye
         HJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746540684; x=1747145484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Dl6GWN6I77pP6FE89yuh87efyW1YGNQeGztuyo6X14=;
        b=G5+m6wiUQb6rY3IMm4yPci02jq5la3gfUWXM4x6j+YMEHe+fdPse4fQ1u8JLj4IEKW
         35Hy0nMjf+gEO4frrEz1QpGiqOPn+SCD+5pti5L+Gg4zM91tkMOjUucbpgFm3wAttbgQ
         ZqSFGCoZ6B1LmxST3/XQACghxKTXMuve0rk8Hw0fLPGuEkTmxeah7bRutvor1bE8jrBL
         uvd7vVz8IJP05u2wrcRP5qkuQc+/TTTFrAXxNgrUZBNQeQ4sUwIIqFWfbsCfaD/vZ851
         YipHVK0axQDuPZL/b02tvCCmJ0ASptOZQDRWuPLZJql5ZR9101jGXazITCmgBpLZEQrd
         fhpA==
X-Gm-Message-State: AOJu0YxeVEKusPRGnBkVgIfr3r62zAmp9k8ren+pdl9Y6GROxCEz8ESn
	DlJTO3wJV4W/c32/jLsnJTxWOPLFZV6w9Xvi4vkdoBN4SuKdAHo+PWzgiQ==
X-Gm-Gg: ASbGncuFvFHYIbnk60uydRMPWSK8d6aYRTwNpkeOEXsLp3vwRfFgFCmLS1NtMxGEmFg
	LtFMaNEwief+QsVB/w/hN20YlmTWjW9RXmpQlQb5QfPlQPjJQ7LL/VTEaKm74moqc4dsevdHcWb
	vdDEeDkop/0jRRTPOWEdk7EHrnCGMSDlSmteB6N4+Mqtt9R6BFZqGMBWugQZUAtU0h8BDfbyVHK
	TQcBFLw3w3WnVJOGlGB7Jf8ZIpq6tctplmecoR46QW35Zu+I0miRPuaoEFADmrbj8eRgngrlAH+
	cwf0Cr+QBP1616YF4b5/H/bsz+tWewJSRxEhOkgtZnyNITAcrjezAajNUmon7X+uIz354XwswnU
	6GV0H2EMkddhOp26YneyNOSvjidIv6JAeHtCsMN6ymS4=
X-Google-Smtp-Source: AGHT+IFxlgEVL9wIytXoEDsYFMCUPcCz2O0f8+d1i7n1xSH9wdb+PvyvPDDg8tzmAISfbPZh5JRWJw==
X-Received: by 2002:a17:906:7950:b0:ac2:d0e6:2b99 with SMTP id a640c23a62f3a-ad1d34db544mr343490966b.36.1746540683518;
        Tue, 06 May 2025 07:11:23 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189147380sm722462766b.18.2025.05.06.07.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 07:11:23 -0700 (PDT)
From: max.oss.09@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v2 1/1] openssl: aarch64: configure with no-asm
Date: Tue,  6 May 2025 16:10:12 +0200
Message-ID: <20250506141013.2600055-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 14:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216050

From: Max Krummenacher <max.krummenacher@toradex.com>

openssl has a couple of functionalities which use optimized
assembler code. With no-asm these are replaced by generic
C code implementation.

With GCC 15 OE by default uses the new AARCH64 specific GCS feature.
However the object files produced by the assembler are not marked
to provide the feature and consequently the produced shared objects
containing them also not.
The linker will warn when linking against such shared objects files
and, with all warnings are errors set linking will fail.
Without this patch systemd e.g. fails do_compile as it links against
libcrypto.so from openssl.

To test what features an object file (or .so, .a file) has use
readelf -ln and check the content of .note.gnu.property, e.g.
libcrypto-shlib-md5-aarch64.o build from assembler source,
libcrypto-shlib-md5_one.o build from C source:

$ aarch64-poky-linux-readelf -ln ./crypto/md5/libcrypto-shlib-md5-aarch64.o

There are no program headers in this file.

Displaying notes found in: .note.gnu.property
  Owner                Data size        Description
  GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
      Properties: AArch64 feature: BTI, PAC

$ aarch64-poky-linux-readelf -ln ./crypto/md5/libcrypto-shlib-md5_one.o

There are no program headers in this file.

Displaying notes found in: .note.gnu.property
  Owner                Data size        Description
  GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
      Properties: AArch64 feature: BTI, PAC, GCS

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-connectivity/openssl/openssl_3.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

For reference also refer to this thread:
https://lore.kernel.org/all/aBilFkr4HF-MSBd6@toolbox/

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.0.bb b/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
index 865e04deb220..d025fc3ff100 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
@@ -36,6 +36,8 @@ B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
 
 EXTRA_OECONF = "${@bb.utils.contains('PTEST_ENABLED', '1', '', 'no-tests', d)}"
+# aarch64 'as' doesn't mark objects to have the GCS feature, resulting *.so then produces linker warnings
+EXTRA_OECONF:append:aarch64 = " no-asm"
 
 #| ./libcrypto.so: undefined reference to `getcontext'
 #| ./libcrypto.so: undefined reference to `setcontext'
-- 
2.42.0


