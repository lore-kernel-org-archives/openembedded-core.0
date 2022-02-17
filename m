Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDEA7C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:11 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web09.1775.1645114211217156611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OIHJMWLN;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id hw13so8397101ejc.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u5O/MMv9E9iSdua2ejGQFwRAK13JoP/9KLD9m3TQRD0=;
        b=OIHJMWLNj8zuFXXDvAcPtvbozEga0kkN9RNAdQvStDbXJGdGC5IivpBoKgXnxQNwSv
         dlRKAieIRuii5sXq9ntqHTOClN2PavEn5znyEOvCBScAw+tv5LzHgU3a4VgIuUppPp9R
         9ncfaUYf/8zJB2xAhIARoGvJ2ED1J5M4MMIbDMZMZaa1+2S/gFImJUySms0XMXLlIF8g
         Qq5dGSL8+P77s3vCxKejmrrnJpkbWrBArqNXvJUhvOQBJim9unqTtxDi3BQbwkoUqYYy
         Sc/ZWdRFcl2g/vw+HJlW0HaSgpCkhrjUty6wFWB+an3gg7rWDPVBLcqR45ot4DGdRSVY
         0W3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u5O/MMv9E9iSdua2ejGQFwRAK13JoP/9KLD9m3TQRD0=;
        b=b6cBPc0wXA3YaOwxf7mpN2PzGxOhsUWvDxAE9pMTkXhPMD0n+1iZ3rSpFDUuOR5agg
         gXhXCD+6YTVn/DqRly9EH2sAQmYjumyAe8oXRLvLzO3smXgAPgWTKT37lnO/l0DLwWm0
         /un90El6QqKOcqanBWQtIj9rSXhLLhDB6gfxRpE7BuRyzKfxu96jpg/arSb+H9tCwQ7Q
         zSNKcyp+Vhu98Nbiui05TFtuVR6p/lX+/dDfuoZWyfeZydUefCKTWI4sZePswWdjW1nR
         qmbx6LQxYIJ6pD2XXfOdb+qBbYK11wS8xcjPNjyRBGfdTk4CpIbEzMpX6lzBTTzIkv/C
         1Miw==
X-Gm-Message-State: AOAM531uxcw4Yn+oPRDEJg7cukPISOFmS2RWinSLHZyA7IzH+h4jRsy7
	Upy9S8dFygSxDkpOq6fGFWI8/qvJ9KI=
X-Google-Smtp-Source: 
 ABdhPJybrb9v1+nkiAUz62EdINsI2smMiTwaLXUb+1d4FWSKN+sCuwo4HvrM0p6wCfpiizEN59SWQw==
X-Received: by 2002:a17:906:69d1:b0:6ce:7201:ec26 with SMTP id
 g17-20020a17090669d100b006ce7201ec26mr2972693ejs.105.1645114209791;
        Thu, 17 Feb 2022 08:10:09 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:10:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/28] gi-docgen: upgrade 2021.8 -> 2022.1
Date: Thu, 17 Feb 2022 17:09:33 +0100
Message-Id: <20220217160939.1424397-22-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:10:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161839

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gi-docgen/gi-docgen_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
index bacf983810..b2d7d6513e 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f0120247
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main"
 
-PV = "2021.8"
-SRCREV = "a284455af9b3cad179900f6e1f12b59a3d40c06b"
+PV = "2022.1"
+SRCREV = "37b04455ff58cb2ec3f58917d0737c435344f2fb"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


