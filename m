Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A86CA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 10:13:10 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.97890.1755079983433525078
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 03:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aMXSZtyE;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-af91a6b7a06so1076655366b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 03:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755079982; x=1755684782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8EtAoR4I3sHo6Ir+0Yl5RylfhfaJwxqPSKno/BAXn9o=;
        b=aMXSZtyEAffZOw0wbWLhfGFLpl+aIaVApKwR6ifoFOfo8HBf9fleJmVScmh72r5KI7
         xvMRqu0iyDUmsT/rsj95pM8xkYQL57fwLlySahCC80CJGl5l7peXHslCWU2SvRWNJlwk
         0XIBDXa1vIAEvvtFlmRLdXilVUmIdWJsMAUlEMEaaeBLZZf5cHhYjUPBFNI4zMc4+Ra1
         lbwwWXaNCW6F+WY84gkd6kwFYdNSQp9fP/BZuFBEc2VxT1aVdcHnokhBNs1QUhowLRsE
         J+48plEOMeBTK1Dj/ph8nz1nLGKzEuQjdQUCY0GvF8e9NGyOElSu3pN42+mZaqu7bEv2
         7Zqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755079982; x=1755684782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8EtAoR4I3sHo6Ir+0Yl5RylfhfaJwxqPSKno/BAXn9o=;
        b=C7gFi8kg2d3rZXnIE1EI7uWBRydge9vxZI35uWRf5+YLTSPEXvdXwnMrgW9VhnirjH
         ULCmuNxF2djBUZPrfRqH72c45ThKDwTM7YPoPxCVtvLhyrXMxk6MBO/17tOQwr3MvLLH
         6OsKWH1eTmEdiaY14ic6v32EHn6F7FJmL2M0YOSGo8vko74tzOHUZ48eiQI5UURX8x8P
         BZ+GSRx99UZR4ujXa2PBeBV4qu/BuU+buAZsJ1xwqFzyAuR85UKC+AnMdQY6fqbsQcAZ
         pyO6gmgZ8+bQFoWCSuyVCCnb1a4/4ikDsT9l+sjk8y/owliRNXv/VEBMuOFaLrHvLfFQ
         5a9Q==
X-Gm-Message-State: AOJu0YxQ7K3SbYxQ98EtqetfOZ2R6aWfP4GaPcL1ORDqD/kjdOk6NX7h
	l2v6s5Xump4ArH74+5RWe0nHDY4HOgkrkwdaODhtDmaMqHqrIxQlWorshPlFUw==
X-Gm-Gg: ASbGnctDaMR3oxaDQBFNlIsNijxCR84NjEe6Bmxd7faSG45i5jFgJNHPacfBm23Niv3
	+P7vDmUczJq5ypT0Qwc94hg7TpEHFZ2wovQsje0hU6GGcGCjWJ38y3e5v41VrTFE9m7beRjIns+
	KkNQPPlLhYrU+EcwuPS1AfLoM3Fnk99wAFokLn4QWVsxRf+4CNX+EqOwFZflt8/169EEVu6gnR9
	lMFBcHdjrikehi5Iw7O6qFZqeBELWnOw7Ialhj2R5an6fsVTP/Aq5fnlld0vM5Ips9K7InBLUWf
	Q8zQINRD4eOzKOFcifmtbDKBLeqLBRDqlTcj9TjLpfEBgON2S2o7SOBow1Tu3eqqq1aknoiGJld
	2y0dcPXySR8C1Gt4LbUs=
X-Google-Smtp-Source: AGHT+IEJPV+ZNV9QTVmfm3mLm+9LTdVyC6ZUFs//YliI43eTpuHuoyEV7nms2yKh92z4sDNQVOK5ng==
X-Received: by 2002:a17:907:3f83:b0:af9:71c2:9c3 with SMTP id a640c23a62f3a-afca4df4c7fmr255101566b.35.1755079981288;
        Wed, 13 Aug 2025 03:13:01 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a1bf9sm2373597066b.31.2025.08.13.03.13.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 03:13:00 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sysstat: upgrade 12.7.7 -> 12.7.8
Date: Wed, 13 Aug 2025 12:13:00 +0200
Message-ID: <20250813101300.247807-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 10:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221800

Changelog:
* sar/sadf: Add new metric kbshmem.
* sar/sadf: Now compute used memory as total memory - available memory.
* sadf: Set availablekb to frmkb during conversion.
* cifsiostat, iostat, mpstat, tapestat: Add new option -U to display
  timestamps in seconds since the Epoch.
* Trap SIGTERM with all sysstat commands.
* mpstat: Go to next line when Ctrl/C is pressed.
* Add support for out-of-tree building and testing.
* sar: A_PWR_BAT: Fix wrong size used in memory initialization.
* Makefile.in: Update dependencies for install_man target.
* Makefile.in: Remove unused TFLAGS variable.
* Makefile.in: Remove old references to nfsiostat.
* DTD and XSD documents updated.
* NLS translations updated.
* sar, mpstat, iostat, cifsiostat and tapestat manual pages updated.
* Various cosmetic changes in code and Makefile.
* do_test: Add test target for out-of-tree build.
* systest: Explicitly set signal to SIGINT.
* Non regression tests: Remove root symlink in tests directory.
* Non regression tests updated.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../sysstat/{sysstat_12.7.7.bb => sysstat_12.7.8.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.7.7.bb => sysstat_12.7.8.bb} (97%)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.7.7.bb b/meta/recipes-extended/sysstat/sysstat_12.7.8.bb
similarity index 97%
rename from meta/recipes-extended/sysstat/sysstat_12.7.7.bb
rename to meta/recipes-extended/sysstat/sysstat_12.7.8.bb
index 0fa4a3c950..2194dfc956 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.7.7.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.7.8.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://sysstat.github.io/"
 LICENSE = "GPL-2.0-or-later"
 SECTION = "console/utils"
 
-SRC_URI = "git://github.com/sysstat/sysstat.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/sysstat/sysstat.git;protocol=https;branch=master;tag=v${PV} \
            file://99_sysstat \
            file://sysstat.service \
            file://0001-configure.in-remove-check-for-chkconfig.patch \
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/sysstat/sysstat.git;protocol=https;branch=master \
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRCREV = "dac10e13c70d1102aa3beea10135a3ed60520c36"
+SRCREV = "5841596edf7f5e53288cb56400e0c0c1da5f2415"
 
 DEPENDS += "base-passwd"
 

