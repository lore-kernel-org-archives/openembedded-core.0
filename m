Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83520C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:06 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.9102.1647518225032521110
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LB4mSj4c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so3006867wmp.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9ULhqauozIyAL6tCfLF7X399mGWMTgFSXg+lkMSYWnQ=;
        b=LB4mSj4cL4nHbKzFOVWQknNahzNOtNwNt0ukJiixYbLVP5LmCnShZsobAji40pXvSQ
         NDiYGE09UVRS5TqKXwRgWjsLOOXr1ZuQdxrWwleSWNCiBiN//qT0rC9Z189ytAd4+dCy
         7LPpv0WMEIfs0NcYRTuU4F/9SL48Lposi9cas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ULhqauozIyAL6tCfLF7X399mGWMTgFSXg+lkMSYWnQ=;
        b=Y2WxmnJ8tU0ENytgJNEfDB6NhRbldgQGeVSdVA+JlH5f9ronLqqJdZBOwwcP1hcYYB
         eRoTgBxj8luYTJiid7J2vvp6V7+XM6XlWp+PJXNVF+z/cgz19vzx8hqx38r1xhlj/X2O
         x93IQmymzVd3vyjOXSBh1jDkGnI48Iaw3EZnnAt5glgvY5quB2b+2nImK/Mss5f+s6ov
         9ueHv8F9WFMqbYH+Sho0i++jBahaCkpGUOOVIXNR3AbZTvet3EKBBcLxyKiHj5Ph+vHT
         w0AKH+DxFlP/bHsBJ/0K9OA2iUa+jBfjCBgDP8OaDQoGUurXTcFEQWgeqlOF6y8GbRYb
         e3eQ==
X-Gm-Message-State: AOAM531H9DkfhTewvr+CbebRuY4DIHk+PrmIXDbIT4lpn0LIR1sG9WQp
	7f1fNVIyMV2W4aNwB4peV0Mv1TiGhc0eROuW
X-Google-Smtp-Source: 
 ABdhPJyy+5Kbn8TKyI0kT20aCL8B/eJ8DAgtuMn8XhpEzAd82g003iVAEUvY2+5t3PIRh3l8BPPZ3A==
X-Received: by 2002:a05:600c:204e:b0:389:a1cf:e6b9 with SMTP id
 p14-20020a05600c204e00b00389a1cfe6b9mr3478920wmg.175.1647518223252;
        Thu, 17 Mar 2022 04:57:03 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/26] python3-snowballstemmer: Add new recipe
Date: Thu, 17 Mar 2022 11:56:36 +0000
Message-Id: <20220317115700.993924-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163388

Add a recipe needed for sphinx support

Based on a patch from Armin Kuster <akuster808@gmail.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-snowballstemmer_2.2.0.bb         | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb

diff --git a/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb b/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb
new file mode 100644
index 00000000000..ff120a3fc48
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Snowball compiler and stemming algorithms"
+HOMEPAGE = "https://github.com/snowballstem/snowball"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=19139aaf3c8c8fa1ca6edd59c072fb9f"
+
+SRC_URI[sha256sum] = "09b16deb8547d3412ad7b590689584cd0fe25ec8db3be37788be3810cbf19cb1"
+
+PYPI_PACKAGE = "snowballstemmer"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


