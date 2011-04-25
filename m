Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEQz1-0003op-Oa
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 20:58:07 +0200
Received: by mail-pw0-f47.google.com with SMTP id 9so1388561pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=BQuPT4ugf5lcEo036mtIVkHL1T8CX4J5eVIsiUPtPu8=;
	b=aw1h5wkOC09odT0vUO+XWPwWLyKmq/MxMS2if80e7AWmgmw3Xm5DCp7LG9rqyHNGTR
	acoAnYhAWYs4DuFrfArhFr8CiDEMWqyFbpvrBTnIdIkD6NCk4DSrq3Yky8NCNnZeOnTz
	mEj0OVsNUCzusamDFEctN2gGzxm1qRJ3VrY0g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=thjbyAb6txtQBgi+AhQJEdwj62rX3t1xVf9ag0m8Rm93/wQCrsh/J+NgRwRKAWhDKb
	aCdaXkqWXyNOtSbHEElR+P/VcI3s6dzUpMWh9f4UAD0dNYjw3djADdzZae2XN4n7oPId
	GHPVLAfyVjjq84DN2WN3GF7NjwprscGQDyVfw=
Received: by 10.68.40.9 with SMTP id t9mr7007838pbk.495.1303757740322;
	Mon, 25 Apr 2011 11:55:40 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k1sm408758pbd.94.2011.04.25.11.55.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:55:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2011 11:55:35 -0700
Message-Id: <0064cec8338efcf4cc7c80e52a8a2c91ce2a6504.1303757256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1303757256.git.raj.khem@gmail.com>
References: <cover.1303757256.git.raj.khem@gmail.com>
Subject: [PATCH 15/17] attr: Fix compilation on uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Apr 2011 18:58:08 -0000

It needs -lintl added to LDFLAGS for uclibc

inherit gettext class instead of adding gettext to DEPENDS directly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/attr/attr.inc   |    4 ++++
 meta/recipes-support/attr/ea-acl.inc |    4 +---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index c110340..b2ed9a1 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -20,3 +20,7 @@ do_install_append() {
 	sed -i ${D}${libdir}/libattr.la -e \
 	    s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
 }
+
+# Only append ldflags for target recipe
+LDFLAGS_libc-uclibc += "${@['', '-lintl']['${PN}' == '${BPN}']}"
+
diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index bc93107..a09c31c 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -1,11 +1,9 @@
 # this build system is mostly shared by attr and acl
 
-DEPENDS =+ "gettext"
-
 SRC_URI += "file://relative-libdir.patch;striplevel=0 \
             file://no-fixed-prog-path.patch"
 
-inherit autotools
+inherit autotools gettext
 
 # the package comes with a custom config.h.in, it cannot be
 # overwritten by autoheader
-- 
1.7.4.1



