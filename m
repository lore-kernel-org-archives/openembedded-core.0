Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220C4C352A1
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 22:29:12 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.7254.1668810549640586226
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 14:29:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YecyXeMo;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id d8so4429346qki.13
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 14:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pgvZGmNGSHcd0xzYZEvuZAAkRbFATDi1039OdHO7pk=;
        b=YecyXeMolmtWx6/zpa516WXcxWA/DDZpkhKqIXUTYextvmHBARLTjKdIU9Kb4Fyebd
         NVFocO9Q8Dn/acRp1xLHTlibSlf7DVxGvIRltSUCMrsde90wfUmib5P3UpvdZSOfZrWP
         lZqd+uJETBJaV0kgtVTemQHgVV5d4DGgs5QYRBWJGtUv4Sc9ZuVFwoO/WyrmNRetKQXb
         7yS4FZBhqo+gZCoZu0mRkFUhp3oiaK3B3mY6cTxe4pa10JlWzY3T9PtacwRo801tTKXd
         Yd+9TgGERM7kjhZWUvaO4GRjfY47fDAEhlMEMj560WU38K3TmV0uM1+xoL2bjeViZDWJ
         AEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pgvZGmNGSHcd0xzYZEvuZAAkRbFATDi1039OdHO7pk=;
        b=VB/DwdnHgJ43IBTdz1FdTfiJjlrEr2nzHmQYnPm6m1szrpd/og+2RJiwcvfyjuFS+T
         eoFYH/0khcfGlFYb1psLYXQO4oKVjHuVvUXOY7JnVR3ooS/JFcei80QMNXK+SHjE6dYS
         77MN+60+KMBzjaislXyOQRxPoIO3qRcn8FkTfiPYPhJ2FL7PRelE+rIqI9p104Nljwxn
         HTdfCCvz39GEJAn2rDs0MV4hHaz7dOCUrMswIAlAJ1LkprayF/pugCnJusNhpIZTPFGx
         Q8cUZRE9acGsns457Rh4/nQ+t6FjdJcf2CVLgRFRZYUKoUanskcPttJSoHemQ3BUTziy
         dKgw==
X-Gm-Message-State: ANoB5pmPziqPXr3BvkZdTfulvHVGEDDKaUbU9GFSOFh+WB7hdwNMyqNZ
	RVVrA0JNojkq8/KZspdWnVsaZ8CNNQFVSw==
X-Google-Smtp-Source: AA0mqf4eBHcuZcen3jg6VJXZfyYb/siMH6bXblBOw/StDq/0xkn8aKo7qP85TTWrKhH5DvqTfAh+rA==
X-Received: by 2002:a37:b09:0:b0:6fa:2e2a:81ad with SMTP id 9-20020a370b09000000b006fa2e2a81admr7579638qkl.189.1668810548655;
        Fri, 18 Nov 2022 14:29:08 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id h9-20020a05620a284900b006f9ddaaf01esm3304068qkp.102.2022.11.18.14.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:29:08 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/15] kern-tools: integrate ZFS speedup patch
Date: Fri, 18 Nov 2022 17:28:51 -0500
Message-Id: <cbbab79f03da7078715faeb89595555cff454912.1668810409.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668810409.git.bruce.ashfield@gmail.com>
References: <cover.1668810409.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 22:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173501

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the SRCREV to integrat the following kern-tools change:

   commit 2d01f24bc78256c709728eb3f204491bce13e0e5
   Author: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
   Date:   Fri Nov 4 23:32:38 2022 +0000

       kconf_check: store some files in tmpdir

       Some file systems, like ZFS, are very slow at appending to existing
       files. Due to Copy-On-Write nature, they create a new copy of a file
       each time we do ">>" in a shell script. This becomes very noticeable
       if shell script does lots and lots of appends, like sanitize_fragment()
       function in kconf_check. On my setup, do_kernel_configcheck task takes
       literally hours to complete.

       To fix this issue, we can store sanitized_list and fragment_errors.txt
       files on tmpfs, which is extremely fast at writing. As most distros
       use tmpfs for /tmp, logical step is to use `mktemp` to create
       temporary files.

       After completing writing to temporary locations, we can move those two
       files back to ${LOGDIR}.

       Also, function 'cleanup' was added to remove temporary files in case
       of abnormal exit.

       With this patch, do_kernel_configcheck task completes in ~2 minutes on
       my setup, which is a great improvement.

       Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 07d7daf5fb..12f1cf516e 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "git-native"
 
-SRCREV = "6a4752ebbe7d242c02b3c74a5772926edd243626"
+SRCREV = "2d01f24bc78256c709728eb3f204491bce13e0e5"
 PV = "0.3+git${SRCPV}"
 
 inherit native
-- 
2.19.1


