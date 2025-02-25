Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56ACEC18E7C
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:32 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.9034.1740493829435648234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WFBR9YKn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-220c4159f87so81012755ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493829; x=1741098629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pjr/E+df1iHcEX31xK6ri1BSMrCEZL9GB0FzGd2JviI=;
        b=WFBR9YKnwOCqKCI6kJ66nnD/19y1qWGgditvw3PCTyECaE6jsYsPW+2s4fyoBTjfBc
         y5BWSeoHwft8PILdHRMQKMVvcMNchn+xK9Rd7wpqjLvFNGVybIEGSCMFxRz35thPcLAM
         CmfbBqFsKl40jXdMYai0ce4wsryLV23VZQ+72OGHl2NPHF1RMzyYaX60gu7svrd8GlsJ
         gL6sWV3zzMkN5OuyIQy5sOcQxOkF9lvxEAS41aeNr+WFGo9D4uhOYErhCD5/NOw7uoqK
         8FX33TavR+EV/JDTt1gmckUPYA/ibfs0WOtmVxSN/sKDUxtM3VFwlINlDh9YaY2J5z+x
         i1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493829; x=1741098629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pjr/E+df1iHcEX31xK6ri1BSMrCEZL9GB0FzGd2JviI=;
        b=Bvd3Y3WPrVu+ALPfZjYWJqVeSbDoxLhO/G1t3fyDirLhZtNkVXDi3suygmFB6uz6Sf
         KINJsEmKybrUh2ewxOd4d9gjLtJEdxt40r2MCnNYYD3z2Pid5rjuO5up4q4/kgmJXQ6U
         6vxqi76inm0lzaAGSx9uHPc05bLT6C2m+/WEBj7sAf8SrLeC7hCLZxgTgg8id00nx7LB
         ptdnemZ3Tsx8J7plO+qLkxJO7nX3/qhheSF2r9ZQ3zsxaPTxWUF4vrmhrKcnUnGilqFo
         OCNmkEBlup9b1hF2XjMaEVzC2YB3Upfn/0hLpuMk33naqq8nYu1rqRmy4fhxQ+97cHBo
         6p1Q==
X-Gm-Message-State: AOJu0YxkxcNFP6/aEFGYO1tCgd+uDijSOSFwiI4/BIkLKiX7S3CjysAg
	Psa8XGIF6AMqibV7enTB9Tgnf6Gsj962IevtwC0EHFLowKBHIwV9Omo2v3eqp/qyVrSXTR6Nxdr
	6
X-Gm-Gg: ASbGncsJ9uNFt2a8HqpJWp2/Ri5bODrsHTZ7poRuLs2nEgJTIJVN/51Ym4xdpc0ug2g
	/ok4+vVn2HJ+JhowKNaIn2C9Na5MmG9uB6IxmsPr+HajvbvGQ+DV4QQ85cp26N5yhig3p6o4H9W
	Ajh6GEAhp3YPf+KCZfeyTfY3nGwZs2snuTAu/9FYaftnKvEbvEHrJoX1mTNxM1g4UjHDdb079VA
	E+NszNy7Gs2lFqjOw4KiFNpluaoqGurYjJOneoaRRN9gqrF2NdOfxcvqTd2togy0kbIa6Knmj7J
	ZyQscQwXdALQSrtEaw==
X-Google-Smtp-Source: AGHT+IEYpKR50NUTUVYfjRXUnEAsnHZ4ZiY0okWyoUpSxHest9ekSau9NvB0QH9NSBEPqohjXMKkmQ==
X-Received: by 2002:a05:6a20:9e4a:b0:1ee:d631:fead with SMTP id adf61e73a8af0-1f0fc247ff1mr5805160637.19.1740493828658;
        Tue, 25 Feb 2025 06:30:28 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/22] ffmpeg: ignore 5 CVEs
Date: Tue, 25 Feb 2025 06:29:50 -0800
Message-ID: <220a05e27913bf838881c3f22a17d0409c5154a9.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211900

From: Peter Marko <peter.marko@siemens.com>

There is no release which is vulnerable to these CVEs.
These vulnerabilities are in new features being developed and were fixed
before release.

NVD most likely does not accept CVE rejection from a non-maintainer and
non-reporter, so ignoring this CVE should be acceptable solution.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index b5b11496f4..bded23bc35 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -57,6 +57,24 @@ SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a
 # https://bugzilla.suse.com/show_bug.cgi?id=CVE-2023-39018
 CVE_CHECK_IGNORE += "CVE-2023-39018"
 
+# There is no release which is vulnerable to these CVEs
+# These vulnerabilities are in new features being developed and fixed before releasing them
+# feature (jpeg xl): https://github.com/FFmpeg/FFmpeg/commit/0c0dd23fe1102313742092c4760596971755814e
+# bugfix: https://github.com/FFmpeg/FFmpeg/commit/bf814387f42e9b0dea9d75c03db4723c88e7d962
+CVE_CHECK_IGNORE += "CVE-2023-46407"
+# feature (evc parser): https://github.com/FFmpeg/FFmpeg/commit/34e4f18360c4ecb8e5979cab8f389478d8cd7819
+# bugfix: https://github.com/FFmpeg/FFmpeg/commit/4565747056a11356210ed8edcecb920105e40b60
+CVE_CHECK_IGNORE += "CVE-2023-47470"
+# feature (jpeg xl): https://github.com/FFmpeg/FFmpeg/commit/0c0dd23fe1102313742092c4760596971755814e
+# bugfix: https://github.com/FFmpeg/FFmpeg/commit/d2e8974699a9e35cc1a926bf74a972300d629cd5
+CVE_CHECK_IGNORE += "CVE-2024-22860"
+# feature (oqs audio decoder): https://github.com/FFmpeg/FFmpeg/commit/7ef9d31071021c05e6b792af3f25b7b9ceaa9258
+# bugfix: https://github.com/FFmpeg/FFmpeg/commit/87b8c1081959e45ffdcbabb3d53ac9882ef2b5ce
+CVE_CHECK_IGNORE += "CVE-2024-22861"
+# feature (jpeg xl): https://github.com/FFmpeg/FFmpeg/commit/0c0dd23fe1102313742092c4760596971755814e
+# bugfix: https://github.com/FFmpeg/FFmpeg/commit/ca09d8a0dcd82e3128e62463231296aaf63ae6f7
+CVE_CHECK_IGNORE += "CVE-2024-22862"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
-- 
2.43.0


