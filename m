Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Srvwb-0005qR-OS
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 20:59:25 +0200
Received: from mail-wg0-f42.google.com ([74.125.82.42])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 11:48:01 -0700
Received: by wgbfm10 with SMTP id fm10so5369354wgb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 11:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=g6ZWooDiv+pHeTLEqYA2jZRsfgnWHf/A0Dddkt5axYs=;
	b=nfGjb87bk6wNC0uPEPkc2cu7t6f6dGI1JeVtaEkhCLvdTned6gh0mvycvIg1GqJUJO
	QJiqLCjypKn+eIvqYkT+7YAJw7Tdj0b8cyJZyuH7vqmJFM891wOy+ah8Eo4pojFvUjaI
	43TTOELwmvktYrPJhrKVgyAjGSDGE8CfyKyyB8WRNYLPRO6T0y/AxrcqUwKWB15CwEGe
	BALQRd9tSMquhEbFkDhklwb1pmLp6t+Vgsh1GP2Ik9l1+nMs1tVharqg3fJ5U1axuljV
	aLRm1+V2oRUinJGXo1t3xvhaAXrZjHFs4Vbw1lR+AAOg8D97C828rHjC54gXc6fSfDrS
	PZ+A==
Received: by 10.217.4.197 with SMTP id u47mr1720085wes.172.1342723680028;
	Thu, 19 Jul 2012 11:48:00 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fu8sm39860875wib.5.2012.07.19.11.47.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 11:47:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 19:47:34 +0100
Message-Id: <1342723654-9443-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342723654-9443-1-git-send-email-ross.burton@intel.com>
References: <1342716212.21788.3.camel@ted>
	<1342723654-9443-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQleifOJgOQHlzYVsCnHRypr7QpkKeYQn+kYY3R//Th+mTZPsLaRaRG1jdQVyXN30NTsBSEi
Subject: [PATCH] change gtk-doc.bbclass to pull in depends and oeconf
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
X-List-Received-Date: Thu, 19 Jul 2012 18:59:26 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gtk-doc.bbclass |   20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index 58daaf3..603b191 100644
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
+DEPENDS_append = " gtk-doc-stub-native"
+DEPENDS_virtclass-native_append = " gtk-doc-stub-native"
+
+EXTRA_OECONF_append = "\
+  --disable-gtk-doc \
+  --disable-gtk-doc-html \
+  --disable-gtk-doc-pdf \
+"
-- 
1.7.10



