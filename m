Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00C1E69199
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:36 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87694.1766434113903595250
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DsRVDBmM;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7a02592efaso624260766b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434112; x=1767038912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+Cgug9tlJZ1uB0t745uSi6mdIcoGRj+VHz647IozlU=;
        b=DsRVDBmM5iAUKwOhJrVKE6FHTrq+Cl/yw4GCw9PpUd9iEY/T+MehLk1w2prZtp05CK
         pxYUv6LgDLOvqs3gA+4iD6jpZ2HNj7oH+Q9Qrx3wMextUGKFcJjAi8rSLyb3MwwSwY2m
         lSMaVsG6Z5LFT0prUsu+FvC6J3ZMTp1CygwumHWBrTstCeTTTYFqKGy3vlsVfK5xyEKs
         2FUbd/5nemE+zCKsvaRpA54xgoOgGtFpe/wCAtn1gtHgW1BSVhPIrqLjL7YZMKOEsBjt
         oqREAcQG9UNop8RojhsWh2+QXGtJ2/wqA7gX8NT/olhCddyDnAeJ4FphBqWQiOOTAzbF
         Un0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434112; x=1767038912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t+Cgug9tlJZ1uB0t745uSi6mdIcoGRj+VHz647IozlU=;
        b=IvA2LvnyXL5Mo1RcCeF2vQ/nJYHnNYwnns4XglebroPHgWKNmRw2BMFEdi9BBEHn+N
         OqCmFFJPQZZ2Lr/LgCv5e+AD4m1utheGKhwy18fCBbmOEeBcIHnk7gL6up6iugmiD+g7
         xLqKgkYYr/2QrbNw9OahLREO5RjSGfpBCzILzV1VFAB+R6LoiWF5F9lW9SpHGGDg+xis
         DbGOozOrXdTXw74D5xku/mzieAmjznxOPByQPt9EPKdy/ncPZoY6orazOhAA/pZIEygU
         6QmozCeza0gqRDirHTvCqzCM/Ng463PXklMdJYEI/Kz+68kqVJixAIxlmNd1STXX+o7t
         HGpw==
X-Gm-Message-State: AOJu0Yz5a4I0AunMeJOt+R9Z+OkIU+7dOEu4pv3sNSaCwhYK1K8bOot+
	5AnaMQ0y/N8lXtWYIyCzKvl8BK9F1FVdvBemATaJo9Asdm45ZJY/8q2MVa9LVQ==
X-Gm-Gg: AY/fxX6ZQzbMi9oDDUQTJ67glrp63ZhLu5PQ9Jh34RPSuWv//v4axj5lYL0oeZKqpym
	KzoYTVi2e+2+0qCHgbEYjKYBxJwN+lp0lN0SQpQlAlB/f6rrULWJv/vim/P9QwJcFt6vEM1Ipu8
	RzWLN+qIcGMuPeZRuKQAUvIpBMImLC6yT+b7D30JzPmTLffKMc8QtkA70dd6oqtun9Yu7iU3Gab
	kwkc6Ph3Fqb6jiCgvHJJ8v+p52jbeFunCJSfOEcM3+tuqiT3LeHUse2q2e1TZV0ataLMTYATqtJ
	5feqCsKWP2hw3iGCPIKbsQJ+piAVh/svOe3iaRWN3QkbBACkQf2lT2981YkU48ZMm37xmCRk98I
	ZjLEN6e06EWQD3ZQHWDTSJ7CpS+QXbzHf9yO4vzc+w2ZFa+l1ClwFMz0HIiqzQVYUvuB0Nah6XO
	zzdlx+hnii0nG7kWVhdrWD/C4768EcFtp8HSQaJt4yojFXdQo=
X-Google-Smtp-Source: AGHT+IG4BQ2bun9N9/Sv1szwZwgPmTRX1Ye9gOFso9iFZx2E2kvUpcfc2efdBJbD+jkicAY9CXpP1w==
X-Received: by 2002:a17:907:3e14:b0:b7c:f831:6ac2 with SMTP id a640c23a62f3a-b803715344emr1342422466b.30.1766434112143;
        Mon, 22 Dec 2025 12:08:32 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 067/114] python3-pip: upgrade 25.2 -> 25.3
Date: Mon, 22 Dec 2025 21:06:49 +0100
Message-ID: <20251222200739.2278706-67-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228392

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-pip/no_shebang_mangling.patch                | 2 +-
 .../python/{python3-pip_25.2.bb => python3-pip_25.3.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_25.2.bb => python3-pip_25.3.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index 7f15e9c0da..c71b46bca4 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From 6adf47097928ee3bb1b02c204126ed923faa7446 Mon Sep 17 00:00:00 2001
+From 48fa8ab5e68b0e349d988ea45bb6a8e2f9bf8fd3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
diff --git a/meta/recipes-devtools/python/python3-pip_25.2.bb b/meta/recipes-devtools/python/python3-pip_25.3.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-pip_25.2.bb
rename to meta/recipes-devtools/python/python3-pip_25.3.bb
index 350092d9ad..bbc70e3eae 100644
--- a/meta/recipes-devtools/python/python3-pip_25.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_25.3.bb
@@ -26,7 +26,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "578283f006390f85bb6282dffb876454593d637f5d1be494b5202ce4877e71f2"
+SRC_URI[sha256sum] = "8d0538dbbd7babbd207f261ed969c65de439f6bc9e5dbd3b3b9a77f25d95f343"
 
 RDEPENDS:${PN} = "\
   python3-compile \
-- 
2.47.3


