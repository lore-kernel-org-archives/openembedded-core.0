Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960E7C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:09:20 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.9005.1678889351870323646
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dhgR9PY3;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: jhatnedap@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id cn21so45891475edb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678889350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sw6sZFjTPg5Vi8MkhPsft9usGiqU9sMABeia6P9G6a4=;
        b=dhgR9PY3/5a0j1vbTbzBVbS3BqiDk2+syi2ikwBUjw2H7Jiqeml7CQE9GwV/7okQi/
         PqSitvslaSLMAtbmUXiLY1jaKQlMowIYNt+1g2C7y6xIxQGojOyp4xFpWnvbsWgxUyH+
         /r8OjGDzMgDxyiMxFTc0NuNCw6aqnJNct8Bd0CxXYZ0Y062q80ZPeicMcbYrgqyD1bC6
         ePtiVbE22QyBru89vniHl+mX/hUiQFYfsdn6vvAFGulDKz8HjKwNMmBDawogj/mYapQI
         794hvC2AsucY/OGjYj7D8nipPHGuT/p0uaHUlC5sSTXX5EFrivPBjZt52/M3hJPsUY42
         /fMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678889350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sw6sZFjTPg5Vi8MkhPsft9usGiqU9sMABeia6P9G6a4=;
        b=nFnj2Fq2La92PEsK9chtUwpKcH9baeSMLlNu8VP4jr6fw3b6288tBbeqj+neDuowoq
         Ig3BhBoOJf+zun8e9Q8k4Be2m/6kioodwv9qI/iQNc7s4Q2sqVbS/KMRFIbFqb/6/gC0
         YJ++n9tGIE8eOY43221lzV2Tz4VJz8/vQKeb5+Vr7K+f8MYQHDVhIVGxwmYCo2HF5WW8
         RTL0GhdFqFnGVDHfnDDfjR26c5jqkyl+gyIwo5gGorrJtGlAX/QsPclg09TSMEKUQUgu
         jDGQV3G2C3zd/9KOS4b3qis+deW0PFzMKum4nYmjPGafcn7X3QIEVZFAf0cru5/LAKId
         MKbw==
X-Gm-Message-State: AO0yUKW9rYBH1Bp1sswGkxDfGIWZpKJmRjHZT12QXJVYY9UvMN4VqpYp
	EYLj5lsmhbLVW9d1tpxin/RdquDswlo=
X-Google-Smtp-Source: AK7set/RxjRiI4qB2kxElHBhfkHC9C/vV8cAzVbDmKsXG7xKzXN3C2CAKc5CzPiKsARxZ/1qe5yWaA==
X-Received: by 2002:a17:906:135a:b0:8aa:a802:adcd with SMTP id x26-20020a170906135a00b008aaa802adcdmr6290186ejb.30.1678889350254;
        Wed, 15 Mar 2023 07:09:10 -0700 (PDT)
Received: from NVC4181.nedap.local (smtp3.nedap.com. [87.249.123.12])
        by smtp.gmail.com with ESMTPSA id bv4-20020a170906b1c400b0091fdd2ee44bsm2549383ejb.197.2023.03.15.07.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:09:09 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jermain Horsman <jermain.horsman@nedap.com>
Subject: [dunfell][PATCH] base-files: Drop localhost.localdomain from hosts file
Date: Wed, 15 Mar 2023 15:08:10 +0100
Message-Id: <20230315140810.2591-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.39.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178574

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This was likely something we took inspiration from elsewhere with.
It was added in:

https://git.openembedded.org/openembedded/commit/packages/netbase/netbase/hosts?id=c8e5702127e507e82e6f68a4b8c546803accea9d

in 2005. Debian added this entry around 2004 and discussed and dropped
it in 2005:

https://lists.debian.org/debian-devel/2005/10/msg00559.html

resulting in:

https://salsa.debian.org/installer-team/netcfg/-/commit/3c15ee521b2b8f47b34ccc7f610523cd284f2221

We should drop this for some of the reasons in those threads,
it doesn't seem to be doing anything too helpful and isn't what most
applications expect.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e730d005fa8aec07f9ae25c58d4566eaa92a6997)
Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/recipes-core/base-files/base-files/hosts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/hosts b/meta/recipes-core/base-files/base-files/hosts
index b94f414d5c..10a5b6c704 100644
--- a/meta/recipes-core/base-files/base-files/hosts
+++ b/meta/recipes-core/base-files/base-files/hosts
@@ -1,4 +1,4 @@
-127.0.0.1	localhost.localdomain		localhost
+127.0.0.1	localhost
 
 # The following lines are desirable for IPv6 capable hosts
 ::1     localhost ip6-localhost ip6-loopback
-- 
2.39.2.windows.1


