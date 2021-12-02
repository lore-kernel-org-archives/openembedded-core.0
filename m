Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0934C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 17:17:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.11433.1638465428715963056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 09:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F668142F
	for <openembedded-core@lists.openembedded.org>;
 Thu,  2 Dec 2021 09:17:08 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 095C63F73B
	for <openembedded-core@lists.openembedded.org>;
 Thu,  2 Dec 2021 09:17:07 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] distutils3: fix bindir mangling to stop breaking symlinks
Date: Thu,  2 Dec 2021 17:17:06 +0000
Message-Id: <20211202171706.2259724-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 17:17:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159096

distutils3_do_install wants to sed out build directory references from
all binaries in ${bindir} and ${sbindir}. It tries to avoid touching
symlinks by doing 'test -f' on the files as it iterates, but test always
dereferences symlinks so this will touch both real files and symlinks to
real files.

The end result of this is that recipes which ship a script /usr/bin/foo
and a symlink /usr/bin/bar -> foo, bar will be replaced with a real file
which is a duplicate of foo, wasting disk space.

Replace the loop with a find loop which can look at the real file type,
not the target type.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/distutils3.bbclass | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bb=
class
index be645d37bd..0973d304f4 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -43,11 +43,9 @@ distutils3_do_install() {
         find ${D} -name "*.py" -exec grep -q ${D} {} \; \
                                -exec sed -i -e s:${D}::g {} \;
=20
-        for i in ${D}${bindir}/* ${D}${sbindir}/*; do
-            if [ -f "$i" ]; then
-                sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${DISTUTILS_PYT=
HON}:g $i
-                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
-            fi
+        for bin in $(find ${D}${bindir} ${D}${sbindir} -type f -maxdepth=
 1); do
+            sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}=
:g $bin
+            sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $bin
         done
=20
         rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
--=20
2.25.1


