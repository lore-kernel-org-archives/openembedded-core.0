Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7283ACA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:28:11 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.670.1758230887931562550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VNRcGoTy;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-80a6937c8c6so167243285a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 14:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758230886; x=1758835686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+aFgn/ftiilJlcGbhsA/vVx539AgsYUiKMHEqyhOWc=;
        b=VNRcGoTy+5JFfluxBYVLa9YaHxt4vcjBAK6AXVKy7rmfph7+mfBziHArT8hrNDOKV4
         7/wmaaqgBU6AeBVPpt2nIboN1DYZdW02A57WnSTJ4+1O9B5VPmPAGQKHIlES3k+eA2GQ
         NkNubJ9zmQgznRRi426QdxxD1oKKo/y+MSUF5cevS8wsYaGxxW531RKWn7pDS9eJttLS
         iStYv/CvJVSSlwq5uFBcqxLREyul9IMhswW54rk2+nz2DbJNoHpDAachuq/X+k9l85va
         kevEiPxSUtkO9XqSjQOtDJFCBGg+IXKlOsMhIwvcDSlpS0bFeeQgAbA0RuXYjbIOpGkR
         2+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758230886; x=1758835686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+aFgn/ftiilJlcGbhsA/vVx539AgsYUiKMHEqyhOWc=;
        b=KaiiGqp+t24EYuWpuy5tWfjBFVeWKEuiPoOcBe03In8rZedjWu5cdpE6BgL/MFpoKZ
         kA5fOF3qcyt+7HQOwBPVC1Moiwy6PvZFMKekEYaTuXlA1eRIXUSatOFTJskwS4e2nOuC
         3aRT6roGHTRwX1wMtAYX6IUAVCv3ZmLMuqyy23aqQ6EJOi18m9C0PYAKxhWYWK1/G+IK
         Ma1ZccbrA6fMUerEr4vPK5Y8ECj5PV+qKyWiEhN/iluPhaO0xUWd0NOGtwsKTkZl6XAy
         ExZsh8e9x4pMHzKQO4vemzQKVQ24IRWvDnSoUpoMBDwPl5HUUMpvrqo+39BNFI25R2Be
         dE6g==
X-Gm-Message-State: AOJu0YxXd0Xi27yb8s189iuJMjzeTqVIqRCpQIsPQGkw/8SSkHYuXXZQ
	kXIbCAUki0saNWhBIYcKC7q1kBX99uQpb1bKd/gK8w3qjw4L5+9QvgA4BI4c/A==
X-Gm-Gg: ASbGncuuRMMV38XSNwbRlAkWwGgxoUmR4d9863eSM5+5KD+xpiPZ9/MxkDIhoNqVbuL
	Hdb1acFVL51+BkBw49OkJlYfs7Yd0t4o0ROIPdZ8UDE4Ok5VZELd/3z4fVR8qlSpvuM6wNdGlC5
	OwBTsGZ2+HAZRN83mFzUuG1MLNPf/5yjymXQkealFX3RV0cPllS+m53eD8/J0n4lNuzjnwHzIXF
	gKKn3LkcXq3T0bDPHB6RVIUEs/aAz5m1DcYA6QRRItKNFoJs6FK0W7nkCoI9i15a8mtrJw0klyK
	Om87WhnHVVW0fH+6tvkiOT4bwYjiwWe1yIBUzJVjQOuCAH89c1zLCrbbedjXAespv2RvYhWrJ6R
	Bzd4k0LQQtEa+gshNfYvfVKnulQKV9CqScLv6r3S+G6No8qHp5oYJCvuvyZJdfM0O26FDHr+BLO
	zWVSw=
X-Google-Smtp-Source: AGHT+IHwYDdn1aTA9wyk+wImL59SW2COVIkHEh+MCfzBt4SIv8Cb0xMR7D8a9zgtaMQLsTtqQvFZCA==
X-Received: by 2002:a05:620a:134c:b0:800:e534:ea6c with SMTP id af79cd13be357-83bac3bb4famr94921685a.77.1758230886082;
        Thu, 18 Sep 2025 14:28:06 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-836263ab544sm235016185a.9.2025.09.18.14.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 14:28:04 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH 5/6] patchtest.README: update host mode section
Date: Thu, 18 Sep 2025 17:27:28 -0400
Message-ID: <20250918212743.3960-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0.193.g4975ec3473b4
In-Reply-To: <20250918212743.3960-1-twoerner@gmail.com>
References: <20250918212743.3960-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223683

Update the "Host Mode" section to provide more detail and exact steps
assuming the user is using a previously- or just-installed patchtest
following the steps outlined in the "Installation" section above in the
same document.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 scripts/patchtest.README | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/scripts/patchtest.README b/scripts/patchtest.README
index b321d8e47c49..30f7538529ed 100644
--- a/scripts/patchtest.README
+++ b/scripts/patchtest.README
@@ -181,27 +181,42 @@ storage formats.
 
 ### Host Mode
 
-To run patchtest on the host, do the following:
+To run patchtest in "host" mode, do the following:
 
-1. In openembedded-core/poky, do `source oe-init-build-env`
-2. Generate patch files from the target repository by doing `git format-patch -N`,
-   where N is the number of patches starting at HEAD, or by using git-pw
-   or patchtest-get-series
-3. Run patchtest on a patch file by doing the following:
+1. Using openembedded-core or poky, do the following if re-using the
+   installation given in the installation procedure above:
 
-        patchtest --patch /path/to/patch/file
+    $ . yocto/openembedded-core/oe-init-build-env build yocto/bitbake
+
+   or
+
+    $ . yocto/poky/oe-init-build-env
+
+2. Activate the Python virtual environment that was created using the
+   steps from the installation procedure given above:
+
+    $ . patchtest.venv/bin/activate
+
+3. Obtain one or more patches (see section above)
+
+4. Run patchtest on a patch file by doing the following:
+
+        (patchtest.venv) $ patchtest --patch /path/to/patch/file
 
     or, if you have stored the patch files in a directory, do:
 
-        patchtest --directory /path/to/patch/directory
+        (patchtest.venv) $ patchtest --directory /path/to/patch/directory
 
-    For example, to test `master-gcc-Fix--fstack-protector-issue-on-aarch64.patch` against the oe-core test suite:
+    For example, to test
+    `master-gcc-Fix--fstack-protector-issue-on-aarch64.patch` against the
+    oe-core test suite:
         
-        patchtest --patch master-gcc-Fix--fstack-protector-issue-on-aarch64.patch
+        (patchtest.venv) $ patchtest --patch master-gcc-Fix--fstack-protector-issue-on-aarch64.patch
 
-    If you want to use a different test suite or target repository, you can use the --testdir and --repodir flags:
+    If you want to use a different test suite or target repository, you
+    can use the --testdir and --repodir flags:
     
-        patchtest --patch /path/to/patch/file --repodir /path/to/repo --testdir /path/to/test/dir
+        (patchtest.venv) $ patchtest --patch /path/to/patch/file --repodir /path/to/repo --testdir /path/to/test/dir
 
 ### Guest Mode
 
-- 
2.51.0.193.g4975ec3473b4


