Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy71a-0005UF-Oz
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:02:06 +0200
Received: by wibhm2 with SMTP id hm2so905630wib.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=TilHMNGec0u/7XgnAKK12Njew2ekbMmE2Ufe99FckJ8=;
	b=k31qnQ1zRGE0PG3XDL/cYpw8t8s8+ZdP+8sCnS6KtJJZg++cviaKpcmeIbLa3aLjmc
	+N0n1R8TFltPQLcnGbSA/LzrsKymPahFHn1E9tDPnVhSF1DgoiN7aPDoVzp31G+uU6sw
	JNkr+ih50aoVuExBmdsuQ7SflkQKeUTGgxqxXImkShRJvJcfJeEMmQc8NU+pnUNWmNsq
	zryzJ1k9F1ES3PZV3REmS3NJ57uZ6J5O+kk6UAxXcfMADNc3sc8Vk4813wT4Sq5GhWuO
	IwJ1BKjBlPtbKpPQOBcm1XQvhYz8rCF/an940XWniJPMWhegQS791nNGTUTZj3TpZOiF
	TfYA==
Received: by 10.216.132.76 with SMTP id n54mr4208649wei.135.1344196222980;
	Sun, 05 Aug 2012 12:50:22 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.50.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:50:21 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:49 +0200
Message-Id: <1344196136-7643-22-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQnW9a6WvOAxtnn7a/wmYp3aZTX6THDqIoqwtQiZ9Yuljg//0abiBN1LQPcInNancs3qSP8l
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 21/28] builder: use ${sysconfdir} instead of /etc for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 20:02:06 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-graphics/builder/builder_0.1.bb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index cb5f440..5c12c14 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "New user to do specific job"
 DESCRIPTION = "This recipe create a new user named ${PN}, who is used for specific jobs like building. The task can be auto started via mini X"
 SECTION = "x11"
-PR = "r3"
+PR = "r4"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://builder_hob_start.sh;endline=5;md5=84796c3c41785d86100fdabcbdade00e"
 
@@ -21,10 +21,10 @@ USERADD_PARAM_${PN} = "--system --create-home \
                        --user-group ${PN}"
 
 do_install () {
-	install -d -m 755 ${D}/etc/mini_x/session.d
-	install -p -m 755 builder_hob_start.sh ${D}/etc/mini_x/session.d/
+	install -d -m 755 ${D}${sysconfdir}/mini_x/session.d
+	install -p -m 755 builder_hob_start.sh ${D}${sysconfdir}/mini_x/session.d/
 
-	chown  ${PN}.${PN} ${D}/etc/mini_x/session.d/builder_hob_start.sh
-        install -p -m 755 please_wait_dialog.py ${D}/etc/mini_x
+	chown  ${PN}.${PN} ${D}${sysconfdir}/mini_x/session.d/builder_hob_start.sh
+        install -p -m 755 please_wait_dialog.py ${D}${sysconfdir}/mini_x
 }
 
-- 
1.7.7.6



