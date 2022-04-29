Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99832C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:02:29 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.12139.1651248144604683756
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=piXrMdG9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id y14so7267576pfe.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SVgzC4CQJOWJsNutQLQvztG4d4dh1oricPyxNZl82C0=;
        b=piXrMdG9vPZWLbsqeAG+tiU9aPAZGLi2lTWN9eGWzNtb4bbKn3CdyIKpi1FZwCRj0B
         nDWJC2eLKMb3ovPSWr01ZeldbvFdxX9bdtozWqjh4oOJcZWBELoDAqXcRbD+BEmKggb/
         dmCB7WauoLwdRzLKopNW94iP7D4mmGheSBFEffiCviFS3EUlZgRpVGiwq2VVBbV4zz5t
         89YMSQxclIqm4LVMqdaO+78CDvrrbrGqSbhVHkndgLV5a/RKPZf5K9dYtcF7XKBCAbzf
         uyJte3AJV3pGw/CHKtgWXA02hl5pILjIgFW8TeJQaGSmYkV9vOlYqxSxPsThBCAb+en+
         Wp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SVgzC4CQJOWJsNutQLQvztG4d4dh1oricPyxNZl82C0=;
        b=5wRVIAVqqNsRNrdEU0bEQyy7RayhtMkPmE4/VyoTloTF03AlQe2xmS1HkZsHjuYl30
         WQePf6Tc9xAERxcj8wl6fxYoWe7qYPGhn/IsMVTWXGyujCTXlPeSVP7udooSyyHEKxZv
         D2PaehnM512t1eWnR+holl4FFkv6i4hvX7g1CE60HaX8gS16UO45FiYbX1XM/3ApS4St
         JuOq9lfQwof1NSNxY9FGK2UlF/YVynbkS0kbkfFV74ZqOKqTeC7lQTEqlp5WQjLsPlZF
         yM4xjRoRQ8dHgAzJgjwU7aSzyfAbtc06xMu1rbO0hQACLHUPx3Wc+rieXyRPlGcTL6gf
         FLbg==
X-Gm-Message-State: AOAM53020hlSxr+drfI/8FKPgq13OGFeuPS8Dz6tKjzcEccUjWdD4sAc
	MK911XkB5+hE459yLgm/cHZ8UxcfnltOsPgcRMU=
X-Google-Smtp-Source: 
 ABdhPJzVvoDmvlHeSDzlOt1Xf+VYQZp59hDcQ09pQA52E7g7SHiK2uTybHn887UuTIgJL5gG4/gb6g==
X-Received: by 2002:a05:6a00:190f:b0:50d:8b82:cb90 with SMTP id
 y15-20020a056a00190f00b0050d8b82cb90mr71949pfi.65.1651248143255;
        Fri, 29 Apr 2022 09:02:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.02.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:02:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/34] create-spdx: delete virtual/kernel
 dependency to fix FreeRTOS build
Date: Fri, 29 Apr 2022 06:00:44 -1000
Message-Id: 
 <ec31ce4751e45e98730165d64eb74fc98eab8c85.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:02:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165044

From: Davide Gardenal <davidegarde2000@gmail.com>

When building FreeRTOS this dependency generates an error because
bitbake cannot find any provider for "virtual/kernel".
>From a dependency analysis the task is executed independently from
this so it can be safely removed.

This patch has been discussed in this ML thread:
https://lists.openembedded.org/g/openembedded-core/topic/90602531

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1c02b768a71ec88bfe1cc0c4443683de8b66056e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/create-spdx.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 47a8764bf0..37b6b569a1 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -35,8 +35,6 @@ SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created f
     is the contact information for the person or organization who is doing the \
     build."
 
-do_image_complete[depends] = "virtual/kernel:do_create_spdx"
-
 def extract_licenses(filename):
     import re
 
-- 
2.25.1


