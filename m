Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FF3D743E5
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 21:50:17 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.524.1732139414224191312
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 13:50:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XwjjC5Q0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-431688d5127so1457635e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732139412; x=1732744212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PK9Zh0MpsS2QdYw7D8we0trHdW6T722U4HtehMqFd9E=;
        b=XwjjC5Q03PfOAX/2BB9IsJE0OCVrQWWldOlGGjSV2qHmp7YqxDMjobZTsV8MHg9RtZ
         Uu83BQYWP7Sx43a9NNc4vThYPbIBnAYrjRI9TZzBiOmNx/LCIim207IND00gmQgutwyK
         ++XtLGxDwtWJTriR12vIJn9Fl3KScsnW4jngM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732139412; x=1732744212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PK9Zh0MpsS2QdYw7D8we0trHdW6T722U4HtehMqFd9E=;
        b=fF+MadyxHHAPsnwG/NX7HD6g6ZbfBT7kaZjhGuTlD23YFQG+lfNW6pZGVy0DG1CBEN
         G8EhE1ZhEx3kNTV+2q4G5Yx8xA65aRg4fdoAWasVQo4xMfRloTQXxy9iR3GfOLfDDNLA
         N9VhjEHVP/1wQx5DbvPx6L4Fs5eSg47CYW6QlmDFu2V6BHFXkyRafGAxeIBKAFVjigeo
         UmbG/DjToX4lk6lKU7St0Ren7YlraecpfqORW2Umj7WZkGjpDwfMdMJU6ucdcBxpkNx9
         KOlHR2CEAEvFJsAwJjtuvTB/h5YWBJSN/UapdtwWIrCLvVYoBcoc8WImytnzW2AioikG
         YD/Q==
X-Gm-Message-State: AOJu0YwYykk/3gO6K4iHry1Es09ZSiLk7IcG2G28RaIKA7exNgIZTX6U
	ttzUZ86EgdGOY54mBM2I8jjfLepzySYLtjPhU8hOJOL/iiwgB8eHj4DlfihwJVjgGOIT6KhBmDB
	9Vmc=
X-Gm-Gg: ASbGncusuxFzmdumw2ivjWScDp4Of2PbadEG2ZXVJRD13uWzXhgIgqMUHYjHLYp/3Pn
	dowHlVYDGPTx9qVdP/Z5P28JbqlYw0Iw7Mu15C6O2FaDLkZQjGFeRsqf5rz+cDmt9fOA/r2G9P4
	BcgkXu3fqwun4GWmVK+Z41L/lAHd/TVm2exZjBtuYHfJ9VihL2M3lDW+vbv+O4UbFIDycFZWpEo
	tVrGYZ7cOr1lpwuRNVkC3kCUlokLJ+rUt/P0FDxn8gDy7mL+jUTLfkKDxG9O0IXzuAeqldJArF0
	ZHk=
X-Google-Smtp-Source: AGHT+IHLLIk+BgUBcPG5cX3+H6rfuLRUbGoGimZz0jNtIIno5+qRp7SNZA45ZMf6pZU86aqW5EKh7Q==
X-Received: by 2002:a05:600c:c0f:b0:425:7bbf:fd07 with SMTP id 5b1f17b1804b1-433489868f0mr37712855e9.5.1732139411702;
        Wed, 20 Nov 2024 13:50:11 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5abf:50dd:d6fd:8415])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45d4288sm32733685e9.23.2024.11.20.13.50.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 13:50:10 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] site/arm-linux: Fix typo for sizeof_char_p
Date: Wed, 20 Nov 2024 21:50:08 +0000
Message-ID: <20241120215008.2486508-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 21:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207487

I noticed a typo while looking at the file. It doesn't change a value but
worth fixing since I spotted it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/site/arm-linux | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/site/arm-linux b/meta/site/arm-linux
index d3f4939ab8a..b06ce4adadd 100644
--- a/meta/site/arm-linux
+++ b/meta/site/arm-linux
@@ -3,7 +3,7 @@ ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
 ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
 ac_cv_sizeof_wchar_t=${ac_cv_sizeof_wchar_t=1}
 ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_char=1}
-ac_cv_sizeof_char_p=${ac_cv_sizeof_int_p=4}
+ac_cv_sizeof_char_p=${ac_cv_sizeof_char_p=4}
 ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
 ac_cv_sizeof_int_p=${ac_cv_sizeof_int_p=4}
 ac_cv_sizeof_long=${ac_cv_sizeof_long=4}

