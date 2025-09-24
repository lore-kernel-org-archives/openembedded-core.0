Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C6DCAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:46:38 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.11812.1758717993287303059
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=4IQFITkX;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e1bc8ffa1so22835185e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 05:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1758717991; x=1759322791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tH+uPG/FYbUB1iSNaMZC2FQkvYxL8XXuRqChMXBOKa8=;
        b=4IQFITkXmsSsYCkuCfzTEdcXBOz2zOLFLiD4omwPp1swm4BAZzmlHyns7xFRLP++lt
         kcQVjYhujXWd+cJjFoUI7rgojNSQg45UJQtM+U7gE2xuzBNYUD4gc2RbVk/JVyPlTmHy
         DnmlOJkTNREqGPFiGKVSPC3OuZqZsLn+q3frk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758717991; x=1759322791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tH+uPG/FYbUB1iSNaMZC2FQkvYxL8XXuRqChMXBOKa8=;
        b=cAktSxgKwvlxXpqqPl/qFx5LfzS0fuI6WxbgMmfCpU/PHSSwQfFQDoMH7Kh5j8Ph99
         eINKkfCr9xS5ROOgzTgt4AxDiFU/19EKKRkgBgel0rKAqFDIP8Ik2jDgJ9NURLLI1sOg
         6CUngL+QOe453xUavn5+/f5Dpe2IXzJiAbianYqEFMp6zS6SaAwx6w/UXHBY3DZR7Sd1
         bfAhAsR9tWq3MnKSJZAOGt/sptZCPCO4FkFDSCcUbTu2V/1CAjIe2FISD0V2AbKWF+47
         Tthg2LE12Xvd41DJdppdNAqzc1Kr287B5xZf4SVnzPpoGKycneLhRykagwgKTNv+HOJl
         1i0Q==
X-Gm-Message-State: AOJu0Yyj+NmJMucqgvN5/Nn6H4aRNA01BQds/Q9+nfhiM0pio2Z3GsVc
	F4wxiE/B5SjHv4DJwy4SEehQzZAz0zhhRZC4TMijZbrdOdZUsw9mLymfoNM4Y6seICKHXQZvL45
	T5ZRN
X-Gm-Gg: ASbGncuh1PU7BgWJxEQlciHE2b50VDuI8lSdEjSpE7XvDK+EY/wS9+YotK0trxfzFXi
	Syc+LnXMDw3IlxUaaaes965JiDLQtjGmVffVVizfN9/AEbZUCyMnP3LRjricK7RwVMtjfVCJFEw
	W7xcUB2IlByR4MDmVV4HcdnXLGeDDxGtLhyF9TCAlitC3bgI6r6rBKgRNnqOQPf8xT8GFxjDLir
	0qH1q8gp/FLYJuvRhUXYRRH0Q0av6v20ECKDIGf7RdLupjqY2LoXuGugVDDdmtTPgjzB6Aez0WG
	XX6EkSNT/q6vKb84ltCuIRdjddvwc4rKjJb5/kNQDAegYDotHdR8JgKFUIaGQ+er/XB6FnhghM5
	4cVKkBOTZyFkYhVmQDPw4Xg2IiF5wZHK3YitxWXul8VX71PepgRYHeWYw7rY6GYiLqA1al4YWSl
	vtb4HCjcftnMhehxM31hiwxx4Vud9nfVrKLo1t
X-Google-Smtp-Source: AGHT+IGRDf8rPLR26gbaqWfhdzk6PW46qMdOciQYx+6RGibXDbB35C6Pd+jfDRPdzAy5ICRULgul9A==
X-Received: by 2002:a05:600c:6288:b0:46c:515f:dec3 with SMTP id 5b1f17b1804b1-46e1dab45b3mr66790695e9.23.1758717991504;
        Wed, 24 Sep 2025 05:46:31 -0700 (PDT)
Received: from FRSMI24-BLUE.example.com (2a01cb000301bd00abbbfd8eac9677bf.ipv6.abo.wanadoo.fr. [2a01:cb00:301:bd00:abbb:fd8e:ac96:77bf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbffaeasm28075098f8f.62.2025.09.24.05.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:46:31 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
Subject: [PATCH 0/1] wic: extra partition plugin
Date: Wed, 24 Sep 2025 14:46:10 +0200
Message-Id: <20250924124611.3186960-1-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 12:46:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223974

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
 meta/lib/oeqa/selftest/cases/wic.py           |  40 ++++++
 .../lib/wic/plugins/source/extra_partition.py | 133 ++++++++++++++++++
 3 files changed, 174 insertions(+)
 create mode 100644 scripts/lib/wic/plugins/source/extra_partition.py

-- 
2.34.1


