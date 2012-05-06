Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SQw2q-0006AJ-Ju
	for openembedded-core@lists.openembedded.org;
	Sun, 06 May 2012 09:38:16 +0200
Received: by wera1 with SMTP id a1so3008195wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 May 2012 00:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=z/EYlpWq4ivfLYaQGL0J7CfKDWjtAf+qhQE0kvToLPI=;
	b=Ej2LRVTivAq9ccJt5H09FtqUx1MJ4YRdkr06rYD+akVpX6ttMp9aQMsuwEhivTUH1u
	RFv1FA/1ro77QsUtb4wnahzCmu+iwrOLPG8MkJTDvDxAwk5ahqNlHo6EvktPStpEXIBH
	BR669F7qKvz/saBcZgOCmQQDSl6Irt+J/uvak4CgYiBX4iX7hz7/L1y7CQyFDhZdZQbW
	eEZm7cPgrG+LfVOU61Tmr3+osPfgjt9N7O55C8Oi4o5zcWcvF478iM7wUMWDUFPFQRYo
	iszuJoCaKTp9fIL3nOHh8cmy+BuONIYQ9WvDws/qrxgOizTZpYQaXjXx7scBiDJnwD2s
	8s1w==
Received: by 10.180.98.8 with SMTP id ee8mr25925537wib.14.1336289307582;
	Sun, 06 May 2012 00:28:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id du4sm18502159wib.10.2012.05.06.00.28.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 May 2012 00:28:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 May 2012 09:28:23 +0200
Message-Id: <1336289303-8255-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <4F9F24DF.1090803@linux.intel.co>
References: <4F9F24DF.1090803@linux.intel.co>
Subject: [PATCH] evolution-data-server: enable deprecated glib API
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
X-List-Received-Date: Sun, 06 May 2012 07:38:16 -0000

* we have very old version and deprecated g_atexit is used even in current master
  http://git.gnome.org/browse/evolution-data-server/log/libedataserver/e-categories.c

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-sato/eds/evolution-data-server_git.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/eds/evolution-data-server_git.bb b/meta/recipes-sato/eds/evolution-data-server_git.bb
index b2aa08c..1d675dc 100644
--- a/meta/recipes-sato/eds/evolution-data-server_git.bb
+++ b/meta/recipes-sato/eds/evolution-data-server_git.bb
@@ -12,7 +12,7 @@ DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libi
 
 SRCREV = "7337d11aed576e7caaa12b4e881ad8d33668799f"
 PV = "2.30+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
            file://oh-contact.patch;striplevel=0 \
@@ -41,6 +41,7 @@ do_configure_prepend () {
 
 do_configure_append () {
         cp ${WORKDIR}/iconv-detect.h ${S}
+        sed -i 's/-DG_DISABLE_DEPRECATED//g' ${S}/libedataserver/Makefile
 }
 
 EXTRA_OECONF = "--without-openldap --with-dbus --without-bug-buddy \
-- 
1.7.8.6



