Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384FACD37B4
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 20:48:43 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.34388.1725396519670371469
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 13:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gq9lELV0;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42c7b5b2d01so37918545e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 13:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725396518; x=1726001318; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sd806cEmdUiDYeeE8VZDS5ZW8yeCbJVG2iQzOHHE0ks=;
        b=Gq9lELV02GQmljzzNN2XenTsO81zF9fLPUKCXM5VkoPc4I3QiDq2G4ZnOeDlJhmAy/
         jGQbeV08HjQ/mSPpAYvf//I/h3Wpm5xaN9+w3uBbPruEy8lXUpwKLtoNPCCcSTD4UB1J
         HvQWePaWcBwoEpI5QwjQjzZaRWO6y3I+cWPQYPLJHRyJWuQlfGwFNoqk/yTVFLGFjpc7
         pxH1Z/P6rY0xTISSGdMcLzjbW0WLYiZ0OWoWxIStin7WcY4ScxgFLWKvyKzlTJCbYGwU
         fS+uccikFCf3CotNx4UTkw1CfYT9d0XJBImMg+XGFezm73j5/Xa7JMWS2wxW6WRDY664
         7ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725396518; x=1726001318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sd806cEmdUiDYeeE8VZDS5ZW8yeCbJVG2iQzOHHE0ks=;
        b=A++ck0PiT8TovlZwIpVc4ZWtUQyPfYqxa3nUdLT2YmXQGRoErEdHQ4Tl8CJ0NYgZ9J
         wcim3QFMUkwLMsV6VKhRBfoDJ6qHI1KSmfFiv8Ns7ZejgbqF4dcf9dtWNEsNSE/Vzmy6
         MEvEUQFALpFqNjYrjWAk4hIopWiAvh16G50LWx8tBmW0txkvV4N7VSoqPkc7xG80RHwA
         T6HpwCKcFd7sHtnEC6xbbfMyfGKLuU4vx7zBBajwjetEmVyO+rpa1P2c0yDYJijbFrHZ
         RR0ov6u45FVGAMJwJlOzfXLAlveqmpdcpV+83nxa0YoM++RtuvP/VjR8iS8TS22gZ1iW
         6/Cw==
X-Gm-Message-State: AOJu0YwbQOYNouqMBSj8z4VCtUYDRoMViMc9WKggdDpnJFydOwUBzzVP
	05+Tf5mGbaWj9IaTXES82Ct1603lBE1BUKXDgLBLaex2S+71xLi9XaEW2w==
X-Google-Smtp-Source: AGHT+IHC2EQINBmSAtNHvD9u0Bbks9/ejkUIZ2SqnnaHgvmAR4k45UrQMNbl67iLAc/6H8dof8wDkg==
X-Received: by 2002:adf:e791:0:b0:374:bec7:8f with SMTP id ffacd0b85a97d-374bec700f2mr9594399f8f.28.1725396517320;
        Tue, 03 Sep 2024 13:48:37 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c8a08dafsm7614811f8f.75.2024.09.03.13.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 13:48:37 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 3/3] devtool: remove obsolete SRCTREECOVEREDTASKS handling
Date: Tue,  3 Sep 2024 22:48:31 +0200
Message-ID: <20240903204831.3791997-3-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240903204831.3791997-1-adrian.freihofer@gmail.com>
References: <20240903204831.3791997-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 20:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204178

From: Adrian Freihofer <adrian.freihofer@siemens.com>

devtool modify generates a bbappend for kernel recipes which contains:
  SRCTREECOVEREDTASKS="\
    do_fetch \
    do_kernel_checkout \
    do_kernel_configcheck \
    do_unpack \
    do_validate_branches \
  "
  do_patch[noexec] = "1"

If the linux-yocto kernel is used, this is redundant. The
linux-yocto.bbclass already does the same:

linux-yocto sets SRCTREECOVEREDTASKS to
  SRCTREECOVEREDTASKS="\
    do_fetch \
    do_kernel_checkout \
    do_kernel_configcheck \
    do_patch \
    do_unpack \
    do_validate_branches \
  "

Also the do_patch[noexec] is redundant because the purpose of
SRCTREECOVEREDTASKS is to delete these tasks if the externalsrc.bbclass
is used.

The default value of SRCTREECOVEREDTASKS initialized in
externalsrc.bbclass is:
  SRCTREECOVEREDTASKS ?= "do_patch do_unpack do_fetch"
This is fine for kernels which do not inherit the linux-yocto.bbclass.

The code in devtool modify is redundant and therefore removed.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/standard.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 312eb8ab506..b2e1a6ca3a5 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -952,9 +952,6 @@ def modify(args, config, basepath, workspace):
                 f.write('EXTERNALSRC_BUILD:pn-%s = "%s"\n' % (pn, srctree))
 
             if bb.data.inherits_class('kernel', rd):
-                f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout '
-                        'do_fetch do_unpack do_kernel_configcheck"\n')
-                f.write('\ndo_patch[noexec] = "1"\n')
                 f.write('\ndo_kernel_configme:prepend() {\n'
                         '    if [ -e ${S}/.config ]; then\n'
                         '        mv ${S}/.config ${S}/.config.old\n'
-- 
2.46.0


