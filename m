Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D41CCAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:28:11 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.671.1758230888591917797
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WMslpcyq;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b5f3e06ba9so28490071cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 14:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758230883; x=1758835683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvEkl2qruy5im8u/625nfyQB3aGKWIzwGlHkxlgxS9g=;
        b=WMslpcyqN+jpI/SeC14p2hx+oPYoVpf5iumsjdNZmF6tUicmB+yLXthxjuLQoDC4zk
         GjruwWfN9q6fTrz7nS4cta184hDreXzYxn3o9LtydSQPZXyJzK12/BvO8gKnTl7OrdPD
         YFeWRSVqJXB/sHasBJCoprdlbnijX8umIDrHKGrxVj5XnanHAzZxsui7HZhZzdc7DsVV
         3+fY5cYEzGbYQXw2jHdupLbLoQ0sECsdCCVHnjnC9AoDKuVkOMTgPBM8IdhV1/gNjnic
         g5+pB707DId2cJN6/5yFnotFpl8gHA8T4hNu5uJ+zWvtcp4VzW00AL7qyuBfgSWcIAn7
         sNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758230883; x=1758835683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvEkl2qruy5im8u/625nfyQB3aGKWIzwGlHkxlgxS9g=;
        b=E+8zAZFdq2k6dlmxZBKsN8naHbwZdFFk60wswIeB4hFk2pSj+dG8VpDAGkOlL71DM8
         R/BfbJptAF21U5XjpZnWq5ceayF2xxO4rpxz/iwLs1c+Eegp3ktzkIG6jY68yi4EXoNp
         YOf8t0eUukOGSVaVKGCv7RVi6kgt9lLXbbZHGsktNSnP6HUK+q8U7KhdsDeq2cxDu64C
         GWR8C3+eZCGkr29qecnwNDcLEmmBHzE9cP3hF3OrydJ1gkvDYh1P+J+QQRMHLeQxhP2o
         Lf81ov35l7z4HnW0Ea4aNSgMTnXlzc00CUrUdU4MOIaGOvAtfsr7EjUoPQdqsA1TNvas
         HFCg==
X-Gm-Message-State: AOJu0YzYXM0G3ugGqtBpBiAYp2rGsV0TO3ZWt6FLXs2JA/GdvR3Kn6Lh
	tKqb/Yw5tMJIMILJHMiBwMTjj2jnIBrTEHEzxyChtuCaJbPUCZDiUc6LBw423A==
X-Gm-Gg: ASbGncvfeHiGtSkJvnXnkYxCX7WfTeuQLoI6hOD1thm0sb6l9Ibsvnnf3vbctk1fazg
	oD2lCxEFxwhqE+rdkF+oZc4PegYqqgvbrYx257XQBTjRE2u4UFhsGoUh9Qi/FPv5Tqf7youKMVH
	/UXjIsI6ThqDItOajq52FIDUKGQjDEaItiDrpSDltMl1xo6xbOEiy6zX8IRGmxISjRhf9ww6rGM
	vzdrjdBpq0HOmFKSDexjwS+VvhtJZSnhrB4f6knspJQVQWjgx6W05Z8/V3hPm+j9wXAi2/ET1Oo
	N6oIrh4OuuiNpvl4ii4fFF7o1Bd0i3m2dPe1YkUo9qnSGeu3sYahL6tBJjueWO5PJscK83h7g+7
	EmJ7haNMxPNRuwdQFUaaWWq9Sh083UzovpoQ2Ua+8bFiF8yCf79L32iWsytccBobxBb2f
X-Google-Smtp-Source: AGHT+IHc+RDNni17uEJnmTVNBuVIGfdA7HjfXEhV70WGIRVbJGGR7Dt0Z82uoUoo5l3hfFXd8QkHNA==
X-Received: by 2002:ac8:7c50:0:b0:4b3:e964:7872 with SMTP id d75a77b69052e-4bdab340f3emr59220231cf.16.1758230882699;
        Thu, 18 Sep 2025 14:28:02 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-836263ab544sm235016185a.9.2025.09.18.14.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 14:28:01 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH 3/6] patchtest.README: update installation instructions
Date: Thu, 18 Sep 2025 17:27:26 -0400
Message-ID: <20250918212743.3960-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0.193.g4975ec3473b4
In-Reply-To: <20250918212743.3960-1-twoerner@gmail.com>
References: <20250918212743.3960-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223684

Update the installation instructions to demonstrate using a Python
virtual environment to install the patchtest module dependencies. Also
provide example #exactsteps. Using a virtual environment is considered a
best practice for Python programs, but also makes the git-pw tool
available in the user's PATH automatically.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 scripts/patchtest.README | 74 ++++++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 15 deletions(-)

diff --git a/scripts/patchtest.README b/scripts/patchtest.README
index 5a9dabc50b44..bfbe29a37997 100644
--- a/scripts/patchtest.README
+++ b/scripts/patchtest.README
@@ -26,26 +26,70 @@ https://git.yoctoproject.org/meta-patchtest/
 
 ## Installation
 
-As a tool for use with the Yocto Project, the [quick start
-guide](https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html)
-contains the necessary prerequisites. In addition, patchtest relies on
-several Python modules for parsing and analysis, which can be installed
-by running `pip install -r meta/lib/patchtest/requirements.txt`. Note
-that git-pw is not automatically added to the user's PATH; by default,
-it is installed at ~/.local/bin/git-pw.
+Patchtest checks patches which are expected to be applied to
+Yocto layers. Therefore, familiarity with the Yocto Project, its
+functionality, and image-build processes is assumed. Otherwise the
+[quick start guide](https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html)
+contains the necessary information.
+
+As a Python application, the recommended way it should be installed
+(following Python best practices) is to use a virtual environment. A
+Python virtual environment provides a convenient sandbox into which its
+requirements can also be installed with out affecting a user's entire
+system at large. Patchtest makes use of a test suite found in oe-core,
+so it needs to be available as well.
+
+For example, to install patchtest into a Python virtual environment
+called "patchtest.venv" located at some/where in your filesystem:
+
+    $ mkdir -p some/where
+    $ cd some/where
+    $ mkdir yocto
+    $ pushd yocto
+    $ git clone https://git.openembedded.org/openembedded-core
+    $ git clone https://git.openembedded.org/bitbake
+    $ git clone https://git.yoctoproject.org/meta-patchtest
+    $ popd
+    $ . yocto/openembedded-core/oe-init-build-env build yocto/bitbake
+    $ cd ..
+    $ python3 -m venv patchtest.venv
+    $ . patchtest.venv/bin/activate
+    (patchtest.venv) $ pip install -r yocto/openembedded-core/meta/lib/patchtest/requirements.txt
+
+In the above list of cloned repositories, the meta-patchtest layer is
+only needed if you intend to use patchtest in "guest" mode. Also the
+oe-core + bitbake clones can be replaced with poky instead.
+
+If "guest" mode will be used, the meta-patchtest layer needs to be added
+to the conf/bblayers.conf file generated above.
+
+If you would like to run the patchtest selftest found in oe-core, the
+openembedded-core/meta-selftest (or poky/meta-selftest, if using poky)
+layer also needs to be added to bblayers.conf.
+
+Once the installation is done, your directory layout will look like:
+    .
+    ├── build
+    │   └── conf
+    ├── yocto
+    │   ├── bitbake
+    │   ├── meta-patchtest
+    │   └── openembedded-core
+    └── patchtest.venv
+        ├── bin
+        ├── include
+        ├── lib
+        ├── lib64 -> lib
+        ├── pyvenv.cfg
+        └── share
 
 For git-pw (and therefore scripts such as patchtest-get-series) to work, you need
-to provide a Patchwork instance in your user's .gitconfig, like so (the project
-can be specified using the --project argument):
+to provide a Patchwork instance in your user's .gitconfig, like so (alternatively
+the project can be specified using the --project argument to git-pw on its
+cmdline):
 
     git config --global pw.server "https://patchwork.yoctoproject.org/api/1.2/"
 
-To work with patchtest, you should have the following repositories cloned:
-
-1. https://git.openembedded.org/openembedded-core/ (or https://git.yoctoproject.org/poky/)
-2. https://git.openembedded.org/bitbake/ (if not using poky)
-3. https://git.yoctoproject.org/meta-patchtest (if using guest mode)
-
 ## Usage
 
 ### Obtaining Patches
-- 
2.51.0.193.g4975ec3473b4


