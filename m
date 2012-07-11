Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1Sorrq-00010a-M1
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 10:01:50 +0200
Received: by weyr6 with SMTP id r6so546886wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 00:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/vt/KyZCLcfZx9sdhRY/VWoOkyU9ECV3xpSUb1f3xFc=;
	b=k9+K5z8aOe48kfGnt70D7MPtUkmEYCmYBPp7/TbkYacX1S/DF0l7oJevJxZ0FawDbD
	zgOASKm0xjwBqmTkdGgdLGkd846g/WxWrNKboaB3V05ZOPfHAh0W7Sgs2IzDP2gvDXVV
	cIeX22/FXQBtnGhmW/ntMhbWqxEuuU+Zvad9YfkBIPEzKRhjVolKrOpgQxpMnVPqF84e
	6SMSN5ejBxn1Fs7vY4eIa5BkzoJdyOid7c6juDWtybf29ce+eC6OKHkYZTSrDmikBrhF
	tE+0BEsMXG4oiqqtf/I/xXQ1E9s5E0hjpDHbpITZF+3gNlIcRy/xLzFQ0M8KZMQti39Q
	K8pw==
Received: by 10.180.94.234 with SMTP id df10mr1678141wib.16.1341993039292;
	Wed, 11 Jul 2012 00:50:39 -0700 (PDT)
Received: from localhost.localdomain ([64.191.99.80])
	by mx.google.com with ESMTPS id w7sm26644416wiz.0.2012.07.11.00.50.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Jul 2012 00:50:38 -0700 (PDT)
From: Dennis Lan <dennis.yxun@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2012 07:49:54 +0000
Message-Id: <1341992994-7193-1-git-send-email-dennis.yxun@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH] directfb: disable imlib2 explicitly
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
X-List-Received-Date: Wed, 11 Jul 2012 08:01:50 -0000

When HOST machine installed imlib2, compiling directfb in OE will
direct this library, and try to use it. This is wrong, since there is
no imlib in OE, so we should disable it explicitly here.

Error as following:
| idirectfbimageprovider_imlib2.c:64:20: fatal error: Imlib2.h: No such
file or directory

Config.log as following (which is wrong):
configure:19602: checking for imlib2-config
configure:19620: found /usr/bin/imlib2-config
configure:19633: result: /usr/bin/imlib2-config

Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
---
 meta/recipes-graphics/directfb/directfb_1.6.1.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/directfb/directfb_1.6.1.bb b/meta/recipes-graphics/directfb/directfb_1.6.1.bb
index cafc21f..a6012ca 100644
--- a/meta/recipes-graphics/directfb/directfb_1.6.1.bb
+++ b/meta/recipes-graphics/directfb/directfb_1.6.1.bb
@@ -1,7 +1,7 @@
 require directfb.inc
 
 RV = "1.6-0"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEPENDS += "sysfsutils"
 
@@ -14,6 +14,7 @@ EXTRA_OECONF = "\
   --disable-sdl \
   --disable-vnc \
   --disable-x11 \
+  --disable-imlib2 \
 "
 
 LEAD_SONAME = "libdirectfb-1.6.so.0"
-- 
1.7.9.rc2



