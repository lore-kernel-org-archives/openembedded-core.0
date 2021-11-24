Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4377DC433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:31 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.4149.1637788470065719821
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WoOM7qA1;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id v22so4078474qtx.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tESRTf5YapKJldHRNFrAsGKZhtZmpPN5XrljEH9cnGE=;
        b=WoOM7qA1lRrrAUEqwEs3xn599GZSwDt+BZmTyZTqI3vWKdjm/nfs0yl3pfGemd3ZVP
         Y9GzAFVemYusIzz8MgTm1JnW4eU5BkoaX5TZ133iLZrDSigFLhQggQPm/at3GRckZ08a
         c/bxNUPCIj4YzT8MFGz+sXW27nCwKKNQuGm7I8+w/ipTrDgOpWrrTWbs/hsLwDk9SbLW
         hUQzxk+uvFu18m7rYpd/QcMQTozf5W0sQy6pgE24c0Emua/IQKckiYbZ0xE0tVgulc81
         rTOqh1+O2UXEwVtYRZRxdamU1AJV1I8Yfz8Iu44WgtFE0VeWRBMyGxyddoYxJ7nSNyRH
         i6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tESRTf5YapKJldHRNFrAsGKZhtZmpPN5XrljEH9cnGE=;
        b=nec1jb4z/u4CbqHTyy0Ehc0oFXvgHahJtXrMSf9F2XrGPmeVPs4yYFxaXjYdlu9Xjx
         wfmrHRNuOJ/CUwoO2uX4rlFWtl7b+NgiEBY8KK2kph+SvGK4N7/SkUBvnfqiH8YdHBmD
         wx+akNkJG1qQbAaGVXBeaSzneHvFUHvnpudzzhdGBXuEiu/5eD+KGMWPepz1TmJXi3Fb
         YtcJTagw2feK3bbbTYiM6SPCOGYxB79/O3w69no5Fd/Rlfs/cWY3JYjnsqisCmGcmBzL
         S9SwvAVQszAqtCUtNvU3AbBm1h46f4SDK47Xp1QRQygsJBCo4SoZg1qvwMIwhNloCEXS
         fI2A==
X-Gm-Message-State: AOAM531fET2d7X43GIw8XuTjoa1S/Ek7GWXzWPRa2OK2nQXM82w0mJ+T
	dV9/68wRc22IixbyOatY64I=
X-Google-Smtp-Source: 
 ABdhPJzwV77XA2ZAhIpFJf7zqhL4VFSHbzFewQVB2AZRU9+ikVhrGB+G3Ey7QsvizmKmq0glKzpngA==
X-Received: by 2002:ac8:4547:: with SMTP id z7mr11239139qtn.50.1637788469032;
        Wed, 24 Nov 2021 13:14:29 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:28 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 00/20 v2] kernel: consolidated pull request
Date: Wed, 24 Nov 2021 16:14:06 -0500
Message-Id: <cover.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158746

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's v2 of the pull request. I see the -stable updates merged, so they
are obviously not in v2.

New in v2:
  - reworked the python-dtschema recipe to properly have depends/rdepends
    to fix warnings
  - imported 4 new dependencies for the recipe
  - fixed up the kernel-dev PACKAGECONFIG to not generate a QA warning

The v1 pull request text follows from here:

There's a few routine -stable updates at the start of this, and then some
more painful (and RFC) commits.

As part of this series, we fix one pkg-config issue that was preventing
x86 from doing stack valildation during build. At one point it was
increasing my build times signficantly, but that seems to have gone
away now. If we see something like this on the AB, we'll have to keep
the fix, but disable it by default.

The next big chunk of changes are the ones we talked about during the
tech call today. The 5.16 kernel has introduced mandatory dtschema
checking for device trees built through the kernel.

That checking pulls in a reasonably large amount of dependencies to
the kernel build: libyaml, dtschema, jsonschema, etc.

We weren't able to even run the validation at all, due to the kernel
calling pkg-config directly to check for libyaml, which is the target
pkgconfig and failing on missing dependencies. Rather than patching
the kernel, I've finally given in and made the do_compile task set
the PKG_CONFIG variables to point to our native-sysroot. Since the
kenrel doesn't use pkgconfig for target decisions, and has quite
a few calls directly to pkgconfig, this is the best short term way
to get all those checks working.

Once we are past yaml, we need to create the dtschema recipe, and
bring in the dependencies from meta-python. I've put myself down as
the maintainer for all the new recipes, but otherwise, I haven't
changed or modified them.

BUT! there are scenarios where a non-conformant dts file is being
built, or we just don't want those dependencies in the built. To
work around that, I took the suggestion from this morning and
created a python3-dtschema-wrappers recipe. It contains three
scripts of the same name as the ones from the real package. When
put in the dependency for a kernel build, it can pass the dtschema
steps.

Finally, I created a reference PACKAGECONFIG for linux-yocto-dev
to enable/disable the main package and wrappers (the wrappers are
used by default). I haven't put this into kernel.bbclass yet, since
it is version specific, and it needs to soak for a bit. But if
there's demand, it is something that can be moved to kernel.bclass
(along with a few other version specific dependencies).

Note: I haven't done an AB run with these yet, so I could be
missing some python dependencies, etc, but I wanted to get this
out to the list in case others are running into this with
v5.16+.

Bruce

The following changes since commit 0ec51bf52a930982ac03976781010a638d4cb0ef:

  logrotate: add a link to upstream review for one of the patch (2021-11-24 10:00:10 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (18):
  linux-yocto-dev: bump to v5.16+
  kernel: export native PKGCONFIG variables
  python: introduce python3-dtschema
  python: import jsonpointer from meta-python
  python: import jsonschema from meta-python
  python: import idna from meta-python
  python: import rfc3339-validator from meta-python
  python: import rfc3986-validator from meta-python
  python: import webcolors from meta-python
  python: import ruamel-yaml from meta-python
  python: import pyrsistent from meta-python
  python: import rfc3987 from meta-pyton
  python: import strict-rfc3339 from meta-python
  python: import vcversioner from meta-python
  maintainers: update for kernel dtschema checking dependencies
  linux-yocto: export pkgconfig variables to devshell
  kernel: introduce python3-dtschema-wrapper
  linux-yocto-dev: introduce dt-validation PACKAGECONFIG

Max Krummenacher (2):
  perf: sort-pmuevents: don't drop elements
  perf: sort-pmuevents: allow for additional type qualifiers and storage
    class

 meta/classes/kernel.bbclass                   |  7 +++
 meta/conf/distro/include/maintainers.inc      | 13 +++++
 ...e-pytest-runner-to-test_requirements.patch | 32 +++++++++++++
 .../python/python3-dtschema_2021.10.bb        | 16 +++++++
 .../python/python3-idna_3.3.bb                | 19 ++++++++
 .../python/python3-jsonpointer/run-ptest      |  3 ++
 .../python/python3-jsonpointer_2.1.bb         | 26 ++++++++++
 .../python/python3-jsonschema_3.2.0.bb        | 48 +++++++++++++++++++
 .../python/python3-pyrsistent_0.18.0.bb       | 14 ++++++
 .../python/python3-rfc3339-validator_0.1.4.bb | 20 ++++++++
 .../python/python3-rfc3986-validator_0.1.1.bb | 23 +++++++++
 .../python/python3-rfc3987_1.3.8.bb           | 10 ++++
 .../python/python3-ruamel-yaml_0.17.16.bb     | 23 +++++++++
 .../python/python3-strict-rfc3339_0.7.bb      | 10 ++++
 .../python/python3-vcversioner_2.16.0.0.bb    | 12 +++++
 .../python/python3-webcolors/run-ptest        |  3 ++
 .../python/python3-webcolors_1.11.1.bb        | 27 +++++++++++
 .../python3-dtschema-wrapper/dt-doc-validate  | 20 ++++++++
 .../dtc/python3-dtschema-wrapper/dt-mk-schema | 20 ++++++++
 .../dtc/python3-dtschema-wrapper/dt-validate  | 20 ++++++++
 .../dtc/python3-dtschema-wrapper_2021.10.bb   | 17 +++++++
 meta/recipes-kernel/linux/linux-yocto-dev.bb  | 12 ++++-
 meta/recipes-kernel/linux/linux-yocto.inc     |  9 ++++
 .../perf/perf/sort-pmuevents.py               | 28 ++++++-----
 24 files changed, 419 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
 create mode 100644 meta/recipes-devtools/python/python3-dtschema_2021.10.bb
 create mode 100644 meta/recipes-devtools/python/python3-idna_3.3.bb
 create mode 100644 meta/recipes-devtools/python/python3-jsonpointer/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-jsonpointer_2.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-jsonschema_3.2.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pyrsistent_0.18.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
 create mode 100644 meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb
 create mode 100644 meta/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb
 create mode 100644 meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
 create mode 100644 meta/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-webcolors/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-webcolors_1.11.1.bb
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb

-- 
2.19.1


