Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F35C433FE
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:17 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.6550.1635842596569819159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AKCRxq+k;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso1510999wmf.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KRyUQ7nlKKvXfmSxWl6Ye9YM6HkoPskht0hM2Kj791g=;
        b=AKCRxq+kAgIRkChx5fivM9YJ3+W7907ACOATkrC+7zYbFnitOreFzpGJhjUahaQVAc
         wZOJ4e7RESqdKGmHn7tlvKtVlx5sPKdat0e+m+67jcCItMc2GoCWUDn3HgpZFHz4ZnKv
         pzYHR0IS4kCnueb89xQr6+Ot0JKpP5fNEaYMsYyB5ewYJxOARtuSeyqIrw+6CUSSyi2E
         HtwwsWJOdzuEcZ/RJ7DImry4Q3EnsyX0Yx1aamz89nPZ7Swin9fy9d3V2O5q+6l5DX38
         CW/XSVQvh6z5u1ZFVIGtRKQkVFq+XrwyQoFey2DjMXZ3EXOT27w9sM1pCac3BbzDTFZF
         UAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KRyUQ7nlKKvXfmSxWl6Ye9YM6HkoPskht0hM2Kj791g=;
        b=ZT2lSoO5F2mA+AqA97lBGW3pE4JMHbnUi8jV9jerHRU7DKXMhxdXXFsx4QsLjiUK57
         xqokm0dB8AcqknRlxto95mpewV1wTssWrbuRf1JDudfouc/CO0nwS9Hqt0VHzb4vSSUP
         sQz3cZXGaWpy7F3LghMzykVS9VMXTXaBb9yuXV3G1OWVnW1z/41dshShdYuPqEBZtlPB
         QoDleiQOA3LMtzgu/VJYNePFjHGk5wES+hq+Q5ebC6p1mvNOpml4LqJmUGxNrH5SvckR
         WBhabsRRGvF8xO6MNVc7FOZ+nIJRujRNbEM7SqvHupMUfWjSehuEGrO8DaN0mpfJB0PN
         txBg==
X-Gm-Message-State: AOAM531zNZCxj3pdmp6mhIaDgPZnJa9VeioDOfw6FzQhxxVild91E9NM
	eaTT3mx5X4UjvuVkFKJWvqFJ8zBcjMw=
X-Google-Smtp-Source: 
 ABdhPJxuMPYtp024ukHXHU5TVfAIsOOjTVF5EClsBubyftz0afJayCJrjOiAGsIg2WeUgdzgK5VqfA==
X-Received: by 2002:a1c:2047:: with SMTP id g68mr5493064wmg.181.1635842595235;
        Tue, 02 Nov 2021 01:43:15 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/33] puzzles: upgrade to latest revision
Date: Tue,  2 Nov 2021 09:42:46 +0100
Message-Id: <20211102084303.2974802-16-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157754

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 1355630cf4..8ac62d52e5 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "ad1c6ade2af0e681fb964a17cc3a031951047068"
+SRCREV = "640f9235c79cdb1a924b0148cb312b0f02253364"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.20.1


