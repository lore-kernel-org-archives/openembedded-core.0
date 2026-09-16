Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB4BFC88E75
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 00:44:05 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4579.1789519441611675131
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 17:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PxVZvMuJ;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8674704dab1so433628b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 17:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789519441; x=1790124241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZjtJ/L8EAHhiRYYFq5QwpvH7azXz2lfbybh8BNEq4A=;
        b=PxVZvMuJ/t3g/GlLEfox0x29lUdfC77N6TVaOSYBFNHVHB2jtLYCBVzYkp/vcjaf6E
         g4jMxRzs0J1AGnvm+alghHfJ2hcRAVtx8s9m8BXOZFvTR6VQm/vR8lflIp6y91NJQe2n
         c1qp9ErylhojuUnLcY0Bpr0l8eI1rAXhkkOvoFas9O3ekDYqzTovjkrQ/EL2D315/GYk
         kycWe7E0aJXpnGfdmX/Oa+ATx31X9gl2zEsp2RbWdM0JM5+vFeT3giZblCACugDzyvJZ
         W4Tg+L7C7rorUrezT8rjHa2y14QnDuRXoYGPPgW8g83p4l+fehu+xrrzuiIMzcnKyavu
         Xuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789519441; x=1790124241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZjtJ/L8EAHhiRYYFq5QwpvH7azXz2lfbybh8BNEq4A=;
        b=n6J07Nms4TJZgotliLxyWquiWMNNKw7hNcBMZzvhz++SwgesR8039yYbcBXlOyPED3
         ApMQX7LhiM7N05RqHwsxw1DVSb+2Ils22SzzwKzutxnoXhWH8ufacNPC9w2ChMwpY3Jv
         w/SKzp1fxnmWtNv7OeWE3LvleZ4mTtTy2EONmuDhgEh9LQ0pcEpEi0BrfZFIVLQiyIbN
         p5xqkChELGiQj2KxbgWRF74koxJ5OWktC9IqLrAkDSlXILl6Iohn1NyhRVaKMOkm4og6
         RjNn4c7wurQ2IrrtV7GjCK4U5CZy7FZatvBPddsmqHEnOx4TBKlsLV63VTOe1WxwLFpq
         Egmg==
X-Gm-Message-State: AFuF++kjMVRnI528b06AfsJxtUDN9rpybCHVJI0j5W1aA9SGhM1GqVg3
	0urWSKRrBZoTJrveKZsOeSMcJRMx9GeUZL4O1LHPD50NxUMqMjRPpzM0aBn6LA==
X-Gm-Gg: AYBFou2Gu0zn5Q7TdHXRUwzeANlS0EiODKCirDz6AccfQOb+Wt0resV/ddf/6BSHyqc
	Ag7XgeXldZ8e1dVt+fxpMqgqhB/owDbYXhzPC8C4xQ3KgOxJFyIHflVfgJiEZkIXHLl3Jv9zmqs
	6yBgb9y+nIMPvkU4kv0nOxD/SJFU5QaXHLpvU3DyYMZ5xc49/kJRnIfD4gTCAxOWXlhU0DXa2Ox
	jUJwpmAvUSaMiueqdmIS/E1CDx9EXwCcb/qilfrRvaEFm/daPKFCIz6E+hxfp9mBzNWRHqwv07o
	q5E8KYpFQQHfFveKAAQiZo0CIRvYYDGFFBWL/fV/am3Cyg5xKb2rAGrY3tCPmq9gRtUSqY+MdLb
	RdrmCVShxPxIs2kVTkFwlck6Y1JPoD3DurIg98o74Art1L4LsMFdMAggsjAWpJeuBsrJ3nuUnyo
	jz1U70sRwjbZay+pMfLw/tX7qyro4GoY3aVoiAlZ89Nher7OO22pL0pRZyblqE58hYQMvlT899p
	oS48jGMziX5AdXCgi3o00I=
X-Received: by 2002:a05:6a00:10d0:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-8723cf31d94mr773413b3a.13.1789519440925;
        Tue, 15 Sep 2026 17:44:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87200c58265sm314134b3a.14.2026.09.15.17.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 17:44:00 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][wrynose][PATCH 1/3] ffmpeg: mark CVE-2026-52295, CVE-2026-52296 and CVE-2026-52297 fixed
Date: Wed, 16 Sep 2026 12:43:51 +1200
Message-ID: <20260916004353.478934-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 00:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245910

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

CVE-2026-52295:
Debian[1] identified the fix[2] which exists[3] in the upstream version.

CVE-2026-52296:
Debian[4] identified the fix[5] which exists[6] in the upstream version.

CVE-2026-52297:
Debian[7] identified the fix[8] which exists[9] in the upstream version.

[1]https://security-tracker.debian.org/tracker/CVE-2026-52295
[2]https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/016a241102250372a9c2e96f6e8dca67ec01d3f7
[3]https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/ff43ef5219ad543e57ed56d065e9d4a3b0426468

[4]https://security-tracker.debian.org/tracker/CVE-2026-52296
[5]https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/23227a444de4a8f7696f46660cdd044b460f7e47
[6]https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/d18354f8d4bd018eb486d18079ff0afb3b84c506

[7]https://security-tracker.debian.org/tracker/CVE-2026-52297
[8]https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/8439e0203744a30d280668fcd086f74ed5001da1
[9]https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/ebff1abbad8b036bfc0f52a4785433b06e865e3b

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 8a6eb4eb86..e84a29ac87 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -185,3 +185,6 @@ CVE_STATUS[CVE-2025-59729] = "fixed-version: this CVE are fixed since v8.0"
 CVE_STATUS[CVE-2025-59730] = "fixed-version: this CVE are fixed since v8.0"
 CVE_STATUS[CVE-2026-8461] = "cpe-stable-backport: this CVE are fixed since v8.0.3"
 CVE_STATUS[CVE-2026-40962] = "cpe-stable-backport: this CVE are fixed since v8.0.2"
+CVE_STATUS[CVE-2026-52295] = "fixed-version: fixed since v8.0.2"
+CVE_STATUS[CVE-2026-52297] = "fixed-version: fixed since v8.0.2"
+CVE_STATUS[CVE-2026-52297] = "fixed-version: fixed since v8.0.2"

