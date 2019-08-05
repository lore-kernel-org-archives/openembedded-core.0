Return-Path: <jwessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7CB817D270
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 16:32:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x75GWcM2017229
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Aug 2019 09:32:38 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 5 Aug 2019 09:32:38 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id 3A17BAA47AC;
	Mon,  5 Aug 2019 09:32:37 -0700 (PDT)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Aug 2019 09:32:37 -0700
Message-ID: <20190805163237.106405-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v3] pseudo: Fix openat() with a symlink pointing to a directory
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
X-List-Received-Date: Mon, 05 Aug 2019 16:32:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

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
---
 meta/recipes-devtools/pseudo/pseudo.inc    | 2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 8b05735bb1..8b34909726 100644
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
index 51db84c4d4..6cf711e4c2 100644
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
2.21.0


