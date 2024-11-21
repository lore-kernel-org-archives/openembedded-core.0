Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C32E64027
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:54:41 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.10481.1732226080442268113
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=W04v0lrS;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ea4c5b8fbcso1069292a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226080; x=1732830880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0drf6D2TyTKiiyJjppM1ATPEZXg5vJPkFEnetA4eUK8=;
        b=W04v0lrSTsS8evJPHzC8of28L0F5iNL0qANOHxF/BI9PI+m7y4uMgYVxgz+MlaJX69
         3v1rvs/LsYmKdV6VtqTFR3SKTb+XVfv/eyJNujiJnV318h2x4VnFpbuzp4nIFBhv6gBr
         kj7xOZN+JUBNI0dfu2q6nLkcqavod0Jo9iGEv54swcogPRd3kX8L5vbS26Rd9QwPbEUg
         s3tiZcw+Hz/DNTgIOSUXtlBxk4lQND7lk5OmqnEHm+VMJSgzXnElXobVHTaUQFhocJZE
         7b58rr2zEXL0PFo5cKqB4B5hilqCcYmHmuLZvGwASopJ5yqlEnFxhU7LMT22mgGikYGu
         JpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226080; x=1732830880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0drf6D2TyTKiiyJjppM1ATPEZXg5vJPkFEnetA4eUK8=;
        b=ciLPstZoXyPQUABm5c/hvLB+dRJ3o+KO/i1Qlyq00E2hMPuKx29xC2VKpjthP3QJ5Y
         JRaPHHBh61pFDn8F0dOBUCZhWmlSQBGk7LJJg3NzDnCFBPm4Ve9+5KWeVZ03TiCKEDNY
         bvALBa8dEW+dAA1KdU1GHXWkUdw4jsxSfH5EKccL2WjoVf2eGJc8MVQAq8y2Z+9eDJKc
         57u09LfagrQpAysO+WiCzMX8v60TksexXCQLS8iUFqIn7sn+W3Jc73HR7ENCXqBKIebR
         CArN7pm0Q5LAmAL3fLg73yi2aWsfSj3TihZKi63+0ZXT3qcIPuuaRo9Gel3vueoDFHVr
         DCCw==
X-Gm-Message-State: AOJu0YwDxBtqcExktUkyGRyFnk9JSzdArqyAbE10kHyUYNy195IGxK89
	FyvoICQnkL5XY8lPl/Itwnu6Nk4CgONmDtn6Zsltej/3jSOneVfSLyurHioSyBperprZrwx82oJ
	l
X-Gm-Gg: ASbGncuyAP7ztytC0ip39ukarn9ihcD3wWKpSSAU9vNvo7N4rCThon7Q0Jo5Vp7yd2m
	NodcjE57j9lK+bySKYdwHOs9Xhzd/O7GMFsV+MstujBywAMMY5voODse3xjwk1xyq++h56ELZsr
	5UqXpOuou6BlFSmkHrE3n+zsMmrpMWkxxAxh1NUF5phXAvSREss16YXyCAImp1PiZrAaBaWpmRx
	+3CsG4V9wkOK2K/cGIZRa9Ij11C3fOoHNap9jQ=
X-Google-Smtp-Source: AGHT+IFItV2jwz4s/pzCuOCObtfKBthEmNBQAk3XHoFFViHnibem6N6aLRHuCcPKvWyg4re2irKuvQ==
X-Received: by 2002:a17:90a:d807:b0:2d8:85fc:464c with SMTP id 98e67ed59e1d1-2eaebf06631mr7804304a91.11.1732226079624;
        Thu, 21 Nov 2024 13:54:39 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/27] sysvinit: backport patch for fixing one issue of pidof
Date: Thu, 21 Nov 2024 13:54:02 -0800
Message-Id: <d5991fb5c6efccee15c295e1e558373119758d95.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207567

From: Changqing Li <changqing.li@windriver.com>

When a program is a link to an executable, and this executable is
handled by update-alternatives, renamed to a different name, cmd
`pidof full_path_of_program` will not work.

Eg:
/usr/sbin/httpd -> /usr/sbin/httpd.apache2
`pidof /usr/sbin/httpd` cannot get pid of the process httpd

Backport the patch to fix above issue.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...rom-Mark-Hindley-which-avoids-cleari.patch | 31 +++++++++++++++++++
 meta/recipes-core/sysvinit/sysvinit_3.04.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit/0001-Accepted-patch-from-Mark-Hindley-which-avoids-cleari.patch

diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-Accepted-patch-from-Mark-Hindley-which-avoids-cleari.patch b/meta/recipes-core/sysvinit/sysvinit/0001-Accepted-patch-from-Mark-Hindley-which-avoids-cleari.patch
new file mode 100644
index 0000000000..33c9f62eac
--- /dev/null
+++ b/meta/recipes-core/sysvinit/sysvinit/0001-Accepted-patch-from-Mark-Hindley-which-avoids-cleari.patch
@@ -0,0 +1,31 @@
+From 5be52641a10ad6cd89bc7cdb80318e32be7e6662 Mon Sep 17 00:00:00 2001
+From: Jesse <jsmith@resonatingmedia.com>
+Date: Wed, 29 Mar 2023 10:34:45 -0300
+Subject: [PATCH] Accepted patch from Mark Hindley which avoids clearing
+ realpath information in pidof when trying to find matching executables.
+
+Upstream-Status: Backport [https://github.com/slicer69/sysvinit/commit/c06458e1c1822a2c8ff89fbdd29262ca97dd18b1#diff-4244fa301bd80b0a8f553ce0751fb0fcde1a45ee9dee71db85135cffde8ac712R13]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ src/killall5.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/killall5.c b/src/killall5.c
+index 86866b0..f7a401e 100644
+--- a/src/killall5.c
++++ b/src/killall5.c
+@@ -766,8 +766,8 @@ PIDQ_HEAD *pidof(char *prog)
+ 		return NULL;
+ 
+ 	/* Try to stat the executable. */
++	memset(real_path, 0, sizeof(real_path));
+ 	if ( (prog[0] == '/') && ( realpath(prog, real_path) ) ) {
+-		memset(&real_path[0], 0, sizeof(real_path));
+ 		dostat++;
+ 	}
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.04.bb b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
index 1dd5f575d2..d3f77d8150 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.04.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz \
            file://bootlogd.init \
            file://01_bootlogd \
            file://0001-hddown-include-libgen.h-for-basename-API.patch \
+           file://0001-Accepted-patch-from-Mark-Hindley-which-avoids-cleari.patch \
            "
 SRC_URI[sha256sum] = "2a621fe6e4528bc91308b74867ddaaebbdf7753f02395c0c5bae817bd2b7e3a5"
 
-- 
2.34.1


