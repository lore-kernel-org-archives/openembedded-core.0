Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F51DC433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:01:51 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.12233.1641927710248084926
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TUgAEUK8;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id u15so251921ple.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mHwKBLpQC/vf4oNH3Sidj89icvvl9zQNx5IyiAmgErg=;
        b=TUgAEUK8fFjOEkiSdKbIZJs7ypost+5afAn/uK5E8XydYWYVXAuZffYmsQ6IOh5YOk
         s+ZQ0Bt9ut3YyA2hZaJLmiBYOLo2MzZFG1ZaGzSeph6GWohPDBUOfAuDiMGUS0qMTLHd
         LyMzQVDsrjUZN8BEb/gyT96j11Ok0cff8kZ8C30eNFuSOIME5r/C8FTH+YcfuWy3Tw0z
         zAYbVm6ZUz5MMh49SgdyUDKt6tPSS2s4fIGw7D2+lXnm2VAnkwUDvgXMkaSgq0gZz1qJ
         71EvJkIONYL2sKnl8tkgjhBZ3QDLeWMIjr953euD4sN3isT250L5o8gGNKiMoCW4fgDo
         DJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mHwKBLpQC/vf4oNH3Sidj89icvvl9zQNx5IyiAmgErg=;
        b=vnIaSBjEJyZvlFDLaS+9budopeuRi8R3onQ3kPx0zSvnl3+BsfRcfVGv/f/0E50cOU
         Cc9NIBXWJDUF/hVzPxkzs0KXWR4PP07LYYt75IWIwdAUPCC/LQDAWW2ax5GsS/jps8T8
         x+GaPqZr4F3uxQXLDZFeiEhYZ86nV+EOjOMktObUs2i5QAeYkpcnbFXk6lNUqLq0J8YS
         HvaeNxslvyCnLqLx0IzzcAJwbmZaKimsCd1Hp43NXLsyTv8htbtuud0lkL/M3EcIXlVK
         X35ilZlvwSf0uiWNsyM+Jr72LQXlJur7OdinoQS2kxgqfdcUFbLqypXS+2WQBjbeTz/x
         ClyA==
X-Gm-Message-State: AOAM531VtUZQ7GVthK1d0rnyghLWcQJ5Jkse69aUZirV4IG9FhG/cHb+
	rURukqLi4p/22ZAHwBoQnqOEWyg6B6U=
X-Google-Smtp-Source: 
 ABdhPJzbYoaZksGkWzyfgrxWWCCvqz46ZmCNYf4vHTUYm4bZoTB7UBYqbQB+8uik3qFsjdSyQppfkQ==
X-Received: by 2002:a65:6241:: with SMTP id q1mr5213714pgv.98.1641927709363;
        Tue, 11 Jan 2022 11:01:49 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.01.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:01:49 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 00/22] deprecation of distutils
Date: Tue, 11 Jan 2022 11:01:09 -0800
Message-Id: <cover.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:01:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160436

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

Changes in v2:
  - dropped the import of distutils.version into bb. in favor of
    bb.utils.vercmp_string_op()
  - dropped some patches that have been addressed already
  - update email
  - fix typos
  - drop already merged scripts/buildhistory-diff patch
The following changes since commit 16110cdca7211b0efc59464afbb253527c033cad:

  oeqa/sstate: Fix allarch samesigs test (2022-01-11 15:48:11 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/git/poky-contrib timo/deprecate_distutils_14610_v2
  http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log/?h=timo/deprecate_distutils_14610_v2

Tim Orling (22):
  classes/distutils-*: add warning of deprecation
  setuptools3: refactor for no distutils bbclasses
  python3-cython: DISTUTILS_* -> SETUPTOOLS_*
  dnf: inherit setuptools3-base instead of distutils
  libdnf: inherit setuptools3-base not distutils
  python3-dbus: inherit setuptools3-base not distuils
  gpgme: inherit setuptools-base not distuils
  python3-pip: inherit setuptools3 not distuils3
  systemtap: use setuptools-base not distutils
  libcomps: inherit setuptools3-base not distutils
  createrepo-c: inherit setuptools3-base not distutils
  librepo: inherit setuptools3-base not distutils
  btrfs-tools: use setuptools3-base not distutils
  python3-pygobject: setuptools instead of distuils
  bind: inherit setuptools3-base instead of distutils
  python3-setuptools: do not depend on distutils
  gstreamer1.0-python: inherit setuptools3-base
  recipetool/create_buildsys_python.py: less distutils
  waf.bbclass: drop usage of distutils
  dnf: drop python3-distutils dependency
  python3native.bbclass: distutils -> sysconfig
  rootfs_rpm.bbclass: distutils -> sysconfig module

 meta/classes/distutils-common-base.bbclass    |  3 +
 meta/classes/distutils3-base.bbclass          |  3 +
 meta/classes/distutils3.bbclass               |  4 ++
 meta/classes/python3native.bbclass            |  2 +-
 meta/classes/rootfs_rpm.bbclass               |  2 +-
 meta/classes/setuptools3-base.bbclass         | 31 +++++++++
 meta/classes/setuptools3.bbclass              | 66 ++++++++++++++++++-
 meta/classes/waf.bbclass                      |  3 +-
 .../recipes-connectivity/bind/bind_9.16.24.bb |  2 +-
 .../btrfs-tools/btrfs-tools_5.15.1.bb         |  2 +-
 .../createrepo-c/createrepo-c_0.18.0.bb       |  2 +-
 meta/recipes-devtools/dnf/dnf_4.10.0.bb       |  3 +-
 .../libcomps/libcomps_0.1.18.bb               |  2 +-
 meta/recipes-devtools/libdnf/libdnf_0.65.0.bb |  2 +-
 .../librepo/librepo_1.14.2.bb                 |  2 +-
 .../python/python3-cython_0.29.26.bb          |  2 +-
 .../python/python3-dbus_1.2.18.bb             |  2 +-
 .../python/python3-pip_21.3.1.bb              |  2 +-
 .../python/python3-pygobject_3.42.0.bb        |  2 +-
 .../python/python3-setuptools_59.5.0.bb       |  1 -
 .../recipes-kernel/systemtap/systemtap_git.bb |  2 +-
 .../gstreamer/gstreamer1.0-python_1.18.5.bb   |  2 +-
 meta/recipes-support/gpgme/gpgme_1.16.0.bb    |  2 +-
 .../lib/recipetool/create_buildsys_python.py  |  8 ++-
 24 files changed, 129 insertions(+), 23 deletions(-)
 create mode 100644 meta/classes/setuptools3-base.bbclass

-- 
2.30.2


