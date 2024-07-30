Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBF5C3DA49
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 21:19:53 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web10.28300.1722374392384962260
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 14:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=vZmDgciZ;
 spf=pass (domain: baylibre.com, ip: 209.85.217.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4928d2f45e2so1220134137.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 14:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722374391; x=1722979191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxvQjMiE+3c0i/E4bhxobto0/2HLognknUIQVEQ5Nkw=;
        b=vZmDgciZlm/9xyBSAEgleM6ygHwhDWAB4Ig6Lg5UdhuVcLalP7SADkCS30pBQeKWYs
         1eHOL6kWHq6IVqUkrZcH2+qilAmU/L2Y+vXMeBmE4mcLeZJYXxvdHawY5dfhvfP4QmfI
         y38ObUFX9kGCKqu4lU0Jeife5oqOvq4vkzmNmvppG602ENLRGdKEp/osO/gloa5PCljL
         16rhqkGBMj4C5A8rNpwotJY7n5EKUMjPqT0+whuwq4hVlRh9qU/IlCCXGVqH3SSON/am
         EjgzBElJ3p4u0LPleYgh+eoFhEW+iTO/ti1D0lMAOeATvbJOk0eEFf82Pp2+A89PzfMa
         PPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722374391; x=1722979191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxvQjMiE+3c0i/E4bhxobto0/2HLognknUIQVEQ5Nkw=;
        b=vGLWK1DE/6bs8j67RdnQ6TstgrWUHgps24w4BFHFV5/+MWPLhHZhC1E1Djm/lS94sZ
         V61m9H0jzucI9gBbMnNHEAYzrI0o/QK9+YECfppBCLpAm7FnH/pbOZadx3Q+ggqRy/qu
         B9QMRoe8m095LOUmJcbLgakNtkKJw8hPZdiVkyj0N/j83Yio844I0OutxVv+EKwBJ/16
         ezn9cXLx+vvtk5XvFqfcpcRYEDtd4pZ6qASKhPahaBvhXWXPaKw3sIgLaqhmDmR2v4CC
         /82U+YWRcptwjq2blcN+6jwt5EENjQ9xBa7Ww3z/jCWb8E4lPJ3uqrwb5VxPXysOytNw
         qbhw==
X-Gm-Message-State: AOJu0YxUAzz+gjIbCBPYnn8y0QEiS/yBbOCU7cI501L4M55lZ1dafGxh
	Ls4Zndkmh+5IhEqYExKaCNp2Spl8tSxGoZ8y6d/NqdpHRPDWalRr8JQkMq7gaITQVaXDmnWcQ1f
	7
X-Google-Smtp-Source: AGHT+IGSKMXiYyp8YH2TZtacS84MsEwGcqANqsPNKkSWqc0Yy/tpQP2AQKmVdfDCO8/oJL8BzOlK8w==
X-Received: by 2002:a05:6102:291e:b0:493:c3b2:b5ba with SMTP id ada2fe7eead31-493fa15f37cmr16144680137.6.1722374388998;
        Tue, 30 Jul 2024 14:19:48 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d73ef379sm671889985a.62.2024.07.30.14.19.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 14:19:48 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] scripts/patchtest.README: cleanup, add selftest notes
Date: Tue, 30 Jul 2024 17:19:46 -0400
Message-Id: <20240730211946.93909-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240730211946.93909-1-tgamblin@baylibre.com>
References: <20240730211946.93909-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 21:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202685

Make some minor fixes to grammar and layout, and add a short new section
describing how to setup and use the patchtest selftests properly.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest.README | 60 ++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/scripts/patchtest.README b/scripts/patchtest.README
index 76b5fcdb6d..816406ff54 100644
--- a/scripts/patchtest.README
+++ b/scripts/patchtest.README
@@ -3,40 +3,35 @@
 ## Introduction
 
 Patchtest is a test framework for community patches based on the standard
-unittest python module. As input, it needs tree elements to work properly:
-a patch in mbox format (either created with `git format-patch` or fetched
-from 'patchwork'), a test suite and a target repository.
+unittest python module. As input, it needs three elements to work properly:
+
+- a patch in mbox format (either created with `git format-patch` or fetched
+from 'patchwork')
+- a test suite
+- a target repository
 
 The first test suite intended to be used with patchtest is found in the
-openembedded-core repository [1] targeted for patches that get into the
+openembedded-core repository [1], targeted for patches that get into the
 openembedded-core mailing list [2]. This suite is also intended as a
 baseline for development of similar suites for other layers as needed.
 
-Patchtest can either run on a host or a guest machine, depending on which
-environment the execution needs to be done. If you plan to test your own patches
-(a good practice before these are sent to the mailing list), the easiest way is
-to install and execute on your local host; in the other hand, if automatic
-testing is intended, the guest method is strongly recommended. The guest
-method requires the use of the patchtest layer, in addition to the tools
-available in oe-core: https://git.yoctoproject.org/patchtest/
+Patchtest can either run on a host or a guest machine, depending on
+which environment you prefer. If you plan to test your own patches (a
+good practice before these are sent to the mailing list), the easiest
+way is to install and execute on your local host; in the other hand, if
+automatic testing is intended, the guest method is strongly recommended.
+The guest method requires the use of the patchtest layer, in addition to
+the tools available in oe-core: https://git.yoctoproject.org/patchtest/
 
 ## Installation
 
-As a tool for use with the Yocto Project, the [quick start guide](https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html) 
-contains the necessary prerequisites for a basic project. In addition,
-patchtest relies on the following Python modules:
-
-- boto3 (for sending automated results emails only)
-- git-pw>=2.5.0
-- jinja2
-- pylint
-- pyparsing>=3.0.9
-- unidiff
-
-These can be installed by running `pip install -r
-meta/lib/patchtest/requirements.txt`. Note that git-pw is not
-automatically added to the user's PATH; by default, it is installed at
-~/.local/bin/git-pw.
+As a tool for use with the Yocto Project, the [quick start
+guide](https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html)
+contains the necessary prerequisites. In addition, patchtest relies on
+several Python modules for parsing and analysis, which can be installed
+by running `pip install -r meta/lib/patchtest/requirements.txt`. Note
+that git-pw is not automatically added to the user's PATH; by default,
+it is installed at ~/.local/bin/git-pw.
 
 For git-pw (and therefore scripts such as patchtest-get--series) to work, you need
 to provide a Patchwork instance in your user's .gitconfig, like so (the project
@@ -123,7 +118,7 @@ The general flow of guest mode is:
    -device virtio-9p-pci,fsdev=test_mount,mount_tag=test_mount -smp 4 -m
    2048"`
 
-Patchtest runs as an initscript for the core-image-patchtest image and
+Patchtest is run by an initscript for the core-image-patchtest image and
 shuts down after completion, so there is no input required from a user
 during operation. Unlike in host mode, the guest is designed to
 automatically generate test result files, in the same directory as the
@@ -131,6 +126,17 @@ targeted patch files but with .testresult as an extension. These contain
 the entire output of the patchtest run for each respective pass,
 including the PASS, FAIL, and SKIP indicators for each test run.
 
+### Running Patchtest Selftests
+
+Patchtest also includes selftests, which are currently in the form of
+several contrived patch files and a runner script found in
+`meta/lib/patchtest/selftest/`. In order to run these, the
+`meta-selftest` layer must be added to bblayers.conf. It is also
+recommended to set BB_SERVER_TIMEOUT (and thus enable memory-resident
+bitbake) in local.conf to reduce runtime, as the bitbake startup process
+will otherwise add to it significantly when restarted for each test
+patch.
+
 ## Contributing
 
 The yocto mailing list (openembedded-core@lists.openembedded.org) is used for questions,
-- 
2.39.2


