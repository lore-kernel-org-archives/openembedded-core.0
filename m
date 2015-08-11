Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DDBC27692B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 01:38:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7B1cAv5023925
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 18:38:10 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Mon, 10 Aug 2015 18:38:09 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Aug 2015 09:34:53 +0800
Message-ID: <1439256893-11196-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] attr: narrow fix_symlink to populate_sysroot
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
X-List-Received-Date: Tue, 11 Aug 2015 01:38:13 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

fix_symlink will be called many times, like populate_sysroot and populate_lic;
which maybe lead to rpm-native building failure, due to the below error:
	".../usr/lib/libacl.so: No such file or directory"
since after acl/attr finished populate_sysroot task, rpm start to be compiled
but acl/attr populate_lic, which run fix_symlink, maybe remove the
.../usr/lib/libacl.so

In fact, fix_symlink only needs to be called after populate_sysroot

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-support/attr/ea-acl.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index 474291a..370e16f 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -27,6 +27,11 @@ LDFLAGS_append_libc-uclibc_class-target = "${@['', ' -lintl '][(d.getVar('USE_NL
 EXTRA_OECONF_append_libc-uclibc_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS', True) == 'no')]}"
 
 fix_symlink () {
+	if [ "${BB_CURRENTTASK}" != "populate_sysroot" -a "${BB_CURRENTTASK}" != "populate_sysroot_setscene" ]
+	then
+		return
+	fi
+
 	if test "${libdir}" = "${base_libdir}" ; then
 		return
 	fi
-- 
1.9.1


