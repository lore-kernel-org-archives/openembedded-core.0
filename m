Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RM0dD-0003AC-4A
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 17:59:11 +0100
Received: by mail-ey0-f175.google.com with SMTP id 9so1322856eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 09:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=BW0HhCgW0IW37+OfHwrZkf+Uj1CIlwaHBTbF4wQyryc=;
	b=nHlzCdhlpuik9Urf2OTy8ZU5cJ47tfieY+HjPIw5dzwIymdItVuY1hG/cWXQM5jVTx
	Mh6SGwzyhBuQhYk4SoStyrr6BS1LduGLRdx9zVXeH3rS2h2L4DU69+ic4pTBF4Jc6cmp
	h9cogy4A/W8fYlCwUcT39qqLJLIx8vlc+Dul4=
Received: by 10.14.5.212 with SMTP id 60mr1023092eel.184.1320339182468;
	Thu, 03 Nov 2011 09:53:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 54sm17364798eex.8.2011.11.03.09.53.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 09:53:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2011 17:52:43 +0100
Message-Id: <1320339165-25029-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.2
In-Reply-To: <1320339165-25029-1-git-send-email-Martin.Jansa@gmail.com>
References: <CA+chaQfT08+Vd7JyB4wZO8eF13HbY1Z_TiY8MVBV76vPsxd5fw@mail.gmail.com>
	<1320339165-25029-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/4] libnl-2.0: add patch from meta-openembedded to fix pkg-config file
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
X-List-Received-Date: Thu, 03 Nov 2011 16:59:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libnl/libnl-2.0/fix-pc-file.patch              |   17 +++++++++++++++++
 meta/recipes-support/libnl/libnl_2.0.bb            |    1 +
 2 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/libnl/libnl-2.0/fix-pc-file.patch

diff --git a/meta/recipes-support/libnl/libnl-2.0/fix-pc-file.patch b/meta/recipes-support/libnl/libnl-2.0/fix-pc-file.patch
new file mode 100644
index 0000000..85afe8f
--- /dev/null
+++ b/meta/recipes-support/libnl/libnl-2.0/fix-pc-file.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Pending
+
+Some packages are asking only for libnl-2.0, but expects to get also
+libnl-genl, libnl-nf libnl-route, easiest way to fix them is here.
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Index: libnl-2.0/libnl-2.0.pc.in
+===================================================================
+--- libnl-2.0.orig/libnl-2.0.pc.in
++++ libnl-2.0/libnl-2.0.pc.in
+@@ -6,5 +6,5 @@
+ Name: libnl
+ Description: Convenience library for netlink sockets
+ Version: @PACKAGE_VERSION@
+-Libs: -L${libdir} -lnl
++Libs: -L${libdir} -lnl -lnl-genl -lnl-nf -lnl-route
+ Cflags: -I${includedir}
diff --git a/meta/recipes-support/libnl/libnl_2.0.bb b/meta/recipes-support/libnl/libnl_2.0.bb
index f783867..32705b9 100644
--- a/meta/recipes-support/libnl/libnl_2.0.bb
+++ b/meta/recipes-support/libnl/libnl_2.0.bb
@@ -11,6 +11,7 @@ PR = "r3"
 SRC_URI = "\
   http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
   file://fix-pktloc_syntax_h-race.patch \
+  file://fix-pc-file.patch \
 "
 
 SRC_URI[md5sum] = "6aaf1e9802a17a7d702bb0638044ffa7"
-- 
1.7.7.2



