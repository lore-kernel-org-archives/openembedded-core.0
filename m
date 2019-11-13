Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2D17B7F68E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:20:06 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x28so1870726pfo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=EapGspgQNC571N61hXx4m1BuRKAG238rLm9pFBEr1Y4=;
	b=bo8pJE7f18HdmnWtcSBMgEtjdZhIO1UK/b7u+fysLtuI2HWC6A1ml8oMfFv8ISTOxD
	w6XA3tyvN605QvpGhkH5ywATdllOBdBpoQseLnua4iND2D9VaHGe+EiA5C4h1jxAuM74
	ZvjOmjQSJhxYPSt2kTKdsc2WbFbN00ROse9TwcLTTiIyiZYLD3kNuAcrzoBBYUhJq/ej
	x9LG7W3RbTbsQzlGziqCFxqHAebgO8SbUD8satoNI4mWL8LzzqQm+quA+qeZ2kJszjNN
	3HRYqrvfPNsCHrrahafffkhFwWFz4i8fDEh3rjyqRuoAwcNuuuLU5HV1rHBxjkV9l4EL
	Q/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=EapGspgQNC571N61hXx4m1BuRKAG238rLm9pFBEr1Y4=;
	b=YNDp9WwSHoQ8PF7WRozDlHf1jJ0qYbn86o0Y8jZknMC9jVsj1BonN65/GUD8lUxVRR
	us8ZBz+Yxp0hj29pztn6YG7WoUStWiYLjztM+BvKDN97+bttzJvMj9ivj86PJ0C/8voL
	8mGTHMO0Q4SQMkY214bHH5wdqijHkDOwJ1xwC1PlEbMgojhsIYJSjY1tLllScIJPpnXw
	zIS0Jc1yNwVIPfGAojd8jvx4FHwDvD3ogzBw35VmruWt4WktePdaRZVxTb1/EPu7Ft/a
	o+xtkjlLLuSBNIHO3srI/LU7bDY1oLvTqQO2qd2FS41uYhlNivuqdxXAG2Ac3GHFJVll
	tFEQ==
X-Gm-Message-State: APjAAAWmDQ+9AwTMY4p2Qh6zHnDYb8z4BigsztLEAkNZwyp+PBow2QKj
	uCSKSX4MlIM9USTx8k9RxzwBV4CU
X-Google-Smtp-Source: APXvYqwXMHcaCLgJOH4fd1K7J41gqRab2PDl/J3XA7UUL6fD6PawKs6gOviX0gaCzZ6EBqjWbHjUqg==
X-Received: by 2002:a17:90a:3808:: with SMTP id
	w8mr5712725pjb.143.1573658407050; 
	Wed, 13 Nov 2019 07:20:07 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.20.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:20:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:24 -0800
Message-Id: <d1788e865d9bcd70b36d0f239647aeffb0ea8b85.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 21/25] pseudo: Fix openat() with a symlink pointing to a directory
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
X-List-Received-Date: Wed, 13 Nov 2019 15:20:06 -0000

From: Jason Wessel <jason.wessel@windriver.com>

While working with ostree disk generation in conjunction with wic, I
found a problem with pseudo where it tried to resolve a symlink when
it shouldn't, based on openat() flags. A C program has been
constructed to test pseudo to show that it is working properly with
the correct behavior around openat().

 #include <stdio.h>
 #include <stdlib.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <dirent.h>
 #include <unistd.h>
 #include <fcntl.h>

int main()
{
    /*
     * Tested with: gcc -Wall -o app app.c ; echo "no pseudo" ;
     * ./app ; echo "pseudo"; pseudo ./app
     */
    system("rm -rf tdir tlink");
    system("mkdir tdir");
    system("ln -s tdir tlink");
    DIR *dir = opendir(".");
    int dfd = dirfd(dir);

    int target_dfd = openat (dfd, "tlink", O_RDONLY | O_NONBLOCK |
                             O_DIRECTORY | O_CLOEXEC | O_NOFOLLOW);
    if (target_dfd == -1) {
        printf("Test 1 good\n");
    } else {
        printf("Test 1 failed\n");
        close(target_dfd);
    }
    target_dfd = openat (dfd, "tlink", O_RDONLY | O_NONBLOCK |
                         O_DIRECTORY | O_CLOEXEC);
    if (target_dfd == -1) {
        printf("Test 2 failed\n");
    } else {
        printf("Test 2 good\n");
        close(target_dfd);
    }
    /* Test 3 make sure the owner of the link is root  */
    struct stat sbuf;
    if (!lstat("tlink", &sbuf) && sbuf.st_uid == 0) {
        printf("Test 3 good\n");
    } else {
        printf("Test 3 failed\n");
    }
    /* Test 4 tests open with the "rb" flag, owner should not change */
    int ofd = openat(dfd,"./tlink", O_RDONLY|O_CLOEXEC);
    if (ofd >= 0) {
        if (fstat(ofd, &sbuf) != 0)
            printf("ERROR in fstat test 4\n");
        else if (sbuf.st_uid == 0)
            printf("Test 4 good\n");
        close(ofd);
    } else {
        printf("Test 4 failed with openat()\n");
    }
    /* Test pseudo db to see the fstat() above did not delete the DB entry */
    if (!lstat("tlink", &sbuf) && sbuf.st_uid == 0)
        printf("Test 5 good\n");
    else
        printf("Test 5 failed... tlink is owned by %i and not 0\n", sbuf.st_uid);
    return 0;
}

int main()
{
    /* Tested with: gcc -Wall -o app app.c ; echo "no pseudo" ; ./app ; echo "pseudo"; pseudo ./app */
    system("rm -rf tdir tlink");
    system("mkdir tdir");
    system("ln -s tdir tlink");
    DIR *dir = opendir(".");
    int dfd = dirfd(dir);

    int target_dfd = openat (dfd, "tlink", O_RDONLY | O_NONBLOCK | O_DIRECTORY | O_CLOEXEC | O_NOFOLLOW);
    if (target_dfd == -1) {
        printf("This is right\n");
    } else {
        printf("This is broken\n");
    }
    return 0;
}

Many thanks to Peter Seebach for fixing the problem in the pseudo code
to use the same logic which was already there for the
AT_SYMLINK_NOFOLLOW.

Also updated is the license MD5 checksum since the master branch of
pseudo has had the SPDX data updated.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc    | 2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 8b05735..8b34909 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -4,7 +4,7 @@
 
 SUMMARY = "Pseudo gives fake root capabilities to a normal user"
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/pseudo"
-LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a1d8023a6f953ac6ea4af765ff62d574"
 SECTION = "base"
 LICENSE = "LGPL2.1"
 DEPENDS = "sqlite3 attr"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 51db84c..6cf711e 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://toomanyfiles.patch \
            "
 
-SRCREV = "3fa7c853e0bcd6fe23f7524c2a3c9e3af90901c3"
+SRCREV = "060058bb29f70b244e685b3c704eb0641b736f73"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.7.4


