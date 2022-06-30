Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F78C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 19:17:12 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web12.29694.1656616630821772041
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 12:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dEXOMd3z;
 spf=pass (domain: gmail.com, ip: 209.85.219.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id z1so632652qvp.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 12:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BJvMsVOztBdjuNo6RLsufemb4ETjfC/adZoUKHGjFDg=;
        b=dEXOMd3z2egb0En6mpwUuAvITC8gJcDCQ8/CA4lCmnmX5pDpYVepcHx6DPtTIngTeo
         +HUam4OZCGYaiuQ1oDW8ePoe7dV7BCSxbW3qquaJ9vwQcekM9XHmdz8bzlLBG2taD43L
         jX3sgpSE0L/0K3IfhtH0uoT3FeYyOAwvuShLEyMTu9dzEAmMiMVnIQEZ5quQqUxen8kj
         nGRHuLXCK/eJQO/nXI07/hc+4zxVD8NrNizJ4eincggQ2MAMHEQYG7xkEeiX+1CFr2XS
         j4GafRMUA12h4ftQRivBpRI0af6ylRJH5cdlhY/tIs97KHpxUQLcgSnnw0zY7Vzm/vo7
         XEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BJvMsVOztBdjuNo6RLsufemb4ETjfC/adZoUKHGjFDg=;
        b=HOmwIrcbxosMnXfxjbTZlHLWIZp/modrjmp7TurNEeuOWwMUZ5ttwuYo6VvHJUW23v
         14mBd1hqwMuAki4XdMiedQsGzUnsxQtxqSqlwM1mz+ebcYUT3zDga4dZxaZjdWITKJnV
         X/KuF5NK/zJtBwKxX3SfpwgYMU0k1HIjPcnOwTVIFGv046sGJtxLc0vPwb3vV1I7AdXL
         OsR4uqkP+cctKziIhqDIgAte4F9e5i9WhMyIgSQseOyIN1d6FHcwIujDvW4K0ueeq2VT
         uFRevxj6pln+SVWRGT7RqT9sfS1ME5F7kH8ckUAxY77TqAPMc06bqiaCUzqJKXfANwYb
         y95w==
X-Gm-Message-State: AJIora+kKpT+QnAhxRKsvSzD3fVcLhhlUaXzAurhISAGssLITjefPXaE
	cZor51z4WpeDd6AXSJ8HcFneAQGKwLPBpQ==
X-Google-Smtp-Source: 
 AGRyM1uOxQlD1jbF4kDE72IwGQ10aJE6CmRpPdh+mdnySv9S/J3bkq13J/Z+tiobtJ/O5EQSQhNf6A==
X-Received: by 2002:a05:6214:2264:b0:470:b3c8:2c86 with SMTP id
 gs4-20020a056214226400b00470b3c82c86mr14545021qvb.70.1656616629404;
        Thu, 30 Jun 2022 12:17:09 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c4-20020a05620a268400b006aee03a95dfsm15818291qkp.124.2022.06.30.12.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 12:17:08 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/5.15: drop obselete GPIO sysfs ABI
Date: Thu, 30 Jun 2022 15:16:54 -0400
Message-Id: 
 <ec413c29be08e41bbb8e2e10613bbc71a8be4b27.1656616115.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1656616115.git.bruce.ashfield@gmail.com>
References: <cover.1656616115.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 19:17:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167440

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    6778005b9fa treewide: Drop the obsolete GPIO sysfs ABI

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index c81c47e290..eee69be7a8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "9474b2c18a66a8172c2a13c9e83f02bd72e3df1d"
-SRCREV_meta ?= "8828a8e63fc50647e3f714a8a87a95c6d3e5b391"
+SRCREV_meta ?= "b35d1d1e8390a1677ee2ef1be103d6a7d09bf9cc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index b82aa62da9..5a1bc5b6cf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "59aca7a6181799d691277b32cc202cf5ac997683"
-SRCREV_meta ?= "8828a8e63fc50647e3f714a8a87a95c6d3e5b391"
+SRCREV_meta ?= "b35d1d1e8390a1677ee2ef1be103d6a7d09bf9cc"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 91106223df..4a40cde7d8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "4ec79de9ce697cea8c9aa2e2781e5a464ba2ccf0"
 SRCREV_machine:qemux86-64 ?= "4ec79de9ce697cea8c9aa2e2781e5a464ba2ccf0"
 SRCREV_machine:qemumips64 ?= "6b35c884701422bd1ce0821ce316993483283d6a"
 SRCREV_machine ?= "4ec79de9ce697cea8c9aa2e2781e5a464ba2ccf0"
-SRCREV_meta ?= "8828a8e63fc50647e3f714a8a87a95c6d3e5b391"
+SRCREV_meta ?= "b35d1d1e8390a1677ee2ef1be103d6a7d09bf9cc"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


