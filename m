Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67085C36001
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:49 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.2940.1742372207436017453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WO2sqzro;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22401f4d35aso123505785ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372207; x=1742977007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pj4ZxCeusCJ3SPzLhtDIrUk3aRrSCgkaXac09n9L0Q8=;
        b=WO2sqzromsfFvxOYZfEa4QQbzH78OvPwDK+G6judHt9/jGdoH0IBb9TKasskxdB12+
         BUsTLGU3dVecjmS7ioTCp6fb6SqhaJPHM7UUfhoU6JQay0sxZk9ZJb2Lp+PWhCiZ4KAk
         4GPZaVFNd+vvrMDyT9zQ/ZO1H6klv4BQfnRLSVsbD/bL9lWgEIQIbKUIhG2VuZONCphf
         fNPfVIj9ieJdyosF2lUhZruOL7kCImi5UDFmTQXuzQnMemRydCtxihKNWcB26UBGUu+7
         MGDMVGIdWDJ2Q6trAzUWWvEC900CuZ5vY8DQ3uzDNj2FMYPMiS8w5BzaPCYmQBs3fMLR
         /9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372207; x=1742977007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pj4ZxCeusCJ3SPzLhtDIrUk3aRrSCgkaXac09n9L0Q8=;
        b=adZSOyW1HFfjH447sS2yV1iyQDCOz51rTN12aqPg3dzPX7jQzsM3+ZDpEPJNjZdvb8
         Y/bz+zP7nAR3IUrDb0WqPfCqzq2Mo0Bndlp2RlCihaxhTEtqGo8ztHhqxHQyqfTG2YhZ
         f2slELkLlYrgsB19S9jrlKwmgF4rGk8D4UrrW5r3iTvtfnNEuVL+AMX13E6HxrT5Tas7
         rzuKO07IaYzqJ/Zto8k+uVwxs+mKARyFQMEJ7IbeJIM1lba5/fYQc7YMkYh9bkNs2JAE
         ZPVfXfgyioD2vbHXrAkohC0JgqGlnTXvA3iIhqLNeWBeAwe40slQyMlBiLMF4t0ioe4Z
         8xrQ==
X-Gm-Message-State: AOJu0Yy0KKrs7Ulc2v+f0sigGDoV+qhs7H8/iZ9/dPFzWdq3/O+x3xgZ
	7HEnRNjoWmzzJ5yvD2kakGGcoWlFyZZZqsUPb/0kqN9HloFeWICV9+dDLBoi
X-Gm-Gg: ASbGncuLMkr4wyT6XZ0XNv0mrHeogJpLUqrcr/b7TJtC5eDaTTKsSIkgS5YlUBUHxU6
	jkOOe7bAbyZhrwmR+xjBbyjLu5wm2P+ORX+pfD29/THc+zupUXz7l3D6lLPqlhGusVsLT6NjHwh
	qcWbXXWt8I7fn6Gzz7DC2/lTGzvIEjzTPl7iDZMUVv57pmNG2cnQNHLSEvFwGClM8BdDc11OQSL
	sui+C2UABfCjV1a4WGPcemfLEW+4KdFjlkH/FRtOy1fDCARWgnssQV1oseaeNVpRhvBsLRqf3qX
	0ck2UDAjaa60jFS55hag6AO6Hf9NMD4OT6ui
X-Google-Smtp-Source: AGHT+IG3RjSiX7jddIiStJILuAl1388m4FmrjWyK9RCqRUg3vEkfrYI5DNv7Pksd4/4QNt0o2yzSOg==
X-Received: by 2002:a05:6a21:b95:b0:1f5:59e5:8ad2 with SMTP id adf61e73a8af0-1fbeba93c63mr3348852637.24.1742372206672;
        Wed, 19 Mar 2025 01:16:46 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 26/27] man-db: Add missing rdep for col utility
Date: Wed, 19 Mar 2025 01:16:08 -0700
Message-ID: <20250319081610.3536475-40-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213306

man utility calls col utility internally when formatting is asked for
therefore it expects col to be in rootfs otherwise silently errors with
retcode 3 meaning 'file not found' in this case its due to col not being
found, other distros eg. gets this via bsdextrautils dependency

libssh2 ptest mansyntax.sh fails due to this error, which now works

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/man-db/man-db_2.13.0.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/man-db/man-db_2.13.0.bb b/meta/recipes-extended/man-db/man-db_2.13.0.bb
index 2178239bb60..a6ac82e6628 100644
--- a/meta/recipes-extended/man-db/man-db_2.13.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.13.0.bb
@@ -13,8 +13,9 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
           "
 SRC_URI[sha256sum] = "82f0739f4f61aab5eb937d234de3b014e777b5538a28cbd31433c45ae09aefb9"
 
-DEPENDS = "libpipeline gdbm groff-native base-passwd"
+DEPENDS = "libpipeline gdbm groff-native base-passwd zlib"
 RDEPENDS:${PN} += "base-passwd"
+RDEPENDS:${PN}:append:libc-glibc = " util-linux-col"
 PACKAGE_WRITE_DEPS += "base-passwd"
 
 # | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'
@@ -23,6 +24,10 @@ USE_NLS:libc-musl = "no"
 inherit gettext pkgconfig autotools systemd
 
 EXTRA_OECONF = "--with-pager=less --with-systemdsystemunitdir=${systemd_system_unitdir}"
+
+# util-linux col is deprecated and only builds for glibc
+EXTRA_OECONF:append:libc-musl = " --with-col=''"
+
 EXTRA_AUTORECONF += "-I ${S}/gl/m4"
 
 PACKAGECONFIG[bzip2] = "--with-bzip2=bzip2,ac_cv_prog_have_bzip2='',bzip2"

