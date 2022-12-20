Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD38C53210
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:07:24 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.57098.1671559637866644549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YuGPBLYz;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso9458986wmp.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 10:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryQHzelt9hqYn6CEjiK0iQUD2tjFJw9kA1aNefr2W8A=;
        b=YuGPBLYzxnSmmhn9CGEhniwSsmcY9PA93L/IPVKgkvDWJ6bN9HYL8OHpEiT01MKWRT
         42jlLfsBlLYGkB23Ne96foPT5x07iudgI9STsfhqoddLFi6fAjgBjSjqIj1IuEcnyGnC
         7MHwNuZmRtu8pIoXfZwNMCC27U+iKy5kFmkbGMnYiJFpCZbH/FKfXJyEa3KjDltxYzRZ
         9E3Tp0gY1bDNcvStwXGNqGffw+QfEXyDUgyNPu8+oxScbxB//wnwThaBvhnOzRSqwfM2
         nnzMtz0YsxYUNzjPrzOtXQovh5DAlhJu2kFFLVWcEFUj4LDUlxgkpcLmDj+hb2RKgGjX
         q5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryQHzelt9hqYn6CEjiK0iQUD2tjFJw9kA1aNefr2W8A=;
        b=o4jzMIQySZ+Y4uz2sAi8HPEXlEA5w3hrv/w/U6BF3uzNpDldDG1/cBEWbA4uOFMuER
         NzKbOAu1ippk7euEpkmY8CDqpyqOhiP2BdaWWisParx426hCBnWtzC57aNK1z7t/I4ks
         mMDEvvUkPwkpqJAO24IiOfDWng2QLaalaJ3lwEWzrEivFDfz1Mhz4rzd5U1ahFpnEh8l
         MwGUlTIbcsxBdY+Kbd0i6xURn7cf1qCC9uMY9iVdfaEV4NZNlecD+u4YxrndOA1ZWlV8
         r7F8PLqa6tqGi68Bub+l9+1gl69Ux62FX+/fdqBKxUGs/bivFrRHLct7aZf2ZZnzchvw
         SGqg==
X-Gm-Message-State: AFqh2kqyxluXlh+AhB+PJRCFSq8KoKxdF4rt8dD5fgmXYFj4wle0k2iI
	ojPCyxMvW84qrY3E6zJs+PMwcnLg8/E=
X-Google-Smtp-Source: AMrXdXtzmtMduvPLsxp2F/Rn+07oMLWv4jPDfUmWisj6PTsZs5x+Brttb5V/UbX/hTXo7dVsFCU+lQ==
X-Received: by 2002:a05:600c:19d2:b0:3d5:1175:92c3 with SMTP id u18-20020a05600c19d200b003d5117592c3mr2598271wmq.23.1671559636160;
        Tue, 20 Dec 2022 10:07:16 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c00c900b003cf37c5ddc0sm16243754wmm.22.2022.12.20.10.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:07:15 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH][PATCH 03/11] libstd-rs: Move source directory to library/test
Date: Tue, 20 Dec 2022 18:06:04 +0000
Message-Id: <20221220180612.24555-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220180612.24555-1-alex.kiernan@gmail.com>
References: <20221220180612.24555-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174863

Building libstd-rs from library/std omits proc_macro from the sysroot.
Using library/test causes that to be installed which then allows cargo
to build (https://github.com/meta-rust/meta-rust/issues/266)

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-devtools/rust/libstd-rs_1.66.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
index 6c5a979f4f23..8802e9790ce4 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
@@ -6,8 +6,10 @@ LIC_FILES_CHKSUM = "file://../../COPYRIGHT;md5=92289ed52a60b63ab715612ad2915603"
 
 require rust-source.inc
 
-# libstd moved from src/libstd to library/std in 1.47+
-S = "${RUSTSRC}/library/std"
+# Building with library/std omits proc_macro from the sysroot. Using
+# library/test causes that to be installed which then allows cargo to
+# build (https://github.com/meta-rust/meta-rust/issues/266)
+S = "${RUSTSRC}/library/test"
 
 RUSTLIB_DEP = ""
 inherit cargo
-- 
2.39.0


