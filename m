Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.62834.1600096444655361845
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 08:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=f9rnPBa1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id g3so104274qtq.10
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 08:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tDhxC4/nOpqiHCMhQFqEQwVqO4VIRDHncuMym0EV9FA=;
        b=f9rnPBa107ORADV4RiQshWfjPI9aNRzTPUsGD1nturwnPxr9kNiwVOYnZtkwAlg5xl
         YzXBJGEiIeGpjSpv90CChzXPDrGL0uS7fN0DZVikuF0Jv/pd13VslkjBLHLvrL5eF+Ja
         +4JZ2ggJl5G2nlOIb/qvPx7H5TUfOHIx6MqvBbZdnuVpmkDyP2ulEbKOD9FlRsRODnoL
         V7NW7w2RXo+10yAJostRlhlfxzam4CfCRL9tlNQbGQ1+G9YVqxKoxpOLrjIwsxuGOn7j
         YQFWPSDn3ybNE5FGEcepiIUQtXpovb3stHTatvn30cr+s/Z3o2qBIVFl+KVuBaWoRmLs
         l9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tDhxC4/nOpqiHCMhQFqEQwVqO4VIRDHncuMym0EV9FA=;
        b=bRKRmDKg8lGSdGfiLdAjbX90+Rlrr/qk9D7SU5W2eb4iz9tiJ/UKNU5gvQCPy/eFH6
         xAfkMfkgHZakKGfmunIKIUJLHGMIzQvoc8/dl0QNVVOB1RCAig81yeKWxj5ZHJW14PhB
         aIkhIlOqd8h2U1jyGosgxz6AOf7KYp2LIFqm5CBiZ7DMwLygQkwtO71lKa2sZyzgEc0S
         QTDRCc/yCyrkggq/c0OPU36XixrIxytY+0ZK5h44kjfgCz5OsR6z7H7rWtgPRF7MMg1w
         /zevEcqYhtFNKyPehIc7h5NVX3eh+6x4N2JkUBG6YqDcBZZKEF06jebXX+FdLmfLXNeA
         uhEg==
X-Gm-Message-State: AOAM531bdtfusvEQTylwSXi1xDmY0BODWupnqt8MIvNHjefEGwklsMA4
	DsFgibmUy6Kfw6jRBOyiGEVdYfq6AMd8CrCk
X-Google-Smtp-Source: ABdhPJxSCWkmsds3HYRt2XEcUJIs2InHZnClWPYCeB7NY+OxZzfhLhYwOuAeTN/+nsvt1tCAaSs43w==
X-Received: by 2002:aed:2794:: with SMTP id a20mr13636034qtd.387.1600096443404;
        Mon, 14 Sep 2020 08:14:03 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id p205sm12947329qke.2.2020.09.14.08.14.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 08:14:02 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH 0/5] ARMv8 Tune reorg
Date: Mon, 14 Sep 2020 11:13:54 -0400
Message-Id: <20200914151359.11240-1-jon.mason@arm.com>
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

Thanks,
Jon

---

Originally sent as a RFC in
https://lists.openembedded.org/g/openembedded-core/message/142324

Given the generally positive feedback, sending as a patch series.
Keeping the "hard fail" of the file removal (per Richards comment in
https://lists.openembedded.org/g/openembedded-core/message/142356).
Only difference of note is the removal of the "arm64: set BASE_LIB to
lib64", as there needs to be more investigation (see
https://lists.openembedded.org/g/openembedded-core/message/142414).


Jon Mason (5):
  arch-armv8-2a.inc: Add Cortex-A55 tunings
  arch-armv8a.inc: Add existing tunings
  qemuarm64: change tuning
  arch-armv8a.inc: Add tunes for supported ARMv8a cores
  arch-armv8-2a.inc: Add tunes for supported ARMv8.2a cores

 .../machine/include/arm/arch-armv8-2a.inc     | 175 ++++++++++++++-
 meta/conf/machine/include/arm/arch-armv8a.inc | 206 +++++++++++++++++-
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
 13 files changed, 371 insertions(+), 183 deletions(-)
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

