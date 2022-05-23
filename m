Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2938C433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 12:44:14 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.27217.1653309851176370416
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 05:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CFGaeAmS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 r9-20020a1c4409000000b00397345f2c6fso6526438wma.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 05:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1tLmU8jUpJZLllpRWk+BnqfWCKQ25X+vjAda87ClwZ4=;
        b=CFGaeAmStoMbJfN43SwkceyGeJAEkT+oQ+WlW55R5Yv5tX4z351OtjPDOHJTKnPR2y
         cMD3991bjNlo/dhca25KXmVc4GSo0JMUBf84SuB3qdb0gnwF58YnKknQDr34pQQz3s80
         RClz0UFpLN88hPii+sCgK2gMGP71XI4QMJkTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1tLmU8jUpJZLllpRWk+BnqfWCKQ25X+vjAda87ClwZ4=;
        b=vsK0Ej88OOHJv8/L/t70h9W54jYNWF/c+cKBTwmr7viI8XPuPT7raVcXMNiKkmr6gi
         drDKNO2uiwyuWhCRy95mCbLoNiZ338oudpA/Vn+FTNM1ZJ2RRnI3ojkowv+KxVxzk3+2
         1gw1GMGtvcB4E3FcFgg1FHMGJCkLrYkdEoKGMe/4zTFwTCODxM4HHK0SMoulTZci/eNO
         FDqiEpOx57CLSCajuKa5raCDUVbq8enabQH2ZigFYYUDibCnrJaXgSx9PjMCLa1rB0Mw
         99UlL+a6LI8XDFJEIbTsIV6puHkDUraILF5deOCyLzDwkJTos38pLfCFYCCU+sNmd2wD
         rArw==
X-Gm-Message-State: AOAM533K6awsJhJkhLv86LHzdg+dIrMCCV+qxtE+2M6kjHJRUnxS7po6
	IIoGXgV8XQ+tMUmwkssO6lEFN9Tb+IQd9SCA
X-Google-Smtp-Source: 
 ABdhPJx90+nPI3jyKIhTPBmLdyy6NxrlTyJ80SJ2QmX3UXtrGdZQt6YogrEq5/Q7v+u0LegLwOtYCw==
X-Received: by 2002:a7b:c159:0:b0:397:30dc:6a23 with SMTP id
 z25-20020a7bc159000000b0039730dc6a23mr18424826wmi.202.1653309849345;
        Mon, 23 May 2022 05:44:09 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2491:f5e:6dc4:bd24])
        by smtp.gmail.com with ESMTPSA id
 r8-20020adfbb08000000b0020fcf68d196sm5457725wrg.80.2022.05.23.05.44.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 05:44:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] scripts/patchreview: Make json output human parsable
Date: Mon, 23 May 2022 13:44:07 +0100
Message-Id: <20220523124407.257617-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523124407.257617-1-richard.purdie@linuxfoundation.org>
References: <20220523124407.257617-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 12:44:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166018

Sort dict keys in the json output and use tab spacing. This means
when commited into git, the diffs are human readable but it is more
compact filesize than space indentation.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/contrib/patchreview.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview.py
index 002991c559cf..85d2169ad131 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -232,7 +232,7 @@ if __name__ == "__main__":
                 row['malformed-sob'] += 1
 
         data.append(row)
-        json.dump(data, open(args.json, "w"))
+        json.dump(data, open(args.json, "w"), sort_keys=True, indent="\t")
 
     if args.histogram:
         print()
-- 
2.34.1


