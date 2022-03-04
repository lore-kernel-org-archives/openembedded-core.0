Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA778C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 16:41:01 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.579.1646412061069731830
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 08:41:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vdsic+mN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id k24so4052509wrd.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 08:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ylm/Jo5m6AQtgSlDpvyNB+VzyGiucFClLUV224gDXNM=;
        b=Vdsic+mN4UQYiwPlvTleZF7ypG4LNMtIr3Ew6aOiVEjpyTVVjnMcSvbUuPz3s1EOEE
         PdaEGi1GiNUiHlyiHmtiMB31e5/iJJ80AslWCd1Z6YgPu9mLcN4wyfeD6Ohg2lfQ2de4
         BhQr5Cxs3MtIPpRQz66/FsVAsrMCk3rJXb/o0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ylm/Jo5m6AQtgSlDpvyNB+VzyGiucFClLUV224gDXNM=;
        b=KfMAoeWEpuOaui6y/Erqt+pc3hO+H3VcMPT/OKysmZLiJVY1NG/MWijR4mSdfpkmuh
         qsp3V+bpHT8hXbdSnQnErl4tz+7Krveqve2qmmm+rSaGhw/PFFRtYKPwEuK//Yt12ES/
         caogP9AKQttM1VhNTBP5JUaePl1bG2/RbLPZ9DoXQ8IrRKSIAKDFUSRmhpJeEVUKx4O6
         GWuT9n47DEQr0bpUDG3eoc+H/wQygtOkveqiyJvH1JaAQIlNNUpvXe21xzHpq+0+w1m6
         ZYRns5G09FYwuqjH/kkHlbiUTtCs1OZS4UFrVIdGdINqc3cL57BsfdjczGxz8XC1Z6L0
         /XVw==
X-Gm-Message-State: AOAM532tYdCGVxAh7qi8qvfue3N3enkN3sR61rC5XQP3MwNVMNDIOF03
	5ZlC0lwStRZ+6NxWJaX2mZ5oprUK9yd/NIUy
X-Google-Smtp-Source: 
 ABdhPJx+k03b1yf6W3tLgQEW9/ZEgbG80UI9iAHrrN/Ao2nll2M0PARRiJ8Pk96TTx3o5AvVcWxEvw==
X-Received: by 2002:a5d:68cd:0:b0:1f0:771f:82a with SMTP id
 p13-20020a5d68cd000000b001f0771f082amr2929748wrw.613.1646412059208;
        Fri, 04 Mar 2022 08:40:59 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f5cf:8b05:e0eb:94af])
        by smtp.gmail.com with ESMTPSA id
 d8-20020a056000114800b001f045f3435asm6970536wrx.108.2022.03.04.08.40.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 08:40:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] python3: Reduce util-linux dependency to
 util-linux-libuuid
Date: Fri,  4 Mar 2022 16:40:55 +0000
Message-Id: <20220304164055.379402-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220304164055.379402-1-richard.purdie@linuxfoundation.org>
References: <20220304164055.379402-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 16:41:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162741

Only libuuid is needed by python so reduce the dependency and hence
reduce the amount pulled into the syroot for the native case in particular.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3_3.10.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.10.2.bb b/meta/recipes-devtools/python/python3_3.10.2.bb
index e61b23c6a9b..32da2a12c8d 100644
--- a/meta/recipes-devtools/python/python3_3.10.2.bb
+++ b/meta/recipes-devtools/python/python3_3.10.2.bb
@@ -71,7 +71,7 @@ ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config
 ALTERNATIVE_TARGET[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}"
 
 
-DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2 autoconf-archive-native"
+DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux-libuuid libtirpc libnsl2 autoconf-archive-native"
 DEPENDS:append:class-target = " python3-native"
 DEPENDS:append:class-nativesdk = " python3-native"
 
-- 
2.32.0


