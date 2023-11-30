Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CF3C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:58:30 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.5178.1701377902826582051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:58:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Xrtdi+C3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6cdd214bce1so1400106b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377902; x=1701982702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bVOuwccodtqtSfFuZZoqFTmDOPlj4kwpQWNjff27KU=;
        b=Xrtdi+C3hfhV0skFPFOihkDRcCkpZeskLtTgZJlgosh218rZfwAsHl0/bef+BLQ1mR
         Lm3VFvPmKDVORz/e7gcrvnvzv6ld4aC8pwCw9gTsrG5kvXUJhv/bHTQzFmC5mLUmt82T
         yrohQxb8MLWhkQuSBpRBLW3kiNmOxqOgbh0wy9II7zSlhIbmEBmTBeNbRR2YewzRzgRu
         kCZe1PBg7nu4zcSUnRTs5VT9ccdxBCfPH/YJFtATI4mdRKPdWgGHDHpQz4Y3p7kTpttj
         tdxOH9CWW8my2Qa8y/8V1s4RkZdYgKU7yWqNvMgNXUSqQ5RXbfQz+BXgcD4rWHXn3K6Z
         T+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377902; x=1701982702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bVOuwccodtqtSfFuZZoqFTmDOPlj4kwpQWNjff27KU=;
        b=pE6HNBgm37UviwqIBQF/nUzwjPfsw/zlnaUAX1iziRhsSTyJv8ljpHv2Cov9cR3yJo
         TZgKRthEwKFAiImEnneuqZVaEcZT26vKeTSPQ70wsvbbq98UjT1ki78Fo95JyFs4A1x6
         x0tXgYguQJTSN/FMFYe6P5n13zkWbzS75/jWK6zyk5bquv2EuOYqqDhJrm0g+nTdD2BH
         dKqdqbJafyHDkV5X6utrpcBPpCeBPCBY5yydGQspO9k3T9eVqYMnRbWsdNEVU9BOJODZ
         rLB9bJ/AwbI41zc8Fz0+TDcT96xRBakoc7aNg7HTvqmQ5Kz1qH3PAhxCLS9vLG+fQtkX
         vtAA==
X-Gm-Message-State: AOJu0YwljkPbBFxG4u/92bsfJx4jN8bcu3uWmii621AFBA422Q4TdkA5
	CQqkBGj+Omi0h/wOQgo/g4+FHCduoOYNJ8jQd5ovHA==
X-Google-Smtp-Source: AGHT+IGT2tJg0YZNCEE1uc2q5CIimefy4oAm3cco+yw4Kn+EuLN2ivfIi39KFIiQ+mSokH0v6FXpCw==
X-Received: by 2002:a05:6a00:999:b0:6cd:fcef:5d94 with SMTP id u25-20020a056a00099900b006cdfcef5d94mr218714pfg.16.1701377901929;
        Thu, 30 Nov 2023 12:58:21 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.58.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:58:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 25/25] lib/oe/path: Deploy files can start only with a dot
Date: Thu, 30 Nov 2023 10:57:33 -1000
Message-Id: <c45f3e00189e034157996b88103a83efec3e0cf6.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:58:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191543

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@wika.com>

There might be only hidden files deployed. In that case we don't need a
generic wildcard present in copy command, otherwise it fails with:

Exception: subprocess.CalledProcessError: Command 'cp -afl --preserve=xattr ./.??* ./* <BUILDDIR>/tmp/deploy/images/qemux86-64' returned non-zero exit status 1.

Subprocess output:
cp: cannot stat './*': No such file or directory

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@wika.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f92c751281609ea6bd6b838307de4bc70bf26ab9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/path.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 0dc8f172d5..e2f1913a35 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -125,7 +125,8 @@ def copyhardlinktree(src, dst):
         if os.path.isdir(src):
             if len(glob.glob('%s/.??*' % src)) > 0:
                 source = './.??* '
-            source += './*'
+            if len(glob.glob('%s/**' % src)) > 0:
+                source += './*'
             s_dir = src
         else:
             source = src
-- 
2.34.1


