Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82C9EE2084
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 10:43:51 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8686.1770374625543441317
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 02:43:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kDI59TWR;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8231061d234so2107759b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 02:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770374625; x=1770979425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AR2VjVVxR1QZ2VvhU3b8vtj+gP67QpJk/v18D4GoxE=;
        b=kDI59TWRRdhh+T0mCIHpkKXt8wC0uoVdfraKrvTxFitHFyqYaloUddFkyomoVEABh1
         Ix6cTW2n9mMbc39OAwYK+RoMbOgh8NBkZvM4A9Nbcq3XIvUMHXQdIrsT69gpo39LbQAi
         dcoNRQQcDxpHKwCwWcYe9RiQusPJiasmCMEDC9h7hzElY9M8/qpo1mV83ITLlzdA0i9n
         v/i/Sp96TikRlGo/XkM8nsk8TL8qI3F9dedpg5wN2LeHPEw24jR0RAd+SqZam5L1u5HO
         AkRJIKi6MK9QmEZdM/MvX5vpx+gALI6lvu7ObSOHqn19ppX0qcH7Xa+UALF+AlV/i1F/
         /fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770374625; x=1770979425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9AR2VjVVxR1QZ2VvhU3b8vtj+gP67QpJk/v18D4GoxE=;
        b=xNn+05wOPlcFa0CugHUgvdvLx0JiW7SSGoZ/W4s3dQMFppmqEYMQ6q2Fb8UDJd8acq
         nguuEVm6W0tzYJ0/ZjvmmwoP3ZDSuIPP8oIGSipD4FtYi69ShqiSBC2qpoZh/UzdFAt3
         NNR9uBCpBix2GKHHuwp+kQTmlDzQT3Xhg6T3H52dV+0ng5SVnBkQGc9YbTs8XPV1AgOr
         ACYlajdx9fuTh8fNDimnnNDlIl6Ac+P7i40o6Clq53TlbnEqeDmRXuL8EngFOZqsYK91
         U92yhYHkSObKShPzd+gcSgMzQcmcaUIy65mEesFZXTSSITsA6DHyAoL9w2kQKjsB9LdS
         1bdA==
X-Gm-Message-State: AOJu0YwTGMQ302W9m7CYEsMdyMkvzY6M3pgNjboRgY7h3u00iY83tX4r
	u5jqpGXOVFoJ+bbH8ez29/J0hds6Zhihv9quq+vJBfgy6iiNOUbmB0iUN7jg0A==
X-Gm-Gg: AZuq6aLc0N+di5MbRNkIF3Ukmd4W/PO/lOsiWXLnfJBkT2RtznktiQSSGXYo+cRDK1z
	OIOMj6dS81fgI9uXl+ED1cGuqwKYLqXJu17YKwFn+2CluF9Xs7w4gIflLDbUErIlcFi/dZRp//j
	wfn2XQZcECT7RzltL3aEKNYFvyoUajciUY0M9oDhDyWCH+xcSHFnvR9RtvCOqQSWDlL+5bnZLV1
	9DDi5HittJr6nzuYVW+Et6bPZ6GinWg4bz4eXO0i+4gl/PN8XDyuvyc6jpg8W54q2vvtOG4Gnbb
	Imx8GJ+mZSlcm4iOBqAsSvRbbyYJ1r65HBmV7vzON1yYM8OoR5pgUUnaBVx9zAPZzzFcRFU2c77
	9e2P9l56h9WAWqhV063ql338WZ/+hFCQ77KhmG5e15D5Cg/63g0gMy07T1n7v7I7pEtnPtadQW6
	Z/sdCtRMVcMvuGXOfCznaqo8A=
X-Received: by 2002:a05:6a00:3929:b0:7ab:5e68:e204 with SMTP id d2e1a72fcca58-8244166b430mr2053715b3a.29.1770374624746;
        Fri, 06 Feb 2026 02:43:44 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418ff231sm2374434b3a.69.2026.02.06.02.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:43:44 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 4/5] utfcpp: upgrade 4.0.8 -> 4.0.9
Date: Fri,  6 Feb 2026 23:43:21 +1300
Message-ID: <20260206104322.2604271-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206104322.2604271-1-ankur.tyagi85@gmail.com>
References: <20260206104322.2604271-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 10:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230606

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

A minor release: removing static asserts for C++98/03 builds

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/utfcpp/{utfcpp_4.0.8.bb => utfcpp_4.0.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/utfcpp/{utfcpp_4.0.8.bb => utfcpp_4.0.9.bb} (94%)

diff --git a/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb b/meta/recipes-support/utfcpp/utfcpp_4.0.9.bb
similarity index 94%
rename from meta/recipes-support/utfcpp/utfcpp_4.0.8.bb
rename to meta/recipes-support/utfcpp/utfcpp_4.0.9.bb
index 628e8ee0ce..55780b1c7c 100644
--- a/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb
+++ b/meta/recipes-support/utfcpp/utfcpp_4.0.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
 SRC_URI = "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v${PV} \
            file://run-ptest"
 
-SRCREV = "f9319195dfddf369f68f18e7c0039b3f351797fd"
+SRCREV = "63d64de49fd6b829f7c8694df5ab2ee625cb7134"
 
 inherit cmake ptest
 

