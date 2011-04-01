Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W1a-0005B8-0D
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:31:54 +0200
Received: by pxi1 with SMTP id 1so849885pxi.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=0zdebwyUwJBYbUfjiWJ46887hy+/yuXhyA60QkomFbA=;
	b=oo6ixLrL4oUc/98YhWzMQTTGOoEbtCgyArTjaL+ElsKxCqQqq/SLL2RuSqBP4VWXgU
	/qeSldmkbIu6TzXupVLAzqUPskgUZrCm1VpeBR9sLsFERyYuK2hQNVj4sQp1eb2OC/zs
	pIkdcQnmUwm+aICQuu0z8EKyNGRidHDFhca00=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=S5eHH0FhRlQnzwdLXZQeECpZ6rML9bM3bgK4Uf1len45q8URFMEVyk/gbxfAbSrRE2
	/akgk4LqXoP21h5kWxE7ccjUYSLM4VvlpZ1xrcZV8loULs2ClS58BkeGF6Ngj0JyNW9T
	4DvfSuvFNI24dtZRrmyqBTx7h0WgOvTmQ9IWM=
Received: by 10.142.118.23 with SMTP id q23mr2861345wfc.7.1301632192515;
	Thu, 31 Mar 2011 21:29:52 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p40sm2391057wfc.5.2011.03.31.21.29.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:29:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:29:44 -0700
Message-Id: <1c63eb92fdf8892406a03e88705e8f08b24b40a7.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 29/46] attr: Fix compilation on uclibc
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
X-List-Received-Date: Fri, 01 Apr 2011 04:31:54 -0000

It needs -lintl added to LDFLAGS for uclibc

inherit gettext class instead of adding gettext to DEPENDS directly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/attr/attr.inc   |    8 ++++++++
 meta/recipes-support/attr/ea-acl.inc |    4 +---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index c110340..3f64ade 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -20,3 +20,11 @@ do_install_append() {
 	sed -i ${D}${libdir}/libattr.la -e \
 	    s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
 }
+do_configure_append() {
+        # gettext hack
+        echo "#define _(str) str" >> ${S}/include/config.h
+}
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



