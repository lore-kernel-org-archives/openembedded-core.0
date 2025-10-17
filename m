Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6B2CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:44:14 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.3283.1760733853636800187
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2i3aUx/i;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7930132f59aso3262484b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733853; x=1761338653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=o71YfGB64N1+4oj1mIfGWLpD1tygZZrL5zB831Zf+tA=;
        b=2i3aUx/iFlPn3O7HuwAOsXqthuy/VYg9Hr8LEUJRam/cr4VNMu//jghrcXqifpKo3X
         gvQLXnY+kVhDEM5s5AugJxnzUigGKIUyc1S7mkhvzqFmrICACGFWuT55lBjn8gq24qks
         q6IfHsvhBdpZtPYTTuuKxyl5BtZCVf/YXIvcOS3GKHqzI0ZpjH/7Whoprl4TCMaH3dv0
         urSw6tQdBsY1WqEb5XhQh1RDSGlLW174aKgvBW2hSnSFi0EQ0QJutMJpT4kJlRavfWN3
         LuZNpjd72PTc96l6I4lkOUePBQayuDZj2wdIUQh2HIqZchY6pHTP0h7tM3H1KewunqBk
         m8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733853; x=1761338653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o71YfGB64N1+4oj1mIfGWLpD1tygZZrL5zB831Zf+tA=;
        b=lGWGwLF1/O2UGchiFmbnIQ+ZqtNb5I8B6yJJV5+O1TBe1nNJps3Hur5qd3cZDb+gEy
         f6xIBhLtJUViU/YrSc7uJriXWNL97+vdfmiFvkxAIa38NsWmTUTWt80EVbGexTNGn2xx
         7gKNKBpwMmVXfSz0fAuNnH3yStqpHWisCyTdORNk2idSnjrLC6fj4vU3t7K8dR0vEgmQ
         UeiwalYSbtpOo4JkpIB3tjeS/Z5oairPT8Rk3mhxcQ26YJ+jNqyJ6D9Wvg8jT3Po4sZk
         MFzMTUP0OE1SRgecC7w9xpAH3rQ2GV2vXVm2YEKaoMW9m1HjPyhousQmedZR387CLcX/
         Rdrg==
X-Gm-Message-State: AOJu0YwLp8RzgLyHRfLLudLDZRzev9McqsPq29fY3N+fFquHwnUyohR1
	9XA42oj+pofCQPoW/c1edwYdZAJpqknu2vqbBKEbgC0sZedJz3FOxqjG6CufRN2bFOW7oeH2v/A
	LeRwjKGM=
X-Gm-Gg: ASbGnctW0CqfJApdeglRddVY+WoLN8x4j8ttvIxCjheGuLgaTFD1/FVjPt1XsGbQc1q
	MkxTDa4aOx9fyvkgGvJvZiwuDntPFENT5nOzQbe00Tu1dv7KisDxACwHtUW6a/Rog6qxP9W6sfI
	7T37cFz9R5TXCkw9iwWN+IAAxHEymLl1ViMiusxlnml+A5HiWShOVhprAs528mr6hxTi2LNkueu
	dQzZwaR4CAO9Eo8ik/FIF2DrmED3B8JJRfhVjj9Zi1U7ivnOstsyiIM054DIia3/e5Aob9ld8Si
	sT++Ryac9/8yAx1N5h0O3woLJfgUJk9xZKqOvGDFFA92la909tuR1/t2HrgloJZwiPRPebgwGOr
	a6zP6wIQY6vsWJfX/mI7D4SFC0LJqHTO9ff5VppvSppqcBEzvGBWgxfZsJdOQ0ngGnWoHubXeKG
	Eb
X-Google-Smtp-Source: AGHT+IFteQDxQoiSuoSdsgwSWBevHTg6xW53g8EMjpVhKT79YnEOeuhJpj2KUGzZCLnKQvtdQhuigw==
X-Received: by 2002:a05:6a21:e083:b0:2fa:26fb:4a5c with SMTP id adf61e73a8af0-334a8600aa3mr6851123637.59.1760733852844;
        Fri, 17 Oct 2025 13:44:12 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a230121ebfsm477066b3a.70.2025.10.17.13.44.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:44:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/8] Patch review
Date: Fri, 17 Oct 2025 13:43:59 -0700
Message-ID: <cover.1760733724.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225061

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, October 21

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2607

The following changes since commit 8f1000d9dad5e51f08a40b0f6650204425cc8efb:

  glibc: : PTHREAD_COND_INITIALIZER compatibility with pre-2.41 versions (bug 32786) (2025-10-14 10:35:12 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bruce Ashfield (4):
  linux-yocto/5.15: update to v5.15.188
  linux-yocto/5.15: update to v5.15.189
  linux-yocto/5.15: update to v5.15.193
  linux-yocto/5.15: update to v5.15.194

Peter Marko (1):
  python3: upgrade 3.10.18 -> 3.10.19

Rajeshkumar Ramasamy (2):
  glib-networking: fix CVE-2025-60018
  glib-networking: fix CVE-2025-60019

Saravanan (1):
  cmake: fix CVE-2025-9301

 .../glib-networking/CVE-2025-60018.patch      |  83 +++++++
 .../glib-networking/CVE-2025-60019.patch      | 137 +++++++++++
 .../glib-networking/glib-networking_2.72.2.bb |   2 +
 .../cmake/cmake/CVE-2025-9301.patch           |  71 ++++++
 meta/recipes-devtools/cmake/cmake_3.22.3.bb   |   1 +
 ...e-treat-overflow-in-UID-GID-as-failu.patch |   2 +-
 .../python/python3/CVE-2025-8194.patch        | 219 ------------------
 ...{python3_3.10.18.bb => python3_3.10.19.bb} |   3 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +--
 11 files changed, 315 insertions(+), 241 deletions(-)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/CVE-2025-60018.patch
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/CVE-2025-60019.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-8194.patch
 rename meta/recipes-devtools/python/{python3_3.10.18.bb => python3_3.10.19.bb} (99%)

-- 
2.43.0


