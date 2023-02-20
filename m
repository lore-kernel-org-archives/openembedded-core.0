Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A53C64ED9
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 22:20:52 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.28072.1676931649220526811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 14:20:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6JMeV1fE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id e5so4042373plg.8
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pT//dQa2ArAGUor0G27lRQEIfegOHmQIzdvE8+tO+24=;
        b=6JMeV1fEi1gB2LWpzHQLSlXwA8m4qeYJsCvB+G6mdNe7bgn3IqKKzwUpMVc6vWTQ4/
         zHV8O9JtUinuLwasJtkR9WZ6MNI1TT9k1Immpi7UC9kVhnMSsHVXXu28rC3kjTgRvEOm
         PX1i/aNQS0mEwQIQVb+OPpPH5ozGPoEFUhcZ824gGD0MrqU4hctDMFed8vuFeNmY2b5f
         FGEVutulntPEdS0DHmCbvwa4nG+KgnGays1QCawk2D5zy3c00h2EmCJIK2d19D232+TL
         HDbLT+a0oJUEgdTU5nlOruAun06vtoF4gMNNpGpqN2CtCPdFVnsIiBZTjsh+Y1SzjInj
         1rCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pT//dQa2ArAGUor0G27lRQEIfegOHmQIzdvE8+tO+24=;
        b=LknTyFsWRRMq+Jkni7fPMhPmVDEGNiRYRwWtIF8qPE01+KSADPNyAuB4QuT9mV0bkn
         hq2o2/fkzIK+Tlbow2jd/eyq6oAFCvbIq7u0oh/AVwP3Bjmy7E2gVLrfks9YveOM8YEF
         RQtVA3SRfVD/dztWXQLfpQ9DVmwM+xFtQg9+x4LzWvRo+Fi3Ngk//3glXQO/qj2H+jBb
         LPA/dwsIMFJLJOkNNh7lhh+0oeNIXzHKZrlH9Mm2F2GI2SLnP1A5PTJPAeorUSOkgohe
         CPWcmJORCBgVw6+JfdL9YnBJx7q5L3pLd81VusC9mjKTSxx58MyH99IyTtvGkP6ueR1M
         jlrA==
X-Gm-Message-State: AO0yUKVYfRjmRxktcJqbGaylyWpLvYGPqiKHZUyrWfmc8ijuo6bFo0UL
	4027+OW2wN7MHFcdvOxZNjI+dbQevBnLRmVMONE=
X-Google-Smtp-Source: AK7set8EsHVuXUZ8T42BV+QeMoCwLDcMZI3OOHoCWqc8urafOMIM5NZ2ifhS6DWx1ui7e9fGNGz5ig==
X-Received: by 2002:a17:903:284:b0:19a:9797:1631 with SMTP id j4-20020a170903028400b0019a97971631mr3350320plr.3.1676931648109;
        Mon, 20 Feb 2023 14:20:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019719f752c5sm8401200plb.59.2023.02.20.14.20.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 14:20:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/16] make-mod-scripts: Ensure kernel build output is deterministic
Date: Mon, 20 Feb 2023 12:20:17 -1000
Message-Id: <85cb9212a85e32715209705a29c6928b368d87c7.1676931497.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676931497.git.steve@sakoman.com>
References: <cover.1676931497.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 22:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177470

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The definitions in linux-kernel-base are needed to ensure the generated headers
are consistent. This was a small step that was missing from the previous
changes to linux-kernel-base as both kernel-devsrc and make-mod-scripts
need this information defined consistently.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0d79d4883f924cef0d0ba361506ad75d441b9721)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index f9df345ca5..32b89bb5ea 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.yoctoproject.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
-inherit kernel-arch
+inherit kernel-arch linux-kernel-base
 inherit pkgconfig
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.34.1


