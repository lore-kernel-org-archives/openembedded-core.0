Return-Path: <Yue.Tao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 59CEE6C741
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 07:54:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAR7sjCL007046
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 23:54:45 -0800 (PST)
Received: from localhost.localdomain (128.224.162.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 26 Nov 2013 23:54:44 -0800
From: Yue Tao <Yue.Tao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Nov 2013 15:55:40 +0800
Message-ID: <1385538944-8585-1-git-send-email-Yue.Tao@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Subject: [PATCH 1/5] file: avoid to handle special character
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
X-List-Received-Date: Wed, 27 Nov 2013 07:54:46 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

avoid to handle special character '@' in filename and directory.

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 .../file/file/avoid_handle_special_character.patch |   36 ++++++++++++++++++++
 meta/recipes-devtools/file/file_5.15.bb            |    1 +
 2 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/file/file/avoid_handle_special_character.patch

diff --git a/meta/recipes-devtools/file/file/avoid_handle_special_character.patch b/meta/recipes-devtools/file/file/avoid_handle_special_character.patch
new file mode 100644
index 0000000..4be4ad0
--- /dev/null
+++ b/meta/recipes-devtools/file/file/avoid_handle_special_character.patch
@@ -0,0 +1,36 @@
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -12,21 +12,21 @@
+ 
+ file.1:	Makefile file.man
+ 	@rm -f $@
+-	sed -e s@__CSECTION__@1@g \
+-	    -e s@__FSECTION__@${fsect}@g \
+-	    -e s@__VERSION__@${VERSION}@g \
+-	    -e s@__MAGIC__@${MAGIC}@g $(srcdir)/file.man > $@
++	sed -e s#__CSECTION__#1#g \
++	    -e s#__FSECTION__#${fsect}#g \
++	    -e s#__VERSION__#${VERSION}#g \
++	    -e s#__MAGIC__#${MAGIC}#g $(srcdir)/file.man > $@
+ 
+ magic.${fsect}: Makefile magic.man
+ 	@rm -f $@
+-	sed -e s@__CSECTION__@1@g \
+-	    -e s@__FSECTION__@${fsect}@g \
+-	    -e s@__VERSION__@${VERSION}@g \
+-	    -e s@__MAGIC__@${MAGIC}@g $(srcdir)/magic.man > $@
++	sed -e s#__CSECTION__#1#g \
++	    -e s#__FSECTION__#${fsect}#g \
++	    -e s#__VERSION__#${VERSION}#g \
++	    -e s#__MAGIC__#${MAGIC}#g $(srcdir)/magic.man > $@
+ 
+ libmagic.3: Makefile libmagic.man
+ 	@rm -f $@
+-	sed -e s@__CSECTION__@1@g \
+-	    -e s@__FSECTION__@${fsect}@g \
+-	    -e s@__VERSION__@${VERSION}@g \
+-	    -e s@__MAGIC__@${MAGIC}@g $(srcdir)/libmagic.man > $@
++	sed -e s#__CSECTION__#1#g \
++	    -e s#__FSECTION__#${fsect}#g \
++	    -e s#__VERSION__#${VERSION}#g \
++	    -e s#__MAGIC__#${MAGIC}#g $(srcdir)/libmagic.man > $@
diff --git a/meta/recipes-devtools/file/file_5.15.bb b/meta/recipes-devtools/file/file_5.15.bb
index aecbbe5..0697838 100644
--- a/meta/recipes-devtools/file/file_5.15.bb
+++ b/meta/recipes-devtools/file/file_5.15.bb
@@ -12,6 +12,7 @@ DEPENDS = "zlib file-native"
 DEPENDS_class-native = "zlib-native"
 
 SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
+           file://avoid_handle_special_character.patch \
            file://dump \
            file://filesystems"
 
-- 
1.7.5.4


