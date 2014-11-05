Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E896965CED
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 04:42:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA54gFSt019380
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Nov 2014 20:42:16 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 4 Nov 2014 20:42:15 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Nov 2014 12:44:00 +0800
Message-ID: <c4cb8b8f9e378ec7bf9211d487307b433e601667.1415162598.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415162598.git.Qi.Chen@windriver.com>
References: <cover.1415162598.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: avoid using system-auth
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
X-List-Received-Date: Wed, 05 Nov 2014 04:42:16 -0000
Content-Type: text/plain

Patch systemd-user pam configuartion file to avoid using system-auth
file. Instead, we use common-* files.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...0001-systemd-user-avoid-using-system-auth.patch | 27 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_216.bb           |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-systemd-user-avoid-using-system-auth.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-systemd-user-avoid-using-system-auth.patch b/meta/recipes-core/systemd/systemd/0001-systemd-user-avoid-using-system-auth.patch
new file mode 100644
index 0000000..97701f7
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-systemd-user-avoid-using-system-auth.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Inappropriate [oe specific]
+
+Subject: systemd-user: avoid using system-auth
+
+In OE, we don't provide system-auth, instead, we use common-* files.
+So modify systemd-user file to use common-* files.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/login/systemd-user | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/login/systemd-user b/src/login/systemd-user
+index 8112d74..99635af 100644
+--- a/src/login/systemd-user
++++ b/src/login/systemd-user
+@@ -2,5 +2,5 @@
+ #
+ # Used by systemd --user instances.
+ 
+-account  include system-auth
+-session  include system-auth
++account  include common-account
++session  include common-session
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index 27a5d92..ac35ba6 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -33,6 +33,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://0001-add-support-for-executing-scripts-under-etc-rcS.d.patch \
            file://0001-missing.h-add-fake-__NR_memfd_create-for-MIPS.patch \
            file://0001-Make-root-s-home-directory-configurable.patch \
+           file://0001-systemd-user-avoid-using-system-auth.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
-- 
1.9.1


