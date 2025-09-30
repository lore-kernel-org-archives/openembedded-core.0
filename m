Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A67DCCA470
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:43:59 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.21301.1759225431083923908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=d+yqEQQN;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e30ef74b0so39485035e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 02:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1759225429; x=1759830229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WNcMKBudcKBmwe6dseVPIyowpJrXUGlMUvGZxEI6Xds=;
        b=d+yqEQQNwA2NC0p0Kd0CHqvwgVLqxDF663z0eFGM0TFHc+P4Zd3ILI8UxVYZhmGQ9Y
         wY4zc7hYhPl2MHCcU+nO3FsL6IjMgoWREILBVsxDgaJLUkBF1ohAHSPiFvg4RV/Wrv4D
         LqeMOSqjkxE0WPwTrf46ZarSWQclkY8EzOKXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759225429; x=1759830229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WNcMKBudcKBmwe6dseVPIyowpJrXUGlMUvGZxEI6Xds=;
        b=W2MZPcsdayIp1iI41SN23AHqhsgcdqdN2JSnq0aIPVzV2YBnbnJJqXONlAOaH1lHBU
         lT3CLiy3/afn903b3WtpDwbM+CRcnh5nXTtTJxfXa0QjCC7nD1BPJh0m/Bc1RARkdN1X
         1B084e7shOjtFUuhTcz7Og1Jfz1/uuyhCkhW2UB2GDwQM09Ly6CrC4RhgxOAVIfzSE31
         e2XaicD7UjBc9Czt/5VFPXZR35sc1t7CIYqZ7A89+P4cfN9wtrQ0EaVp1Kz87OCOF9qu
         mMDKnujWoFj4LCP7cOt9qQHUlsXVSPjPWxmK+Ghx59NsRMHQB9sNtnKGQbHEy9sEb+PR
         cZkQ==
X-Gm-Message-State: AOJu0Yzd27YKRS1XxIhiSaBYJPHfKknDJxdsnb7vtk7n7fDkkXFdDiGC
	hSnDWbg35irnDVwd4gTZU2IbjgmlVNhydzAmrit4s93WqLkjbgjncPONV46IOAUOwrfSdp2/Js9
	eRHRj
X-Gm-Gg: ASbGncvxfDoZlzpMhK648m1z53n59E+ynfcHN4V8UBHEDbU0XWTXGuLPxRBqMEjxKet
	TJYSU+mqAGVGKyF3J0cncpconz6im1YpvxpIBWAmjnrnI/XleM2TgQfFGfevyp56iRWdnnVR8iq
	oqY/7nsPJkf/TUj3YmofkJjdMR6N2BxEBhnPf5eC7zXmmz0AlrvtrlvTyFi7kr6ErKbyxxKq91M
	u+qbSAJDORuYdKvk/FJ7Gru5T7bRFzFM/IhKvoN3zVsr9kqDLhXFfFVOzieYcIGwJdU62SyBb2m
	65biCKFHGyDKTi01js8S3tjHpoAx/P5BLkSI0K5k0R3zys/pFZ4jlE1zrRcJuk9iilswE+LinCf
	D1eaGzy3OlltedfO743cs/0YxvuDV82onnHS5k1BTrNbWU+SVoKGZXjSk+LRJC7xzMG28Ymw=
X-Google-Smtp-Source: AGHT+IEs41+aH0wi3Gmuy0QHY+6ydWhIKPvkzz+rsD0zN3lZIBro3cmnNzC4tavyB2uM26hewRH+Vw==
X-Received: by 2002:a05:600c:1d16:b0:46b:932f:9201 with SMTP id 5b1f17b1804b1-46e32931330mr181895835e9.0.1759225429342;
        Tue, 30 Sep 2025 02:43:49 -0700 (PDT)
Received: from FRSMI24-BLUE.example.com ([195.68.54.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5c3cad50sm9721485e9.3.2025.09.30.02.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:43:48 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
Subject: [PATCH v3 0/1] wic: extra partition plugin
Date: Tue, 30 Sep 2025 11:43:43 +0200
Message-Id: <20250930094344.3049278-1-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 09:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224180

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

Some files are not part of the root filesystem and must be installed in a
separate partition. This is already handled for boot files by the
bootimg_partition plugin and its IMAGE_BOOT_FILES BitBake variable.

This patch introduces a similar approach for generic "extra" files. A new
extra_partition plugin is added, which populates a partition with files
listed in the new IMAGE_EXTRA_FILES BitBake variable. Like the
bootimg_partition plugin, files should be deployed to the DEPLOY_DIR_IMAGE
directory.

The plugin supports:
 - Glob pattern matching for file selection.
 - File renaming.
 - Suffixes to specify the target partition (by label, UUID, or partname),
   enabling multiple extra partitions to coexist, similar to the
   bootimg_partition plugin.

For example, with the following (simplified) wks file:
  part / --source extra_partition --fstype=ext4 --label foo --size 5M
  part / --source extra_partition --fstype=ext4 --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d --size 5M
  part / --source extra_partition --fstype=ext4 --label bar --size 5M

And this configuration:
  IMAGE_EXTRA_FILES_label-foo = "bar.conf;foo.conf"
  IMAGE_EXTRA_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "bar.conf;foobar.conf"
  IMAGE_EXTRA_FILES = "foo/*"
  WICVARS:append = "\
      IMAGE_EXTRA_FILES_label-foo \
      IMAGE_EXTRA_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
  "

The file bar.conf is installed as foo.conf in the first partition, as
foobar.conf in the second partition, and the last partition installs all
files from the foo directory.

Pierre-Loup GOSSE (1):
  wic: extra partition plugin

 meta/classes-recipe/image_types_wic.bbclass   |   1 +
 meta/lib/oeqa/selftest/cases/wic.py           |  43 +++++-
 .../lib/wic/plugins/source/extra_partition.py | 134 ++++++++++++++++++
 3 files changed, 177 insertions(+), 1 deletion(-)
 create mode 100644 scripts/lib/wic/plugins/source/extra_partition.py

-- 
2.34.1


