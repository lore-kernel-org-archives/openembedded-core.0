Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8943CA0EFB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:50:15 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.4439.1755636612228896780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ljhMvv7C;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-244581c3b43so51036815ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755636611; x=1756241411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nlWZxU9CGKmgEN4Ffm8lPvBIV2e2WY0tcaVGGwX2zZo=;
        b=ljhMvv7CYuLpn/9Mo93bfHibGpA5Sm0JRIc4MQT32eurcUm5vOhPenZfXbv1ol0LC6
         K7XJ/mqZX1sxdDGREzZUxwm4aZfTpxkj9iOvw//+YPMmn2hXr35aTpTG1M6WNdZ4CqE8
         T28PepzpGMLGM+qXbbeFqL5whdbnuNxPaQ1yHMWsFntJwI3Mz/5gX2PL93KZ+ESCwdTj
         ZzjbuIfXTgbiPM/snyVDVwxFCNDK+Xv0ifs18Caikinqk1NlFlJPawvoGovSuxFtqw7y
         3DACkEdM2Osvo1BfzU4uyZinAb0z9GyhGva08YXZO5vNDIFDPDEx4sQrPkfgBS6YUFMr
         BSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755636611; x=1756241411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nlWZxU9CGKmgEN4Ffm8lPvBIV2e2WY0tcaVGGwX2zZo=;
        b=kqbAMJFGFrK8kvpxwdP0wDh8afm31Dm71DGMBDMj73xrOdLNVr9mMDUBUhGgQikae7
         isJfttde6Ay15cfb5Q7em/+UUeC6XbnGykElLN8wzD0OEK0qy7XYT0V1zA0/c3VqwM8X
         w0OYFbjP4IglPU+2wVXYeHH8LpqJ2zhs95jqVMiuc0CGph4qwkiI92p097asvZiuArlD
         zko+138bfSe30QlZEmbtFgnlCiDJqfL4xsohV0zouerT8qhC8dys5llDsN/0bxd2zHu5
         IpyrugiJcscDOSUNw+8SIy9oJ2Zfr8ii/a/7d+TsnS5BCV25seyuSjvW5OYTLXibliwj
         u5sg==
X-Gm-Message-State: AOJu0YwHM3UBSSC1QFmnRzdvnkFjuTVsu3DqaMU87JpcLR4W7aNkJXZe
	FXnSpe1GFt97wntv4I2OBA16NbaGeRYN1470SvxiEmtjZs5nNkTg3jWExaXPRBJ1YsKxcaj+2EW
	U90/J
X-Gm-Gg: ASbGncuvoKE60MyG0cooQuLm+JfYE3eQ6j6c6m118daboDOrztbTdJ5JLudcJ+ZIdad
	VUQRSnMOZrc5e3e6hSS1KJsHcgyUOPBWOiy6gGdjH6sgVgUIGt69Tvl273rneWDLR2ZwZrUfCiK
	ChbdKwKj+TwC2a5k5TmBPk2cMlkAxnm6xuTiUXx0LLmDrCrvXfGFJSToEF7y6yav92Xx8M1/Iyg
	0JVUch2pqHJlSfJ5U92E8JFT6FLiqVWOzzxqownL14jTLIX7qMef5f81tXFVQEenWip3yPlEKpl
	qoftCKNqfDdf2U2vN75VymymRp//jzY3LmwO5h6ZrWuhVIwswUaaWUj0qXCFEeSo0WVeI4X/5j4
	zfC1LKJsThQfLsg==
X-Google-Smtp-Source: AGHT+IF7BJfZB2Q7GiJ0CKLOmxFWna+6ScVXiEs1E7wiM0FKm7NRfCwnSif/n6xMtmbxqUCjsoDRnw==
X-Received: by 2002:a17:903:2985:b0:243:80d:c513 with SMTP id d9443c01a7336-245ef104189mr4563495ad.4.1755636611443;
        Tue, 19 Aug 2025 13:50:11 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33af50sm6179675ad.2.2025.08.19.13.50.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:50:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/9] glib-2.0: ignore CVE-2025-4056
Date: Tue, 19 Aug 2025 13:49:47 -0700
Message-ID: <8c69793deb78cf9718801825477938c22e229eca.1755636489.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755636489.git.steve@sakoman.com>
References: <cover.1755636489.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222146

From: Peter Marko <peter.marko@siemens.com>

NVD report [1] says:
A flaw was found in GLib. A denial of service on **Windows platforms**
may occur if an application attempts to spawn a program using long
command lines.

The fix [3] (linked from [2]) also changes only files
glib/gspawn-win32-helper.c
glib/gspawn-win32.c

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-4056
[2] https://gitlab.gnome.org/GNOME/glib/-/issues/3668
[3] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4570

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index 8d2c452088..31b6c1fe98 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -97,3 +97,6 @@ def find_meson_cross_files(d):
 python () {
     find_meson_cross_files(d)
 }
+
+# not-applicable-platform: Issue only applies on Windows
+CVE_CHECK_IGNORE += "CVE-2025-4056"
-- 
2.43.0


