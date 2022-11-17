Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6AE6C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 02:53:40 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.6551.1668653613140099870
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 18:53:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=IUe2dxDq;
 spf=pass (domain: mvista.com, ip: 209.85.216.49, mailfrom: vkumbhar@mvista.com)
Received: by mail-pj1-f49.google.com with SMTP id gw22so442610pjb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 18:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t4hD7qzoZNNszW8DtAYmn1BWVKd1SZwiuvzhhqEksyI=;
        b=IUe2dxDq4dqlyMK2sgnc0RN5fWEFubMVY78CkuAFo/GQXxXqP/UMpHMSlsICmp9mst
         ks+Oh3VskD3uXD9ykDEVVf4C+qvfYEJi+ohS0TzLJTBEWITQqyHDAtXo1Dt2Fg8TJyPy
         86rm5vKOB8ECl7JUTYR1HcVcahMkI+MB4zT1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4hD7qzoZNNszW8DtAYmn1BWVKd1SZwiuvzhhqEksyI=;
        b=KZpKsnYTpf3FYlOuIkSZ4guJ6IKCvjl/H236CTXl8C/hpkyrRAVAV6lEeqm0aa8kVg
         2kVXQuz6tY8zfNAo9qUYCoOwCHqA0s2PWj6OGmJ8BqZvhGm16KT60rPP1X5l13AZETcc
         vCvlQK2Vnsf1en74vEDtAr4e3nIG09ioEjSmG+e3AX95gxb6s2UgZEBnK1xh0RG9+Tt2
         D9m7Hk4Zaoa3H14zY5oj4yomsOGU5OEDup+V+Ut0ce5ZvqrlRac9jrutNPNOO+yg/egQ
         InopmfzjpVevgFGmGPkXjDr8yLgHyO9GPnSiyh2oPaGe0dWxwoApq18YkNrmQiPAowIT
         vwpg==
X-Gm-Message-State: ANoB5pn016UglqOs4YnVVtKisAkNvu/l6XqolHvAUhAhFcOpvrMp2C1G
	fkjyayDQLGQZSFJlP0r/tGXnbuXyEmr3LQ==
X-Google-Smtp-Source: AA0mqf70hCJKTTdk4zjk/K98+lkOaQRjn6R2aZAu4vX0xf1aWEwFvPwPnMC43XpMNbN7IQxFpRIRLw==
X-Received: by 2002:a17:90b:2744:b0:218:7675:ba83 with SMTP id qi4-20020a17090b274400b002187675ba83mr240256pjb.61.1668653612031;
        Wed, 16 Nov 2022 18:53:32 -0800 (PST)
Received: from vivek-Latitude-3400.mvista.com ([116.73.95.148])
        by smtp.gmail.com with ESMTPSA id j34-20020a635522000000b004761e544ec6sm8348553pgb.89.2022.11.16.18.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 18:53:31 -0800 (PST)
From: vkumbhar@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] python: fix CVE-2022-42919 local privilege escalation via the multiprocessing forkserver start method
Date: Thu, 17 Nov 2022 08:22:59 +0530
Message-Id: <20221117025259.132393-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 02:53:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173398

From: Vivek Kumbhar <vkumbhar@mvista.com>

Upstream-Status: Backport from https://github.com/python/cpython/commit/eae692eed18892309bcc25a2c0f8980038305ea2

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../python/python3/CVE-2022-42919.patch       | 71 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.10.7.bb |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2022-42919.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2022-42919.patch b/meta/recipes-devtools/python/python3/CVE-2022-42919.patch
new file mode 100644
index 0000000000..eb9056731b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2022-42919.patch
@@ -0,0 +1,71 @@
+From 0c318fdc38b8db3bce50d6e9a6ec8064b4ff5720 Mon Sep 17 00:00:00 2001
+From: Vivek Kumbhar <vkumbhar@mvista.com>
+Date: Mon, 14 Nov 2022 11:33:48 +0530
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
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
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
index 404a582135..4a979eede3 100644
--- a/meta/recipes-devtools/python/python3_3.10.7.bb
+++ b/meta/recipes-devtools/python/python3_3.10.7.bb
@@ -42,6 +42,7 @@ SRC_URI:append:class-native = " \
            file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
+           file://CVE-2022-42919.patch \
            "
 SRC_URI[sha256sum] = "6eed8415b7516fb2f260906db5d48dd4c06acc0cb24a7d6cc15296a604dcdc48"
 
-- 
2.25.1


