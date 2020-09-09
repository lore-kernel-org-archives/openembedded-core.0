Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.8826.1599691556844073733
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 15:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=KaIlUEkN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id w12so4150482qki.6
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 15:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yWZ/opNLQnXO4jNg055p01hKRs/T9XHRFo2548E26nE=;
        b=KaIlUEkNXKnASOMAafUJQf0YP/hU310Rxs7X+wlTxC6bRj9GRgvBL/cQCtJMMSPBb3
         5XZ51EzZKEjBxYkn3DlBV1gXbYZYchIHL1dp6SMr4MVBsRjFN/bysrQJNkNuXnqjjNor
         4i6qsKXpy2HsVTYpasqxcFF2zVFqIGLEEYRz3sVlOGCn2Ds49RvmUki5ok4Q/Fdi5lo2
         HdnlwjPPoczy3+aU5L5nZkEpLrKgI6v1ZawkSjgkcQ7dBOC+EkZpPFvslDS0WKva/VVv
         MCAX/QIT/oB15SzB/WrtQdufhRM2h7lj1fnZBGhDTb9BzAksuZm2i51e3DD5otLLUvlc
         vPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yWZ/opNLQnXO4jNg055p01hKRs/T9XHRFo2548E26nE=;
        b=EUBLtkCyJG10WP8GXAwh4yf6EE1OjOvIdgyrZO4QjANFbzO/6XLkFL2yGxHXr5EhYs
         6pt2JgbjSFjL2U3daBJY4TZNB0Dkabb1FbJp56IZrrM9FrPpe4HHAOnuWXP4vVHssh5t
         XbbDravyYVjOCbofBBwuJ6h1KFoocEuMlwwum86cPDPAhE6NqoYHbGbqdSp5jfCZ20q5
         hdBWgmg+/neGQyjpz4F/YdWWykZRuBwgFIjTXFmzPI6APade2/vKHL0ICNm3eowTYyye
         DDJHcXK81q9HfclcRVC5pW62nv2EMfZWHCls14wVWtpdCEPz5j+J0aqHZi4aJhnc2zQF
         ULqw==
X-Gm-Message-State: AOAM530CfWOn/cRYwmXEecam1HtkiPCOhEVc0sTqA0O+Lopxu7/8imGk
	6NsKo9vNGMWkI4uys32bBHSJ5cn0jEbJe2TF
X-Google-Smtp-Source: ABdhPJzVleL8pPWNcfTUw9kcX19jlszq5blTvBV+dD7nVYYrw/eTu/67zWUtw5hCTvyN+HYDcHoEFg==
X-Received: by 2002:a37:8883:: with SMTP id k125mr5136728qkd.387.1599691555608;
        Wed, 09 Sep 2020 15:45:55 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id q7sm4731479qte.95.2020.09.09.15.45.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 15:45:54 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][RFC 0/6] ARMv8 Tune reorg
Date: Wed,  9 Sep 2020 18:45:29 -0400
Message-Id: <20200909224535.27164-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a large number of Arm Tune files located in
meta/conf/machine/include/, and to support the current and upcoming Arm
cores, more are needed.  Adding more files is simply going to make it
harder to find the relevant ones for an OE/YP developer/user.  Also,
there are problems with stale and erroneous configs (see my previous
series), which will only be exacerbated by having more files.

I am proposing a reorganization of the existing tune files by including
them in the generic family include file.  For example, the
tune-cortexa55.inc would be moved into arch-armv8-2a.inc, and
tune-cortexa57.inc would be moved into arch-armv8a.inc.  This reduces
the number of files from 12 to 2 for ARMv8a, and that is excluding the
13 I am adding in this series that would otherwise be unique files.

To use, simply add
...
DEFAULTTUNE ?= "neoversen1"
require conf/machine/include/arm/arch-armv8-2a.inc
...

Which is arguably what should be done anyway (instead of taking the
default of the tune include file).
See the qemuarm64 patch in the series for a working example.

Of course, by removing the existing tune files, current users are going
to break.  A simple script can be written to use sed (or similar) to
replace the relevant parts for those users that would be affected (at
least for those that are in the layer index and update regularly).

If it is agreed that this is a good idea, I could do something similar
for ARMv7 (its just a bit more painful due to all the permutations).


As far as testing, I have built and run testimage on qemuarm64.  I've
built every QEMU machine in meta, as well as every machine in
meta-arm-bsp (modified to use the new code).  There are no observed
issues.

Thanks,
Jon

---

Jon Mason (6):
  arm64: set BASE_LIB to lib64
  arch-armv8-2a.inc: Add Cortex-A55 tunings
  arch-armv8a.inc: Add existing tunings
  qemuarm64: change tuning
  arch-armv8a.inc: Add tunes for supported ARMv8a cores
  arch-armv8-2a.inc: Add tunes for supported ARMv8.2a cores

 meta/conf/machine/include/arm/arch-arm64.inc  |   3 +-
 .../machine/include/arm/arch-armv8-2a.inc     | 160 ++++++++++++++-
 meta/conf/machine/include/arm/arch-armv8a.inc | 189 +++++++++++++++++-
 meta/conf/machine/include/tune-cortexa32.inc  |  18 --
 meta/conf/machine/include/tune-cortexa35.inc  |  17 --
 meta/conf/machine/include/tune-cortexa53.inc  |  18 --
 meta/conf/machine/include/tune-cortexa55.inc  |  13 --
 .../include/tune-cortexa57-cortexa53.inc      |  15 --
 meta/conf/machine/include/tune-cortexa57.inc  |  17 --
 .../include/tune-cortexa72-cortexa53.inc      |  20 --
 meta/conf/machine/include/tune-cortexa72.inc  |  13 --
 .../include/tune-cortexa73-cortexa53.inc      |  20 --
 meta/conf/machine/include/tune-thunderx.inc   |  19 --
 meta/conf/machine/qemuarm64.conf              |   3 +-
 14 files changed, 336 insertions(+), 189 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-cortexa32.inc
 delete mode 100644 meta/conf/machine/include/tune-cortexa35.inc
 delete mode 100644 meta/conf/machine/include/tune-cortexa53.inc
 delete mode 100644 meta/conf/machine/include/tune-cortexa55.inc
 delete mode 100644 meta/conf/machine/include/tune-cortexa57-cortexa53.inc
 delete mode 100644 meta/conf/machine/include/tune-cortexa57.inc
 delete mode 100644 meta/conf/machine/include/tune-cortexa72-cortexa53.inc
 delete mode 100644 meta/conf/machine/include/tune-cortexa72.inc
 delete mode 100644 meta/conf/machine/include/tune-cortexa73-cortexa53.inc
 delete mode 100644 meta/conf/machine/include/tune-thunderx.inc

-- 
2.20.1

