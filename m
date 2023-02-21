Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C731C636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 20:45:09 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.53785.1677012307082502837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 12:45:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BurkRPxZ;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9so2445814ile.8
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 12:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6g8qlzAZ+mPyMoxHhqWoNrg8N464n/Om5CzlONFjQc=;
        b=BurkRPxZBfC6gy/pKdiWf21BkXDERhzIgBYjEjxt89V1MWeWScJZU46186bRJYQev7
         3eKHN+T5s/7mSHil6EKXh0ADjxDFRCVQVhta+HRnzCIAjvln530xfmkpgfiWvpC9hf5U
         U7YONzyI6Ju+fFYMbm2Zy5/TasOJgmKtlMJNvhUZlpTjKHLCbXYljuc7DbAnwnJlnUxd
         VIPDILxVdVicfgA2sPNFE9kffxpCiW27MARo33YPYOFlJtNnO9P8Aqxc/XefkWcgmGpL
         SU28G34tRaM1kW/TFRrhYpvX86K+GQkHdaGpjEQ6Y4Uagu6gVuphtIf80S1OD0EMacgu
         dR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6g8qlzAZ+mPyMoxHhqWoNrg8N464n/Om5CzlONFjQc=;
        b=JF8+2IaHd3B2hk1EyBoTe2eKIaEPDizk/jEzaGqcos7zd+5CL4tKBLQl7TvEtyNyu8
         nNK/rzGIVF4DMiiOoZwS3PzffJ40jRlsthhuUd2CwzD2x9BE0Ejg6zQqAgJozYbtcoEy
         92CwFuXNWaHoo1Rpoy2Wn2nbMggbA3fzztotn5PVI79e444mGUOpESiwVgmrPxymmOGd
         RI9+7/TDMHCyJj23m2YbyKmOYqq2ANKkUDPe5gZmnboC9U5up9tgu41HpIZfvZNATnWr
         M8V0ZSv/e18sVC8pLjM87akJaD3saP3sQHAKQi8eLEcowIFUbLjd5nAxBBBOQOaBUBek
         iuuQ==
X-Gm-Message-State: AO0yUKWe2j/cUg3b6t9FAIqcxgvfCy3aoUbMdn8etsex/VUN7P1XKfMX
	qUo8A/4q4dPTbUY6uARfVZ9Ym13WnPA=
X-Google-Smtp-Source: AK7set/xFQGR3e1WZ/uFvcCrqIxJvB7H7CCESiHi1CZRc798UoWRIukj5+8f6CTr3+s9wB0GZ96unw==
X-Received: by 2002:a05:6e02:219b:b0:316:d855:fd25 with SMTP id j27-20020a056e02219b00b00316d855fd25mr3673704ila.21.1677012305960;
        Tue, 21 Feb 2023 12:45:05 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id e11-20020a02a50b000000b003a58ae912aasm414347jam.28.2023.02.21.12.45.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 12:45:05 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/11] packagegroup-self-hosted: add zstd
Date: Tue, 21 Feb 2023 15:44:36 -0500
Message-Id: <20230221204445.23931-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230221204445.23931-1-twoerner@gmail.com>
References: <20230221204445.23931-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 20:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177540

Add missing tools necessary on the host for a build.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 529d4c5c5c6b..dd000fda49d1 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -176,6 +176,7 @@ RDEPENDS:packagegroup-self-hosted-extended = "\
     xz \
     zip \
     zlib \
+    zstd \
     "
 
 
-- 
2.36.0.rc2.17.g4027e30c53


