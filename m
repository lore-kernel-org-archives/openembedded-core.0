Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F95C369D7
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 07:21:12 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.9655.1745479262893491409
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 00:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l8q5/pZ0;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22928d629faso6398805ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 00:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745479262; x=1746084062; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpynpxj78guNAqeRiYAZnFCJEkskmw4AGiUEFHpPXC0=;
        b=l8q5/pZ0v8xByxXJW2AmxtmyDVR8NNE/lfOtjVFAdl32YaeF3oJaRzQhACQBJC6140
         QzkQNYWcGXtYq941cqkVI9TCIyfBPrw4Ia4DhK04Ihnc2QRATMP7Z3asy4yh4HEVH1pq
         DXQbH3ewpmyGLzPTA+xqpfb9adSIQ5AHjbGdx6YmqGsU9SMe48h9ilDV5VYhH+LaTdEK
         5DEaWX6AWqoM1w1KXD8RvpQttZLDxGHINOXRKoKSHJGNvCBnxYR43FiVt/uUuR0ePtqq
         HKbqdelQp+a5ukaIXupvzougWnGOo20TOHAmjswk+Nx7djYWqjCe/SSZ67A+0y2rggmK
         P1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479262; x=1746084062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpynpxj78guNAqeRiYAZnFCJEkskmw4AGiUEFHpPXC0=;
        b=moc5ewi84JP1+0gtvsEOYC8AVFRldr2nfZ2wFYFTgmH31OqEHps/hU5M2DDd60Nlae
         +8YBVTxwaSLHbGH6ANBBVz9Ztq/Su3ZqlYYNIoK+uSBj2EauO5DrOPETJlHSA6VPq2ww
         zujNTAGYhbVqTA2r9pf6eDGxZGVJPYhrzYuksoQSCdb+qYZw1w67LjyXw3i5JSk014bU
         twyCgYkFBtGhDypnykYCd5eQN5OksW6Mr+rRAPmctAIO7nwJWPFI2fdvOm4jJhpHI2gg
         zdwyYaN+plhnMZKLFDkXhbvAEdpAwxfipKNRTNTMh4xiewy6/CU5SL0z90gU8S7AnfZ+
         SSZg==
X-Gm-Message-State: AOJu0Yw/Gg7/TlOAmHx/dZzN24IsPwcqOwAgrxV4k0TYK2QGGX0NEq8l
	dpsI6CmP6Ado0olYS5yR39AvWRF6vElkbuKXD6Ut/dZERat7fTty
X-Gm-Gg: ASbGncsv07fJ8ktInoQZSrkuIhcxyLXYKgMO/s1s75S/fDjyROZ1jjaK3wCiQhs8axB
	KGoGzbNlkMS5xvFHLDqhwzw2S2Yu2nzgy8qAokMpvYXHlo0r2MpEum/gRCuzDV7SO5lSkzuDNWY
	XpBI29kTKQj5NNCPVEJRYQUYJWfH9lDYQvdRRa0bOkJVTmmveuQm/n0N2igR2lxiIa5eskz12vT
	MUUIZtTDvx8Xgc7OayJwmv0I8oTbC8X2EaQL+BQL5EfwEzfz7ZwBnd0GJoNlbtvscw+uu8WvCy1
	0PReXwceK9DO6gJUCl5+yb5XtVnGBfA4zZ1Q6jUC8iQ=
X-Google-Smtp-Source: AGHT+IFq0u+IODJyO/8w/2YxpTSK6gavC8+N8h2wckzlEmgrNNDj1jr/S0SkxFCIOi6IGl0xp8BiYA==
X-Received: by 2002:a17:903:1b23:b0:225:b718:4dff with SMTP id d9443c01a7336-22db3dd8835mr29466205ad.53.1745479262279;
        Thu, 24 Apr 2025 00:21:02 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5101636sm6234475ad.180.2025.04.24.00.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:21:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 00:20:45 -0700
Subject: [PATCH 11/11] multilib.conf: Add llvm-project-source recipe to
 NON_MULTILIB_RECIPES
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-clang-merge-v1-11-5a492a8461aa@gmail.com>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
In-Reply-To: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 07:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215338

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


