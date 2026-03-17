Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106B6F55128
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 06:17:08 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69949.1773728224187442832
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 23:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DG6HbnSJ;
 spf=pass (domain: mvista.com, ip: 74.125.82.173, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bea8220c38so2533411eec.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 23:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773728223; x=1774333023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhHR53Ouh/AvH5HjM6/bomtaA2I31IUxaCcPAK3V4ww=;
        b=DG6HbnSJnyio/NsrQAuQfGtTRpE+VJ4Dr4TzW04v8dwK9ZDkUBUkADPanTAOKmDFPR
         5UQKnm9zYs/d+kK80yRmMumzQzy2b5NPF6A7Zq/mAYiK0DHV/yRiY9or6xsNHWWGtrN2
         FLSU1Huj4fKjfRDJeIhTmjarcKgpJ+OqgPzU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773728223; x=1774333023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BhHR53Ouh/AvH5HjM6/bomtaA2I31IUxaCcPAK3V4ww=;
        b=g7PXkVtBRn5yLNU+tgoKABGgQm5wNzeRiAPWPO7EmuW6sIdoHFhzh4pbA8IgES3aFY
         8SeYUuVU0mvmEtZtYhbsbI/tWgorS83pmP3asV10rf39nuSsKTUC9BGf/MqbQjc6ykUO
         hvERx5XqyO+vpVz3VekEhF9vtbkdktteE4gHsFDrtt1O9TyGPwSfN2Z6Ycl0yLn0uyoz
         gZp5byA/6LeZqaS/tFU3HfXXStXi/KVe9rl9EFMFlFO+6v/bCltxGrhPHCeRhKgKEHYs
         6+aYqjh9HOmizXWN7c7dAgF+Y7qrEiuAVN8vlkrso7SQcBqUYsE2DaqbgyQB5SGhzUMo
         NDcQ==
X-Gm-Message-State: AOJu0Yy/QZJh4iVq1bgfLJ8PNq1at2u254M5OZumwa+L1tJw9dzM8scQ
	GB8I3/nykA3DnM5/Aa96nlOYOh2yb9IQC4nac8pVVACsSdRamAibj/03bSHFo7Lk3K471pAHzzt
	83zMQ
X-Gm-Gg: ATEYQzyOaf+zDM5hwMj0w5isEPKBfB8mwWdBwqFieEuF4UwsrRkj/9ncPa6xWkMxAkt
	3vMlqYyqLmty4eNAODSDuKgAV0A3wQquMLCycUr9udQ98wKvyAJtD5oaijnwlFdQOXXA6kDn8ue
	R0L61kNcbFqnPO6v03qCQ80NHYW3KZXbZcR7IJ7ZPv29ZxhP2XCfNAqWGhlau/82q+eHteF4pcy
	MziIBtxXze9DOHuhA1HNlJ38rvCudJVtsA3MV8SwNasFksFKlgNROeQ0BwICalg6bJECc//Jba+
	r4RllOmOIK2j29Yi9aKbxCrw6YlPa6/NQ9E8HwFG/rvIsO9qMsNc2lFr54VybXhR9lmUTQs5+kz
	Hvlq7j087FS+ZHR6ZNypBOynoYAi9vvt6xF8jh7oMUf+X6r3wajOlAmhHOJ6nYaOYzVO0LNMYip
	AIF2JdcQDG5wKgxLhyN2COOqIXzGTH4zWwqzUh
X-Received: by 2002:a05:693c:2c11:b0:2bd:d5d8:537f with SMTP id 5a478bee46e88-2bea554b31fmr8148986eec.23.1773728223259;
        Mon, 16 Mar 2026 23:17:03 -0700 (PDT)
Received: from MVIN00013.mvista.com ([152.59.0.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3eec8fsm17788437eec.13.2026.03.16.23.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:17:03 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH 2/2] vim: Upgrade 9.1.2128 -> 9.1.2144
Date: Tue, 17 Mar 2026 11:44:05 +0530
Message-ID: <20260317061405.278524-2-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317061405.278524-1-hprajapati@mvista.com>
References: <20260317061405.278524-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 06:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233300

Upgrade from 9.1.2128 to 9.1.2144 to include the fix for
CVE-2026-25749 [1] [2].

[1] https://github.com/vim/vim/security/advisories/GHSA-5w93-4g67-mm43
[2] https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa9

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 0ce6aa71a4..7a7bedf863 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2128"
-SRCREV = "392b428d1239e963020b73682cd03f17ffb538b3"
+PV .= ".2144"
+SRCREV = "55c12373f073bacfc97d757e8f4da3daf472e4ac"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.50.1


