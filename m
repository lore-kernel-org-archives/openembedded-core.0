Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5EEEC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 00:18:49 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.415.1742257124635118892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 17:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j1kCSADh;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6f74b78df93so50669487b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 17:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742257123; x=1742861923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ruZ2Z4D1uBS49A56ML0Z3JvjGCAHXjMkZx4boHxYXfo=;
        b=j1kCSADhHo/iiNh1cwP86YOu8KrXv2sf7mFkvlFYKqc0PqXEU4dgNfTUEfMbJ3ozIU
         M1m81bTcFKE3k6TmB2YNnYUeFipbw4tvx3n62/fpcP7zAoYAnNFdjbwTkVKs64MZeduu
         KLfnPPKPWiXhhg43cfivmKY3vMQ9wBkYS4z2mlRwvVieCRxNc9OP0UFDs3WeqVNbiJBy
         8AWSucKbyd+Xg4cnRZIp3q6U7w+amQlO+8tbjLnHVTjYmchs9qnMqA5acPc53NBem/OZ
         0gWWXxqzJLuSeE/8PKKFp91rMDJcUL09D0QOPUaRI1veoaRPaImMc5oD4ziiE1UHiuJ0
         Yg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742257123; x=1742861923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruZ2Z4D1uBS49A56ML0Z3JvjGCAHXjMkZx4boHxYXfo=;
        b=WJ5xUXErl/1d9fhhlqDtWXN5V+6Jw3d4uTj76+0+oLnoz1LnnxvU+jPnY3bIJ8sJ4B
         YVawQCdqNdof9PFP2HTIsY/+ubVFQDHWgl8+S/cexRkfK7XWrrYUKjFJJckKFdJskP+G
         IShZEN6/SaJroruh9dpSwM+DbHprgusrfi3orO2DNDERIKEbCp7aPwGnzjE3oYi7h36v
         GJqINp1XLcO1cm2yXDAxzu5tGv0/saZpB1R9XADqVUUEVQwdUADgLLvsG/FpbBTNAS4e
         WpItTZGIeU1Gy4K8l0ntlBcCs0ho3XnQOPdx/dNXC7vp8j5gLwqon6+zhboP1iGn5R77
         wGfQ==
X-Gm-Message-State: AOJu0Yzcg6ogpZ1hFpiTCy08opesjruoFhRIsoZ4XlK6HsKkhcxfHgO2
	CDWBu+ZwpIbaRwewMJ4i28GvDcM4LyEpl87hzTXU3fNtqUuayy4iFPZc4Vni
X-Gm-Gg: ASbGncsgj5X7VlVOoT27QWdwfkFsQM0xr4Cg20D2v7fyhfmzJCro9aNcf8Ypl2HPVic
	SLC2M8UDMpj+z9o2OXv4Xn+gT2eknFIapy11idKXBdav7wUZ1tkxJgX3xwQSjdyyYZkjiHWvm9d
	1Jxq2aaXR9t5ljShxXE7qnzfZPsLLn0EJXW1xrHHkT4hoS7lnjl2H+Z5EKtGF/rr2MGx6uJ75Kh
	R3pvsjlSd4UtnwXQaK3/oXh4gIAQQh9wKxk3Tyhf0/VD6SZ/c2GhGBqoZA9rlmtz5UrHqukflPJ
	7HQYWIu2Pjmhd5P0h55m7yzvrrWHQfKWKUvmVxjCAKYGv1pshQ==
X-Google-Smtp-Source: AGHT+IGOMEqkYaKhX9byI1Q0OJXwyDt4iEkVkQME8u4jVlHa7nfg6Y2ulgJbtfATWEctVw+RxvrwAw==
X-Received: by 2002:a05:690c:6a06:b0:6f9:b12b:8943 with SMTP id 00721157ae682-6ff45fb41bcmr211539977b3.19.1742257123194;
        Mon, 17 Mar 2025 17:18:43 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff3298a8c1sm23986307b3.67.2025.03.17.17.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 17:18:42 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [PATCH] sqlite3: upgrade 3.47.2 -> 3.48.0
Date: Mon, 17 Mar 2025 20:18:04 -0400
Message-ID: <20250318001805.2527671-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 00:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213129

Changelog:
 https://www.sqlite.org/releaselog/3_48_0.html

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta/recipes-support/sqlite/sqlite3_3.47.2.bb | 8 --------
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.47.2.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.48.0.bb

diff --git a/meta/recipes-support/sqlite/sqlite3_3.47.2.bb b/meta/recipes-support/sqlite/sqlite3_3.47.2.bb
deleted file mode 100644
index c4acb73ed9..0000000000
--- a/meta/recipes-support/sqlite/sqlite3_3.47.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require sqlite3.inc
-
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
-
-SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "f1b2ee412c28d7472bc95ba996368d6f0cdcf00362affdadb27ed286c179540b"
-
diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
new file mode 100644
index 0000000000..bd2ac6614d
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
@@ -0,0 +1,8 @@
+require sqlite3.inc
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
+
+SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
+
-- 
2.43.0


