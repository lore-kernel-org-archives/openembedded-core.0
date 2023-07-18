Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E79EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:27:09 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.9028.1689690427681036511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Q9EYcDAF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6687446eaccso5767996b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690427; x=1692282427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EwG9jzXzKZaqF7lTz50dAdWZNH2o3hRF8bBW50tnoA=;
        b=Q9EYcDAFiXIDBoPu+UVxcxRizCYAZMN45Qcc39gcxTovuXlfGHrSDmNbYh1xFpnPaD
         bi1CFQ3k1z4s+ljX88mrkBTzvJAkxgkRqOB0r9X7iZELo3kbXGIOWbXZCdBWxhn8gGCI
         os7SJOtIfUIvY4mEuqxpa3xEDgUG6ZcM9uEN4QzLFnaGI7YoEjakxeUu33RPW0x3+o9D
         ogoM74IzbYSOI5qNPmCaR096NONGpaqtyn+w6eASN4Ionwzfbw+9g4oaSsXaPoL/sWWg
         A3Cuys4EeGxOrUJ+0eYDBCkyPvHRiyyF+jtjdtwd1bUmcqMPQgsNITCpr0I1J2DzzbLO
         uqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690427; x=1692282427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6EwG9jzXzKZaqF7lTz50dAdWZNH2o3hRF8bBW50tnoA=;
        b=Lt9FpBtPhLiHXwJKqYXjGX8LIIdSp8+dmIj7vAoopEC27um113TNP7pwxOsH3A04tb
         F8jDLkoNEycrlzQ3VwIeqUM2IO00RyGyJj4LWl1M2PxHolSOvXwHAPwcABRROVOnSbCZ
         0hhHywiGpo2oaTcNsXwdNaZ0Tf7y+6KdSM6KKXyIESnKWFehwjlDRYcao2QluJERItfO
         xyU8hSGMSIo6FplvQvnuH9oNWzqrmK1CBVMEyuJI1MiB/pn8zM+EKkjeKp5fev1ndKMj
         QPYJcFzHWNayHcz2SL41UCurhqi65x0kI4xCTRxdKpd2g5/gpD9WAT1/wnktAXSf+OEV
         onmQ==
X-Gm-Message-State: ABy/qLaI0t/x3Kc1h4PHmnW0vaMpzE56FKOILRch2WZx0Jgp/fi+s2CS
	unlRRwnDBABeWLSXWC1Tte5rRiI7hRBcTwkNOcg=
X-Google-Smtp-Source: APBJJlGe1ez1HB8Ur15B5L4IlZh77DUOsU9srTkIj6bNJSS0bbkzDBk9FhLIVZUxr9Lf3H/be48lHQ==
X-Received: by 2002:a05:6a20:d9:b0:134:4f86:7990 with SMTP id 25-20020a056a2000d900b001344f867990mr8386829pzh.3.1689690426826;
        Tue, 18 Jul 2023 07:27:06 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.27.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:27:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/27] sdk.py: error out when moving file fails
Date: Tue, 18 Jul 2023 04:25:55 -1000
Message-Id: <4ed94fef70df05c874cf0c68dcc95c5636687825.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184525

From: Chen Qi <Qi.Chen@windriver.com>

Instead of printing an error message and continuing, we should just
error out when moving file fails.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 12aecd9da94b5f27041982c661e8bab316d365d4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/sdk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 27347667e8..2383bd58b7 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -68,7 +68,7 @@ class Sdk(object, metaclass=ABCMeta):
         #FIXME: using umbrella exc catching because bb.utils method raises it
         except Exception as e:
             bb.debug(1, "printing the stack trace\n %s" %traceback.format_exc())
-            bb.error("unable to place %s in final SDK location" % sourcefile)
+            bb.fatal("unable to place %s in final SDK location" % sourcefile)
 
     def mkdirhier(self, dirpath):
         try:
-- 
2.34.1


