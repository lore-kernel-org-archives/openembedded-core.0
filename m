Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DA6C636D6
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 22:21:02 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.27684.1676931658416612072
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 14:21:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=12mfhHZ1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id bh1so2991877plb.11
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fosyJ8kkmQCwIOg52M8I34mXOgaBKNJ0j0Ilbs8El3I=;
        b=12mfhHZ1JfgOxa2laW29XTC1G6NtSs4YF5jofjjaTIXe15Ew0WmmlcgRayfjJVRwY+
         MFsboPS08NuMoTZeKAUVkbBzNN4QY8xfKWIK5Wu0Hy2hlRBJwUblE++aoPtgPg5mcXUQ
         IagdUVA8gsAOFi+lu0tObX570Owp2TTWLT1U1XWqWFcEV51n3cu0Ndu77HaT6MPbksPF
         OWZAsQIvYhQT/3vL1vahcxkl/THyCOfvk8RaBdLbYWU1emUlqU6mJaT04m38XNmNbLCH
         S+YZbdLaLZqTiSZb5lDOmOZlCPdo2zpzWenNN0Jsyrd9EI9pAEZcVw7+sV4+07OaKoqe
         b+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fosyJ8kkmQCwIOg52M8I34mXOgaBKNJ0j0Ilbs8El3I=;
        b=ygBAtej2f2WVOGGyvubn5kJIlTYhwzPr18s9YNJiYVGe8G3VwW6Xvf7kn4tzChlhOC
         QwXQqGoPxCAzCGJv1CR2v0Ech1HWQg7mMDAyzYBbGkhJPcRXYAhzkFxG/Ww8ABxUgPci
         0Ge4wMifueCN3INE6MfWrebZ8Q9mTuMRyJO7VNfirMmljGwnjYMSpQZMxz+nIeIs7/Zg
         ZMUmfdd8u+eJAXIqJcZVyxlrwxcaG98XTKuKjIVnIshVEsOeUy/QC50MbdP7EiinYzS8
         HrW59ybzCwqC0UIDZNChTnP0wbwgOQiKB9VMN6qFJEb3PgEG6KxSY3ujgrCgNA114aQ0
         gnLw==
X-Gm-Message-State: AO0yUKWSbr++OaykUHi84YC57FZKJG4jyspwhqzA9r6pvFSjXMUbq4MM
	v/Bpkl/RFPs7W1ur2YJxMEsEhRJLoK7cAeEc/qk=
X-Google-Smtp-Source: AK7set9JB7Ahz4HjDKlW6VnSSzKL1RaUOt/qxiMC32hzjAE1PACgxMPWaMLVaUsEzyIV+kY4EQWU0w==
X-Received: by 2002:a17:903:183:b0:19b:33c0:40ab with SMTP id z3-20020a170903018300b0019b33c040abmr2829491plg.43.1676931659467;
        Mon, 20 Feb 2023 14:20:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019719f752c5sm8401200plb.59.2023.02.20.14.20.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 14:20:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/16] busybox: rm temporary files if do_compile was interrupted
Date: Mon, 20 Feb 2023 12:20:23 -1000
Message-Id: <a3f31997c633e8476bad68c81fac0dcd0750c7d4.1676931497.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676931497.git.steve@sakoman.com>
References: <cover.1676931497.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 22:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177476

From: Antonin Godard <antoningodard@pm.me>

To avoid working with undeterministic config files, remove all the
temporary files to start from scratch.

Signed-off-by: Antonin Godard <antoningodard@pm.me>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/busybox/busybox.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 616a23258a..f0c5666f47 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -157,6 +157,9 @@ do_compile() {
 	cp include/autoconf.h.orig include/autoconf.h
 
 	if [ "${BUSYBOX_SPLIT_SUID}" = "1" -a x`grep "CONFIG_FEATURE_INDIVIDUAL=y" .config` = x ]; then
+		# Guard againt interrupted do_compile: clean temporary files.
+		rm -f .config.app.suid .config.app.nosuid .config.disable.apps .config.nonapps
+
 		# split the .config into two parts, and make two busybox binaries
 		oe_runmake busybox.cfg.suid
 		oe_runmake busybox.cfg.nosuid
-- 
2.34.1


