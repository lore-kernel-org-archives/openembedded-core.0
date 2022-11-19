Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36DBFC43217
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:28 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.26318.1668880101379279032
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1YEPeKLP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id y14-20020a17090a2b4e00b002189a1b84d4so1405041pjc.2
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mcFAsnghJt+5On3xKYr6KDnszmlPYJby7b1bn8r6vZA=;
        b=1YEPeKLPIbOIBpgLlsQxQrI9sMZCLMQT+3TSvrqP7fSI3vmTYUKavAreqVsfWZ/22E
         G9ifxGa7Gi0M7sJEa/J++Fo9rbhnbGNpDdukHAqoRbZ7tN7Em4gTaSruO6GAlCXvQ81x
         dY4c0vvGBc/BB/0+wTyI6nBzw3IJTBGrJCyDvX70fOZBs2daKT4nBr5Rj3MMIwqA+YrW
         wn8m1tv+Q0xZfhVgk4r+3P4ikJhweKTwwokSNC00pYl18GStaUtBI4Cpai4I33iBhWho
         oyizBMMzAqRG5QoYmn91H4edbLCkkObuTMhitiAppHU5xNW2bhuAQc3EmJ/DcsOXzpRc
         6nYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mcFAsnghJt+5On3xKYr6KDnszmlPYJby7b1bn8r6vZA=;
        b=0OcJErb0czJkFE6iHSkakR9rn/WJL4KP7KExLCxeyJ2aDE8k7A39MQlSIQpUhbW7n8
         GHJIpz4y5m14hCwKxi45L6HVjPvE7IoRtAodkm7oXPbYaztxD15p3nH/yjI8eQ9M1TOS
         L9B6g0uOPC7Z7jEqoihC5OBbIV5YdNQVCRg/jnHtbj5Dp1zpVOhdV38fCoTuoAz+XHON
         ZIwcxr+jkHfoldJpokK2lE7x9UZ/7NEI5C7J6U7dUvLcejJ9KgUENO2SQeI/BzSfPSB4
         wRFD1YFhS/stzBjypFbSGxBs1dVIIzG0H9NVqGEj3w67J5At20Vhtxpfb1ECMQ8sjX4Q
         7Osw==
X-Gm-Message-State: ANoB5plHS3+0hIcLCrVOdHcuRhlIz/RVAVE87ypVBLVhWlDDG52XrSIW
	utkVSerFFYmeLiqQzt7lv7PrmDVC0yBjeo2Y89k=
X-Google-Smtp-Source: AA0mqf5og1AjKojRgOh/ehLgrGmpy9ZjQ+2PF30UsDUw7/8LY1tldBe2nOncxwD2X6bi9C3khPToKQ==
X-Received: by 2002:a17:902:7b96:b0:188:b0db:cd5d with SMTP id w22-20020a1709027b9600b00188b0dbcd5dmr4728773pll.104.1668880100406;
        Sat, 19 Nov 2022 09:48:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.48.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:48:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/21] golang: ignore CVE-2022-29804
Date: Sat, 19 Nov 2022 07:47:41 -1000
Message-Id: <cbf04682a7793dfdc44d8f5db26fe022731ef638.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173531

From: Ralph Siemsen <ralph.siemsen@linaro.org>

The issue only affects Windows per the golang announcement [1]:

On Windows, the filepath.Clean function could convert an invalid path to
a valid, absolute path. For example, Clean(`.\c:`) returned `c:`.

[1] https://groups.google.com/g/golang-announce/c/TzIC9-t8Ytg

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 6e596f4141..a0278b9816 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -64,4 +64,5 @@ CVE_CHECK_WHITELIST += "CVE-2021-29923"
 CVE_CHECK_WHITELIST += "CVE-2022-29526"
 
 # Issue only on windows
+CVE_CHECK_WHITELIST += "CVE-2022-29804"
 CVE_CHECK_WHITELIST += "CVE-2022-30634"
-- 
2.25.1


