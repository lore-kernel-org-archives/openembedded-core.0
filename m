Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44080C4332F
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:43 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.92055.1669557373607379098
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:56:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=VkS76nkp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id p24so4119725plw.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jRXwjPKKtCAx0Zblg3Il7lf5iRdvnf64j3D042Qgyo=;
        b=VkS76nkpXnVUs+LvnDyvag+DNTrAFre+FcJKf/1P+ainTe3SXwFOTlHIJEDvWU1z5t
         0TT171j+XLZ7+Cu7/UbsdkAV4vRGlK6spOPxV/0bWIcxnpy0dYKWk++rwqITOE6xWkN4
         2LlGDqCi61K7XO6bN7b1iBBAVhifns9coSNycuUGAb94mpcHWHCgMoGcCV2ZCrIRnspH
         Gu5suKBIGTZLkFtHQjeZnKZMkubUbGhX8cGHyhs0H/PE4FUBqJaDEGkIw1I1ENqQFiDN
         qYwDyas7D4/vtKcKs2Oy2bQRYyRJ0p1Mxar/crah5608e5l3/f1xqoLTtHNUXdCG1FtA
         Pt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jRXwjPKKtCAx0Zblg3Il7lf5iRdvnf64j3D042Qgyo=;
        b=x0jM7O3mcByiqyvdw7gsZuGyE9poG79R6FGM+QAqi23IJQ8XmpO3bAjBvpuCTn9R2W
         R1nMAdEbQaO+xkrrbCT0N3j9y6HgB9Jfn70E5JxNW0IxMr7OUNtOliOD9/qPfqJb3GTp
         lHlw0KDin2cG+hb3Wbv+wmhwycMMa6GxqWLmvWC72jdC0fMnnfES4dFauyc1oqLxELXd
         divyjb+BPnSsfRXJKr+lZZlQKe5xpp9WO1oFcdtH8PvLxOZTEpxoxW7FjRP/6nY8I4r6
         ozxerMGgg9rIqDgzxHpZQIK2mfr/s45K+XtIBvfejsxiQBaJzc8bmpRCm4J53lvcXC3G
         SDDw==
X-Gm-Message-State: ANoB5plDmlaDaG0h6/fteeYDMsyOtcbLviNizJC6eyjQ7YwaNY41zPnP
	PCBWOLHzPiCl3XhH5Eynctd9bEUBI/JPwKSg8HY=
X-Google-Smtp-Source: AA0mqf6IeeDfp+dzpqOYA2xZN55jDw6NfcYxD6g39vanG41ktHGU8LYkVnpdEYwsI6vrzIuD2WZ7EQ==
X-Received: by 2002:a17:90a:9706:b0:218:7ccd:d487 with SMTP id x6-20020a17090a970600b002187ccdd487mr46463688pjo.18.1669557393618;
        Sun, 27 Nov 2022 05:56:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.56.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:56:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 31/31] create-spdx: default share_src for shared sources
Date: Sun, 27 Nov 2022 03:55:17 -1000
Message-Id: <5b2ee67e3a5587b4c7d97d2a9bc00022d1eedae3.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173876

From: Konrad Weihmann <kweihmann@witekio.com>

if a source is using work-shared but isn't a kernel,
like for instance llvm-source from meta-clang, share_src was
previously undefined leading to a crash of the python code.
Default to WORKDIR and just override it in case the source being
a kernel recipe.
Additionally changes the variable names in the following, as
they imply that it's only about the kernel, which is not the case
in every case

(From OE-Core rev: 34fa68a0b07328c4ed4eef81f8cde80137a91f18)

Signed-off-by: Konrad Weihmann <kweihmann@witekio.com>
On-behalf-of: Avnet Embedded <AvnetEmbedded@avnet.eu>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/create-spdx.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index e405bd0cfa..212dfe0aa3 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -787,6 +787,7 @@ def spdx_get_src(d):
             bb.build.exec_func('do_unpack', d)
         # Copy source of kernel to spdx_workdir
         if is_work_shared_spdx(d):
+            share_src = d.getVar('WORKDIR')
             d.setVar('WORKDIR', spdx_workdir)
             d.setVar('STAGING_DIR_NATIVE', spdx_sysroot_native)
             src_dir = spdx_workdir + "/" + d.getVar('PN')+ "-" + d.getVar('PV') + "-" + d.getVar('PR')
@@ -794,8 +795,8 @@ def spdx_get_src(d):
             if bb.data.inherits_class('kernel',d):
                 share_src = d.getVar('STAGING_KERNEL_DIR')
             cmd_copy_share = "cp -rf " + share_src + "/* " + src_dir + "/"
-            cmd_copy_kernel_result = os.popen(cmd_copy_share).read()
-            bb.note("cmd_copy_kernel_result = " + cmd_copy_kernel_result)
+            cmd_copy_shared_res = os.popen(cmd_copy_share).read()
+            bb.note("cmd_copy_shared_result = " + cmd_copy_shared_res)
 
             git_path = src_dir + "/.git"
             if os.path.exists(git_path):
-- 
2.25.1


