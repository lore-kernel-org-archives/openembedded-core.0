Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A3D8C43217
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 00:38:50 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.1227.1668559120344411607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 16:38:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KnaqkZfF;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id h24so9841369qta.9
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 16:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pgvZGmNGSHcd0xzYZEvuZAAkRbFATDi1039OdHO7pk=;
        b=KnaqkZfFHA17pO+dpQKhwpIdBGwtzEuZjfBdIDtTwRvZkp3YfyUA5TCrhOuRlDEKSj
         ohXTPdtfztmYDGORHpyxEEzqnlMZF41gSOAxK/fnCJLib8zAmaonXpA1PL4taJsOu9b8
         wzLZM4MhoO4d9Kio+ranr/MdVnGKr2WX5sg1f+uTaKUGZwFj+1kbpBEMXc96p7el9bpD
         i5c3IkYGZgRRIs/vL3TvcGytPUaA/na1DL4m2hub9WNdKtGiFu9DC/WDFOpSHJAP9GFM
         FawzmKVanOqpkF6YI3AG3MerlXT0B6iXzx9+OIZkVrt67Z0oMc+xl5WM1GiwaxsnWHC2
         RONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pgvZGmNGSHcd0xzYZEvuZAAkRbFATDi1039OdHO7pk=;
        b=FQPkI6v1cUPPgxvriasJN8/ehczxhWgzAeaIsDIYoPx6fQSAiDid15heIGi/U/XLNA
         VOEZe5sw7kLOU64T9/jviY/iHea/vwbFLksjQSRXDi5cmVN8pXQp65hT9/YFiX5xnKgV
         OZASl+o/conStE/1NcQyzNTRLrpKyMOKXkHihT0KgclczGwGXmlfCxA2sIm6xKoayWZD
         Hib5rIArlqegkfkv0yh/LtUcGAUpPXJuE4jHPfxeP8H0yaH4C/+HC0G8x9hKto4yWXAq
         S/CGM4ACkTz0GlCjF72p7Ti1+FqO/MSwb26PgSIdNyEHHVrjhtwgkAuCe+muUb97JLnL
         TidQ==
X-Gm-Message-State: ANoB5pldVLWG1mcuCdJ1SO1ynTF1u0IsyB9tQ58zcmk+qWlPolh3vqUJ
	B/umkN4sHkzoquEv8gjrHnCBCB17UP/k/g==
X-Google-Smtp-Source: AA0mqf7JrqiMyFc2eEISxs50EGpR9BJMNDMCI9N/7PH/3T+UJ0I9Yu3k/HjacWzIbz0SU4LyITSINQ==
X-Received: by 2002:ac8:72c4:0:b0:3a4:e32b:2f7e with SMTP id o4-20020ac872c4000000b003a4e32b2f7emr19078276qtp.320.1668559119381;
        Tue, 15 Nov 2022 16:38:39 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id z17-20020ac86b91000000b0038d9555b580sm7926243qts.44.2022.11.15.16.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 16:38:38 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] kern-tools: integrate ZFS speedup patch
Date: Tue, 15 Nov 2022 19:38:25 -0500
Message-Id: <cbbab79f03da7078715faeb89595555cff454912.1668558954.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668558954.git.bruce.ashfield@gmail.com>
References: <cover.1668558954.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 00:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173370

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


