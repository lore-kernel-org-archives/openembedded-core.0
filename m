Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453D2C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:31 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.2227.1643826510395886811
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sy+Nr6Ni;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id k25so254612ejp.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IhH2ciXdHkxRTVHM4uCpv8CdemmkNGyBZAS+MIW9knw=;
        b=Sy+Nr6NiyhhpPR5njOI5TbSEiHtCi1+8XUrF+1AFvqQFPF/WF1JORaRZujb3xWuuUe
         hTCSgrPvxVXFd2eKyfYyBhopggsHqzrvgroNJHbCJWvpZ7LyXnuQfOXwl7n+NO42egYZ
         FqWIi9VAS+irgqyBx5rnS/aFpNJnsHRlVlLI25q/TsCJKSkSHxWRNFE8F4UQSo8fIUtv
         I9aZ7TsjXgosdkwGG1CGd7QC/tCjE14gEc0bMm8SY7NQC36vKuSMd9VElF4MMEb01XhH
         FsZ7DBY1DAl0aHWqaog9YGU1fBeFskS9lIz1TSNkc358iQK/g/ZhjE2Q7yA60ceaCybt
         59Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IhH2ciXdHkxRTVHM4uCpv8CdemmkNGyBZAS+MIW9knw=;
        b=ta8MKq+iKX7x9vVPYXqk3hCje3KaPin+24rvW2Vi5XdoJ/N/hI4VJ9iRB5f5pQQzu1
         dcSCJpjpJnwkQwFnXVTkxLpxTyBZccTDD7Dx6fZZnlaPCoLS43RaDBEbMDt7bq/LxbA6
         /HMndER0YGhqAtjTKSdXw/NjFPbcWZBoLTCjCNtUnmJRR+wIOdR9wz+S42GlUXK3T3P1
         kJh53Vp/OUkK6Zcwp/rd2DQfGiIQKaX/V3eBtsf5KXRC6KT+Me8lWpu7uskFbmyHVQdJ
         L5I5qGC8EgzA2OjSCMRU9cJsp0sbzce3aor/R4GvMQMqSm7hg0VO08Iq1HxS0uLNrI7y
         MVCw==
X-Gm-Message-State: AOAM532SOMlByaWdsLSzXn6ka9E1DkHlaXOE1U/04SCmWaBV6I4YB3Su
	yjwODP7vz2SNK0wPqi88wuEgm8gbXr8=
X-Google-Smtp-Source: 
 ABdhPJyJ/Jr5NJbNWPugIIKxBJKQvYCJCS7ne0I8RLiWP5Ob879LuMQ0Etx/PUtQxDYOtRM7x16T8w==
X-Received: by 2002:a17:907:868e:: with SMTP id
 qa14mr26355413ejc.672.1643826508944;
        Wed, 02 Feb 2022 10:28:28 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 30/33] diffoscope: upgrade 201 -> 202
Date: Wed,  2 Feb 2022 19:27:55 +0100
Message-Id: <20220202182758.919991-30-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161255

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../diffoscope/{diffoscope_201.bb => diffoscope_202.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_201.bb => diffoscope_202.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_201.bb b/meta/recipes-support/diffoscope/diffoscope_202.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_201.bb
rename to meta/recipes-support/diffoscope/diffoscope_202.bb
index b3c25e1bda..8273056c59 100644
--- a/meta/recipes-support/diffoscope/diffoscope_201.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_202.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "07bd0b2972e7c4926db7f65bcf23fd106ad42169dbdaef3dc63278af82c5e38f"
+SRC_URI[sha256sum] = "cf0d4e1505818403ec8678fd9b8b4c3b955fb1d041c5d826e69f20021bff8a1e"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.20.1


