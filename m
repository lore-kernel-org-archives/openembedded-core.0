Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F893CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 18:43:01 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.238374.1697568171277700187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 11:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ctp0ROPe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6b7f0170d7bso3518907b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 11:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697568170; x=1698172970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwK17+2o02xLq0Kq9X9pYljzJBjt2fPwCGpDzPcyTKo=;
        b=Ctp0ROPek3sq16fXQy9sRAuujhJoaft3+yciLFuTck4Al/+l327MIDF+vSqUuvIgGq
         oPhFRyCPMEAS7bjUXOgKERVMHAv3jR7bmMEbChlQX/K5/DfCs06RWT4OI+oGotbG3bBV
         MYK7oMjv1F+E0Ko6LHUjKp9QTwt4ixLRQ0eM0YQtEe0EGVsMB6e59cELDNv2Eoov1Bbp
         PD5Fh3LM/bYhiEG05vNMHDFWAdI/pL78Ae8Rnl7kIFEDQ+3Dj4NT3OF7x63raDQn/QCW
         OPMhl7nBfDbGFUQZMghjzZOJp7nlUpC1mKgxQFzISUcKZZ3jVF8XPtRMc4cgQIw+9N4L
         fynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697568170; x=1698172970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwK17+2o02xLq0Kq9X9pYljzJBjt2fPwCGpDzPcyTKo=;
        b=B0cJyv6L2EU+WBcX05WORkgNTmZ9eGDFjfD905fBG+L2Kc/oc8hufH0pBDciIpqa4g
         Xtqa9c3sXXl9hZHS9aYEjIJjvEcUDYzvYYk+fKWr1uQCHm+hZ+/rNh7AotgUP6PFSJG3
         9JaHP5BLRJNkErANGGdL7/teD4SgR1uP3+X8rCsQYVGs3ltWq54RrG7LUkW4b0T0Xk8V
         vZV/5c9arpQjmQWDrmWoZT8d1iktVaEaBPOJAZkC7RyUd+Z8K6cMEeGAL4RDb1YuG5G4
         7xtG/7Nak3eQXczjKDFsazPvJqXoBu3L3Ka9m0nN3i1JQmtfy2srZ25WUUJQj39j22pw
         S9KQ==
X-Gm-Message-State: AOJu0YyTzO3DywBO0b3pi7VXlWnmdkwOQ2GFcUrLRgqqg/FLVt7bfNM0
	CKVNFUzJCCxxjPCg0eF0PDmim9MvRou+sjValZA=
X-Google-Smtp-Source: AGHT+IH0M4x2eUnOYBTGAPvEx9Qj7wxPlH8SJp9v4YxnX6juDjGX14hZqWd+xqIqime6+WnaTaCsog==
X-Received: by 2002:a05:6a00:ccb:b0:6b4:d17b:25ab with SMTP id b11-20020a056a000ccb00b006b4d17b25abmr3861453pfv.25.1697568170297;
        Tue, 17 Oct 2023 11:42:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id w123-20020a626281000000b0066a31111cc5sm1838715pfb.152.2023.10.17.11.42.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 11:42:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/10] libxpm: upgrade to 3.5.17
Date: Tue, 17 Oct 2023 08:42:28 -1000
Message-Id: <47e270a4fd2e086b5ee9f38891f326ce505f2319.1697567211.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697567211.git.steve@sakoman.com>
References: <cover.1697567211.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 18:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189359

From: Siddharth Doshi <sdoshi@mvista.com>

- This upgrade includes multiple security fixes.
CVE-2022-4883
CVE-2022-44617
CVE-2022-46285
CVE-2022-44617
CVE-2023-43788
CVE-2023-43789

- Removed CVE-2022-46285 as it is already fixed by this upgrade.

- License-update: additional copyright holders
f0857c0 man pages: Correct Copyright/License notices
Due to this commit LIC_FILES_CHKSUM is changed

- Disable reading compressed files as that requires compress/uncompress executables.
Following the approach in oe-core/master:
7de4084634 libxpm: upgrade 3.5.14 -> 3.5.15

- Add XORG_EXT to specify tar.xz as upstream has switched from bz2 to xz compression.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/libxpm/CVE-2022-46285.patch      | 40 -------------------
 .../{libxpm_3.5.13.bb => libxpm_3.5.17.bb}    |  9 ++---
 2 files changed, 4 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxpm/CVE-2022-46285.patch
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.13.bb => libxpm_3.5.17.bb} (68%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm/CVE-2022-46285.patch b/meta/recipes-graphics/xorg-lib/libxpm/CVE-2022-46285.patch
deleted file mode 100644
index e8b654dfb2..0000000000
--- a/meta/recipes-graphics/xorg-lib/libxpm/CVE-2022-46285.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-CVE: CVE-2022-46285
-Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libxpm/-/commit/a3a7c6dcc3b629d7650148 ]
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
-
-From a3a7c6dcc3b629d765014816c566c63165c63ca8 Mon Sep 17 00:00:00 2001
-From: Alan Coopersmith <alan.coopersmith@oracle.com>
-Date: Sat, 17 Dec 2022 12:23:45 -0800
-Subject: [PATCH] Fix CVE-2022-46285: Infinite loop on unclosed comments
-
-When reading XPM images from a file with libXpm 3.5.14 or older, if a
-comment in the file is not closed (i.e. a C-style comment starts with
-"/*" and is missing the closing "*/"), the ParseComment() function will
-loop forever calling getc() to try to read the rest of the comment,
-failing to notice that it has returned EOF, which may cause a denial of
-service to the calling program.
-
-Reported-by: Marco Ivaldi <raptor@0xdeadbeef.info>
-Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
----
- src/data.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/data.c b/src/data.c
-index 898889c..bfad4ff 100644
---- a/src/data.c
-+++ b/src/data.c
-@@ -174,6 +174,10 @@ ParseComment(xpmData *data)
- 		notend = 0;
- 		Ungetc(data, *s, file);
- 	    }
-+	    else if (c == EOF) {
-+		/* hit end of file before the end of the comment */
-+		return XpmFileInvalid;
-+	    }
- 	}
- 	return 0;
-     }
--- 
-GitLab
-
diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
similarity index 68%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
index 8937e61cb5..4694f911be 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
@@ -11,19 +11,18 @@ an extension of the monochrome XBM bitmap specificied in the X \
 protocol."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=51f4270b012ecd4ab1a164f5f4ed6cf7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=903942ebc9d807dfb68540f40bae5aff"
 DEPENDS += "libxext libsm libxt gettext-native"
 PE = "1"
 
 XORG_PN = "libXpm"
+XORG_EXT = "tar.xz"
+EXTRA_OECONF += "--disable-open-zfile"
 
 PACKAGES =+ "sxpm cxpm"
 FILES_cxpm = "${bindir}/cxpm"
 FILES_sxpm = "${bindir}/sxpm"
 
-SRC_URI += " file://CVE-2022-46285.patch"
-
-SRC_URI[md5sum] = "6f0ecf8d103d528cfc803aa475137afa"
-SRC_URI[sha256sum] = "9cd1da57588b6cb71450eff2273ef6b657537a9ac4d02d0014228845b935ac25"
+SRC_URI[sha256sum] = "64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


