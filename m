Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736FAC43602
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:19 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140044.1783291396792962155
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oDJed6vC;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so981213f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291395; x=1783896195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6j+/GloXsE40TU4m40xM800zK/s+nWy6UHwsAQ0DGo=;
        b=oDJed6vCMWX4ShsXljjrZI1wgOwBzF7osCgdvWSlDKjL80pW4t/vHXLNnPjHCzZHQU
         0VqZImZWHGShyivoZvo8mT+dMCuGrkOe5J0R1aCNSmLi0BzAEU3XpCnfx+7Zt4Bj4k8x
         xlPG7d9CD0PS7eB3CxmrLBr8wr/tpkLO8fBKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291395; x=1783896195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n6j+/GloXsE40TU4m40xM800zK/s+nWy6UHwsAQ0DGo=;
        b=pbAA+W4Oq6rDSMrpJzv9yWzQUzbGfbSeJWVvTQ2Ath8AO5lrTl8wTXpSgl3svqwn3b
         tA1gE4DTKsg9Ez/z0mxKLFIe5/BBbaDrKGlOhLG5GUoWSai4AhOTZgvldrsYheI9iQO8
         s4dYrlbvP/NhDeOq3b3zkcUBsKEr16Dna38lzHhRfTBYckpw3bKzZ1Vd7aW+68YamQl6
         EZ2bQ/T8KnEQ8TN1uAJAy1Vic3/HAj3hHQ/xBIrtBm6Wox6VqZNlwS7yWnwFMuABf/dK
         iI1LxOVntPlrqbpVoR6oZgDHZXAgd0QN/5cdI0MG4Ma8x1dEJu3mxdEJ7wB9kQryfEe3
         AU6g==
X-Gm-Message-State: AOJu0YzyUSRatMv1HUK81SoJu+5sDy2hggd8IRqkcCoFEAUWkLLGyHYX
	GgqFpKhJAnEwU+8UGWKbh6kmUXAUmjaJtpUm+AzvRjG/etHBZJfjBu3buLgo9EgeYpQsu63oC66
	whZ1PHME=
X-Gm-Gg: AfdE7cl2YOzdXerbYa0rM9sENzg6jBYAV3rGd5hDkxhyh1Gs5UGuNXmknAZR5+qvVkr
	YcAFZHqN6QS7coBHyrCMiYwMV/9TGylnoZHCiRMR0MU2p5BdJS1BqwrRFFJwNmT4CdD0RH6RhaB
	ULFIR6DZ+s+nz/HnSE8lmsnCc8YItK69f2dmSbLdgrw9vf1KI7ds7W+xSlN2Z/YaSu2cPsF8aki
	tNBywtj8OXgQ8fc5aQl0udb2aFaYZw0P6ZLTF0XmMo+Di3hgxiVlyx4GiJ0KeXJ5OjvL4eZd92a
	ChUHRkUjR2IJ2bQcReUmt6jOVtn2hR1DOG9Tol5eW5LMvQfY+ghACDPNdS2gClD9aYvZCj9gVsV
	h95/xKtn0Jq0rOhJAQI1j2JBOPVS5e078MxY7EBmUaOIdF1JHvr+REMR4EuPaBLbFbKEBkM+ZfY
	VY0UvdJNTuzcBWw8kZhMQ1dBSV1A==
X-Received: by 2002:a05:6000:24c9:b0:475:f0c2:75a9 with SMTP id ffacd0b85a97d-47aad07bbfdmr9757584f8f.58.1783291394955;
        Sun, 05 Jul 2026 15:43:14 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 53/55] libxml2: patch CVE-2026-11979
Date: Mon,  6 Jul 2026 00:41:43 +0200
Message-ID: <728062c048eb709398808885b802bfc527162417.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240207

From: Anton Skorup <anton@skorup.se>

Pick patch from [1] linked from [2].

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/c2e233fc1b341685fc99621b2768b503f777a72e
[2] https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1124

Signed-off-by: Anton Skorup <anton.skorup@axis.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3dd117b14be1b7c257df15c383ea33be481511ec)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libxml/libxml2/CVE-2026-11979.patch       | 81 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.15.2.bb    |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
new file mode 100644
index 00000000000..a14e566681e
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
@@ -0,0 +1,81 @@
+From dfad0660f7dab3b5f8317b703b16ad0b0d12697d Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Fri, 22 May 2026 12:21:20 +0200
+Subject: [PATCH] xmlcatalog: overflow check for large --shell commands
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1124
+
+CVE: CVE-2026-11979
+Signed-off-by: Anton Skorup <anton.skorup@axis.com>
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/c2e233fc1b341685fc99621b2768b503f777a72e]
+---
+ test/catalogs/test.sh | 11 +++++++++++
+ xmlcatalog.c          | 16 ++++++++++++++++
+ 2 files changed, 27 insertions(+)
+
+diff --git a/test/catalogs/test.sh b/test/catalogs/test.sh
+index 7e5eaa76..84e8b90a 100755
+--- a/test/catalogs/test.sh
++++ b/test/catalogs/test.sh
+@@ -10,6 +10,17 @@ fi
+ 
+ exitcode=0
+ 
++# Test xmlcatalog --shell command line
++# Case 1: Really long argument (470 chars)
++input=""; for i in {1..470}; do input="${input}A"; done
++echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
++# Case 2: public + long argument
++input="public "; for i in {1..470}; do input="${input}A"; done
++echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
++# Case 3: public + lots of args
++input="public "; for i in {1..80}; do input="${input} x"; done
++echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
++
+ for i in test/catalogs/*.script ; do
+     name=$(basename $i .script)
+     xml="./test/catalogs/$name.xml"
+diff --git a/xmlcatalog.c b/xmlcatalog.c
+index b400c7cb..5113e930 100644
+--- a/xmlcatalog.c
++++ b/xmlcatalog.c
+@@ -135,6 +135,12 @@ static void usershell(void) {
+ 	       (*cur != '\n') && (*cur != '\r')) {
+ 	    if (*cur == 0)
+ 		break;
++            /* Do not read beyond the command array capacity */
++            if (i >= (int)sizeof(command) - 2) {
++                printf("Invalid command %s\n", cur);
++                i = 0;
++                break;
++            }
+ 	    command[i++] = *cur++;
+ 	}
+ 	command[i] = 0;
+@@ -152,6 +158,11 @@ static void usershell(void) {
+ 	while ((*cur != '\n') && (*cur != '\r') && (*cur != 0)) {
+ 	    if (*cur == 0)
+ 		break;
++            if (i >= (int)sizeof(arg) - 2) {
++                printf("Invalid arg %s\n", arg);
++                i = 0;
++                break;
++            }
+ 	    arg[i++] = *cur++;
+ 	}
+ 	arg[i] = 0;
+@@ -164,6 +175,11 @@ static void usershell(void) {
+ 	cur = arg;
+ 	memset(argv, 0, sizeof(argv));
+ 	while (*cur != 0) {
++            if (i >= (int)sizeof(argv) / (int)sizeof(char*)) {
++                printf("Too much arguments\n");
++                break;
++            }
++
+ 	    while ((*cur == ' ') || (*cur == '\t')) cur++;
+ 	    if (*cur == '\'') {
+ 		cur++;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.15.2.bb b/meta/recipes-core/libxml/libxml2_2.15.2.bb
index 99560f4b243..9181949ea54 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.2.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.2.bb
@@ -18,6 +18,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://run-ptest \
            file://install-tests.patch \
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
+           file://CVE-2026-11979.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c8b9bc81f8b590c33af8cc6c336dbff2f53409973588a351c95f1c621b13d09d"

