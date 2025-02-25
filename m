Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC85C19777
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:32 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.9099.1740493830696998199
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3P2be8u4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-220c8f38febso119819735ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493830; x=1741098630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+sDEG9zXeCPgCIPhtfWn0Td5h6445l/lzmrwUEHiLxU=;
        b=3P2be8u48bXtDjLglTIKxdEaFy6o9tbiojRD5mec58VEzsdNiJ6rShSuZkCrwDUkr4
         mZh4kZ8r/HVLt6oaZPrav6A+yK7KMcqaKeEt9E/WYkXlPjMhNDajhcMeXpsGFq3b5F7a
         PO3vbk7KLDCCE1wmxvipe/46nfSqWi/W3ERhpt7FSERrPrkVs+L+KhvzWgPeyt9TLZoM
         U1Pff7BjXfuP0vnCi8PdJu5OoOIj0iJom156Vyas5aP9xoVyWENXmUX63lE0a68Vya1C
         /dDv7v3CMmpRQ9dNNVDmp8Nw7Vm+x8G2yGfZo/7m/C4ciOjsvlz2JRAQsyAS66snk5JO
         camA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493830; x=1741098630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+sDEG9zXeCPgCIPhtfWn0Td5h6445l/lzmrwUEHiLxU=;
        b=XsUrwDgtu+qAuFU0otx1+uzMOpMDkaDKWKYfeDik5fYPNzvBxr2jouageU2/Dql/o2
         1BELOKoBsN/TaDCjeRd+6yfoOrU/QI22B2IhDt7xxAD4SjpwCgScrLoN7xnOM5N4wSDB
         WVr6Ad1dshXL2kcKuAzE50j5JaQ0t1S8il4hGTcvXHpeGWcvT/W4qsu350nmB1Z3dfRZ
         ieLBlArl2Wu0cJXvXWkLlfRiRk6GBc4QKQnv5sBCxtyNQcplHEM6uuT9zxj02jHNEH1E
         cr667UULAz3Dj6GZ4hVLSwmA8CooyA4GN7kmNUaEz515NwOqvKT8hORxIbxKEvgLDdwy
         x3yA==
X-Gm-Message-State: AOJu0YzONqRUGFddQ/pvj9ZIy8GjIu3qvzXd2NONxM5aZuRNQBlWEzGs
	bMvX7RweQzqqBe5ZSr7w3eflfP5Rf708h27GAdmNaBKI6Gyw8/NcrckOydp4wiuUwqt6oAYs/Ok
	/
X-Gm-Gg: ASbGnctIbqBJYGh7gtUTVW2oMByXrXS8Jl99fC2dtVebn2eBhH/9mL4fIdThvIF0txN
	Ht80W2DlW9UOVfESnlfEPLRMjNNG0KPTx2eipodjC17UtgK6UKUdqLkMdUgwxr+DdhZmd4aQ/aX
	l8DJSqRDBYuD7A4tvhX9T01u1WvMx8w0W9WWjaiwlegjUnkFaCTlBz/waaK/1mnXlE9ucuIvoxR
	0HGeZKrmbWDG1Km0RTrXczAPmHln0b3AbJnBKz1ot/RQ0X8X85T6FW84zQDnHguppQNG0GgX8sJ
	v57+xr83RvCCrwfb/w==
X-Google-Smtp-Source: AGHT+IFrHdAN3EwCqMk4+/dIVVhg8dpvmY61sPyCgn6NQbxFEKQL3clpgS9eL+nx4eXg99NNUbqoXg==
X-Received: by 2002:a05:6a00:92a4:b0:730:9446:4d75 with SMTP id d2e1a72fcca58-73426d77e8emr23193680b3a.17.1740493829997;
        Tue, 25 Feb 2025 06:30:29 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/22] ffmpeg: ignore CVE-2024-7272
Date: Tue, 25 Feb 2025 06:29:51 -0800
Message-ID: <ea6e581067cafd5f367c68871bc312d3ba11b4da.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211901

From: Peter Marko <peter.marko@siemens.com>

This vulnerability was introduced in 5.1, so 5.0.1 is not affected.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index bded23bc35..900545a5f0 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -75,6 +75,11 @@ CVE_CHECK_IGNORE += "CVE-2024-22861"
 # bugfix: https://github.com/FFmpeg/FFmpeg/commit/ca09d8a0dcd82e3128e62463231296aaf63ae6f7
 CVE_CHECK_IGNORE += "CVE-2024-22862"
 
+# This vulnerability was introduced in 5.1 and fixed in 5.2 (backported also to 5.1.6), so 5.0.x is not affected
+# introduced: https://github.com/FFmpeg/FFmpeg/commit/8a5896ec1f635ccf0d726f7ba7a06649ebeebf25
+# bugfix: https://github.com/FFmpeg/FFmpeg/commit/9903ba28c28ab18dc7b7b6fb8571cc8b5caae1a6
+CVE_CHECK_IGNORE += "CVE-2024-7272"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
-- 
2.43.0


