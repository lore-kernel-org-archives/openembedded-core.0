Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C250C27C44
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 17:04:57 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.1249.1716311090554686572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 10:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=W7J+hZRT;
 spf=pass (domain: baylibre.com, ip: 209.85.222.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-792b94301eeso36678285a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 10:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716311089; x=1716915889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEik38ZsGMsle1m9GK4RgAxAQit17Fok6jLTBr/2VZE=;
        b=W7J+hZRTBYxyFFGJYtxxC+jF8b7dbHLRThDA0WftXtaSETr4l6iX5NWFmA0pNkRtvN
         wtd/eEyqqnrrQR8OK7irsfe6CePRqgCm1sRkttgT7zf1JSq7BjeNgK0EaGK6wpafKBGH
         6wewkUe4mqtby8ygXWRS1mgG3Nsdd7a7rIWIVtzOJ7NcJEvtvco7nUWofiXVf0YtyKL/
         dwa9x4FLNG5bVh4uDjyV5Ple6E7nhpsdqeTFO+yIjFbVO+cyGZiPHKFEd30W5svVUXKE
         dia/hkI51uqQeNv/uDxcS5jRgcu51vlbhcbqRab9PHZVkEzDVPvksMufjS0ND17x6Pql
         hjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716311089; x=1716915889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEik38ZsGMsle1m9GK4RgAxAQit17Fok6jLTBr/2VZE=;
        b=lmr0MSuTHpI5/mJeBwHI6aAvcHUeof0Ulzw+BT1qZ4BGqhCk250FD4QZ8zenqOxBD0
         JctAOLnBSGJ2CbbKHaNnQLNtcCpecmdu0ok6HCVAQ2nOgPEdDWhMWBL6v95/5SJnSaUT
         QjIuB3w1Tc+kz61HcMEaZEygFaDWwUOF3sCCEhkXAK6iaY5exfthPjYNZR6fXeLpdoit
         7xRLmy9HiY2BFxeeGXgxs1GSLj/kf/PDVRasYNBsa013UnuUXlKNmvVlSCisHU9U9Gwq
         RZKrgHUyUkKMHQhwJ/VKRu/ATr0n+3rtUXZ9aSj5B7col3UOygayD5kQ9zbXhvDrMZvN
         6H1g==
X-Gm-Message-State: AOJu0Yw/20T99z6Lp3ynglXE2eDHyJNeb3x5FjNo1avnphVV2fsrkdw7
	q3u1ROo9P2ggW5nloiGT89fXs3oIm1GbfvQ/E+bsVEv3FVPiJ2TMemkBggLbJ0sZEVAUtHIhWGR
	q
X-Google-Smtp-Source: AGHT+IH+LMnR6/sT4zJkVPWG3dPBXJzMS401OCih0VClb3qMM4kNuFPbTK3g9qo4XzAWF+tRD5Bs5w==
X-Received: by 2002:a05:620a:570f:b0:792:c2e7:6b41 with SMTP id af79cd13be357-792c759ade5mr3447562485a.22.1716311089089;
        Tue, 21 May 2024 10:04:49 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf2972cdsm1292833685a.54.2024.05.21.10.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 10:04:48 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: tim.orling@konsulko.com
Subject: [OE-core][PATCH 03/10] python3-pytest: upgrade 8.2.0 -> 8.2.1
Date: Tue, 21 May 2024 13:04:38 -0400
Message-ID: <20240521170445.1892398-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521170445.1892398-1-tgamblin@baylibre.com>
References: <20240521170445.1892398-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 17:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199659

Changelog: https://docs.pytest.org/en/stable/changelog.html#pytest-8-2-1-2024-05-19

- Improvements
    #12334: Support for Python 3.13 (beta1 at the time of writing).
- Bug Fixes
    #12120: Fix PermissionError crashes arising from directories which are not
            selected on the command-line.
    #12191: Keyboard interrupts and system exits are now properly handled during
            the test collection.
    #12300: Fixed handling of ‘Function not implemented’ error under squashfuse_ll,
            which is a different way to say that the mountpoint is read-only.
    #12308: Fix a regression in pytest 8.2.0 where the permissions of
            automatically-created .pytest_cache directories became rwx------ instead
	    of the expected rwxr-xr-x.
- Trivial/Internal Changes
    #12333: pytest releases are now attested using the recent Artifact Attestation
	    <https://github.blog/2024-05-02-introducing-artifact-attestations-now-in-public-beta/>
	    support from GitHub, allowing users to verify the provenance of pytest’s
	    sdist and wheel artifacts.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-pytest_8.2.0.bb => python3-pytest_8.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.2.0.bb => python3-pytest_8.2.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.2.0.bb b/meta/recipes-devtools/python/python3-pytest_8.2.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-pytest_8.2.0.bb
rename to meta/recipes-devtools/python/python3-pytest_8.2.1.bb
index 1e6674079ff..28dbe786f80 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.2.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.2.1.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "d507d4482197eac0ba2bae2e9babf0672eb333017bcedaa5fb1a3d42c1174b3f"
+SRC_URI[sha256sum] = "5046e5b46d8e4cac199c373041f26be56fdb81eb4e67dc11d4e10811fc3408fd"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.45.1


