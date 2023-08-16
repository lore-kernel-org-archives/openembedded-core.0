Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960A9C001E0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 11:02:28 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.158208.1692183740420174527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 04:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZUkTX20c;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-319779f0347so2498858f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 04:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692183738; x=1692788538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LGcyPE7AFuchaS8aGrClYwFiaTy5yXnpfGab3RNWG2g=;
        b=ZUkTX20cEZuLqydsHrFF/8E2dbTHy8dKTNJoA1Y0ilCg0rPmDzVIh9cOyBVjNn5cQk
         E5sy0se2jLKl+5PcDtRMZFjC3KmjE+1cJfXu60faZXBgHrncsFh/zkI1h/AY4ynfJu6G
         e17+Os+2I7zkncTeAuNnBQsLn5BY9XaZj9vO0fFi7uGxESA1O+2oELpeLL6mTcmcFgWP
         21zKhNlRhdOkPGLQgibZaLuF13ZoHoaWKJajd/7UQ+sflDqBVwT/B3/MceIqhROKsKnz
         rWxBzvdPfmkdlwKlf1WqYFHgtgtPqSOxlg77mKWQwSpq0piVg9gQUQPp2SzmM5ZYpG4N
         w+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692183738; x=1692788538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGcyPE7AFuchaS8aGrClYwFiaTy5yXnpfGab3RNWG2g=;
        b=HPu7M7jDhXBpbapptRu/vLtOFIZFoO2+np4WNVRpUxmz1IGq0B9zylpxsDXD5xCqDF
         Q6aiSg8E1aJRmSqQ12r5QVXvkmhk8ppocak1rd9uEgun//KvQoH0crwlHAKyjdHmTY+u
         laLcqT2dzoYFV0yhY0R4dlzrLDz+r8aXyXwj6LlR1vF3a4JqPJwkZZOFGWWRZ/rUWBSp
         o7qwz3CJlUpznzrcrnaGVm0yzJMbkKa+KMydVHpl3NUGrUdBrQ1UVcHQc69Vdb7aO6xZ
         ddeYccJNZgNAi3D4LYWc6SmrgFud0wwETkpGzG10s92rsSTUEtIr/6qaN9X0E+xGn2HQ
         Cjsg==
X-Gm-Message-State: AOJu0Yw0ErEVCrFIRtXVg8rSSvpFx8UhtBrzEpgnnBWXWapVb+LzEUVy
	ph9DLBd2YtPv/N3YdizjBk65Hjqw5/E=
X-Google-Smtp-Source: AGHT+IHb90/J+noiBr7Mp6x3BFldaJh/8kleapEoxdWTd3Lq3plOqbox9UHj8xrmj8y6tPT9pFtZ8g==
X-Received: by 2002:adf:ec82:0:b0:319:520b:2228 with SMTP id z2-20020adfec82000000b00319520b2228mr1473340wrn.27.1692183738172;
        Wed, 16 Aug 2023 04:02:18 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id m12-20020a5d4a0c000000b00317e9c05d35sm21039589wrq.85.2023.08.16.04.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 04:02:17 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH v2 0/1] Fix kirkstone dmidedecode smbios3_decode
Date: Wed, 16 Aug 2023 12:58:19 +0200
Message-ID: <20230816110211.79747-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 11:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186130

Changes in comparison to v1
- Adding all patches to the SRC_URI.
- Renaming the patches to their original names to minimize differences and simplify the review.

It's  tested in Qemu again. Sorry, for the extra round.

Adrian Freihofer (1):
  dmidecode: fixup for CVE-2023-30630

 .../dmidecode/CVE-2023-30630_1a.patch         | 236 ++++++++++++++++++
 ...-30630_1.patch => CVE-2023-30630_1b.patch} | 126 ++++------
 .../dmidecode/CVE-2023-30630_2.patch          |  11 +-
 .../dmidecode/CVE-2023-30630_3.patch          |  60 ++---
 .../dmidecode/CVE-2023-30630_4.patch          | 149 +++++------
 .../dmidecode/dmidecode_3.3.bb                |   3 +-
 6 files changed, 394 insertions(+), 191 deletions(-)
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1a.patch
 rename meta/recipes-devtools/dmidecode/dmidecode/{CVE-2023-30630_1.patch => CVE-2023-30630_1b.patch} (63%)

-- 
2.41.0


