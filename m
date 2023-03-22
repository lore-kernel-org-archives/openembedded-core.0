Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220E2C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:21:54 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.43999.1679494912486248017
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cVjNIlN/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so19333749pjb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1yfAWjlj+9TUZPyT9+oH7ecNuIZNPoDhAiZDJUB4qE=;
        b=cVjNIlN/QgfWwb9krVH+WQGIJz6UA+58CHNae4n5ullDro+gCsQjv0AJiNZREDsB7z
         DNn8T7wBKF63vvzz1ySf1XCbTAXMcKdfizKcSQQ09d6I5taKySZkSpz75vE5uI3whKwx
         OyDnw99Zi0Fyrw85PEfdQX38V/4evOCHu7OWujlKNlv1086f/sTw6NCsTzwnbY/nkNut
         U1dhC3rM756pzAfj3xwqtN3AF4kNK4CXEr8pXbe+55oAAb88e5njdXCVf09x0oI1WY++
         rxOmD3kE+nDZEhVw0UKC2rtrihN1V7rn9VhZDFWCRpzfznN+PJBIHtFEAGmdNbzSl0ZS
         mwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1yfAWjlj+9TUZPyT9+oH7ecNuIZNPoDhAiZDJUB4qE=;
        b=ZotEMHByZ255Cyd+ALHK4euPwRtlFNvCJ0BUfsLRae2bGtEONTEplUt9dJ17wxSRUB
         EGJI1JbMHiPacWZWdoaVw7Tx6rKnja0hpyxTIwawutjr3ubIsST6i11ov80kBV0tgF2F
         wOOAj0pBeF+P/6b9R2bp7+HH436X5sYPiv6AKCcxFvgqsZvjJhuhSf5cMI0VhFBD36ba
         mlbkxoo8vJUSuWEx3n2dBHl7RyzmIiz5rYrEfwuTzgAiYepNqWSUvhF/sBdunpI8IY5B
         uwjRWtjQrk90rFcLesjrslhnC/+76OS0BM8fSGvlUEWfuwyWiyKDw6S1HcAIYFO3/J9B
         FJ6w==
X-Gm-Message-State: AO0yUKUYz0QEIiF84R3sGTY+HTh9KHkDqs+1YfjrruRbE+5LEI7LejFm
	o5VH793mG0isE76JrnAzRtiS6gumoA6w+usVKJI=
X-Google-Smtp-Source: AK7set/Nit+S0xL74iObrDDpN3NmZm3ZIISUvNulcqVTiW7Sj1gKwNtrCCA/H1i0QOwIMkhNtppDSA==
X-Received: by 2002:a05:6a20:b91a:b0:d9:a792:8e3d with SMTP id fe26-20020a056a20b91a00b000d9a7928e3dmr4362415pzb.30.1679494911366;
        Wed, 22 Mar 2023 07:21:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.21.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:21:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 01/21] git: ignore CVE-2023-22743
Date: Wed, 22 Mar 2023 04:21:20 -1000
Message-Id: <70adf86b515934168a6185dcff4a8edb39a40017.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178926

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/git_2.37.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/git/git_2.37.6.bb b/meta/recipes-devtools/git/git_2.37.6.bb
index e6165ca37b..302db215e2 100644
--- a/meta/recipes-devtools/git/git_2.37.6.bb
+++ b/meta/recipes-devtools/git/git_2.37.6.bb
@@ -33,6 +33,8 @@ CVE_PRODUCT = "git-scm:git"
 CVE_CHECK_IGNORE += "CVE-2022-24975"
 # This is specific to Git-for-Windows
 CVE_CHECK_IGNORE += "CVE-2022-41953"
+# specific to Git for Windows
+CVE_CHECK_IGNORE += "CVE-2023-22743"
 
 PACKAGECONFIG ??= "expat curl"
 PACKAGECONFIG[cvsserver] = ""
-- 
2.34.1


