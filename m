Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF71BC4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 06:42:42 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.22569.1699598559716761986
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 09 Nov 2023 22:42:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CT3eL/ni;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo2699497a12.3
        for <Openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 22:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699598558; x=1700203358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MIhCoUlCq3lEZ/58nB6k4hzt16hRSsXFQjQ4hWPgr6g=;
        b=CT3eL/ni6Zv3RgCdfRMiOJe3y+TYdbSkrzloLGY2qiDlrkD7UB6oR2SNgVtfBEH4dU
         AKWuesvSpElflh3DSTyIcwKLi4KcDVvBJxeIOv7Y/DvO9RXjzz91xLQ7OlBMoQlkxOKW
         0Ws6g2ic2Nfo6tfAzfgqMp3O5+Lbkj0j0nRfgDS7xwarW2U+GaLkxwHdsRmzwshSD2PG
         rDWjsD3rfCYkz8M+eXEgt9/XLak74HAU5SLoTzRMQZYUFzyBHWtQO05ogBFcddpGhObA
         lVeI0eyC8vfXbXAdthtYN0ymv6+WyLaq6L/3W3/C2J4H2+AXvcS1p1A46afo5/H3Dkuj
         CptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699598558; x=1700203358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIhCoUlCq3lEZ/58nB6k4hzt16hRSsXFQjQ4hWPgr6g=;
        b=FSMefVTjgAeNm0h2ghq+TsMcu9iopepvHqSIgptSaHFuEj4M+7hAeq/y5ooO/Bryrg
         fC7f7/d/TThA27aKgBbhJejGEoP1pdJPtyTIMNM0fxyG6dF3RoHItTNsAgciJy5f0xwK
         CVafIUCdO/5BNCP4nnYPt6FBfbFT0Ioz2iT1CzT8m5qUVzGuHFwN8J1+uQ6NcbeylacL
         ZOuzQuRJeBFcM9IcmfMMIayNAaOgj4bh5czbCDfgTah1EJO8JE/Z8iVAEJ3fUqF5A/Dy
         YyL11hpb4gztxQnpGuTM4qifIROXkiBZSVnteH9ELSnoYecKWEjGJsPYwufFaDVH85iE
         Rxnw==
X-Gm-Message-State: AOJu0YxtwVwWcP1QjoZY8rBJth8FPA4LYL9YU3MSUBOl9bNQ3ctErAr3
	h5hGMbXaLJ14Ki1qBdCk1ELxkYWYda03NAdR
X-Google-Smtp-Source: AGHT+IG7r/n7Qil3njm5p8QhhfR2Q8DyypdqJn1C08ARycOXg2ICm0M95bSCvksewtjmZq/oSoUsbA==
X-Received: by 2002:a50:d6de:0:b0:543:f7f5:83e5 with SMTP id l30-20020a50d6de000000b00543f7f583e5mr5731644edj.29.1699598557654;
        Thu, 09 Nov 2023 22:42:37 -0800 (PST)
Received: from slackware.local ([89.249.73.142])
        by smtp.gmail.com with ESMTPSA id 23-20020a508e17000000b0054037c6676esm735276edw.69.2023.11.09.22.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 22:42:37 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2] staging.bbclass: Inlcude native dirs for nativesdk build
Date: Fri, 10 Nov 2023 07:41:47 +0100
Message-Id: <20231110064147.20798-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 06:42:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190400

Some build systems (like cmake) check whether target binaries are
present even if they are not used during compilation. Excluded ${bindir}
causes such recipes to fail to build nativesdk variant. The good
example of that is protobuf/grpc nativesdk build from meta-oe layer.

For more details refer this long discussion:
https://lists.openembedded.org/g/openembedded-devel/topic/101679410#105284

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes-global/staging.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index d229f40107..72c811d609 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -26,6 +26,7 @@ SYSROOT_DIRS_NATIVE = " \
     ${localstatedir} \
 "
 SYSROOT_DIRS:append:class-native = " ${SYSROOT_DIRS_NATIVE}"
+SYSROOT_DIRS:append:class-nativesdk = " ${SYSROOT_DIRS_NATIVE}"
 SYSROOT_DIRS:append:class-cross = " ${SYSROOT_DIRS_NATIVE}"
 SYSROOT_DIRS:append:class-crosssdk = " ${SYSROOT_DIRS_NATIVE}"
 
-- 
2.35.1


