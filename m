Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD23C46467
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:23 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.7376.1651727161627440239
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VTN6LMzV;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id ks9so141970ejb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pViwfvYnBWZv6l5GYBwZdU894RzGiOdKQKYzC0SyGlg=;
        b=VTN6LMzV78yomXmzye7YF6OMe3ADHbUxIF9WOmf0Tmyvy9+p8MSJyV6+ORpudEq6hC
         eAnGnNKsQZq+BF3a73ZWlM/86DVJjyFmvW+Ra7tFJbmLZ/A2/nLqbtgmxBv0vquiKM5Y
         TNVxBNm0cGwWrpnxhkjdBtR4oPH18Cw+7SkH8WeC5Xf9REzYBHwAYEAG/PpNQrOftdwS
         mxzYjyLF5gc9sZ4nTypOHR16emgJ/7l6lRIZKkQIwYVypFkx9CHLg0STWV/IxXM/r45T
         0TFIpCdVilJ/tE0fiu7eBEKH51fRK5gHJdgY2j7FQfLu5KnzIGLdkGJRHH9k4LocuS4a
         da6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pViwfvYnBWZv6l5GYBwZdU894RzGiOdKQKYzC0SyGlg=;
        b=MWlGTglPoJeOPRDyDPiEIyxiaHA5NRbbuGHqU046Cc9b8ZE9khEjfiBgIfamo8HXl3
         UVpvOY++w2xpBR41IpjQtWVpXljk6oIM/HQ32tvN6TBxE9Ssh8gIdB4J3IZbOwE++GZV
         KOYwIXQJ5kH8G1ICWA5JlZNXH/AruXJKcWrsghntcfwcuU5Ax/wqTu3CLpH9Y2uS7Qdq
         vSA8m24C04ht8rY+i3Zgvtmb1Wl6tG53B4I5lcMlSqir6+MjW9wnASaCVdJ+NCnPxVIo
         z3r8Y6EWIy0a++QyR6YiOqI89Di9vtZj/HBA4unIp4ZsbC3tCx2YE1rmyIrIuCDcYlS6
         D3qw==
X-Gm-Message-State: AOAM533raVIi7bKJNYZ6gd8QjqmQnYVyqoOUbIxaWCAvgCMTAQt99AUs
	76i7RsATGXivrquKjcfJTOVxmy0Q0Aw=
X-Google-Smtp-Source: 
 ABdhPJw3y/R+14ls87rdoe9xSqH08XlBho+Dpi9kAt5h8KuvOHKZW/eVrHrg9+DdAT2WhSa9QBSOyQ==
X-Received: by 2002:a17:907:1c8f:b0:6e8:f898:63bb with SMTP id
 nb15-20020a1709071c8f00b006e8f89863bbmr24908270ejc.721.1651727181316;
        Wed, 04 May 2022 22:06:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 43/61] vala: upgrade 0.56.0 -> 0.56.1
Date: Thu,  5 May 2022 07:05:26 +0200
Message-Id: <20220505050544.651895-43-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165272

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/vala/vala_0.56.0.bb | 3 ---
 meta/recipes-devtools/vala/vala_0.56.1.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala_0.56.0.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.56.1.bb

diff --git a/meta/recipes-devtools/vala/vala_0.56.0.bb b/meta/recipes-devtools/vala/vala_0.56.0.bb
deleted file mode 100644
index a4d6760f10..0000000000
--- a/meta/recipes-devtools/vala/vala_0.56.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[sha256sum] = "d92bd13c5630905eeb6a983dcb702204da9731460c2a6e4e39f867996f371040"
diff --git a/meta/recipes-devtools/vala/vala_0.56.1.bb b/meta/recipes-devtools/vala/vala_0.56.1.bb
new file mode 100644
index 0000000000..48d21685e8
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.56.1.bb
@@ -0,0 +1,3 @@
+require ${BPN}.inc
+
+SRC_URI[sha256sum] = "c518b81dfdda82d1cdf586b3f9b2323162cb96bd3cb5a2c03650cea025d91fb9"
-- 
2.30.2


