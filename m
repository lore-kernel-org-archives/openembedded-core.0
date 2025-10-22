Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3D8CCD195
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 04:54:02 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.1564.1761108836296072932
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 21:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KKF+TG1b;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b6cdcc27fb8so425981a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 21:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761108835; x=1761713635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VvBlXHFjfDh9OYuPM8YXt8adBxpOTOiLq6PdBH4mozc=;
        b=KKF+TG1b3X0tukbQdktpl8siafOD4SAEHpIwaZEev5RPE6T3Qn0xwhKnJ9yPNYZ5NI
         DawjIMJiXvClCAXzN8Avg2Ej7Aptv3C+ih6fPqsxvYw/HSy7cmgYbMY+bPaFnV43FXhU
         sZ2MRHYzbxm8aM9Pc2DbcT58gD9uARAl2hZ37K/gvVBf82SSZh9HOuXV8eQum1/lXQf9
         oBuPcsazNMD0Qb5ZoDMkCCCd3w5lGy9xqOwA7BkAINILtMOBofdxawZFashU52oHxBGv
         uzJWRVY1BJGnyI5Y9aVE1HnUAwxNsrsTMUo+MNakut6rVjAuoS3jNuWwxWEpDx9YT0BK
         n55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761108835; x=1761713635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvBlXHFjfDh9OYuPM8YXt8adBxpOTOiLq6PdBH4mozc=;
        b=fGIPzWD6MkrXfddcUTnwt2v8Yn+6jXT8V9sXZdkCRAaxV2klset3N0LUbucAHdxmJJ
         3e1nrbB62QovXBw3BizAkHffl9uA0Z7wJl4SmZW/dwSKItnfFIAmEpp3X098mzXQv8yw
         3gWTwIqx4sWiX36KwnAUgH8iXAkT+sigyQjiCMopH+Gw1BIS216utC22zWCZSjZIQIOr
         vNh7gFoXUsm/CMz6W18bNvSoJ7mKRHYP9sGatnx9QQAmzDKWs5eNDauNEXZfDN9xrP62
         7tAXrQr/Q6pj858pEAhfTYQj3d6fkDXJjQHVpzbLVKgJPEKYTpxj0fm1KAneUPql1byU
         77/w==
X-Gm-Message-State: AOJu0YztWpEZnz2qG3DUk6AdYCXhsNN4mK4oew9tsc1UAG6mTjUw62WL
	iViz7VGi7aIPThc81MKKl8uq4xbMKTMzglsRr3gT99EJUvgYf99z65apQGsmoxgy
X-Gm-Gg: ASbGncsamjS8HHaYPkSHr3NEomVYTeb/51DaUi2tDqcpFXKKEZdOUNZAlA75VR5SRq1
	PnrgDNKifyhckHJD/VtBRsGM9F67ElPz6x9tPsdj5AVylUlcHy2LoedWWoDiPTV/gMefPQ+3ub8
	e5/SfvUzloyh1jyYt2FDQ6ALcVdiaYxeDvyBbVosuknIgJE7EpW81HVpSqTRcv3crYL2/q3enxm
	V1g2lG7duXW80TNR/TkyhgoIFK9+AFJJAIc/IlZKO+YZm2yuieCoflOj7l/1j9WWC0eNRcba8HB
	XAm+16nvztjzs6V7RXTCXgdpBgP74wMt4xKIXdVWbsh35blRiuKOBlpgx6oMGjGUDM0gtdR8Kxb
	5NNySJyyEAFdIIZJccCxzDnYnOLJaE3zUV2YFb7nBPPTNoY183YBwYwFU8KqdEt0DmVyM2IkLPv
	Fk9rJYf0TpGG7BTXlyxgqSMyXEivSV8egAeAShqiO69NMVhil+0JuAc/A1k83Ad/Yqn6ftH4e8
X-Google-Smtp-Source: AGHT+IFRd2u0RjQrD6JTFiDTn6TGHCIRMrGTsgsRSWMLaklcKI6bcUYDs/DMl3a2AgvserbQMZSj1w==
X-Received: by 2002:a17:903:2411:b0:290:ad79:c616 with SMTP id d9443c01a7336-290ccaccc25mr249449425ad.57.1761108835147;
        Tue, 21 Oct 2025 21:53:55 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::b6ef])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a23010d818sm13164102b3a.53.2025.10.21.21.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 21:53:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Subject: [PATCH] rust: Do not modify rpaths in llvm-config
Date: Tue, 21 Oct 2025 21:53:51 -0700
Message-ID: <20251022045351.1566346-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 04:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225170

No need to edit rpaths in llvm-config, this is not
needed anymore because the llvm-config used is from
standard install inside sysroot unlike when rust-llvm
was used, where it was installed into its own location
to avoid conflicts with llvm-config coming from llvm/clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.90.0.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-devtools/rust/rust_1.90.0.bb
index 0319d73b930..e7f3985332d 100644
--- a/meta/recipes-devtools/rust/rust_1.90.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
@@ -237,11 +237,7 @@ rust_runx () {
     if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
         mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
         cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
-        if [ -e ${STAGING_LIBDIR_NATIVE}/libc++.so.1 ]; then
-            patchelf --set-rpath \$ORIGIN/../../../../../`basename ${STAGING_DIR_NATIVE}`${libdir_native} ${RUST_ALTERNATE_EXE_PATH}
-        else
-            patchelf --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
-        fi
+        patchelf --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
     fi
 
     oe_cargo_fix_env

