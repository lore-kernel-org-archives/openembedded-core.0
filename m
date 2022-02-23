Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9467C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 20:07:33 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.776.1645646852406471376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 12:07:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WBC9X/P/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id l13so454159wrt.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 12:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CEq9EsLddJEVb6LU2F3x3fJsQISwfLkJ0zfRl2HpcMQ=;
        b=WBC9X/P/buVCICpFqo98/VwpRocztktpkvn/YI88I/YuTEIZ85RU+4YKA7U/7CCag5
         6ePg1N6ph7ujztuUXg8xGAyrXki6FeXG6ALoXksHAgCCDdBsH/wBtjCCwRtoepVVuY4W
         d16y6/8wGHAnLMybXbqUxRtOD0O54JcTvg1Rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CEq9EsLddJEVb6LU2F3x3fJsQISwfLkJ0zfRl2HpcMQ=;
        b=dsRS32vz6WkyuQtfSdLWajcIwMiEIcqNHeLsYoYhWWaZuELSUs3BDCOAUoRYQbmnWx
         l/XpAgRdEmP7cm9uY3Mq3Yew/Ybwx7hQskQt7uCAm/+5YG0axYR/QKRA/L+EoAY7NmQU
         MI+PaJx8nvtDcN0T3/7JWHz91bWaOiyxfynpzQ5LvQ67eHff2easvZ8pogQnnT+p6p91
         SnmALNw6zq+H5AntnaZuVTOWN+VoGsvjhItM7W9HIpt/PjCxqWpHbDUjgyY30qGKiueb
         1YOjs2toZmxzMFHvvobbgH0Z5V+Bw9AjPJw8BuvL5qeXQug9XhcasjlKy3F7MZyXfE6m
         oMJQ==
X-Gm-Message-State: AOAM531tsMdztzEs07pDIwvEnht1ngch/+vOYxNE+wSBjKoxFFHbHdTL
	A5A7+wbPJxBTs4kwDkjAU4DtPzAdouXa5kav
X-Google-Smtp-Source: 
 ABdhPJx/b8/kjDD26zUjd8EH5srUwHEYgVxCcHhB5K6qMPjAkhyVjxBhYNKFeaqrBkWRYU9daag2cw==
X-Received: by 2002:a5d:628b:0:b0:1ed:a09b:aea9 with SMTP id
 k11-20020a5d628b000000b001eda09baea9mr932637wru.565.1645646850732;
        Wed, 23 Feb 2022 12:07:30 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:4709:85d1:7b5:8346])
        by smtp.gmail.com with ESMTPSA id
 w13sm532435wrv.21.2022.02.23.12.07.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 12:07:30 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] python3targetconfig: Use for nativesdk too
Date: Wed, 23 Feb 2022 20:07:26 +0000
Message-Id: <20220223200726.3279678-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220223200726.3279678-1-richard.purdie@linuxfoundation.org>
References: <20220223200726.3279678-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 20:07:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162276

nativesdk is a cross compiled target and therefore should use the target
config, not the native one. Copy the target entries accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/python3targetconfig.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/python3targetconfig.bbclass b/meta/classes/python3targetconfig.bbclass
index 5c8457acaac..2476858caeb 100644
--- a/meta/classes/python3targetconfig.bbclass
+++ b/meta/classes/python3targetconfig.bbclass
@@ -15,3 +15,15 @@ do_compile:prepend:class-target() {
 do_install:prepend:class-target() {
         export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
 }
+
+do_configure:prepend:class-nativesdk() {
+        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+}
+
+do_compile:prepend:class-nativesdk() {
+        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+}
+
+do_install:prepend:class-nativesdk() {
+        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+}
-- 
2.32.0


