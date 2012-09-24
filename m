Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1TGIh6-0004bV-P5
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 02:08:09 +0200
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 1E7EF2088A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 19:55:22 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute1.internal (MEProxy); Mon, 24 Sep 2012 19:55:22 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:date
	:content-type:mime-version; s=smtpout; bh=ie6RFbhdQQfBZtM/bXRz9w
	4AbTE=; b=hmImW2a8phU5ol9M99ny2omGZE1aUyTZ1iJWcOw3iKvf8zBoT5Aam9
	HpO3fSQpQIk/BwHmleJSE2+YTwXyNvGt+05TfTeG3+3dOv47NjfTriAw8q45d+BU
	CEIpJ9MzF4iwvG7V15a+2CoSe3BBG/XMpj9Qs4dhgNF7OFMxoXJoE=
X-Sasl-enc: rBXqO2RDNV65jAX19WmnZO/q1PDUSjNpNFPVETUBIdyz 1348530921
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id CC16B4827B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 19:55:21 -0400 (EDT)
Message-ID: <1348530882.25427.1.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2012 19:54:42 -0400
X-Mailer: Evolution 3.4.4 (3.4.4-1.fc17) 
Mime-Version: 1.0
Subject: [PATCH] Add packagegroup-core-buildessential
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Sep 2012 00:08:09 -0000
X-Groupsio-MsgNum: 29829
Content-Type: multipart/mixed; boundary="=-oH2AuTy1fRx74fnsmYOk"

--=-oH2AuTy1fRx74fnsmYOk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

[Not heavily tested, but sent for discussion]

task-core-sdk is too big - for example, I simply don't want to ship tcl, ever =)
Historically distcc caused a large dependency graph explosion because it has
a utility which uses gtk+, although that was fixed.

packagegroup-core-sdk also includes coreutils, which is a bit
confusing; conceptually things dependent on coreutils should pull it
in explicitly, or possibly we just declare coreutils to be in the
minimal build set.

So packagegroup-core-buildessential is intended to be similar to
Debian's "build-essential" package.  It's the stuff needed by say 80+%
of components, not worth repeating over and over.

Signed-off-by: Colin Walters <walters@verbum.org>
---
 .../packagegroup-core-buildessential.bb            | 30 ++++++++++++++++++++++
 .../packagegroups/packagegroup-core-sdk.bb         | 17 +-----------
 2 files changed, 31 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb



--=-oH2AuTy1fRx74fnsmYOk
Content-Disposition: attachment; filename="0001-Add-packagegroup-core-buildessential.patch"
Content-Type: text/x-patch; name="0001-Add-packagegroup-core-buildessential.patch";
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 80a199a2fd34cca08324f228fc1272086a476e61 Mon Sep 17 00:00:00 2001
From: Colin Walters <walters@verbum.org>
Date: Mon, 24 Sep 2012 19:46:01 -0400
Subject: [PATCH] Add packagegroup-core-buildessential

task-core-sdk is too big - for example, I simply don't want to ship tcl, ever =)
Historically distcc caused a large dependency graph explosion because it has
a utility which uses gtk+, although that was fixed.

packagegroup-core-sdk also includes coreutils, which is a bit
confusing; conceptually things dependent on coreutils should pull it
in explicitly, or possibly we just declare coreutils to be in the
minimal build set.

So packagegroup-core-buildessential is intended to be similar to
Debian's "build-essential" package.  It's the stuff needed by say 80+%
of components, not worth repeating over and over.

Signed-off-by: Colin Walters <walters@verbum.org>
---
 .../packagegroup-core-buildessential.bb            | 30 ++++++++++++++++++++++
 .../packagegroups/packagegroup-core-sdk.bb         | 17 +-----------
 2 files changed, 31 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
new file mode 100644
index 0000000..164da36
--- /dev/null
+++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
@@ -0,0 +1,30 @@
+#
+# Copyright (C) 2007 OpenedHand Ltd.
+# Copyright (C) 2012 Red Hat, Inc.
+#
+
+SUMMARY = "Essential build dependencies"
+LICENSE = "MIT"
+PR = "r0"
+
+inherit packagegroup
+
+RDEPENDS_packagegroup-core-buildessential = "\
+    autoconf \
+    automake \
+    binutils \
+    binutils-symlinks \
+    cpp \
+    cpp-symlinks \
+    gcc \
+    gcc-symlinks \
+    g++ \
+    g++-symlinks \
+    gettext \
+    make \
+    libstdc++ \
+    libstdc++-dev \
+    libtool \
+    pkgconfig \
+    "
+
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index b00bf07..985bebd 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -16,28 +16,13 @@ RREPLACES_packagegroup-core-sdk = "task-core-sdk"
 RCONFLICTS_packagegroup-core-sdk = "task-core-sdk"
 
 RDEPENDS_packagegroup-core-sdk = "\
-    autoconf \
-    automake \
-    binutils \
-    binutils-symlinks \
+    packagegroup-core-buildessential \
     coreutils \
-    cpp \
-    cpp-symlinks \
     ccache \
     diffutils \
-    gcc \
-    gcc-symlinks \
-    g++ \
-    g++-symlinks \
-    gettext \
-    make \
     intltool \
-    libstdc++ \
-    libstdc++-dev \
-    libtool \
     perl-module-re \
     perl-module-text-wrap \
-    pkgconfig \
     findutils \
     quilt \
     less \
-- 
1.7.11.4


--=-oH2AuTy1fRx74fnsmYOk--
