Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA4CCAC5AA
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 07:23:27 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.5757.1758785001655136212
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 00:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sI1lL+FF;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46b7580f09eso3537215e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 00:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1758785000; x=1759389800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P68tPDYGpBoIbu3cgfE/9Ao7rQsq5Zh48R5K3o+hpCA=;
        b=sI1lL+FFPAADMmWOpRkvwMmsSbQqBG/jFXfkajS9/FtzLQOJW0nAjElinitm/Q0ld6
         XSL/DUktlDUfIpTfSmDYzCwQENnPP3eBTbdZXX6/t3H1PFegUTtd2pY9bzjnzDk92SDq
         v2NMcBkbfrZgJ9rXzSafdbKhbuKvd8fvPxjcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758785000; x=1759389800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P68tPDYGpBoIbu3cgfE/9Ao7rQsq5Zh48R5K3o+hpCA=;
        b=N1Ia0vTVoLg/yeCRLB8o3o/gfRgAdd30puT5GfG/lU/Ao6DRvQsLbPpEhVNVa/bI1F
         A/Zw4Z1+A5ZPNfS2hDJs+f/Afk4321sODLxWhufONBRPA8eTsgvDrzz33T0PNtXKQVs2
         Gv0ilALUWgWP4cHl8Tnr+m0jwUsZrtDIugaB9/ciABdDC8gYmFJibOJYtq5Bx/FUsIYQ
         pjUoRSHw2iOp5BP6U2uiYNFdZ4syt+JMCzZMQIeph8rzm3F378tq9jmB0EVeQCR47Dhx
         P/4X43CvFmBgKsIWoSq57JSe/tiVY+/kCa5VuF4Er86LUa5djHFHAjzI54KF5u35lsA3
         y16A==
X-Gm-Message-State: AOJu0YxjRFso4WzwFmzhPs0N+R6yXtHEXSVJfcGUktSrTivx4ewoKjsq
	fgKdzoesF8a+igUzTawiNaftiQSAW2ePedzGixAiJw6x5GuVKVqI++MLBYJS3E8lQ8UQSoUg9SP
	5c48G
X-Gm-Gg: ASbGncsiTjtIbc6Rfu7fT2wXHmKtNZaoe3ftkQQPkGS2DAZ3/YJeTYgcvecxHY63Y1b
	xYweBgIKqkxbn+bgjQl0ZITzny9SrtJWzg+x5+mHHFh1RYzy+AfMNa6soFEASpl6GhTXKGJoi7s
	g1SqO+8pAsb0Yr9uxRt5J17mG7IMUBzL2IZYSEo3fUs7Kd3RjEJzNLnlLiaZSjrIzn4c7I6XwFD
	+sfKOGWsx22xLXSbR61oFrHXasSfQbeBX2lo1CvijFRnVdGSTVDHR0s14LtnKAq7dzFY1qkdryv
	iibKqJTRdQH4XUI16PjQwUpYeCkelge0TDeMRZRK5CiQaTsJmanL/MVMJaJaDOVG7sO3gizeXxe
	QFWdp+yHF+hVvOl5nxXVJU906dTJ59xtJquT2vHK5W15JvyA=
X-Google-Smtp-Source: AGHT+IHaZsFG0lD0jc/V5vle4tyckGDAfuI8zY9pnIPlvXkdqKDq9qJVpjU3JGhntCbNKK8s86AsTg==
X-Received: by 2002:a05:600c:8b65:b0:46e:36f8:1eb7 with SMTP id 5b1f17b1804b1-46e36f81fbamr7486765e9.10.1758784999725;
        Thu, 25 Sep 2025 00:23:19 -0700 (PDT)
Received: from FRSMI24-BLUE.example.com ([195.68.54.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab6a514sm63303275e9.22.2025.09.25.00.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 00:23:19 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
Subject: [PATCH v2 0/1] wic: extra partition plugin
Date: Thu, 25 Sep 2025 09:22:02 +0200
Message-Id: <20250925072203.3490596-1-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 07:23:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224001

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
 meta/lib/oeqa/selftest/cases/wic.py           |  41 ++++++
 .../lib/wic/plugins/source/extra_partition.py | 134 ++++++++++++++++++
 3 files changed, 176 insertions(+)
 create mode 100644 scripts/lib/wic/plugins/source/extra_partition.py

-- 
2.34.1


