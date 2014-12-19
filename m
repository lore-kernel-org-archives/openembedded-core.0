Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D4A0F728C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 06:21:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBJ6LgYs014900
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 22:21:42 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Dec 2014 22:21:42 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Dec 2014 14:21:41 +0800
Message-ID: <23581b93683dbcc64e7998bde2d92d27843f7147.1418969925.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418969925.git.Qi.Chen@windriver.com>
References: <cover.1418969925.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] useradd.bbclass: avoid do_rootfs error for debian package backend
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
X-List-Received-Date: Fri, 19 Dec 2014 06:21:43 -0000
Content-Type: text/plain

If /etc/login.defs is treated as a configuration file, then we would meet
errors at do_rootfs time telling us that useradd/groupadd cannot execute
correctly.

This is because the dpkg handles config file specially, the login.defs
is temporarily renamed as login.defs.dpkg-new.

How ubuntu deals the user adding problem? The do it at postinst of the
package. And, in postinsts the packages would possibly do chown of its
file or directories.

The above strategy is not suitable for OE. Because we do chown in do_install
and add user/group in preinst scripts of the packages.

That's why we need this patch so that do_rootfs don't fail.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/useradd.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 0b9a843..e443f84 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -24,6 +24,16 @@ if test "x$D" != "x"; then
 	# Installing into a sysroot
 	SYSROOT="$D"
 	OPT="--root $D"
+
+	# Make sure login.defs is there, this is to make debian package backend work
+	# correctly while doing rootfs.
+	# The problem here is that if /etc/login.defs is treated as a config file for
+	# shadow package, then while performing preinsts for packages that depend on
+	# shadow, there might only be /etc/login.def.dpkg-new there in root filesystem.
+	if [ ! -e $D${sysconfdir}/login.defs -a -e $D${sysconfdir}/login.defs.dpkg-new ]; then
+	    cp $D${sysconfdir}/login.defs.dpkg-new $D${sysconfdir}/login.defs
+	fi
+
 	# user/group lookups should match useradd/groupadd --root
 	export PSEUDO_PASSWD="$SYSROOT:${STAGING_DIR_NATIVE}"
 fi
-- 
1.9.1


