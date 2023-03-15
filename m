Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99961C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:01:40 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.8782.1678888895195831480
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=BgHvtz3G;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id o11so1008142ple.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9V0ubTrlrAGvE4f7sZ3RAGQ/wd880j8FZCjq3n1TbOM=;
        b=BgHvtz3G4/QtocuUnKhESeIsPPO50cfcd6/9fRjMl//yGNV96uxWJ5OcJJh9x9mTzy
         8/gVPnwZXjCmOZzhiV75nsu8+VVdzIEsnPR3Yt7u/liZlZcM5O6/C7ud/YyZXr4LJHDp
         xXa66frhbzkUC7xv/bMQzknmE0Na8byE+1HRdejBkXBDakjEJetWqKm0YAgURS9l3Ebf
         2UFEjHNrKPIYBtasG0MxUiF6Ws/NQy/KiTwCoors7QFRYyc80ig50q5ZoQ3bU8g/b8o2
         KK+gDM4glVkKqsCICqbpvbyQnA//GU9NKi2OgeCoW9yG5SWjJ9m9LBDaDBHIQa/rYMFP
         cyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9V0ubTrlrAGvE4f7sZ3RAGQ/wd880j8FZCjq3n1TbOM=;
        b=ss7fuKfignV6lSuW06jGoCwByrt4zERxVvbGaSyYrpB/ZvgFwuYNa70pwiSTX9lRRT
         DOzoyLI+7rGiCy/alUXKJUe/fKZfaziUk8I9iTpi1XgjOXRh70zx1WPHuuUR3BTLVKnZ
         jmhCjP2JstYECbts7lWouM2FfFkxlJiyVb4GJRjRSMeaNKrbYCAHbB6bjboXwiBvDbOb
         dxFWgLKi9d493j/GR3AEp8pbyfhcw7GoQQwDewJvbrnzSrU/yWhr6Kmfa22bPssG9Ac5
         0cxs0uc3nV0EeL+WGIPhlKsiNzC66btsnuVwV0d32twnmMBQFBkIn0BWfZAyJ9O1YRBU
         1tEg==
X-Gm-Message-State: AO0yUKXDxdUPMhQ5Ubf6R/uPqOM2REqB6ldSeXHDdXseKSu3ahKGTt7u
	3+ycu7x2z85WE7QMCDW9XHHRUF6zvgHwCNSFHoM=
X-Google-Smtp-Source: AK7set9lq5OB16Mf3LYv6GXNVQGmgvBdNkIp1l28l6krsQxZWVN+8pjjr1NFtHxvi0fTcfT7amWRtw==
X-Received: by 2002:a17:903:1c1:b0:1a1:7b8d:670a with SMTP id e1-20020a17090301c100b001a17b8d670amr1897038plh.21.1678888894240;
        Wed, 15 Mar 2023 07:01:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/22] shadow: ignore CVE-2016-15024
Date: Wed, 15 Mar 2023 04:00:57 -1000
Message-Id: <d0b1f61eb1fadf44b2e4fba13b6a94140cf029db.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178557

From: Ross Burton <ross.burton@arm.com>

This recently got an updated CPE which matches this recipe, but the issue
is related to an entirely different shadow project so ignore it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2331e98abb09cbcd56625d65c4e5d258dc29dd04)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/shadow/shadow_4.11.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow_4.11.1.bb b/meta/recipes-extended/shadow/shadow_4.11.1.bb
index 40b11345c9..d1a3fd5593 100644
--- a/meta/recipes-extended/shadow/shadow_4.11.1.bb
+++ b/meta/recipes-extended/shadow/shadow_4.11.1.bb
@@ -9,3 +9,6 @@ BBCLASSEXTEND = "native nativesdk"
 # Severity is low and marked as closed and won't fix.
 # https://bugzilla.redhat.com/show_bug.cgi?id=884658
 CVE_CHECK_IGNORE += "CVE-2013-4235"
+
+# This is an issue for a different shadow
+CVE_CHECK_IGNORE += "CVE-2016-15024"
-- 
2.34.1


