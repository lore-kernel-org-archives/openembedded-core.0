Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 497DAC369D8
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 05:43:36 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.1029.1745559813892611291
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 22:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HGw7FaGV;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso1930296b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 22:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745559813; x=1746164613; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpynpxj78guNAqeRiYAZnFCJEkskmw4AGiUEFHpPXC0=;
        b=HGw7FaGVg9AHzUM9eA4+JNM8oTupJocda2TuhpDSFu5uXk3deov/V73kk/bFNtpWeC
         19YgoqwG2YMnXhtNJ5deIyMjyCwiEPwK4t+YWGP2pQbEJEW2EWafKpr9cRf8wlW2cbS3
         T2klR/p4YVeGFUBxyxn0GC1eHXg2s8cL/Zx2RDF0rPVBSgtaLn/yzoP28T8rUZCVe8tf
         otaIj3rDmIivRmYkmDwZE68Ci99ccisKI8DF/fqcRIvxIti/IkwL4uADV4mh269Rm+F3
         1Xi4etSl6uVTu2Tpj0m0//7svau2zg7INMCMpcf2n/VR0tEfCiiyLdE3baGhTch02hmL
         oqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745559813; x=1746164613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpynpxj78guNAqeRiYAZnFCJEkskmw4AGiUEFHpPXC0=;
        b=Yc9PLtDb85anjNkYA6BYeCCm4ABghJrmSNbICCoRxaVFjqozhGzMozxDAUWbyWXu6u
         WzESwFRs8ETctq2TpitbXyozRjnjB5Wt54VLFxsUNDbCLRBNJAC+yeewsb3cSGCdQCMc
         4bzPyWxLwvlmYp5Wu1qqOhqFSfmGJa30G2ugi6v/k1+qgbdfsJbrDZpLU/3modaNHXnf
         s+TCT3j4j6noRmecjcX7EvAGmKY8cPXJ1DwDXhNfo5xhbSZiGyZm2ZKrrsQkvhRY2pY7
         EZf5RNqo/XTumZ/Yd7kcolRoTSZu1yrAoUp1ZH8DIffvfkSUGKErDiDGNnhtJ5zqbmyt
         ZtRA==
X-Gm-Message-State: AOJu0Yx1dDtDE6AMYM68uVhUw/scgjIKXsKx6Q2JmS9CAwyRMAaETar7
	BJcQqOTLwOly0bjMc5qZ9o8ZLShBT8qKvSb0oZspAj6pw6SjYkPgWbxF4SoJ
X-Gm-Gg: ASbGncvrsbWc/Jn3IsdD6PhiLfbaSdPxu+JrbduL9Kb6PlWwEIjatwDmqkz1MfdZBsU
	LAJPnHt1Mrmu8xuEauOfbKYkgS27r6trxHa2rDkSa/3jbSwRk5jNPsbecQlOW1/giNw8TjeFihs
	mYWb35sc0hnFO+9bxrfFJJfL9651MByy+oFrMEe5DjRiSOQQM23jvJg4Ghkxexc9fGcPRG9kVJx
	8h35tHYL+GiNiPd3d4lWnZcvqIeO8pxLdF7zednJbGeLjSwXaFMTO5nQrHhM/abDVRIbUs2NoMI
	FlGxYQ3X83lj7c/AEFl4YXxUNcrvA3Po
X-Google-Smtp-Source: AGHT+IG4pbi19COj9CnztVXf/PltAALUJkBy4sJdp1RD65LWp0XqpHS6MzsZkVnML0lu36CDGNErcw==
X-Received: by 2002:a05:6a21:9184:b0:1f5:72eb:8b3f with SMTP id adf61e73a8af0-2045b71b4a9mr1822567637.24.1745559813315;
        Thu, 24 Apr 2025 22:43:33 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aca62csm2363626b3a.167.2025.04.24.22.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 22:43:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 22:43:25 -0700
Subject: [PATCH v2 4/7] multilib.conf: Add llvm-project-source recipe to
 NON_MULTILIB_RECIPES
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-clang-merge-v2-4-0a51d0c1940d@gmail.com>
References: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
In-Reply-To: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 05:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215419

llvm sourcebase is large and like gcc, it reuses same source tree to
build all recipes using clang+llvm sourcebase

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/multilib.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 979ae50c7216c02b9f1eabd621353eeca14f47fe..36386f3380f2d6f2fe60a136906118285137783f 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -25,4 +25,4 @@ APT_ARGS:append = " -o Dpkg::Options::=--force-confnew -o Dpkg::Options::=--forc
 
 # These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
 # ${MLPREFIX}${BPN}
-NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot gcc-source"
+NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot gcc-source llvm-project-source"

-- 
2.49.0


