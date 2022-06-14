Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504C3C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 13:17:15 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.5982.1655212625115459385
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OljoBu7j;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: ptsneves@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 m125-20020a1ca383000000b0039c63fe5f64so4799831wme.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gd+TT2+h7sHZ8k4eCB3EylAjwP5hm50V6/bgYDIOHXA=;
        b=OljoBu7jKbD3ngEm6mug8aTqO7JBq/oW55xrKp90H0Zl03+RtsooxHCyh8Lv8Y0kP+
         Y9yjvHRQW2JreffxOegfOXbzHe/ixZzfDFoesztgbqKrTV4gHruZmUg06QU/0JHsvivu
         5TSMCP4ijnCuj9TEx5Ywfli3KZsV7GRfQZffPoPp4/Yj4ogwdqBQNy7mMlPb4I8UbLuB
         B/0MJ1kf7BV4wv8ievgW11uzl104vR9S6GEVhhnKLlzABwT+B7hTQxseFOHg77LpYYJO
         cP1ovhdtV7v5ZFv94Fen31oTkpIIR7LW8RDPZbMj4esLrowkZwJ0iNc4Gxh7cRUXYw+n
         TIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gd+TT2+h7sHZ8k4eCB3EylAjwP5hm50V6/bgYDIOHXA=;
        b=szjsEw7efUXVGNt4zbGQ1yf7l52OAphmUVBzDzfKBOqegIa/1aaQM9ToOl73DBz07c
         5dm1ORiGIUgdYyvMAnEYMgnxm2GjIeNo1cl1RDa0wsuUQprT2kZtVjabmNXWud1CD9v5
         ELDkeY9DBjCzx9nDy48Ny+bQD18Ma2WK/Iu6LMG1ErDUG5J2nSzm3NYIzV9XWo/cBF/A
         q5K9cexdJW427LiG3gCIzFDvtQD5zGDV/UiERl3iS4Q46WmjdQm1/8Eqt1AsVLg2eT50
         2NlUoiaXMvmqpNOkT2pJWPDdbVR6ChXc7QnhQJqlleeskv7olnR6gN+K0AZwOwKssthn
         V+bg==
X-Gm-Message-State: AOAM5309iEabmjQhoLeQAdN5R/I4f5PnR7MhP3+G0wN5xwi2bF+hM7Rj
	wGFlc4N7S25xJo+UK0N1KFvQNSpp5Q==
X-Google-Smtp-Source: 
 ABdhPJw2YjeArArXRWLULt0bvNLF99NuOfNMegdtrmkqFeYQMgcsvSMoBPscE/cn6Kyk5Wd3Nn/Zcg==
X-Received: by 2002:a05:600c:1da4:b0:39c:8ca8:5f1d with SMTP id
 p36-20020a05600c1da400b0039c8ca85f1dmr4078945wms.138.1655212623744;
        Tue, 14 Jun 2022 06:17:03 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a5d6f0f000000b002183cf9cd69sm12161092wrb.15.2022.06.14.06.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 06:17:03 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v4 7/7] libcheck: Fix too long shebang for native case.
Date: Tue, 14 Jun 2022 15:16:52 +0200
Message-Id: <20220614131652.566471-7-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614131652.566471-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220614131652.566471-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 13:17:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166888

It requires a shebang wrapper due to the fact that awk interpreter
has an argument.
---
 meta/recipes-support/libcheck/libcheck_0.15.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libcheck/libcheck_0.15.2.bb b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
index 188d689cc3..1393aa2a1c 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.2.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -23,6 +23,9 @@ CACHED_CONFIGUREVARS += "ac_cv_path_AWK_PATH=${bindir}/gawk"
 
 RREPLACES:${PN} = "check (<= 0.9.5)"
 
+do_install:append:class-native() {
+    create_cmdline_shebang_wrapper ${D}${bindir}/checkmk
+}
 BBCLASSEXTEND = "native nativesdk"
 
 PACKAGES =+ "checkmk"
-- 
2.25.1


