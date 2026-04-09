Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EABF31E37
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:28:57 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.135344.1775748528763701512
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 08:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NfJ2cgYY;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d04fc3bf2so605585f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775748527; x=1776353327; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVX0cNGJ247dfID8rDSwVYiCJfnPgyFMyJZX0EgNT5I=;
        b=NfJ2cgYYuTImbmDlCKTeJkdaA7+WWa/9XriFMtBv0C4RPc01aweHsmpUwijh5FTEUU
         z2+5YarZ4b4RFe7ZjGKC2jqIYHokT8SZxQVfdJu2Qs7GMBV0TUzcsa95UonxnXgt2Ef6
         6m58OdE0bhkf72I+zXi2IF8HF7z21MQaX/DcbtKm1sOL6cPcq6/odIlavbICMsx2z6CN
         uX/ZYwNKZ71o8XClaJQARkyHuQznLakdhn3TwHozZpkwVF1OMkDYZ3E+QpR/NCGPVssg
         gaIaz4242eAqeGtabjqYzlrM5oBUIrCWYBiSs8wdb8FhnHPk91bPzbvhV2XVWOPV0WXj
         6jCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775748527; x=1776353327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QVX0cNGJ247dfID8rDSwVYiCJfnPgyFMyJZX0EgNT5I=;
        b=tKjIvfAJSn4vlbFVBTrMmPq3w6UaFtrE+EVgHlgCxJIUjeeBtUju5u9n2RXIEKEZCp
         iYnMDrnznb2xl6WGhD2Iv5fOoS5Hartcut/t2+czlmrzNKEyYkR3pZCddpwmCj0ULZ4T
         eN0Rc7kisDE7qhdb5A3fKCfrmFydHx5SMybbYV+v+HdiOm3Oafdys3tTfQlBqAaKhXeK
         71bFokLa3zPAPnm91sOQOK3EBLYGJHwGYBR8UG2tDRKhffrUP/TgYJrssm6J288WoomY
         JLywGPfU3HyhAjLoyhThZtsaaE4nl+theSRvtAnISwc+Y9nxYSciI+2yl/87SpoMaqfu
         kVDg==
X-Gm-Message-State: AOJu0YzoaH1AF1c0SBp+/Vy115RjkWP5g5DachwM2WpjRWWzdIMVBNZS
	B16Yid7aS+JQHulIjSyFj0RuAopmNie6x1fDf67dspi5vl/+BKFX3QwVr9skpw==
X-Gm-Gg: AeBDiesg5p7OpxAauYIHKCzMBqwGIlPGmuYXQPy3DYV6oJdW8SnapugtoDFomcgRNj7
	kMilHgL8NLt8l3sZEpZCQIyufeIqO4foQfrqQVAsO9ot773ywNXWOYq9/jc7VbhVdZB/0TAFedS
	f4k8uzeHDxdKA3Dq5sbSlgrvBFESpBXoXjpHQsHAgXu8XykHxFLucDIKFnL3CddRAnXxTakOR9Q
	IBIemTu3+kyiOazxfVUhjk+b1nTOzzmeqqWYfq7flmr7gftNUPUat++kUkBomn3aDWnPrdTMgiP
	X5Nx9ponVruBq7cXGJkqkq3yTZg+TiktSg96GPDOTnv+p6cVP3wTz2piZ/TJgmU3piGfTAZK4lI
	SJzkScxizCcgaNoRqdGu7vhi/4QopVzVA5RGDWVqjOplLqfMMSO1a6IBXlJxbEWWOQofIw5wGPE
	PUPb/NKc9WSc9nNUTAeJDq2/iVd1WXr2VaUL5j
X-Received: by 2002:a5d:64c9:0:b0:43d:4d60:c2db with SMTP id ffacd0b85a97d-43d4d60c3abmr16205756f8f.46.1775748527023;
        Thu, 09 Apr 2026 08:28:47 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f843dsm66201651f8f.37.2026.04.09.08.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:28:46 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [whinlatter][PATCH 7/9] systemd: backport fix to build with glibc-2.43 on host
Date: Thu,  9 Apr 2026 17:28:26 +0200
Message-ID: <20260409152839.2894434-7-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409152839.2894434-1-martin.jansa@gmail.com>
References: <20260409152839.2894434-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 15:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234923

From: Martin Jansa <martin.jansa@gmail.com>

fixes systemd-systemctl-native on hosts with glibc-2.43:

In file included from ../sources/systemd-systemctl-257.9/src/basic/errno-list.c:13:
src/basic/errno-to-name.h:71:23: error: initialized field overwritten [-Werror=override-init]
   71 |         [EFSBADCRC] = "EFSBADCRC",
      |                       ^~~~~~~~~~~
src/basic/errno-to-name.h:71:23: note: (near initialization for ?errno_names[74]?)
src/basic/errno-to-name.h:114:26: error: initialized field overwritten [-Werror=override-init]
  114 |         [EFSCORRUPTED] = "EFSCORRUPTED",
      |                          ^~~~~~~~~~~~~~
src/basic/errno-to-name.h:114:26: note: (near initialization for ?errno_names[117]?)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-core/systemd/systemd.inc         |  4 ++-
 ...ilter-out-EFSBADCRC-and-EFSCORRUPTED.patch | 34 +++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-errno-list-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 761660f2c8..f41acc029d 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -17,6 +17,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 SRCREV = "5e38d199a623563698ab4a69acbbe3afa9135198"
 SRCBRANCH = "v257-stable"
-SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
+SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV} \
+    file://0001-errno-list-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch \
+"
 
 CVE_PRODUCT = "systemd"
diff --git a/meta/recipes-core/systemd/systemd/0001-errno-list-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch b/meta/recipes-core/systemd/systemd/0001-errno-list-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch
new file mode 100644
index 0000000000..5673175cb1
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-errno-list-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch
@@ -0,0 +1,34 @@
+From fb146f6d2c5118410fd19907651fd8f7310bf69e Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Tue, 24 Feb 2026 20:19:45 +0900
+Subject: [PATCH] errno-list: filter out EFSBADCRC and EFSCORRUPTED
+
+These are introduced in kernel v7.0.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/3cfb16998808a6ec8012a6120d0a82f0e1a0c8bb]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ src/basic/generate-errno-list.sh | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/basic/generate-errno-list.sh b/src/basic/generate-errno-list.sh
+index f756b2e020..491fa1b6e3 100755
+--- a/src/basic/generate-errno-list.sh
++++ b/src/basic/generate-errno-list.sh
+@@ -3,9 +3,13 @@
+ set -eu
+ set -o pipefail
+ 
+-# In kernel's arch/parisc/include/uapi/asm/errno.h, ECANCELLED and EREFUSED are defined as aliases of
+-# ECANCELED and ECONNREFUSED, respectively. Let's drop them.
++# In kernel's arch/parisc/include/uapi/asm/errno.h, The following aliases are defined:
++# ECANCELLED → ECANCELED
++# EREFUSED → ECONNREFUSED
++# EFSBADCRC → EBADMSG
++# EFSCORRUPTED → EUCLEAN
++# Let's drop them.
+ 
+ ${1:?} -dM -include errno.h - </dev/null | \
+-       grep -Ev '^#define[[:space:]]+(ECANCELLED|EREFUSED)' | \
++       grep -Ev '^#define[[:space:]]+(ECANCELLED|EREFUSED|EFSBADCRC|EFSCORRUPTED)' | \
+        awk '/^#define[ \t]+E[^ _]+[ \t]+/ { print $2; }'

