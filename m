Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F98AC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 16:34:56 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.12968.1646325295064535494
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 08:34:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JJYBW9Hv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id t11so8712094wrm.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 08:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Chljze3WxZ/z+mSHwEOsZGXRNtwqWdHpSOZDuWa72Rs=;
        b=JJYBW9HvjSoT1JiYrvftQwnB7hORuDdhtEQAh8w3ltd0oL5LckoVlyVi3hL14Af5wq
         6lTfDbYYupHVyTWzkjxpN5+LfqkznMFXd0MvJRTohpIvYewzpvbQcJqOUHmjuE/6IhjU
         4qftjbiwavXWFMKGJK6gImfPbTELmXG1+6ems=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Chljze3WxZ/z+mSHwEOsZGXRNtwqWdHpSOZDuWa72Rs=;
        b=xHLjmyjw1p8WVtUenvUjzxO+YjwyYMLes+JgrJHRN/1mgV5VR3urAQBIxT8LtJfk32
         lmX7FYhHVlgInCj2kcqot+8tNLjaQpJH5zMM8cBROHsTWEJF9xn4Ta9phDbAZDCvEVLg
         ibjgW4uRp6I1kCsL9hsnFNKWER1Wf/iODTmCphNq/2XlKZQ3Vr2v/nj28QiKPg7vUAnM
         yp7GHA6DAIWvvi28lnAJ9qF9CcDVjF2RfLiM266HyTq80uHNejy6yMIuUGMdtr0c0tJI
         XyEcCzFJMRfUMIQLQhJCBUe5i4SPNJsgJpHUgdRZTvaENqDmRY/hhmAaS3A350sPKwGe
         wBdw==
X-Gm-Message-State: AOAM533+2qGuu3QkuHstmM+BjRBEEZLn5hanAKRIJBTzn3BrVxqdi+yV
	kAJs8uIfAU49+Xkp3+qETfAJkFNZiMLnyfoW
X-Google-Smtp-Source: 
 ABdhPJz8tEYVHUFo17LL5ktYu9Ch0W954fqg+Nq43gqU6bHIqHrSFPPbz7ZV/CEgaNfJt/EeU+pZqw==
X-Received: by 2002:a05:6000:1aca:b0:1ef:b7c5:896d with SMTP id
 i10-20020a0560001aca00b001efb7c5896dmr16843008wry.572.1646325292943;
        Thu, 03 Mar 2022 08:34:52 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:68d0:4b5c:ced3:87b1])
        by smtp.gmail.com with ESMTPSA id
 x5-20020adfec05000000b001e58cc95affsm2436998wrn.38.2022.03.03.08.34.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 08:34:52 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-native: Remove all pyc files
Date: Thu,  3 Mar 2022 16:34:50 +0000
Message-Id: <20220303163451.336518-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 16:34:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162663

This removes a further 1600 files from sstate handling and lets python
create the ones it wants at runtime which is likely much better overall
for performance.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3_3.10.2.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.10.2.bb b/meta/recipes-devtools/python/python3_3.10.2.bb
index b28aa6505a0..7ec443a531f 100644
--- a/meta/recipes-devtools/python/python3_3.10.2.bb
+++ b/meta/recipes-devtools/python/python3_3.10.2.bb
@@ -156,7 +156,12 @@ do_install:append:class-native() {
         # Remove the opt-1.pyc and opt-2.pyc files. There are over 3,000 of them
         # and the overhead in each recipe-sysroot-native isn't worth it, particularly
         # when they're only used for python called with -O or -OO.
-        find ${D} -name *opt-*.pyc -delete
+        #find ${D} -name *opt-*.pyc -delete
+        # Remove all pyc files. There are a ton of them and it is probably faster to let
+        # python create the ones it wants at runtime rather than manage in the sstate 
+        # tarballs and sysroot creation.
+        find ${D} -name *.pyc -delete
+
 }
 
 do_install:append() {
-- 
2.32.0


