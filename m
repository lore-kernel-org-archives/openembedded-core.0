Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD8EC25B76
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:25:26 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.36169.1717244719834304853
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zln8C1P7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f44b441b08so22904685ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244719; x=1717849519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40bz1Qr7CbXJWTsH74pIn084jkOlHJV7Zkr7sS92aIw=;
        b=zln8C1P7ExOorNNwX21qWIzG2XXrtyXxtwPLIYmJGApZjcoOKqSbRCaVGKgi7KEKRn
         Z+h37Qij9zBb/HcMh08m8pjQz0l8iDbTR4NKsVtm5JgLXqKXMBWtCgMrdgZw8zlO5OUU
         2Vz5t6x/etevaXFebUPrrse4F7MXJ1DrpWgkx1jgqhEvvOb+a9N0y89GVMMo1I/YHjz8
         pBmmAkufgO/v2DPlS2IHBfIWVOg2yjxItt+y/K3rvA9pRBefk9J4gB6jvsPRv0pqX40u
         VZEJTYw4WCZpzoQISGWPSSHNu+m2DQfd0N0NI0UF3MktAEOUxJBYAHbPTIMvBORpoGUb
         2FDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244719; x=1717849519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=40bz1Qr7CbXJWTsH74pIn084jkOlHJV7Zkr7sS92aIw=;
        b=NrkQ/Wq9WDPVDw+o02ryR8Cjbx2+oQKB/yxYatLFgjLDcCQlMLG5NJiRjJBLRU0JqZ
         yT/QGdLbob+HjVecemEl9tWBw065PEw6bbi0gCx85FKwRYDhEtuZMyudnX4AJhmThl+D
         TH+VyEcWp9CfQrrFq3jlxYPkJyZTplarXrQ/TrYJbt9we4qQbVXTvN9AcVqqUtVNl80E
         8a340kdowOKZ44SODEBunDU9XPMZbdFOcmbOrvJ7iojJxkfDj7Lt89t6pAL4v4L7ec17
         dL2lYETICioM9ArqY+jK4Qj/XG1rWVIyonnU0Lir5cOAsNTilLi7lrc189GuDwAoPTBP
         R79g==
X-Gm-Message-State: AOJu0YyAIZLIuVG8D/rLN98sCt7ok+gFDPqBPpak6Owe8FnuhVufPAP6
	MHpBWUidCUSqq3GI8jKO6xXY/c1ABgX5D8jxaCNR6qyK109R0tWhGfA7k74u8a8qzlrx1v0TlG3
	a
X-Google-Smtp-Source: AGHT+IHpJ07fvOtpzNryRx8rvEuix8u1J16c8paG4rC9Re1E799WQEG/9gboWet7HpdBNG+TWvzfpg==
X-Received: by 2002:a17:902:d4cf:b0:1f4:960c:a05f with SMTP id d9443c01a7336-1f637040cccmr53023545ad.31.1717244719070;
        Sat, 01 Jun 2024 05:25:19 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.25.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:25:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/21] update-rc.d: add +git to PV
Date: Sat,  1 Jun 2024 05:24:44 -0700
Message-Id: <54cbf43e55ec3373f8c2612b787166da35028fd3.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200114

From: Peter Marko <peter.marko@siemens.com>

This hash is ahead of the tag, so adapt PV accordingly.

(From OE-Core rev: c94e46019a7d443ccc4763ba16d87e7e97abe977)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/update-rc.d/update-rc.d_0.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
index ba622fe716..27723c88ef 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=d40a07c27f5354
 
 SRC_URI = "git://git.yoctoproject.org/update-rc.d;branch=master;protocol=https"
 SRCREV = "b8f950105010270a768aa12245d6abf166346015"
+PV .= "+git"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.34.1


