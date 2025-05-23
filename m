Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE63C54F32
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 03:52:57 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.41010.1747972376705459891
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 20:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eMDhLIRu;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b074d908e56so5593766a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 20:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747972376; x=1748577176; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbCZKLZfWpW7tUnlysgaVlk0MV6pjih/jGUYtapaap0=;
        b=eMDhLIRuHiMm+fpnMXPyMsQ46eCj1agEgL4rEr6ilCGCKMTkrZNJjOWoBsROBvgD5y
         YG9fbY6FLOSKGxcs5Dp3fY/WdCE4G7R8y52CrlPugKkFhyqYeomOygpG49d3QWXEuSZ5
         L51cy/epViWELW5Ih3VNAEHGIgBcQSVMSBr8f86/oVAjptfRg5gMaToEUJ/Q7dlwR+gp
         0DkZ9z6VkcrtBPbWy33xwsfiP7owy5hqIB8MfixBf/tAKggV/QWtVjhng06pbV47LUf+
         OgJX5QOVoQVNekYr7ClLJToGNIOQIzzAxUXTp/wXivWir4L22CjMDyx9MpENAoczvsxE
         Xxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747972376; x=1748577176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbCZKLZfWpW7tUnlysgaVlk0MV6pjih/jGUYtapaap0=;
        b=KMPXg6M7HZQgmEs6Wdv3KWFYKiv5SF+4QfOAsfGuHPlAs/mz7c36tcw8BRPBY0DIwV
         /lpvxUsT+DAvnmgJj7klMD2Jyx9Nzm3ChBqhwE4cPmyUexlLuseOUale6a316hMgbYEW
         +aVPNk3nYL76PbfVl91/U63qSp47yFiFKxBDBZ5OmGK6KRLLj9G4PVPjzFQ4C5jZzoH3
         Cmfl6zBEGQABZUhcdXuaqcAWvu+sd84ZgugF487qoSBuC9t+dtrXm/Op4+7y39QrJHNi
         s7UUdlJBRMpY9Cplrtf5Yfy3AkC1uNpW0Me5hoDU7YDsOspGbfyc5VAmo/AyL0ghbBd/
         WpqQ==
X-Gm-Message-State: AOJu0YzUoEmlKlDgwTazamQ0QBO+fFEAnpIdjxP1AydaoXy3P3S77y/U
	+wRgKu/Pd5qtjxX3bUvCRXZ498ETm0TuC4+3orwSD1CmLWtUVUk/tcGiJQIA0cYb
X-Gm-Gg: ASbGncuxGoNn/f8Pk8/uH9efqt/O+Gsf1K8XsomfAVazUgPRH6H9g41uO2mGAVeNZH5
	+KPR8qFgDmFH5CDRoCSjoshDEZE0Bi6xtqu10XjvMInHRJp1AV9ueEQngwMFDzWVCvaKKNlHJkz
	J4yR4V8MSYed07zPS83J8Zx5xWJQM3/9oNLIMsFMocdmDH3wGIWdxCkueju7kOeYho2cF+Vw3Ix
	IC8gyiRXUhb3qTiRFS58AuDTQ9BFoxah6Z9JA8Lwonng+IvAMnY02OB4s8MxGAHK6kLafXyvk5E
	XmP+EyiOyiIj0WN+GOFL2UvC84xVgP4Wk5/QrZaR9/I=
X-Google-Smtp-Source: AGHT+IEMVpBGyBRuE4rWorIHBn1vJB6DzgJMAC2iG5i6BLmKCOVkLSqXvpL6YlsQ+6Rp6SuYAH5dkg==
X-Received: by 2002:a17:902:d490:b0:231:cb69:7659 with SMTP id d9443c01a7336-231de312980mr307312445ad.20.1747972376020;
        Thu, 22 May 2025 20:52:56 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231ecd5ea41sm107181155ad.228.2025.05.22.20.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:52:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 20:52:46 -0700
Subject: [PATCH v3 12/13] systemd-boot: Pin to use gcc toolchain on arm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-clang-toolchain-v3-12-16cfc6d9891b@gmail.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
In-Reply-To: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Ross Burton <Ross.Burton@arm.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 03:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217172

clang does not support -mgeneral-regs-only option for arm

Cc: Ross Burton <Ross.Burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd-boot_257.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-boot_257.5.bb b/meta/recipes-core/systemd/systemd-boot_257.5.bb
index 6a50ac05aa9915982dca4649f7bda610cfbfa14b..7d22e7aa8c07fd72a3e4fe08ed4218c1031284e5 100644
--- a/meta/recipes-core/systemd/systemd-boot_257.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot_257.5.bb
@@ -49,6 +49,9 @@ RDEPENDS:${PN} += "virtual-systemd-bootconf"
 
 CFLAGS:append:libc-musl = " -D__DEFINED_wchar_t"
 
+# arm-poky-linux-musleabi-clang: error: unsupported option '-mgeneral-regs-only' for target 'arm-poky-linux-musleabi'
+TOOLCHAIN:arm = "gcc"
+
 COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*|riscv.*)-linux"
 COMPATIBLE_HOST:x86-x32 = "null"
 

-- 
2.49.0


