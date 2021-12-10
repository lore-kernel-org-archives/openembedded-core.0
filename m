Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC20C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 13:05:52 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.6759.1639141550220630064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:05:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QTBDPQsc;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id a9so14805573wrr.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x+1ZBBpShGXLPMYGEaR7cDlgezLipOXjX6x2K6jyefw=;
        b=QTBDPQsc8DaChX2SRyJmZvkZFYCw7GIlR4crI7hcwenS/s2xUvhHJC7fhZ3Yu081FC
         SzFSbT7VsZHngByVbThBX5nu06z+3McSUJaEUsvxbJy0PfoFI/w6AQlbYh8s4K96rp3R
         Qqw4yZrplnbfcaTgg18f7xKS/no3eSkEi3zsOQeh5xsJWZg+/j4UdPSq/IbeR+0EcgCY
         +/lj0xQqcRP0/x6GUAH0Iad0iWmJJP8czE2DLUBgWFmw9zwlSkZyVeWcWe+tBx7W+7iA
         wMozyhSkrtcpPcMVv/gNZpjQSgsWYy5EbNUoq96amxQp/2qALzMwtzdtcPSoIxJXRkUx
         +q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x+1ZBBpShGXLPMYGEaR7cDlgezLipOXjX6x2K6jyefw=;
        b=BzRHc2gdQT83jBJgATGcVXkrp2Z3mq3m7eP2B4SCs9tzB+6xolEw/otSpjDyv8bO7V
         Lvs+FzMsjrHrDEwYMyt8WFwo12hzEWUxKuIlbkbC0n6LL0aT97LxRDmetXa8VCk1Bwp6
         9qqhF6+IFyJeyTWgD6PIrXFQZSHZDjZRh6qKSFBw25TyNtRLYXqWF9PcxplT5Foyr+Gf
         Ypfo55sVQGI1vNqMhlB1R2R3VTsKmI4nCO/6FH6Wqsj2X3uPWvWceu595Ezl1PwU6zTf
         xUdPGqennH8t04u/3PN6BuKdnPTmiKUWY69vsk6HLmw/o4EV3PT3sr3492G5paNc1gPG
         l1mA==
X-Gm-Message-State: AOAM5317rIekN5cDYHWwYRv/XVmJ1DjfCseCjhFHuGDs6fnzgOqvDR6p
	Z2CbZjfVRqnCqC2VrOqdHwpEiVS76rHaQQ==
X-Google-Smtp-Source: 
 ABdhPJx+YI7YBz6/Bd5sbJ6Nfz1XYiuYdGkXAoT96iMhG9mhpKmoCzqP7qX8tF/qLZULXBxEGir1Gw==
X-Received: by 2002:a5d:47aa:: with SMTP id 10mr13644110wrb.50.1639141548530;
        Fri, 10 Dec 2021 05:05:48 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
 [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id
 v15sm2649214wro.35.2021.12.10.05.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 05:05:48 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [oe][OE-core][Patch 0/2] implement applying patches from a directory
Date: Fri, 10 Dec 2021 14:04:56 +0100
Message-Id: <20211210130458.39716-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 13:05:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159518

The current developer manual [1] specifies that patches that are
part of a directory which is given in SRC_URI are applied by
the do_patch task. However that is not implemented in the
current code.

This patchset implements that, but deviates from what is
documented. If the patches are applied I will send a patch
for the documentation changing the relevant part to:

```
If you have a directory full of patch files and you want to
apply them all you can add the directory to SRC_URI and add
the "apply=yes" parameter. This will apply ALL files in the
directiory, including files in subdirectories.
The patches will be applied sorted by their filename. Files
from subdirectories will be sorted into the list at the
position given by the subdirectory name.

   SRC_URI = " \
       git://path_to_repo/some_package \
       file://path_to_lots_of_patch_files;apply=yes \
       "

In the previous example all the files in the directory holding
the patch files would be applied as a patch.
```

Max

[1] https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#ref-tasks-patch

Max Krummenacher (2):
  lib/oe/patch.py: apply patches from src_uri specified directories
  lib/oe/recipeutils.py: follow changed method argument list

 meta/lib/oe/patch.py       | 98 +++++++++++++++++++++++---------------
 meta/lib/oe/recipeutils.py |  2 +-
 2 files changed, 60 insertions(+), 40 deletions(-)

-- 
2.20.1


