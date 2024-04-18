Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38904C04FF8
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 15:56:09 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.2244.1713455765463326742
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 08:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=OgSqm3Xo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.176, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-de45f3f092bso1315282276.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 08:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713455764; x=1714060564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UfWTS2aVfCalVPoPgZ8FTTo310S3vdHobF856+zdgs4=;
        b=OgSqm3XoKj89jakC3vlX4uDkVnwch8wDP46r4MujNfCFOjivYz4Xcpg8jpSPUEZWjd
         4LQQ8DHNSAZ+dIwXNHAdNlBI7/zmz1MtCGwe8K7rEejKBhDDFhuERERspOulLo4UR6Ba
         3s6IN8al08T9hqP6d+yU6d9jZADgBpP5O3wDEybNiVHeL7erGUhSDxZff9wHPnG5Y1ac
         1yvX9MpHx60uTCW47/3jB1ZksO9q8tPk7Ruv8n9+hCk/mvGa+ei+2WZDIFoVZW6D1S6z
         ffVMW/APVzZZcB8CcY6w1Gr/cJ5TIlLYy9UezbaXLfgnjkrjzJWQjST7ZF9FGgJBbNZF
         dERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713455764; x=1714060564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UfWTS2aVfCalVPoPgZ8FTTo310S3vdHobF856+zdgs4=;
        b=aO8R0wndxjF7XbBH3EPcAfsdCWFruGEe0vjPa8d1ug9ARv2eYUjOrOjfWNKcOLG2BM
         GhQ5Y6RR9Bkc2UDNNNoZGAwpxbNsRKzlWilsGjau1rGOmjjKckzvuaI27NNhMbieG19A
         fYvZ4Xr3ErEMEFp3tORb2gqzi/7a3Wkzf5YYr7v8Njb7NkR0tKWuRzXu/Z71tZp8lh3D
         WuqiAp8xMqlP+PX75MiGQeOloa0JGxjQ5DwmkKG2iB2zmYkqsXoOfN1ebhxJPcxOrcu9
         fy6JaOyJQnrVrc+36PAYni9sJq+8G8n+fq7QEu2gTTGmevnMoiC4exObG+uDVSumjKCN
         K1wQ==
X-Gm-Message-State: AOJu0YyAfgSAqMFIK88UDEXM0pgYaffJhmpYvac3nh8hR+Gkpj1QvuMq
	NVVo5jNSgto1bu60VTpEgq3amrsyAo7mRO7ClWhutVp7dMwuIpGd7kHrVUhZ1ZO8F8KstcSGfAw
	=
X-Google-Smtp-Source: AGHT+IHoqzwIYu2P4bteuFOoMxJIkn9rjng/iXyzyLqTXpeZTQjdHAx1wpTuqG+CsYSpXSAnuQV4sA==
X-Received: by 2002:a25:b196:0:b0:dc2:466a:23bd with SMTP id h22-20020a25b196000000b00dc2466a23bdmr3391805ybj.54.1713455764315;
        Thu, 18 Apr 2024 08:56:04 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id p11-20020a0c9a0b000000b0069b32845235sm757054qvd.85.2024.04.18.08.56.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 08:56:04 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cargo-c: add UPSTREAM_CHECK
Date: Thu, 18 Apr 2024 11:55:58 -0400
Message-Id: <20240418155558.3399658-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 15:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198520

Add logic to check the upstream version of cargo-c from the github
account the crate is based on.  Unfortunately, this is an inexact match
of the versioning, as the crate expects the cargo version as part of the
version.  For example, the current version is "0.9.30+cargo-0.77.0",
whereas the latest tagged version is "0.9.31".  So, even if the versions
matched exactly, the `devtool check-upgrade-status cargo-c-native` will
show a mismatch.  I think this is better than disabling the check or
having devtool return broken.  So, leaving this idiosyncrasy as-is.

NOTE: https://crates.io/crates/cargo-c/versions would be a better place
to get the latest version (and would match the expected cargo
versioning), but creates.io seems to require javascript and any attempt
to wget that webpage returns 404.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 .../rust/cargo-c-native_0.9.30+cargo-0.77.0.bb                 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rust/cargo-c-native_0.9.30+cargo-0.77.0.bb b/meta/recipes-devtools/rust/cargo-c-native_0.9.30+cargo-0.77.0.bb
index 8e17606b73dd..eaa51a8d2565 100644
--- a/meta/recipes-devtools/rust/cargo-c-native_0.9.30+cargo-0.77.0.bb
+++ b/meta/recipes-devtools/rust/cargo-c-native_0.9.30+cargo-0.77.0.bb
@@ -9,6 +9,9 @@ SRC_URI = "crate://crates.io/cargo-c/${PV};name=cargo-c"
 SRC_URI[cargo-c.sha256sum] = "ec77e3635cdb0d211f88f22d0460eef0ba031eb616ded57f2ffb98a90365c445"
 S = "${CARGO_VENDORING_DIRECTORY}/cargo-c-${PV}"
 
+UPSTREAM_CHECK_URI = "https://github.com/lu-zero/cargo-c/releases/"
+UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)"
+
 inherit cargo cargo-update-recipe-crates pkgconfig native
 
 DEPENDS = "openssl curl"
-- 
2.30.2


