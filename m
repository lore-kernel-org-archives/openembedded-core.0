Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f169.google.com (unknown [209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id A7F7B65FCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 11:34:40 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id s7so7511337lbd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 04:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=TgtZcIQmpp61zmo3XdnyGzbyUF8IzkY9yD7WlBgJrws=;
	b=Cr1SkZE0xk/yBwbKhMCKyLp/4gQ49vJWdXfSkONvlfnBaGBOsXvR/0McMNe3SzoiZ+
	3FPhhaYhFAvnEiRxRDk+2m751BpOCGAUjTuA5swzbZ1RK9EAP9SPMpUTYEL1VNGkNw5H
	JHx6YQuRA7SsPxgHBBI6GPDL/CubJxggM8/AvmL7ltWDRIrHTv2E1VtUBBMB2Pbor9ev
	bu2nGuQMBvX3pYli8xCklqoakcZA9fK09HOI5OxswllHX8n7tGWjteKWd5jfo+JhXbUb
	P3+NWJleL8RY6P6V/B1RDtL6IRXP36JN/LfqcDGgllMd5kAA9GFvs22EGnaULNrBTc5z
	Pd1Q==
X-Received: by 10.112.4.106 with SMTP id j10mr24058320lbj.7.1399894480691;
	Mon, 12 May 2014 04:34:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bg4sm2231169lbb.6.2014.05.12.04.34.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 04:34:39 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 13:34:50 +0200
Message-Id: <a789ea4bfaf42ad32e15519424ec8e99ffebc782.1399894447.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
Subject: [daisy][PATCH 01/10] libnotify: add dbus-glib dependency
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
X-List-Received-Date: Mon, 12 May 2014 11:34:41 -0000

From: Martin Jansa <martin.jansa@gmail.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
1.9.2


