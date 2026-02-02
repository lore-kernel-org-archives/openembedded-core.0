Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4032E7FDDA
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 20:55:39 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1116.1770065734597725992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 12:55:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d36SABuI;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-8887d6d237fso4779076d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 12:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770065733; x=1770670533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kdhx+2ulk5w/LY/72Wl5JTuFv9GjUS+YDr6P+bhYyc4=;
        b=d36SABuIhBJ8tqFy/xRL8YpiMxCNdJqrM/ixgjo6ID4z9LUJmVowQPuwTHhZpl2Rzy
         N2em02kIkbJu0jcjxYNE860f86rKfV+jy0xk12kHW9reYVKqLP8xKVi67QEkGw3u6w2g
         nlW8ISc62JOWHjHL7cAc2iqHV5g/+d946ubvOs3yWeqZPaN1sVeoyeFUhIiU489I1pit
         V4po1bpyAE6EC41QYPAFr+B1GLdIs8igfjZNum00DqNdQEDd0ErcWqTOQPeCkrnGksTp
         Z0K4r4ECsf0ng50mRjkfCz3StcQ5juMM8XfwTK3G+SkKTZxdvLzDqQp2LekEMhn2EedB
         75Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770065733; x=1770670533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kdhx+2ulk5w/LY/72Wl5JTuFv9GjUS+YDr6P+bhYyc4=;
        b=EVJsKhUYcWkegG7qlgFjRrSE2yrE6eYLYBGZl+Lgfo3EBNVCmP9PeWU/CQmQhrYkDn
         xZBP7vYmcovWG5muS2f5JSeCkQ08Yc09Iy2vosRYdQFAxZ1cnnCCdww+VcRML8hxeUhW
         XXw+O6Iz2ZZW+Xl9IYbRzfW/7PF2PLOagf6qXVa2iD4baBzqJuRL2RXF+LVQpZLvooez
         Wsd+TYk9IPvezae/pvyATNr9tQbf+cHiGai8h8dgthNUOmyI5On6rFvhhmwB79HEwcA1
         VXgoPh1fL9W/bKKOXoMPSyk0S25ZwKVnSEFjj0BcfD32u+k1CroiNgRcr2LTC0Z/3sMQ
         Q1RQ==
X-Gm-Message-State: AOJu0YxH9+0/kPw/CXwMXwgoWRzTmrB05CAQxafwqFgRWmOgyA7jRKEy
	asxzPn6uE6Fam8bH6/pzKTf63hxR+1r+lvm1Dko/9QQQvh2opHDteNW6UkBXl0L0qyMIfA==
X-Gm-Gg: AZuq6aKqj0fGamp4xKSv67qYMctAR9aXc3Lu0xeQ6+JBDHRZr0raMzOchD2B+YGfbUs
	jIGcW3aSQ6PUCjQMXIZ+BFnR6CahuaoyPyPjiUf/sRFCqr11M4J9AabAQtWzLbCSz2iN17FpEB2
	u0Dtto9TZR6j1awAV6QqvUfy1esKh2Mu+rM5KQmLswz6InbEakKbHirf8nr1VLFnKE2zKQa2xrw
	zK2Jy8nY7UkIYbNZ7y1BneYfQsIWRSgKwa+zCqx5FtSwGi9l0paRcK6p9/ACdt2CZrOBwoiiMDP
	Ce0BOVNRFsHxTjyBPmqdV0B9cyYcGHugHQI/I6YazvYjpstSOSIN3Um9OyaBHsgPzllLoQ5iRbk
	Q9rmhizv8l8Lh4w5ZObK6bj0r4/tFJDxrnA2bOawN1n/X+083acd9ABDCFzyTeqquhoKGSiA+ej
	bISemBeVOtQVooi6yYnQ/vQb2Yw2W94fq1Jv564mKmVKnOpYoRt0HUsXE=
X-Received: by 2002:a05:620a:4141:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c9eb20cebcmr1257256285a.2.1770065733443;
        Mon, 02 Feb 2026 12:55:33 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d28c71sm1356221285a.33.2026.02.02.12.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:55:33 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	ValentinBoudevinSFL <valentin.boudevin@savoirfairelinux.com>
Subject: [PATCH v7 0/4] generate-cve-exclusions: Add a .bbclass
Date: Mon,  2 Feb 2026 15:52:26 -0500
Message-ID: <20260202205231.2134908-1-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <188B4BEFFC6C387A.3271208@lists.openembedded.org>
References: <188B4BEFFC6C387A.3271208@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 20:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230399

From: ValentinBoudevinSFL <valentin.boudevin@savoirfairelinux.com>

Changes since v6:
- Update the maintainers.inc file to add new maintainer for the
  cvelistv5-native recipe.
- Update cvelistv5-native recipe to remove the variables CVELISTV5_DEFAULT_SRCREV and CVELISTV5_USE_AUTOREV for a fixed
  SRCREV usage (AUTOREV will be recommended in the documentation if the user wants to use the latest available commit).

Changes since v5:
- Add a new commit to add a new recipe cvelistv5-native to clone the
  cvelistv5 repository.
- Update the script generate-cve-exclusions.py to use provide the JSON
  format output with the INC output at the same time using --output-json-file and
  --output-inc-file options.
- Update the .bbclass to use the new cvelistv5-native recipe.
- Remove tasks and variables from the .bbclass to simplify the code:
  * Remove the do_clone_cvelistV5 task.
  * Remove __anonymous function to setup SRC_URI and SRCREV.
  * Remove the variables GENERATE_CVE_EXCLUSIONS_SRC_URI,
    GENERATE_CVE_EXCLUSIONS_SRCREV, GENERATE_CVE_EXCLUSIONS_NETWORK, GENERATE_CVE_EXCLUSIONS_WORKDIR,
    GENERATE_CVE_EXCLUSIONS_DESTSUFFIX, and GENERATE_CVE_EXCLUSIONS_UNPACK_DIR
    since they are not needed anymore.
- Remove direct inclusion in linux-yocto.inc and let the user include the
  bbclass in their kernel recipe if they want to use it.
  Using ENABLE_KERNEL_CVE_EXCLUSIONS variable to enable/disable the feature is
  not needed anymore. Including the bbclass is a cleaner implementation compare to set a variable
  to enable/disable the feature.
- Add the variables:
  *GENERATE_CVE_EXCLUSIONS_OUTPUT_JSON
  *GENERATE_CVE_EXCLUSIONS_OUTPUT_INC
  to customize the output paths of the generated files.

Changes since v4:
- Patch 2/4:
  * Renamed the bbclass to kernel-generate-cve-exclusions.bbclass to better reflect its purpose.
  * Add new variable ENABLE_KERNEL_CVE_EXCLUSIONS to enable/disable the
  feature.
  By default, the feature is disabled to avoid unexpected behavior on
  existing builds with linux-yocto.
  * Add new "__anonymous" python function to setup the variables SRC_URI and SRCREV only if
  this feature is enabled with ENABLE_KERNEL_CVE_EXCLUSIONS.
  Also prevent from modifying SRC_URI and SRCREV variables in the default linux-yocto usecase.
  Now, the recipe does not have any impact on the basic "linux-yocto" recipe if the feature is disabled.
  * Add new variables GENERATE_CVE_EXCLUSIONS_DESTSUFFIX and
  GENERATE_CVE_EXCLUSIONS_UNPACK_DIR to customize the working directory path of the
  class.
- Patch 4/4:
  * Update the inherit statement in linux-yocto.inc to reflect the new name of the bbclass with
  "kernel-generate-cve-exclusions".

Changes since v3:
- Patch 2/4:
  * Add variables to control offline mode, source URI and
  SRCREV for deterministic testing (GENERATE_CVE_EXCLUSIONS_SRC_URI,
  GENERATE_CVE_EXCLUSIONS_SRCREV, GENERATE_CVE_EXCLUSIONS_NETWORK).
  * Updated generate_cve_exclusions task scheduling to be executed before
  do_cve_check.

Changes since v2:
- Patch 4/4: Inherit the new bbclass in linux-yocto.inc instead of
  individual recipes.

Changes since v1:
- Patch 2/4: Removed the mandatory execution of the
  generate-cve-exclusions class on every build. It now needs to be
  manually run using:
    bitbake -c generate-cve-exclusions <kernel-recipe>

ValentinBoudevin (4):
  generate-cve-exclusions: Add output format option
  cvelistv5: add a new recipe
  kernel-generate-cve-exclusions: Add a .bbclass
  generate-cve-exclusions: Move python script

 .../kernel-generate-cve-exclusions.bbclass    |  46 ++++++++
 meta/conf/distro/include/maintainers.inc      |   1 +
 .../cvelistv5-native/cvelistv5-native_git.bb  |  19 ++++
 .../contrib}/generate-cve-exclusions.py       | 107 +++++++++++++++---
 4 files changed, 156 insertions(+), 17 deletions(-)
 create mode 100644 meta/classes/kernel-generate-cve-exclusions.bbclass
 create mode 100644 meta/recipes-kernel/cvelistv5-native/cvelistv5-native_git.bb
 rename {meta/recipes-kernel/linux => scripts/contrib}/generate-cve-exclusions.py (55%)


