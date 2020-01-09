Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id A917B7FEA6
	for <openembedded-core@openembedded.org>;
	Thu,  9 Jan 2020 04:50:18 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q8so2733530pfh.7
	for <openembedded-core@openembedded.org>;
	Wed, 08 Jan 2020 20:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AegaRsgTbCLT2n/Bs+elhV1NVNoEsKXgGRSU1A3YZZM=;
	b=YwXg0vETJcrWdAVg9QmrKmmi4gZjnYR8MiGAzvvOMMKZ5uvPNkjA1dJcaZNhzVDt5L
	4RRPSfpFmhoGCBHvaSRgVnHHvrQm6fDoMZp0RrCBASUbZTL7+BJFyv8ieeudybnr1nag
	lNsS/itee9HGxpCazp21gRoLZLmHtvpxvbwo+ndvst7cFCje9JCAH2i0aFHMXcwP4NjX
	xEoNdClt1SDXq1r9r8Ji3RsdSEkGQD40W/rxVEwpulBjeLbPA+1rQrkw3irDWTvPgt1M
	SFtizLbAHg/Wx+8O4q14zer/SXAnikaSa8p+zoYpc21Gi0oHddxprrqguiMmIM5rLzPp
	Rmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AegaRsgTbCLT2n/Bs+elhV1NVNoEsKXgGRSU1A3YZZM=;
	b=gMmnfkrjfP3tgNSdNlXirYc6HyFl1jyEW1uryCDG+9SU+X4BcLdOxUq1ShKezZg9l+
	yJiOi1IP54G3F+wHZ92hIrI2B2uAria0I+hah785t48VS1VLE9XdRbh5MNMGjEZLhKnW
	A0zch2/ACC+iHbBVfEk3fiHGFIWYNikIqjOSjA4q1b3J2jLYofGVjDzOxKdS3RpOXJnN
	6VfvT5fOcjMIvVMlfF5h7ZEi1pvQIoRkvvvdG/WzXMF+X0sGG+kItOSZlCBPDrPqDUvC
	wekGyPYptLNL992TLNLcT6FmxXKlYV8RThLAUAGJe6UHJCa1WeIsOfvgbn3EybbicYOz
	wSNA==
X-Gm-Message-State: APjAAAUtn4odr316ChhVPUGaqj62R1y1gXeDdizUJjytRf/OYdnsdmf8
	TIjdhdnTT50qpPvIr7jIR3XWq+61
X-Google-Smtp-Source: APXvYqy7RP+GQKymEHFfDXG+ly3CNKKFebTxAUBDPMdg00A9PDnbWOHhaKNUu2yIrETddMd4UewMOQ==
X-Received: by 2002:a63:214f:: with SMTP id s15mr9660634pgm.238.1578545419641; 
	Wed, 08 Jan 2020 20:50:19 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a])
	by smtp.gmail.com with ESMTPSA id l9sm5018427pgh.34.2020.01.08.20.50.18
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 20:50:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Wed,  8 Jan 2020 20:49:45 -0800
Message-Id: <c251e753486dae9b460df315a6d19d6c81098ecb.1578544698.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578544698.git.akuster808@gmail.com>
References: <cover.1578544698.git.akuster808@gmail.com>
Subject: [zeus 26/28] pseudo: Make realpath() remove trailing slashes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jan 2020 04:50:19 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Linux system's realpath() remove trailing slashes, but pseudo's doesn't, need
make them identical.

E.g., the following code (rel.c) prints '/tmp' with system's realpath, but
pseudo's realpath prints '/tmp/':

    #include <stdio.h>
    #include <limits.h>
    #include <stdlib.h>

    int main() {
        char out[PATH_MAX];
        printf("%s\n", realpath("/tmp/", out));
        return 0;
    }

$ bitbake base-passwd -cdevshell # For pseudo env
$ gcc rel.c
$ ./a.out
/tmp/ (but should be /tmp)

This patch fixes the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 319bbf66e03377adf2db7efa93ef578e3460eb38)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...1-realpath.c-Remove-trailing-slashes.patch | 57 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch b/meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch
new file mode 100644
index 0000000000..17829ef3ac
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch
@@ -0,0 +1,57 @@
+From 86c9a5610e3333ad6aaadb1ac1e8b5a2c948d119 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 25 Nov 2019 18:46:45 +0800
+Subject: [PATCH] realpath.c: Remove trailing slashes
+
+Linux system's realpath() remove trailing slashes, but pseudo's doesn't, need
+make them identical.
+
+E.g., the following code (rel.c) prints '/tmp' with system's realpath, but
+pseudo's realpath prints '/tmp/':
+
+    #include <stdio.h>
+    #include <limits.h>
+    #include <stdlib.h>
+
+    int main() {
+        char out[PATH_MAX];
+        printf("%s\n", realpath("/tmp/", out));
+        return 0;
+    }
+
+$ bitbake base-passwd -cdevshell # For pseudo env
+$ gcc rel.c
+$ ./a.out
+/tmp/ (but should be /tmp)
+
+This patch fixes the problem.
+
+Upstream-Status: Submitted [https://lists.yoctoproject.org/g/poky/message/11879]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ ports/unix/guts/realpath.c |    9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/ports/unix/guts/realpath.c b/ports/unix/guts/realpath.c
+--- a/ports/unix/guts/realpath.c
++++ b/ports/unix/guts/realpath.c
+@@ -14,7 +14,14 @@
+ 		errno = ENAMETOOLONG;
+ 		return NULL;
+ 	}
+-	if ((len = strlen(rname)) >= pseudo_sys_path_max()) {
++		len = strlen(rname);
++		char *ep = rname + len - 1;
++		while (ep > rname && *ep == '/') {
++			--len;
++			*(ep--) = '\0';
++		}
++
++		if (len >= pseudo_sys_path_max()) {
+ 		errno = ENAMETOOLONG;
+ 		return NULL;
+ 	}
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 1f2df4a427..7c75293ef1 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://toomanyfiles.patch \
            file://0001-maketables-wrappers-use-Python-3.patch \
            file://0001-Add-statx.patch \
+           file://0001-realpath.c-Remove-trailing-slashes.patch \
            "
 
 SRCREV = "060058bb29f70b244e685b3c704eb0641b736f73"
-- 
2.17.1


