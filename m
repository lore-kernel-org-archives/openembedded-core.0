Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07752C001DB
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 21:19:19 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.93780.1691961556794522084
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 14:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=cUd9Qv5C;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-56546b45f30so2914477a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691961556; x=1692566356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOa7PDJ3FLLFj5CqJb7EZ2kH1HjlXGrArLuMP1Ci5/g=;
        b=cUd9Qv5C0E7RUSvOZydaAtR7sWorExLjs8XQ/0ZLgPyyZkg135sfRBILAaa6YpK1Ud
         fqhFuqLGzsDIcZCqCNd0YyUr13oXhXSgZ8vQ2E6fJTKVWCuiojI2rO6ipFuQ8Q2okYwP
         EJznGLxUxwL/dndYK6pJlFFu+Rx2fDjrogvxR35cFZiFie9D+AQvl1D7lDfm2ynD8y+z
         v0tEAKMjruPDUOupRnqAcR1E2R+nHWdPmbHXKrsu2JRgQ0ObGSGaaNu9iUx3/MA7g9Cz
         SUVpWc4yMYI9zkfUQwYBEje+THZcEa/a6SaLulgY0g1S4hbDsiyrNInhbmpo+Mz9fAN6
         eHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961556; x=1692566356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOa7PDJ3FLLFj5CqJb7EZ2kH1HjlXGrArLuMP1Ci5/g=;
        b=JzKFo8EdcQfdel1moUejI64CaJ9UbBicwMyQITK2DI2j136e55rfyTowuqHgWz63uW
         QWqNLJCN5bp0bQbkcDi0bLu7BC9qvborLjyynVTC2G7ZOcPFOoWJGWnHJNMqTAtCHR9P
         BD4CVrfAfTGi5wnJFoSo2C6QrvY1wHAqOVhGtsvFshxWS4+ykpbHG2+bq51vIVxh51Cf
         fWLa68S1yBPnj3dUm0MUdNg03JsUQPUyWbHKmqlw8UtbajGL7yJOj7VopmJoPSLY++bt
         IohM/oEheGPF8XLF9r2XZwSD7qDFxml5mQU1KvDcvmScKDl2jqvmOzSuR+C9iH40o3/O
         BFgg==
X-Gm-Message-State: AOJu0YxFkwdw0WJo4JP9mro1Vk2t9rGB4muAaQZz+eGyQXymgGyUdNYK
	SMH9OKeC3kIMP0E1/p5qp6LobUrmuLapP7CL9C/FJw==
X-Google-Smtp-Source: AGHT+IHHJ+zV5DuVpwlGutBI3Sg/fDFDOJdNUwIADoJPJG6Ljq1botZctYJW7VNUcRekyGBptlg7AQ==
X-Received: by 2002:a17:90a:bc01:b0:26b:1da1:58af with SMTP id w1-20020a17090abc0100b0026b1da158afmr7212078pjr.47.1691961555912;
        Sun, 13 Aug 2023 14:19:15 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8690578pjb.0.2023.08.13.14.19.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:19:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/22] cve-update-nvd2-native: always pass str for json.loads()
Date: Sun, 13 Aug 2023 11:18:20 -1000
Message-Id: <4efdf7a93254056b9ac47de470740ac113b031f2.1691961051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691961051.git.steve@sakoman.com>
References: <cover.1691961051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185905

From: Yuta Hayama <hayama@lineo.co.jp>

Currently json.loads() accepts one of the types str, bytes, or bytearray
as an argument, but bytes and bytearrays have only been allowed since
python 3.6. The version of Python3 provided by default on Ubuntu 16.04
and Debian 9.x is 3.5, so make raw_data type str to work correctly on
these build hosts.

Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 2f7dad7e82..67d76f75dd 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -136,7 +136,7 @@ def nvd_request_next(url, api_key, args):
 
             if (r.headers['content-encoding'] == 'gzip'):
                 buf = r.read()
-                raw_data = gzip.decompress(buf)
+                raw_data = gzip.decompress(buf).decode("utf-8")
             else:
                 raw_data = r.read().decode("utf-8")
 
-- 
2.34.1


