Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF30C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 01:27:57 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.5719.1645406874086508394
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HhTMEn2a;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id c3so1968840plh.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KnBV5z/kp1TE8O2R4blbh1mXCnxUOx838QzwRxy/NIY=;
        b=HhTMEn2a+6YfnnCMFpFgmyQAyZRQR1/2b1+6Wz09lDsmi/StqCzyvZ86HYY1INu0O/
         eVRYV74WvbLk55tRMqrcys6YzpeQEnQO1uL8157vkqltJ77/2l8MyjGrc9EMrH0146Xa
         ph9dwKfItj7xCqWc1TakVN/Hkq5VhuzMcIFAUdMNM/v+hQKdeuLs2clnrjOUytAVmWqX
         Hy0Cs1nbRloTcE20Lq/FwF2T72+FXquvb03bLgIXGRE1khK2uL6DCvYMKxoRFH6oWUuK
         4t5TyhSSEZKmwTpbUHwJo9vuqaXlnKN6d0oAOkp3csGxXw8PI76xBUr2dxo/16P4V8wE
         n+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KnBV5z/kp1TE8O2R4blbh1mXCnxUOx838QzwRxy/NIY=;
        b=ncgJ4SUdpzGMScM2O3oaXTEL3icmyDgyswedrWrnwmGosWcGzj2ODPyzeJwnhCb3cs
         0t+hIJ/ZWghjdfL3zOXjQCgf8y4yUNp4kpoExDeYBOoTlJ9nU5FtxDjOyP8VKYS6Lbeq
         GBL/Mj0pr/36+0gkt005Hz03aEasIIVF1ZMjB74pFdi7dtXnSvZVLXKkpumTMKXyxfH1
         K9f+t1SI4WSuGMLadniLO0AspFvGwQ/fF0KLLq/wg5Z20Iy961PedInZx+egbfOzT3/n
         pZ/9Pwanh2B3WyhN9vgCponxMSouc5uQ+75bLBATPEkC/cdi9oeGJjkpLALmU5z4S+l7
         o5uQ==
X-Gm-Message-State: AOAM532DgBeCOV7pURXFicXQufNfFMdfQAAr6Fz0jwgQ0TByopvtTwSG
	VpIXAbMJ01XfvYHmDtgnpfDdFonzSMO36Q==
X-Google-Smtp-Source: 
 ABdhPJy2emsK6sMftR6OIJeDRd2cDpvsTFKab5w1045Sd0jgXblq/JNQPXkHuW27ynn2RYZYjRpZ1A==
X-Received: by 2002:a17:90b:fd7:b0:1b8:c872:f98f with SMTP id
 gd23-20020a17090b0fd700b001b8c872f98fmr19185012pjb.170.1645406872654;
        Sun, 20 Feb 2022 17:27:52 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f2b0:3951:ce8:8dfd])
        by smtp.gmail.com with ESMTPSA id
 e20sm10252937pfn.4.2022.02.20.17.27.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 17:27:52 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/19] Python PEP-517: build wheels and installw with pip
Date: Sun, 20 Feb 2022 17:27:29 -0800
Message-Id: <cover.1645405471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 01:27:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161992

Upstream Python is moving to pyproject.toml rather than setup.py and
wheels rather than eggs. The main place this is documented is in
PEP-517[1]. Installing packages with setup.py install is deprecated.

We have a choice with the 'kirkstone' LTS release of introducing this
series (and fixing any fall out during the stabilization period) or
living with deprecated Python packaging for the duration of the LTS (at
a minimum 2 years). This seems to be a compelling enough reason to bring
in this series, even if it results in a slight slip of the 'feature
freeze', which is officially tomorrow, Monday 21 Feb, 2022.

This series bootstraps python3-setuptools-native,
python3-flit-core-native, python3-wheel-native and python3-pip-native,
simply unzipping the wheel into PYTHON_SITEPACKAGES_DIR. This allows all
other recipes to be installed with pip, as intended by upstream.

Three new classes are introduced:
(1) flit_core which builds PEP-517 compliant packages which use
    flit_core.buildapi as their build-backend.
(2) setuptools_build_meta which builds PEP-517 compliant packages which use
    setuptools_build_meta  as their build-backend.
(3) pip_install_wheel, which simply installs wheels built by other
    classes.

The original setuptools3.bbclass do_compile is modified to
'setup.py bdist_wheel' (from python3-wheel-native) rather than the deprecated
'setup.py build' mechanism. 

The original setuptools3.bbclass do_install is modified to
use the pip_install_wheel.bbclass to install wheels with pip rather than
the deprecated 'setup.py install' mechanism. 

For pip install, we disable dependency checking (--no-deps) because it
proves to be brittle in our environment without providing full wheel
cache that seems like overhead that we do not need. We also disable
fetching wheels from pypi (--no-index). This is no different than our
normal workflow of requiring dependencies to be defined in a recipe.

Missing from this series is documentation of the new features, classes
and variables (this will be done under separate cover).

Also desired and previously discussed in YP meetings is a helper
function to warn that a recipe which currently inherits setuptools3
but has a pyproject.toml and defines a build-system.build-backend should
instead use of the new PEP-517 classes. This function is still in progress.

During testing, recipes which use python3-setuptools-scm are failing to
determine the version of the python package, For several recipes, the fix
was to use pyproject.toml and PEP-517 build backends. To be sure, other recipes
are still going to fail for the short term, until the root cause can be
determined.

Another PEP-517 build-backend, poetry.core.masonry.api has been
identified in recipes in meta-python, but not in oe-core. The
python3-poetry-core recipe is WIP, but brings in a number of
dependencies that are perhaps not worth it to bring into oe-core at this
time. Rather we can support these recipes in meta-python?

[YOCTO #14638]

[1] https://www.python.org/dev/peps/pep-0517/

The following changes since commit 0539b563c6f41fef383429a13c28bf918231d404:

  libhandy: Use upstream regex to check version of upgrade. (2022-02-20 16:45:25 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/git/poky-contrib timo/bootstrap-wheels
  http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log/?h=timo/bootstrap-wheels

Tim Orling (19):
  python3-wheel: move 0.37.0 from meta-python
  python3-flit-core: add recipe for 3.6.0
  python3-flit-core: simplify
  flit_core.bbclass: add helper for newer python packaging
  python3-wheel: inherit flit_core
  pip_install_wheel.bbclass: add helper class
  setuptools_build_meta.bbclass: add helper class
  python3-pip: inherit setuptools_build_meta
  python3-attrs: inherit setuptools_build_meta
  python3-git: inherit setuptools_build_meta
  python3-pytest: inherit setuptools_build_meta
  python3-setuptools-scm: inherit setuptools_build_meta
  python3-zipp: inherit setuptools_build_meta
  python3-iniconfig: inherit setuptools_build_meta
  python3-py: inherit setuptools_build_meta
  python3-pluggy: inherit setuptools_build_meta
  python3-setuptools: inherit setuptools_base_meta
  setuptools3.bbclass: refactor for wheels
  python3-more-itertools: set PIP_INSTALL_PACKAGE

 meta/classes/flit_core.bbclass                |  16 +++
 meta/classes/pip_install_wheel.bbclass        |  18 ++++
 meta/classes/setuptools3.bbclass              |  20 ++--
 meta/classes/setuptools_build_meta.bbclass    |  18 ++++
 .../python/python3-attrs_21.4.0.bb            |   2 +-
 .../python/python3-flit-core_3.6.0.bb         |  41 +++++++
 .../python/python3-git_3.1.26.bb              |   2 +-
 .../python/python3-iniconfig_1.1.1.bb         |   4 +-
 .../python/python3-more-itertools_8.12.0.bb   |   2 +
 .../python/python3-pip_22.0.3.bb              |  19 +++-
 .../python/python3-pluggy_1.0.0.bb            |   2 +-
 .../python/python3-py_1.11.0.bb               |   2 +-
 .../python/python3-pytest_7.0.1.bb            |   4 +-
 .../python/python3-setuptools-scm_6.4.2.bb    |   2 +-
 .../python/python3-setuptools_59.5.0.bb       |  19 +++-
 ...roject.toml-from-flit-backend-branch.patch | 100 ++++++++++++++++++
 .../python/python3-wheel_0.37.1.bb            |  24 +++++
 .../python/python3-zipp_3.7.0.bb              |   2 +-
 18 files changed, 269 insertions(+), 28 deletions(-)
 create mode 100644 meta/classes/flit_core.bbclass
 create mode 100644 meta/classes/pip_install_wheel.bbclass
 create mode 100644 meta/classes/setuptools_build_meta.bbclass
 create mode 100644 meta/recipes-devtools/python/python3-flit-core_3.6.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-wheel/0001-Backport-pyproject.toml-from-flit-backend-branch.patch
 create mode 100644 meta/recipes-devtools/python/python3-wheel_0.37.1.bb

-- 
2.30.2


