Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 478FAC47088
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:55:43 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.92031.1669557338739231194
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:55:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2hBInwNn;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id r18so7689895pgr.12
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s86VubTPNLMdvQWWh6mSWIfxs4PvaKgh2atjSRPe75M=;
        b=2hBInwNnj+iq+vFuZEZ+/YuZtJWNmvVHF75UqIv3TD4iU3kL9kMj5isJnjcuRohvG8
         5z8z/znwudT/w3/tl11g6J226YD26vOdg170+5KPEYy4eQUIVE/OZX29PbXf7y7j4qiC
         nWMuet/bUbznWYuR63olwiIB9NjEhNIpGudEQiUImHjkSSPW4/nMh/lMLR9kwulbQdZu
         MWMu8aQl3vMe8te27Clc/m8xv97P4J8D/Qr+UCRgMsft3AFf7mLPIcMCAq1pMYSgKgFW
         PDKfgmSRsKUUsqNo1OsMVfE6fDt8Q0GeKU4znw7eBd+wAk/6KZDl177loxWsMHzk/3Cs
         EzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s86VubTPNLMdvQWWh6mSWIfxs4PvaKgh2atjSRPe75M=;
        b=OmCYSVQPWVB5y9PkCJuGZMu11Aw4yO5DYMS8KOHf084Xs7iIA4vNRi/62HIyLA/lci
         dsbIGr+JTLeH98kCuyzI/Qsvs6ejfNJ+QAhevam2DMfC+2KBfILaYDDz80QWxZ5H8LFn
         xa8IB/4Ar2vn+xk2EC3rgj0Kyw6BY2s4VV7x9O9LswfVI25oiTan4RyfXwhcRPukDYI/
         OyFpkPj4gzUpTMPpmzeXjVNVfWC1L0zEjPm+OfjePMhQB5eEt+17WjJ5T36/2V8uO/rH
         vaGnVbLRYvDdavsJ4GPLYXKC3Qo6QRSlNBLafY4t5cC0GtuGwXZuLJVKUv4Szxix8msd
         VKlw==
X-Gm-Message-State: ANoB5pmQG0Z0jvMEph8WhY7LQTw4t36lDbCn05vkoTFL407OAHevwXwd
	o6DbffYase/+TOvG0ERNxWTk351r7Fk5lIxVJIY=
X-Google-Smtp-Source: AA0mqf6mpTRJ/eYeHJeH63MtRrj4OnnUiIRd9oMKZj5Iz45EJylS8V+rCWB7jUHW6WaL0Ozehnmt/w==
X-Received: by 2002:a63:e042:0:b0:477:d9ee:bd35 with SMTP id n2-20020a63e042000000b00477d9eebd35mr12087894pgj.18.1669557339624;
        Sun, 27 Nov 2022 05:55:39 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.55.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:55:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/31] python3: fix CVE-2022-42919 local privilege escalation via the multiprocessing forkserver start method
Date: Sun, 27 Nov 2022 03:54:51 -1000
Message-Id: <9ed7184930707c98afabca8c6b712df874ad659f.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173850

From: Vivek Kumbhar <vkumbhar@mvista.com>

Upstream-Status: Backport from https://github.com/python/cpython/commit/eae692eed18892309bcc25a2c0f8980038305ea2

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


