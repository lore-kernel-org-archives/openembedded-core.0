Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A764CCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 11:16:57 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12592.1762427814339669792
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 03:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fo8AOVkz;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2956d816c10so11814235ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 03:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762427813; x=1763032613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyNTuiPjnVHsWNfs9ubvC76KJBDXXGeqZKbEFADxN5k=;
        b=fo8AOVkzYlIsuvzgCNOUqbfemmxL86aHHCyGNkl0kKABXCxz9kkQe3wJHQf7vsqoKI
         b1/Fcxbkw7xJxxAScYNuN/K57BGTV5fm4EVWSExhy8Krpr5xuOz89WjqBgTb+ASlgTtE
         eoLnOseO0W+MsB7pGMXeQSLOqrBn99SrJp535ZQeDID2xXjTPIYyVHr5FgUu51riXNTT
         4ZgKBghHsWk77m2NUEW6cdd/nFbaCVWB4u1V8/jMFJgDoGblh6Yy0FRQiZFoG8NcRnLY
         yOca/VU0Eu/yi6DhXd6YTeukOSt+g4hietfaFpE3ZIaRZJRJDSDgwAGoX5eb2oNgEuIy
         v1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762427813; x=1763032613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyNTuiPjnVHsWNfs9ubvC76KJBDXXGeqZKbEFADxN5k=;
        b=jvO0lDmxEiJHjK6MC9Dv8pS37dc0R8GoUKuPGUnka41bnKD2oMGKpmGC/1Ys+7+65i
         6VDxWkuoUkespG2OVoNVHTrBBYCZrQZggTWqf4gv07xYo75v8Wbs93Q+peqOCqyvpo7u
         tECJwyNnA/10xdN+YUi1J+Oy637kMJlfhgbMyokhWNpqjlUMwXb6pX7ETCtFufVp6Vzt
         FUb44bj34mc6HXuA9cJFPJ2J8mX7yWiP2PC/q5E8+s078DvahYjMTFcyYj515OsyiRlx
         jbeSSQjIGeOeO1UMKt7gXZMs4r1YnhbyFoyC+3Ax3d135TMjafvhbVeuVedsN+zLb8IY
         1vrw==
X-Gm-Message-State: AOJu0YwMVCf4kpKIeU8kk98+hP3RVtl8rsEzE3TTx3Plo0y6o49Un+aX
	NKjUwzTM5hjIov5cOF4yx7HGS0p6KxygiAzYI7ehBNeCyQjmdEpqqB1tXOMYgQ==
X-Gm-Gg: ASbGncu8aNeXRIMCzGP4tgspdfi3vD1ktf7vAZPo/5FP4y2xdrEe3wuFqeQzQn8gFL+
	mI+ii7HKxEB4sx2st+nDKjs6fqrYgvpDZ3VLZsE1sDf1fk/URtJkJSEd2nHZzXANerlvFliw349
	KAPHLm8quI2EBEr5m+SNf90PPvV8yWdWaHr3EOj4n2qcqEz7zyXs6frrYeq4YXmgRQgCn9UFRNy
	P8laWRIPPGI4k1/sr8au9idBwJl2t7kqZz41hXPrGkPqzIJTJruX0ZlH+PFsAkogS/2L534wKui
	pzZrosyAs0JWVEumdHKYVwanFE3QRsWbkkRe4BFUVYhwdEsblvdMLJ2EgwMjXNfUhHSuLtmlJPm
	VLMUPil6ms5vm36rXwrqJQIzqLCwM4j+pmCxcDm7leNJ4JkoFE43VJJeis2ivcrvpSuWIAgXfuQ
	uKv3IN22Y20gxV18v4btIS60Li
X-Google-Smtp-Source: AGHT+IG8/SiKNI6RUjD+d+CBGqti5fhBI1k9IOIeRVUCJ/bUBlOoEj9oXtUenTmunnp/JTerT5/yLA==
X-Received: by 2002:a17:902:e891:b0:295:4d50:aab6 with SMTP id d9443c01a7336-2962ad1ef3cmr88897775ad.18.1762427813449;
        Thu, 06 Nov 2025 03:16:53 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c6f201sm25235425ad.55.2025.11.06.03.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 03:16:53 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 5/5] openssh: upgrade 10.1p1 -> 10.2p1
Date: Fri,  7 Nov 2025 00:16:27 +1300
Message-ID: <20251106111627.1264723-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106111627.1264723-1-ankur.tyagi85@gmail.com>
References: <20251106111627.1264723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 11:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225975

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Drop patch merged[1] in this release.

Changelog:
https://www.openssh.org/releasenotes.html#10.2p1

[1] https://github.com/openssh/openssh-portable/commit/11a5e5179077f73c2d45bcdf3f60153ae3f17815

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...c-use-the-absolute-path-in-the-SSH-e.patch | 35 -------------------
 .../{openssh_10.1p1.bb => openssh_10.2p1.bb}  |  3 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
 rename meta/recipes-connectivity/openssh/{openssh_10.1p1.bb => openssh_10.2p1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
deleted file mode 100644
index 360b62af34..0000000000
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 9dcccafe44ea17e972e7cddea205bbe9fe71d8d6 Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <jose.quaresma@foundries.io>
-Date: Mon, 15 Jul 2024 18:43:08 +0100
-Subject: [PATCH] regress/test-exec: use the absolute path in the SSH env
-
-The SSHAGENT_BIN was changed in [1] to SSH_BIN but
-the last one don't use the absolute path and consequently
-the function increase_datafile_size can loops forever
-if the binary not found.
-
-[1] https://github.com/openssh/openssh-portable/commit/a68f80f2511f0e0c5cef737a8284cc2dfabad818
-
-Upstream-Status: Submitted [https://github.com/openssh/openssh-portable/pull/510]
-
-Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
----
- regress/test-exec.sh | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/regress/test-exec.sh b/regress/test-exec.sh
-index 8a00c72..2891f27 100644
---- a/regress/test-exec.sh
-+++ b/regress/test-exec.sh
-@@ -179,6 +179,11 @@ if [ "x$TEST_SSH_OPENSSL" != "x" ]; then
- fi
- 
- # Path to sshd must be absolute for rexec
-+case "$SSH" in
-+/*) ;;
-+*) SSH=`which $SSH` ;;
-+esac
-+
- case "$SSHD" in
- /*) ;;
- *) SSHD=`which $SSHD` ;;
diff --git a/meta/recipes-connectivity/openssh/openssh_10.1p1.bb b/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_10.1p1.bb
rename to meta/recipes-connectivity/openssh/openssh_10.2p1.bb
index 83b6183858..866129573f 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.1p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
@@ -24,9 +24,8 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://run-ptest \
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
-           file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
            "
-SRC_URI[sha256sum] = "b9fc7a2b82579467a6f2f43e4a81c8e1dfda614ddb4f9b255aafd7020bbf0758"
+SRC_URI[sha256sum] = "ccc42c0419937959263fa1dbd16dafc18c56b984c03562d2937ce56a60f798b2"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 

