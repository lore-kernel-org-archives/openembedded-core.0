Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D068C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 09:05:29 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.9708.1672995927743493113
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 01:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S1ttIKe4;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id y1so1099196plb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 01:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8PfY+0b4R2HtwiDazPLYz3iuBbov46yxI+s1fbFbI30=;
        b=S1ttIKe493n2sTHSLFf2IvBHVoLRq1uemw8i5igCGaxzwSF9RkL3tWTVKtars5slHM
         R6xuEvqq8Xt5UCM14f5WaZ8N4oXOsiXX+WdKGb/AJ4pQM06LkjHBxOqeqd9+FNP3cFNi
         Q45DDMK3h1drtZwxk5Qsdtc2y0LXrnFiMJkJJH9y9doMNDgvHi77x63pyOi1i77YKJ5S
         aiWGTIBcxH1wu0J3316JROR4w4QEJh6MGeArOuWYsxdyuThzf7+TBvd0siaCUZ4NRVa3
         xQ0m+3ERnpzD8iuGC+rtRzWX89kWDWRKbm5Pk2t2RtL+VAWFkplaK+93ZXwbZpLQm3FM
         N9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PfY+0b4R2HtwiDazPLYz3iuBbov46yxI+s1fbFbI30=;
        b=iqCHGQ7XxUd8pe2tqQQ+E42Lr3DBXH6JH7wjJDfjRYssNXEEPrRv1K8oAnfDCC/U+M
         eJJ41rwdmRtr7wFzsX+nGPguZbF41pKXTeiXx/l+Nz/dR60J5buSfQgzZPyeZ3AOS3u9
         KJBJSETrkJEIq5IJwV1vh2JNqmx8dNIlimk/GBb2fjg7FjNR6vxlBmSnEtqLRFLIcoJk
         wVwACb2f3iWEUeGFtpaOlC+HH9cIT7nqQK6FwaUteaoP1dLDcQvHF6CHFs2ftBRQhYp0
         Clf3ngZX/s8KUICddJREgzb5F3JH79cN+2nXMhe7mNQSzC5Nesx/74KvTFTi31YbRLET
         hwDg==
X-Gm-Message-State: AFqh2kqV13gZoupzPrd8tUsfTTLVNOkXX0RfqhOWW9OSAHV8Rksxaak9
	10vtRAl78IhK+grM+js26qlQnXtTIm216A==
X-Google-Smtp-Source: AMrXdXuCfrBgy7CdqDCGAm3RIyEc30RTMv8Tq/wVua5HKK2NynHcHf8vSwnZP3zs/Pm/9cOPfwYd5w==
X-Received: by 2002:a17:903:32cc:b0:189:129e:92af with SMTP id i12-20020a17090332cc00b00189129e92afmr79840402plr.14.1672995926846;
        Fri, 06 Jan 2023 01:05:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id u2-20020a170902714200b00178143a728esm377307plm.275.2023.01.06.01.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 01:05:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] tiff: Add packageconfig knob for webp
Date: Fri,  6 Jan 2023 01:05:23 -0800
Message-Id: <20230106090523.3972319-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 09:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175565

tiff-native otherwise falsely detects webp if its installed on build
host. This ensures deterministic behavior regardless of host.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
index 2ed70f7500..261cb52081 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
@@ -36,6 +36,7 @@ PACKAGECONFIG[jbig] = "--enable-jbig,--disable-jbig,jbig,"
 PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg,"
 PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib,"
 PACKAGECONFIG[lzma] = "--enable-lzma,--disable-lzma,xz,"
+PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp,"
 
 # Convert single-strip uncompressed images to multiple strips of specified
 # size (default: 8192) to reduce memory usage
-- 
2.39.0


