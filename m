Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.13681.1602167697608765986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 07:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=siSs/Aq4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f194.google.com with SMTP id r8so5206899qtp.13
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 07:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ytO3nza8OnTJVID/4lt5jIw1ecEAsdsb43oFEboKdIw=;
        b=siSs/Aq4I4drOlWq9GW0LBJ10yxVA4yOW790MxnoXOsw1f7F01Y+N0JotO7q7DXSE8
         AZfsb/C+qVnjML+4kzhV02DNCs8KBLvNwOqMutliOB4F8zoFkjlJFdlPRvpkErh67rAz
         zFa8zSxlEOdtfKy9rCWAXH+4koG9hKbl0vesP6CJDUIsjr/OSv4w257uX1jBKSzEZORn
         C9N5UCn+FEaJRkjq4FF4jjEGdCnEoWcFbff99p1PZGJcFvDpY4IaRus5dvSvk+9Zy3ko
         8AbHlrjihE27NSoiql98QB3Lgks8+3Ob9Rs75mhRkugznWdsBKXbGnSYwRyPb3zQyz8n
         rRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ytO3nza8OnTJVID/4lt5jIw1ecEAsdsb43oFEboKdIw=;
        b=pcpjAbvDD+J3Aqa/TeMVX47vE+f+XMKlYg7jYD9XB2ll2ut8wd/PYcoxCm6epQsQEe
         ggnG/rqrITpPXH/rurP9rKVLG1yQWu5GQo58UJCZrRSIrrRELfR3wUhRAG4u+HNNzYVS
         ObRrcZSBkf3JodrL8EiCc41u6Y3BXTfs+ry9ZXKOIYoQSnkZY0ujdxxLm5VDWcnN5yuH
         CGB8I37b8Z8SIyVGJAoUwjDsDcSljWD8+6pZnTCibj+bGmP/IiicbK5HBfYVmkCzU+tp
         AvgEqmyqGBkaHsXTXrBOOaBV8U5t71gAw/7cWnXP0UHmTZlNLRDj0WQZrD31ecxiV63H
         A+Nw==
X-Gm-Message-State: AOAM533iLYelctrhQxs3msOhnh4/2cmufr/Ndm6MkaUYijJHZq18sjQD
	8Tplzz6ybaKuAii9nKs+mHCjCrympzzq/hkV
X-Google-Smtp-Source: ABdhPJw3cUvo190p4incwGpYCUGbcZUOGSAXdT8Hsk3W7K07Z5yJFODat2o2lQocJTShbM8fzeZMvg==
X-Received: by 2002:ac8:4e81:: with SMTP id 1mr9225155qtp.62.1602167696321;
        Thu, 08 Oct 2020 07:34:56 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id a12sm3920018qkh.31.2020.10.08.07.34.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 07:34:54 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v5 0/4] ARMv8 Tune add
Date: Thu,  8 Oct 2020 10:34:47 -0400
Message-Id: <20201008143451.18668-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v4:
 * rebase to latest master (which includes a aptch from the original
   series)
 * dropped reorg from this series, but put the newly created files in
   the location where the existing will be moved in the future.  This
   allows for users of these new files to not need to be modified when
   the reorg happens (per request from RP).

Changes since v3:
* Tweaked commit message to reflect the comma-space patch should've used
  --follow-symlinks to get the correct output.
* Fixed bug in A55.inc found by Andreas Oberritter

Changes since v2:
* Removed errant files from the comma-space patch.  Still unknown how
  they are pulled in by that command.

---

The first 3 are clean-ups, then two to add currently unsupported ARMv8a
cores, then the last one is to move them out of the generic tune area to
an Arm specific one.  Given how late we are in the gatesgarth cycle, you
can leave this last one off and I'll resend after the release.

Thanks,
Jon


Jon Mason (4):
  armv8/tunes: Move TUNECONFLICTS
  armv8/tunes: reference parent's TUNE_FEATURES
  armv8/tunes: Add tunes for supported ARMv8a cores
  armv8/tunes: Add tunes for supported ARMv8.2a cores

 meta/conf/machine/include/arm/arch-arm64.inc  |  1 +
 .../include/arm/armv8-2a/tune-cortexa65.inc   | 16 ++++++++++++++
 .../include/arm/armv8-2a/tune-cortexa65ae.inc | 16 ++++++++++++++
 .../arm/armv8-2a/tune-cortexa75-cortexa55.inc | 20 ++++++++++++++++++
 .../include/arm/armv8-2a/tune-cortexa75.inc   | 16 ++++++++++++++
 .../arm/armv8-2a/tune-cortexa76-cortexa55.inc | 20 ++++++++++++++++++
 .../include/arm/armv8-2a/tune-cortexa76.inc   | 16 ++++++++++++++
 .../include/arm/armv8-2a/tune-cortexa76ae.inc | 16 ++++++++++++++
 .../include/arm/armv8-2a/tune-cortexa77.inc   | 16 ++++++++++++++
 .../include/arm/armv8-2a/tune-neoversee1.inc  | 16 ++++++++++++++
 .../include/arm/armv8-2a/tune-neoversen1.inc  | 17 +++++++++++++++
 .../include/arm/armv8a/tune-cortexa34.inc     | 20 ++++++++++++++++++
 .../arm/armv8a/tune-cortexa73-cortexa35.inc   | 21 +++++++++++++++++++
 .../include/arm/armv8a/tune-cortexa73.inc     | 16 ++++++++++++++
 meta/conf/machine/include/tune-cortexa32.inc  |  3 +--
 meta/conf/machine/include/tune-cortexa35.inc  |  2 +-
 meta/conf/machine/include/tune-cortexa53.inc  |  3 +--
 meta/conf/machine/include/tune-cortexa55.inc  |  2 +-
 .../include/tune-cortexa57-cortexa53.inc      |  3 +--
 meta/conf/machine/include/tune-cortexa57.inc  |  2 +-
 .../include/tune-cortexa72-cortexa53.inc      |  3 +--
 meta/conf/machine/include/tune-cortexa72.inc  |  2 +-
 .../include/tune-cortexa73-cortexa53.inc      |  3 +--
 23 files changed, 236 insertions(+), 14 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc
 create mode 100644 meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
 create mode 100644 meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
 create mode 100644 meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc

-- 
2.20.1

