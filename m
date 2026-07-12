Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA09EC44509
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:30 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14784.1783866570064028543
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=iD8bjzD1;
 spf=pass (domain: underview.tech, ip: 74.125.224.51, mailfrom: vince@underview.tech)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66493875766so4117820d50.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866569; x=1784471369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ylsWSCR3M8HZw3y0Qd9EzvpFU7XBpR/p9T6uh8EiZ00=;
        b=iD8bjzD18LEz/29yXJDAzNfpsMtMoqahgTLQVHSLTCSh67WZiTeHzsl0MIK97ny41e
         B9E8dVURm/E352NaYSFaJp6sMvwwQCYHQ+knI/AOhF2RkVJ7aZbFRiqkhToWOTg5qzLF
         c4alLbmcdYJKanBCNpBYPj9HNo7dpSudjgdhH0yeeeCgBWoTG7H30dkpHthpiONXl+M5
         pY+U9R8GMuLuZPW4eC9WyFanLGkk0s+QQ+MHNKTus34ZRnz928U2naQBZXj5QPzcbR94
         gAEMhLBcDkj1dUkk+MbDrSQwV+txYEtXEDvz8Haq4Z9OgGTgwEYEpRGNrJbDzUHBoFBz
         yWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866569; x=1784471369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ylsWSCR3M8HZw3y0Qd9EzvpFU7XBpR/p9T6uh8EiZ00=;
        b=fGCMsFPsPbPKsdFcyJ4RzMZ7efjmV6h/22NR1VJwvry5Ff3qSp3MU2rJk2Ld1vlswV
         1VFq6WGtybOLOkKetXwwmOyhiSmxh2fWFGh9bL7EHzgr6ZLbAq902pF9d65FYV1ME04I
         kYlOc2HfpQcTdAzbsp/osJQKqPZbP86sgZ/Luc4W4qk7rTpylNBFHku+9yLTX0Se1zIh
         0znEdsf6Z9jAl1CainoxxsdMao4lg85GbArggx3tvZMnYBGiVakcdpnal7fyXv9dlPQ7
         /S+1dRZxZKY+tpGOCruybpvlPD2gP36XVcpdBAqhhiMMfwK4VlN4tSsIYfTBfAwTjJZ2
         pjEQ==
X-Gm-Message-State: AOJu0YxN1+UiJKfA08egx2KPeNZDwweC748iUxXzY45UejSCB3VlzV3i
	X4GgwurYfBO28wCQf0Bue9Ob1pwcq3Dp+VEAHVS2GOG0gCehrWzovHc8pRjMyTGr4dUCq+U2r4M
	IikGcTr8=
X-Gm-Gg: AfdE7ckwjdrIx1vMAexXYGLSKqMO/vMKwiu8+cQOo9rUhXzlGFKXUJX/7KFSmbnEJjW
	zJgsfdpjyUjklEzFAzjiiS2EqBres0mKqWiK3hegHYNj2BQLQOHmISrLoL7fshpSAJF4me27vRA
	Xiq+9zMoRfeVPIJqWfHuVR8eaBEOkwhXakFig1SYR3U6mzENhwgQdGfHXQDw51m+wzdsrn2BDpr
	pgNOSOkRUJICjG6Qie5G6XMAqw54shuQtnxXONEyVFumgufmRswNVB3Z+D0Okh609lmj6ewrsaT
	8dfnF31+zfM36xgd6rJM//nYIyn1dQqV8hfUuL3XPlpjM1Fy8xbJHcVawiDCLqIfM97vVtLBsEZ
	jCdRBxAt15HL1KERnLatURapFZg+wl/fHpzRav4OvaS8i0veIMafIsWCvvQeRcFCSdO8pGjr0RC
	JjOlvfAJDaaQi3bHgRB0TWRc8c
X-Received: by 2002:a05:690c:488a:b0:80c:2874:67b8 with SMTP id 00721157ae682-81e900a551bmr44723047b3.32.1783866569088;
        Sun, 12 Jul 2026 07:29:29 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:28 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 06/24] packagegroup-self-hosted: rename kernel prefix
Date: Sun, 12 Jul 2026 10:28:58 -0400
Message-ID: <20260712142916.2573370-6-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240772

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../packagegroups/packagegroup-self-hosted.bb      | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index c386267781..16835e60df 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "Packages required to run the build system"
 
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
 
-inherit packagegroup  features_check
+inherit packagegroup features_check
 # rdepends on libx11-dev
 REQUIRED_DISTRO_FEATURES = "x11"
 
@@ -51,12 +51,12 @@ PSEUDO = "pseudo"
 PSEUDO:libc-musl = ""
 
 RRECOMMENDS:packagegroup-self-hosted-host-tools = "\
-    kernel-module-tun \
-    kernel-module-iptable-raw \
-    kernel-module-iptable-nat \
-    kernel-module-iptable-mangle \
-    kernel-module-iptable-filter \
-	"
+    ${KERNEL_PACKAGE_NAME}-module-tun \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-raw \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-nat \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-mangle \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-filter \
+    "
 
 RDEPENDS:packagegroup-self-hosted-sdk = "\
     autoconf \
-- 
2.43.0


