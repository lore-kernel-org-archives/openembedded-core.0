Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A43DC3F6B0
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:00 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.6583.1659705178597213530
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I3riGE0o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id v3so3295687wrp.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=IrvSfJ+YeswSk+3a+1A7l/D72zYt33glfMsW475vj9g=;
        b=I3riGE0od5iMNX7n/Li94BeRHNVS3Ed7o0DaAEJ+sHrbs5/fUDIWkp5W4Dr99AtMvf
         w76KCXL+YtmmMLuOZoOoxiMkkBw7NQ0Z7vHbiVjrBwNGopTWcFgHBzSi7YlLwi+0yHss
         jExI8ZVWhfcWms/OataOjlhinCK0dWL6e0snU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=IrvSfJ+YeswSk+3a+1A7l/D72zYt33glfMsW475vj9g=;
        b=DW3vPPQV/fvBcHoY0PnoD4U7Fdxv0ugrtgHWfLkuspfKR8nI/GaHGnWrG9WzMEVcqu
         paIXhoXXgEierfyXLWX2CfiowBtmJgz5Rvrlsf56Y3lPpWoFzMuMtL6NTj+9TYQozenW
         gEwBKJveiwLQrqOUbStPY489Ay1MY6rvlW8n99BIIzTKgAih89Hinmu4gvbi5w1f/uZZ
         DbPWFhoYMebaIiHqT3c4CkiX6UXhA4MyTvi4EXKu+Efe5Jx/mL3AHnIxEXLDM1mecT/n
         ZCJcvsC4QsVQN0dX2kf5aYVh6G1HtUPzMkgMBTGLTcI/yJCbmKUZzRvxcRMb1t1S+OXM
         U8rg==
X-Gm-Message-State: ACgBeo1i6PunlBsWJrGlEEH+sqxmoQfjekLMOltqDDGPIdyrAKjPIm+d
	TRvegOiZOm7CvkqCAf2xlowge06UGLIhVA==
X-Google-Smtp-Source: 
 AA6agR7SH9oxMIo2u5menkqa82/YFVOXqlvpF/ikjXjmqqCnx1enxZVM1ZAAZzv/R0QTZS0wNS03Xw==
X-Received: by 2002:a05:6000:1a89:b0:21d:ab1a:b19b with SMTP id
 f9-20020a0560001a8900b0021dab1ab19bmr4492168wry.78.1659705176903;
        Fri, 05 Aug 2022 06:12:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.12.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:12:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/29] rust-target-config: Add mips n32 best guess at target
 information
Date: Fri,  5 Aug 2022 14:12:28 +0100
Message-Id: <20220805131252.3706794-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168939

Add a best guess at MIPS n32 target information. This might not be
100% correct but is something to start from at least.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rust-target-config.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/rust-target-config.bbclass b/meta/classes/rust-target-config.bbclass
index 87b7dee3edc..1721839922e 100644
--- a/meta/classes/rust-target-config.bbclass
+++ b/meta/classes/rust-target-config.bbclass
@@ -190,6 +190,13 @@ TARGET_POINTER_WIDTH[mips64] = "64"
 TARGET_C_INT_WIDTH[mips64] = "64"
 MAX_ATOMIC_WIDTH[mips64] = "64"
 
+## mips64-n32-unknown-linux-{gnu, musl}
+DATA_LAYOUT[mips64-n32] = "E-m:e-p:32:32-i8:8:32-i16:16:32-i64:64-n32:64-S128"
+TARGET_ENDIAN[mips64-n32] = "big"
+TARGET_POINTER_WIDTH[mips64-n32] = "32"
+TARGET_C_INT_WIDTH[mips64-n32] = "32"
+MAX_ATOMIC_WIDTH[mips64-n32] = "64"
+
 ## mips64el-unknown-linux-{gnu, musl}
 DATA_LAYOUT[mips64el] = "e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
 TARGET_ENDIAN[mips64el] = "little"
-- 
2.34.1


