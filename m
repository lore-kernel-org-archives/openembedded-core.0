Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC43D5AE41
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 02:29:30 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.63123.1730946566488351973
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 18:29:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RdnpAU1X;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6cbe53a68b5so2866256d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 18:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730946565; x=1731551365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6WBurcH6M93YmdNCHBfBx8DwZTfWNfyccktNMRCrgg=;
        b=RdnpAU1XT6bKhiwTLVCAEgGBobR885OcmohsaR7GPOztMsloPVfAVwFnpapOW9hwXa
         rdOxpHm3dOMAVjggM6sMkEiBqHCBVb0Oo+G/d5+p46A5F65z2s5IjcvjHEcK0xi7rHrf
         E2EPfuWokWjGKe4tE9RpIwBBQvmZapQD7mgq2aDbaN9Ed/m6pVXewVdCsmTvfs5YI9nk
         IgD24JHRw0NRtj6lHtfV3Gs4r7Av2F9DQVNci4LvUCrfUh/kQ85PEJr8mJS2oP28DvoE
         hBLam4X0rDW1P6Ddwfv5fYom8YnYtai5tCrt0qQdS1BojUTUFb7Zgg2v+75TDvgaTRxH
         lNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730946565; x=1731551365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6WBurcH6M93YmdNCHBfBx8DwZTfWNfyccktNMRCrgg=;
        b=OSo8/7H9kXW9fQdVgdUJfccXY1FyGHFmO4jhXOINrTJND1Fy3ZrkKc++Z/1Ab2SK9x
         TOEqywIAxucPM+XBPmjPrs2h9PfHnLNPvLbeHd6J+Og+o1G/PCpkvEaVYFQlKmTYEE15
         9BDxfYhrNbJqOHYdgqoSml+0P/VobmofuhX8lPX3sHGTgp5rF+0ElPjD7oKShAcxj6eU
         tY15uproc7FVLAssDsbAdsstZALFRVwZGu2NBijArJ649tO82tZN6SeQ9mk7HopUGIZw
         Qa9Yh6Rq1ClWVHt2hRjAn3AWj4bbZ4uWy40MaKHx+6BYS0BRr+wvGj5h82YdZ1NkE8Sy
         4yhQ==
X-Gm-Message-State: AOJu0Ywg/rQ9XmKadBafuzAO6exDkSzkzbWeiwiTEPx+/uiAohybred9
	XAaw4n8RIuIQ7chDte7TWbSWB2HkK5baQ83bs6EMricFbWEGCerM3Z1wEwt2
X-Google-Smtp-Source: AGHT+IHQNLBAC8ZWJKEJw6O1z+5I0tdC/lJZH7S6ZVQ3i8/43bzsstpUxXGY/E0j0Y+BF9A7XA3UwA==
X-Received: by 2002:a0c:f209:0:b0:6cb:f744:e3f1 with SMTP id 6a1803df08f44-6d396c2c978mr6324906d6.4.1730946565553;
        Wed, 06 Nov 2024 18:29:25 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d396631aeesm2124286d6.120.2024.11.06.18.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 18:29:24 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/12] kern-tools: allow inputs to be tagged for audit
Date: Wed,  6 Nov 2024 21:29:09 -0500
Message-Id: <cda00ed7ddeb574e983f32bcda93e99e11ff17b0.1730946087.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1730946087.git.bruce.ashfield@gmail.com>
References: <cover.1730946087.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 02:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206808

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit:

   Author: Bruce Ashfield <bruce.ashfield@gmail.com>
   Date:   Wed Oct 16 23:34:04 2024 -0400

       spp: allow inputs to be tagged for audit

       files can have a specifier "optional" or "required"
       which follows the input file and is separated by a :

       We need to adjust our routines to check for the
       specifier and split it out accordingly.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 98dd89f585..01c5030759 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS += "git-replacement-native"
 
-SRCREV = "cda23df1a86aa89cf1748af6aa5134160c1cca48"
+SRCREV = "df5de61e6e52a24b7851b68cb8dd1e226ac1fb69"
 PV = "0.3+git"
 
 inherit native
-- 
2.39.2


