Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BACC63797
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 11:41:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.4088.1675510896784800251
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 03:41:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gl5103jZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso7722769wms.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 03:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inI1yoXCEN82IIopRlXqJevCM7eTDrwX1BMCkm5mMQc=;
        b=gl5103jZAZUwuCeI/AxQbOgXazRYaafZZhK0QLrcvMSyZQPzA54KPVM5kPoQvultxG
         EpqjsXJVsBVJ8QHf5hmS01mS+RRZll4uiztgxHdkEtlfzOzgP4lDUQNbswcDV0wA1C+n
         slhmhdCduYDaJxxh6zMxYMGNNeWNVi5km6Iec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=inI1yoXCEN82IIopRlXqJevCM7eTDrwX1BMCkm5mMQc=;
        b=EI6P3LCtRX3rWEkIBSTAjwR94RWAy0rStIMWxjH0N+Qyw5+GarwJDeK2rQVWpkfpm9
         2fF1IM6xvBzEvo2v8XWm5TvNhu0H4Zm4LlSHQ0P1O+POF5zimZ76oqv+0vHEKhmCvUB0
         2i92+1AfgN/NaJpzWZLpsPw+t6s1qVDsTyjQ2IeYqESwGNQgAdgD0jzDMnKXvmK/9WUd
         o7bRz7zPqXCyFMvDPTGlHy11YuuxGcpuAMIFzLSmhME0I3BEpkDouov1jIhC0HBNIbFa
         YYYs0dIA5O1qxOqf1oo3fqoN6xyDbQxa3vHsX0lQCs8wHnszEF1sd2ikECQ29c6kVAj4
         RMCQ==
X-Gm-Message-State: AO0yUKWGrZJHgCxsTSciGCg+1EKwbdyaAAFy19f6pNQPI4UgcL+934ZZ
	b2B9TdOIIZQygRGiXprkrN8nBhO2QYxUTnJj
X-Google-Smtp-Source: AK7set8F5jodd6QcWSERWs/cKIJ5bYsPwvchGdQoFduGY/RjL++08esGXuKOGIGfUkqYuyfMF5ghEw==
X-Received: by 2002:a05:600c:511c:b0:3db:12a:5e65 with SMTP id o28-20020a05600c511c00b003db012a5e65mr12387024wms.4.1675510894846;
        Sat, 04 Feb 2023 03:41:34 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b45c:7b35:1c6a:a06d])
        by smtp.gmail.com with ESMTPSA id y6-20020a5d4ac6000000b002c3e18119f2sm721970wrs.29.2023.02.04.03.41.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 03:41:34 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] libc-locale: Fix on target locale generation
Date: Sat,  4 Feb 2023 11:41:32 +0000
Message-Id: <20230204114133.1178502-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230204114133.1178502-1-richard.purdie@linuxfoundation.org>
References: <20230204114133.1178502-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 11:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176760

If on target locale generation is used, it fails at first boot showing
errors about a missing directory. Ensure the directory exists.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/libc-package.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/libc-package.bbclass b/meta/classes-recipe/libc-package.bbclass
index de3d4223a8c..8a99f73ae72 100644
--- a/meta/classes-recipe/libc-package.bbclass
+++ b/meta/classes-recipe/libc-package.bbclass
@@ -51,6 +51,7 @@ PACKAGE_NO_GCONV ?= "0"
 OVERRIDES:append = ":${TARGET_ARCH}-${TARGET_OS}"
 
 locale_base_postinst_ontarget() {
+mkdir ${libdir}/locale
 localedef --inputfile=${datadir}/i18n/locales/%s --charmap=%s %s
 }
 
-- 
2.37.2


