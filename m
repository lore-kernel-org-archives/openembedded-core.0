Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5740C369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 21:48:39 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.26322.1745272109903291875
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 14:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ROwMV51q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c30d9085aso3231643f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 14:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745272108; x=1745876908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QMFZ8N0YXioVjsEbc/5EYPopHV6s/i8IaDqGQHV5KiU=;
        b=ROwMV51qd7G7ZpVm0nKivp/Ka9Vrsq9IvPGj7gSVqeCnZVUT3xkY4ln7VQir5Ualug
         ebhWHdhk75tl3eG7pit9eiDwuJRGl1uxdplkb7Ko9jbAlcdSd59NUUDo1ybutJNIfTiG
         jt+vXEVNWWDQEVjqhfcOK0jqL2W/HYYvPlIW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272108; x=1745876908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMFZ8N0YXioVjsEbc/5EYPopHV6s/i8IaDqGQHV5KiU=;
        b=eFzPoD3iNfpCBmHqjq7QQdNJBWsfWMgBe51OukwpwQJxTHYYqVyYXK7/e5vnFmLdqk
         zspUFV9P1ttL2rUAd15V3E4wltqv7ZSPwxOBVr9kHmrfQDSNWb5tItgngzdAHRcrT5Ct
         R9lFJsNIAGZgDO5TKaqoi5vcyd3ErqqAn0gxPFeAx/y7WsU2vWvkR0sTlWxK/xOv2bS2
         fcU1ROnEz/kf7hIa3c3n8+QDR+lz6PBwjPh6DTgBRpEIUP9CbNbcqqm+2wgJrU/WrnDW
         iVthVIZnGfg5k+Jd5sGXT/Gqx+85itccuiD3R8Qs29uX2wtFMlEpKsoiZipTx1RdSics
         MJcw==
X-Gm-Message-State: AOJu0YxU7Y+R2aUg/Eh1FZkKCmMqeNIp+q8/XRPJY1e18LhuNhCY4QNN
	pfqhvVX653WjBOEl9uKfc8LE1ogxOr9+lDpklxOvLJGUfnnMapgYrGltNyTLTeay/i4koje+y/R
	S
X-Gm-Gg: ASbGnctyEu3U1l+onkwWf1IRaR50WXqoHeBq4dNCcFps/PnaXmJ/r6TRpvPxNMUUXK5
	X9grqgZWqF5B5/bMteN3aN9DkcZiJIhgQdZCfo8M8BdPMV8EfHGFYOobucpi1reH78MgI5Z90dL
	SPbqJ65ygM3huhzdomqWmf/hrNV0kPgCv+4OjmuGJEexmMjkEmDD9VeuXxbrjD4lCiyPs6MsJhl
	jZtYi8Dezq5dU6n4I5a0OL4CF2UqR3kP8BHk28V1PViKsdn8bOUqI3ZIF96dV8m+u6KMhn4CeAE
	A8bZiWwZlDYuE1C19zurg74FijRjQ/3u8qz1YIEVOKLjso73TLYfHMRgO+TqJBHBdafxkg==
X-Google-Smtp-Source: AGHT+IF80tjMNDf5F4G7BUB9SdlDRtTw7lwYc4w83L/d7PHt8l3DtZMpiDN8HtcjZLdLsyZzyXYV8g==
X-Received: by 2002:adf:e90f:0:b0:39f:601:85fb with SMTP id ffacd0b85a97d-39f060187f3mr4979564f8f.2.1745272107808;
        Mon, 21 Apr 2025 14:48:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1f12:50b3:e6fc:b6f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5cf2dfsm151261685e9.29.2025.04.21.14.48.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 14:48:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] lttng-modules: Upgrade 2.13.17 -> 2.13.18
Date: Mon, 21 Apr 2025 22:48:20 +0100
Message-ID: <20250421214824.3335730-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250421214824.3335730-1-richard.purdie@linuxfoundation.org>
References: <20250421214824.3335730-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 21:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215187

Includes fixes for 64 bit time on 32 bit platforms.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{lttng-modules_2.13.17.bb => lttng-modules_2.13.18.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.17.bb => lttng-modules_2.13.18.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.17.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.18.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.17.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.18.bb
index 0657112c14a..553dae9f4da 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.17.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.18.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
                 "
 
-SRC_URI[sha256sum] = "b0b23504150ae5c1fc6ee14e28d029518f61fe2ec5f17bb61c7941aa52bb6e65"
+SRC_URI[sha256sum] = "a2f38e289817dbd1d2f12cfc1f20390230e16d56323cb58cc1db9874ced400ed"
 
 export INSTALL_MOD_DIR = "kernel/lttng-modules"
 

