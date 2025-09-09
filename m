Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720B1CAC583
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:29 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.890.1757438244018598828
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 10:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=APzd1sTD;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b02c719a117so1044715866b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 10:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757438242; x=1758043042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3e1do/MM6G7VVz4YZcfSV+Q17Om+qi+edrSGGz+Y4E=;
        b=APzd1sTD6/rGz+99fhmiwI98dLmzI0dTnfWb1sBEropIwTZopJcisywiKVrbrGWkF/
         b2qhFBML5xazgm1z0BKTN1q/8ZZTrzqcxQnLzzb5wCSCqAqOFKvhYyT/Fr9EdlqbzWzt
         YB3RzfsmMkWPVAewZ9OG5/1m+XnVPFdtDtl+MdQcr53oUVxbrpYr/NtCsS6jyjmNHQf9
         4qgkATHEDpkeGoa4293xPJEoQb4NT7AjJZqpPvXlWam71+h5lRKiOgqxf7U9ylBbNNLd
         Sj4QFtfJ7i3MRjrfpItHA7c49Kf/x86FMh5MWUaY0nvQIA9ca8jmjSqokNqPCkb+YpFf
         N7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757438242; x=1758043042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3e1do/MM6G7VVz4YZcfSV+Q17Om+qi+edrSGGz+Y4E=;
        b=dmK7DOQ3Fb2VEB8v0IjRBsAU8omzYYajPZc1ywN/1AdTq/4lSiS9SIyhm7RK4b7+6Q
         HogWCBY20F6JzWeIrN/W8rmrridKXdGXaXlXPtBcBmntMi7U2A6enJTPd6KGn2fIBHNt
         BGNCZGECHWzASov+1ptcsu72m+HKgK5mjZKAh6Hv3bLMdyGx7D9ojrDlcdjyo/rWMDM7
         bg0daaNfbHxpXkkQyCHuN2qmKzjZLHHGzCaEckJQWKqDJg1VBRRUeGZjdiaVZXZtG2AJ
         yliMg+mSKehjKKEKuQ9nMs7sHZykgP4eH++XJvUVnUfmYMAHO2umRmPLlSu7+CJEvgIH
         c9Rg==
X-Gm-Message-State: AOJu0Yzs+mZhrIOvcb91bP1NIOKz2QSdA/9YAOmx37eadvf2KEilPbT/
	sXr1ex4Q0/kw9rxzrtqWmTcuj4/RXMZymLFNdAQ8ktCGOuM1dYJK8jYsA8AEXw==
X-Gm-Gg: ASbGncv5tkrHLKXsQ4AcXsIZXECIpIrtlv5ZatnIfkhbpt28r8oFTonZfVgWLDXSc70
	iTX9ij6dPfdOuIF4Q+ZHRjAC6o3sUWASkBVOSv5SqNiYXhQDWcqp5j3ASMX0jE1+E+tQX7riyC2
	hzPQ4DqnHEwl6cRGDyAGKniHpaQN0Gkn+8/x/c7Qf52T2Cwgx2cQb7niQMGydNZeCjFk6BEDWJ5
	W6ZUG05WleeHDtxNfIFd93jYbCNF85iGb5gln38XiA/teqNuPGcK57SB1B1Z5nuGKqnJq26gbfc
	dxAHzm9ikkXNPG99FWxQLuA6w97D7JBhKKhJZtwN5iS/vYXbuO8+RRMhPc0E5LSFMAcNJGqB9Ga
	YRZZPTjQEt+yNpYNZJA7rPt6Gwo5e56vVqjah
X-Google-Smtp-Source: AGHT+IGd72PKIVWv0YqBf6GSp+LMYqGuPah1Se7PZD5Emrl3JS7G662qAxZl88k6xAH+RTpBctqw9A==
X-Received: by 2002:a17:907:9414:b0:b04:a302:d1ed with SMTP id a640c23a62f3a-b04b1687be0mr1274889566b.41.1757438242170;
        Tue, 09 Sep 2025 10:17:22 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b078334db1esm20719266b.65.2025.09.09.10.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 10:17:21 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [walnascar][PATCH 2/3] sanity.conf: Update minimum bitbake version to 2.12.1
Date: Tue,  9 Sep 2025 19:17:15 +0200
Message-ID: <20250909171716.1588271-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909171716.1588271-1-martin.jansa@gmail.com>
References: <20250909171716.1588271-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 17:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223125

From: Martin Jansa <martin.jansa@gmail.com>

Needed for multiprocessing module in bb used in the next commit.

It was added to bitbake in 62be9113d98fccb347c6aa0a10d5c4ee2857f8b6
which was backported to 2.12 branch and tagged as 2.12.1

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index 6d3911ff94..5d2bedf011 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "2.12.0"
+BB_MIN_VERSION = "2.12.1"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 

