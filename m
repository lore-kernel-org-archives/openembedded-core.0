Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA16BC83F04
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 03:12:40 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.15027.1751425956024567388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 20:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hs13Ve1l;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-73972a54919so3813043b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751425955; x=1752030755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUMZBNJR3atkrNpzC41juF7UfLgIrL2frcer7Lj/L5k=;
        b=hs13Ve1l69smpzTw8teklWc5ZQWgHonLR7CgUMWi4IvdwkISRs+d4NCfX1Dd+sMhTY
         D4Pugt4njCfjYn7lETkem+Kvz9E3aVr8N1O8MJSiYkduMTBB4j+BbVAbal53WdL3gkxT
         /yShV2Uz9zAL+gdc+S9bo0vdg88VJuTogH0KYaSNkdNUQD4YsMAm8ohX8fLc3g5mGXKJ
         Cso7l8DkILYc7ZaH7xjgNom4CAS5HAgWm7Yfpt/Oos3V2qAAXcgAb4L2qNM2G/QOHi+R
         YtbwWZ+XOWyBjzYTu1HHQWE0uoqKcQsbkl++cOnphKwqUGfNL33tpQXX7eCdMXZ8s+Tu
         kz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751425955; x=1752030755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUMZBNJR3atkrNpzC41juF7UfLgIrL2frcer7Lj/L5k=;
        b=u+lvQi8SxDzakCmdoTHEf9A0hQ/FnRvJiD46nFkkatGSuqX/hMairRCV/ajvtmMG2O
         GPL1gatl6pFYCvHLxSw+ctvD1uga8BGDaGafVDow5as7r6Yt8SaZOrVpWyx50vgaa18P
         BtiHb+1893c5nERhtekg4jE9nrXwhWD60oqs4P0B/jXiEdXfbQgjNzVoUAbGFNMoF9Mf
         u2QoieIa4iLKAYDlUQLMN8rLTdyMFN3nNVyAHudO9Kn1c3e253iGl/IwCkieBYzwS6p0
         pwJ4ejI0hUhHgAvLfnFFHOskIdljAOe08QPPkoiXrKPEaWPBcPf6o7xlUsKkpatPGTad
         WnJA==
X-Gm-Message-State: AOJu0YyDZN99OvIAepqBK99gfaue71SKWoVQmWN9u54JSxK9oRwQZNPe
	mh8bPpEcBjIi9gH//4de2o0K4IeVihzHer+5f4oh2SgQysVOIqQbiS1qJtmidnoy/DbDf4cVUcM
	UfFt7
X-Gm-Gg: ASbGncsIOrndzumuVp0vy/v8Ua6vLEjPBptBBw5u8ces7q2trsCrA6394A7BTiP9q2R
	MvlNm0IlN6egpctfdbu3zfT6PFLAjBtnpgDj9N3iCKKRZyhT3YknLdk8Jx/zGzhIQhtN7eL5yJM
	ftd8EDEACLeLJgc+pXyRJe5h/WxIjPlPXHgethN7nVdfFqZCCOPjxaY+Ky6uNVF0x3UzpUZgIIb
	auUykaAEn2WrJ9tJ8UvwpKZhTceQG20wG/ieHHa+QHF6OU/H2ercxH/IEvcPElF7fCfeBQ6l2p1
	YjOQ2goxVD/310KhZUDbfMcNUHedvnMuD3kDnl7411CJ+NGl7u8SqA==
X-Google-Smtp-Source: AGHT+IECMjnH6QhgV8cwP13VsFBT2k8min894R0OEZr3fBl4y6ByVTfPtnod2vDcOZCQc4iHU0zibw==
X-Received: by 2002:a05:6a00:a04:b0:732:2923:b70f with SMTP id d2e1a72fcca58-74b50f29ff3mr1440804b3a.11.1751425955003;
        Tue, 01 Jul 2025 20:12:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58069a9sm13633241b3a.174.2025.07.01.20.12.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:12:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 08/19] linux/cve-exclusion: do not shift first_affected
Date: Tue,  1 Jul 2025 20:11:53 -0700
Message-ID: <1cbb0103bbf5f567ceeb01abb48869d29f74be1d.1751425749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751425749.git.steve@sakoman.com>
References: <cover.1751425749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219762

From: Peter Marko <peter.marko@siemens.com>

Stop shifting first_affected if backport is indicated. This does not
have effect on generated list, but makes the logic cleaner as it will
not shift it to "first affected on our branch" and also make it behave
like in defaultStatus==affected case.

Cc: daniel.turull@ericsson.com
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dc1ecb69389dd79354084757ba6b9af0781afcc0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/generate-cve-exclusions.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/recipes-kernel/linux/generate-cve-exclusions.py
index 5c85c0db88..302ec8ebc9 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -69,7 +69,6 @@ def get_fixed_versions(cve_info, base_version):
                     first_affected = v
                 fixed = less_than
                 if base_version < v and v < next_version:
-                    first_affected = v
                     fixed_backport = less_than
 
     return first_affected, fixed, fixed_backport
-- 
2.43.0


