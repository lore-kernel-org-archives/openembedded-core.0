Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web08.4354.1612322655577116800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 19:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lKhG+bmA;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id u16so11032341qvo.9
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 19:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VCaz4EZNXDnpvexuEYSD9d1c0uDa+baw+KK+qL6EUTE=;
        b=lKhG+bmAkoOnQ/gpKUWlne8qyfyCstl/HWj4rCUslczhEDDQktr3pGbAD1DeTSpySL
         CX5ZNkpQ7QnF1JiP99FL0VYhRvLeAPEpxtpCiWLKcuPPK9JYjkZBzHtM9F6QoWsBMvFW
         tTCZoBgZjh9iwIYodn4tSgeTvoTtA2KRe6PpmCbA7es9thAMRNu+OOholepDEch6WfvX
         bL5BYKLPFjbXbqABGXMBc3M5UNIhyg4P396s84KNQ0dx1Q3zstvsWU11wfzCo+7kqicx
         f4GYpPRKpzphZ67X3haYUcOmcDoh5PcH/i3Jb5lqbA9HbWhe0nmHqoDPn4WP63t9B2Tw
         ZGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VCaz4EZNXDnpvexuEYSD9d1c0uDa+baw+KK+qL6EUTE=;
        b=PF9dzdUq5s/CEXJn+UyceeFi7JCNocqCzFVKat4kWjqemoFSxT1Mhz0cIiZI3kIkEU
         TjVE6njsb/pHj4Y6382+DFTDPYE2t4ibRJqLpGL02U2YWwPaGqYDdIw4Q47o/0sAkyj1
         8TJJHQID50RAoq0SknF2pXZ+zTxzB+DxAZXnOHxs3CYxtOF66w5902r1w1DV1EI0hjuQ
         4aO6ATeO0yMrjH90oDW5PgobUcyFOQQ1M2+Yt2v3n3C3/eOT61iaxXfNdmc3AgPq9FPL
         wOfyQC3XuAQxqLFQj4YQCN2aktvSvRHYIAqF+aLwp6Zj0dEXzr9FD8HpXqsvXuTD90w/
         xe5A==
X-Gm-Message-State: AOAM5322xVe4qykul2YDGhDO7Kxj9j8wlWnQakIg2vsIe69o7X2MYg26
	HrvTGvtKkhXVU4BrrXeBDFMyaMT9XHZcvA==
X-Google-Smtp-Source: ABdhPJxFWyf/jPC+VdpdOLgBDWKtkNhKerefB0WjnPQfQLYrufV1fVzEut/IIlb3+UpmQyCQeXgRWg==
X-Received: by 2002:a05:6214:b2b:: with SMTP id w11mr1203717qvj.27.1612322654492;
        Tue, 02 Feb 2021 19:24:14 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id v12sm721821qkg.63.2021.02.02.19.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 19:24:13 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] linux-yocto-rt/5.4: fix 5.4-stable caused build breakage
Date: Tue,  2 Feb 2021 22:24:02 -0500
Message-Id: <c14cdcc8c926bdb4ce27e9303801a8fb5ed58960.1612322536.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1612322536.git.bruce.ashfield@gmail.com>
References: <cover.1612322536.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

5.4-stable included a backport of:

   Author: Eric W. Biederman <ebiederm@xmission.com>
   Date:   Thu Dec 3 14:11:13 2020 -0600

     rwsem: Implement down_read_interruptible

     [ Upstream commit 31784cff7ee073b34d6eddabb95e3be2880a425c ]

     In preparation for converting exec_update_mutex to a rwsem so that
     multiple readers can execute in parallel and not deadlock, add
     down_read_interruptible.  This is needed for perf_event_open to be
     converted (with no semantic changes) from working on a mutex to
     wroking on a rwsem.

     Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
     Link: https://lkml.kernel.org/r/87k0tybqfy.fsf@x220.int.ebiederm.org
     Signed-off-by: Sasha Levin <sashal@kernel.org>

We implement a -rt variant to fix the build issues.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 74028376d3..c23fb328d4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "06c752971a7cb66123ab2b3731044103fc5662e0"
-SRCREV_meta ?= "70cec8c033a6f5c48f0a93374f0bfc25240f14fd"
+SRCREV_machine ?= "6b0893e9fddb5473b181b29059fe64980f353c83"
+SRCREV_meta ?= "d676bf5ff7b7071e14f44498d2482c0a596f14cd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 8dfa5357bd..32fbf9dc55 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "c65142e64f3d705d0b978b44394d274165d872b2"
 SRCREV_machine ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
-SRCREV_meta ?= "70cec8c033a6f5c48f0a93374f0bfc25240f14fd"
+SRCREV_meta ?= "d676bf5ff7b7071e14f44498d2482c0a596f14cd"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index ecdc8524c3..3a36694f9c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
 SRCREV_machine_qemux86-64 ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
 SRCREV_machine_qemumips64 ?= "e4714b9bb683cf08909e6dc2e91fd508e56bfbc2"
 SRCREV_machine ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
-SRCREV_meta ?= "70cec8c033a6f5c48f0a93374f0bfc25240f14fd"
+SRCREV_meta ?= "d676bf5ff7b7071e14f44498d2482c0a596f14cd"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

