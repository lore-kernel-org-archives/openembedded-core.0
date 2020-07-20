Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web12.1021.1595267801954889325
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 10:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d++IwNGp;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id o3so14043551ilo.12
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2020 10:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WWxy9IyFUPoRtVy8TTO2WT1abMQOV2ZzGnWAh7Cd8ns=;
        b=d++IwNGpdmivp9mx5fCaNZCjIseJrir7BinIhQRTXfoEU+cOUhhPzERLBw/t4rOQRC
         EdCqxdUioCYT4OZAmF7V1e26O6RPiWWxzoVW/vXOTcOL/XSf9qrcdSPCXzruOidovE/8
         kK3DKimKFupFTRu5utMTIxRm3lr7yPruuFqQR8v4+U3mco6W2tVTCFHhWNLmaUYo2oNs
         fYLpUbV1nhhyg+U6sKX2u3LZ6AvY28mkedUFbY/ENZ/x2LC+yf6Uy4LNUGatvVDVlLXZ
         1X92soqhmHY1kXrJ7CG4Uxv1skyXAgFosPAOjkmwhSZS6VFAGftyCBJI0JkplLws5cXr
         lC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WWxy9IyFUPoRtVy8TTO2WT1abMQOV2ZzGnWAh7Cd8ns=;
        b=Fz1BbmZ1SnXU7/zZK0iH4S6ntNRmzMWSNcJzyyzFMNTJEo88vYLOtQ7fzYdR668ypr
         KZJ8pKWqMpG+oT/QN1psOq7xJNK4UE4NBZ8/1FDY0HAlagsGz5zqILbYxaQvqNPHvaIO
         MiIWZSvjLc+4w1DpyXJultlvQ1ifzhTouB3Co0wLxEG+Tl4+XqS8y1iNbmmEJbY44EME
         hUydsZKIBevmzAaNotJ5Jm/YWVixngIpTYjhtHsO+Wbl1F0skdnXC26mNnt2tzaPCn0/
         FTOdsq8cvSD4DCHWtHhGH3B5nVsHM/YbZQczybZT3xZwqi3vH5pWAI66rCinh0KnSEKg
         JtXg==
X-Gm-Message-State: AOAM531Ro/hHPmnpsDKrgKdlsxGZ33jinaDOOpXq6O3b0u9y30/1TYAa
	hveeTv3eY0+I/NUuPvTiGteN3468nZE=
X-Google-Smtp-Source: ABdhPJxwfrNsJ2mn/6eJhxJLGonlZFixgWtIZrX96mKuHSK8Uk90Qpr4VCLNZykcwMi64eNbgtGtcQ==
X-Received: by 2002:a92:bb11:: with SMTP id w17mr23839190ili.117.1595267801097;
        Mon, 20 Jul 2020 10:56:41 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:c488:d9d1:f30d:969e])
        by smtp.gmail.com with ESMTPSA id c7sm9400006ilo.85.2020.07.20.10.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 10:56:40 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 0/2] classes/reproducible: Fix error when no git HEAD
Date: Mon, 20 Jul 2020 12:56:30 -0500
Message-Id: <20200720175632.25568-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a bug where getting the source date epoch would fail if there was
no git HEAD (such as when 'subdir=' is used).

Also takes the opportunity to move many of the anonymous python
functions to library code to reducing the parsing burden

Joshua Watt (2):
  classes/reproducible: Move to library code
  lib/oe/reproducible: Fix error when no git HEAD

 meta/classes/reproducible_build.bbclass |  90 +-------------------
 meta/lib/oe/reproducible.py             | 104 ++++++++++++++++++++++++
 2 files changed, 107 insertions(+), 87 deletions(-)
 create mode 100644 meta/lib/oe/reproducible.py

-- 
2.27.0

