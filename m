Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B1CC4828A
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 14:21:12 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.17144.1706278871063542286
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 06:21:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sk7dcaeD;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2901f9ea918so230478a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 06:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706278870; x=1706883670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ecd68nRTqi76SryG1RqIGeNAnf34LZ/fF4PLj5JmDbM=;
        b=sk7dcaeD/2Oe+hF7bWl9JF/ZcwKO/u/GRMOI1r0AgFLijkvi4jZV2wiWv/LI3GXAT7
         TvZFT/3/gn7b0iFjss9JUyaboEdN4x/+w/HDgeyI6Ju6XqFuBvA1kTCEliNSMKRQ5Pbl
         eRTGnW/h2UWuEIxnhfonfUIab1SwjxzjTgruTTH7NvHqsH4eV2uYrzeqOglrxT7FwQgp
         g/7Pacgg/aOUYh/3/zt4/QaweBRcTWAZVoUMAJ8pgjVNHS4429VbvILmDiP2os/NM+Pd
         OVEKYdqtluU1ihayucfrlMOMBfG9oCisCr+qGrNTUpmRRhKZkIXo10uyTK0dGsu/vv7f
         0zyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706278870; x=1706883670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ecd68nRTqi76SryG1RqIGeNAnf34LZ/fF4PLj5JmDbM=;
        b=nLAklZO8WLmHA55pVcmk22WlR4C+BeV+h9nlf30zHI4YzSvcm6x1yL529dFpwkBCoP
         ZVsed+BMjMcutOizob/vu7nfhc0xNx0nRE4OtMNgYcMhR7UwaApu5FdeWB/AGSt3Oi07
         G+05VLBXe36ITvrI754E38yoJXPJOS9NuoKPP5ZHoPbX8RU8xfw1XHt2nLeJdkU7T2VY
         fUcXRkM+4vTL+ZjN1Uup4tt4jQt7i4uTD4mEx+s5OR2akITRa4q4vY2bk8/Cx6AKRnOy
         k2wv89kfLJWb47X93urPPxxqwHb8V3Cjf8BSZHV/0uoCdxMH8Qmnm5gB2UD9SnNmJ6um
         t1Zw==
X-Gm-Message-State: AOJu0Yw9brxQzz48DDT2iMbQGGF2MHkqVZADWkyJ39jWyPaP8pkyyLza
	CPQ3XLjexOqBBMb2H8O5ivf+svMCpCEM4O8XHgwnB2BeOGGoB2z3tzczu1JcA3oUGzbbz7YPHmj
	LErQ=
X-Google-Smtp-Source: AGHT+IEqjCTe6+O+UvLy9kmEDDqMCqEHLJx8KrWk7SgqKBWco4td2rC5rJZuOhkTYLuZgAue5zbZBA==
X-Received: by 2002:a17:90a:bb18:b0:293:f954:5407 with SMTP id u24-20020a17090abb1800b00293f9545407mr476256pjr.15.1706278869727;
        Fri, 26 Jan 2024 06:21:09 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id rr14-20020a17090b2b4e00b0029095a896c8sm1136458pjb.40.2024.01.26.06.21.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 06:21:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/8] pam: Fix for CVE-2024-22365
Date: Fri, 26 Jan 2024 04:20:38 -1000
Message-Id: <a3fbe1156fccb3e60a183263a3bde5a8ef6725a8.1706278642.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706278642.git.steve@sakoman.com>
References: <cover.1706278642.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 14:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194379

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/linux-pam/linux-pam/commit/031bb5a5d0d950253b68138b498dc93be69a64cb

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pam/libpam/CVE-2024-22365.patch           | 59 +++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.3.1.bb     |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-22365.patch

diff --git a/meta/recipes-extended/pam/libpam/CVE-2024-22365.patch b/meta/recipes-extended/pam/libpam/CVE-2024-22365.patch
new file mode 100644
index 0000000000..33ac37b7f0
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/CVE-2024-22365.patch
@@ -0,0 +1,59 @@
+From 031bb5a5d0d950253b68138b498dc93be69a64cb Mon Sep 17 00:00:00 2001
+From: Matthias Gerstner <matthias.gerstner@suse.de>
+Date: Wed, 27 Dec 2023 14:01:59 +0100
+Subject: [PATCH] pam_namespace: protect_dir(): use O_DIRECTORY to prevent
+ local DoS situations
+
+Without O_DIRECTORY the path crawling logic is subject to e.g. FIFOs
+being placed in user controlled directories, causing the PAM module to
+block indefinitely during `openat()`.
+
+Pass O_DIRECTORY to cause the `openat()` to fail if the path does not
+refer to a directory.
+
+With this the check whether the final path element is a directory
+becomes unnecessary, drop it.
+
+Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit/031bb5a5d0d950253b68138b498dc93be69a64cb]
+CVE: CVE-2024-22365
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ modules/pam_namespace/pam_namespace.c | 18 +-----------------
+ 1 file changed, 1 insertion(+), 17 deletions(-)
+
+diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_namespace/pam_namespace.c
+index 2528cff86..f72d67189 100644
+--- a/modules/pam_namespace/pam_namespace.c
++++ b/modules/pam_namespace/pam_namespace.c
+@@ -1201,7 +1201,7 @@ static int protect_dir(const char *path, mode_t mode, int do_mkdir,
+ 	int dfd = AT_FDCWD;
+ 	int dfd_next;
+ 	int save_errno;
+-	int flags = O_RDONLY;
++	int flags = O_RDONLY | O_DIRECTORY;
+ 	int rv = -1;
+ 	struct stat st;
+ 
+@@ -1255,22 +1255,6 @@ static int protect_dir(const char *path, mode_t mode, int do_mkdir,
+ 		rv = openat(dfd, dir, flags);
+ 	}
+ 
+-	if (rv != -1) {
+-		if (fstat(rv, &st) != 0) {
+-			save_errno = errno;
+-			close(rv);
+-			rv = -1;
+-			errno = save_errno;
+-			goto error;
+-		}
+-		if (!S_ISDIR(st.st_mode)) {
+-			close(rv);
+-			errno = ENOTDIR;
+-			rv = -1;
+-			goto error;
+-		}
+-	}
+-
+ 	if (flags & O_NOFOLLOW) {
+ 		/* we are inside user-owned dir - protect */
+ 		if (protect_mount(rv, p, idata) == -1) {
diff --git a/meta/recipes-extended/pam/libpam_1.3.1.bb b/meta/recipes-extended/pam/libpam_1.3.1.bb
index bc72afe6ad..527a368e2d 100644
--- a/meta/recipes-extended/pam/libpam_1.3.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.1.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
            file://pam-security-abstract-securetty-handling.patch \
            file://pam-unix-nullok-secure.patch \
            file://crypt_configure.patch \
+           file://CVE-2024-22365.patch \
           "
 
 SRC_URI[md5sum] = "558ff53b0fc0563ca97f79e911822165"
-- 
2.34.1


