Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F27C54E74
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 02:22:21 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.34069.1710728534205296717
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 19:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=N8IJw64R;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5e4b775e1d6so2684834a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 19:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710728533; x=1711333333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LlF0xfcbVjc7bRjNrITLnkCHjGuUYBEIgIIr5Akhp7A=;
        b=N8IJw64RZK+C5q9ceA5R0l9FdxgrD4+09hpzlB4xB4iIr1qM5WxqLUWPQfWtx/uVNM
         Tleo481nbkyoaT77u3BzLOd0ZaPUnr8aYKkeLkRXstbsB1lBu2ECrlqR1/GyXRZxnwOo
         E+IXBvsSbw/qvL5Pk1CNoXYuAD+LYEyzNXzSubILDynJZxZTLjffOHUrJ+aZdNEFFiuc
         JxMX57dpjn3eLmEGS2p3MAzxqqmR9lUzGzvLpl/1WNYLxLDrWVa2B19/ocFKvmocTpNP
         aczYG8swsKjpFDIjLeEe5fN2jqLa4t2s88ZrbyIdDdTYUa51UO44O4IqEM0FvpU/lb2z
         AaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710728533; x=1711333333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LlF0xfcbVjc7bRjNrITLnkCHjGuUYBEIgIIr5Akhp7A=;
        b=HhusJTTQ3Z+wzDU+hN+Vd+Whz/hxcopt8O3NXJhGdp2CAsvpiLnJ9UUIb6nK+c/Hhs
         dJshDgt++v9wf3SBNsEyTPm4uBcmGnkIjVAij1HasoQUQQe40xYD1KD83cvh0wl4fAQv
         KxaObjZ7wJEzG1rJC5uFidLswaH275Au/v5q+TOUdKZtbGdW44l1F8fmpjIR1YL5W1kv
         98l85BD9U0+MkE2RIZDNCvmXusb4/eBIcraEVBDzTTm3xt5Ekgc3J2LO7K3/G8a9zDbq
         v4c8ccAIRLcmfnTqRP4AkXQO9K25s9P3YhcjzDqc4503TlQA77R5udROmUVYH4ycfMfA
         Zulg==
X-Gm-Message-State: AOJu0YyLg8kzVKcQCry2pDD+hI346DMAMpKIKa5rQ7nV+HlprP5FsmY9
	VcjwgDSQf4do6laz7m5zOGABT1Z0fU3SdgH8Pzxba8Vc+y8F+y/v12ffpwggO8ZrRw2fke3mYBp
	VhDUoyA==
X-Google-Smtp-Source: AGHT+IFE7Ztox9ccKJFVexFg0m4BGt8qDmySbzMpNXFxAIvzpLmMUHVp3bfYBjoFcyB70AVjsL6BCQ==
X-Received: by 2002:a05:6a20:93a7:b0:1a3:56df:b10f with SMTP id x39-20020a056a2093a700b001a356dfb10fmr7392435pzh.12.1710728533538;
        Sun, 17 Mar 2024 19:22:13 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 25-20020a630f59000000b005dc2ca5b667sm5953953pgp.10.2024.03.17.19.22.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 19:22:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 06/14] cve-update-nvd2-native: nvd_request_next: Improve comment
Date: Sun, 17 Mar 2024 16:21:50 -1000
Message-Id: <c8ae1765e81f9dd8e95a251cfda9e4d820bb5630.1710728384.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710728384.git.steve@sakoman.com>
References: <cover.1710728384.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 02:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197281

From: Yoann Congal <yoann.congal@smile.fr>

Add a URL to the doc of the API used in the function.
... and fix a small typo dabase -> database

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e0157b3b81333a24abd31dbb23a6abebca3e7ba7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 8bdb4a4b46..5bba2219d6 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -123,7 +123,8 @@ def nvd_request_wait(attempt, min_wait):
 
 def nvd_request_next(url, attempts, api_key, args, min_wait):
     """
-    Request next part of the NVD dabase
+    Request next part of the NVD database
+    NVD API documentation: https://nvd.nist.gov/developers/vulnerabilities
     """
 
     import urllib.request
-- 
2.34.1


