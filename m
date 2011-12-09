Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RZ6kH-00007q-IY
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 21:08:38 +0100
Received: by ghrr13 with SMTP id r13so2703190ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 12:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=LB4+OCP4aIY7oqzo8aA1rkWWI6s1RuzAaCJEtLUINZc=;
	b=V5S6Hh0e+bIP5php1fmxsKw6FbW9KRbqJz059aVg5RO1YnipmCN4+pZswz5gewAHof
	PNZcJnY/uqmLvcUKX4ttv6AycmM1RNdYtGLI8B31SrOTUTecKD4YznRMIAPL9nuENyBS
	wb1nQydtnDv3gD7Vg9NDZ3RRpnlR0X3Ncs2JY=
Received: by 10.236.200.164 with SMTP id z24mr13801437yhn.127.1323460905984;
	Fri, 09 Dec 2011 12:01:45 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o7sm16668828yhl.15.2011.12.09.12.01.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 12:01:44 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2011 20:01:33 +0000
Message-Id: <1323460893-30873-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] connman: avoid checking for linux/if_alg.h header
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
X-List-Received-Date: Fri, 09 Dec 2011 20:08:38 -0000

Disable building of 'alg-test' and checking for if_alg.h header.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-connectivity/connman/connman.inc     |    8 ++++++++
 meta/recipes-connectivity/connman/connman_0.78.bb |    2 +-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index d695fee..503bf1c 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -49,6 +49,14 @@ USERADD_PARAM_${PN} = "--system --no-create-home \
 
 inherit autotools pkgconfig update-rc.d useradd
 
+# alg-test doesn't build, so disable that and test
+# for if_alg.h as this header is only in 2.6.39
+do_configure_prepend() {
+	sed -i 's:tools/alg-test ::g' Makefile.am
+	sed -i 's:AC_CHECK_HEADERS(linux/if_alg.h, dummy=yes,::g;
+	        s:AC_MSG_ERROR(User-space algorithm header files are required))::g' configure.ac
+}
+
 do_compile_append() {
 	sed -i -e s:deny:allow:g src/connman-dbus.conf
 }
diff --git a/meta/recipes-connectivity/connman/connman_0.78.bb b/meta/recipes-connectivity/connman/connman_0.78.bb
index 5ea2bb7..378bd9d 100644
--- a/meta/recipes-connectivity/connman/connman_0.78.bb
+++ b/meta/recipes-connectivity/connman/connman_0.78.bb
@@ -1,6 +1,6 @@
 require connman.inc
 
-PR = "r2"
+PR = "r3"
 
 # 0.78 tag
 SRCREV = "02f5d5fe2d7c71514a6387ba2b772b42d8e8d297"
-- 
1.7.2.5



