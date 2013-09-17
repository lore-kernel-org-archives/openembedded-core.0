Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2CC2960F86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 09:22:24 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id m15so4923877wgh.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 02:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=P2FZ4ABzMIvBbEsiblRDZgD3Rum8w19RJ838yyHxlGw=;
	b=P1JdYtn3mJLyCvdcIGNLCzZXPgWNRgOL1a/+gIXorUVOS8PBHG7wWuZWHHt0+TFPVM
	krv4rO1fk1yyxJM9Kf3U0NgqiUzTnnk5RwIHXQqArIbZGPHRXfRby6RZ03mNKYkiGErx
	iMOH+V0YZ6BHsrmRPO4jHEQL3ZUirkZoghl4SJH3LykjeiAOAl7NSisZ0DiwYVtLcnE0
	fJke8yuPVLfXJP/RowXSEpnwinwidWzXxxcPDt3vdDOXE9lsCKnJK7xV9szmpmGJ0gdH
	2h5ilkFCGRyisfrd5k5+MHKOsVg1C8ktaB/oWArGU9YpU1cQtpr7ZwJTJNTx/pFvsg+J
	SAEw==
X-Gm-Message-State: ALoCoQlEMYq8hQlhpuOFSB80dfzB7SqfBg0oOzJifCrUc/9uanxF6p7HktSJfr3EV866nVRnL6YG
X-Received: by 10.194.10.193 with SMTP id k1mr553675wjb.50.1379409745025;
	Tue, 17 Sep 2013 02:22:25 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id b13sm2969996wic.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Sep 2013 02:22:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2013 10:22:17 +0100
Message-Id: <1379409738-18923-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libxml2: remove patch for CVE-2012-2871
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
X-List-Received-Date: Tue, 17 Sep 2013 09:22:25 -0000

This CVE patch is actually against Chromium as they ship an internal fork of
libxml2 and breaks ABI.  The real issue has been resolved in libxslt 1.1.27, and
we're shipping 1.1.28.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libxml/libxml2/libxml2-CVE-2012-2871.patch     |   34 --------------------
 meta/recipes-core/libxml/libxml2_2.9.1.bb          |    4 +--
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch

diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch
deleted file mode 100644
index 3c66a9c..0000000
--- a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-libxml2 CVE-2012-2871
-
-the patch come from:
-http://src.chromium.org/viewvc/chrome/trunk/src/third_party/libxml/src \
-/include/libxml/tree.h?r1=56276&r2=149930
-
-libxml2 2.9.0-rc1 and earlier, as used in Google Chrome before 21.0.1180.89,
-does not properly support a cast of an unspecified variable during handling
-of XSL transforms, which allows remote attackers to cause a denial of service
-or possibly have unknown other impact via a crafted document, related to the
-_xmlNs data structure in include/libxml/tree.h.
-
-http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2871
-
-Signed-off-by: Li Wang <li.wang@windriver.com>
----
- include/libxml/tree.h |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/include/libxml/tree.h b/include/libxml/tree.h
-index b733589..5422dda 100644
---- a/include/libxml/tree.h
-+++ b/include/libxml/tree.h
-@@ -351,6 +351,7 @@ struct _xmlNs {
-     struct _xmlNs  *next;	/* next Ns link for this node  */
-     xmlNsType      type;	/* global or local */
-     const xmlChar *href;	/* URL for the namespace */
-+    const char *dummy_children;	/* lines up with node->children */
-     const xmlChar *prefix;	/* prefix for the namespace */
-     void           *_private;   /* application data */
-     struct _xmlDoc *context;		/* normally an xmlDoc */
--- 
-1.7.0.5
-
diff --git a/meta/recipes-core/libxml/libxml2_2.9.1.bb b/meta/recipes-core/libxml/libxml2_2.9.1.bb
index fa9c657..0b6ac5d 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.1.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.1.bb
@@ -1,8 +1,6 @@
 require libxml2.inc
 
-SRC_URI += "file://libxml2-CVE-2012-2871.patch \
-            http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar \
-	   "
+SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar"
 
 SRC_URI[libtar.md5sum] = "9c0cfef285d5c4a5c80d00904ddab380"
 SRC_URI[libtar.sha256sum] = "fd3c64cb66f2c4ea27e934d275904d92cec494a8e8405613780cbc8a71680fdb"
-- 
1.7.10.4


