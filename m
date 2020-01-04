Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id D531F7F89C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:36 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 2so24899397pfg.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AegaRsgTbCLT2n/Bs+elhV1NVNoEsKXgGRSU1A3YZZM=;
	b=lXhfrjW/xuQ4crKj1OjSyWec/6YJAzgynPWTsNw5yoAUWuGWel3pkwuSs+nJRr7naY
	ujvop9L4Z5Qm/+G6oCtPt7LJAf4sp12rbGMHukgAcKzAQ4P6MtnlyQ4bubotVx9dVPsB
	Xx9/+A/b8mCw4XzdflZqxWsdXeC6+tZWcck2Cucn3/HJQgQ00s6F2bro+milQTFWuMgG
	NBzcgdbJSgu4ODMllHhfzmeNYzBOsVh0W2vKQ5GacxHVlX7Z1YU5zgIO+X/O5FVaIoLI
	u3Y7796X4t9oRwAaa/CokuDRBjkpYCZUoeYBHa6IhmwqwNrOjrmhftUI9BSIHyZBK2vr
	43VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AegaRsgTbCLT2n/Bs+elhV1NVNoEsKXgGRSU1A3YZZM=;
	b=uCvG6Qdk53Cza70xnz5wixCSnu9WL2z0thTJmn4hmXaRtCg7Q6YiK3yntls5YmtJ17
	YsGLsuinDWiQyTaZrLHmafPqurvIXGn8QndgqjVgYj5677KHvRJxmik7For3yuGEpez1
	EnBvaotNk5v9WtXU8TRhL3LJzyBuoGFp8svGAxSkB89LpjTJUdTVnXMeqcnAov5uUfHS
	nwVpu7R8PuuN0p6JE4+P5SQ4HPgnCYy5oCnoSjZEwHyBVi7V0MsOjYqdN6dvrT7L1jsW
	ED1Ft7YVv32eGYKZhXsUqEwS647IBFinW976JuiLJ74k5SoyRfQq541P02s03zmZ9SPf
	34ew==
X-Gm-Message-State: APjAAAUDJquXvuIWuBXt+4DraQHBriOK48iex4L1nHaY4fcBUOqeCsTs
	uU92mHKflZIYxEvFYXkxx7WPoj9aHCk=
X-Google-Smtp-Source: APXvYqwkd/V+unIkOiiuqVOVKYBLNW5KXhEr8IQTHQhnOJkYv/NX1GD7x5AAqVyr0wv6hh2VqwiSGA==
X-Received: by 2002:aa7:940e:: with SMTP id x14mr82786361pfo.42.1578155198036; 
	Sat, 04 Jan 2020 08:26:38 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:26:08 -0800
Message-Id: <cf9442e9cb6cbc48490bd783f82bedaed1f69d70.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
Subject: [zeus 27/29] pseudo: Make realpath() remove trailing slashes
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:36 -0000

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


