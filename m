Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F94D149CD
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 18:29:42 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.2613.1729880982030035015
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 11:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DoRjCp/H;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e5a62031aso1682144b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 11:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729880981; x=1730485781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ynt/r5Gg0fdTwkFg2I6Z+oHwYeEYpu6p/txGpQNzgrg=;
        b=DoRjCp/Hwat/8hxyGqL6+H7ZIC20nmktPHe1b/z66JQh4Xg/6V7XCiCz/eqg9sEuU3
         Cb9BOW5KnoLo3nNUH8W0HBxqm0hVb2HCPNkI0H5kZpslUgJiwDcVhUpFYmrTQva6mNNF
         vJb8nQOVUm9iYPPU9VB0Q0AfO4RqfCZPPL5h8cDhJKckZ0K1HnfomcVAkcaxPtJfhBRc
         EpDuenZvgzakRvrHA87wwXDtJBnUoe5zvgjuuQePRrX2mcfR4Tfp+gSC/8TGQq4QcQWE
         ylDzxzrmeTFZA9CFenG4VR/4A6rWKUO4OJZIlh0BatHBTPT2I3wQOCLMfx74AXM38xrt
         wQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729880981; x=1730485781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynt/r5Gg0fdTwkFg2I6Z+oHwYeEYpu6p/txGpQNzgrg=;
        b=DV0udt1nVdsrETwx8oWuC4AYDWil6fmQzfKZWqN32FtR3vgWRLygfKa5a2p/JJireC
         jbEqMsrSAVs7G1ElZQKUU/bpzMWxkbXrW6n5Oav3zXgkIx149wbPTtmHBvY5g3PI9nBT
         2eFjjvEHSTPtJF2IELb9yhPAaXbzU6qDKJ8AaMYMjsbqB/8tzsPMq5nRwT3KDogPHmiE
         CGLncKPYeTcupWYPQkuB2yDq/lwMnKsmO0Aw7zifLAzSGZrRCiKnH8HvWF0MVqGYYN09
         DN0LBtly6tOMujSpJHfKhdUvRySM7tGglNQOktPtFqNoVkrJUunxn3TOq3YNZ417cuzv
         NeBw==
X-Gm-Message-State: AOJu0YwnNSIRPX8512tOuTEg9r6DgABl6n/YA+VLH0r+xp5gusRyJqQJ
	bTY3RYGU6SQqBn+sw3BuXITlo4Y+qKInGj//NikpieQgHZrF9rfd3/xy2OZmDDa2Ar+72hXDe36
	E
X-Google-Smtp-Source: AGHT+IH5PXvolFtVoAEuLZDB1QXH9yGi/c2qfLH6ZSywP6PkYLaIGQtafLgpw9sywmKRUHqkwYCK/A==
X-Received: by 2002:a05:6a00:1823:b0:71e:6eb:786e with SMTP id d2e1a72fcca58-72062fb21c6mr621582b3a.13.1729880981055;
        Fri, 25 Oct 2024 11:29:41 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7a51:eecd:55a5:9cd2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8a4780esm1394972a12.86.2024.10.25.11.29.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 11:29:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/11] ffmpeg: Add "libswresample libavcodec" to CVE_PRODUCT
Date: Fri, 25 Oct 2024 11:29:21 -0700
Message-Id: <cebbbf76c029c5bf5563aca515b1c025c3644bf8.1729880682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729880682.git.steve@sakoman.com>
References: <cover.1729880682.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 18:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206362

From: aszh07 <mail2szahir@gmail.com>

Currently, CVE_PRODUCT only detects vulnerabilities where the product is "ffmpeg".

However, there are also vulnerabilities where the product is "libswresample",
and "libavcodec" as shown below.
https://app.opencve.io/vendors/?vendor=ffmpeg

Therefore, add "libswresample libavcodec" to CVE_PRODUCT to detect vulnerabilities
where the product is "libswresample libavcodec" as well.

Signed-off-by: aszh07 <mail2szahir@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 13051f4e36..84bba3b7b6 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -194,3 +194,5 @@ INSANE_SKIP:${MLPREFIX}libavutil = "textrel"
 INSANE_SKIP:${MLPREFIX}libswscale = "textrel"
 INSANE_SKIP:${MLPREFIX}libswresample = "textrel"
 INSANE_SKIP:${MLPREFIX}libpostproc = "textrel"
+
+CVE_PRODUCT = "ffmpeg libswresample libavcodec"
-- 
2.34.1


