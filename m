Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E57C433F5
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 13:15:30 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.5434.1653138923392159367
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 06:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fqa5iSKe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id n6so5848813wms.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 06:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cXg4Ylf+Ti9JKtPOEj0D6+hWsQRs8fv5hVQ/wBC9S48=;
        b=fqa5iSKeEhoKizG0iy6n9iBdiG8/0yDtBNp8h0OawWmtuto1GPEoUgS/IVh+1wc2up
         tdh6v00Tyfm2JV01V4AQh+s703YR2zNrTEiH3WT/Tz/BeJm1xazgAmd3/vJn6tWBYKAZ
         ZI8vR9JNKBVvht/sBUMNCZJfeqf1lpMfbneaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cXg4Ylf+Ti9JKtPOEj0D6+hWsQRs8fv5hVQ/wBC9S48=;
        b=ed7rB82ilNcjOfio7GqhwFmFGEhc5ZYKeuWrfUoPspSZdaVmcdM5mhax3oxv01sFOf
         uHfah57WstOllRt0vh18ZYLhaFhU/ZB9uZgLu5WUvPj1RzGwEoqKtaYJ+nQrtxAa3+MF
         URlHYlK6vyQ3pZc0dHFN4rv7iX7jPT4BfcjHVmmzD9JNgkObgAu5VUb5skPIR2GmCxN2
         gHSp3sF1dojmK3aLNRpjhJjCnx2dQSU5iXOWY2G7rfgc3lZXhalI9J6xwat2bL9qS8M6
         VxlcncFjMusjZD+8U2GIzorX0oW+BB9agjswBUOUvxRoTOLgNqm3oSbhFxlgtdJ+T2ao
         eAXQ==
X-Gm-Message-State: AOAM532i1ptbFb9wzAJ+5A3W6HAg9J+3cdYO3Vp8Ubtf0+wnVzoG7Z/C
	2b4jcnSaHkfIdocgSv/Aa5u6OA2vcwp5UtIJ
X-Google-Smtp-Source: 
 ABdhPJynNaWeONECetAZf2HJLD1N9Q5+EGFQvkCQDHFcgwV6Li2JI/qEtk3eqOftTzy6JJhbt4hkoA==
X-Received: by 2002:a05:600c:354e:b0:394:89ba:e211 with SMTP id
 i14-20020a05600c354e00b0039489bae211mr12720753wmq.86.1653138921722;
        Sat, 21 May 2022 06:15:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d812:46de:9e00:ca1c])
        by smtp.gmail.com with ESMTPSA id
 r11-20020a1c440b000000b003942a244ec4sm4847481wma.9.2022.05.21.06.15.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 06:15:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] rust-common: Fix native signature dependency issues
Date: Sat, 21 May 2022 14:15:19 +0100
Message-Id: <20220521131519.179261-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521131519.179261-1-richard.purdie@linuxfoundation.org>
References: <20220521131519.179261-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 May 2022 13:15:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165963

The previous changes cause sstatetests.SStateTests.test_sstate_32_64_same_hash
to fail since RUST_XXX_SYS changes depending on the native architecture. This
is correct but these are accounted for in the layout of paths in TMPDIR so
they should be excluded from the task signatures for the correct behaviour.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust-common.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index 3cdce3643907..621cd4ad5760 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -347,6 +347,9 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
     with open(wd + sys + '.json', 'w') as f:
         json.dump(tspec, f, indent=4)
 
+# These are accounted for in tmpdir path names so don't need to be in the task sig
+rust_gen_target[vardepsexclude] += "RUST_HOST_SYS RUST_TARGET_SYS"
+
 do_rust_gen_targets[vardeps] += "DATA_LAYOUT TARGET_ENDIAN TARGET_POINTER_WIDTH TARGET_C_INT_WIDTH MAX_ATOMIC_WIDTH FEATURES"
 
 python do_rust_gen_targets () {
-- 
2.34.1


