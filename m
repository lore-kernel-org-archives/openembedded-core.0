Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658DCC433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:51 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.1917.1645557470649721249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EFr+6Mr8;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 139so17842263pge.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6b6hjU8Tr0y6EpLhEFIaw7+Ycu7cqKCSFhJOflzqT/M=;
        b=EFr+6Mr8AOEL33XSWjQRZD74vNXBiNPwAcyKrAopPAbrJSUT5hmhbKNM6GvELd1bzo
         B+CduIq+uLMr9xQVf2gc5/fXrIF4FUrvvUaBIYjgBVcGKB8M4Ga4GrV+C+0TGFTH8+mn
         9oTRXz4bJ4Bu2Ai12PZCftDEswEQE8YpjS2zD502OoPQokpGTpE0/vnCU+XJPjYxRNWs
         v8MzjJbADNOxA9guG8EicH1UQ/jpVUzEqSKON/bjONEKzCkKwQXoWwqYwRhP5IK8PjGx
         E88A2BCQ97e0EURysV0rlWGNEBfWix1hgDmw+PcM5ay8cQXkdLNKfMtjlt/kMp7KgpU5
         Y0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6b6hjU8Tr0y6EpLhEFIaw7+Ycu7cqKCSFhJOflzqT/M=;
        b=T/3NcIUNdblHc2Znt5vj5WkIw5CJjmn2Y1/YD3KIm/SNEcr2YQ/4wLXiu6NZB2porP
         AusAgoVtGQ6z1OaunusnreY85O0+/sfEltpu/iLyR0am73HhQET8WoHNNYGAWEVXS1Nx
         QfKQUt8b7kk+Xmnx2onsaGUZW7m0EdGcKUzwTOZDxPb0QGzbHj6MNGS/FmlTDi3w03iH
         mXHXWVklYYxULWtNMLn9hR/vU51qxZh+uaPxbLIcbZmkv6xJJ7QY1x30YkWlxLaQGcZn
         3cND9VH4Jy5okN8c0lA8T2ZURfgO4d+g2RZOjCpQCCJCPGkHjjZmZoegO/2GBk5a29q0
         +WhQ==
X-Gm-Message-State: AOAM530aFCgsztPiSnhIFrdwoUwVSR+vhItuW+LCzEvWSVxYaClPeIXR
	BEjdlTroe2THIEFztWq4Z6lZsLU23w9SJw==
X-Google-Smtp-Source: 
 ABdhPJxMXi7Cpya8azwuPCs0D5Vq9T6imBvv5bzWyMedBa/PJ9KzFR6WaCLXWAYLEivxyCsZMWE0Tg==
X-Received: by 2002:a62:586:0:b0:4e1:dc81:8543 with SMTP id
 128-20020a620586000000b004e1dc818543mr23479604pff.0.1645557469683;
        Tue, 22 Feb 2022 11:17:49 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:49 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 28/32] numpy: set PIP_INSTALL_PACKAGE
Date: Tue, 22 Feb 2022 11:16:54 -0800
Message-Id: 
 <0ce1d22a61cf8978ec9672ee0bbeb5153ec102dc.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162219

The recipe does not inherit pypi so we need to manually set
PIP_INSTALL_PACKAGE appropriately.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-numpy_1.22.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.22.2.bb b/meta/recipes-devtools/python/python3-numpy_1.22.2.bb
index 52fbca94e2c..d2b2f3e38d5 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.22.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.22.2.bb
@@ -20,6 +20,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 DEPENDS += "python3-cython-native"
 
 inherit ptest setuptools3
+PIP_INSTALL_PACKAGE = "numpy"
 
 S = "${WORKDIR}/numpy-${PV}"
 
-- 
2.30.2


