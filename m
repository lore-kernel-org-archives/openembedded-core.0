Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB8FC5B555
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:31:58 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.11422.1749025909548560908
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hCv1zB3E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so32734435e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 01:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749025907; x=1749630707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AZO8LRxQuhCTcf/waj6UoEVrhQ5qAByuUCFwGkzCq1Q=;
        b=hCv1zB3E7/lgvs/75RtYNlvvpQnZeCpKRvVD9qadq9kMiMMm//wCtMOXO/Jzb3mbyJ
         diP4wFRNr0rx522y/K1cldWvplUyY8VN/kr7AhyVNY5kNUTX/wG8Mk3eyx5u8F83LUj6
         RMViAtfbJUP37FWd5c4bECzrLGMOWSsqmpECQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749025907; x=1749630707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZO8LRxQuhCTcf/waj6UoEVrhQ5qAByuUCFwGkzCq1Q=;
        b=v7CG1hfvOpD24WEx1J2gicVGjjQtm/2OcDEeuleE101LT98UZyujeuZhKCEe97nZvg
         gFQaxfku70Z3Eyu58m9eq119IvCbZw8Eki85S6G+fH/D7KwOoiA3cOy1VXl38lVbZwac
         3CH3vastjnNjIhL795ogz+x8grqfNu645m4A/2hnNIUc8XlrWW//U8QlvwI+JSgAUuWt
         jCA32auYoTKPGkZ5Ry9IX5hUdiUZapgVfWqlfriw8GS2Qvlk7GvuqeVu7SFe75pKC7Yv
         QfW5nIdJiHD+M/BFQY1mOrpx4/F+RRphW5spKp18te9n+3xW8dByqHaUZKoy1Wl/bVtD
         Am5g==
X-Gm-Message-State: AOJu0Yz0tu4hxyrmQ8o8GJ4xFNxErA4UaPqFJWj6PkP/w0J+W2Yx6Gj+
	iBPHPfDHNbdenPKSHgHYGgAB89wk700YnXAwbyxyImxIJBwTgVytjQgtixbPfcf69vmI9KcTpRB
	jUdbBjTU=
X-Gm-Gg: ASbGnctcSxPAnJHNhidVi6jpsN+SrOHoKuEKbRuuaprVkipOd9pN+rsVKj07WZYhxcU
	dBSwfpE3CKUi6ouSCdeCsfJJRX8Ayo9I2dS2hRmWPzzTHrRERnFHGUqvson+78S1FOC+c9lSSn2
	ek95bcFjmUbD3kU3nxG9iysMxWfnSqLQBLU5L05A9l43NwF0cL8Pm6FoUXWeBwNBy4dlVannsfn
	ID5z2nHzvdjURG7nJFSkbMaXUXLG6XZkSrN6H6SCt/16hebS94QwXa+xLKXGeZrJBhZm79Jf9tb
	KbFQ3MNP6V9sX6YbqnR5gsrRF0YUocKlXYtdk20g/5v+x0SgWbHF1HKzSBo6f+lHA2fUsAKNX4y
	rs2zM
X-Google-Smtp-Source: AGHT+IEuKPu1psC789YwCujnEgDi4BFxPmg6rEjhynp41kScBK3auyRJ6jMkJNgxKr+xIO1xvhj26A==
X-Received: by 2002:a05:600c:524c:b0:450:cfe1:a827 with SMTP id 5b1f17b1804b1-451f0b3ba9amr14602485e9.31.1749025907176;
        Wed, 04 Jun 2025 01:31:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:204c:fb2e:c462:29df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb051bsm188877825e9.18.2025.06.04.01.31.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 01:31:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-fit-image: Exclude from world
Date: Wed,  4 Jun 2025 09:31:45 +0100
Message-ID: <20250604083145.3784091-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:31:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217847

Recipes using this class are designed to be pulled in by dependencies and
the recipe doesn't build unless the kernel is appropriately configured. Mark
as not suitable for world builds as a result to avoid world build failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index 6d80cd4bb47..d2eebb88bc2 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -7,6 +7,9 @@ UNPACKDIR = "${S}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+# This bbclass requires KERNEL_CLASSES += "kernel-fit-extra-artifacts"
+EXCLUDE_FROM_WORLD = "1"
+
 DEPENDS += "\
     u-boot-tools-native dtc-native \
     ${@'kernel-signing-keys-native' if d.getVar('FIT_GENERATE_KEYS') == '1' else ''} \

