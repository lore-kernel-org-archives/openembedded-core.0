Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4B4C06CD66
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2013 23:29:56 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id z5so1393300lbh.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2013 16:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bao6LFKNEwRqJ0pMGw4zFOUv8NA6Xo2Xe52go6K9ZJY=;
	b=UKDMLwAGF9xtyyqabZgcMmPClRt+Cnpg8i8wGzcGOk5JLK7WVzrvmhD/7ivGWYFsMl
	vWdzLd85Ik0SRIUfnfFCbiIecvbtvvTCMdhrVe3r3gbDu4qpSN6XCb1X9846Vm0FPZez
	udlmdz6b0hi1yQ5U2aeGN+zbJbidNOqww3xV6pkT0IQp5hj/+moVNWwRtfqVhGDe2qKn
	UTUnQDKvnn3ucnomwYL1bftf3m6MNeG76+8rdrysH/ZSY22ffFxD3GmUYGo8JNH+VKK9
	MVyiTvbSWLAeRGtknrTVSZcAroXzcoj6xiARD9sFGo2i5E+d8I03OXNHH1CjqmIqIZ76
	5eyQ==
X-Received: by 10.152.87.143 with SMTP id ay15mr8595779lab.2.1381361397475;
	Wed, 09 Oct 2013 16:29:57 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id pw4sm27715672lbb.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 09 Oct 2013 16:29:56 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VU3CV-0006ty-9m; Thu, 10 Oct 2013 02:29:55 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2013 02:29:52 +0300
Message-Id: <a66e4d4b217db0a5f8f94afeb624c4e576cd3b6f.1381360919.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <cover.1381360919.git.cazfi74@gmail.com>
References: <cover.1381360919.git.cazfi74@gmail.com>
Subject: [PATCH 1/2] automake: unhardcode version number
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
X-List-Received-Date: Wed, 09 Oct 2013 23:29:56 -0000

Use trim_version to get version part of the executable name.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-devtools/automake/automake_1.12.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/automake/automake_1.12.6.bb b/meta/recipes-devtools/automake/automake_1.12.6.bb
index 549051b..b65e5ae 100644
--- a/meta/recipes-devtools/automake/automake_1.12.6.bb
+++ b/meta/recipes-devtools/automake/automake_1.12.6.bb
@@ -3,6 +3,8 @@ LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe" 
 DEPENDS_class-native = "autoconf-native"
 
+NAMEVER = "${@oe.utils.trim_version("${PV}", 2)}"
+
 RDEPENDS_${PN} += "\
     autoconf \
     perl \
@@ -29,14 +31,12 @@ SRC_URI += "${PATHFIXPATCH} \
 SRC_URI[md5sum] = "199d39ece2e6070d64ac20d45ac86026"
 SRC_URI[sha256sum] = "0cbe570db487908e70af7119da85ba04f7e28656b26f717df0265ae08defd9ef"
 
-PR = "r0"
-
 do_install_append () {
     install -d ${D}${datadir}
 
     # Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
     # for target as /usr/bin/perl, so fix it to /usr/bin/perl.
-    for i in aclocal aclocal-1.12 automake automake-1.12; do
+    for i in aclocal aclocal-${NAMEVER} automake automake-${NAMEVER}; do
         if [ -f ${D}${bindir}/$i ]; then
             sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/perl,' \
             -e 's,exec .*/bin/perl \(.*\) exec .*/bin/perl \(.*\),exec ${USRBINPATH}/perl \1 exec ${USRBINPATH}/perl \2,' \
-- 
1.8.4.rc3


