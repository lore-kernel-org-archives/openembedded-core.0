Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2090DC4708D
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 17:00:07 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.101084.1671901201040997081
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Dec 2022 09:00:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BwCY9JTB;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id i7so7036443wrv.8
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Dec 2022 09:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80GLV2kyYfm6kShdhQwxfzPC4+BC6JPtLS06xV7qcBY=;
        b=BwCY9JTBz8iRcxqqe9iB/zaM0mzBs6hyefExlqkocWRGi0Ts1r+DHynZBOzT2fFOUF
         KoJu4xPQE9TfitH0I2dYytPrqh0ajldvs9jclySmD0cbCMx9+gNRWYW6VShisu4zEW1X
         m67YxQ0ApzIfIn3dwfptWPzHGxOAUcnhURYHn9LSxuMKzbmUxevQkm+cZIPJAG5gB+gT
         RcltWbsGJfX3vJJE1BXYYG6cGSRSihb5RXN/KhH57yhat7FaTa5XZgRI2nc9jwUhlIek
         4+gjvTnbB2P2i3s75anOGtzYRYXgVkmUCZ5GN7wp0N82xjkGMeI1TitWfMuTM6Hvyrxr
         KcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80GLV2kyYfm6kShdhQwxfzPC4+BC6JPtLS06xV7qcBY=;
        b=ZsrQGpOYVhyLM26EELH3dqJvTxmyWpY+224DmMRNWJ7yeaLFB4MKhWNPzJ7vOWiUQq
         Kac3TUVOOnsvDxOT21HoIIIStjMudH0AhGML0Nnol1PTLHIPpjz1Mdfl3Bf+MCP1vvNM
         gQjmC4dN4Fa31Qt5gNuOEwdltnEheP1zKiuc7poXlO1vhrSSyG8AuhKbAfG1oyCKt5SI
         oU/RkjIJwAB/DMzCYcKFQCbqHBL50qD+aWWBTp5E3J6URB6WdERBgoMCjWG04b2gVVW+
         IVlqsX+fzyH2sjHi8WnDatWxo8Sji54KVM14yguNo8WJ2YNYrCdewxM1430r8WpVrDqS
         8LZQ==
X-Gm-Message-State: AFqh2kpOmYQxX1q+qhpL8Oz2hjQ4cu1fufMbdos7EOnKn6BPoAnjDaPJ
	cLmmHZiSIyhXibSDv+YE8/X4vQ66DGk=
X-Google-Smtp-Source: AMrXdXt7rcJeb4VS/fXVcycqIdTnWDyCM3eK7SEkJxdh7PYvhRoKkVbkGFDUXpUA1TdxzClrk9ivFQ==
X-Received: by 2002:a5d:6d09:0:b0:277:2e27:61e7 with SMTP id e9-20020a5d6d09000000b002772e2761e7mr2822726wrq.17.1671901199518;
        Sat, 24 Dec 2022 08:59:59 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b2-20020adff242000000b0023662245d3csm6005622wrp.95.2022.12.24.08.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Dec 2022 08:59:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/7] python3-native: further tweak to sysconfig.py to find python includes correctly
Date: Sat, 24 Dec 2022 17:59:40 +0100
Message-Id: <20221224165943.1324800-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221224165943.1324800-1-alex@linutronix.de>
References: <20221224165943.1324800-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Dec 2022 17:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174986

Without this, sysconfig would report the target location, which is not
what we want in cross-builds. This is used in particular by
latest autoconf-archive m4 macros, which have migrated from
(removed in py 3.12) distutils to setuptools.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...py-use-prefix-value-from-build-configu.patch | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 2f519e4917..5ca855e7ed 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,24 +1,23 @@
-From 05d676ddf675d9c8229b723e64717aa485d6809e Mon Sep 17 00:00:00 2001
+From 45548f40668d429adcb7532d35db1ac16fe74562 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 10 Sep 2021 12:28:31 +0200
-Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
- file
+Subject: [PATCH] Lib/sysconfig.py: use values from build configuration file
 
-This allows correctly substituting them for target installs using
+This allows correctly substituting them for target builds using
 native python.
 
 Upstream-Status: Inappropriate [oe-core cross builds]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 
 ---
- Lib/sysconfig.py | 5 +++++
- 1 file changed, 5 insertions(+)
+ Lib/sysconfig.py | 7 +++++++
+ 1 file changed, 7 insertions(+)
 
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index 93c6f73..ff399e2 100644
+index 93c6f73..a87870f 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
-@@ -668,6 +668,11 @@ def get_config_vars(*args):
+@@ -668,6 +668,13 @@ def get_config_vars(*args):
              _CONFIG_VARS['VPATH'] = sys._vpath
          if os.name == 'posix':
              _init_posix(_CONFIG_VARS)
@@ -27,6 +26,8 @@ index 93c6f73..ff399e2 100644
 +        _CONFIG_VARS['installed_platbase'] = _CONFIG_VARS['prefix']
 +        _CONFIG_VARS['platbase'] = _CONFIG_VARS['prefix']
 +        _CONFIG_VARS['platlibdir'] = _CONFIG_VARS['PLATLIBDIR']
++        _INSTALL_SCHEMES['posix_prefix']['include'] = _CONFIG_VARS['INCLUDEPY']
++        _INSTALL_SCHEMES['posix_prefix']['platinclude'] = _CONFIG_VARS['INCLUDEPY']
          if _HAS_USER_BASE:
              # Setting 'userbase' is done below the call to the
              # init function to enable using 'get_config_var' in
-- 
2.30.2


