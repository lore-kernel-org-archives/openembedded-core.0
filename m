Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A75C46467
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:39 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.2632.1639608044252270745
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DH3b9rvq;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id b73so2239713wmd.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l/wp7jh39GvLWu/vAxHibQw+NWkS+fOOCSI+Wd34z1k=;
        b=DH3b9rvqD0Tijqlf1qz1ovDaBPqktWGT1bOQZAEjGDT2mKAuSK6SyRS1psem6M2N1c
         Eiq5bNc2N6oSaRn7oB8pjAwWQ+Iq+xBy7vJjE4y+qKtcFKCdIF67m0I+n5W4DqyewpmP
         BFdvujDT+6WWZVu+3OErzxurI3Un764FoD72SI2UFggdQOXMZF9by5QisBOCoguDL37w
         K2r/bG1uytVQWUxuPGtyubcJMYIM4wVaQtY+fToCo+fqHfkF8UtSJ4WLrgDVUFfz8zGu
         j+bL+W5ADzGBMvFxEiJYo0EsQecSXMp4884flZ7pwjRvmHeLjty4Qaon4Hvfnr9+ysu/
         SSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l/wp7jh39GvLWu/vAxHibQw+NWkS+fOOCSI+Wd34z1k=;
        b=pqCfwPaDxcU/EG28SdFTN5R68EGvI1HHBn7yjxhuyYl/9Y5Vg+n9k3bPhaY6HDitgL
         pQGwm5ez0kd5VQymaYfPELlbSavLHaByvNTVnKjbEPMzSvOHf3NkkaMrrw/Fetba8XTz
         gxsXBgdErbvXYld9LDC0VPzMy3ZThwLUc6xTgQCV7+Ahg2LO6K4XXwsl/BcmoKeLvMbu
         BxMtwD+HAeflY9ivwOEH24EWH9PXKouxDuf+pAwnDqG079vDxf8/oWeG6vNnJQPwudyq
         pj5NyseozfZks4u5agi8UpEHEyCiWQI/4UcvVcYls99tJ7vkKvUzzPpM+o7tiTxfJC35
         BoVQ==
X-Gm-Message-State: AOAM532ymNUUvyKy0osIpd4plYUXZlEYWuyd9pIy8pvkYUrICU/ZLZ/9
	3itgcuEBOPpoS9zA1cERjR5qSYtgDXEZJw==
X-Google-Smtp-Source: 
 ABdhPJzQPPZc4NHygszalwoSUStJIwC6eAkgJePtmet26emQXX4N+0ZkNcLaqJSyNW+HDXyxWEkhtQ==
X-Received: by 2002:a1c:1fd4:: with SMTP id
 f203mr2235832wmf.192.1639608042914;
        Wed, 15 Dec 2021 14:40:42 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/26] vim: do not report upstream version check as broken
Date: Wed, 15 Dec 2021 23:40:14 +0100
Message-Id: <20211215224034.1814148-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159748

As upstream tags point releases with every commit and
the version check still reports 8.2, it should not be considered
broken (e.g. current version newer than latest version)
until 8.3 is released.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/vim/vim.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index dc11a0aabb..34963054fd 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -23,6 +23,9 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
 PV .= ".3752"
 SRCREV = "8603be338ac810446f23c092f21bc6082f787519"
 
+# Remove when 8.3 is out
+UPSTREAM_VERSION_UNKNOWN = "1"
+
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
 
-- 
2.20.1


