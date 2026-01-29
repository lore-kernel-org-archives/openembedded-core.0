Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8F8D73E8D
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 21:10:22 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25887.1769721016369406210
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 13:10:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=diXeqGLm;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-88a2624bd6bso1940176d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 13:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769721015; x=1770325815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWYoKiObQSnBBD8eAsLZqcN9KtcYjPfkAIF1on+8ZxM=;
        b=diXeqGLmyITRDVpBjMeAQ3WT+6J4T2w65+UkazeQGiR3xWr4cC+EhrTCi5o6xBPloz
         d6vHkJTEohBavLNHuT0KOepqitXO6TFgOHDALRTnQqiuFRIflqbywVIxOxSbH9DsKwQN
         5QoJ6rqr2DdEIOwfxstfQT2dvHJlLkGu7BAbLytpNM7SQwfh2zYVDMPljXknejZNltov
         xYr5cpCvr0nQfHzwN5boCv19fKaATYyIJOr42blY1Dw9tLZjwtC3VrfltF/F2iveCM+x
         s8Kms5W0z8tpMDWzaWLVfRVOLGjavYh6/2fj+97pUSlKRCAefOm6ZL02MnyEEKuHSXzD
         4hXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769721015; x=1770325815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wWYoKiObQSnBBD8eAsLZqcN9KtcYjPfkAIF1on+8ZxM=;
        b=Z13Qo/7f54mtBfUkdcTuVFWxQZMNDCIHaFvljwE1v9Z1B8RuhuUvR6Ik3ylgK5Mo2u
         y3hZad4YYp9L9IcJoDWWL0/x21xLCbAdGaVcOCrswBd10xFXvB68kXL+BdxGYszTcCcJ
         oNFRC3aJl44XAORyDsbCYhmjhW15RtHCUmVAP45b9Msw4SXyAh+V1RCV2S9sLR/9mYgp
         MIYvOe5G7zlYqKHijIskV5UgZR52Rs4QtClrvOttB7pHVR6HolA0x0AJcGbB4ldcNsZ9
         PISEOF6/YOTJeK3CvG3oiT2FOe6xxAE9+IV+ecVfHX2k/acEXDJQxVEO0pTqzRhXEXqE
         AA+Q==
X-Gm-Message-State: AOJu0YwiJSD3fazxjHAvZIImQu3eNDNjtKWhoZIDzptnGxURt40ZzHfo
	u8ALfGf4I77DCctERCGLEEkMq7JFya9YWOp6bZRxAc+YButvC0WWvjScBZdmLy0Gj+ui2A==
X-Gm-Gg: AZuq6aIB84vsNTs3hOP47D2zlmGKVfOMY3GuWXqmrW1aW29AVclu52iNOwG2sChlJym
	Pz+hmKa4GDUWo1+IW82VPPuCBqlkHZQmyl6YhT0XC27/zvl6H9AtBgFMejv4QdE+mKQgkkSUeLm
	TKESlEQNzUq/T2TE/0TJTH1P/bIfeHj/Uh3s+TsF3XkVsNV32w20ZIqoWqPINMFYsgyhSG1B0Pp
	/7ZK+u7yGzGLhkipH6hslChs1nA/lENb3cEBPrH5FoJ/0+i8hEZFP1ranHHXo5lh4/IGmHOzz+l
	sj1seh/jRJ6l++KIZNXFnf/dIYhGqfBAcNB49A+N+CW4v31lRyj+Bp6FX98iULUHfHgFY9ov5+R
	emM5gL6wGpBVykFhkSfrs+WgCHlYHFAOVRBCEIiNmWnSfJPRl3bXka93SvcDyHLmQT+Rf0P3P9o
	ixxBJ5IhFm+OUIBVU6gWu0VHWBAHmyQjfkB6FI9cM9Tu3YJqPQcnw/r0M=
X-Received: by 2002:a05:6214:470b:b0:894:9309:a2b with SMTP id 6a1803df08f44-894e9f3e1f3mr9034486d6.1.1769721015323;
        Thu, 29 Jan 2026 13:10:15 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d36a5fb1sm45251326d6.9.2026.01.29.13.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 13:10:15 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v6 0/4] generate-cve-exclusions: Add a .bbclass
Date: Thu, 29 Jan 2026 16:10:08 -0500
Message-ID: <20260129211012.623827-1-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <188AFCD98EA3E578.3200434@lists.openembedded.org>
References: <188AFCD98EA3E578.3200434@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 21:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230159

Changes since v5:
- Add a new commit to add a new receipe cvelistv5-native to clone the
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
 .../cvelistv5-native/cvelistv5-native_git.bb  |  24 ++++
 .../contrib}/generate-cve-exclusions.py       | 107 +++++++++++++++---
 3 files changed, 160 insertions(+), 17 deletions(-)
 create mode 100644 meta/classes/kernel-generate-cve-exclusions.bbclass
 create mode 100644 meta/recipes-kernel/cvelistv5-native/cvelistv5-native_git.bb
 rename {meta/recipes-kernel/linux => scripts/contrib}/generate-cve-exclusions.py (55%)


