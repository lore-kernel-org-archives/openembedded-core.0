Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDF6C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 20:05:41 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.46691.1679947537348277570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 13:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qjwNnzTW;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-177ca271cb8so10552695fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 13:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679947536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcZRCMt8Yk8qL4yaKE/vIOR92dJuc+NU/9DJeTSlroA=;
        b=qjwNnzTW9pPB3/4LXWVfiWeGZr6w1GEm74G9/2i5kb36/EZchwRQ+FfeZgscJfTtqg
         qvfnXCahKwB4JxZfOuAZwLQICBai0O0X89thQuXvCgXz/oGQJOYlX/iDCHyhHfg/zfbN
         SbbhxGf4JaQlyQsXiEIS69l6wThQfvXYt+FciGDX0OO8RBEPKjouZMwg7i/t7x9fFwD+
         qCuPNs42KfKlByKduTiQO8Ej7nAAnQJ0Fw06J+HYn9rT/+ykhcjfoS1jSOXuNYRQ7fX+
         xrJyjZ+s10JmhS25bc7pXQveumtxmzVbACkSBG/gJWK6Ac4AgunyytXYjqJVc8x8PXhI
         1UCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679947536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DcZRCMt8Yk8qL4yaKE/vIOR92dJuc+NU/9DJeTSlroA=;
        b=odFhngFTOCQHyIhmUMhgFyd3sIAUpoYlYzoxpuTUJMHYEuwdzT49x63zZtraE3ULK2
         aMQaRPUx2FSKv0LQ8g6E+ObKjB7VI0QaUGd3iztwJUKbzJUbaYwS/XCvXq/MzZLD+KU6
         L5pBEx/swMCmtdNZbOfuyQ4fjkEGN3gCUEKGM1XWz2BJTJszWWa1Yp017LLyidxzKCLO
         wfMXQ+Mt6ue2M50cNaHMGlnC8uV5xTeDsgu+stbChgJiolZe1Y7rpF6Ze1iKM9Y9QCYV
         mawZzE7RLCc9W9KHm39O8Mzn2I0HWSCjitjTIv9unibIRmyZeeKfI0IeMd+odQew+Dfw
         NWEw==
X-Gm-Message-State: AAQBX9dZuDDgzVahk2Yfp1mbrV0Ed6dZ9eCz6NI6fn9yNTTjYbPHZHwF
	aXA9gkUpvzBs6N/ZlHcM6mHqqw+uL2c=
X-Google-Smtp-Source: AK7set/yV01yXZK4rfC5R/eALDmGYH7fE0L+l73xITmRcszenL+2W7IMUrTs3uauD9Sv/vZhpNLYXw==
X-Received: by 2002:a05:6871:551:b0:177:8692:dcaf with SMTP id t17-20020a056871055100b001778692dcafmr7644977oal.15.1679947535952;
        Mon, 27 Mar 2023 13:05:35 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id n16-20020a9d6f10000000b0069fa641bd25sm5942988otq.8.2023.03.27.13.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 13:05:35 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][dunfell][PATCH v2 0/5] Backport SPDX Support
Date: Mon, 27 Mar 2023 15:05:25 -0500
Message-Id: <20230327200530.3354151-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230322204558.1386634-1-JPEWhacker@gmail.com>
References: <20230322204558.1386634-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 20:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179176

Backports support to creates SPDX during the build from the master
branch, with a few changes to make it compatible with dunfell.
Primarily, the SPDX data is compressed with gzip instead of zstd to
prevent needing the zstd host tools on the older distros supported by
dunfell

v2:
    Fixed SPDX symlinks still using .zst instead of .gz extension

Joshua Watt (5):
  classes/create-spdx: Backport
  classes/package: Add extended packaged data
  licenses: Add GPL+ licenses to map
  create-spdx: Use gzip for compression
  classes/package: Use gzip for extended package data

 meta/classes/create-spdx-2.2.bbclass | 1067 +++++
 meta/classes/create-spdx.bbclass     |    8 +
 meta/classes/package.bbclass         |   39 +-
 meta/conf/licenses.conf              |    7 +
 meta/files/spdx-licenses.json        | 5937 ++++++++++++++++++++++++++
 meta/lib/oe/packagedata.py           |   11 +
 meta/lib/oe/sbom.py                  |   84 +
 meta/lib/oe/spdx.py                  |  357 ++
 8 files changed, 7507 insertions(+), 3 deletions(-)
 create mode 100644 meta/classes/create-spdx-2.2.bbclass
 create mode 100644 meta/classes/create-spdx.bbclass
 create mode 100644 meta/files/spdx-licenses.json
 create mode 100644 meta/lib/oe/sbom.py
 create mode 100644 meta/lib/oe/spdx.py

-- 
2.33.0


