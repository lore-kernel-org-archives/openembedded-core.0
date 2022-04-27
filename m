Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DDAC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 08:40:26 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.5776.1651048816839057624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B3nX/tl0;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id p4so1135529edx.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EG5cBrro7wIX5z2WdgEbezZzmZn7zBN+pTmS0W+1fio=;
        b=B3nX/tl0H0dE8o6gN2BsBOtK/0JyaU1SriHoQxLLGd1xhVl4HNw4fjokwgmR3Bv6ti
         lX4C3fXuuh27ADxZf+SQZ1yutNUBVl98yHB/YF3pOl3yF0Jr4Ow/Ixp0L9rLVUP/PkNs
         w+5qd1QDkFGfG8DUSHP27cjyBidjLVugv5wKK1+J785UmHK6gV0BncPrHCSTJvTclWRd
         lxIqLTLVlFYhq39wV9p0jCOKfU0/RfARItHgHHIq2X8MSzFmWrccJcYqVXThkWpHag/P
         PSfIaMbTF4tTIjwrGrOoITnlW6w8uLVY7/IBIiadwazeIxoDUOw53YDs85K1MgWriMwZ
         seog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EG5cBrro7wIX5z2WdgEbezZzmZn7zBN+pTmS0W+1fio=;
        b=IisS2UUSS8ooCysjRtFLnOfAh+sMIEcHe3tWQfBwZIHrCzLFjT/KRiwN5TjnOQ0GA1
         TT5HqpGoB3WRCTEL96QAtwT5wqHHBmrVCVdza4qF/EaaCrwJNbbwpLUZOuQb5SXKSowm
         I5VtG8wTdHvXANWYhjk+CMaA+nTRwUBGjjEpzxAKSLiZiaKbOTz51xACwRB2pFjXhODp
         CKqJxm5gmHxboZIgsyLuaHy1oXr1d3Zow6F65d0XP129NbviltN2beQlxIrS+pY3U/Qr
         VWXD5q5125icoXOABXybKykjPCfwY/sYGrvPmvUvbCt5X2YXohdqpF4CaivLUHgu5/Au
         nzcQ==
X-Gm-Message-State: AOAM533xm1iSpgMwEueTZRDn9zyVvL6+28DSCOuPBfOFurFqWVuZ6BWi
	TpASJ1yv/XBGAJ9hxUCNEWkve2bfbtU=
X-Google-Smtp-Source: 
 ABdhPJwZXmG6Cug6lBcIqpAbTG7ASPeOsJCjDGGwBqtr0eYenetcj+7m45SjJvcnvmZfg0OpuF7lHw==
X-Received: by 2002:aa7:d70a:0:b0:425:e56d:c1b9 with SMTP id
 t10-20020aa7d70a000000b00425e56dc1b9mr15757747edq.78.1651048815343;
        Wed, 27 Apr 2022 01:40:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm7893024edu.51.2022.04.27.01.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 01:40:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/18] gnu-config: update to latest revision
Date: Wed, 27 Apr 2022 10:39:54 +0200
Message-Id: <20220427084009.3406717-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427084009.3406717-1-alex@linutronix.de>
References: <20220427084009.3406717-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 08:40:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164894

License-Update: copyright years, formatting

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 83c18a1ca3..07aef75715 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -3,14 +3,14 @@ DESCRIPTION = "Tool that installs the GNU config.guess / config.sub into a direc
 HOMEPAGE = "https://git.savannah.gnu.org/cgit/config.git"
 SECTION = "devel"
 LICENSE = "GPL-3.0-with-autoconf-exception"
-LIC_FILES_CHKSUM = "file://config.guess;beginline=9;endline=29;md5=b75d42f59f706ea56d6a8e00216fca6a"
+LIC_FILES_CHKSUM = "file://config.guess;beginline=9;endline=29;md5=10922f9231863a06f6efb67691fa46e0"
 
 DEPENDS:class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "191bcb948f7191c36eefe634336f5fc5c0c4c2be"
-PV = "20211108+git${SRCPV}"
+SRCREV = "c179db1b6f2ae484bfca1e9f8bae273e3319fa7d"
+PV = "20220425+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
            file://gnu-configize.in"
-- 
2.30.2


