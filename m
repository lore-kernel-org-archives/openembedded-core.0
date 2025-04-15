Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8F6C369BA
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 20:52:38 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.4831.1744750352735335962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 13:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=COrfh4vA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-227a8cdd241so71798275ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744750352; x=1745355152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=43uUEr0q8b2oUBAVQE2QxPxnnutCFj0HXQgqZPW1H8w=;
        b=COrfh4vAsC7q0/cIruFL0ihy2gmNVlhhRcvkT2Yx2wM4QeoT9BirKf1/7KVzjInzKV
         Wma5fDEA0BPIqmIwKrSHSPfW3s/PFPX1ojbmNxkNY1TY4Oox0oYIlg6zBjjReiCuNR6/
         zwxv4miHp/QgJ55Bo5jpBJgVuq/gdFZbZULWL3DUYYpuA16Budfs9zHB+XpUImmg7LyB
         TqzfPzm5kLO/H/7IYYnAaPK4h3HSk9tktxr+MNUUrzV/P05xgZ4JZgCftMClhB/ijYMF
         knRATKw/9hzhyByTZpmv7/UMughcsfO+LrUTITkBrpdOKCqUQzjdvnKfFhp4RU+8i7VW
         rl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744750352; x=1745355152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=43uUEr0q8b2oUBAVQE2QxPxnnutCFj0HXQgqZPW1H8w=;
        b=L3y4i5+s96RzlsAsxC8fOUR+UMzRvfedhU+3q2yLiVF23KsrutI74RM1kAKN93XDnO
         edqdzd+hHUblQjIs85vcopqhI5nRTjwvKm3JBdd8/fRWmt3j5Cc3frTSyYoDbWjwRZHY
         R3Muhr3m6xmSRjcsQBkR7KUWIUx5ub1y6EKOIXpV1igYhLx5+WZmIBVaLU99bV/akwEK
         F3t3z5Zf4dNHTvgrQ5P5FC0rCzCf1e2ecGuOyRXixJ6xMRcEWbYRTd/rB3LjQaQwoN/1
         fW+HdTWEOAsUoITGNtqZL17jSRDKFcNgOqH/3Ym/prns72s8bwvEaL+XFM6ncGzoQkEh
         A35g==
X-Gm-Message-State: AOJu0YxddfmESR9N8RGAh0mrbJfeoveToWzCepvy7lYu7xSUfnAg2T31
	fdCfwnzF409aq4AjLdQgWXWGitvqEVjj9L/IMvrCL/DUD6zn4xrhs+Y7fbg6RWi1yWUDinnnGCb
	b
X-Gm-Gg: ASbGncv5opV/ckmwuuopenfgOaL4nnYkjkG09kST6ZMuR04Kzrvk77vkE/GLryraBx+
	4UkjxXns8mYW8bOGhpon8fJgYdr4IEk9c4v4RoxCe6ylLiHgKB7+jHp4+kLRAYdQjVEr4DYzqq1
	9U7QVryKTdDOP6A0gPG13vaUvycIoGxHAQ/9o5zHm4FUqRmpxdYecJsRtjMLe9qTdx3yXv6cxJl
	n5/BEnZou1/kFh6RNZcfQbbwQyeF9+KrozdiWELCh7Nn2WQXYgCB1hkJQcSTUkeml8JzEAs7lLn
	kd66ozMRgIDdYil1LAINbUDQ2ThEb1LGi4GwpcYEk7M=
X-Google-Smtp-Source: AGHT+IH2/SKQpYcYiRaeP+q1nixomzDT4euGbcxsKIaivE76LA+lzOOodODjIEUnD2akx/LP4BZFQQ==
X-Received: by 2002:a17:903:234d:b0:220:cd9a:a167 with SMTP id d9443c01a7336-22c318a9b15mr8764695ad.4.1744750351817;
        Tue, 15 Apr 2025 13:52:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6144:9704:3eb2:ee31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd23332a3sm8978307b3a.161.2025.04.15.13.52.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 13:52:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/4] Patch review
Date: Tue, 15 Apr 2025 13:52:21 -0700
Message-ID: <cover.1744750227.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 20:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214967

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, April 17

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1401

The following changes since commit 7399cf17590204f8289f356cce4575592d6e3536:

  ghostscript: Fix CVE-2025-27836 (2025-04-08 08:36:03 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Divya Chellam (1):
  ruby: fix CVE-2024-43398

Hitendra Prajapati (1):
  go: fix CVE-2025-22871

Peter Marko (2):
  cve-update-nvd2-native: add workaround for json5 style list
  systemd: ignore CVEs which reappeared after upgrade to 250.14

 .../meta/cve-update-nvd2-native.bb            |   5 +
 meta/recipes-core/systemd/systemd.inc         |   3 +
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.21/CVE-2025-22871.patch           | 172 ++++++++++++++++++
 .../ruby/ruby/CVE-2024-43398.patch            |  81 +++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   1 +
 6 files changed, 263 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2025-22871.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-43398.patch

-- 
2.43.0


