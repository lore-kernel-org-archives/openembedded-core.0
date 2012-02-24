Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0ykE-0006TD-Tn
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 18:15:46 +0100
Received: by eaal10 with SMTP id l10so1227143eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 09:07:24 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.45.72 as permitted sender) client-ip=10.14.45.72; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.45.72 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.45.72])
	by 10.14.45.72 with SMTP id o48mr1969780eeb.110.1330103244448 (num_hops
	= 1); Fri, 24 Feb 2012 09:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+MDkd1N/yOwFLGxZ9gt6nqlhhbPafzHM/K8vtWHkAh0=;
	b=GpQUmlMcHqUKJB+92feUVZbVWhKecu0Jf3JtFvsFaNbTdfMBwwoUI6scJtU+uzhVPZ
	OyTt5HYuuYzgKZ5os97Dp0MmWTOgTICkhQY5RHWIiaxPi6L6RaNhae33aFgsdpBS+L1R
	26Pl/sw4gdKD4FD8O4Evqynj6YMb5RypI6iKs=
Received: by 10.14.45.72 with SMTP id o48mr1490085eeb.110.1330103244373;
	Fri, 24 Feb 2012 09:07:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u11sm12820457eeb.1.2012.02.24.09.07.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 09:07:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2012 18:06:51 +0100
Message-Id: <9c6fcbdc178694ab672bbbf0cab5c7fd77c80b65.1330102968.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <141f227e9201766a9657a41a92a5d5485adcd513.1330102968.git.Martin.Jansa@gmail.com>
References: <141f227e9201766a9657a41a92a5d5485adcd513.1330102968.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330102968.git.Martin.Jansa@gmail.com>
References: <cover.1330102968.git.Martin.Jansa@gmail.com>
Subject: [PATCH 6/7] shadow-sysroot: disable package creation
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
X-List-Received-Date: Fri, 24 Feb 2012 17:15:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../shadow/shadow-sysroot_4.1.4.3.bb               |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb
index fbffb84..1fb6c56 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://login.defs_shadow-sysroot;md5=25e2f2de4dfc8f966ac5cdf
 
 DEPENDS = "base-passwd"
 
-PR = "r1"
+PR = "r2"
 
 # The sole purpose of this recipe is to provide the /etc/login.defs
 # file for the target sysroot - needed so the shadow-native utilities
@@ -28,3 +28,8 @@ do_install() {
 sysroot_stage_all() {
 	sysroot_stage_dir ${D} ${SYSROOT_DESTDIR}
 }
+
+# don't create any packages
+# otherwise: dbus-dev depends on shadow-sysroot-dev which depends on shadow-sysroot 
+# and this has another copy of /etc/login.defs already provided by shadow
+PACKAGES = ""
-- 
1.7.8.4



