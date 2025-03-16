Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF54C35FF6
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:13:02 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.31734.1742141581637497456
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:13:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hh7DZo1E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so9576595e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141579; x=1742746379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgppHUHbHRcek2dD5drC8VdbaYUDLEVD5j2K83NAL4I=;
        b=hh7DZo1E9D1qnP5+KEmElJ6lO4ynO6vwLLhcV6PgRe7ZOtaN/CVlq+Vg55rZVZqGOB
         Sdn0pBgQHSg2cSfAavn2XU0iexATyrlijiWkiPTGTL2d6E/t4l67XCcTVndyBWQwHrXE
         Peml03thGGdkEnqztIk2wwczhcZB4Iy/2gImE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141579; x=1742746379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgppHUHbHRcek2dD5drC8VdbaYUDLEVD5j2K83NAL4I=;
        b=l4kxIaqBxhhuTYRceduq9jtxQai81hDioIxj9Mog+NrY/nZuhvTYhpDCjIPxQg3F79
         uYztIhzsY/VM9lW6rHNUs75qyuK6vaNjexiYfgK+TQLGGf+5dnfit/cpOcu+g1JL2Bep
         /VXhRR54W2w704bhwAHo655E/WT1/g5cuUuZH/pSPhrBiO1/4sRiIFC8ywPn0NZEbQ7t
         bi/WlzTAYDlApxd1F4txAQfslM+G5IBKUUykemJU9iV8T5pBYvwWexoIXPqbwPXd96Va
         8+LkXDk2o5xMmv75X5toFTQoStLBSkR08feP8YZmZ/aPhVXzF9wdwVWsmPLqoJUyusS9
         eVOg==
X-Gm-Message-State: AOJu0Yy/2CHX3aBFMafhkbSRFiI5LbwE0I2frE9xc+wVajLDTCJjzbuv
	gX0LYk19OvftieYe6UnwjqWOEGVxaagWy/9cjVaanEYG0EhtqH1a00pu5a1x1uALPqrDTFlEFrt
	J
X-Gm-Gg: ASbGncs3yRbQGFRS/NfFuIaRkjqc08w7NlU5umf2w3TtwPE32+Ft9mWuYjscMvSjX1z
	yiWOkR5POEUnJ/VpLJebUUMAI1JaJqnN2SWIfu/kjwXari/iTJ+yodGLUuKlRmSV9Cb71eQRlue
	D//uLxEsslQjQEuM1YQIHLcU/Mr3P7QtzNdd4gKlvw94mKqqGITHuOeuGd0rT8u9C10U0ERMdW9
	4qpD2PCd5kOwWD4voCwD5rPagyfZd/CkDLzUq2tJS6o5m1b+YxN0G3dvxdy8nefxsXJXRvzA5Mt
	2KCADxWVP61VUwoYJa9EiDkmDPRpoj6UUkHgEmX/gGcIvjPPUYZ76j+wQf6TYomAdBH3XCk2Ag=
	=
X-Google-Smtp-Source: AGHT+IGzQE9S6ydmGZuig0oB/xxC5+oMMYxo/n4CWgd/anB7LFlY97hAArYiEYspkNZilZpiuL+dkA==
X-Received: by 2002:a05:600c:3544:b0:43d:160:cd9e with SMTP id 5b1f17b1804b1-43d23c9c444mr76340495e9.17.1742141579565;
        Sun, 16 Mar 2025 09:12:59 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 33/43] ttyrun: upgrade 2.36.0 -> 2.37.0
Date: Sun, 16 Mar 2025 16:11:59 +0000
Message-ID: <20250316161209.3629986-33-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213036

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/ttyrun/{ttyrun_2.36.0.bb => ttyrun_2.37.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.36.0.bb => ttyrun_2.37.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.36.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.37.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.36.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.37.0.bb
index 3a58f19a9af..e8fb4831e27 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.36.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.37.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "0cd063e40d12d7ca5bc59a09b2ee4803653678bd"
+SRCREV = "793c037ded98cd001075cdb55a9c58e122380256"
 
 CVE_PRODUCT = "s390-tools"
 

