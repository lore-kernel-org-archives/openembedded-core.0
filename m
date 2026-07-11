Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FA4C4450B
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 12:36:41 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4205.1783773393185296446
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 05:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HBjgks1r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493f45e20cdso9911675e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783773391; x=1784378191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9mYf8oIEDXLFtmGli4WocXHpFqXv98mvMKrBto6sn9E=;
        b=HBjgks1rVnHfIQOSyOtZnevw6jIWejEmkW/tpJDhXfclcEM/+iJCqnt51/02em7BIf
         CxiiAdr16i1V/wHLF8Qtv4DK3P0P0tz9m49BIjS/Lw+r3G4wnJOQlo41EmUh+pnhW7yi
         h6/gprl4x7PsUbTnV3zbeSz2iIJzEzNEGMiH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783773391; x=1784378191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9mYf8oIEDXLFtmGli4WocXHpFqXv98mvMKrBto6sn9E=;
        b=oxYYVN+D0XyF6jh+9NWQZqtdXs/qvdM0nvGl5aqDdA3OFvcKSqlxXbHoWRvwAYbHnb
         VElPk9CvQItMniTneSxbDLOSTwHcaeYHsiaumgP0jAFiVy9+TKKc9KLWKYfF8f3UpZTp
         uZj/C4f3ernWvhfDGmnL3NMO2+vYAzCsIskTDcuHmFeEScXAhK/ti+a4i1JPpMueLbnm
         dHnVtCZ1sesruXVqiAxwLbMgIxyOm/47jJKoaEntuFH9Ac+BMJ3CHWsR1unxzHKIb9TZ
         BpqXNnC1vACUONsyXWjo5lOE2xHXMdG/iwvbl3llXW5bo8tReXdZyZlmB6qKM6HdH2Cp
         onwg==
X-Gm-Message-State: AOJu0YwzP1s2f5EE41kMl7Io4lTQvoI18fCP9dfwVPXAQRkfNEfXuRT7
	GGZOZgjLeMl13UnbRuhOEE8WXqMrK0lto3zP1hTKuP4ifxUcmoPR9uExouXkpbSWFmP7WdEZA2Z
	uPheuvrA=
X-Gm-Gg: AfdE7ck70r32SsskA7AhqB0pQPcZNkhrD30BXAyfpGYeJK8XCy9d4hWMPk87GrVOpg0
	GqJe9Crpxw5A8o9DCz78qC9mgwsc0rO5CA05J71yucUGKW32vuG8EKVx7nEwFqUtJl8T/IoomNu
	TkR1rwnlnZIwCMgvbq8H0SxvDfA7t+dBrJWp1OnZVL1L+LZ3DqXzug+4wYWecgyZdLXhjGQsjFT
	jpt3deLmTSzAENHX7udXEq86ShAYq5h0ZzlbvU/daMrPLgXzUjXTMwmFwe+KdrT5hT6Xp9TnV2N
	ml1PfcKiepIrofYNOmwNWKakSL9ci6O03l+1QXUnx+NC7W/n3XkUn0jnE2vKmXOKzlqOjH+fqEq
	S8IgDfoMhgppbv7nqhPTWXER5toeOS3NocqhEG8Rw4W4e6ZQA8CxlX3TDDNj3kMROs7wQNvORZ/
	fabFNV/8KN5M6C72fQv/8yEEJ/wWH4UnfXbTI3yJcQjw==
X-Received: by 2002:a5d:5f02:0:b0:46f:5d62:d914 with SMTP id ffacd0b85a97d-47f2dc8ceebmr2610421f8f.12.1783773391426;
        Sat, 11 Jul 2026 05:36:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2004:2e5c:aef2:b707])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm77172097f8f.17.2026.07.11.05.36.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:36:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] mesa-demos: upgrade to latest revision
Date: Sat, 11 Jul 2026 13:36:22 +0100
Message-ID: <20260711123626.1583730-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711123626.1583730-1-richard.purdie@linuxfoundation.org>
References: <20260711123626.1583730-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 12:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240713

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
index 6c0c3d1b564..e7fb2974481 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=5;md5=2c456
 
 SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;protocol=https;branch=main"
 
-SRCREV = "188fc2354de5a9cbfd73852183a35f4982ca43d5"
+SRCREV = "c508611faf6f2fc30248940cdcb795b564cd6699"
 
 # This recipe doesn't plan to make more releases, so track upstream git commits
 PV .= "+git"

