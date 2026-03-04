Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49559EB7ECB
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:44:04 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15041.1772621035684009854
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hnJ5gyJh;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so3665074f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 02:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772621034; x=1773225834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N3r/SBAJCBtQIsceFa1KWrpuhWfOOvLvhQC8qX3/KK0=;
        b=hnJ5gyJhe/gHLzSlbhdvyokEFWLwBJUr9gRXBtHVsQUBwMXfVr3vghMAAc/o9qhSdi
         TuumjwGCaZCApwPUP/3yTiD+2QIc22wwA8KWvPeW7TTJFh0QDAM+fzZxi11h3QGsg61d
         g36G7XPAovqe/xHYfzLFWHZWkH9uRWGCUfmXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772621034; x=1773225834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3r/SBAJCBtQIsceFa1KWrpuhWfOOvLvhQC8qX3/KK0=;
        b=dWa05uaiBzibWidQri+cZwTbmVhQBVRFzpiqk3z8OSx/SymWqgliq6TV8oq/ruEBuT
         Lvg4U2RtAVTnsI7CwOtE+g47spZypi9T5sX27+bTAIrxFCPuYsOgeCEOUBYWV1CcDrVn
         1qb47rjxh/2QOJQQUOwZtROM5JklKj8kwtYWnAXn6G3ghap3/0XrBBDxEg2TjD5O0q5J
         41lfaVkmj8Cb791WHy2xNVNx9h7qzmtNO1EdkzU+xPrYxRA+iIXE/DgEYsbFAo3cDvGD
         p6cFyyrV4bpi3AYtwwRgZminuDYtgXQIQMFNsThV6rHJuDLUxJCfo6CK3nqwlbLuW/Yy
         SbdQ==
X-Gm-Message-State: AOJu0Yzp5HdoiDs8gvipbYMvd4Zn+l5zEQ5fh8HKScvTg6wRDLSZXrST
	AY55WVkE/NWamnXo9CqZ1LBOIfIr6YXGOLEmJgZvWI//a76lSDzU8oGk8zK+ynP8s1vxnGjD/58
	dIULglaI=
X-Gm-Gg: ATEYQzwnSdHwnMKRDmqrI9ZaJ1lgsw8u/hRVOvb3nZV92wIsJO1Km5QhWBm3ibCBWuO
	Ypm3qEDciBv5zDlnC7B/9F4rWio24slOtf4om/AvwTgsSaKteEhH91efCxfVuG1V8JQKug//xaQ
	DOQeEik5f4qUe6AW3MqcfgHUh9krqozgFnn532Oiy470gAWTRg2ksvEEP5qe/p+5wCRzoO/59F/
	EVSDKk2D4tVPUZUV4I4u5zyUgTUFiY+gc3WINzrFx5/ZF6rDhy9yoYjFuqvLfbaOgoDVcx59h5F
	TXLtHZ42Q7VAbG2yU6FI/ZSD3DRgvx+BGpQOCzFqcdgJbehacVbwEZUTZCqjLElVxBv1fkpsl2a
	rCMXSVSezCc7oISM9j7fcI3RYVP3INfZx5iFYeuxI28mI+mjf3ZWV4PQtTbgBaJ6jVqftEs1496
	quFtAZXUOm67PM1sORyXy1hEkdePVRIND3x20Qi4/oNO95is3qVweKVJrikuv/0AH0yn6PTokVW
	E7LLt2WpGSL11NE7gUD9AydZeaHmgdy
X-Received: by 2002:a05:6000:1788:b0:439:ba4d:bf40 with SMTP id ffacd0b85a97d-439c80146e5mr2499607f8f.43.1772621026131;
        Wed, 04 Mar 2026 02:43:46 -0800 (PST)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b34b6252sm25638168f8f.10.2026.03.04.02.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 02:43:45 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [RFC PATCH 0/4] Clean AUTOREV usage, add revision check for every SCM URI
Date: Wed,  4 Mar 2026 11:43:38 +0100
Message-ID: <20260304104342.869457-1-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232373

This patch series introduces an additional "insane" test to check whether every
URI within the SRC_URI variable has a revision. This is the purpose of the last
two patches.

However, the new test raises a "deep" issue when AUTOREV is set:
"AUTOREV/SRCPV set too late for the fetcher to work properly". This occurs
because the test accesses to the SRCREV variable, at the line:

if d.getVar('SRCREV') == "INVALID":

The following self-tests can raise this issue (if my test is enabled):

$ oe-selftest -Kv -r bblayers.BitbakeLayers \
    -r pokybleeding.PokyBleeding.test_poky_bleeding_autorev \
    -r devtool.DevtoolUpgradeTests

Or a shorter one:

$ recipetool --color=auto create --devtool -o /tmp/devtool4819z5wk \
    'http://downloads.yoctoproject.org/mirror/sources/i2c-tools-3.1.2.tar.bz2' \
    -x ${BUILDDIR}/workspace/sources/devtoolsrcdcviuvn9

The common point is AUTOREV, which is used as default value by devtool and
recipetool. When AUTOREV is parsed, this triggers the call to the get_autorev()
function (see [1]) which sets the internal __BBAUTOREV_SEEN variable.

If the associated URI is a SCM one, there is no problem. Otherwise, the above
error will occur (see [2]) because the fetcher code doesn't take AUTOREV into
account (see [3]).

Why has this error never occurred before? In my opinion, it is related to how
devtool/recipetool parse and run their crafted recipes. Firstly, these tools
unconditionally set AUTOREV as default value for srcrev. Despite this value is
not written into the temporary recipe if SRC_URI doesn't have a SCM URI, the
tools seem to keep it in memory.

Next, the crafted recipe is run. Without my patch series, no error is raised
because I think there is no use of SRCREV in the execution flow. With my insane
test only, which uses SRCREV, the test code is parsed and expanded. As SRCREV
is being used, its value AUTOREV is expanded and leads to function
get_autorev(). As the URI is no a SCM one, no code handles AUTOREV and the
above error occurs.

This is why the first two patches: their purpose is to set srcrev to AUTOREV
only if the submitted URI is a SCM one. These patches resolve, the
"AUTOREV/SRCPV set too late for the fetcher to work properly" error disappears,
as AUTOREV is only set when required.

I sent this patch series as RFC because I need feedback on this issue. What
are your thoughts on the error and my fix? Is my theory correct about
devtool/recipetool keeping some variables in memory before running the crafted
recipe?

Thank you

Corentin

- [1] https://git.openembedded.org/bitbake/tree/lib/bb/fetch2/__init__.py
- [2] Function finalize() from https://git.openembedded.org/bitbake/tree/lib/bb/parse/ast.py
- [3] Function setup_revisions() from https://git.openembedded.org/bitbake/tree/lib/bb/fetch2/__init__.py, only called from SCM fetchers

Corentin Guillevic (4):
  insane.bbclass: check revision for every git URI
  layer.conf: enable test for revision alongside a git URI
  recipetool: create: use default AUTOREV only for SCM URI
  devtool: use default AUTOREV only for SCM URI

 meta/classes-global/insane.bbclass | 27 +++++++++++++++++++++++++++
 meta/conf/layer.conf               |  3 +++
 scripts/lib/devtool/upgrade.py     |  7 ++++++-
 scripts/lib/recipetool/create.py   |  7 ++++++-
 4 files changed, 42 insertions(+), 2 deletions(-)

-- 
2.51.0


