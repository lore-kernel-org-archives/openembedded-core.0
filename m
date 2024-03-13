Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB4AC54E6E
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 21:48:59 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.8402.1710366534489569967
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 14:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZBWRH3Ow;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e6afb754fcso348536b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 14:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710366534; x=1710971334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqpIjeprpKhpJG/Y62qOFYnx7yZY5UXfBqXX+mby7ds=;
        b=ZBWRH3OwN0ul8MW8FhEpyEb3ywIXtrxJrdURFEM8x+DIHzt4d9gbyzxwYILbqWRsVo
         Usy6XpTyZ5kkDLQfoprG9LQalKt9Z5cNQnRWvlNxSs/Q1qW4u9xcUMc4Hz+dUoqwNVeN
         OdgsAnJqYi5KWU9/GWb+y3hZIzLLSbovkUZkoR0IZxhRrrOKXMhkrHpc4Ssir60Nyw47
         899JYchZ/qiX7wVlcOC8/l3UByVPcoMIfn6KjkRR7xPh77/74qv8o4wwT63lhZNpHiJ6
         Nnys5Jm2xiTcFGfyIT9dxy7rePY2hrRoPLEP5bGGeLT/2JOUUW0I6Wukbv3lLJrVhvzb
         ROiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366534; x=1710971334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqpIjeprpKhpJG/Y62qOFYnx7yZY5UXfBqXX+mby7ds=;
        b=W3eXBJJ8s09MFkxYhlxA6uW9TabtNe9Y/TcO7//NCAyto25Pt64dq/tpzzjVkVnEsS
         JOOCeFk/zO+53ay+DuxNzpELnwm4EW52d60v5oKkEDJjQYGNlzrKOd7IDzot7/Q57pMZ
         otD+uY7nnS5EP1TLGd23pQekBBB4MXW2YE/rD8IeZSdXXI4LKkSjduvPvV85so5J9SVQ
         1AtaMwgzmJFiSp7PORRSDdjkdEIgY+QtjbYBH8hK667yK0NH1rdeD2oS33/s8eKzRHy5
         VDIWBxGWv8exUfeLiBIIscBvkrBG1Cu36vqj/SlXd0qF9VYMoPuTEc+1JTeh2W5lOh41
         Su9g==
X-Gm-Message-State: AOJu0YxG4lCnfD93jiQ/sugkr93UYnVZY+Yo1YhD8ggR7V1DEBYCHF83
	+qpwB6FdY/cumW873O6mPCdKgTXBYB+fZ4ezLKNtLr9qySvBBRWu4detXnAzAlQxVgEeEiFk5TN
	c+N0=
X-Google-Smtp-Source: AGHT+IHk/F4FxPnFupldT2Ty38IxLRyQgDFJ+EDlHkFh4iPQ7gz2AMjsNWu/5dBw/kifOjhTaxfcfg==
X-Received: by 2002:a05:6a21:99a1:b0:1a3:15e8:7e93 with SMTP id ve33-20020a056a2199a100b001a315e87e93mr257827pzb.56.1710366533748;
        Wed, 13 Mar 2024 14:48:53 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id it17-20020a056a00459100b006e6b2beb030sm87226pfb.48.2024.03.13.14.48.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:48:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 1/7] xwayland: upgrade 23.2.3 -> 23.2.4
Date: Wed, 13 Mar 2024 11:48:39 -1000
Message-Id: <91f5e2a55212f3e0c8ce9269a139a7f4519f28a9.1710366394.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710366394.git.steve@sakoman.com>
References: <cover.1710366394.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 21:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197085

From: Dhairya Nagodra <dnagodra@cisco.com>

Includes fixes for CVE-2023-6816, CVE-2024-0408, CVE-2024-0409

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/{xwayland_23.2.3.bb => xwayland_23.2.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.2.3.bb => xwayland_23.2.4.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.3.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.4.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_23.2.3.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.2.4.bb
index 9aa7b4dfcd..092359172a 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.3.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.4.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "eb9d9aa7232c47412c8835ec15a97c575f03563726c787754ff0c019bd07e302"
+SRC_URI[sha256sum] = "a99e159b6d0d33098b3b6ab22a88bfcece23c8b9d0ca72c535c55dcb0681b46b"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.34.1


