Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 59D157FDC1
	for <openembedded-core@openembedded.org>;
	Tue,  7 Jan 2020 02:35:03 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 6so27761212pgk.0
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 18:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AegaRsgTbCLT2n/Bs+elhV1NVNoEsKXgGRSU1A3YZZM=;
	b=WIvowD8wIxlBJSWpkt8NhAI97IBnzFi96RIWy/phBK16FnfooH4Chvz4T1k4woB8Po
	kWmVUK/PuCoyzcejBgkmGx/u1SrRUUxhuCHsHeZgTD5m/W1sJom5/CWeDmG4V4ttv4u8
	aj0z4uILvzvx24DEYoAZw5JQuQdI5xbl4UjABoTInskCKHS98bvYjFTN7v8UF+klZZgc
	YBfAosuEPBRb7DKj5VdP4wxdmGPNCdFU99b5tP9BVHSzUFtjBFVdW7TesCht9nu52b47
	Tcb1ZS4M/e/uNfVEB8DCUogm4D5wi748BxhyEjsIoM2YAL7r6oYOKdYE3MSt6NaDMbo0
	xDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AegaRsgTbCLT2n/Bs+elhV1NVNoEsKXgGRSU1A3YZZM=;
	b=UiCey+Wngxk5AJ+la/ra05i04MGDgOS44xHC4G7+5ZqvD0plk2rGqzLKZFrF4HuBPI
	GFCOBL5cwO+cJYU+CBHaU11+ynHa9GhaTbeYstFRt9vZ7wS4VGWlGefbpfGB0f22YI3G
	3lI3fhXF9f56JMld/xb1A6juHJUBeRvCpIUDef9dvW3tN0+rnjR28Vk1XBsLIfpd+/o+
	+uWTDg+CMqj7xOivUrGyPHazukoAvgDeq2W5z+o90qutcjx9wZ0sur8TE444tDxyxHA/
	u1FoAs1Qi8ZQse46BSyphnDVTA1H6hzDsMYqTCms4RzfmD9HALkl0oduwJisJ17GVzJt
	AmyA==
X-Gm-Message-State: APjAAAW71V+7DHB/zdlrWJCROJspnhZyahWsTuWsoFYw+/VKusIpStiy
	EPEPwkhz/H1K38MP2UguqITtslEn
X-Google-Smtp-Source: APXvYqy5qPyS3GhYsuq/UE2WNqTXyjWH8TVWEnf+HBcIp5TkMCKCvKwR0/o9A4BO3H6BFRQyfNWYEQ==
X-Received: by 2002:a62:fc93:: with SMTP id
	e141mr109275598pfh.262.1578364504306; 
	Mon, 06 Jan 2020 18:35:04 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	d23sm77806193pfo.176.2020.01.06.18.35.03
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:35:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 18:34:32 -0800
Message-Id: <cf9442e9cb6cbc48490bd783f82bedaed1f69d70.1578364301.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578364301.git.akuster808@gmail.com>
References: <cover.1578364301.git.akuster808@gmail.com>
Subject: [zeus 27/28] pseudo: Make realpath() remove trailing slashes
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
X-List-Received-Date: Tue, 07 Jan 2020 02:35:03 -0000

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


