Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B690E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:31:38 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.20161.1736256690289047730
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WzWE6oxA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2162c0f6a39so235050715ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 05:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736256689; x=1736861489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdKIkL5p0UQDjWCIzG3Fg6LxgrWEDuDpYBtq/k7WXl4=;
        b=WzWE6oxA1q9rn54oK6EisHqsD1Joiz4mqvk4BYf+wXcGh++ZRVzhf9AASMV+vYlUz5
         O5TdIHXhHQ3KLbDixHbWZundHyxXlLsovI6ywi5W0udW4tZxm7Dy46C/ensv3AwFDqJm
         xfH/VgqOSg1UL8bEEYUl/PrWTf18touJK6OFJ+Mj3oKRLPAVmnkI2vbf2fKn+ET3sGwA
         OH78kB4NXjjcheAytzcdwGqkgeSADWbKg9mfPB9hn/XeGV7ZYfZ8ICpoRcVUXF+qT/5j
         hOyW5eTouRJyFl1ExZK48wXFriBiG8HgmxY5+A8LbmH+sSd/XyLeANj4qPi5aDoYfFpp
         o18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736256689; x=1736861489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FdKIkL5p0UQDjWCIzG3Fg6LxgrWEDuDpYBtq/k7WXl4=;
        b=ccr8NA4XLW4+LYlMsICT9HJ9YdZ0CIZv2dc+WHoQNNlY02VLn6GE+zleV2CnjXR1gO
         GUhw4m5KHpJIpEX+P+++XeUHN/7p6hQmNGKJflMckLG9CdzyqEpBZWZfAB88VaxcOtkh
         qX7O/jlDNeJxaFjoGjP5EiVx7tIdCMwKJmO2vSGeHlJ1ag3CmYgZ0Aqi3nlk+/LWxAUT
         1vilKIZI/EIF3hMlfWuX6un5uLiXjdvMKbtonCRZHrHvL5ofd4qqp4UgSTVbz3H/sZsp
         4YZan0CyUp8tgakbTAIMHobjiukKksh32VX/mT+V18I2KBxaiQHogxCQKvl1o0PlDJmt
         jeJg==
X-Gm-Message-State: AOJu0Yyd0eR+LrO0pjbMZHl5NgW6y/uR/oTcpJ4ayXyjvK8t7WpFGxmP
	bAy1R2FbgBGbjgIg2J45CjUbexQv0izNPyBbIlR+/Gi5XkqnqBafA/etz62NXOp29p/WFswAUg2
	Y
X-Gm-Gg: ASbGncscaQlbMevVdhs6RpfLTIXhRYi88ookF3lk0I/t+lwvNjxahR1CgZg+BHOdiSO
	ytf6pcjuvLsHw8npEb/rZ3PJyn77+QGj2hgh8lXSzKx+qH0oCyAc9X0LfX+EJ4wfHOB+3Wy51jX
	AF//EqW0VCFTpKziCezly3YSYTVBtk/JWJFEFdKp8ahxqETEIQq8rx6REemV6Jw5wMaHF7MB7Rk
	G5+T8wUVBQn1dExmQOoZQ9mxLtqIzo9l2/Z0ULWPtASeg==
X-Google-Smtp-Source: AGHT+IHoQXgRZrGPpBovtmh8j/KH4RS5xx0RoefSP7KzxgkBTWA3Hq1gKpaluDmNQlwONow3viqlIQ==
X-Received: by 2002:a05:6a00:a909:b0:725:e386:3c5b with SMTP id d2e1a72fcca58-72d103994cbmr5488144b3a.5.1736256689525;
        Tue, 07 Jan 2025 05:31:29 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbae4sm33340197b3a.96.2025.01.07.05.31.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:31:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/13] tiff: ignore CVE-2023-2731
Date: Tue,  7 Jan 2025 05:31:07 -0800
Message-ID: <c7632c5a3853290292fa695a0a7b15eb06159036.1736256495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736256495.git.steve@sakoman.com>
References: <cover.1736256495.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 13:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209456

From: Peter Marko <peter.marko@siemens.com>

This further tweaks fix for CVE-2022-1622/CVE-2022-1623 by adding it to
one additional goto label.

Previous fix:
https://gitlab.com/libtiff/libtiff/-/commit/b4e79bfa0c7d2d08f6f1e7ec38143fc8cb11394a

Additional fix:
https://gitlab.com/libtiff/libtiff/-/commit/9be22b639ea69e102d3847dca4c53ef025e9527b

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 27bb306e94..a47fc4bd34 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -65,8 +65,8 @@ UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
 # and 4.3.0 doesn't have the issue
 CVE_CHECK_IGNORE += "CVE-2015-7313"
 # These issues only affect libtiff post-4.3.0 but before 4.4.0,
-# caused by 3079627e and fixed by b4e79bfa.
-CVE_CHECK_IGNORE += "CVE-2022-1622 CVE-2022-1623"
+# caused by 3079627e and fixed by b4e79bfa and again by 9be22b63
+CVE_CHECK_IGNORE += "CVE-2022-1622 CVE-2022-1623 CVE-2023-2731"
 # Issue is in jbig which we don't enable
 CVE_CHECK_IGNORE += "CVE-2022-1210"
 
-- 
2.43.0


