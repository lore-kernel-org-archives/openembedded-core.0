Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39708CD37AE
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 20:48:43 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.34387.1725396519371398264
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 13:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IASK4QsO;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42bac9469e8so192205e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 13:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725396517; x=1726001317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVqkt86fI3P0AgBKNKZ/pj0uMYLzG2ymF5DwS88kMJ4=;
        b=IASK4QsO0yOav0mBTvJaj8VfPkXKFyCqnaGU0CSEIXGP0dVTQ78h/lPYn8SdBgO5XX
         eWQ8PuEbSrWTGdRQT5w1gdYfRFkHxfhCMvkRu+92zjRnpJMXOG5k1hk6eDQHOQr4dyTd
         0weHo4Gyw7dIsEvv/UvofLof/HbhKKyzdotUMWJDSFZvOWIhnVpB8NE7PzEcVoZlCrt8
         MWmF4TyIt0ipjmkWUIw5yXObDJ7ws3ROs5JHHNoz403Sq3HLRZk9UHIRgyIiJxExHaOY
         n/e3pSkciROWavRE4Sy+ETwdZDYQ/HZNeGzYEY3uxUQEtwonZJ68yOdXB4vU+pKwG1ce
         WYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725396517; x=1726001317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVqkt86fI3P0AgBKNKZ/pj0uMYLzG2ymF5DwS88kMJ4=;
        b=LNyD1U//ON7SE91X4aQMrzHAUOvQ7PtHIAzuAB0j7YO5oPCSoSXyO75DEeFWqDFbSY
         eQCTgMcJoA6jQWZVACkgK5eujebA0maA8W8W0KQg2oj3kvasNLT/PkSoOCOpI3vwi2Wk
         FksBYNRLJqIR3B6/QwB6H9cpOpdmpGRSHrH680NOunS/Qg0eHn96TpCs44ZPCfXadzjZ
         Cl0tjBVguistSNvwB4odhTQHdeQNcZh4VUofwcJAStttTBX5QMISJrkN50WA9RQcRDOn
         A0bZfdG8SwjUV3mW9yLqovBycUKhxU09ZKuS+SJNcwnp1Dexuce9ArRZuyK+C0mIz1px
         L0Kg==
X-Gm-Message-State: AOJu0YxddaX6jlSAUNuZTkaq7CNFeOxmWWSlX0CXubP6B0pYCk2eUUkm
	se12QWwHhJA6JKj/tQlI5W4lukh26fqkWWSwVmZLRDi7eoQ3UXSUHXnIwg==
X-Google-Smtp-Source: AGHT+IG8tlK49maj3HJt5dCl/6iMTbtt8iZrdSpbZJndt+Sd+j8Y/hkoH7j2P/a0ld1SZdV9NFXV3g==
X-Received: by 2002:a5d:4601:0:b0:374:baeb:2ec with SMTP id ffacd0b85a97d-3776f452f5bmr136089f8f.19.1725396516711;
        Tue, 03 Sep 2024 13:48:36 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c8a08dafsm7614811f8f.75.2024.09.03.13.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 13:48:36 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 2/3] devtool: modify kernel adds append twice
Date: Tue,  3 Sep 2024 22:48:30 +0200
Message-ID: <20240903204831.3791997-2-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240903204831.3791997-1-adrian.freihofer@gmail.com>
References: <20240903204831.3791997-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 20:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204177

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


