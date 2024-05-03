Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F380C41513
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:40:54 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.4002.1714704053828368713
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LZyxALKI;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-790f4650f93so479417785a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704053; x=1715308853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtTLQsmVQAUeMyy53LHYQWXi6+M+hNR+oreNQ2nFKos=;
        b=LZyxALKIw3Wuq37DEPmr3FhB/26E9v2zUHufqYkQgxvuw6Ux8e7vGPmns0BnGlSirj
         qtnI+LXioILNiNMfp84nS5ziy8PBxzUAj+27xO5zcUXK1fQF5HOkeY6sziIfZufVBl2Z
         2OHwkphnMnlg6oTDbeoivM7GxunkxWgbTwR3TLdcFbJ/i+4kNGj+UoS6NN3lIt/Z7qvL
         4WKk/6cJU0Y/inFhVqog2Uu3jEsFYL4CZgEuj2ur3I9hPTGIVZiBueHCA2WXDYtX+fo4
         XjdJbp46wJv0pNF4TM3G1p8ZzKjz/FVw03x0eSnOp95e34zu5zEYHlzrAhyiDFjjhfda
         SeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704053; x=1715308853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtTLQsmVQAUeMyy53LHYQWXi6+M+hNR+oreNQ2nFKos=;
        b=APkiP5fnCE0yXkMNVPEiMlb5DfrqvmM0OtO8hfH65IW/fnkV9HVAKtLd8GianqExUj
         L0Q0YFw7IZ7mtqPamqL1YetTx5iLN75G94zJdHoj209YTWNdDOSCGsc5qZLP6joQNetk
         ZUprjXZQVzZWagKobnrMZPuNwPijlzsX4VVYLsS9DDzjASwZAes/CzXS0r23sWmy1FTH
         kSgkh4QCV+bLjMeUAQVzsp3i4FAzFj+DGbbkPFGGVJgPGQljSCC5jfiWFCzhJ4OjAiR/
         TRzGJjK/FWqCOvVh0mR2pUSPdFHPYlW926974MzExeE8bJzQ8hcrQgbtXlEGAVDMmqt4
         oQhg==
X-Gm-Message-State: AOJu0YwEA5MO3P1toHIUbKjGXaEeVcc3o2ncwDi/qFvLqfZXLSK0OE/L
	nQYw4KqEtYoKb9DV/dJcoBCb8QaOFSqCatF5OrLd9LX1LS6DfmQ9
X-Google-Smtp-Source: AGHT+IFHEkXIimDarBdrjIPGX1WnIWaqv9XkOSnp+jZEoJlWsqsnLI1QQlnAvGwOry96cWOMGiBGdA==
X-Received: by 2002:a05:620a:578c:b0:78e:d962:5171 with SMTP id wk12-20020a05620a578c00b0078ed9625171mr1704357qkn.28.1714704052683;
        Thu, 02 May 2024 19:40:52 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id bm34-20020a05620a19a200b0078ec3aa9cc7sm856163qkb.25.2024.05.02.19.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:40:52 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/12] linux-yocto/6.6: cfg: drop obselete options
Date: Thu,  2 May 2024 22:40:36 -0400
Message-Id: <7b4f3b1d8db004d4e098dd6aa38e3ef83eb7f5f6.1714703667.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1714703667.git.bruce.ashfield@gmail.com>
References: <cover.1714703667.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198938

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/2 [
    Author: Paul Gortmaker
    Email: paulg@kernel.org
    Subject: cgl: drop SELINUX_DISABLE option
    Date: Tue, 16 Apr 2024 12:28:43 -0400

    It was removed from mainline in v6.4 in commit f22f9aaf6c3d ("selinux:
    remove the runtime disable functionality").

    Signed-off-by: Paul Gortmaker <paulg@kernel.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/2 [
    Author: Paul Gortmaker
    Email: paulg@kernel.org
    Subject: full_nohz: remove RCU_FAST_NO_HZ gone from upstream
    Date: Tue, 16 Apr 2024 14:56:42 -0400

    In commit e2c73a6860bd ("rcu: Remove the RCU_FAST_NO_HZ Kconfig option")
    the so named option was removed from the v5.17 kernel.

    We should get it out of our active branches to prevent a warning.

    Signed-off-by: Paul Gortmaker <paulg@kernel.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 91dbbf55ca..0972d4edde 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "5272561b019836f2ee2f175b23029649431d6fca"
-SRCREV_meta ?= "3bf5e5e5a7323795af0955da818c6e93215fd119"
+SRCREV_meta ?= "c3d1322fb6ff68cdcf4d7a3c1140d81bfdc1320a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index fba19c97df..3b3e277c38 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
-SRCREV_meta ?= "3bf5e5e5a7323795af0955da818c6e93215fd119"
+SRCREV_meta ?= "c3d1322fb6ff68cdcf4d7a3c1140d81bfdc1320a"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index f887e293b7..a02452feda 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
 SRCREV_machine:qemux86-64 ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
 SRCREV_machine:qemumips64 ?= "d3abfe3c736d5869cb26f24c653b7e6eeafac715"
 SRCREV_machine ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
-SRCREV_meta ?= "3bf5e5e5a7323795af0955da818c6e93215fd119"
+SRCREV_meta ?= "c3d1322fb6ff68cdcf4d7a3c1140d81bfdc1320a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


