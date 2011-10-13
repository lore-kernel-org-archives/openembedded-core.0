Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1REHJf-0006wC-0u
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 11:11:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9D95IR9004384
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 02:05:18 -0700 (PDT)
Received: from localhost (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 13 Oct 2011 02:05:18 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Oct 2011 17:05:34 +0800
Message-ID: <c5043e9c181631b290bf33c770940594efdc9647.1318496401.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.1.300.gc565c
In-Reply-To: <cover.1318496401.git.kai.kang@windriver.com>
References: <cover.1318496401.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.225]
Subject: [PATCH 2/4] gdk-pixbuf: pick up ${NM} to fix libtool naming issue
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
X-List-Received-Date: Thu, 13 Oct 2011 09:11:03 -0000
Content-Type: text/plain

When gdk-pixbuf configures, it should pick up ${NM} from the
environment if it is defined, instead of just looking
for "nm".

The patch is from WindRiver Linux.
CQID:  WIND00260200

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../gdk-pixbuf-2.24.0/configure-nm.patch           |   32 ++++++++++++++++++++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb |    3 ++
 2 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure-nm.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure-nm.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure-nm.patch
new file mode 100644
index 0000000..71defd0
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure-nm.patch
@@ -0,0 +1,32 @@
+This patch is from WindRiver Linux, to fix libtool naming issue.
+The original commit info is:
+
+commit 684b9d2daab517856222cc078ac51c72ce3ca3a9
+Author: David Borman <david.borman@windriver.com>
+Date:   Thu Mar 10 07:51:11 2011 -0600
+
+    Have gdk-pixbuf pick up ${NM}, fix libtool naming issue
+    
+    CQID: WIND00260200
+    
+    The configuration for gdk-pixbuf needs to pick up $NM
+    from the environment, this is the same patch that was
+    applied to gdk+.
+    
+    Signed-off-by: David Borman <david.borman@windriver.com>
+
+Upstream-Status: Pending
+
+Signed-off-by: Kang Kai <kai.kang@windriver.com>
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -149,7 +149,7 @@
+ AC_SYS_LARGEFILE
+ 
+ AM_PROG_AS
+-AC_PATH_PROG(NM, nm, nm)
++AC_PATH_PROG(NM, [$NM nm], nm)
+ 
+ AC_MSG_CHECKING([for some Win32 platform])
+ AS_CASE(["$host"],
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
index 9fabbe2..2099b98 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
@@ -10,9 +10,12 @@ SECTION = "libs"
 
 DEPENDS = "libpng glib-2.0 jpeg"
 
+PR = "r1"
+
 SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${PV}.tar.bz2 \
            file://hardcoded_libtool.patch \
            file://configure_fix.patch \
+           file://configure-nm.patch;patch=1 \
            "
 
 SRC_URI[md5sum] = "d8ece3a4ade4a91c768328620e473ab8"
-- 
1.7.5.1.300.gc565c



