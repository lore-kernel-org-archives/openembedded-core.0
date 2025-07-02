Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA8BC83F07
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 03:12:51 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.15032.1751425970690874369
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 20:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dVhGyaYG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74b56b1d301so24085b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751425970; x=1752030770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOYsh3SyHvALQCrrssHvXPmth0IOeoM+UaafT1kBa4w=;
        b=dVhGyaYGpZTTQ1WdaYruaH+vJIm0k7tXqeNxPciv8mkgs7zhfzkE0UhJF3Lh8OdfBw
         8qzg+CTghyV1qJwhiE1neU15CFSy6X7ONmvgHnP2/nWeJuu45mx3ROr58mdkTAFtlLSO
         7a6L0SoWB6OFHZkiBcnnXFh7D3gzpHD0dkoBE5SxkBBy3O0vCO1LQ5TneIpEzh79XET1
         CR7dNMQECQCbk9fU5JEbpGyPtiXELIVF5aVL3hSR90M9Cr7mnLRXjLXaAnW4jWxWKPwW
         z3ISpdeJV2OT6X0mEBGvA4TM8PRQpTnsN0rjGuV6M+4IQUrMTDb/NBay70G4MBb/gvyx
         CeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751425970; x=1752030770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOYsh3SyHvALQCrrssHvXPmth0IOeoM+UaafT1kBa4w=;
        b=N+DV7xsc02obxsKqlKCtNtdN+NCUsFLzTFeiVwS+o6gxXzwXho6X57vHwoahogm22y
         67wQMqehcfOsQJmWmWeDKKhKliCWro2yNxgf3XFSHvHclfrYhYkXAsomxV5wkrHblmI4
         R6yYke3fzL3WuUzx3AkV9aalSOpJyRet2Ecn/3/9IDpi80bkg4srh5ao0RIgoGBN6AHH
         lmGY03f+qexRIhTOyKZ0rdxLfzDSxuCyZIwZ+o3veefSAODBvEc48Mm0aqvDIKE8mf1E
         kqsemymO3TFYzaXAe6y0DyR0FqZRNb0VNBsNbZC6lCTSZGbedmq7mybS6UoLFQZz9upv
         oDBQ==
X-Gm-Message-State: AOJu0YzPRptOUn81hlebRvRbcXQfh9XKnjJ3GizmoNd/6cF6UVyqXKYz
	rzVy8FptUJQVEm73sRKd3iopLm4iShS/93wHiEQKupenc/tNTdvlwpY8VryglkaIM85SjxF6qu3
	oqa9y
X-Gm-Gg: ASbGncsHam0YM75NXuQzpv2AzkFt0G54LYjoVjLYbqaxrTD9/0HzSl5OH2Oz5vFIYIg
	V9Vw9NUlrf4p62I5MPyDzz8pC3f62zmHnJUc00CISIjiAsyHa7xeGwQc1G/0FxFleYEjOpWDh+d
	d/VYd64N3FCNhCE9qjFBobJbP7/Bv/9q35ECcJHZoQ4zl1AgMKLjf1ouGEbAO+OthiuxIb0a6pV
	IaXxIDVGamNIItj6wgQLO5kJq0PciJRSp0F3R3eI1IrWPd39eXHQ+0/OyJx4lMEdZzX+/oUx0XY
	akARmBnW1CCaA44u1XCjRmUzvSMsfPqhKXCXOBqGZDEGP5IEo7BlNg==
X-Google-Smtp-Source: AGHT+IGtxR21f5NkTZf5vl1s9VhQb8OqSf+Xn2nZK3ClLOyERZrQxiCJfW6GecLEIXiCEoBClnolVg==
X-Received: by 2002:a05:6a00:3c92:b0:736:d297:164 with SMTP id d2e1a72fcca58-74b50db6043mr1773613b3a.1.1751425969959;
        Tue, 01 Jul 2025 20:12:49 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58069a9sm13633241b3a.174.2025.07.01.20.12.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:12:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 16/19] linux-yocto/6.12: revert riscv config sync
Date: Tue,  1 Jul 2025 20:12:01 -0700
Message-ID: <5f83371f9da7616f8941d9fef115934e41f93658.1751425749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751425749.git.steve@sakoman.com>
References: <cover.1751425749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219770

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Khem Raj
    Email: raj.khem@gmail.com
    Subject: Revert "bsp/qemuriscv32: Sync config with upstream defconfig 6.12+"
    Date: Thu, 29 May 2025 18:53:48 -0700

    These options are infact required for qemu riscv32 emulation.

    This reverts commit 64e08f7f69c662efe5f3780e7e42fc80635ad16f.

    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1baa2ede9b759632bd97f3308752ec863dc6543e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 24d93645ca..2088717489 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "3d3d56a846c993611859096016322dccea1317cd"
-SRCREV_meta ?= "60484dda26122958e5f4d8f813424fa637770bf6"
+SRCREV_meta ?= "3a5fec1707626251d69b7548f024856d838cc7db"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 042adf94d0..90a00f7cd5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
-SRCREV_meta ?= "60484dda26122958e5f4d8f813424fa637770bf6"
+SRCREV_meta ?= "3a5fec1707626251d69b7548f024856d838cc7db"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 089d4b4c6a..52ffb9882f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
 SRCREV_machine:qemux86-64 ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
 SRCREV_machine:qemumips64 ?= "98a85ed93bd5eaefe30c4aa3f7c15549be2bd032"
 SRCREV_machine ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
-SRCREV_meta ?= "60484dda26122958e5f4d8f813424fa637770bf6"
+SRCREV_meta ?= "3a5fec1707626251d69b7548f024856d838cc7db"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


