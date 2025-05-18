Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E356C54756
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:31:08 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.38002.1747603866069954884
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k/wv2mn6;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-74068f95d9fso3327937b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603865; x=1748208665; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lwvg6uu5H1sokq3hZo3+82CUfjebb7B5hToB9c7YHs0=;
        b=k/wv2mn6FnIjeV21PwAlXcErwa4mXjdcj3nTpwf1eExA0xti7/Q9alzRVC6APvMi8C
         zYbVjDqc/1pTTpcGciKKR+/912Oi8aIUFbuEPp0T2PpAybrJ/q4griMn9SnnneEXNmJL
         /9wHPASBodtHWbQ6L7OhdLBm29B8pa5ypXRAETimYNEcuOzw0PMB+o5jA+WRa6Ajhfhy
         J4gDFqFaNweiD/Z/3DNdhl8CJoF/xplRh0fRzAoiqp3CKx08t6s3O1BjgHcWVMUzRHIt
         G1BKmDoPgwE2q7UujCubbFepakjtPBvCoe7xiUDN5ZntRxxPntwssjnbpOmjd6+qQvPI
         pKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603865; x=1748208665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lwvg6uu5H1sokq3hZo3+82CUfjebb7B5hToB9c7YHs0=;
        b=flBIaVCPZPup5imbdF58NdoTAplakwDv13p7KRFocEdhzsZex6Ya4xnUoSzcXDdUqq
         Ee9ehaP7rYX0a+UR2wwd0V0Q1J9/C1fySJiwhJXeBZPbzb/dkjvkZ1sAbcSKOPo9BAlB
         wz/smv7xD50dsf8BuSfJH7/Nn/OUXHt82twE0sYyq6zaUbohG5fLbCayEA1YjG6sKuUO
         LVLS462qrSlPk6PZyyGiEYkWTFAW5ef2BN3ouhQwl8UIV4/IITYjAP+/xtV0Uq3MbOYX
         wBuNJGBvTm6EwoSohhT7UJaxBQpKGsJBZ+ZPuFR5++V2CGZjAq78QwWmc1fhvtVelvPt
         rDcg==
X-Gm-Message-State: AOJu0YzwqgcM7SR96V4GQ6Yt/EfQqoBz8eGcIGQCUIzmIPi8Gt5TY1f+
	3FuMZMqSK8DkiRhorAByF2kQhFt36g6uOlnzZtJtt3RPRS8fWaCDprC/yxJpc//S
X-Gm-Gg: ASbGncs7ocgVoRXvu+rww5K15Bw50N8LWX4RQYX/Idcmi4DUg8g/OOl4QS385OWoLW7
	RlpVPY3mcfkeqX3U4ADbybxqCPoKmex3o2di7W0k8k5fsJcU+8Xr4vQe0+NXkNBfmsiQOqh0odw
	WxGeKwyQsO4sQTDMf4oWW1sXTLGTLNbnkaN6zwNB03+TnbLv7fip9zsu0y3TwnNXye1emqaxic5
	UMcGFCIunDY+y6w+qVM+YX1zOKxvonoHQSZSQJLQgmopPcSDVLB7Xd5UMWBQg7QP5tsiO2qxp+F
	mzQvkZ8OOgA9BhSyV+Q/YAReTbVsl29vVlpboS1KqJ4=
X-Google-Smtp-Source: AGHT+IFuk27Ky8RJv48hVnA+higbluP8Em2h40j9s0PZgsgaSs4WlkzdY+tXKgxwzoEf35eoxNJimQ==
X-Received: by 2002:a05:6a20:7490:b0:1fd:f8dc:83f6 with SMTP id adf61e73a8af0-2170ce8f867mr15198108637.40.1747603865292;
        Sun, 18 May 2025 14:31:05 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:31:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:54 -0700
Subject: [PATCH 19/21] systemd-boot: Remove -mfpmath=sse option from cflags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-19-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216803

EFI sources in systemd uses -mgeneral-regs-only which conflicts
with -mfpmath=sse specified by OE via tune arguments. It needs to
be removed, clang errors about it and fails the build

Fixes
error: the 'sse' unit is not supported with this instruction set

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd-boot_257.5.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-boot_257.5.bb b/meta/recipes-core/systemd/systemd-boot_257.5.bb
index 6a50ac05aa9915982dca4649f7bda610cfbfa14b..151e4a953735b524ed14a5ef5459dd037efdcdaf 100644
--- a/meta/recipes-core/systemd/systemd-boot_257.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot_257.5.bb
@@ -47,6 +47,11 @@ FILES:${PN} = "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}"
 
 RDEPENDS:${PN} += "virtual-systemd-bootconf"
 
+# efi portions use -mgeneral-regs-only option which conflicts with SSE
+# especially clang throws errors about it
+# error: the 'sse' unit is not supported with this instruction set
+TUNE_CCARGS:remove = "-mfpmath=sse"
+
 CFLAGS:append:libc-musl = " -D__DEFINED_wchar_t"
 
 COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*|riscv.*)-linux"

-- 
2.49.0


