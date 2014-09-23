Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E099E6B8F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 14:20:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8NEKBTc019903
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 07:20:11 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 23 Sep 2014 07:20:10 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Sep 2014 22:19:59 +0800
Message-ID: <e33476eb2f61c8a8be679e15114ef90321239dde.1411473883.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1411473883.git.hongxu.jia@windriver.com>
References: <cover.1411473883.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] texinfo: fix info not work
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
X-List-Received-Date: Tue, 23 Sep 2014 14:20:10 -0000
Content-Type: text/plain

In texinfo, we didn't have info/dir entries, which caused
info not work.
...
root@qemux86:~# info info
info: dir: No such file or directory
...
Invoke install-info to create info/dir entries in pkg_postinst_info.

Also fix a QA Issue
...
ERROR: QA Issue: texinfo: Files/directories were installed but not shipped
  /usr/share/info/info.info.bz2
  /usr/share/info/info-stnd.info.bz2 [installed-vs-shipped]
...

[YOCTO #6751]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/texinfo/texinfo_5.2.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/texinfo/texinfo_5.2.bb b/meta/recipes-extended/texinfo/texinfo_5.2.bb
index be90aba..91552a9 100644
--- a/meta/recipes-extended/texinfo/texinfo_5.2.bb
+++ b/meta/recipes-extended/texinfo/texinfo_5.2.bb
@@ -51,7 +51,7 @@ do_install_append_class-native() {
 PACKAGES += "info info-doc"
 
 FILES_info = "${bindir}/info ${bindir}/infokey ${bindir}/install-info"
-FILES_info-doc = "${infodir}/info.info ${infodir}/dir ${infodir}/info-*.info \
+FILES_info-doc = "${infodir}/info.info* ${infodir}/dir ${infodir}/info-*.info* \
                   ${mandir}/man1/info.1* ${mandir}/man5/info.5* \
                   ${mandir}/man1/infokey.1* ${mandir}/man1/install-info.1*"
 
@@ -61,4 +61,10 @@ FILES_${PN}-doc = "${infodir}/texinfo* \
                    ${datadir}/${tex_texinfo} \
                    ${mandir}/man1 ${mandir}/man5"
 
+pkg_postinst_info () {
+    for f in `find $D/${infodir} -name "*.info*"`; do
+        install-info $f $D/${infodir}/dir
+    done
+}
+
 BBCLASSEXTEND = "native"
-- 
1.9.1


