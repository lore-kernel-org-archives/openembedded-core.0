Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83FBC4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 18:54:36 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.16062.1699124069062745813
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Nov 2023 11:54:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=DoAKkk+Z;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-507adc3381cso4013538e87.3
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 11:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699124067; x=1699728867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2vgat329A/XloB/KnZqZaIcyTK9wZcpwnHBQOxBoXeE=;
        b=DoAKkk+ZsMIbMeA6/ko2j8dIm+sdpsXh3aO/nhqPcdUGnN1xb/YQIg5rRJOOOm+gS/
         zFO5pmVQFB/O3NhBP0criQurZ3hNYZUCM5tdjVTtRKpEVe72plj0jCGAww/W7gG1mSq7
         898g/u5Xqoiy7dD1wQIzfxuoIMig4EO3K9/POAAduo/gLhGiDVKwo9o8fv711jJ2cYGW
         SWg+GJodDAN5ao/K1ufBk18/v7s/pwhsGkhCAEV2BykEfN1JzXv4UVJfg2F7av5t0JTr
         QLhCsSNe2EyJRcIzwaD9C1EUr6e/caDfnhnmAN/r+lvcpTaq2+Bb3LHkJe3beqSMFDob
         +b8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699124067; x=1699728867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2vgat329A/XloB/KnZqZaIcyTK9wZcpwnHBQOxBoXeE=;
        b=B2zkBe69NRq2eZ7uwRGi9SNSkoBtED98j6WZ0+/QbQ0TXCsH1sMmOmMY6GW1FbcdDL
         Fw2s1m15u/AdUID7jXvzlQUBbjCtcpOZv2bSW62ArBobPuXgIYWORjJsnFEd17y5+HLg
         nYGBV/m9zOjyuvkJPfYc+SN4TmvMh+Wyd31etFjEQGkWisi7nqo/tese6sOvp2C3Iezz
         Tak8djbXWQdJ+5mZ4KhuLOiSRINb22jrZsFTl7bIq9J/+aHPJSlg99HQtetKbzZDkuFi
         1C1mYTD3KwN2Kp7NzE4nbNVIWio22jW3TOcG0XrIM7ZYM7v5detWc+nlDHTh80xLrBRB
         TpCQ==
X-Gm-Message-State: AOJu0Yy3MN1X4cxrIOPFtfI9r9CDpWgvCWqk1284bmJJ06mUidHs5bUK
	LD98Kdas5izsQ8HlSBqBykh1/deCakq0Q8qxtck=
X-Google-Smtp-Source: AGHT+IEy8G4CaeNhZT9eRk9ggQ2fNnz1MoMJCYIzlmLWfpVtfAj/4RD/9thul0Nr0xOoHQJRHVvZxg==
X-Received: by 2002:a05:6512:1255:b0:507:ce49:81ba with SMTP id fb21-20020a056512125500b00507ce4981bamr22477156lfb.67.1699124066620;
        Sat, 04 Nov 2023 11:54:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f17-20020a05651232d100b00507a387c4c4sm580246lfg.229.2023.11.04.11.54.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 11:54:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson: use correct targets for rust binaries
Date: Sat,  4 Nov 2023 21:54:25 +0300
Message-Id: <20231104185425.3112405-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 18:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190173

Follow the example of rust and cargo classes and pass RUST_HOST_SYS and
RUST_BUILD_SYS to rustc's --target argument instead of bare HOST_SYS and
BUILD_SYS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/classes-recipe/meson.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index d08a83d555f6..a85d120d77f1 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -79,7 +79,7 @@ llvm-config = 'llvm-config'
 cups-config = 'cups-config'
 g-ir-scanner = '${STAGING_BINDIR}/g-ir-scanner-wrapper'
 g-ir-compiler = '${STAGING_BINDIR}/g-ir-compiler-wrapper'
-${@rust_tool(d, "HOST_SYS")}
+${@rust_tool(d, "RUST_HOST_SYS")}
 ${@"exe_wrapper = '${WORKDIR}/meson-qemuwrapper'" if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ""}
 
 [built-in options]
@@ -116,7 +116,7 @@ readelf = ${@meson_array('BUILD_READELF', d)}
 objcopy = ${@meson_array('BUILD_OBJCOPY', d)}
 llvm-config = '${STAGING_BINDIR_NATIVE}/llvm-config'
 pkgconfig = 'pkg-config-native'
-${@rust_tool(d, "BUILD_SYS")}
+${@rust_tool(d, "RUST_BUILD_SYS")}
 
 [built-in options]
 c_args = ${@meson_array('BUILD_CFLAGS', d)}
-- 
2.39.2


