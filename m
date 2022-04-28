Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83B6C43217
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 13:48:17 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web12.10759.1651153694269316037
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WpjaTvQx;
 spf=pass (domain: gmail.com, ip: 209.85.219.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id b17so3213776qvf.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gqiKuAOzFiMyxsliUXHT/hh6ryFJQK80neFRBnkXIqA=;
        b=WpjaTvQxCElxUFzdGqVlAKzSt+bQwZzWmLTkbB74JnDvHY5IGb2A1fE7THUl8Mdfrb
         QeQZdkxRBF+Brc3+1YhDpvodCuhxaH+/ZDlXDJQxdcw1VIiAJpgg/skr1czAz2PvjMy8
         TrOPqqdRFR/7lnpV7+rsl2s/5buoN4LCM/AmjbTRwk+NjIwpVnk6qJHVZ2tkyFIEUlkO
         G1adXASFezEAjWi5XeW+QnVVJuXdLG8BlIaXZ+HQDjim9U2aBGbdeTTISnBgSlzLNGrO
         IweQKYCYiBE0wJvt2+57EeSegpLzW3tZISVDbsFkI3L/5fn0TFr3i1JUlcW0g8f+cW+Y
         x9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gqiKuAOzFiMyxsliUXHT/hh6ryFJQK80neFRBnkXIqA=;
        b=tMkDUIS7k3DT0BJ8F+l2W7XIVtgQhoszX0XDXhxusi9qR/x+RHIsFOs+Sl65fNzvhc
         f+9LHhYGodjiTcAQJHP/T8tuRbwOnwhMqwJwIgU0emkuNFbJYIZFN5nZhJnmyj9A6DPG
         gj+OEp0UGf8BsxdnWBdVTFR1pTwDfdbrq3Ny7QGfFLPoHz58+GDdgQvu5c5pCT2VxxAU
         T8jgyBw/Ml+7vAVPIe03Gu5y0ogxlwM/sGEaxA282xhkluMFTlYa3F844lxJI/GnDZXj
         8gToY5e8cA6hpOZ9wtr3T3GUNlt76RG9qsPqE5py03H3JiP0iKD+wsToSnOUmHzCh9yP
         cdvw==
X-Gm-Message-State: AOAM532ivp3X8yUxuedBYs+RAL+TSx1WieuUBuQikxhA98o8hQDd/vWi
	vqkf3OpB2SIAjMdT6RnAvoU=
X-Google-Smtp-Source: 
 ABdhPJz/0Z50+CRnr8gZ6OerhH/DoMuv/QfKyDdPyn9lsahYHBmBaUDbniwIM4/UpEyk+hg3O92epg==
X-Received: by 2002:ad4:5504:0:b0:456:35e0:1968 with SMTP id
 az4-20020ad45504000000b0045635e01968mr15246274qvb.126.1651153693300;
        Thu, 28 Apr 2022 06:48:13 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a059400b002e1d59e68f3sm20809qtb.48.2022.04.28.06.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 06:48:12 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com,
	jdmason@kudzu.us
Subject: [PATCH 07/15] kernel-yocto: allow patch author date to be commit date
Date: Thu, 28 Apr 2022 09:47:53 -0400
Message-Id: 
 <8eebf8f01d1631c7926cb9098d8e64f00a28f339.1651153370.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1651153370.git.bruce.ashfield@gmail.com>
References: <cover.1651153370.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 13:48:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164955

From: Bruce Ashfield <bruce.ashfield@gmail.com>

In situations where a buid needs to be reproducible, it is
sometimes desireable to use a patches author date, versus the
time when it is applied. This generates a consistent hash
between different patch applications.

We leverage the existing KERNEL_DEBUG_TIMESTAMPS to trigger
the use of a new option to kgit-s2q. This allows us to use
the author date in a reproducible configuration, but disable
it if we need the current time/date.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass                       | 6 +++++-
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 4cb638864c..fb30c7cc05 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -320,7 +320,11 @@ do_patch() {
 	meta_dir=$(kgit --meta)
 	(cd ${meta_dir}; ln -sf patch.queue series)
 	if [ -f "${meta_dir}/series" ]; then
-		kgit-s2q --gen -v --patches .kernel-meta/
+		kgit_extra_args=""
+		if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
+		    kgit_extra_args="--commit-sha author"
+		fi
+		kgit-s2q --gen -v $kgit_extra_args --patches .kernel-meta/
 		if [ $? -ne 0 ]; then
 			bberror "Could not apply patches for ${KMACHINE}."
 			bbfatal_log "Patch failures can be resolved in the linux source directory ${S})"
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index a6ab9ca56d..11613ab3b6 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "git-native"
 
-SRCREV = "90598a5fae1172e3f7782a1b02f7b7518efd32c8"
+SRCREV = "f70b1d52f4706a263ae22e2c61039ccd875e97b6"
 PV = "0.3+git${SRCPV}"
 
 inherit native
-- 
2.19.1


