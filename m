Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B34C433F5
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:16 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.20163.1637901375751507648
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=helCX5mb;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id p17so7063112pgj.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A4ksfjO3ad3CSqUm8KEHfHMXOYSCy+RO78WEmTOg8DQ=;
        b=helCX5mbFaeztBXQpyVqfKS3WpP7Cbv1hVp3uFeoYWDwzB8hIO1RZRLuWTMazdjMia
         sPVEaVBh7+IERTmacSe+dt3VogBVJ83sTWwmoKU3fNQJTOOSt7iSBDSEKmMrjyf3eAPW
         423sn69REcC7P7Bz+vr6SV0yaw70GG7l8J/LLxsTcSN5w4Z5m3MXg29YHmfm6WUQZIby
         6lgWeNy1N9iuHInR27jNhFuqobkaPxr1HYv3lwpTl6ZRRmuXGzPllgpS23FXTiCAX+FB
         iZwF3pyhzAhSBruG4FQ8VrCNaNHLRuilcV9NdvLrcYoPB4u6lKP/VNuydOl0g9ZK48Yh
         eN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A4ksfjO3ad3CSqUm8KEHfHMXOYSCy+RO78WEmTOg8DQ=;
        b=Wkej1fSGO8kNqc8Bmsf/niR2+vmD+7AAV9mJEJo1HdvvGjPAFj23Ewth96JCINlG5u
         Nz15BN0i2QTSvyVbsiv6h2iGsUE1RX+0M4Jfonu/SNgSPZDdTh3WEeT4rZPKDiL0SJ3P
         Uux0i3kd1DcMoybiku0mK9w0dQKyshgN3hWSPTUpLdd2kSSDbhe9YN+QFTftVnwQQd80
         Rj9ohtYlYOtpJwdp5N4CNhDIxlMwIVjolb2gg6rbRkwiKjRehua0S1xlGsONvdn5HVmw
         CfT8xMFKWrunOslNia93Wb3wFf3VT7McCXqMb2JzSrSaASe65PxF8W64/TZp7yKgrR42
         13MA==
X-Gm-Message-State: AOAM530C8w024GVoz9n4RYEzxpfvZdn4T0/rFMGJKtCrgELUX/MKcpca
	QaXUuHwNeHzMioxceYH5uiTzLG8/OlI=
X-Google-Smtp-Source: 
 ABdhPJyjZWfaqWjPZWQEtt+TqShjIX5sIZ4MtR5Uw+UaWQzFTNYd5W44OoC/s0Ji4GpR8zKDlSLoQg==
X-Received: by 2002:a62:8c55:0:b0:49f:df22:c4ca with SMTP id
 m82-20020a628c55000000b0049fdf22c4camr18950970pfd.11.1637901374837;
        Thu, 25 Nov 2021 20:36:14 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:14 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 00/26] deprecation of distutils
Date: Thu, 25 Nov 2021 20:35:39 -0800
Message-Id: <cover.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158796

distutils is deprecated in Python 3.10 and will be removed in Python
3.12 (~October 2023).

This series inserts a deprecation warning into the distutils*.bbclasses
and drops or replaces distutils usage wherever possible.

Instead of distutils3-base, we introduce setuptools3-base, which also
incorporates distutils-common-base.

Remaining usage is in:
  * lib/recipetool/create_buildsys_python.py until we are ready to
    factor it out (and add pyproject.toml and setup.cfg handling)
  * oeqa selftests which are testing distutils3 functionality
  * glib-2.0: upstream is still using distutils.version.LooseVersion
  * gpgme: Still checks for distutils in m4/ax_python_devel.m4
  * python3-numpy: upstream still has a distutils/ module
  * python3-setuptools has a vendored _distutils

I might have missed something else.

No attempt has been made to look at layers outside of oe-core.

The intent is to let this percolate for a few weeks and then drop
distutils*.bbclasses (and move them to meta-python, but with the
warnings).

[YOCTO #14610]

The following changes since commit 6fca075a8d87d033359f81d476c8506df66ad53d:

  gcc: Drop no longer needed patch (2021-11-25 21:53:44 +0000)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib timo/core-deprecate-distutils_14610

Tim Orling (26):
  classes/distutils-*: add warning of deprecation
  setuptools: refactor for no distutils bbclasses
  python3-cython: DISTUTILS_* -> SETUPTOOLS_*
  dnf: inherit setuptools3-base instead of distutils
  libdnf: inherit setuptoools3-base not distutils
  python3-dbus: inherit setuptools3-base not distuils
  gpgme: inherit setuptools-base not distutils
  python3-pip: inherit setuptools3 not distutils3
  systemtap: use setuptools-base not distutils
  libcomps: inherit setuptools3-base not distutils
  createrepo-c: inherit setuptools3-base not distutils
  librepo: inherit setuptools3-base not distutils
  btrfs-tools: use setuptools3-base not distutils
  scripts/buildhistory-diff: drop use of distutils
  python3-pygobject: setuptools instead of distutils
  bind: inherit setuptools3-base instead of distutils
  python3-setuptools: do not depend on distutils
  sanity.bbclass: drop usage of distutils
  gstreamer1.0-python: inherit setuptools3-base
  recipetool/create_buildsys_python.py: less distutils
  waf.bbclass: drop usage of distutils
  dnf: drop python3-disutils dependency
  python3: refactor python-config patch
  lib/oe/terminal.py: use bb.version.LooseVersion
  python3native.bbclass: distutils -> sysconfig
  rootfs_rpm.bbclass: distutils -> sysconfig module

 meta/classes/distutils-common-base.bbclass    |  3 +
 meta/classes/distutils3-base.bbclass          |  3 +
 meta/classes/distutils3.bbclass               |  4 ++
 meta/classes/python3native.bbclass            |  2 +-
 meta/classes/rootfs_rpm.bbclass               |  2 +-
 meta/classes/sanity.bbclass                   | 16 ++---
 meta/classes/setuptools3-base.bbclass         | 31 +++++++++
 meta/classes/setuptools3.bbclass              | 67 +++++++++++++++++-
 meta/classes/waf.bbclass                      |  2 +-
 meta/lib/oe/terminal.py                       |  2 +-
 .../recipes-connectivity/bind/bind_9.16.23.bb |  2 +-
 .../btrfs-tools/btrfs-tools_5.15.bb           |  2 +-
 .../createrepo-c/createrepo-c_0.17.7.bb       |  2 +-
 meta/recipes-devtools/dnf/dnf_4.10.0.bb       |  3 +-
 .../libcomps/libcomps_0.1.18.bb               |  2 +-
 meta/recipes-devtools/libdnf/libdnf_0.65.0.bb |  2 +-
 .../librepo/librepo_1.14.2.bb                 |  2 +-
 .../python/python3-cython_0.29.24.bb          |  2 +-
 .../python/python3-dbus_1.2.18.bb             |  2 +-
 .../python/python3-pip_21.3.1.bb              |  2 +-
 .../python/python3-pygobject_3.42.0.bb        |  2 +-
 .../python/python3-setuptools_59.2.0.bb       |  1 -
 ...n-implement-legacy-disutils-behavior.patch | 68 +++++++++++++++++++
 .../python/python3/python-config.patch        | 55 ---------------
 .../recipes-devtools/python/python3_3.10.0.bb |  2 +-
 .../recipes-kernel/systemtap/systemtap_git.bb |  2 +-
 .../gstreamer/gstreamer1.0-python_1.18.5.bb   |  2 +-
 meta/recipes-support/gpgme/gpgme_1.16.0.bb    |  2 +-
 scripts/buildhistory-diff                     |  5 --
 .../lib/recipetool/create_buildsys_python.py  |  4 +-
 30 files changed, 204 insertions(+), 92 deletions(-)
 create mode 100644 meta/classes/setuptools3-base.bbclass
 create mode 100644 meta/recipes-devtools/python/python3/0001-python-config.in-implement-legacy-disutils-behavior.patch
 delete mode 100644 meta/recipes-devtools/python/python3/python-config.patch

-- 
2.30.2


