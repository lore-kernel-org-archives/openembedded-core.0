Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVD-0000r8-Cm
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:22:59 +0200
Received: from mail-wi0-f170.google.com ([209.85.212.170])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:11:36 -0700
Received: by wibhq12 with SMTP id hq12so5246627wib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=fOp22Eab5laFdA+vrR6tMWHU9MJFl2sSgBj2/pbjkHY=;
	b=W96bvs2SKsbBMTe/9jvO4ecS/QMuc/Hn3X64RsNhgYBSLUehxwJIkC2zE6OQALyWb3
	B6CqXawtkHcnAaRmMNb+DpweggmVbQo0yrumJ336zprtH6A6GETe7+LKExCKxvT4dYgZ
	3196yo7i02PqTWqRnKM3M1Rj23ME2BU3EMSKd946sky5++m3Uq3u3dqTN+pbv+8kUzcM
	N1cgMwhYso3b0haU1Fl57f6kt+Ycsn/j7QHBtttBHWrrGgZ5wdaiDa7BU+WokMXRjCF4
	mDsJWSuSy0EGaJlqz7owUIZKz8+Zf9Cq7MVPwVAG1HcrJes44skCaZQh69druGxoe9JV
	FL1g==
Received: by 10.216.236.163 with SMTP id w35mr1600855weq.13.1342714294326;
	Thu, 19 Jul 2012 09:11:34 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:33 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:10:49 +0100
Message-Id: <24f8f05067f1d4ac201dbda0247ffc7cc521b7b6.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl9XYCbEykZXujmpFYLiSBwesqkHA03KH96TOtJavIQZUGx+2SDyuavNHkHxm8TjgIdi5V7
Subject: [PATCH 02/26] change gtk-doc.bbclass to pull in depends and oeconf
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
X-List-Received-Date: Thu, 19 Jul 2012 16:22:59 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gtk-doc.bbclass |   20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index 58daaf3..6a3854f 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -1,4 +1,16 @@
-# We don't have gtk-doc so disable it
-do_configure_prepend() {
-	echo "EXTRA_DIST=">> ${S}/gtk-doc.make
-}
+# Helper class to pull in the right gtk-doc dependencies and disable
+# gtk-doc.
+#
+# Long-term it would be great if this class could be toggled between
+# gtk-doc-stub-native and the real gtk-doc-native, which would enable
+# re-generation of documentation.  For now, we'll make do with this which
+# packages up any existing documentation (so from tarball builds).
+
+DEPENDS += "gtk-doc-stub-native"
+DEPENDS_virtclass-native += "gtk-doc-stub-native"
+
+EXTRA_OECONF_append = "\
+  --disable-gtk-doc \
+  --disable-gtk-doc-html \
+  --disable-gtk-doc-pdf \
+"
-- 
1.7.10



