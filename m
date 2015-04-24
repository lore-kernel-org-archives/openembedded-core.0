Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 51ADE73D87
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 03:35:45 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so36513880pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 20:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=fgR9AXP+UbTJHAGE3VwkBUskobeIdKFqGtF7g+TQ4sw=;
	b=sDlFvEF3jssfu1Pu/J/LaO859nS0TjEsWzBhnjZ4MaIF6LgiYCvtAZATEmYvspLeyS
	3yuxTDnAkj069Ugu7gVDdG/BZuPwPWcF0qevb9PNPvAnMJqbR2O4+Dn5+Iqi8giGcOyp
	rPrvrkTkWmkIkbuY3k1tp9/K2d0D1+vEjMA9vqYzoeOXN+TaBL7FHpfuT0vv/S/vd06D
	Sa0TrthTa597wOsdwK+n0yTwGsWmeo90jZgTCBWhkRBM2RXu3ULbF5quwVECfpmXffaD
	CzArWdmhvEtNp13FBV0jSlZY1Be/bxexf05RKFZJrnQ2r9EuMf0Kf7c/uInt053Nppuf
	wSdA==
X-Received: by 10.68.69.66 with SMTP id c2mr11144965pbu.38.1429846547432;
	Thu, 23 Apr 2015 20:35:47 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id qv9sm9575507pab.27.2015.04.23.20.35.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Apr 2015 20:35:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 20:35:27 -0700
Message-Id: <08f5ae2a863f953ccee254fc9d718c81978d9df6.1429846256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
References: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429846255.git.raj.khem@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
Subject: [PATCH 09/14] gtk+: Correct function prototype
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
X-List-Received-Date: Fri, 24 Apr 2015 03:35:46 -0000

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


