Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF23C61DD6
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 20:06:48 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3391.1788034001320011692
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2026 13:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dkHli6Nh;
 spf=pass (domain: konsulko.com, ip: 209.85.216.41, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so2459559a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2026 13:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788034001; x=1788638801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qmi8R5sJ5fphNkbB5OAnnv/m4XeLZtz7LgsMnYYq/3M=;
        b=dkHli6NhTNA1+x+1UzToJwI0J01bBJs557nqELsQig8eleLmDDJfEPpDNyiG+W5ivV
         p+Eb6FWwv60YNUPOtsjPK/kCCHUfuXb5xMIBZ0YUAylb4GknSRYPwozaxitWLAfh3JOa
         JgmrCXHmeaec+wnijNxfs5nrGTQMm7Mfn+37E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788034001; x=1788638801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qmi8R5sJ5fphNkbB5OAnnv/m4XeLZtz7LgsMnYYq/3M=;
        b=skvSnehkGX9k1eUy7P+XlCZ31R7z1ilJeTsWoXw0mTs9o6eLPwQQGkBdoYD8EnKvAr
         RWSfb9ox78+XHGe2PFqBCp0ZrnJZNtMIFIDSjXMaiY8HOzBKZGF+kqAXyISDXL9/0Nnd
         9qwqRQLVOsDDmhas3yxYEpKlm7BzdEP4/xO6H2NlvAQPypGeOcwdIwU6Qjzf+bE5hb0D
         4FHivSH4NtQeu+iwlNcKNivZ1h/jfa8uNgZ2uf8OX85IJXLIBN1nc+XPTQOgbI6F4fHf
         vpdkfOQiv8dQH7q7+L0ji4nuRsyqArgHMRjh9dL/H6YtIow3juFp9cri/jJYuTmLhBIm
         brow==
X-Gm-Message-State: AFuF++k2cfdsas88ImV6hA03S7lgeX3HpWH5r0Gqc7PKtYz4SR8Jj65y
	eTtPt7OY0ueaOtdQSZTmDmoWL2uE2/XxKvX/NpEn2JqjSyNLHrqyNAx3uTVZViYvQ6HWd/KjaRg
	HBrtV
X-Gm-Gg: AYBFou09xHoFyKjxm+VciMrfI5MtyxuEhwofDEh6BAUzGvMPyfLFLejf4Xi6aVcNf/9
	EzIQLvem60+2vIJS9R4i470MGxyelBqBbhNaY2HpSKeItZ0Th3p+W3N67pYgxMH4gueCzDbDFZV
	Eh6oPInY2HUcZQfgeVMc3rM+HRmULuHgMRHYALnya9y4sGGy2KgzKzq4s+I/YA87L4zdoNWNyGq
	dqwcON+yobrxKO358pt0zjZ81aIj+1sFbU3qxZna9IzB8E5RnBKdwAaZjHm1JDGcUs+ymfEMPy7
	5rSw8REREFFgDaoH04luLtiosChnMVbxOHeDcIBbSWDBPIFexYzAHxrb2cQgm8nzmZw8A6fQboo
	rPO2xpf2jMLKR9o2zFiY1o+QZhp1hO7c1454UZLy0N3fWX1Q6Hpc/mI1uoFaV82NVC5sikpT5mo
	D4R9exNABvktVanov06EK9OkgLyfQglZtRLoQjWXYBgx+HcrfdSK/3XZg0DC1Mz9jodCGgIkD6V
	zoGyA==
X-Received: by 2002:a17:90b:440c:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-396d0eab08bmr25653907a91.6.1788034000553;
        Sat, 29 Aug 2026 13:06:40 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:d60c:dd14:3c5e:7ba6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398a2d45bd0sm1667635a91.0.2026.08.29.13.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 13:06:40 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-git: upgrade 3.1.60 -> 3.1.61
Date: Sat, 29 Aug 2026 13:06:22 -0700
Message-ID: <20260829200621.321262-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2026 20:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244636

From: Tim Orling <tim.orling@konsulko.com>

Source: doc/source/changes.rst

3.1.61
======

A fixup release to avoid accidental removal of public class regex on Actor.
It's now deprecated instead.

If you can, also try and provide feedback on the upcoming v4 branch
https://github.com/gitpython-developers/GitPython/pull/2177 - patches welcome.

See the following for all changes.
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.61

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-git_3.1.60.bb => python3-git_3.1.61.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.60.bb => python3-git_3.1.61.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.60.bb b/meta/recipes-devtools/python/python3-git_3.1.61.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.60.bb
rename to meta/recipes-devtools/python/python3-git_3.1.61.bb
index 5becc0af58..975579e656 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.60.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.61.bb
@@ -14,7 +14,7 @@ CVE_PRODUCT = "gitpython_project:gitpython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e936431879fa85581b4311fa63492ea52251909e2d655b6529c704c904ddcc24"
+SRC_URI[sha256sum] = "f51c24d8c0f733a195447385f5774a5dfe8767f5acfd7994a33755644c6ecc95"
 
 DEPENDS += " python3-gitdb"
 
-- 
2.47.3


