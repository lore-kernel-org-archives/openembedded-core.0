Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA6E1E7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:55:25 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.21231.1733334920369201705
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YApjSwHZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.41, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-29e7516ee77so85950fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334919; x=1733939719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+NwRdnPeGyLdeW8vUheYvwrmmGsNozJQ75TO2JAWes=;
        b=YApjSwHZtA+7U17m2DWlScD44M0EwRLv7nyHgHBxNCnx3GQXZPmKiw47LZajUfFCaA
         cj4AZHg2iignNUoVUFcqoRSaCUdKovf+0F9Ar5PCGDOt+HFqPc3l+TTdwrz5Kz99bz/P
         Pi6Tcp6D4DMzPL5Y7HQ0WIcR72UzEJS4yVFXdeAue950IPaRpawfPwuMb1V0pBFBnAgf
         YR0Ypt749WrqGtJNfY2r/4ZvqOkSVPAdaUu6HoA7/QjWI1PX+R0eOvbVxRgBiP+RvCHv
         J4eOPeYPf+bI2tISY269qHc6RvF27mI3P4IGrko3ZpeYoULvUZqbRhNRTSeWjkB0K39K
         8yaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334919; x=1733939719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+NwRdnPeGyLdeW8vUheYvwrmmGsNozJQ75TO2JAWes=;
        b=skW/BggBSPo8SjP1n6lyGGv7YX3nMkc4A4FdtCLaqsXnfzdecKUYoqQ1jLC1xGFfcB
         7y+1yib9/hU0ZrxwsZFEn+rff8AlJCod+T1zTzOjTi9V+mMsVPMrIcjAip0UVmj5Dh/L
         OAPfxrpmO5tYa5l31eriFT2kJxLGIq2hdzirjS2I4jTvTLrWD+r0or4skNGyj8+yOqFF
         Wuxi2TIjAFsC6rUPYb13/OJu3//1sDKLXpnaVbmGUFGI6aN0oFfkMlSHcVogdceptBCb
         Ii7huVPrUxpUMJmDspOZ40YG0faVRxrcHWL30MZmaUQp1gnHIMKDcsqVPMIbYSdTKZ/4
         hUbg==
X-Gm-Message-State: AOJu0YxUSoES3uUAqBmXWj5t9e5yIPESK9FdjhP+pIUG8TWlAdHohuzA
	uKgwejV62ZPB64oFFaM2yNzfV/Cv/LzlrVlbfGrkhqqxtQ2/RGOIoLtozHrGsjsTiHqTOCECpx5
	/
X-Gm-Gg: ASbGncvBAO+/hrViSUWImlSybMdGkprwr8E6+WXi+QpuKGfg4ndoBEytib98+SYYfI6
	gNEd19x5oLgZJDqR5rftuP/5Mivmx8J7EmRuPnkBkKn1dPhkUwoTSW5QxiW783tDsmKpDKPD0/w
	lErw8VurEIedMiY3mFEKRNmTPaP6DdT3ZczNbwFBtbEBeMiCcedyNEVsCtsunhjJ2b+CIXCH0X/
	k4rizUuVwF8t77S2qrw+hESzAJwERz6mTUiHFg=
X-Google-Smtp-Source: AGHT+IEnfiyQHn4UWsOngR/N/wAvc2NunUtzSSlBKehY7Wwnp1+BmWvJWvTj0LiBdePOynlxq0+KbA==
X-Received: by 2002:a05:6870:e310:b0:29e:2bbd:51ba with SMTP id 586e51a60fabf-29e88560cb3mr7888310fac.9.1733334919478;
        Wed, 04 Dec 2024 09:55:19 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.55.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:55:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 38/38] resulttool: Improve repo layout for oeselftest results
Date: Wed,  4 Dec 2024 09:54:05 -0800
Message-Id: <e42b6a40a3a01e328966bb5ee1bb3e0993975b15.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:55:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208321

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Having all oe-selftest results on top of each other results in a large 640MB
json file which is hard to use. Split the results out per machine and test type.

This also stops the toolchain raw logs from overwriting each other meaning more
than one MACHINE is preserved.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4b890f04bc7d147b4a11b824a84f3d2abd75ac54)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/resultutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 760e426de0..b8fc79a6ac 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -34,7 +34,7 @@ regression_map = {
     "manual": ['TEST_TYPE', 'TEST_MODULE', 'IMAGE_BASENAME', 'MACHINE']
 }
 store_map = {
-    "oeselftest": ['TEST_TYPE'],
+    "oeselftest": ['TEST_TYPE', 'TESTSERIES', 'MACHINE'],
     "runtime": ['TEST_TYPE', 'DISTRO', 'MACHINE', 'IMAGE_BASENAME'],
     "sdk": ['TEST_TYPE', 'MACHINE', 'SDKMACHINE', 'IMAGE_BASENAME'],
     "sdkext": ['TEST_TYPE', 'MACHINE', 'SDKMACHINE', 'IMAGE_BASENAME'],
-- 
2.34.1


