Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB04ECD6E3
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 18:51:59 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26833.1770835915870776562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 10:51:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bwr7ag2m;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: colinmca242@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6728d280c46so1304175eaf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 10:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770835915; x=1771440715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZ5z2U+F4Ift3x0Fykk79oXtk/pF0EoKM56SG24NT58=;
        b=bwr7ag2mBDwVLi5CH3tWmP2ujz75o0V2JeJ3jNTa2boImbp5ki7IE2m18kJTwCD2Qx
         XjalTQyJLPPc54X23jBzbc/5XipXtQKWM4Gr65Oq4fbO1oiv40HXGAysQG6S1jO4aNK8
         QlrDfWaHoJeQ/tPGTBcY95y3gCD8AIXkXbLYifgopbE1Wx6BDqsQqKY2cO7iPA4PxVBk
         S4SFI7bgTiTnll9xmfx6599r5CqRiaBilfxU4QTk6Oyoia8xh30BfNyfXIGnG2ET/v19
         /Fn/JsabMsZePalzPgqicvNnHILbY87DsAyOYRI5nQEqpx39CdCbbV+ygTSz/8h2F5w7
         r6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770835915; x=1771440715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dZ5z2U+F4Ift3x0Fykk79oXtk/pF0EoKM56SG24NT58=;
        b=fLkL/SZT4T/p3k9oBvIbtJlYZXgRPl4QEKULLxsCZfpAdHqg6fZi14iSu3QSJv/G4G
         uE/I6BgtWF694ZEmtasLx6VtCL+vYAOTuf3KvhEswWdSo2NaOIBympWg4Zkwxm1ajNZS
         rZTsNTgM+Ci2rsytaZzBtj2DOFcQAhAjXhoa5RL6yPDQpAf3N565ke0OSvTeb8C5OGIK
         nahRVa6uggbsE0Z8eb2GOMBbfjTvETaluJVnhVA1puJ7J9nX9BclUBLRkzIU4pZzm1y6
         nSag+Z2fMJagl2S0l35nDAKwSWebnZHJHKLTYfH629b5WX023dmIGrFccekdwFzsSP/V
         uXmQ==
X-Gm-Message-State: AOJu0Ywyg2g4oExph4yYj+DX4s2HHPIxBy5DpjHzgWMOZ/IvqJ3PPiUg
	IQAbbvrlptdGmMv2dwYL2uGXghXGLOB82nB5CbYQy6lNEE63uezqM8QrOKKy2Q==
X-Gm-Gg: AZuq6aLQco1lUpzZzotHvR2dgQAFPzV3KjkvP6Q3E442wrz9W52Q7twD2j70QYWknSM
	RLaBZAZBQ/GqOdXov0dMoCTLL58jl7fEj4UIu4nFAK19xHuqCZXaOAWHlfOn921/aaVRCkpIUuY
	la9zBUIanhOcvvdUjBzgce/rzvs4uPKW+V5b5d6k7ejAGO9xEwi2YkUtVLtwgk8yNTXI7Jy7T+i
	uWN+aNAA2WkQhYi/TJiNYfz9oyQllcF8lVnC9tPW2kbmeoVT8EfnstBFnizKGZmUmhXJV+Lu9i1
	svnncG4JTE01jdQoPf57RyYnqQ0G1ypztY70DT0aGGpAc3UunbzOxltf0dE8aQ2BiPg/TsoPZ1k
	NKofUWCoGAhVWgoiMYsJBZr0D5B9RiLnVlDMftexa0JXqybvuHiIbDCSJ5DB+TxKFF6YNzZ2YQp
	wJFh7+eopkZCXrBUIRmS4=
X-Received: by 2002:a05:6820:198f:b0:663:39:173c with SMTP id 006d021491bc7-6759b7c5f6amr92518eaf.65.1770835914580;
        Wed, 11 Feb 2026 10:51:54 -0800 (PST)
Received: from fedora ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67475fbc91bsm1356092eaf.15.2026.02.11.10.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 10:51:53 -0800 (PST)
From: Colin Pinnell McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin Pinnell McAllister <colinmca242@gmail.com>
Subject: [PATCH 3/3] python3-cryptography: Disable legacy-openssl by default
Date: Wed, 11 Feb 2026 12:49:17 -0600
Message-ID: <20260211184917.1045939-4-colinmca242@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211184917.1045939-1-colinmca242@gmail.com>
References: <20260211184917.1045939-1-colinmca242@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 18:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231000

Disable legacy-openssl support by default to match the openssl recipe.

Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
---
 meta/recipes-devtools/python/python3-cryptography.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 366fda5e87..062b41807b 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -22,7 +22,7 @@ require ${BPN}-crates.inc
 
 inherit pypi python_maturin cargo-update-recipe-crates pkgconfig
 
-PACKAGECONFIG ??= "legacy-openssl"
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[legacy-openssl] = ",,,openssl-ossl-module-legacy"
 
 export CRYPTOGRAPHY_BUILD_OPENSSL_NO_LEGACY = "${@bb.utils.contains('PACKAGECONFIG', 'legacy-openssl', '0', '1', d)}"
-- 
2.53.0


