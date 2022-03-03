Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877D4C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 14:28:42 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.11297.1646317721231936391
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 06:28:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J9UA4y91;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id m6so8118698wrr.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 06:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DaScIJdHDqx/O7U+eQ5YlTAVS7sCmBotjO8o2mJSuxs=;
        b=J9UA4y91g/eEowUAxB+obIc+tRjFihlyci19LUT6zoEWg2esIZMLbHutxG8MTVnDGe
         LkBRALTkSz/G6e/iq82VeHCVYRbQW3tanXJYHpi90pM6fX5CvybPoVpW4pFgdSxunO0R
         c+Z3Zy9J5MW3800gTZB8vGHILD6QbU94w+RLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DaScIJdHDqx/O7U+eQ5YlTAVS7sCmBotjO8o2mJSuxs=;
        b=F0punL1akvS6TZnPMI2CjbfdD2gyA371OyoXlWEnqSA+qZPCHVMxpjm7gwWY3ZLnS9
         ox96Xws6lL7oBisurlkcot6VVgmrgHrAcB3gi96JM9KTRXRJlkSrKN7uVUNWZYdUbSBs
         Jj7p7osSHM+XezHkEh2PS9b+HmzrYk0NyxdLZ4qKyl/MzVJj9wJuvEPSWrFSO9k15Grl
         rmb+OFUehxJ5Od+PXKFzeDGm9dj7lufq3qXJSY/ErSDspybd7EyPBV2WiNwtdIwwzzKR
         A+7nEhckePgAZeUw+NURr0hummm95RGPVP9Fk716MOXt83dlLUm4zgKimV2iFq3bcZdw
         jW0w==
X-Gm-Message-State: AOAM532A87kLQQpbyZCv8dOfazuo7CWcjM67/JfSqE4Zqi2gcH8TaYeY
	XjGqLR3qIYZZ9WkpZ4l92bTdcOgh/BRp5ZtH
X-Google-Smtp-Source: 
 ABdhPJxm2n7OeLRJIESeoumWreZFf0HQBsM2v6lqhTuipAC1dTPjSo19CxgmpgsPLQ7pthfdg889HA==
X-Received: by 2002:a05:6000:1d9d:b0:1f0:181b:3c53 with SMTP id
 bk29-20020a0560001d9d00b001f0181b3c53mr8815626wrb.87.1646317719299;
        Thu, 03 Mar 2022 06:28:39 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:68d0:4b5c:ced3:87b1])
        by smtp.gmail.com with ESMTPSA id
 ba2-20020a0560001c0200b001f0653f1097sm235211wrb.69.2022.03.03.06.28.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 06:28:38 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-native: Drop opt-1 and opt-2 pyc files
Date: Thu,  3 Mar 2022 14:28:37 +0000
Message-Id: <20220303142837.330815-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 14:28:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162655

There are over 3,000 of these in python3-native (of 8,000+ files total) and
copying them to sysroots all the time seems pointless, particularly since
they're only used if python is run with the -O or -OO parameters.

Get rid of them and save the overhead. This is particularly pronounced in
builds using the api-documentation distro feature.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3_3.10.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.10.2.bb b/meta/recipes-devtools/python/python3_3.10.2.bb
index 429839b6226..b28aa6505a0 100644
--- a/meta/recipes-devtools/python/python3_3.10.2.bb
+++ b/meta/recipes-devtools/python/python3_3.10.2.bb
@@ -152,6 +152,11 @@ do_install:append:class-native() {
         # (these often end up too long for the #! parser in the kernel as the
         # buffer is 128 bytes long).
         ln -s python3-native/python3 ${D}${bindir}/nativepython3
+
+        # Remove the opt-1.pyc and opt-2.pyc files. There are over 3,000 of them
+        # and the overhead in each recipe-sysroot-native isn't worth it, particularly
+        # when they're only used for python called with -O or -OO.
+        find ${D} -name *opt-*.pyc -delete
 }
 
 do_install:append() {
-- 
2.32.0


