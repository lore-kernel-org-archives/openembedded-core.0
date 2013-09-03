Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 906E96BC26
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 07:57:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r837vmTB016867
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2013 00:57:49 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 3 Sep 2013 00:57:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Sep 2013 15:52:51 +0800
Message-ID: <f6faba2e39ab7055392521e8324ca08f2afa4c03.1378194734.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1378194734.git.liezhi.yang@windriver.com>
References: <cover.1378194734.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] glib-2.0: fix a host contamination issue
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
X-List-Received-Date: Tue, 03 Sep 2013 07:57:48 -0000
Content-Type: text/plain

We will see the following warning by accident:

$ bitbake nativesdk-glib-2.0

WARNING: QA Issue: nativesdk-glib-2.0-dbg: found library in wrong location:
/opt/poky/0.5.5/sysroots/x86_64-pokysdk-linux/usr/share/gdb/auto-load/opt/
poky/0.5.5/sysroots/x86_64-pokysdk-linux/usr/lib/libglib-2.0.so.0.3600.4-gdb.py

There are two '/opt/poky/0.5.5/sysroots' in the path when the warning
comes, this is what we need since glib-2.0 has done this intentionally
in its configure and Makefile.

This is because the configure script uses the:
ABS_GLIB_RUNTIME_LIBDIR = "readlink -f $libdir/$with_runtime_libdir`"
to figure out the abs dir, so if
/opt/poky/0.5.5/sysroots/x86_64-pokysdk-linux/usr/lib/ exists , there
would be warning, otherwise no warning.

We can change the "readlink -f" to "readlink -m" to fix the host
contamination issue.

Another fix could be:
ABS_GLIB_RUNTIME_LIBDIR =""

But this is much more like a workaround.

BTW, fix the previous sed command's indent.

[YOCTO #5099]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb
index 0918bf5..cc104cc 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb
@@ -47,7 +47,12 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "\
 EXTRA_OECONF_append_class-target_libc-uclibc = " --with-libiconv=gnu"
 
 do_configure_prepend() {
-	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
+    # Change the "readlink -f" to "readlink -m" to fix a host
+    # contamination issue, the later one doesn't require the
+    # components existence.
+    sed -i -e 's/^\(ABS_GLIB_RUNTIME_LIBDIR=.*readlink\) -f/\1 -m/' ${S}/configure.ac
+
+    sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
 }
 
 do_install_append() {
-- 
1.8.1.2


