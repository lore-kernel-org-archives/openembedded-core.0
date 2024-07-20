Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C494C49EA1
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 12:43:04 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.5376.1721479377917414659
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jul 2024 05:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KcPCGc4K;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.42, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-70211abf4cbso1563792a34.3
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 05:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721479377; x=1722084177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4OgKWFiAtnjDQdfdsWFcWBQY/cAUlhibB2nugLtBGY=;
        b=KcPCGc4K44frifnf2uoPXNlaQwDNnb/uvmORaAh6gwBdWO/Stxj09+k5f2iQJymLiJ
         riA+Os7AQdf8Jy/tK3bD6e/UZAYn9uKBjNKD9g38UgpECKvun59qXemUl6d2p7uC4fQy
         vrAJ5EZWGFPnTO+INqKb0gdcpX7tdm6quEPIBFcuMwpSlD7hB37MfAT4i99jK9W9HmeW
         4QEjvCL0GLIegOr8x/L7CE+trtJHIPsmUEM6c9INZV5Z7EiGGd8pKcewU4NIPXzTqbd3
         piGQtZhXthADZFN0fOft7+Um4D/vqmIVmR5hIffyEmiP/K8YCtk/UwG49o4BQvnQbMaH
         Lmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721479377; x=1722084177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4OgKWFiAtnjDQdfdsWFcWBQY/cAUlhibB2nugLtBGY=;
        b=GCOumadNmvy0PTdDqk0dFVbWkTdDSQg6YmuQjyUH4JqQA1R9krtoQcGkWwOuoXidWp
         gu0kr064W8Dra5r5357cdyKvdHce873i25N7k1JEyjGGjPSmKDCKGkoEo+8iXaHhAed9
         zJr6TfQT9Vvp1Mqqk3y5oksJVOSl6CzIwKGsWbwUaZw+UdR/juZL26bG0Wy3GlzbeDFa
         s7SpsgQXPCIutY/1XXh9069MKIu1Pc/SyWubg0qQQS1u7F5sDHEirT+vY/uuMteOkpAr
         LGKsheQG70Dke20w2oV5cxxFQF7a2Vln/NuK9iNhJHHADGDOUzhrFVg4gTDUw2/UcV5H
         cYLA==
X-Gm-Message-State: AOJu0YxJmQ+ziwyJ6UlvRydGqC3SBVEZQRCI14vr11hJOTIWOft090D9
	eqmsq/kF+N6UrhopNuatmSNkvZrZnFn/96ahefH+XNOkv1gXLgM2ig27R4A6gykPgaXyZdKT3Kp
	ht0o=
X-Google-Smtp-Source: AGHT+IGkEZBjTXTlPdIYvoOfgaFuQMydPnzji76NPzDID7cmfddzp60ceLg5p5peLotJ3D4GSIxY7g==
X-Received: by 2002:a05:6830:3c8c:b0:708:455a:8f03 with SMTP id 46e09a7af769-708fdb9ccfcmr3260465a34.34.1721479376967;
        Sat, 20 Jul 2024 05:42:56 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d0fe2e2b4sm796604b3a.10.2024.07.20.05.42.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 05:42:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/6] libarchive: ignore CVE-2024-37407
Date: Sat, 20 Jul 2024 05:42:45 -0700
Message-Id: <2b407f34df5a768c271fc7049e7272d1a79c04a0.1721479252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721479252.git.steve@sakoman.com>
References: <cover.1721479252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 12:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202281

From: Peter Marko <peter.marko@siemens.com>

History of code changes:
* introduced: https://github.com/ilibarchive/libarchive/commit/390d83012fdba8c8db7fc9915338805882b0597a (v3.7.2-52-g390d8301)
* reverted: 6https://github.com/libarchive/libarchive/commit/2c8caf6611a7d0662d80176c4fdb40f85794699 (v3.7.2-53-g62c8caf6)
* re-introduced: 9https://github.com/libarchive/libarchive/commit/1f27004a5c88589658e38d68e46d223da6b75ca (v3.7.3-14-g91f27004)
* fixed: bhttps://github.com/libarchive/libarchive/commit/6a979481b7d77c12fa17bbed94576b63bbcb0c0 (v3.7.3-24-gb6a97948)

Since there is no release where this CVE was present, we can safely
ignore it.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/libarchive/libarchive_3.6.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index c83eec9b1a..a7a3e47412 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -38,6 +38,8 @@ SRC_URI[sha256sum] = "ba6d02f15ba04aba9c23fd5f236bb234eab9d5209e95d1c4df85c44d5f
 
 # upstream-wontfix: upstream has documented that reported function is not thread-safe
 CVE_CHECK_IGNORE += "CVE-2023-30571"
+# cpe-incorrect: this vulnerability was not in any release; introduced in v3.7.3-14-g91f27004; fixed in b6a97948
+CVE_CHECK_IGNORE += "CVE-2024-37407"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.34.1


