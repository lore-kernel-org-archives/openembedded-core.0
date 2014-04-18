Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id B298565DAE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 20:01:19 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so1874760eek.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 13:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rY9b3BwV0RKo1AD/pkqD3R7hiPT5FPqQVEVK6oNAkEM=;
	b=nYHJ7FtvZ94SpidWZurNiuAyBZ/9xsCRSaY025ImoEn4zLTSrEbbwzEy4PSe88L2d4
	55J1AlDf60DbZVtHDqZaWcXcj/LMJfHByahkQcKiCZQIOvKAP6CTeOccUdUlwlMts6QO
	zHFeVaV/VUFw3zve2ihLsCEQyLTmePSoV0gy5fg92hafvvOto+Iwj7uxou20Ziidm1Km
	GfvcIPmg8GIkjqueoFcfFoNBLkCO4lFxUjyt+ihmwrJF8iqBlxr+ybF8GIcuqL4rSHRl
	twBsVZm7pOqpbGpOH1vWnfYTNTGO+1ITa2rGDIPf8O9RcyBnU6luJdwM4kath59gs9xb
	XG0A==
X-Received: by 10.14.5.135 with SMTP id 7mr4953251eel.86.1397851279784;
	Fri, 18 Apr 2014 13:01:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x46sm78787697een.17.2014.04.18.13.01.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Apr 2014 13:01:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Apr 2014 22:01:18 +0200
Message-Id: <1397851278-31919-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] libnotify: add dbus-glib dependency
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
X-List-Received-Date: Fri, 18 Apr 2014 20:01:21 -0000

* | No package 'dbus-glib-1' found
  | configure:11865: error: Package requirements (gtk+-2.0 >= 2.18, glib-2.0 >= 2.6,
    dbus-1 >= 0.76, dbus-glib-1 >= 0.76 gmodule-2.0) were not met:

* introduced in:
  commit 5c1eeb5d16566521e45947b07fdcd9f552fec45b
  Author: Alexandru Palalau <alexandrux.palalau@intel.com>
  Date:   Thu Feb 27 12:05:41 2014 +0200

      libnotify: don't use gnome.bbclass

  because gnome.bbclass was adding gconf->dbus-glib dependency

* it was also causing other recipes to fail when they were depending
  on libnotify which has dbus-glib in pkg-config and dbus-glib was
  missing, e.g. firefox:
  | checking for libnotify >= 0.4... Package dbus-glib-1 was not found
  in the pkg-config search path. Perhaps you should add the directory
  containing `dbus-glib-1.pc' to the PKG_CONFIG_PATH environment
  variable Package 'dbus-glib-1', required by 'libnotify', not found
  | configure: error: Library requirements (libnotify >= 0.4) not met;
  consider adjusting the PKG_CONFIG_PATH environment variable if your
  libraries are in a nonstandard prefix so pkg-config can find them.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/libnotify/libnotify_0.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb b/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
index a1f2fbc..1d92b64 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 PR = "r1"
 
-DEPENDS = "dbus gtk+"
+DEPENDS = "dbus gtk+ dbus-glib"
 
 inherit gnomebase
 SRC_URI[archive.md5sum] = "732c9d2cd5eb6a9069264a319d330516"
-- 
1.9.1


