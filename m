Return-Path: <jwessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D6B66B96C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 20:04:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x71K46fk009747
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Aug 2019 13:04:16 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 1 Aug 2019 13:03:55 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id CF38AAA4854;
	Thu,  1 Aug 2019 13:03:55 -0700 (PDT)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Aug 2019 13:03:54 -0700
Message-ID: <20190801200354.119252-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v2] pseudo: Upgrade to latest to fix openat() with a directory symlink
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
X-List-Received-Date: Thu, 01 Aug 2019 20:04:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

While working with ostree disk generation in conjunction with wic, I
found a problem with pseudo where it tried to resolve a symlink when
it shouldn't, based on openat() flags.  I narrowed down the problem to
a simple c program to reproduce the issue:

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
pseudo has had teh SPDX data updated.

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
index 51db84c4d4..3350c3fabd 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://toomanyfiles.patch \
            "
 
-SRCREV = "3fa7c853e0bcd6fe23f7524c2a3c9e3af90901c3"
+SRCREV = "097ca3e245200c4a4333964af59a106c42ff3bca"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.21.0


