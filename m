Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1986DC4708D
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:53 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.177174.1672213053177718180
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hfON1Ppy;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id m26-20020a05600c3b1a00b003d9811fcaafso4227486wms.5
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOc5zAK8DvBe+d+m4apl7p4P1cA/DfR7UExlJpsCCzg=;
        b=hfON1PpybsKDSpUvaapkZqjjOzZq8LDw30+tj1B3/xMnDzCx618a3Viwk6Gmw0fEur
         gu4JE5KMk4FRYk5iU4oYIdLJW46BHgGU/aTSbejeo4hA3VkGZJnUJ1P58+NkdlNkEEEA
         On931ZpjNYkPue5Vsz+ynljclx7lJCzEGF8QEw8RsbsGjxhbIw7IYeb6jw3eFx/7r9PO
         Z9Zh00PNxBaYdCrrkYjZ1Lzi0As3KxFhROVYBNJ2V7FBbS8ol92I3KSerWM1bqRl0lba
         cKr0TnFQS6KwHS17j9//8RdBbLNMvOY9quev3dTOW+Kf16mSBvbXC/GSddl7G/5N9ZFa
         eGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOc5zAK8DvBe+d+m4apl7p4P1cA/DfR7UExlJpsCCzg=;
        b=yHtsao/YijPJ6an0Oq2xnQ4nrrpzzSwZB7vVGz6h92bo5ZihwORDhwGNHdqJwomauh
         JO7Rd1IQ8rqgCR2pe1KyL8Qg2X9IkFrZ8Hihfb49FMcnTZ8KQ665p1NzEcwpxKjPtcE1
         poowJ/w3oksB4fkZGhNgAi1zduzzXniq9QmVxqUC+p2tuz1O0vOw/0a002UYfdiHw36+
         VAdP4fjjyh6eXvsGA2NyuDUAbr3u64pgY3j67LYAxNN8joQKgu965zABEJziAb/Q1Fpl
         njMqSVyK38eweP5gZlPKpkjwitbCw85jQ02NwQg4PVG4ztIzDXGHRKTf/j6AtaYA7kHp
         tLiA==
X-Gm-Message-State: AFqh2ko/IAmMMPLxEHwFtZctXJjC5qgrnuN2FW/fO/uKpwpFdxGYh+Kw
	sv4wnUYV3VDeYQnjyivaIxzbXoqPyIc=
X-Google-Smtp-Source: AMrXdXt0NQJswghDiVYGFFONcYeVB6KvzfZdWVHmC5qMJ2O9l3TNn7TmeEysKOuMMwwkT/MRh5JEhw==
X-Received: by 2002:a05:600c:1ca3:b0:3d3:591a:bfda with SMTP id k35-20020a05600c1ca300b003d3591abfdamr19822464wms.27.1672213066531;
        Tue, 27 Dec 2022 23:37:46 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/25] Revert "python3-native: further tweak to sysconfig.py to find python includes correctly"
Date: Wed, 28 Dec 2022 08:37:21 +0100
Message-Id: <20221228073721.3454255-25-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175063

Unfortunately, sysconfig is used by:
- setuptools to find out where to install new headers
- autoconf-archive to find where Python.h is

In the first case we want the target location, in the second case we want
the sysroot location. The second case is not yet used in the wild
(as projects such as gpgpme are using outdated distutils-based m4 macros),
but it will become a problem once python 3.12 is out, and
said projects are forced to migrate to sysconfig. Let's deal with it
then in a more careful manner, and hopefully convince upstream that
there is a general problem too.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...g.py-use-prefix-value-from-build-configu.patch | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index cb79d9c671..dc06baf504 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,23 +1,24 @@
 From a73020a9c388b4882c384087882a77ab2c7b3729 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 10 Sep 2021 12:28:31 +0200
-Subject: [PATCH] Lib/sysconfig.py: use values from build configuration file
+Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
+ file
 
-This allows correctly substituting them for target builds using
+This allows correctly substituting them for target installs using
 native python.
 
 Upstream-Status: Inappropriate [oe-core cross builds]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 
 ---
- Lib/sysconfig.py | 7 +++++++
- 1 file changed, 7 insertions(+)
+ Lib/sysconfig.py | 5 +++++
+ 1 file changed, 5 insertions(+)
 
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index 93c6f73..a87870f 100644
+index 93c6f73..ff399e2 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
-@@ -668,6 +668,13 @@ def get_config_vars(*args):
+@@ -668,6 +668,11 @@ def get_config_vars(*args):
              _CONFIG_VARS['VPATH'] = sys._vpath
          if os.name == 'posix':
              _init_posix(_CONFIG_VARS)
@@ -26,8 +27,6 @@ index 93c6f73..a87870f 100644
 +        _CONFIG_VARS['installed_platbase'] = _CONFIG_VARS['prefix']
 +        _CONFIG_VARS['platbase'] = _CONFIG_VARS['prefix']
 +        _CONFIG_VARS['platlibdir'] = _CONFIG_VARS['PLATLIBDIR']
-+        _INSTALL_SCHEMES['posix_prefix']['include'] = _CONFIG_VARS['INCLUDEPY']
-+        _INSTALL_SCHEMES['posix_prefix']['platinclude'] = _CONFIG_VARS['INCLUDEPY']
          if _HAS_USER_BASE:
              # Setting 'userbase' is done below the call to the
              # init function to enable using 'get_config_var' in
-- 
2.30.2


