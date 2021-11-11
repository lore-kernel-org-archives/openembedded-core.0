Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BC2C433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 15:25:32 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.937.1636644331248743946
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 07:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tb+lFN+N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso5717942wmh.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 07:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rNxnzqkwju6NPJ9efUuU7BWQ0aUcEv0Ng5Tpp+wYyB4=;
        b=Tb+lFN+NlwOREwvhRarm4DJrnSL0URVY2gfBYqKaiABr0eegLc+Ns0z6DD++WoFQtp
         luG46KJ2cS/tY/sGhnBumZT7NZpfCD4E44MXiXMYnG5ekPACr7kAn+EDXFGMEUDlLtwe
         iYIlQYSgfauT+JCbAxhSKtqkt4Q7xXWWw56uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rNxnzqkwju6NPJ9efUuU7BWQ0aUcEv0Ng5Tpp+wYyB4=;
        b=03rSp+1IxF5TKI7GuNnFMlDtBi9xgYB2KNJPP/s52+QpTwqpmZbs0pqWW05HrWtyF2
         q1+3M/ziOB+9894MrWkY/n/63HHPFk5xP6ac5LmRw3Cv9SOQzNtrA2Ll9w6t1RZj3CSt
         YcTHiEPJtZXYfmEfcyc+ffBpoq2lQzXuAHxK3LJbjCX9D2OM97rdhxWXoN54iUU6RcAP
         xVkiH5xvBVzsY4YbDDWq9OJvKcUxa8O9zte9+nsDUXfnyKHr7zsTZuqPNUi9RvOWBSNs
         3M8IUH8ZyK+yxefID5UEWKScmafaMw/QIWu7ePPNlROoF3MNIkYK9S4nsDekEanqa8Wp
         SbRg==
X-Gm-Message-State: AOAM531U3qgbjOvRVjpGcD6oBoOFAlC2mcbXZwVhBdijcb5Ry330EIW2
	6cUdI5tldfRNBd956NUn6nRWyUFZBdOlMA==
X-Google-Smtp-Source: 
 ABdhPJyhiC1Vez1NSIWK8CFM2OH8JU9FBc83oZpDw4rb68tEQqf3TN/I9mHYWWmuxhhfTg9H6fgeyA==
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr24135837wmj.55.1636644329308;
        Thu, 11 Nov 2021 07:25:29 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:b19:11f4:a3d9:cabc])
        by smtp.gmail.com with ESMTPSA id
 x13sm3374108wrr.47.2021.11.11.07.25.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 07:25:28 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] scripts/oe-package-browser: Handle no packages being
 built
Date: Thu, 11 Nov 2021 15:25:27 +0000
Message-Id: <20211111152527.3862621-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211111152527.3862621-1-richard.purdie@linuxfoundation.org>
References: <20211111152527.3862621-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 15:25:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158189

Give the user a proper error message if there aren't packages built,
rather than a less friendly traceback.

[YOCTO #14619]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-pkgdata-browser | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
index e07005b8070..a3a381923b7 100755
--- a/scripts/oe-pkgdata-browser
+++ b/scripts/oe-pkgdata-browser
@@ -236,6 +236,8 @@ class PkgUi():
         update_deps("RPROVIDES", "Provides: ", self.provides_label, clickable=False)
 
     def load_recipes(self):
+        if not os.path.exists(pkgdata):
+            sys.exit("Error: Please ensure %s exists by generating packages before using this tool." % pkgdata)
         for recipe in sorted(os.listdir(pkgdata)):
             if os.path.isfile(os.path.join(pkgdata, recipe)):
                 self.recipe_iters[recipe] = self.recipe_store.append([recipe])
-- 
2.32.0


