Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CA4C433FE
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:43 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web09.3985.1637788482667224116
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dlNB/rjt;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id l8so4097511qtk.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mi1kd4Hj8cW0da2BXQMsMpngYD8JgUlCRAUgvHiBTag=;
        b=dlNB/rjt1FDWvzPkhgNASD6a0u6OYYn7vHpATAq1xD1xXeEczIGO8g07yePjkzc06U
         ZBLpTBCfBADd8jd4AWgrmNxtQtIGNZrp4m2DognBuDN65h5ghnnCJPjd0YTgl0HQ3bkX
         tBdsVtZZRcgMWAdHPV8OvhU6ylbfN2UicwyGAdx33Wv2qVs3osFCChSXCRsiNHSc47hw
         g+DpTPYk55qLjQCqkGgCjdSPK7RqIKMEvJOfzqi1WNZ5XIfkAdRy/iOIEUKd6ke6A/nV
         ZcX4PABMLbY9UX3V/YcDLTywRW5uyCDu+LMX2cSwqYReiswCviPLFJ1TF5JfOAZHbhW+
         iBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mi1kd4Hj8cW0da2BXQMsMpngYD8JgUlCRAUgvHiBTag=;
        b=mUV8O68kVrpWnv2FBkIPtyUx9XmzLoF3ZrDE8FRXOi990pJvZRVNpumzUr4j+7G4oX
         XkA8wlsSo8o2GuW6wZrSUUQIean8VnAh7EajHhJpkV3IGsJPi9HLZaeYgfc3lQvMxjZp
         olCSGPDwZizpMRAr/eRWvHCVSEnzWljmTeHh2hbyZ0M7l99x+R6AATPAFJp4Jdfvs/hs
         +lzFjoA51B/X44ZxLH6lLz/NPSW6gXo8R5qm/K5jhCDcoipD81FO0YNlUNW5HM8h/Pv3
         xm1KsyyY5H6wYaCi9dB3OiRegvrC0/uMyplQAyBh0ig+v2OHMyf+gJv8Uha0EOXuDL2b
         myVA==
X-Gm-Message-State: AOAM532froc8IiIMv8eKrD6og04k6dIAF/fDVYb0bgNqL6thOK2AOGMg
	C+Zfk8Zb1m9yY+kuBwPNkIY=
X-Google-Smtp-Source: 
 ABdhPJwZylzWwY1yS2d7RSllUQxh/U3tek8i+wYfCsSFRe/MsJ7cB9MrEJjnnvbcddz/aDZIui/twQ==
X-Received: by 2002:ac8:5a8e:: with SMTP id
 c14mr11281605qtc.332.1637788481793;
        Wed, 24 Nov 2021 13:14:41 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:41 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 13/20] python: import strict-rfc3339 from meta-python
Date: Wed, 24 Nov 2021 16:14:19 -0500
Message-Id: 
 <f5b6b191e450a0b001bfe2575ceaa8e0044d2b3a.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158759

From: Bruce Ashfield <bruce.ashfield@gmail.com>

strict-rfc3339 is a dependency of jsonschema, which is being
imported to support kernel device tree valiation.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../python/python3-strict-rfc3339_0.7.bb               | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb

diff --git a/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb b/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
new file mode 100644
index 0000000000..52ae9ebe9a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Strict, simple, lightweight RFC3339 function.s"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8f0e2cd40e05189ec81232da84bd6e1a"
+
+SRC_URI[md5sum] = "4d9b635b4df885bc37bc1189d66c9abc"
+SRC_URI[sha256sum] = "5cad17bedfc3af57b399db0fed32771f18fc54bbd917e85546088607ac5e1277"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.19.1


