Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.6046.1596146535911082582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2020 15:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ddbtfalk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id p14so6988050wmg.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2020 15:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PsKHA4EsdP2Ve1+SRxDYHgyY4ISK0dXW6ZYl4kUGQK8=;
        b=ddbtfalkdE3JJ4jhKkgbKtviLyKkrosKFhF9UpsJO8RApecBzCITp9Gr9WX66kWEdx
         3kG24lnpmtFDvOe9zpg31SUucMxu4UylGuQTnrTDxfTAHm/56JO24gDAsJU1kS+a8B8W
         OGNVlavFt1V22TzCgdF3pIKgji4Hbk5uUcJVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PsKHA4EsdP2Ve1+SRxDYHgyY4ISK0dXW6ZYl4kUGQK8=;
        b=b4VCWn1ew893riBHnWcRv2pgTSF9S53xAxctQ5lRqGzWzkBCXmgbsgsHXzMUvnROkJ
         cUFMSBo/dnFx4AJnyHU57FxrziZ+ZC6Eu4V+OyZLuId8pepALacNE+IlzjL6Ewwl3Ix+
         H2ZiMpMNru4nHkM8H/AZmoodc95Wwn6KWj2iC/Q7H8eCYtI51vbksRudFlyw66NnClC7
         n8/sNLgegEZ3KlhuRVqGaiCTP48vOs6r1KO9DDvb3rfkUUvhG7BcpGJoBWsQyUXy09Ov
         f+UGHm7AMTeDXxuedr/AF5DTMLLA1SzF2A6vIBznjpPSRwFvMizjrFcDecPhQZ5ag749
         ObrA==
X-Gm-Message-State: AOAM533wj7ZJqkKR5HfnOJmPYs50bKpLTNpS6Sm0v4JkA3NtrMpuc0VX
	2bxhTCdtNHjHMvSmzb9Q1t2O5ku1KDI9gg==
X-Google-Smtp-Source: ABdhPJwsCMURWkMrVDqTcacHU9lfRHJZ6OUaaWZIZiFVoboMoOAcxP74lq3EOoAzgQgfoNld4Uc0VA==
X-Received: by 2002:a1c:4802:: with SMTP id v2mr1097564wma.83.1596146533861;
        Thu, 30 Jul 2020 15:02:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (8.f.6.d.2.8.e.3.0.7.3.6.6.7.c.a.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:ac76:6370:3e82:d6f8])
        by smtp.gmail.com with ESMTPSA id 111sm11742951wrc.53.2020.07.30.15.02.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 15:02:13 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/package_manager: Fix missing imports
Date: Thu, 30 Jul 2020 23:02:12 +0100
Message-Id: <20200730220212.442299-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The package_manager code rearranging had some issues with module imports that
were now missing. Fix all the ones I could spot from quick inspection.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/package_manager/deb/__init__.py | 2 ++
 meta/lib/oe/package_manager/deb/rootfs.py   | 3 ++-
 meta/lib/oe/package_manager/deb/sdk.py      | 3 ++-
 meta/lib/oe/package_manager/ipk/__init__.py | 3 +++
 meta/lib/oe/package_manager/ipk/rootfs.py   | 1 +
 meta/lib/oe/package_manager/ipk/sdk.py      | 4 ++--
 meta/lib/oe/package_manager/rpm/__init__.py | 2 ++
 meta/lib/oe/package_manager/rpm/sdk.py      | 2 +-
 meta/lib/oe/sdk.py                          | 2 --
 9 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index 3c214e59dd2..72155b178c9 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -2,6 +2,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import re
+import subprocess
 from oe.package_manager import *
 
 class DpkgIndexer(Indexer):
diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/package_manager/deb/rootfs.py
index ac229f63d7a..819f67eda5c 100644
--- a/meta/lib/oe/package_manager/deb/rootfs.py
+++ b/meta/lib/oe/package_manager/deb/rootfs.py
@@ -2,11 +2,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import re
+import shutil
 from oe.rootfs import Rootfs
 from oe.manifest import Manifest
 from oe.utils import execute_pre_post_process
 from oe.package_manager.deb.manifest import DpkgManifest
-import re
 from oe.package_manager.deb import DpkgPM
 
 class DpkgOpkgRootfs(Rootfs):
diff --git a/meta/lib/oe/package_manager/deb/sdk.py b/meta/lib/oe/package_manager/deb/sdk.py
index 3876f9b6833..b25eb70b00d 100644
--- a/meta/lib/oe/package_manager/deb/sdk.py
+++ b/meta/lib/oe/package_manager/deb/sdk.py
@@ -2,11 +2,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import glob
+import shutil
 from oe.utils import execute_pre_post_process
 from oe.sdk import Sdk
 from oe.manifest import Manifest
 from oe.package_manager.deb import DpkgPM
-import shutil
 
 class DpkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None):
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 34500b8a0a9..9603993a591 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -2,6 +2,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import re
+import shutil
+import subprocess
 from oe.package_manager import *
 
 class OpkgIndexer(Indexer):
diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/package_manager/ipk/rootfs.py
index 34dbcc27e64..63b4a59c401 100644
--- a/meta/lib/oe/package_manager/ipk/rootfs.py
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py
@@ -4,6 +4,7 @@
 
 import re
 import filecmp
+import shutil
 from oe.rootfs import Rootfs
 from oe.manifest import Manifest
 from oe.utils import execute_pre_post_process
diff --git a/meta/lib/oe/package_manager/ipk/sdk.py b/meta/lib/oe/package_manager/ipk/sdk.py
index e6d7b04bb88..47c0a92c1b6 100644
--- a/meta/lib/oe/package_manager/ipk/sdk.py
+++ b/meta/lib/oe/package_manager/ipk/sdk.py
@@ -2,12 +2,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import glob
+import shutil
 from oe.utils import execute_pre_post_process
 from oe.sdk import Sdk
 from oe.manifest import Manifest
 from oe.package_manager.ipk import OpkgPM
-import shutil
-import glob
 
 class OpkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None):
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index 6183f81d586..c91f61ae5c1 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -2,6 +2,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import shutil
+import subprocess
 from oe.package_manager import *
 
 class RpmIndexer(Indexer):
diff --git a/meta/lib/oe/package_manager/rpm/sdk.py b/meta/lib/oe/package_manager/rpm/sdk.py
index 4d3f9461ef9..b14b155a85e 100644
--- a/meta/lib/oe/package_manager/rpm/sdk.py
+++ b/meta/lib/oe/package_manager/rpm/sdk.py
@@ -2,11 +2,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import glob
 from oe.utils import execute_pre_post_process
 from oe.sdk import Sdk
 from oe.manifest import Manifest
 from oe.package_manager.rpm import RpmPM
-import glob
 
 class RpmSdk(Sdk):
     def __init__(self, d, manifest_dir=None, rpm_workdir="oe-sdk-repo"):
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 49f519891fb..fdcadcb8dee 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -7,8 +7,6 @@ from oe.utils import execute_pre_post_process
 from oe.manifest import *
 from oe.package_manager import *
 import os
-import shutil
-import glob
 import traceback
 
 class Sdk(object, metaclass=ABCMeta):
-- 
2.25.1

