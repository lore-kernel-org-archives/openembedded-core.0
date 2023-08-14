Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E53AC001DB
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 04:59:31 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.100879.1691989168847419428
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 21:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Iw9yDG1A;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1bdc8081147so10067315ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691989168; x=1692593968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3kejxBOUJM5wkFNmMoFrc1GPCoDFpifZGDE8Ck4ViE=;
        b=Iw9yDG1AxlU8NkVnBJ1haFAwa4pNKt4Gm3TA/6jRXBcMQFxpYelB24ZgThvQPMISHs
         prLc9NsJB9q5anssRbESTodGQ2dRsgfL+4vpGV9e1/l3WFOO+y1pVZeaF3GT4TahD0cC
         RKd0r/MzdKLyoPyjG7mhYG53kt5Kr9+dl0uIlUUceSI/hJNoaKm0o2TaDlATlaILhFHG
         nqu+8jx3w7Ebiam/dru0Lv6PFr8OvfGDdsatafgufSKOX5wzTHtuMrjQ86Z0oPXkxoGK
         59qvOP+PyDNLuEERp3SSJB6uy4fl9RdFfVqfJizzALyH8V6tBn5vWXlBI31z4MplJzQe
         +6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691989168; x=1692593968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3kejxBOUJM5wkFNmMoFrc1GPCoDFpifZGDE8Ck4ViE=;
        b=LkY4+evKQs8rzPbc+CLxQYLH3deuNx7AqrBRs3JWUvPs1oi86qfUZpK5gsMs6nZutt
         VSsFymcpCNcOmb2zopLlFBSbUUiDUv6F01pTl8DILYX7cz277PqkxrJxyus+bYclFT9P
         Q+V+VPkBadlOfzB5KkezIMtlG0qV4tIW+otodhRvj6EZ3lXqROAqne5248Mii8ue/LW+
         ATGQPqqMdCIrliwUbrS8xa/UF9GGo+kipOcL1IHsP3DaQCMKzUW8ORw4bgv7lw4Nr98i
         oQntvTzTf3UXdNd7dposKW9a91g9UNZAD6csg/PB85+lH4e3hDm+9e2fZ0hOLXeEI7B8
         9MEQ==
X-Gm-Message-State: AOJu0YwbIEWxAasGoqF6bwxVFXX4tYuFbrPBMLK1mRn7zD7kmqE4U+88
	ATuSSp+VdZ/pZdxhJKW7Y9+GapjhrYev/g==
X-Google-Smtp-Source: AGHT+IHSrvwaE9xMbXQJblQxJbdhJ/Tlm5gl8RJ+zTFOIsAqgWyK9+Io/w3LvoV3QMOJKmUIyk031w==
X-Received: by 2002:a17:902:f68c:b0:1b8:a67f:1c15 with SMTP id l12-20020a170902f68c00b001b8a67f1c15mr15991225plg.25.1691989168107;
        Sun, 13 Aug 2023 21:59:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::ed55])
        by smtp.gmail.com with ESMTPSA id x12-20020a170902ec8c00b001b1a2c14a4asm8242336plg.38.2023.08.13.21.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 21:59:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 5/5] glibc-tests: Add missing libgcc runtime dependency
Date: Sun, 13 Aug 2023 21:59:21 -0700
Message-ID: <20230814045921.720515-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814045921.720515-1-raj.khem@gmail.com>
References: <20230814045921.720515-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 04:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185921

Some tests e.g. tst-y2039-time64 from glibc 2.38+ needs it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: Implemented new

 meta/recipes-core/glibc/glibc-tests_2.38.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-tests_2.38.bb b/meta/recipes-core/glibc/glibc-tests_2.38.bb
index 9352a058fbe..95eb774db70 100644
--- a/meta/recipes-core/glibc/glibc-tests_2.38.bb
+++ b/meta/recipes-core/glibc/glibc-tests_2.38.bb
@@ -27,7 +27,7 @@ python __anonymous() {
 # Remove any leftovers from original glibc recipe
 RPROVIDES:${PN} = "${PN}"
 RRECOMMENDS:${PN} = ""
-RDEPENDS:${PN} = " glibc sed bash"
+RDEPENDS:${PN} = "glibc libgcc sed bash"
 RDEPENDS:${PN}-ptest = "${PN}"
 DEPENDS += "sed"
 
-- 
2.41.0


