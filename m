Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDD2C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 15:21:57 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.12752.1743261708312599615
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 08:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LBgqgsFZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso35533095e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 08:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743261706; x=1743866506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ft8UHdLriCqp8OwmRJU3/ZmfPKdx1uTSUVdF9LVnIek=;
        b=LBgqgsFZVhhO7HT2JofdkvGZyWVMAeqdLGjuj9hSEqmpTNYPpgEOpIQb/lZV869Rsd
         rqhvbDqShba7FTxvy5qra5Nhg1YCCAokYAnMz8q8GC9ImHwk7zp1f1ObAbk7FBM5LNb6
         MpWMQECfhEzzDjzwjrbDRK10EoT3eCu0+ltQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743261706; x=1743866506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ft8UHdLriCqp8OwmRJU3/ZmfPKdx1uTSUVdF9LVnIek=;
        b=jRnFsyGv+ymxlmzQWA7CUvRrT4W83Vq71R6Ixi2PGjnkrbuH2YYblLyTk5RwaI34Mc
         bAeUc1r9w51JvGUuWGyWfC2mOwc0tDcKAoE8V2OBHXrYLLG7hy5GObdf5pDXNo3f7E5x
         8y72qSBVkOG6xPgfa7OITzmmKqKRgSTODUTMXNYNAUgfO/hQ/5EHHuleS0lVKbIz08rW
         6kj/RqmmQBGGQ0btLspOoXuhLT1WoXsF4G2I+fmMIr0q7zj3dUUXVKJKELwcx2V4LU8B
         0sMmcUKcf7x+McNwetxjAEE7ITtnYEczqFvRAsq32azqovCOZqEoxclnTbn9yOa7+TjV
         WGqQ==
X-Gm-Message-State: AOJu0YzsYT+21kWwqIQLaIgqsQPSslbIIs+zlZh1/fO8761JuDWjfkmE
	qeMPofUyWYpx/k7oJu26Qr0QYQuu9WADKlhxmTNEidBy2XJr3ywVbXgxzsBRLa/kyg8hPu6DWl6
	g
X-Gm-Gg: ASbGncu1cBuDpoQQakIfD4vz1XC3zQjb0SI8nBdY7DmxGU/e13mk95Ry6MB1ggN60BM
	thoHWl91kAYOs3nw30384tVW+QgLqotoC536qDz6zF5xL6UUkGIWWr+/PYih2wWhqPsz4FksP0v
	2nz+L+q9x6SGe5I1VmnZe8tLU5NYpWsJKLdgEyasT3mGQ1XD3my6LGwnR7ivF4TJh/HCr8buSh3
	aYegDPb4n+oRY/5BYKggRbj/a62PnCJJHlgmX11ZysIw/xyv8S0lsQjKFvjwZZZzza9nU6lqQDy
	jgqA1+pLeFvnE18TK4lhN0dgXEWDLF4p4uwzGVzO9/nIxQH74tSpQIcHfVnWgO81xbKFQLg=
X-Google-Smtp-Source: AGHT+IFFxNg1O6x8DYySaW39MAxCpGcEJAQ1Le5uMh/5Ollwne76Medco2WY4t9NkCJQr7pr/n8XOA==
X-Received: by 2002:a05:600c:3483:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-43db624cf95mr36995585e9.17.1743261706383;
        Sat, 29 Mar 2025 08:21:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aa52:226c:d1da:79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8314f5c6sm110738985e9.40.2025.03.29.08.21.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 08:21:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] rust-source: Fix remove_gcc_directory
Date: Sat, 29 Mar 2025 15:21:41 +0000
Message-ID: <20250329152143.1609731-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250329152143.1609731-1-richard.purdie@linuxfoundation.org>
References: <20250329152143.1609731-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 15:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213881

The patch works for rust-native but not other recipes which change ${S}.
Set it to use the correct path so it works for llvm-rust, cargo and others,
maximising the space saving.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust-source.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 92bb5e4779f..820cdc16e2a 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -17,7 +17,7 @@ RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 #After updating to Rust 1.85 we can revert this removal of "src/gcc"
 remove_gcc_directory() {
     # Ensure the gcc directory exists
-    gcc_dir="${S}/src/gcc"
+    gcc_dir="${RUSTSRC}/src/gcc"
     if [ -d "$gcc_dir" ]; then
         rm -rf "$gcc_dir"
     fi

