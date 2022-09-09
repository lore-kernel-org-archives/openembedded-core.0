Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F173ECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 16:52:17 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.212.1662742327592833130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 09:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HIxcarNR;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id z187so2174451pfb.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 09:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=hjNkXARpZNI6OQHyyEMTVRYZL3nRg3i2Fl07F9EBNA4=;
        b=HIxcarNRYgg28VdMxHxiiAYlObHBY/IHt3ZSnuEqc8pjytpuJUokogdjS+jvyLF8gL
         LeJGjRSo2MOTxyyXiA1bJmFrmgErDon37x2FCsn3j59VknsVKObebpfQKp6ARiVjGEAe
         D4+JuEfJ/ModpW4znDMGoPQMK+k8eIJMK9J0rPB0rqu1rr7/t05V08XPybUECYnSCo92
         jadx9g/dDtR86J7JLg9q2z0+AJF76GsVJc03Chz0NfDLC0h+ehPhp+3PRoFQQnEM6Po6
         AtvInSYUv4pEZ4LOnPDdzcZOQuQEVEVW2cqb3JOY0bt2hnfexf1zL3R62ixObhNuddlV
         jP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=hjNkXARpZNI6OQHyyEMTVRYZL3nRg3i2Fl07F9EBNA4=;
        b=DOoHPnTql05tfq81IvwUMnxfalYxaismUNtLsuMDfxJOw/hsfoqWhwt+Zpg0BKEZ+h
         KZE2Oni031obl+TuIwXLk9AjK6EPnraRmsRjzPpFe7aDiWCO/NI/FzRSJPeXPDJt352G
         BxOoa6jh8Ulq/EuOF9C3WcbODJJjjYS3tAUWoe80YoI9ydP21dfFPHKrIIW474xBFJoI
         qHZc2zUNYPB94thDZ/hRnUdkTiCMe8/610N4/zhOkJywl2IqOSDYlMnz0yN+0lbHd6Mf
         bdPCRoKuba28pz1ytl3LWIVv3z7DwVDduE+30J33lwTBAQXeC7kSB+nAJOr4Qd2Ne91A
         myqA==
X-Gm-Message-State: ACgBeo3aFLcbtqh0AJJ0QZfpAlk6zQ2IjHox/ojdX03EuhaLbgtDMMAO
	0ON2L0wZgCexMCtwgs7+NsuyweJKBaIMRg==
X-Google-Smtp-Source: 
 AA6agR6ColZtRY2TLkdSO6fHk/QDuJ1ew7dNskPb3TbXPiBd1rvYwXPTAym9HXvhbUYpV+ooyBELLw==
X-Received: by 2002:a63:1a26:0:b0:42c:ffa:2f0b with SMTP id
 a38-20020a631a26000000b0042c0ffa2f0bmr13252555pga.138.1662742326791;
        Fri, 09 Sep 2022 09:52:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 g15-20020a63200f000000b0043087a64bd5sm740610pgg.10.2022.09.09.09.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 09:52:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] bitbake.conf: Define TC_CXX_RUNTIME
Date: Fri,  9 Sep 2022 09:52:04 -0700
Message-Id: <20220909165204.12656-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 16:52:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170499

This variable is used to denote the C/C++ compiler runtime to use.
Right now there are few alternatives out of the core which could
use this variable to define this property, the values it can take
are 'gnu' for gcc runtime. 'llvm' for using compiler-rt+libc++ and
'android' to use android runtime. Default settings is to use gnu
which is current silent default also.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Document the variable
v3: Rename to TC_CXX_RUNTIME

 documentation/ref-manual/variables.rst | 6 ++++++
 meta/conf/bitbake.conf                 | 1 +
 2 files changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index cf817e9540..2d28c3d2f7 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7973,6 +7973,12 @@ system and gives an overview of their function and contents.
       toolchain. You can use ``meta-sourcery`` as a template for adding
       support for other external toolchains.
 
+   :term:`TC_CXX_RUNTIME`
+      Specifies the C/C++ STL and runtime variant to use during
+      the build process. Default value is 'gnu'
+
+      You can select "gnu", "llvm", or "android".
+
    :term:`TEMPLATECONF`
       Specifies the directory used by the build system to find templates
       from which to build the ``bblayers.conf`` and ``local.conf`` files.
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 52a36d788b..62cdd9aa9c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -389,6 +389,7 @@ FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar
 
 TCMODE ??= "default"
 TCLIBC ??= "glibc"
+TC_CXX_RUNTIME ??= "gnu"
 TMPDIR ?= "${TOPDIR}/tmp"
 
 CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' + str(d.getVar('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
-- 
2.37.3


