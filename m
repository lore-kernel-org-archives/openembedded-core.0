Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4E4CAC5AB
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:28:11 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.664.1758230885940185034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D59WNoYx;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-828690f9128so197066785a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 14:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758230884; x=1758835684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQ1+R0YDaZD3XBuAwuB2z0bH4qJHcMIvzmFQ6i7AAgY=;
        b=D59WNoYxdRNG+7YNAhUnhm9QaTH1KbY6Wp5gLJ2rRZtL+xRkiXFuSsYo5jm0qD0jfa
         mz8DihyCPZp9Uyi6axlcNSBvBuuZb/62Nxznl+Oxh7+eiJNuKBDZQ3q2WiBV1ER23VDg
         GcC0lyxWfANiHjfrZvuK8nQqKatOzSbGqttRwrHVHOhCIQoz7eqpri1hAzFQJkL4Kzcc
         RYD+yFT4/+uR7JS3uUnXU4wb+b0AqIMr/k/3bitnMWsRlGzPMwF0VRY7M5HWd/oYy6r7
         ehiBhQPtK7XC2EruJKBgramouVgVAREojzImps1iCNuF838GrgTyRntWkJKyY8s3H1Tu
         +yVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758230884; x=1758835684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQ1+R0YDaZD3XBuAwuB2z0bH4qJHcMIvzmFQ6i7AAgY=;
        b=lVqxT8e5mW1kn8RPSWrZ7ymJYWs1lt+HD1WFc8tECEAGF5dftPFsJVdp3Jm1IdkNoJ
         8mel+b8AXMi+aZtlf83UqPT6Jn/T8IgGI1Qd9DHF65/iykK8lOFyc6E6k+2TBMQHc+HB
         w2l5qf8KnnTYeJyCdNOXzVAQiEXGa6hgWN4NcpI/r5tGtn3GgRNAzaG+Y4XECGJI4s/W
         0VJU83hxiwCGOrgDDx1aUQUbIUueWhisbExUqMjzc4GEe12hKQjsQl8vYL5TomRNf0Ae
         qA80RAM+tsVevkGE6MSwKzov181GNnF5lRhfWLdLYi0z3h11S3k/PotkGEObSZrqmACU
         RqAQ==
X-Gm-Message-State: AOJu0YygTltmHYI1q743WIVesHm1Ln47ITNBsj3qmgMbSnEyPYzzyOml
	j1iRN+2u+eNoNtaLEt+3wUHtoeGO8yZCNSaziIgI2lbonqViCPFb3lJX5qoj7Q==
X-Gm-Gg: ASbGncsXW72BnV3OwiKA+H36NssoaBUTkVCkXXHwgsB592WFNiEklLVe0CZS8FL4yCq
	9k9bC6DHkZXwCxdDFsef/rM9o+/oKNcWw0BRJCVq3ZoA1RZSwGymGk+5LdgrFlr08oZFDrGMQ5/
	cPtYLTRUnrkONHGsBEKJ/05UYRfVsuN9FBts5RSnxm0Du/m0B18blVPmy1fBn8Yfbwb8lxKuXB/
	I0+U5ymuBr8NrsrIUl5PZ+XQ8WVTbtSkHoVqBUw4HMmQ+/JKA+ewq8T8EikhkChG/U+dqKlxgsX
	+WH/CerTx8pk7yxnfaohdu8k3ZJVHpy3S2s1iYcjcFXUiC+mqqfsiD7+Ey8206J+xiqIRRG1XiZ
	wdQcvf3udZwPkk1cP9ZIxSGDgg2tqiAKAceiYKbZHg3tD4BDQKJfmbDFIz0+hoj2hMrJNzF81d7
	vBfQM=
X-Google-Smtp-Source: AGHT+IF6XXxmdphRdWI54Teo5PvA5kEeoFtwK7cPxLSgDM6emuABafx+gSeGJluzr7zB3u5Rw3dmiw==
X-Received: by 2002:ae9:e40a:0:b0:807:a4e7:d13c with SMTP id af79cd13be357-83baa7ff646mr130042085a.50.1758230884053;
        Thu, 18 Sep 2025 14:28:04 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-836263ab544sm235016185a.9.2025.09.18.14.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 14:28:03 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH 4/6] patchtest.README: expand obtaining patches
Date: Thu, 18 Sep 2025 17:27:27 -0400
Message-ID: <20250918212743.3960-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0.193.g4975ec3473b4
In-Reply-To: <20250918212743.3960-1-twoerner@gmail.com>
References: <20250918212743.3960-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223682

Expand the section on how to obtain patches with more methods, expanded
explanations, and detailed steps. The suggested set of methods include:
b4, git-pw, "git format-patch", and MUA programs.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 scripts/patchtest.README | 84 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 77 insertions(+), 7 deletions(-)

diff --git a/scripts/patchtest.README b/scripts/patchtest.README
index bfbe29a37997..b321d8e47c49 100644
--- a/scripts/patchtest.README
+++ b/scripts/patchtest.README
@@ -5,8 +5,7 @@
 Patchtest is a test framework for community patches based on the standard
 unittest python module. As input, it needs three elements to work properly:
 
-- a patch in mbox format (either created with `git format-patch` or fetched
-from 'patchwork')
+- one or more patches in separate, mbox-formated files
 - a test suite
 - a target repository
 
@@ -94,11 +93,15 @@ cmdline):
 
 ### Obtaining Patches
 
-Patch files can be obtained directly from cloned repositories using `git
-format-patch -N` (where N is the number of patches starting from HEAD to
-generate). git-pw can also be used with filters for users, patch/series IDs,
-and timeboxes if specific patches are desired. For more information, see the
-git-pw [documentation](https://patchwork.readthedocs.io/projects/git-pw/en/latest/).
+Separate, mbox-formatted patch files can be obtained in a number of
+ways:
+
+    - using b4 to obtain patches from a lore server
+    - using git-pw to obtain patches from a patchwork server
+    - using "git format-patch ..." to create patches from a git
+      repository
+    - using an email program, such as mutt or thunderbird, to obtain
+      patches from a mailing list
 
 Alternatively, `scripts/patchtest-get-series` can be used to pull mbox files from
 the Patchwork instance configured previously in .gitconfig. It uses a log file
@@ -109,6 +112,73 @@ the target project, but these parameters can be configured using the `--limit`,
 `--interval`, and `--project` arguments respectively. For more information, run
 `patchtest-get-series -h`.
 
+#### git-pw
+
+git-pw can be used with filters for users, patch/series IDs, and
+timeboxes if specific patches are desired. For more information, see the
+git-pw [documentation](https://patchwork.readthedocs.io/projects/git-pw/en/latest/).
+
+For example, to download a single patch from the Yocto Project's
+Patchwork server (and to demonstrate not having modified ~/.gitconfig):
+
+    (patchtest.venv) $ mkdir gawk
+    (patchtest.venv) $ git-pw --server https://patchwork.yoctoproject.org/api/1.2/ --project oe-core patch download --mbox 70101 gawk/
+
+To download a series, for example, try:
+
+    (patchtest.venv) $ mkdir clang
+    (patchtest.venv) $ git-pw --server https://patchwork.yoctoproject.org/api/1.2 --project oe-core series download --separate 38107 clang/
+
+#### git format-patch
+
+Patch files can be obtained directly from a git repository using `git
+format-patch -N` (where N is the number of patches starting from HEAD to
+generate) or using any other way of specifying a range of commit SHAs to
+git.
+
+This method would be the most likely used when testing patches in local
+mode before emailing them for review.
+
+#### b4
+
+In order to use b4, it needs to be installed. Fortunately it is a Python
+program that is hosted on pypi and can easily be installed into the same
+Python virtual environment that was created to run patchwork:
+
+    (patchtest.venv) $ pip install b4
+    (patchtest.venv) $ b4 --version
+    0.14.2
+
+To fetch the same single patch using b4 that was fetched with git-pw
+earlier, use:
+
+    (patchtest.venv) $ mkdir gawk-2
+    (patchtest.venv) $ b4 am -o gawk-2 https://lore.kernel.org/openembedded-core/20250912200740.2873851-1-Randy.MacLeod@windriver.com
+
+Fetching a patch series with b4 is a little more involved since b4 will
+create one mbox file with all the patches in the series in it. Given an
+mbox file with more than one patch in it, patchtest will only test the
+first one. So there needs to be a separate step to break apart the
+multiple patches into separate files:
+
+    (patchtest.venv) $ mkdir clang-2
+    (patchtest.venv) $ b4 am -o ross https://lore.kernel.org/openembedded-core/20250914133258.2625735-1-ross.burton@arm.com
+    (patchtest.venv) $ cat clang-2/v2_20250914_ross_burton_clang_improve_opt_viewer_packageconfig.mbx | formail -ds sh -c 'cat > ross/msg.$FILENO'
+
+NOTE: the formail utility is part of the procmail package for most Linux
+      distributions.
+
+#### mail user agents (MUA)
+
+Most email applications have a way of saving patch emails. Details for
+each MUA is beyond the scope of this document, but it is possible in
+most cases. The only catch is that each patch has to be saved in mbox
+format in its own individual file. Some client applications prefer to
+save emails in the Maildir format, and some programs will save a set of
+patches into one mbox file. The formail program from the procmail
+package is useful for manipulating and converting between formats and
+storage formats.
+
 ### Host Mode
 
 To run patchtest on the host, do the following:
-- 
2.51.0.193.g4975ec3473b4


