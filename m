Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E5DC678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 11:50:40 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.4990.1678276232926222231
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 03:50:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EIOUwbUe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id h14so15090598wru.4
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 03:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678276231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ynFhBXDX90UZtGWgQSzKwrqNW+RkgMtE65BmMoK0Y0=;
        b=EIOUwbUe4zm33b0gm0uRTiVVlT7SyBw9GIE2JvWDWomGXDKIKyKl/1kCBJOiEIkO1m
         k1zTRye6SuGSfLnQSNr6+tEObnjP7QOlPlmySnZ4XuekrgBtdvu32HerMvgHWU1NkjHY
         TnzDqBrJrnn/WstIG3zCqVfTUe5Mi9+Of1Yj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678276231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ynFhBXDX90UZtGWgQSzKwrqNW+RkgMtE65BmMoK0Y0=;
        b=NrqbWCH3hzmQeknZB2xbz0oFU39wmAFLBq2eHys3UiTCS/iELxC19sleSgL5NtqsCn
         iR8yGB5ijYGq8nF2J+jiz0RKMxELVaTZ1MqViehAnFYRSP5+3C32ZFn/LWgS3rCIdsKF
         R5Q08UPE/Oc+iEPCIb9sYyGGmosYJ8s1RTNVQVvbK+2NB/oJtINWpj+e7UYT1IoonYRu
         bG8V0rxvVQ8JhetpCyMG29WUBm9cbq0E9TdmQ1N28he1w4GthKWdpL/KtIVYsxQC+U4n
         XvaBJxQ6v75LtBxD2TGbkJkxM7n3RBe7xdv5C8WT18r3B2vUVOl++TosMXo7Ap5Ke/tM
         SJeQ==
X-Gm-Message-State: AO0yUKV3KouzCVktuQTkp5gwx0t8Zu4rrHyZYYodWHwql0RT+Lg7VYJg
	SPVtDF9IQLnzcMi5XLRFHHj0ura9OGrqYaDD0tI=
X-Google-Smtp-Source: AK7set8Q1jPYmDns7j7rQkP5oPVchMaN9B0VrJpzOV/3p3XQs8okXrnAyEoGVGhmr1Wzu+/2lSsSzw==
X-Received: by 2002:a5d:62c3:0:b0:2c5:5237:3b21 with SMTP id o3-20020a5d62c3000000b002c552373b21mr12826061wrv.69.1678276230833;
        Wed, 08 Mar 2023 03:50:30 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b])
        by smtp.gmail.com with ESMTPSA id b3-20020a5d40c3000000b002ce37d2464csm11286090wrq.83.2023.03.08.03.50.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 03:50:30 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc: Add missing binutils dependency
Date: Wed,  8 Mar 2023 11:50:29 +0000
Message-Id: <20230308115029.2740560-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 11:50:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178168

glibc has it's dependencies handled more manually due to it's place
in the toolchain bootstrap. It depends upon the compiler and indirectly
through that to binutils. This did mean that if binutils changes and the
compiler does not, sstate and hash equivalence could mean that glibc
wouldn't rebuild.

Add a direct dependency on binutils that if it changes, it forces glibc
to rebuild, as it should.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index fdd241d973b..fbfd967f5f3 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -1,7 +1,7 @@
 require glibc-common.inc
 require glibc-ld.inc
 
-DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}binutils libgcc-initial linux-libc-headers"
 
 PROVIDES = "virtual/libc"
 PROVIDES += "virtual/libintl virtual/libiconv"
-- 
2.38.1


