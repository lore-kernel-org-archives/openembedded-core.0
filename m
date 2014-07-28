Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DB2D9704E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 02:58:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6S2wwoi025482
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 27 Jul 2014 19:58:58 -0700 (PDT)
Received: from yow-dellw-pg2.corp.ad.wrs.com (128.224.56.7) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 27 Jul 2014 19:58:57 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun, 27 Jul 2014 22:58:35 -0400
Message-ID: <1406516316-30111-3-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1406516316-30111-1-git-send-email-paul.gortmaker@windriver.com>
References: <1406516316-30111-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] base-files: remove strange 2775 perms from dirs like /home
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
X-List-Received-Date: Mon, 28 Jul 2014 02:59:00 -0000
Content-Type: text/plain

Mark Hatle did the historical research into why this was so,
and found that it originally was via debian import, and then
it morphed over time:

<fray> +#   chown -R root:root ${D}
<fray> +#   cd ${D} && chown root:src     usr/src
<fray> +#   cd ${D} && chown root:staff   var/local
<fray> +#   cd ${D} && chown root:staff   home
<fray> +    cd ${D} && chmod 755  `find . -type d`
<fray> +    cd ${D} && chmod 1777 `cat ${S}/debian/1777-dirs`
<fray> +    cd ${D} && chmod 2775 `cat ${S}/debian/2775-dirs`
<fray> that was the original code
<fray> so THAT is why they're 2775..
<fray> they were original 'src' and 'staff'.. which has gotten lost
      sometime in the last 10 years

<fray> AND the origin:
<fray> commit b45c9ed40bb4f893f99127a21776aef3ae888ad7
<fray> Author: Chris Larson <clarson@kergoth.com>
<fray> Date:   Tue Sep 30 16:30:41 2003 +0000
<fray>     Add base-files 3.0.10 (from debian).
<fray> thats where the brain damage started ... Debian in 2003..

Here we simply convert them to being normal 755 dirs.

[YOCTO #6579]

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/files/fs-perms.txt                           | 10 +++++-----
 meta/recipes-core/base-files/base-files_3.0.14.bb |  3 ++-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
index c829bece2b4c..9c144109eaf1 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -50,16 +50,16 @@ ${localstatedir}/log	link	volatile/log
 ${localstatedir}/lock	link	/run/lock
 ${localstatedir}/tmp	link	volatile/tmp
 
+/home				0755	root	root	false - - -
+/srv				0755	root	root	false - - -
+${prefix}/src			0755	root	root	false - - -
+${localstatedir}/local		0755	root	root	false - - -
+
 # Special permissions from base-files
 # Set 1777
 /tmp				01777	root	root	false - - -
 ${localstatedir}/volatile/tmp	01777	root	root	false - - -
 
-# Set 2775
-/home				02755	root	root	false - - -
-${prefix}/src			02755	root	root	false - - -
-${localstatedir}/local		02755	root	root	false - - -
-
 # Set 3755
 /srv				0755	root	root	false - - -
 
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index b30f56b9db50..10d0f449fa3f 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -32,7 +32,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 docdir_append = "/${P}"
 dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
-dirs2775 = "/home ${prefix}/src ${localstatedir}/local"
+dirs2775 = ""
 dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
            ${sysconfdir}/skel /lib /mnt /proc ${ROOT_HOME} /run /sbin \
            ${prefix} ${bindir} ${docdir} /usr/games ${includedir} \
@@ -43,6 +43,7 @@ dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
            /sys ${localstatedir}/lib/misc ${localstatedir}/spool \
            ${localstatedir}/volatile \
            ${localstatedir}/volatile/log \
+           /home ${prefix}/src ${localstatedir}/local \
            /media"
 dirs3755 = "/srv  \
             ${prefix}/local ${prefix}/local/bin ${prefix}/local/games \
-- 
2.0.1


