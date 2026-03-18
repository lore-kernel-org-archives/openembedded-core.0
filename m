Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FAF103E17C
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 13:47:09 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14433.1773841619328978082
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 06:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QHGyKQ/0;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-46708149af2so3515864b6e.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 06:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773841618; x=1774446418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kVMP0ma8MV6+SNypmVvCm0x51IYvHK+k0Ai8/hQBTU=;
        b=QHGyKQ/0roTj7g5tTAI2/Lyj+Xt5/DvbI5Y2OC7xsb13q0FvbDwk73Wm6IjYISEbeh
         wl+uVjl3ulP16GBm2U4MK5FiNfATdM5OmyljR4QkPrzgDKmOcV0Ln+TUHuYmuO04vZUF
         BElXiGt8PLcFVvstp6n+j7VLJaiT8eqwlGJsMz/J+q593bEypFRt7qlm/W98PSW2CEjk
         yNQDw+qt+HdUWW0sS+Hlj2uugzl2UTbTuQBVbjAySkxQvsYQ9F4v1Ma5IWznIENUkfS5
         G1RL6MJGkJKtupQ8gq24RPJokQmkVxUye9KWlJaq2+YTyNDX0WY9qtJSQTvryLKq344c
         SkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841618; x=1774446418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7kVMP0ma8MV6+SNypmVvCm0x51IYvHK+k0Ai8/hQBTU=;
        b=YdJ/HjhI43U/snfEZGbq+8PGf9IFP2E9AWD9ZiGlfHVfzF1agJLy1O+i+CDI5W0tmz
         0tVdEgUkDunjcMin3itI9TbhzatyOFxRFZKfW7jqRZmcOGPTAHMMgxBkaxqKpAMPtKtE
         6b/TVSpXoAwtV7jzQhpNWddcq/RQLw3OPgpEpG6bPATyU00eHPUzQJ3lONzwAVDE9GvD
         mMybE1uQZTouFAzNc2SocTyamUwV2GaI4XMC5EJqwFgLDhMsg+SGU56VzITpO8P/6cll
         y876euTZYVteuicf8YZZOfhGCfe35IC3gIrxsBzNISuaLaIWIapmjICfJcvTaCApZMYP
         Wt1Q==
X-Gm-Message-State: AOJu0Yxs+TUPe9Vld2T5PVJNJVxsxveGVxFc99JUYVjsPcjRwM/BkZp9
	Vl4UvRKsHxy1/wxHMt1LZL1hipGROTSqOx39OtImyA6I6sePyxvYLywhOnt/+w==
X-Gm-Gg: ATEYQzweSVitWzq3CPFt8sxF8lxyHouYHGmVG1YVA06uAf29OjqGGpE6xL1jUq5btjw
	o0Qnx0oFGrGmgs1EgXSC5CJFQlgjtAQlp3x6FF/qN5gN7hkpWfG5hvJVVSNyg/OwTteONe51w71
	6pH9rdczyK6D3coWlDOeTZaTbtZVXh+yrfpt2d/vAv+eGSYAEt2qMVyZWB3EPNDa2PgkFhKEnX3
	wTwMPHG8LpTcm5wh4VbghLCnQF9wkt7vhYpXWXnoXJI8ZUQj11X4UNnJ36EIRnTeSkpYV+MGTO1
	QMgd/ldoChgYmsJKWJ7u/WUJEOp4Y/vEtckOfelrFXgBAs8bf0q+Gn7bb2ACei1NTo3+v7YUod9
	jspa6hzijCf5HV/roCCKTz/phY3VAPLEQTvKux9DuC8e1yC534GID8lutVIzh7y0CHOyraGrGg8
	BEZVlK/ZwTgYn7bYkUePFA+wqiMvD8CkA=
X-Received: by 2002:a05:6820:228a:b0:660:ffcf:42e7 with SMTP id 006d021491bc7-67c0dab2335mr2195066eaf.30.1773841618325;
        Wed, 18 Mar 2026 06:46:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::8279])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c0d89c739sm1763625eaf.13.2026.03.18.06.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:46:57 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v7 00/12] Add SPDX 3 Recipe Information
Date: Wed, 18 Mar 2026 07:44:28 -0600
Message-ID: <20260318134655.953233-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184058.533343-1-JPEWhacker@gmail.com>
References: <20260310184058.533343-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 13:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233390

Changes the SPDX 3 output to include a "recipe" package that describe
static information available at parse time (without building). This is
primarily useful for gathering SPDX 3 VEX information about some or all
recipes, enabling SPDX 3 to be used in place of cve_check.bbclass and
vex.bbclass.

Special thanks to Benjamin Robin <benjamin.robin@bootlin.com> for
helping work through this.

V2: Fixes a bug where do_populate_sysroot was running when it should not
be. Drops the patch to ignore ASSUME_PROVIDES recipes, since this is
incorrect (this is already handled by bitbake in the taskgraph, and
doesn't need to be manually removed).

V3: Fixes a bug where meta-world-recipe-sbom was reporting a circular
dependency. meta-world-recipe-sbom also no longer runs in world builds,
as there's no reason to this. Finally, fixes a bug where
NO_GENERIC_LICENSE files would fail to be found in do_create_spdx
(because do_unpack was not run).

V4: Fixes test cases. Adds SPDX_PACKAGE_INCLUDE_VEX to control if VEX
information is linked to binary packages, or just recipes. Defaults to
"0" to significantly reduce the size of the SPDX output.

V5: Fixes dummy-sdk-packages to not generate SPDX output, since it
does funny things with its arch which prevents it from rebuilding SPDX
data properly, and no SPDX data is needed for it anyway

V6: Fixes a bug where SPDX task would not correctly re-run when they
change, which would cause errors about missing SPDX document. Also
updates to the latest version of the SPDX bindings which improves
performance

V7: Makes meta-world-recipe-sbom create the world SBoM when run with a
task (e.g. as part of do_build). Drops the removal of SPDX from
dummy-sdk-packages as these have been fixed to work properly.

Joshua Watt (12):
  spdx3: Add recipe SPDX data
  spdx3: Add recipe SBoM task
  spdx3: Add is-native property
  spdx30: Include patch file information in VEX
  spdx: De-duplicate CreationInfo
  spdx_common: Check for dependent task in task flags
  spdx30: Remove package VEX
  spdx: Remove fatal errors for missing providers
  spdx3: Use common variable for vardeps
  glibc-testsuite: Do not generate SPDX
  spdx: Remove do_collect_spdx_deps task
  spdx: Update to latest bindings

 meta/classes-global/sstate.bbclass            |    4 +-
 .../create-spdx-image-3.0.bbclass             |    4 +-
 .../create-spdx-sdk-3.0.bbclass               |    4 +-
 meta/classes-recipe/kernel.bbclass            |    2 +-
 meta/classes-recipe/nospdx.bbclass            |    2 +-
 meta/classes/create-spdx-2.2.bbclass          |   33 +-
 meta/classes/create-spdx-3.0.bbclass          |   81 +-
 meta/classes/spdx-common.bbclass              |   34 +-
 meta/conf/distro/include/maintainers.inc      |    1 +
 meta/lib/oe/sbom30.py                         |  239 +-
 meta/lib/oe/spdx30/__init__.py                |    8 +
 meta/lib/oe/spdx30/__main__.py                |   12 +
 meta/lib/oe/spdx30/cmd.py                     |   75 +
 meta/lib/oe/{spdx30.py => spdx30/model.py}    | 5935 ++++++++++-------
 meta/lib/oe/spdx30/stub.pyi                   | 2544 +++++++
 meta/lib/oe/spdx30_tasks.py                   |  459 +-
 meta/lib/oe/spdx_common.py                    |   78 +-
 meta/lib/oeqa/selftest/cases/spdx.py          |   28 +-
 .../glibc/glibc-testsuite_2.43.bb             |    1 +
 .../meta/meta-world-recipe-sbom.bb            |   38 +
 scripts/contrib/make-spdx-bindings.sh         |    3 +-
 21 files changed, 6837 insertions(+), 2748 deletions(-)
 create mode 100644 meta/lib/oe/spdx30/__init__.py
 create mode 100644 meta/lib/oe/spdx30/__main__.py
 create mode 100644 meta/lib/oe/spdx30/cmd.py
 rename meta/lib/oe/{spdx30.py => spdx30/model.py} (52%)
 create mode 100644 meta/lib/oe/spdx30/stub.pyi
 create mode 100644 meta/recipes-core/meta/meta-world-recipe-sbom.bb

-- 
2.53.0


