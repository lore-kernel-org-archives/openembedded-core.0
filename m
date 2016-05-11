Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id EE9216FF9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 16:25:35 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r12so10505826wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 09:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=46ONi/TbhtQkM1fsl6gTMOlSP1jEgok2o46hv7sXT7E=;
	b=YCJ7KIca/s9zjP9x/mcYr7rXe/hd5FuhAfWOsJE5LpHqzD7S9vkLYw/GY+DM02Nz5C
	kae9R6QfAPdvrqUSuwB+NfYZ/zBaZm+p9w6aOJN2v6Qolke94w0IUDzoBU7MgeS7yPWf
	HVR5FnRhsgcHUH5sf10JDK8zQnWTiNrTTpHyAsH8Bck/nCGjIYMIhCU+E6QAodhBEKA3
	6UrZaX5qmeF9gWWihg8WCJZgrK7gdAu5oKksYCQsOCaZsnSUIWu35UwsFQwv8pz0WbTX
	DeYN2m8JaSgAfw61pBQ40pGLtxt65aG0AHxlfpKUgFZCNIMSwUuB3ERq0uWxTPdPeE+x
	APzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=46ONi/TbhtQkM1fsl6gTMOlSP1jEgok2o46hv7sXT7E=;
	b=lVfZrwBJ5ROs/1TecFvqA1yAPxoWtJBPP8ooPytoxKqBIVBbT8hyBN9tz9rfYwMpBq
	na08VPVIU4eX4/WV3sLSpq4QPe0p3TPe6rB5i61iK2rISAuNCZMOG6WnZ1GWeWFqzYYP
	ek7OHMGqEBUkKcUcqX5zFXsq6/rRlUivN7P9Uwulhyp8/g/ZcnBlBkNxBa/tlhbk3Ent
	18HvtH8FMuz23ZigVmU69PtXAhbmufMFYvilI1hCzd4/3I1XNEeTk+q9azphltJx2+Gk
	h9RWb01X6SyBeCx48tfgtmc6AYn20Dii9S/GXWZHT3h69ZryjulakaA2Ldtorjwmpt9H
	aPsg==
X-Gm-Message-State: AOPr4FWCJo9Jm/I4j87DmzfCod/p7BgC5IHL7An5xM2eHNoyl3tcYRNk2NaYk6HYc0fTZw==
X-Received: by 10.195.11.34 with SMTP id ef2mr4698743wjd.101.1462983935610;
	Wed, 11 May 2016 09:25:35 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	o73sm36852345wme.16.2016.05.11.09.25.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 09:25:33 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 09:25:27 -0700
Message-Id: <1462983927-19691-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] pseudo: obey our LDFLAGS
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
X-List-Received-Date: Wed, 11 May 2016 16:25:36 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../pseudo/pseudo/obey-ldflags.patch               | 48 ++++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.7.5.bb       | 16 ++++----
 2 files changed, 56 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch

diff --git a/meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch b/meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch
new file mode 100644
index 0000000..7e4c629
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch
@@ -0,0 +1,48 @@
+From 0ace81a687355a3c55caa161b51972a82f5c413f Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Mon, 9 May 2016 17:00:57 -0700
+Subject: [PATCH] Obey external LDFLAGS the way we obey CFLAGS
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+---
+ Makefile.in | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 6511814..22ef625 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -109,26 +109,26 @@ pseudo: $(PSEUDO)
+ $(PSEUDO): $(BIN) pseudo.o $(SHOBJS) $(DBOBJS) pseudo_client.o pseudo_server.o pseudo_ipc.o
+ 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o $(PSEUDO) \
+ 		pseudo.o pseudo_server.o pseudo_client.o pseudo_ipc.o \
+-		$(DBOBJS) $(SHOBJS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
++		$(DBOBJS) $(SHOBJS) $(LDFLAGS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
+ 
+ pseudolog: $(PSEUDOLOG)
+ 
+ $(PSEUDOLOG): $(BIN) pseudolog.o $(SHOBJS) $(DBOBJS) pseudo_client.o pseudo_ipc.o
+ 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o $(PSEUDOLOG) pseudolog.o pseudo_client.o pseudo_ipc.o \
+-		$(DBOBJS) $(SHOBJS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
++		$(DBOBJS) $(SHOBJS) $(LDFLAGS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
+ 
+ pseudodb: $(PSEUDODB)
+ 
+ $(PSEUDODB): $(BIN) pseudodb.o $(SHOBJS) $(DBOBJS) pseudo_ipc.o
+ 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o $(PSEUDODB) pseudodb.o \
+-		$(DBOBJS) $(SHOBJS) pseudo_ipc.o $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
++		$(DBOBJS) $(SHOBJS) pseudo_ipc.o $(LDFLAGS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
+ 
+ libpseudo: $(LIBPSEUDO)
+ 
+ $(LIBPSEUDO): $(LIB) $(WRAPOBJS) pseudo_client.o pseudo_ipc.o $(SHOBJS)
+ 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
+ 		pseudo_client.o pseudo_ipc.o \
+-		$(WRAPOBJS) $(SHOBJS) $(CLIENT_LDFLAGS)
++		$(WRAPOBJS) $(SHOBJS) $(LDFLAGS) $(CLIENT_LDFLAGS)
+ 
+ # *everything* now relies on stuff that's generated in the
+ # wrapper process.
+-- 
+2.8.0
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb b/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
index d90e644..dfb9b39 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
@@ -1,13 +1,13 @@
 require pseudo.inc
 
-SRC_URI = " \
-    http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz2 \
-    file://0001-configure-Prune-PIE-flags.patch \
-    file://fallback-passwd \
-    file://fallback-group \
-    file://moreretries.patch \
-    file://handle-remove-xattr.patch \
-"
+SRC_URI = "http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz2 \
+           file://0001-configure-Prune-PIE-flags.patch \
+           file://fallback-passwd \
+           file://fallback-group \
+           file://moreretries.patch \
+           file://handle-remove-xattr.patch \
+           file://obey-ldflags.patch \
+           "
 
 SRC_URI[md5sum] = "c10209938f03128d0c193f041ff3596d"
 SRC_URI[sha256sum] = "fd89cadec984d3b8202aca465898b1bb4350e0d63ba9aa9ac899f6f50270e688"
-- 
2.8.0


