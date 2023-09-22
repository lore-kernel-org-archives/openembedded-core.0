Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D78CCE7A86
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 21:05:17 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.8585.1695416712301770055
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 14:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CaAizWfE;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c5c91bec75so24003105ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695416711; x=1696021511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gtGa338KgBMnBXFLU30i0YJXMPGn/aqeZIU9vBHT37g=;
        b=CaAizWfEU1QgMt94IMOD0Fna48M8VHbTBTthhUJIp1QrV9YmfZsyP4gUNAMTSgcA0t
         9OYcAw0pltJE/mr982WAMuqFH8hrHvbSCfgOq/aQvi/yetbtTOqg11V/0QDvv9nujqOg
         /plSJfhrzh4chHfWciwq+9IaYpjHuss+8nujRMfFz+XMNSnOTuktAcqICbDm7MvCSHxc
         6kx+3KwZXBwojG21A7L8QvliBr3JoPoCaUg/wgGhy/kpEaJl4qDYAPpBrE5DVm/YfByN
         vrACvQD+Bous4D7tnIyNNYiXs9WaCehQWE7A0xXR9LMU+Z17+keNNL2ZL6BICnzP3aeg
         Dz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695416711; x=1696021511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gtGa338KgBMnBXFLU30i0YJXMPGn/aqeZIU9vBHT37g=;
        b=Mc75sGy0CHhBxDm7rxWomC923rIfVdv8QkFpwVQi+u8nuhYFHem19l9Bh1AjcabzEE
         G+2ar03rn6dKQjoDtYrh04cybh2jZteNtRpGkUVZWPwb4t0z9eUWaQs4E2uc6hkMKxKY
         adQn8d8maWuTJsyjEAB/jt755hQM+/guGZUDuXwCfLlMyrEb5tVcPuO8z2AuVZuxEHUM
         WS+AIcpLnldWZ5NhP9TMeWLxY+WyatyA4d+fMcfcIKvMTcnszmHWr7RRIS32nd9dCZda
         ygmrlxORu8b7xYZOlA2GhJUU2xgWtV71cZgPkPsbYZDJcnqBamQECJrQgfT6Cg4T58eL
         ugmw==
X-Gm-Message-State: AOJu0Yz3/c5TTtMZS1hPIZ1VdnHgkumLxOxblhKMO/kfiixgKPwe5T05
	nJ+YfTjMJPvSPqBBiqPKJJd8J9F8QZTFGw==
X-Google-Smtp-Source: AGHT+IFWwKqhkuEb662t/6FXLgOmhKAHtkwdnl5Dm685Q27z2UO8R7MX5bBd/vWXzg66k2CaqtHMgg==
X-Received: by 2002:a17:903:112:b0:1c5:d185:8dba with SMTP id y18-20020a170903011200b001c5d1858dbamr468995plc.66.1695416711397;
        Fri, 22 Sep 2023 14:05:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id u15-20020a170902e5cf00b001a5fccab02dsm3943623plf.177.2023.09.22.14.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 14:05:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 1/5] musl: Update to latest
Date: Fri, 22 Sep 2023 14:05:04 -0700
Message-ID: <20230922210508.24087-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 21:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188133

Brings following bug fixes

* 79bdacff glob: fix wrong return code when aborting before any matches
* 7291c6c6 statvfs: allocate spare for f_type
* 39e43f08 math: fix ld80 powl(x,huge) and powl(LDBL_MAX,small)
* 6d101027 math: fix ld80 acoshl(x) for x < 0

Drop MIRRORS and switch to etalabs.net for git fetch URI
original repo is not working correcting with git Fetcher

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: Update SRC_URI to fetchable location

 meta/recipes-core/musl/musl_git.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 4a4fe978f93..7dd949ffafd 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,21 +4,17 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "83b858f83b658bd34eca5d8ad4d145f673ae7e5e"
+SRCREV = "79bdacff83a6bd5b70ff5ae5eb8b6de82c2f7c30"
 
 BASEVER = "1.2.4"
 
 PV = "${BASEVER}+git"
 
-# mirror is at git://github.com/kraj/musl.git
-
-SRC_URI = "git://git.musl-libc.org/git/musl.git;branch=master;protocol=https \
+SRC_URI = "git://git.etalabs.net/git/musl;branch=master;protocol=https \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
           "
 
-MIRRORS += "git://git.musl-libc.org/git/musl.git git://github.com/kraj/musl.git"
-
 S = "${WORKDIR}/git"
 
 PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"
-- 
2.42.0


