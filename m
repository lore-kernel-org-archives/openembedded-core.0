Return-Path: <maxin.john@intel.com>
X-Greylist: delayed 566 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 22 Aug 2016 11:23:47 UTC
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C3DA0731DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 11:23:47 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 22 Aug 2016 04:14:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,559,1464678000"; d="scan'208";a="159290468"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2016 04:14:24 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 06CE66A408D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 04:14:05 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 14:15:41 +0300
Message-Id: <1471864541-9848-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1471864541-9848-1-git-send-email-maxin.john@intel.com>
References: <1471864541-9848-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
Subject: [krogoth][PATCH 3/3] curl: security fix for CVE-2016-5421
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
X-List-Received-Date: Mon, 22 Aug 2016 11:23:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Affected versions: libcurl 7.32.0 to and including 7.50.0

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/curl/curl/CVE-2016-5421.patch | 36 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.47.1.bb           |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-5421.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2016-5421.patch b/meta/recipes-support/curl/curl/CVE-2016-5421.patch
new file mode 100644
index 0000000..862da75
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-5421.patch
@@ -0,0 +1,36 @@
+From 75dc096e01ef1e21b6c57690d99371dedb2c0b80 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sun, 31 Jul 2016 01:09:04 +0200
+Subject: [PATCH] curl_multi_cleanup: clear connection pointer for easy handles
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Bug: https://curl.haxx.se/docs/adv_20160803C.html
+Reported-by: Marcelo Echeverria and Fernando Muñoz
+
+Upstream-Status: Backport
+https://curl.haxx.se/CVE-2016-5421.patch
+
+CVE: CVE-2016-5421
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ lib/multi.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/multi.c b/lib/multi.c
+index 9ee3523..8bb9366 100644
+--- a/lib/multi.c
++++ b/lib/multi.c
+@@ -2157,6 +2157,8 @@ static void close_all_connections(struct Curl_multi *multi)
+     conn->data = multi->closure_handle;
+ 
+     sigpipe_ignore(conn->data, &pipe_st);
++    conn->data->easy_conn = NULL; /* clear the easy handle's connection
++                                     pointer */
+     /* This will remove the connection from the cache */
+     (void)Curl_disconnect(conn, FALSE);
+     sigpipe_restore(&pipe_st);
+-- 
+2.4.0
+
diff --git a/meta/recipes-support/curl/curl_7.47.1.bb b/meta/recipes-support/curl/curl_7.47.1.bb
index 8d459c7..6c71760 100644
--- a/meta/recipes-support/curl/curl_7.47.1.bb
+++ b/meta/recipes-support/curl/curl_7.47.1.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2"
 SRC_URI += " file://configure_ac.patch \
              file://CVE-2016-5419.patch \
              file://CVE-2016-5420.patch \
+             file://CVE-2016-5421.patch \
            "
 
 SRC_URI[md5sum] = "9ea3123449439bbd960cd25cf98796fb"
-- 
2.4.0


