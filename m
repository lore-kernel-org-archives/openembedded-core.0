Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FC5C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 10:15:09 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.3647.1639995308270286389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 02:15:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XIkfU1qw;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id c4so18956636wrd.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 02:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eoynvwRtO73DxQ10vlqmFKP1c0ZAYHidxhE8BuvOwWM=;
        b=XIkfU1qwfckmI4umsHynVDMv63JTz8p4NofgAcVVuU/+9vwCbVmyAOi5xDEKHJcJww
         rTPcYWIWOsZGcyWvBSq7m1yN2VzU3ZyD4a4n2MwYp1EayLY+tQBcklXy7OBEaMMkNB6G
         wauIjq4jAR4YmHpe9V8x+froaVLDbxputWZ16gV7fHpjJSS7aQnNWoc5TUAWn9Io1fnC
         fGuX0rDiMGkMm3kYWS8UtJJgdtVncFYEAkizF3jaMffVsQQ+0BRkY47eJ7o0lAd1UJWt
         9OMSl14WNNsPx4TuXwNwjhcprP1rGZXZmK259HAAcUROG6XOhoWylQomm9548zyxpZBT
         Rveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eoynvwRtO73DxQ10vlqmFKP1c0ZAYHidxhE8BuvOwWM=;
        b=IpmK3T1zZVpwo2t4p4MuJDbNyKoczjOplAGSADV2SkDfbMjo2KsCfmdEXaKaW734Bh
         IrGoIw9aB9/sLRZqSOt0lMxbXdihltysbmPqmvVI5QhMAJxTZsD6H4wlTY0upjfQp1ti
         WRw+LZAuNPd5+tdKzx164EPsmz26Uj7p6SgnSJx5Z8mYxN+gT0TZZ5vsQ0esHF5KvvvS
         liM7vlCbQkgKd4SYTB1zoise26bfbm5r9/sEocO3BEM+m/hjGm+/dbsGwbh+yaR+uRzV
         uNDWZJ3ObMVuo5v2hERQY/ZWjHpuemcQYw250624721KMA4E652SSRaz2gFZrEqOPG9J
         jEAQ==
X-Gm-Message-State: AOAM531B7cwu3LQGFkTn16FYP2vO8AMdjvmpaWno5k3lbRBmsG8FyNbh
	1GU9SQcFZuqy6ysSdH7CT7LaVBBXxVHVwg==
X-Google-Smtp-Source: 
 ABdhPJxOY1XXvDVRqntaWOAoDcW45Cwnl8NvbLoWfJ5iT8drQn4gnau/FJYoo/5DW7TSw9wmPyCteQ==
X-Received: by 2002:adf:c182:: with SMTP id x2mr12413975wre.646.1639995306457;
        Mon, 20 Dec 2021 02:15:06 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
 [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id
 m12sm2833563wrp.49.2021.12.20.02.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 02:15:05 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	kweihmann@outlook.com,
	bruce.ashfield@gmail.com,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	quentin.schulz@theobroma-systems.com
Subject: [oe][OE-core][Patch v2 0/2] implement applying patches from a
 directory
Date: Mon, 20 Dec 2021 11:14:03 +0100
Message-Id: <20211220101405.26735-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 10:15:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159859

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

Changes in v2:
- using python glob to get a directories content recursively as
  proposed by Konrad Weihmann
- dropped 'lib/oe/recipeutils.py: follow changed method argument list',
  the use of glob allowed to keep the original argument list
- added a oe-selftest which tests applying patches aspects

Max

[1] https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#ref-tasks-patch

Max Krummenacher (2):
  lib/oe/patch.py: apply patches from src_uri specified directories
  oe-selftest: bbtests: add test_patching test

 .../patchtest/patchtest/0001-10.patch         | 25 +++++
 .../patchtest/patchtest/0001-111.patch        | 25 +++++
 .../patchtest/patchtest/expected_source_file  | 11 +++
 .../patchtest/patchtest/expected_src_patches  |  5 +
 .../patchtest/patchtest/expected_src_sources  |  7 ++
 .../patchtest/patchset1/0001-11.patch         | 25 +++++
 .../patchtest/patchset2/0001-2.patch          | 25 +++++
 .../patchset2/0002_subset1/0001-4.patch       | 27 ++++++
 .../patchset2/0002_subset1/0002-6.patch       | 26 ++++++
 .../patchtest/patchset2/0003-8.patch          | 25 +++++
 .../patchtest/patchset3/0001-111.patch        | 25 +++++
 .../patchtest/patchtest/src_patches           |  5 +
 .../patchtest/patchtest/the_source_file       |  5 +
 .../recipes-test/patchtest/patchtest_1.0.bb   | 37 ++++++++
 meta/lib/oe/patch.py                          | 92 +++++++++++--------
 meta/lib/oeqa/selftest/cases/bbtests.py       | 18 ++++
 16 files changed, 346 insertions(+), 37 deletions(-)
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/0001-10.patch
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/0001-111.patch
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/expected_source_file
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/expected_src_patches
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/expected_src_sources
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/patchset1/0001-11.patch
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/patchset2/0001-2.patch
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/patchset2/0002_subset1/0001-4.patch
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/patchset2/0002_subset1/0002-6.patch
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/patchset2/0003-8.patch
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/patchset3/0001-111.patch
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/src_patches
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest/the_source_file
 create mode 100644 meta-selftest/recipes-test/patchtest/patchtest_1.0.bb

-- 
2.20.1


