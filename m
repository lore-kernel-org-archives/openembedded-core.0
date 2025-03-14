Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C968C28B2F
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 11:20:14 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.12002.1741951212701499527
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 04:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FGbgA7dP;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bd11bfec6so19719681fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 04:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741951211; x=1742556011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zErSyHtBL8AwOjSCoV00LTljZ6I+SBCKPcOgxhNOXUc=;
        b=FGbgA7dPKhbz7VnTPVHmuCZ5xALr6gCQwM+GlaUTngXxdvtLnK6O9FQrpbKv6hMwDP
         SQqA8W1IgMuF24w0E1YB2eCoRkcoHDnVjX2jjqg/8igTkUirodYtNk4b4RkjZn/efHLN
         Con0g2rLO9cZvfAX4alLJix9q1RrHCSzEKh+O4/qVH6KndpYJfRFuaWTtX0URTDhWWdB
         yGIMmrjpmIwwILPm8fgwCDSm0ANX6/dg+AsGOWTbYYiiiqOV8R7aVWoy/dgtFb9eEWTL
         a3QnOIEUjcaykGMTlN82YlDppPSuanU6smdE8t9M4eYGa1gxK8WnqRtlGloitigbLyNN
         Um5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951211; x=1742556011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zErSyHtBL8AwOjSCoV00LTljZ6I+SBCKPcOgxhNOXUc=;
        b=XaJXt/6eJCkPRhnz3xcH5ctb+vavVtOpQzC88qTVQwNZ+yk4EkNxpb3uRq8nTfrRXu
         8EoO15qmrI5x9PMIhJyU2CFAGEDfy1hteP0WXXjCFakjL0GwyV4np13hLykiBrTZdZls
         M8E2rOiVKNVcrq7z6oNHhZulIcconlaFXXPhUviM9YN/Sc7EWluxMDkHMUtJIUVU8EPk
         Y3u0qcGaMy1GXegEwsW7mfitRcvqyk5Z0iKr8D9+G5Scw8aExhqvIlBVIbMuDBEZNpmg
         Zam+CB+YMcjwiZtgvWsZTLjehI2gnkpatXslHy4TkEhzd7DXnftDQTAe2j3LptqbQAtb
         G9Qg==
X-Gm-Message-State: AOJu0YxA6HUYre5go23c5eSuvfo5jN5lJAo4AgdlU0VMNDG5rmv3EsVH
	mBKhQ3kRJXqWX1Blg/Xe33JmSAdWtVQeRMtJJut8t3BnTS9tUfjDcQb4leR64LW6LVuY0weqGyV
	7WPw=
X-Gm-Gg: ASbGncs8TRuOpAu/dB1MP0q1UIBDdS+qCaFnCDmUOMeR7vVJ8i4qTHgiMaO2feEFuf+
	yPCt3lhqZwp4IAGqCbqnhNo62uzwa2P/iSzxR3K60TXW45xWuQZGE4SkIrASQ5RBQI+TuupTR99
	yUn37cRHcv0UFtav6PkKUAguCJ5LvBd6Bqt77smYvNq7qLaOVxAQmC3tP+XzEP22K+5VojGwXTm
	AQdeCCkcrpJKMLOamrT2Sr6nunFUv3SO4aGSCHmeznnZmZJntq8v3GrWlezwq1s1WofEVTcvbl1
	FtVDygawoyBFDd9Qdpf6oNSeQvcrQMT5MLK2IVbdWEOwlD3/dKMVBPVBLg7V1oTuXB3DeBnZVG3
	JNM2nW1CrWZu4nA==
X-Google-Smtp-Source: AGHT+IEWd5cdeigl+PEftmM8ejK344kWew9AcXJJcPnxtMk9U1iiKr23cfLXh90wb+4p1KZfgfwbqg==
X-Received: by 2002:a05:651c:1a0c:b0:30a:2a8a:e4b6 with SMTP id 38308e7fff4ca-30c4a8f8cc7mr7028161fa.33.1741951210586;
        Fri, 14 Mar 2025 04:20:10 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0d26e5sm5364391fa.20.2025.03.14.04.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 04:20:08 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/6] systemd: enable efi support if in MACHINE_FEATURES too
Date: Fri, 14 Mar 2025 13:19:38 +0200
Message-ID: <20250314111942.304800-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250314111942.304800-1-mikko.rapeli@linaro.org>
References: <20250314111942.304800-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 11:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212833

For example genericarm64 enables "efi" in MACHINE_FEATURES
and in u-boot. Boot without "efi" in systemd works with
EFI protocols but for example efivars is not mounted at
all so various checks fail in userspace. Fix these by
enabling "efi" support if it's in MACHINE_FEATURES.
Fixes efivars mount to /sys/firmware/efi/efivars etc.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd_257.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_257.3.bb b/meta/recipes-core/systemd/systemd_257.3.bb
index 64fb8fe69a..9bc4532021 100644
--- a/meta/recipes-core/systemd/systemd_257.3.bb
+++ b/meta/recipes-core/systemd/systemd_257.3.bb
@@ -69,6 +69,7 @@ PAM_PLUGINS = " \
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor efi ldconfig pam pni-names selinux smack polkit seccomp', d)} \
+    ${@bb.utils.filter('MACHINE_FEATURES', 'efi', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump elfutils', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
-- 
2.43.0


