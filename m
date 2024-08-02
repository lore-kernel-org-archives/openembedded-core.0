Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED9AC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 10:19:02 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.89707.1722593936037214085
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 03:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gr8iaJEz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-428e3129851so11506975e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 03:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722593934; x=1723198734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54TEupdnSbYwYguJavisRHRAYPv2E/nN6M592E6LLMA=;
        b=Gr8iaJEzJKeZ01b1dX0q/aZfyVbSeU7txZWo5YtvyP3vsrqdiMLEeDynhMC/Pogufe
         1duGh5Rw20r1V7LKEkYHFJFAe/1mDwNTxtOW4JKxaOAk+coE90LzIrh6JbemVZKgx0cQ
         TS7NlJhUE/yTgpaxubN8mGm848nZqCG9yHS+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722593934; x=1723198734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54TEupdnSbYwYguJavisRHRAYPv2E/nN6M592E6LLMA=;
        b=iUYL1MnDjwwtQsVEmodFVz/oi0d9A4HjpQEA4suXy8ud4zCW5gdK0QWg+unUqSp9/a
         L1bB8LlvPCDni1dr656h/Guc63KI4atlHigMIrMfayqDMtdzrN1Kf4BBvFWXaoZ9kU+w
         KJnByh+3+wQQFeI0GWB9+kQDHi9+3hykHRygekh2x4kbCTEWOo3fPF0vWvvw+VTbf5QF
         ArYA0dSlPMygIW1/4vhGk7R3AIF4eFb/PufIX6RIa5QICkHDLOLAfpC5A/DBtP0bHzq8
         R2hempcZX7usEONatYQXftUdnXgN9yZje+B+w2yv4nCEeyI3KOEJ0eNonza3TPOscr23
         +7Ow==
X-Gm-Message-State: AOJu0YyHFTefxDZscqi6HXS0ztUFmMsfPtQvvqbYfyljkWHyJFb2sRBk
	vmlEfZCmsXdIwMo8zSE5QfzZ8J6UwFOPLB9PEU2lMsNi481ejD/b6zKoQ8GZyOpjnBjNBZ1GUWW
	b0Zk=
X-Google-Smtp-Source: AGHT+IH7PcKz/UsnDVKTcQpoBBjE1K+wE8bflBdKycmJj8mIhcAprgPI99qMBVoV/9Dl4+qObM23Wg==
X-Received: by 2002:a05:600c:3ca8:b0:426:5dde:627a with SMTP id 5b1f17b1804b1-428e6b7a333mr20315955e9.23.1722593934166;
        Fri, 02 Aug 2024 03:18:54 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2ef2:8ccb:3250:e48c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd01e0a7sm1573924f8f.43.2024.08.02.03.18.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 03:18:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] qemu: Upgrade 9.0.1 -> 9.0.2
Date: Fri,  2 Aug 2024 11:18:51 +0100
Message-ID: <20240802101851.437996-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240802101851.437996-1-richard.purdie@linuxfoundation.org>
References: <20240802101851.437996-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 10:19:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202895

Update along the stable release series.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../qemu/{qemu-native_9.0.1.bb => qemu-native_9.0.2.bb}         | 0
 ...{qemu-system-native_9.0.1.bb => qemu-system-native_9.0.2.bb} | 0
 meta/recipes-devtools/qemu/qemu.inc                             | 2 +-
 meta/recipes-devtools/qemu/{qemu_9.0.1.bb => qemu_9.0.2.bb}     | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/qemu/{qemu-native_9.0.1.bb => qemu-native_9.0.2.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_9.0.1.bb => qemu-system-native_9.0.2.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu_9.0.1.bb => qemu_9.0.2.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_9.0.1.bb b/meta/recipes-devtools/qemu/qemu-native_9.0.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_9.0.1.bb
rename to meta/recipes-devtools/qemu/qemu-native_9.0.2.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_9.0.1.bb b/meta/recipes-devtools/qemu/qemu-system-native_9.0.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_9.0.1.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_9.0.2.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4a15c97d938..f37b32985bf 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -37,7 +37,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "d0f4db0fbd151c0cf16f84aeb2a500f6e95009732546f44dafab8d2049bbb805"
+SRC_URI[sha256sum] = "a8c3f596aece96da3b00cafb74baafa0d14515eafb8ed1ee3f7f5c2d0ebf02b6"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu_9.0.1.bb b/meta/recipes-devtools/qemu/qemu_9.0.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_9.0.1.bb
rename to meta/recipes-devtools/qemu/qemu_9.0.2.bb

