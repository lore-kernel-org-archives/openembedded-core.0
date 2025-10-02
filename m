Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC77CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 14:45:38 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.10978.1759416337924580030
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 07:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=r23Z26OR;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e47cca387so12071425e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 07:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1759416336; x=1760021136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SqZt58asyivaU0tZu/TLBGWLR9cyhZ15S1BwyJVX7Qw=;
        b=r23Z26ORKxY39DTV2exXMYrxHaCiqyAiCafu+9J3yvN7ECM+r4ugJ2toX3hBA8UD/Y
         GITu0bhTRAj74XpKB6cue3Nkjd1JWTzpPmC1TxNrskgh6tjWgLdirjyqIS4gbW2Ag6Uh
         hS9fgI8PPURW2yOx9REQP85fMItSO3XgM6Lro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759416336; x=1760021136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SqZt58asyivaU0tZu/TLBGWLR9cyhZ15S1BwyJVX7Qw=;
        b=C0NXNX/5tJd3IF/HKdoCduFD4oDQHgHbZROiZ/vOZkNGFX4NeRILadlrEIQs24QnWb
         0v4Rj7ugvJDwBli/ZJSHZXNJiDPFgGY98H/6bn5Scw2CYL+tPGC1wJnyU2RAoHFAHCOk
         X90e+Sw1IUxKhb/ffyS98wH2bTRF4hN3S5Fa3aqASBuo5rkGmBqJkx/6sDbEJb6olVjp
         rigkgIMvKXn/1XeE+1rJ0dY5eBaycRlCF1fKHVIMUDPEkyIoPPDIdkqXHdC/eg21dwvq
         FxO+cMtVWzDNSSMwXQ/S/d94M1La+XwLsg3rU3838wbRuzq3mpPIozZU+QDZ/IyTPtIC
         6w0w==
X-Gm-Message-State: AOJu0YwLEa0stfMTQVqcUkg8UCEUrRbsar33+zibmvO20OaxFTdPshim
	4Q6kL+vDj4f03ZEYz9EW1Lm4AtbcMNxmkEelCZsuk/egcd/p2FFfVn6CK66LkYwttni7y0QZEgc
	3XJWu
X-Gm-Gg: ASbGncusUvi4sjdtbAvGN22ANFpqBhLDMBYwu10lC+blmSDyV0p0P2UzRFcjCNhzePE
	V9kjuqtiNPrSL+x3DRCEZVpKFLtAukdRrzVSPqevK0Am4HLFr3mUdyBIYm7ucTb4RZkE9Mnb8ny
	IkSs0nu1RMfGwh1cIUkTD/eUKskYDOxlvD6I7pBgJH1nOFekAMC1oVMcW83+5LE85GUFMoC9l16
	0c3QvH02R2BzPhQGId9KKTVpDo1DkQ8utq2B/PG/FcwvmB/V69sXJkp/UFHxf1//4rQbhKL9Erf
	IAWCF+IvTu9JQWCxKM6zqiChgds+ysyxEN7snkqhob+krzHgXrnO8p70BhZxFXFUF5AUOtsVjNu
	cXgtNEEFcc2dN+/kxVFHekSEIT35EIeenHJVcZuCMxss8aqJrUTSbZgfJQJnHBBHHCGbdxQ89yZ
	pRm6NGLw==
X-Google-Smtp-Source: AGHT+IEUBraZ+iIGIMUD1zS6lvqJgFEkuhC5EAGbSrPl2SFSuJEiZmpa5d3CU4BKBstuGlrh+IkB2Q==
X-Received: by 2002:a05:600c:6099:b0:46e:3550:9390 with SMTP id 5b1f17b1804b1-46e612bda1emr58092275e9.20.1759416336219;
        Thu, 02 Oct 2025 07:45:36 -0700 (PDT)
Received: from FRSMI24-BLUE.example.com ([195.68.54.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab960sm3938152f8f.13.2025.10.02.07.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 07:45:35 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
Subject: [PATCH v4 0/1] wic: extra partition plugin
Date: Thu,  2 Oct 2025 16:45:33 +0200
Message-Id: <20251002144534.160791-1-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 14:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224361

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

Some files are not part of the root filesystem and must be installed in a
separate partition. This is already handled for boot files by the
bootimg_partition plugin and its IMAGE_BOOT_FILES BitBake variable.

This patch introduces a similar approach for generic "extra" files. A new
extra_partition plugin is added, which populates a partition with files
listed in the new IMAGE_EXTRA_PARTITION_FILES BitBake variable. Like the
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
  IMAGE_EXTRA_PARTITION_FILES_label-foo = "bar.conf;foo.conf"
  IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "bar.conf;foobar.conf"
  IMAGE_EXTRA_PARTITION_FILES = "foo/*"
  WICVARS:append = "\
      IMAGE_EXTRA_PARTITION_FILES_label-foo \
      IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
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


