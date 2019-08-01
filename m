Return-Path: <jwessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E2ED17F530
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 17:56:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x71HtxpH006620
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Aug 2019 10:56:09 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 1 Aug 2019 10:55:49 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id 215C5AA45D5;
	Thu,  1 Aug 2019 10:55:49 -0700 (PDT)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Aug 2019 10:55:45 -0700
Message-ID: <20190801175545.63356-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] pseudo: Upgrade to latest to fix openat() with a directory symlink
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
X-List-Received-Date: Thu, 01 Aug 2019 17:56:24 -0000
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

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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


