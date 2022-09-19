Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0A7ECAAD3
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 14:28:58 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.20507.1663597729195606230
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ire9INnl;
 spf=pass (domain: gmail.com, ip: 209.85.219.50,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id d1so21981676qvs.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=whO/q+yjfIyKybpImZuktgtnbDANmRS1q/8Frw3M4ao=;
        b=Ire9INnlSQZSb8Y6lRFgLbM7g64dUVeowxSrDA6Q9mnBTapG7wnZIg+fYS/NvBtQMu
         6ny0TyJBLTo7S3mm1hZWohoTkBEv/47MZCOrKA8wCpG0lYkWaxxK2x0vIfsaPpklOigJ
         OCorwtE+ZzVR+zTj1erEDlTKZizGPulMeFTSYc5z444XFgy+Gy6fNUAtXR2dADM3Vaf8
         FN+hVAaHPuKiGobuLk6epo31UDdqFP6eRenEO6AIdANQjSgJQnhZb8Dso09nzCpUIXE6
         lHBY8/bMcu9Z/OQjVpbRPT6lQ0ykJ3Z9er8sopQsJl+YxUMbxqceVnfNRvYUhQCKhgcB
         yNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=whO/q+yjfIyKybpImZuktgtnbDANmRS1q/8Frw3M4ao=;
        b=qJGnr3iEzIoRRigmUldQVQjxWkQGmRKyQelzkMANSwvzACj17ovCKUsIa2wKluutnL
         j5yqthnJ8ENkPnDM2qnjLchJoa7q0re8+JgRLKPcnLM+/mfgg4HaqTdK2wN9iEjtxmDt
         e+BWrlKiLBZDeXU6rZ1a96B7No9UOVtMNsFkrOj614Sluu80Sq53iLSTB9MtoIqmBDgp
         BYJLdM5wOu6gMXpqRXx+/0v3X7cGPYhJmdxfWoUL2mNqf9Aks40w8fwEO+ZU/UT8QGAg
         /d/6lwPWboeedQ72almXlQauWlf8s1Y0ayv8qlFp7Xen25xlFfr06KrOgqlGgMY8yBxS
         HUUA==
X-Gm-Message-State: ACrzQf12QTbaRhNZfe1+oiMdRMORwcr/3E+LkLFGb2UzPrAOmysdF7QI
	ADxqQ7E4SqrZ1LYwq8WamFM=
X-Google-Smtp-Source: 
 AMsMyM6iza9uTzD4gD5lyCMGqO4+zKwOniOdWhjhPZPrbf2JR2KuUxGgcnN4SEQJ+iSiWgupB1TBgA==
X-Received: by 2002:a05:6214:2385:b0:474:78de:f8dd with SMTP id
 fw5-20020a056214238500b0047478def8ddmr14715356qvb.66.1663597728152;
        Mon, 19 Sep 2022 07:28:48 -0700 (PDT)
Received: from build.lan
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a288c00b006cbc40f4b36sm13362226qkp.39.2022.09.19.07.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:28:47 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] kern-tools: allow 'y' or 'm' to avoid config audit
 warnings
Date: Mon, 19 Sep 2022 10:28:32 -0400
Message-Id: 
 <91ce75505f4cb7d25c6093aa713dd2e9be1e70fd.1663597409.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1663597409.git.bruce.ashfield@gmail.com>
References: <cover.1663597409.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 14:28:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170870

From: Bruce Ashfield <bruce.ashfield@gmail.com>

   commit b627b8bd17501400649d38bf61c8a3d2121a1b8f (HEAD -> master,
   origin/master, origin/HEAD)
   Author: Bruce Ashfield <bruce.ashfield@gmail.com>
   Date:   Sun Sep 18 16:36:43 2022 -0400

       symbol_why: allow options to be flagged as built-in or module

       Some options that are hardware related, can either be built in or
       modules, and meet the criteria of being acceptable for a BSP.

       To allow these options to not throw warnings, we create a new
       configuration fragment to go along with the 'hardware.cfg' and
       'nonhardware.cfg' special fragments.

       This new fragment is called 'y_or_m_enabled.cfg' and is effective
       for the fragments in its directory. The format is the same as
       hardware/nonhardware.cfg, is simply a list of CONFIG_ options.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index e065c3e74f..dea7b65a7c 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "git-native"
 
-SRCREV = "9320c2a1aaa085e94abd15ede0d93ffdab578e9d"
+SRCREV = "ba600ef61a85966596126a6e8d936971905e8749"
 PV = "0.3+git${SRCPV}"
 
 inherit native
-- 
2.19.1


