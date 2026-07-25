Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F665C531F9
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 16:27:09 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.264.1784989820959259467
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2026 07:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cnaxUImn;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: zizuzacker@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf452def93so19667045ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 07:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784989820; x=1785594620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XU+6tSF9n6Qmn5LGs2I3ndlxkSJb1w0INgTnnHeUP2o=;
        b=cnaxUImnWsbNkfxyqXHG/sTiV5qGUzfkiyMGxt/yhoIZ8U1COSv7lzfzKCreUkJ+XX
         Mh0c7x/PdAcGJXJi4nsnfyW80A2+1KxEbhV5142XwcYMavPfCkSrRPKuTbxdGKm/7wNz
         w4NwESB6AVnZ8PBjoDAvHRsukhIJOETonoA+JgwSj5Tp03fu5MBFHnD/utf9qisK2vOW
         Z5JbJbwNpBjGE+hVgpjsVGeMqflsIuCreHgot0IID2spnWmGSaTeTgJTJPj2qVX18oZv
         2AeuVk0z3ic2uyyhRfjl971SwTCetYrhgav9liTpzFO0UYXhuIS0EJPlyYkyFKp0igoJ
         0Csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784989820; x=1785594620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XU+6tSF9n6Qmn5LGs2I3ndlxkSJb1w0INgTnnHeUP2o=;
        b=EtZyYi86q7QStU/2U4qw9c/y4Vs3aiItQW1dQ/j4m9/Nzb7UFBf3lOfOWAOWOU19m5
         ksPnZst6Ug9R+nevWw/jYVlr1yZXcIEy6QhU4iEQ2DF+ZpAN/8VuAmNj+2sTCbaHJMNk
         gwvsVKMA6oEWJNqodkoQWhIJadBR2aLrYuSh1u+e3h7Xu6QNkMFXl9qZm8hsNllsEyVe
         mL/0EeDLXOxTYebP+mYM1/lt3Wo85KXYDQx7h/SiK84OEwTWkYmyCipS8YLlVTPw74nc
         7frE/I39eaIu5JmmEF8RoBsE7gLhN1NcxFHI1RD6Akm/Ergv4L5ZlZafdqBTJ7uom0D3
         pjTw==
X-Gm-Message-State: AOJu0YzrsEuWKIBBHnD2yZiC8AJWSuyV1YabSA9e8aNUfrNxaQTOXZmD
	4SXE8rWXEx+dgkLRsDmlLKaIvp0nua54kFDvLK9yk5bCvab8USaNlqaZE3imNyPy
X-Gm-Gg: AR+sD11MKT22v/9WdRibV6ogHZxMn3FXno/fnwT21Gvr3Dc41VMAGTMClSVczN0MhGN
	GsXDfNL4q1F+pdU5uznU0OrI/AkSVfgO8D1VdTxkb8IgVDu9T5lAT+MD25SSjt92yaGQ/JAo4uD
	bcDZc7cigJywMFS9FBIsad8wURwXkQTa23APhfG6udHN/8i4NqruGfLvLP3/T8wsO2CTLxs4hBh
	FQM0g+0nbuSczWZGil94TU9r8616pE1S7QgHffabQimdcVyZbfrmlX3rQ4elP584c8KFXeDd8DC
	75FtVfHbx790p9JshXCSP2ilvdALZkFpkKlObAZSHk30CqfKxdZq12xXmkxDLformG30Y6Nvhco
	Vsuf+Y7OO3/+Mc5B32mTNaAUd21XCrJXfn8VvX5pTvTBo0++BgtJaroWkGME8jL5CuHd9
X-Received: by 2002:a17:903:2392:b0:2cf:18e5:1d18 with SMTP id d9443c01a7336-2cfd72c00a1mr44649945ad.29.1784989820256;
        Sat, 25 Jul 2026 07:30:20 -0700 (PDT)
Received: from ltu.. ([2001:ee0:4041:efc5:bfb0:104e:8f:340f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419e3asm11290940eec.11.2026.07.25.07.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 07:30:19 -0700 (PDT)
From: "Zk47T" <zizuzacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: zizuzacker@gmail.com
Subject: [PATCH 0/1] rm_work: recipe self-exclusion vs conditional RM_WORK_EXCLUDE
Date: Sat, 25 Jul 2026 21:30:14 +0700
Message-Id: <20260725143015.23804-1-zizuzacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 16:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242016

Reported in [YOCTO #16157]: with rm_work enabled and

    RM_WORK_EXCLUDE:qemuarm64 += "bash"

in local.conf the build breaks, at gcc-source do_patch for the reporter.
Still reproduces on master.

The recipe the user named is fine. What breaks is every recipe that
excludes itself with RM_WORK_EXCLUDE += "${PN}": += appends to the base
value, and the override then hides it from both guards in the class.
Details in the patch.

gcc-source is the one that hurts. Its WORKDIR is the shared source tree
the other gcc recipes build from, and it gets deleted despite the
exclusion: 1.4G of unpacked, patched source down to an empty directory.
On the next build that needs it, bitbake re-runs do_fetch, do_unpack,
do_patch and do_preconfigure to put it back, which is exactly what the
exclusion is there to avoid.

Being precise about the failure mode, since it decides how bad this is:
what I reproduced is the deletion and the redundant rebuild, and in a
two-step build (gcc-source, then gcc-cross) it recovers on its own. The
reporter's hard failure at gcc-source do_patch I have not reproduced. It
looks like a race, since nothing orders gcc-source's do_rm_work against
other recipes still reading that directory, which would also explain why
they saw it in different places on different projects. Either way the
exclusion is being silently defeated.

Note it only shows up on a cold build: with warm sstate the tree is still
deleted, but nothing needs it again.

On why only four recipes: six places in oe-core exclude a recipe, and the
kernel case plus externalsrc.bbclass already use d.appendVar() and were
never affected. The four using += all descend from 1f2a3cdadac1
("gcc-source.inc: cleanly disable do_rm_work"), which dropped deltask and
settled on RM_WORK_EXCLUDE as "the API that is meant to be used for
excluding recipes from cleaning". deltask had no exposure to this, so
that is where gcc-source regressed. The mechanism is fine and unchanged
here, only the operator is wrong.

:append is never weaker: += is lost for all three override forms
(:<machine> =, :<machine> += and :pn-<recipe>), :append survives all of
them, and with no override both give the same string so nothing rebuilds.

Making the class tolerant instead, by unioning the resolved value with
the masked base, does not work: getVarFlag() checks expand_cache before
honouring the parsing argument and parsing is not in the cache key, so
the second read returns the first one's answer. Looks like a separate
bitbake issue.

Not fixed here: RM_WORK_EXCLUDE:<machine> += "x" still replaces rather
than adds, so combining it with a plain += loses the latter. That is
ordinary override behaviour, so the patch just documents the working form
in the class header.

Tested on qemux86-64 with rm_work and RM_WORK_EXCLUDE:qemux86-64 +=
"bash", patch applied to a pristine 9d89b3b802 with unpatched bitbake:

 - bitbake gcc-source with an empty sstate: unpatched leaves an empty
   work-shared, patched leaves the 1.4G source tree intact
 - all four recipes keep their own name in RM_WORK_EXCLUDE again
 - with an unconditional RM_WORK_EXCLUDE the resolved value is byte
   identical before and after
 - all 952 recipes parse, core-image-minimal builds, 5608 tasks
 - oe-core patchtest: 10 pass, rest skipped as not applicable

Nguyen Minh Tien (1):
  rm_work: fix recipe self-exclusion lost when RM_WORK_EXCLUDE is
    conditional

 meta/classes/rm_work.bbclass                        | 6 ++++++
 meta/recipes-core/meta/meta-ide-support.bb          | 2 +-
 meta/recipes-core/meta/wic-tools.bb                 | 2 +-
 meta/recipes-devtools/clang/llvm-project-source.inc | 2 +-
 meta/recipes-devtools/gcc/gcc-source.inc            | 2 +-
 5 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.34.1


