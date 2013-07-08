Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E89D06B118
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 04:11:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r684BnAF028238
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Jul 2013 21:11:49 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 7 Jul 2013 21:11:49 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Jul 2013 12:11:46 +0800
Message-ID: <45395363a744785f10811752669eac4a7c43f52a.1373254421.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1373254421.git.jackie.huang@windriver.com>
References: <cover.1373254421.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] nativesdk-glib-2.0: cannot build on hosts without libffi.so.5
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
X-List-Received-Date: Mon, 08 Jul 2013 04:11:49 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The compile phase of nativesdk-glib-2.0 tries to run some binaries built
and since the -Wl,rpath doesn't specify the sysroot libraries with libffi.so.5,
attempts to run the binrary on hosts without libffi.so.5 results in an error
message complaining that it cannot find libffi.so.5, to fix this, specify
-Wl,rpath == -Wl,rpath-link

Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
index ffe34ac..bd4f526 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
@@ -46,6 +46,13 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "\
             eglibc-localedata-translit-cjk-variants \
            "
 
+BUILDSDK_LDFLAGS = "-L${STAGING_LIBDIR} \
+                    -Wl,-rpath-link,${STAGING_LIBDIR} \
+                    -Wl,-rpath,${STAGING_LIBDIR} -Wl,-O1 \
+                    -L${STAGING_DIR_HOST}${base_libdir} \
+                    -Wl,-rpath-link,${STAGING_DIR_HOST}${base_libdir} \
+                    -Wl,-rpath,${STAGING_DIR_HOST}${base_libdir} -Wl,-O1"
+
 do_configure_prepend() {
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
 }
-- 
1.7.4.1


