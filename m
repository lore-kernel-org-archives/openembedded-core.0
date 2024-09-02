Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B03CD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 20:32:24 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.8324.1725309138302061373
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 13:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BGdUDMJn;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-374c326c638so1448338f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 13:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725309136; x=1725913936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVqkt86fI3P0AgBKNKZ/pj0uMYLzG2ymF5DwS88kMJ4=;
        b=BGdUDMJns/FoJqaXHvpV4U0E+ztI7sxB2xF1+gcU9f0qAd2FQnRRXDa+hE82fhWYyg
         8j1HClEs1o7ggGiRAxTrCU0f5YIFgCucbbryHPGZz6giYR0YQKnbfYIuKoNdpYA56H1s
         inxl2bqgMAdXBJJ+PnXpMIlM45yfmQAlJ8br03EcLTieW0p3QnvSImG9TXodyLEPhAjv
         ulxdZAd83q3dQ7h/5NCut+wXkhs/NSYUcWXkGHSKV4mvW7X14kKhjr2FBhzgOJqb7zDt
         HHo6ktj+QAnPdXb93Ol3L+7lZvJJknXnCGbL9VOWpS3DxthRja5nnQmNQKqmOCbD2mhK
         4IjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725309136; x=1725913936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVqkt86fI3P0AgBKNKZ/pj0uMYLzG2ymF5DwS88kMJ4=;
        b=fImXAjjarOkbvKud0x7fW9dyH5yOy6kZuo6yIg3UwZsY/zXCsvUmV1OAino8NlcbId
         Q/6gBwZtrdvc5JLCZ4IM4wx4X2OZskzLXaG2Mgn7NnOV915aqpAJBqSe24m+3lNbpPQk
         0MmS1z2ExO3Eo2+749gxCyRj2DoXpRzVikS7KztN/ce+gNBkglEgcrnHkMs61CG/f9lh
         VUOhFTFZjzdsl/mTzJtEDJ8ZQPXOk/IEp60qKHSA6AsYpBiMV5iwfKqEUvigQxp71EdW
         UJrK4Ho2H3ng2ApJtwHmWHRKdcqR1+CsbGqm5kc1fCTNCocdQrHh1GW+t/PxDgrc7Nok
         wtwQ==
X-Gm-Message-State: AOJu0YxzkF5InCuGV4vR3391uOxB93MiTF32ZS+NAXEaO/3MmlMRwDuR
	YgNFdbRGA5rF0epjrD0HcViLJBWNVJnjJHylscGC16XIgCRP5hS/+6kPjA==
X-Google-Smtp-Source: AGHT+IFr0r4jJ5khBHwvVljLdd82cgYbx6Ruqar6BBFdBHVh7qB21jjBZV9eIzTlRKSuk9nZiUNibQ==
X-Received: by 2002:a5d:4146:0:b0:374:ba23:4b3f with SMTP id ffacd0b85a97d-374bef3a5a0mr5923211f8f.9.1725309135684;
        Mon, 02 Sep 2024 13:32:15 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbc8de253sm96537205e9.0.2024.09.02.13.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 13:32:15 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/3] devtool: modify kernel adds append twice
Date: Mon,  2 Sep 2024 22:31:53 +0200
Message-ID: <20240902203154.265515-2-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902203154.265515-1-adrian.freihofer@gmail.com>
References: <20240902203154.265515-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 20:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204112

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Drop the redundant generation of the do_configure:append section for the
kernel. The same append is generated twice:

if bb.data.inherits_class('kernel', rd):
    f.write('\ndo_configure:append() {\n'
    '    cp ${B}/.config ${S}/.config.baseline\n'
    '    ln -sfT ${B}/.config ${S}/.config.new\n'
    '}\n')

KCONFIG_CONFIG_ENABLE_MENUCONFIG ??= "true"
KCONFIG_CONFIG_ROOTDIR ??= "${B}"
if rd.getVarFlag('do_menuconfig', 'task'):
    f.write('\ndo_configure:append() {\n'
    '    if [ ${@oe.types.boolean(d.getVar("KCONFIG_CONFIG_ENABLE_MENUCONFIG"))} = True ]; then\n'
    '        cp ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config.baseline\n'
    '        ln -sfT ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config.new\n'
    '    fi\n'
    '}\n')

In contradiction to the first code block the second code block considers
the variables which is correct.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/standard.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 1d0fe137887..312eb8ab506 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -955,10 +955,6 @@ def modify(args, config, basepath, workspace):
                 f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout '
                         'do_fetch do_unpack do_kernel_configcheck"\n')
                 f.write('\ndo_patch[noexec] = "1"\n')
-                f.write('\ndo_configure:append() {\n'
-                        '    cp ${B}/.config ${S}/.config.baseline\n'
-                        '    ln -sfT ${B}/.config ${S}/.config.new\n'
-                        '}\n')
                 f.write('\ndo_kernel_configme:prepend() {\n'
                         '    if [ -e ${S}/.config ]; then\n'
                         '        mv ${S}/.config ${S}/.config.old\n'
-- 
2.46.0


