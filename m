Return-Path: <jarsoper@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43749C36000
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:09:20 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.6465.1742418550022696584
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 14:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AZ3Fa0Ej;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: jarsoper@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-39127512371so34586f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 14:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742418548; x=1743023348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HGiNjO+nxlqtncFIcgx0JHMRNtklOINBte0Sq5pB9YQ=;
        b=AZ3Fa0Ej52Xvbj6hoMlm+RpkQGa7lciUjgDNcOYkfZ9UvOvBGvcQXElOf/clpJyJC3
         BqlPP20RedC7DkhJcsBWW90Z8H5mSCLLd7fdIm+FE5OhCvosBjnu36AQoi66e5zFJ3XC
         sY/ydiDlVKe/orJrToQv1RsBQd4HZ1iu9DMTG58PaUqi0EkQBEm5f0V8gaDNF0sObUoh
         x0ZDeo/Hb2021TEZhzSqLnuUnDVtdAuA7Qh1TQuhPQ4j200QAWPhfneJO2YcWKE3m0u+
         JmW6eDgQNpvVuPM7ESjo2e6CyBlJqRasfAcSC3SM81eu+WhNbIWlwAesLiTnccFd4ZJ+
         vFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742418548; x=1743023348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGiNjO+nxlqtncFIcgx0JHMRNtklOINBte0Sq5pB9YQ=;
        b=b1/o89xlUiWKIio3o2ZGIT7aKbql6P359FPRy1AV2wcluVuXZWRb25bnytk0RvF8P3
         H3nRswdwG3mLb/ZTHROwuCJKu4cHhIyf1YHfQceQG/nTCHlrtOQyA6TMVOk96/2fiQ3+
         dFV7N4Qm97GCKJodty3JemuGnBQdH90a6uOfKRzbEFSpaUZ9Hv7SSSMCwNsimDap6qkw
         S1t1Y+yPNzRCHpeLohcNna4fIXFygXGylc2NT8En4lFmzH0dGj1av+cc7d4JowSXxtxL
         nuCeShyGsm0tAllZCvLGcDN+3HKCW97d6LWfcsgj7fM7D5Rc+GhY2TYRDWFHLpOORDfq
         ncuw==
X-Gm-Message-State: AOJu0YwT9T3imoyBh7PyiVliOlTWuGLEPzs7Au+HbmxQX0DC2hwMonvt
	u3mGLK7xR0wz7Kai0XMxwDpszxOsUXEWgfXR2u+JCQZYUrQUr9voY+YA5EW1iFiW5A==
X-Gm-Gg: ASbGnct72Z5KavJZHMO+VoKeODimWkFcwJExYMZ42QtBRfnbh4089vPT9ywkw28Kqnc
	yTQdiWOg9GSVYz16cTa8LX38+OxQkmZBq+vM5nz1SbENbIsVQnt+WVfWGVlRjdMYBxt0DgYUC1F
	Uxa+CXqTgIhI2LuHGcC34G/FuU8+b9RlAVfrIeKJSJXqAJXpR17w+93uQnW/Rs89LwztaTYF69Q
	C51MMNzhCTVV8DqkTtKV9h6146Pl8of60qQp2FYxf1S3EHseGxVZuSzAuUzfPKsCYOU+KWM1uhZ
	qhec38ay+CcufEQm7WzeD2EUenEA3EtXWMZ+nZxj6RgOFfnOcgtmtr25yhFSng5pZfHTWnVKyR9
	YPBHcODBHgZz0zYEh8baSuLIxR1s=
X-Google-Smtp-Source: AGHT+IGtSvpE7JhdWTw8JhcdUbBjhO7tI7OceE6GE2P16hN/F8im0A0S4cigkWbWgUWm8ujSidKUYw==
X-Received: by 2002:a05:6000:2c7:b0:391:2e31:c7e8 with SMTP id ffacd0b85a97d-399739b4c43mr3593221f8f.2.1742418548133;
        Wed, 19 Mar 2025 14:09:08 -0700 (PDT)
Received: from fedora.. (2a02-8428-db71-3701-4910-aa42-71a4-9a4f.rev.sfr.net. [2a02:8428:db71:3701:4910:aa42:71a4:9a4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d440ed4cbsm29053945e9.34.2025.03.19.14.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:09:07 -0700 (PDT)
From: jarsoper@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Jean-Pierre Geslin <jarsoper@gmail.com>
Subject: [PATCH] cargo: pass PACKAGECONFIG_CONFARGS to cargo build
Date: Wed, 19 Mar 2025 22:09:05 +0100
Message-ID: <20250319210905.1896983-1-jarsoper@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 21:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213355

From: Jean-Pierre Geslin <jarsoper@gmail.com>

In order to allow rust packages to define PACKAGECONFIG options, append
the contents of PACKAGECONFIG_CONFARGS to the build command.
This patch was already submitted by Bartosz Golaszewski on older
version but was never merged. It will be really usefull for Rust recipes.

Signed-off-by: Jean-Pierre Geslin <jarsoper@gmail.com>
---
 meta/classes-recipe/cargo.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 76a39668c7..461d100dd9 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -48,7 +48,7 @@ oe_cargo_build () {
 	bbnote "Using rust targets from ${RUST_TARGET_PATH}"
 	bbnote "cargo = $(which ${CARGO})"
 	bbnote "${CARGO} build ${CARGO_BUILD_FLAGS} $@"
-	"${CARGO}" build ${CARGO_BUILD_FLAGS} "$@"
+	"${CARGO}" build ${CARGO_BUILD_FLAGS} ${PACKAGECONFIG_CONFARGS} "$@"
 }
 
 do_compile[progress] = "outof:\s+(\d+)/(\d+)"

