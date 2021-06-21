Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.50252.1624294978157014239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 10:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sjz3v5uY;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id y21so3058502plb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 10:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O9smM4MqvHf1zexPFFQacFEeNbyStalRIHuJg2mg+uw=;
        b=Sjz3v5uYMJ/QlxnSlU4NZqfi+6pi49hMC7VNSHR54dnGJ8Sr5rrgwG6tVWzckJwYA5
         efhSk+aWxwBGWUx6LBFNRTQtnmqzYJXeDAnK5Hs3kbsgG8oCofJSb1MRwaSD0hU1HW/i
         VAz77lLjGDt9ceqYCRGDp2x/LkJ4EP2tTxLfaAN4xQGYpovVcF8RY08Po0HT9rsE436s
         ZzKZgcpvdOat4fO/1CmrzMZ/tUrY4MsJBeRRAcss3eHC2RdJy9IzbrC8uDl1eycNyjJ+
         DsPzwCgJbwHuoVu4t75yAGoofkDLBnUPz1YKdR6zn1nzKpg65oPobhqQfBLjTUxopWMw
         HqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O9smM4MqvHf1zexPFFQacFEeNbyStalRIHuJg2mg+uw=;
        b=k2YdcLBeZ/167RLxYrhKV66EG/rBFHvmLrhZzkpJbwLzav7Sx1wxXkL/7jeqQFwh1l
         UzjC0nAGtRvzN7H4crJqg/bwgfWrHhpfnidYFL54c3IUhoptxM9BU24sXXnLSS2pWHXE
         t2FEpE6IUQ3Uih4l6dzli+p7OOyWdsuB9ik5nlVzgAaB20cpedAdXz9P7Y0Hui89YTaL
         Y8KQFgMu+KcMp/+i6YdDkMsXywpToB006D9wi3GUMcUHbl5rRrYRce1VfxIaUf2zN2yn
         TOgK7F6cibLODXbiv6zltcjsRIQCED72cJmgt+REvG7sWxsl4Upj5QwcdsUT9/EJPwjj
         targ==
X-Gm-Message-State: AOAM530kYMAwglU4nvjqaqeUHvpPdy2JvpexAwa3rJ9Ura/WxCpfSVRw
	oFN3Hv+KKZ6k08RzEwIlIDTyKJvU+bHOow==
X-Google-Smtp-Source: ABdhPJzY5HASIogmawtc9KP4CyVB9BixO4Wq2ni4cahWEehvVqjRnQn4lgGG9Mbfo80NSfnrO0PBnQ==
X-Received: by 2002:a17:90a:e2cc:: with SMTP id fr12mr28561084pjb.160.1624294977128;
        Mon, 21 Jun 2021 10:02:57 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:8a50:f0aa:6cd5:a7ef])
        by smtp.gmail.com with ESMTPSA id h24sm16335229pfn.180.2021.06.21.10.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:02:56 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [RFC PATCH 00/10][dunfell] python3 bugfix upgrades
Date: Mon, 21 Jun 2021 10:02:49 -0700
Message-Id: <cover.1624294059.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every dot release in the 3.8.y series is by definition a bugfix release.

We have been individually patching individual CVEs, when they could
instead have been handled by bumping the dot release.

The only CVE currently known to not be patched by this series is
CVE-2021-29921 which does not yet have an upstream fix in the 3.8.y
branch.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-29921
https://bugs.python.org/issue36384

Tested on qemux86-64 core-image-minimal with:

IMAGE_INSTALL_append = " python3"

#  enable_gtk_in_qemu: |
DISTRO_FEATURES_append = "opengl"
PACKAGECONFIG_pn-qemu-system-native = "fdt alsa kvm virglrenderer glx gtk+"
#  enable_ptest_and_testimage: |
IMAGE_CLASSES += " testimage"
DISTRO_FEAURES_append = " ptest"
EXTRA_IMAGE_FEATURES = "debug-tweaks ssh-server-dropbear"
TESTIMAGE_AUTO = "1"
TEST_SUITES = " ping ssh python ptest"
TEST_QEMUPARAMS += "-smp 4 -m 8192"
TEST_RUNQEMUPARAMS = "kvm gl-es gtk"
IMAGE_ROOTFS_SIZE ?= "8192"
IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
IMAGE_INSTALL_append = " ptest-runner procps coreutils iproute2 sysstat python3-ptest"

The following changes since commit ac8181d9b9ad8360f7dba03aba8b00f008c6ebb4:

  Revert "python3: fix CVE-2021-23336" (2021-06-19 13:11:58 -1000)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib timo/dunfell/python3-3.8.10

Tim Orling (10):
  python3: upgrade 3.8.2 -> 3.8.3
  python3: upgrade 3.8.3 -> 3.8.4
  python3: upgrade 3.8.4 -> 3.8.5
  python3: upgrade 3.8.5 -> 3.8.6
  python3: upgrade 3.8.6 -> 3.8.7
  python3: upgrade 3.8.7 -> 3.8.8
  python3: skip tests requiring tools-sdk
  python3: upgrade 3.8.8 -> 3.8.9
  python3: upgrade 3.8.9 -> 3.8.10
  python3-ptest: add newly discovered missing rdeps

 ...20-8492-Fix-AbstractBasicAuthHandler.patch | 248 ------------------
 ...pes.test_find-skip-without-tools-sdk.patch |  33 +++
 ...le.py-correct-the-test-output-format.patch |  24 +-
 .../python/python3/CVE-2019-20907.patch       |  44 ----
 .../python/python3/CVE-2020-14422.patch       |  77 ------
 .../python/python3/CVE-2020-26116.patch       | 104 --------
 .../python/python3/CVE-2020-27619.patch       |  70 -----
 .../python/python3/CVE-2021-3177.patch        | 191 --------------
 .../{python3_3.8.2.bb => python3_3.8.10.bb}   |  20 +-
 9 files changed, 54 insertions(+), 757 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2019-20907.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2020-14422.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2020-26116.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2020-27619.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2021-3177.patch
 rename meta/recipes-devtools/python/{python3_3.8.2.bb => python3_3.8.10.bb} (95%)

-- 
2.30.2

