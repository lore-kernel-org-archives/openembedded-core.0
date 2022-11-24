Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFA2C433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 12:25:50 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.22267.1669292746292228386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 04:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CZuH139M;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id j12so1348157plj.5
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 04:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K12JvBxBZsqF7YaXNWmINwY92m0H74osMbHKf0qPXhc=;
        b=CZuH139M/Yha3ak6rhudaiVzu0BgA4aOTj7mi0BRKO6Qji2h69rlfnL9IU4rKlFqZx
         hzKEnqVN/sjXNJr/ESHdw9t49y4H0kIkl0Hbj48rEOD/JozCXg2h+Z+8hTZmASBNepKI
         PZ+GCzVsFx5+IZFtLVGgG37Acw7A1LTllhEII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K12JvBxBZsqF7YaXNWmINwY92m0H74osMbHKf0qPXhc=;
        b=gpxbiCPCgbMAtJ+fGDO/jBEKntglWWuS74LVKSWKmEuK5YmzljWN2/XQ5bLWxzOB2w
         fzbnTYNh8D1BWwQ/9mfQ/4GEklw99aqQUqYGr0L60nHqpJs2yqA+uiKWYmfF+z35i1NM
         af+aDPY4dhb4Cdz1v2o1Z2MD5BvaEU6Agd+W0hsOtDy9vm2AO/R3czRTzjv+QwdqU37t
         hyuPs4Et6BhHJQZN1ITOuyJ9ygQEY77Ua96ywzkpW7dM4/L1JtIhs9qL1vrfwa9R4iEt
         Dsk4bG1BAhj8iZEgW2gkgGuVY0nlfU/n/R5vWxCsoP67LOGPzisc3kDupA7aWhrSQ2g4
         /aDQ==
X-Gm-Message-State: ANoB5pnGRy/jM0KIyj9rPXBo+irxoc9Hqq1OO6Tv/XgQpJrqN/LoqUKH
	vwPVHpxi7JffWV3kP30kR1/vY65tDUpz5A==
X-Google-Smtp-Source: AA0mqf7R7tHdwYe3VeQzcnlgxpW7DhuswrHxQopGzyZvaqaTIuzcg/tD4O9ancaJfk1M5X32eVi0lA==
X-Received: by 2002:a17:902:f792:b0:186:6d69:6e01 with SMTP id q18-20020a170902f79200b001866d696e01mr16321599pln.160.1669292745296;
        Thu, 24 Nov 2022 04:25:45 -0800 (PST)
Received: from vivek-Latitude-3400.mvista.com ([116.74.131.85])
        by smtp.gmail.com with ESMTPSA id a7-20020aa79707000000b005748eade0afsm1114290pfg.175.2022.11.24.04.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 04:25:45 -0800 (PST)
From: vkumbhar@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH v2] python3: fix CVE-2022-42919 local privilege escalation via the multiprocessing forkserver start method
Date: Thu, 24 Nov 2022 17:55:22 +0530
Message-Id: <20221124122522.38829-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 12:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173744

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


