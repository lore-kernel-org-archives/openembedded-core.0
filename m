Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD2AC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:53:27 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.4686.1741809197775532940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wqIchLtZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3012885752dso585327a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809197; x=1742413997; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqaGDWL1LA4bzyNnKe0URkDxVdSOOF7B0ZbEAFVf1jo=;
        b=wqIchLtZPW37MLDGiLScTiatwjokZGHyXtHciPWQVZHV4rWx/5fJnNuQkIyMq7Dvn+
         0dqcmhNFf0sl6mu3WorKxMkjRH9iGPRbfeGvY/EhDhvPamnKIZ6wKmbJUePC5AgCwisN
         rHEq4I8RsqZSXEc2F5ca4y5M1JSZ5jLeXl5a7eEQfTjn2pCPP8nvfkvk6hdVwlcQbGLF
         xZIgD4uihXLGwm7P1CpSgUa0Q4jFvWRcfZ54GKlddZ+PwsU3h0T/VT7b9OjqviRqYAh6
         5q7jBn52pBF4tbB4eDMtq/FoAKZqm33lHeVx2eeqSrLm3Nb6WL7Gve9aEu0aaOUjRYoe
         wwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809197; x=1742413997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqaGDWL1LA4bzyNnKe0URkDxVdSOOF7B0ZbEAFVf1jo=;
        b=r8r++uq0JECriBjJsZQwiqoNVpG5gV5Jt/x4JvM3kU6x53rj5pDPJuTHyKXfhrjG5t
         Qy7Vqgc8nP5zlflhmQReWTh7fIWxbeYGXj9rwk/w1kNvyp2GUxMW0V+rThTtHsnVjqE/
         nId9R71bQYgjzz3hq5v0W0va8DWPkl0ytv1Cl8DwivTM38CFBF/QurEjOk+4DQBXl40+
         tJbi+aOEpjqT6oVb0tENk4pAwyGx8cMOpUfZPvcQUE/97X7wD+nwdE6vbqlJhb/RQAZn
         G/kIlyk18MLZ2MhBPwGjPjRURdJuNKrBrfct8UV9tez7rw62HPQzi4/RGGIZFF/qUyH0
         tcQA==
X-Gm-Message-State: AOJu0YxI62r4MaSw/MONTiE5KEB42x1SMd2OyfDc/HrVq9ievo8vVAp7
	M4StcWGtog+iHlzKdujGVcn0Ifv376Gh3CXG2vO4GCPros4klFPfHa0pFQN9iXvb2aedeQVUssR
	9
X-Gm-Gg: ASbGncus+4JopakNZdJFI8kVmyCZ2ZxVUtEolUGt5MkC6Rr/ppIIPXCCxL1T0F/iGMM
	tcttg5HmR0Jro3t1740Z2kNivs899IkPjSW5PuAWq9qj3IgeknAXLAqiy5wlS2Uh65qnSQUHjU9
	R3wl2LMoeNND3NQnHMOCu9PNtWUEnz88F3vqws8Tm+Gl0+7/5l4S8XLirL+UERI95ufLaZruMeS
	thaGDj+PSCb2/5Anc9f9hZtrAZF64WEP/eoPlQngVG1Wh/6Cm4KMM4s4KrOEwMC5WnH3JBbJtzp
	r5hWbcX+EQiVM2HP2U44UeVDKAH8kfNcj+9Ppvk7PPxyGQ==
X-Google-Smtp-Source: AGHT+IE4WNWXS6Lt5+sOg3UFFIQzPIKe12x1soCVX9wU9eaXq8hdo8cC+/Bis3Nz4q0lk/fD0xumDw==
X-Received: by 2002:a05:6a21:62c1:b0:1f5:889c:3cbd with SMTP id adf61e73a8af0-1f5889c6a00mr18161735637.35.1741809197095;
        Wed, 12 Mar 2025 12:53:17 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.53.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:53:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 25/25] xserver-xorg: upgrade 21.1.15 -> 21.1.16
Date: Wed, 12 Mar 2025 12:52:33 -0700
Message-ID: <a0989930949689dd971dea61e851b548af86a1bf.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212692

From: Vijay Anusuri <vanusuri@mvista.com>

Includes security fix

  * CVE-2025-26594
  * CVE-2025-26595
  * CVE-2025-26596
  * CVE-2025-26597
  * CVE-2025-26598
  * CVE-2025-26599
  * CVE-2025-26600
  * CVE-2025-26601

Ref: https://lists.x.org/archives/xorg-announce/2025-February/003584.html
     https://lists.x.org/archives/xorg-announce/2025-February/003585.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b5491688a045e52b2a1a00d04b746ed6af456784)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{xserver-xorg_21.1.15.bb => xserver-xorg_21.1.16.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.15.bb => xserver-xorg_21.1.16.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
index 080e6d220e..38c81f2372 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "841c82901282902725762df03adbbcd68153d4cdfb0d61df0cfd73ad677ae089"
+SRC_URI[sha256sum] = "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2dfcb62400471a9970"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.43.0


