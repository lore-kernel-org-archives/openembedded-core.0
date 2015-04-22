Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id A0E3473D89
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 07:50:08 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so107048332igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 00:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=fgR9AXP+UbTJHAGE3VwkBUskobeIdKFqGtF7g+TQ4sw=;
	b=lZCIgwylCkGbH9T66YsC4LGl/qC9Y4lNmula94pDpwktEq/kX4x7mAE9Femr4Fs6Lo
	nxDolIc9Z4NqTatDrRN0nIA51paVETA0MA7T9LMKFyGiwyOvrY2FNFvQsAYUsTES49gv
	DWR6Ap1LGpg4l0kwykZnUtDGXQlT2sF7Bux5UeowYa9dgf6KzsLbvLCf0E2ALrcgFAEF
	W0FRtRYci1U1zwrBWFkiRXLlOhDSHapzlaebJT6Xx9vSoP1Sdlkv6HkmLZCx9poRHnVJ
	Prf/hr2AK90+vW4C/HNxRN++yg4hq7XHdET7FnmrdUrawMIQwDDUC8jKezvpiamhADgB
	dkmg==
X-Received: by 10.107.10.79 with SMTP id u76mr34058751ioi.79.1429689009991;
	Wed, 22 Apr 2015 00:50:09 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id l1sm2686434ioe.32.2015.04.22.00.50.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Apr 2015 00:50:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Apr 2015 07:49:59 +0000
Message-Id: <a19ff5adc2e1944a722b8dea05b6299622d742d4.1429688786.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <42999018b09a752082a381b1c595f0bd7411e305.1429688786.git.raj.khem@gmail.com>
References: <42999018b09a752082a381b1c595f0bd7411e305.1429688786.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429688786.git.raj.khem@gmail.com>
References: <cover.1429688786.git.raj.khem@gmail.com>
Subject: [PATCH 10/10] gtk+: Correct function prototype
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
X-List-Received-Date: Wed, 22 Apr 2015 07:50:09 -0000

This is turned on by default in gcc-5 so far
we have been getting by this issue but time to fix it
has now come

Change-Id: I012248731de0be7a9b7e232073746360fe6c83dd
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gtk+/gtk+/strict-prototypes.patch              | 24 ++++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+_2.24.27.bb            |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+/strict-prototypes.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+/strict-prototypes.patch b/meta/recipes-gnome/gtk+/gtk+/strict-prototypes.patch
new file mode 100644
index 0000000..96e1f5f
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+/strict-prototypes.patch
@@ -0,0 +1,24 @@
+Fixes
+
+include/gtk-2.0/gtk/gtkitemfactory.h:47:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
+ typedef void (*GtkItemFactoryCallback)  ();
+
+gcc5 has -Wstrict-prototypes on by default for -Werror so this becomes a build failure for consumers
+of this header e.g. matchbox-panel-2
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: gtk+-2.24.27/gtk/gtkitemfactory.h
+===================================================================
+--- gtk+-2.24.27.orig/gtk/gtkitemfactory.h
++++ gtk+-2.24.27/gtk/gtkitemfactory.h
+@@ -44,7 +44,7 @@ typedef void	(*GtkPrintFunc)		   (gpoint
+  * (Note that if we are included from a C++ program () will mean
+  * (void) so an explicit cast will be needed.)
+  */
+-typedef	void	(*GtkItemFactoryCallback)  ();
++typedef	void	(*GtkItemFactoryCallback)  (void);
+ typedef	void	(*GtkItemFactoryCallback1) (gpointer		 callback_data,
+ 					    guint		 callback_action,
+ 					    GtkWidget		*widget);
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.27.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.27.bb
index b2693d5..4f664e4 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.27.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.27.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
            file://hardcoded_libtool.patch \
            file://toggle-font.diff;striplevel=0 \
            file://doc-fixes.patch \
+           file://strict-prototypes.patch \
 	  "
 
 SRC_URI[md5sum] = "b1e890e15602c5bcb40d85b13fe046fd"
-- 
2.1.4


