Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20982C43217
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 12:28:40 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.22317.1669292910535243291
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 04:28:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=NCx8J0R0;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id b21so1344227plc.9
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 04:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K12JvBxBZsqF7YaXNWmINwY92m0H74osMbHKf0qPXhc=;
        b=NCx8J0R00r1IsQ4FNDZNlo0FQTsmj1iP4wq03KwfaztVKEWDRZcBpHZ8/nzhpFxHlz
         h+jIiuKr8xZQ9quz1TTxfuOQkvEimuE42/JiZ7u1npSeinP+CdZqi8zt3VnNbvfUK6dL
         j6fP1CXUltiOACm0d1syOufbNctV4YzVwFVUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K12JvBxBZsqF7YaXNWmINwY92m0H74osMbHKf0qPXhc=;
        b=nzLqT6oSvJOPO87o1/72fECpI+iQBpVApn1JfLsYFwsPiWpWtr7WtsK6NSIBK/7Qzz
         rPgKNRhmdVIQU2PDsPzfQtVhbHl2Yo03aafa5wPlwZPKmkFOEH5jWEOu4RjDichuN9rR
         +fh47WO7MFkLE3MKGtSXApGDHzPxehmOUciziVNBw7p/Z+5dXb88+Gbjnh4b9BQr9k4M
         Si3drvjpweEmcHfc7ORWPB7eN3HcB/MztwDV/MXUsekiyOpvjGcoKfQzO1vzLl0xgGkY
         wvt/cM72YnWsv2HK/gUekexezgZd6NayeTC3sEnDFUoS/rSP5h6lJW84xkMdWvOw1sJ6
         Vnag==
X-Gm-Message-State: ANoB5pkgxIwNX/ci/lbAkQU5XB2jy/Tib6z5zq076ejaI71BCJzCXZV9
	RRp3JoxOhMZyOuJBOZzycJsfst41gDTcjQ==
X-Google-Smtp-Source: AA0mqf6tKdcNnO8osnxXN0Jn/d5ZnTjPmWuR0E2bcjwKdIwCn4HhNEUFl+kWWTDQ2DIg/6NQlssimA==
X-Received: by 2002:a17:903:1054:b0:189:574d:e84f with SMTP id f20-20020a170903105400b00189574de84fmr3965780plc.9.1669292909772;
        Thu, 24 Nov 2022 04:28:29 -0800 (PST)
Received: from vivek-Latitude-3400.mvista.com ([116.74.131.85])
        by smtp.gmail.com with ESMTPSA id c194-20020a621ccb000000b0056a93838606sm1112038pfc.58.2022.11.24.04.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 04:28:29 -0800 (PST)
From: vkumbhar@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] python3: fix CVE-2022-42919 local privilege escalation via the multiprocessing forkserver start method
Date: Thu, 24 Nov 2022 17:58:13 +0530
Message-Id: <20221124122813.81104-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 12:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173745

From: Vivek Kumbhar <vkumbhar@mvista.com>

Upstream-Status: Backport from https://github.com/python/cpython/commit/eae692eed18892309bcc25a2c0f8980038305ea2

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../python/python3/CVE-2022-42919.patch       | 70 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.10.7.bb |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2022-42919.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2022-42919.patch b/meta/recipes-devtools/python/python3/CVE-2022-42919.patch
new file mode 100644
index 0000000000..6040724dae
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2022-42919.patch
@@ -0,0 +1,70 @@
+From 87ef80926ea0ec960a220af89d8ff4db99417b03 Mon Sep 17 00:00:00 2001
+From: Vivek Kumbhar <vkumbhar@mvista.com>
+Date: Thu, 24 Nov 2022 17:44:18 +0530
+Subject: [PATCH] CVE-2022-42919
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/eae692eed18892309bcc25a2c0f8980038305ea2]
+CVE: CVE-2022-42919
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+
+[3.10] gh-97514: Don't use Linux abstract sockets for multiprocessing (GH-98501) (GH-98503)
+
+Linux abstract sockets are insecure as they lack any form of filesystem
+permissions so their use allows anyone on the system to inject code into
+the process.
+
+This removes the default preference for abstract sockets in
+multiprocessing introduced in Python 3.9+ via
+https://github.com/python/cpython/pull/18866 while fixing
+https://github.com/python/cpython/issues/84031.
+
+Explicit use of an abstract socket by a user now generates a
+RuntimeWarning.  If we choose to keep this warning, it should be
+backported to the 3.7 and 3.8 branches.
+(cherry picked from commit 49f61068f49747164988ffc5a442d2a63874fc17)
+---
+ Lib/multiprocessing/connection.py                 |  5 -----
+ .../2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst | 15 +++++++++++++++
+ 2 files changed, 15 insertions(+), 5 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst
+
+diff --git a/Lib/multiprocessing/connection.py b/Lib/multiprocessing/connection.py
+index 510e4b5..8e2facf 100644
+--- a/Lib/multiprocessing/connection.py
++++ b/Lib/multiprocessing/connection.py
+@@ -73,11 +73,6 @@ def arbitrary_address(family):
+     if family == 'AF_INET':
+         return ('localhost', 0)
+     elif family == 'AF_UNIX':
+-        # Prefer abstract sockets if possible to avoid problems with the address
+-        # size.  When coding portable applications, some implementations have
+-        # sun_path as short as 92 bytes in the sockaddr_un struct.
+-        if util.abstract_sockets_supported:
+-            return f"\0listener-{os.getpid()}-{next(_mmap_counter)}"
+         return tempfile.mktemp(prefix='listener-', dir=util.get_temp_dir())
+     elif family == 'AF_PIPE':
+         return tempfile.mktemp(prefix=r'\\.\pipe\pyc-%d-%d-' %
+diff --git a/Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst b/Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst
+new file mode 100644
+index 0000000..02d95b5
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst
+@@ -0,0 +1,15 @@
++On Linux the :mod:`multiprocessing` module returns to using filesystem backed
++unix domain sockets for communication with the *forkserver* process instead of
++the Linux abstract socket namespace.  Only code that chooses to use the
++:ref:`"forkserver" start method <multiprocessing-start-methods>` is affected.
++
++Abstract sockets have no permissions and could allow any user on the system in
++the same `network namespace
++<https://man7.org/linux/man-pages/man7/network_namespaces.7.html>`_ (often the
++whole system) to inject code into the multiprocessing *forkserver* process.
++This was a potential privilege escalation. Filesystem based socket permissions
++restrict this to the *forkserver* process user as was the default in Python 3.8
++and earlier.
++
++This prevents Linux `CVE-2022-42919
++<https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-42919>`_.
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3_3.10.7.bb b/meta/recipes-devtools/python/python3_3.10.7.bb
index 404a582135..2d230793ef 100644
--- a/meta/recipes-devtools/python/python3_3.10.7.bb
+++ b/meta/recipes-devtools/python/python3_3.10.7.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
+           file://CVE-2022-42919.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.25.1


