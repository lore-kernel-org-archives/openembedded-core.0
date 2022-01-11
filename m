Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45315C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:02:58 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.12253.1641927777309879681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T0ElL20i;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id hv15so488962pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Qjm/PbJ2wxjG55sN6+IYE6ftHMHAS1clshM1Z4ONDVc=;
        b=T0ElL20izGH6YcUvdPtoOWONz5e6WhBu5pK4EWmW+iXmAnPnLHWP5GO/M2t0ru8JWD
         nCleUMbMQ61xRnzUSeWpXqKdWP45zj5yhOl5Wys8V/dG5LsH5B5xIrUcPLtWhvz4K9oY
         nDSu2bBpm0y3o1P8aLlAoZV5FvnE4ac4wuwWfzx7DusipNTrPf+B6fTZ1pMGGIBUwNsT
         JIV7guoQOGrRB/ZTLgf3KLp1mcmXVx8a832LyY/naCs0yTsW03gemRyA/HMh3wpGjaEG
         pPuLczngNLr4P6vuooivCEhB3wHvePQD8ResG+ZY4a754ZqY3UoumeV76vYB/gYaDwux
         KObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qjm/PbJ2wxjG55sN6+IYE6ftHMHAS1clshM1Z4ONDVc=;
        b=PdCge1MwIVxS3PqSmKf4wnzMe9TJVLNJlX5ybdRQbx+Xe36qgvddznhzuMhri+iXA4
         syrTNI5vWVaQ3PpSBgfLWLhWNx5eBAQoIWeWAH9VDsyU17WqRrWaIh6u5TWWk42woLrF
         iCYW7XrNEiD2jWvwgJUqzx9lT2RpTY8FFP0gz+Q/YT48LYgl1s1oJutJkslsaMacCvRr
         trRCdfXTQl+XApHb6Ei0Czbtr70r1/zp7C0h2Ovis9pkipro/w36rTHCCza/veqkIPBD
         BC6U8rhciVXmPL5mCd9i0p9HIkP0xE3VGN01lSSjNkUKiKF8g+Pz+yxY9OoX8XZH7eH/
         3nHQ==
X-Gm-Message-State: AOAM532MTGlFkVCx+Fu7rYuP61SehdHdbHocQBJGI63nNqN86euIgwbX
	+3pq/vB17gP0pCe0z8n9kPOWx5oIDpc=
X-Google-Smtp-Source: 
 ABdhPJxnmzi9hX578tPUul56mGBWujofVZv47jiG2bepBk+VPnK3bZQsBb6X7CxOG4VwHCxvTzRgFg==
X-Received: by 2002:a17:902:cec2:b0:148:b4c1:540b with SMTP id
 d2-20020a170902cec200b00148b4c1540bmr5675220plg.0.1641927776484;
        Tue, 11 Jan 2022 11:02:56 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.02.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:02:56 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 18/22] recipetool/create_buildsys_python.py: less distutils
Date: Tue, 11 Jan 2022 11:01:27 -0800
Message-Id: 
 <19cb67ea283e269054ec30bb4e5bd98b5ab24fc5.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
References: <cover.1641920605.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:02:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160454

'distutils' is deprecated in Python 3.10 with removal in Python 3.12
(~October 2023). Replace 'distutils.command.build_py' with
'setuptools.command.build_py'.

To avoid an AttributeError, we call super().__init__() which provides
the missing 'distribution' attribute. However, for some reason, __init__()
in 'setuptools.command.build_py.build_py' class requires a 'dist' positional
argument which must be a 'Distribution' instance. It is not clear why
'distutils.command.build_py.build_py' class does not require this.

There is still a check which decides to inherit setuptools3 vs distutils3
that will need to be refactored when we add pyproject.toml and setup.cfg
support for more modern PEP 517 packaging.

Once distutils3.bbclass is dropped, any recipe inheriting distutils3
will throw a parsing error. The plan is to move distutils*.bbclasses to
meta-python. However if meta-python is not in bblayers, the parsing
error would still occur.

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 0b6b042ed17..1a150116872 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -8,7 +8,7 @@
 import ast
 import codecs
 import collections
-import distutils.command.build_py
+import setuptools.command.build_py
 import email
 import imp
 import glob
@@ -459,9 +459,13 @@ class PythonRecipeHandler(RecipeHandler):
         else:
             package_dir = {}
 
-        class PackageDir(distutils.command.build_py.build_py):
+        dist = setuptools.Distribution()
+
+        class PackageDir(setuptools.command.build_py.build_py):
             def __init__(self, package_dir):
                 self.package_dir = package_dir
+                self.dist = dist
+                super().__init__(self.dist)
 
         pd = PackageDir(package_dir)
         to_scan = []
-- 
2.30.2


