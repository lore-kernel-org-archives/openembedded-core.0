Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E49DC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 23:42:30 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web09.1148.1645832548632884921
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 15:42:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LhQ84+VT;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id o26so5307864pgb.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 15:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6eqgLMMkf8MqzNsXJtTPvctZ9Ymte9BrgDGcv9Ca7Do=;
        b=LhQ84+VTJOGVMF6EvlmcSLueKnM7CbBbwOhsbRc7qwixogPbGw0R+Y4aMUr3QGHlVa
         2Wt4O8pGXIMTsz7t5wNUXkZXMezMfnIXN+NMicgoOOmsd92OpAXG54jXf5Nna5sDeCOp
         N/8X9eiE88+HkfK9KEquOimwgrC5E08/bchQq10pUUsNIY3OaD5z+Ar0CVRmHHDCK5ay
         cS/w2uFxy2UPhXYbUsklqsvb6mYCDVaHThnuIPIxBavtBrgmjgMAuRA5od2b7w9u2GWp
         ujLnK/YQvKShVKTfwSjcsJF0TF0a98eE0Keh/lut8lDRH0Ay1cEbXNN7IdgPrijXyn3E
         8MXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6eqgLMMkf8MqzNsXJtTPvctZ9Ymte9BrgDGcv9Ca7Do=;
        b=5DerdcgfkMjDLBfh8MiwR4YVQnTlc3R+n6pdyKkZWHu3QZzIPp6I/J161xAcaqYviv
         MI+bqdO85fRrwypjiXDnW3I/cvmPUojv4C7AwssJ4JZ+QJaImjLBCDyPD6YPKyuJANAV
         dQezdC+AIo6eCyIxCOIiV5tYLpcDBF72Vz6HQrFNAZzGmf52nPLskBywQpRIJoBEcHGG
         5GNTuvAdZ97i7xbe0j5GDMvHO6UZoG+3L+XAWqGuwVEtQmCkcO3y3ps9ZUUWZG9KdUvm
         sOa12U5lAN9eN6ZMtI8vGMUYDRmgdngjkPudQlKa+U4uJeivwFs5g6AFdp5X5MzWTp1z
         AINQ==
X-Gm-Message-State: AOAM533p+z0RjH/oxruXcOiC6w8BSbh6Y1FZaoF+/0wRrt51Rham9Gcl
	8F7fcH69U5aI2Fr68qdaovbXp5b6ftw=
X-Google-Smtp-Source: 
 ABdhPJxsO634FUQ5lYTNplky0+8tVQN5Q9+temjwMKRQo2PNAFAIRJq+oje8+I+1gbIKawOYLdtWBg==
X-Received: by 2002:a05:6a00:1c46:b0:4e1:82cb:e39c with SMTP id
 s6-20020a056a001c4600b004e182cbe39cmr10192866pfw.18.1645832547498;
        Fri, 25 Feb 2022 15:42:27 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d615:a2e3:253b:5be5])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a056a00228900b004f3ba7d177csm4536070pfe.54.2022.02.25.15.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 15:42:26 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] flit_core: inherit setuptools3-base
Date: Fri, 25 Feb 2022 15:42:23 -0800
Message-Id: <20220225234223.668488-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 23:42:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162413

This is helps bridge the old setuptools3 behavior.

FILES:${PN} has sane defaults in setuptools3-base

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/flit_core.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/flit_core.bbclass b/meta/classes/flit_core.bbclass
index 0f2eec85d0b..8edbd654ff2 100644
--- a/meta/classes/flit_core.bbclass
+++ b/meta/classes/flit_core.bbclass
@@ -1,4 +1,4 @@
-inherit pip_install_wheel python3native python3-dir
+inherit pip_install_wheel python3native python3-dir setuptools3-base
 
 DEPENDS += "python3 python3-flit-core-native python3-pip-native"
 
-- 
2.30.2


