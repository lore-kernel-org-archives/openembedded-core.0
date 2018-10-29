Return-Path: <gtertych@cisco.com>
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
	by mail.openembedded.org (Postfix) with ESMTP id CC6D578D34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 15:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1835; q=dns/txt; s=iport;
	t=1540825993; x=1542035593;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=4tl+t8RFtK1kcS6htn/rR0rOJ5LiRWsfIY9CVGDz+sg=;
	b=eLn5f2APFnqJI/ePjL6B1rfQcIq4tke7QXzh3YMNZWQk4qK6Q19a9Us1
	lGicVhTD/z88yGsK8Chz0MZELxOrlSFY5/jd1z4d7ZS6pivMW1bFqCOvy
	xKm+5DP0+XcSWPKO9S9NFNINvgSUEHG/mgfegOSYMxgtY0BS2zt7eAOjt U=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AUAAAGI9db/xbLJq1kGgEBAQEBAgE?=
	=?us-ascii?q?BAQEHAgEBAQGBVAIBAQEBCwGCan8ojGyMXYl2kAwNH4RNg083Cg0BAwEBAgE?=
	=?us-ascii?q?BAm0cDIVzARgBLYFRgyEBgXQND6cBEYJQg3sBgT+EWBSHLYQ9gUE/iW6FDgK?=
	=?us-ascii?q?fCQmGaooPCxiCHo4oASyLLoEWiiyBWSKBVXAVO4JsCYIeFooJhBM9MAGNJAE?=
	=?us-ascii?q?B?=
X-IronPort-AV: E=Sophos;i="5.54,440,1534809600"; 
   d="scan'208";a="7561641"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com)
	([173.38.203.22])
	by aer-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Oct 2018 15:13:11 +0000
Received: from think.cisco.com (ams3-vpn-dhcp4462.cisco.com [10.61.81.109])
	by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id w9TFDAxm029125;
	Mon, 29 Oct 2018 15:13:11 GMT
From: grygorii tertychnyi <gtertych@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Oct 2018 17:13:10 +0200
Message-Id: <20181029151310.18527-1-gtertych@cisco.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.61.81.109, ams3-vpn-dhcp4462.cisco.com
X-Outbound-Node: aer-core-1.cisco.com
Cc: xe-linux-external@cisco.com
Subject: [PATCH] curl: extend CVE_PRODUCT
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
X-List-Received-Date: Mon, 29 Oct 2018 15:13:12 -0000
Content-Transfer-Encoding: 8bit

There are both "curl" and "libcurl" CPEs in NVD.
All "curl" CVEs are now missed in the reports.

Hence, switch "CVE_PRODUCT" to a space separated list.
It is useful for recipes generating several packages,
that have different product names in NVD.

Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>
---
 meta/classes/cve-check.bbclass           | 3 ++-
 meta/recipes-support/curl/curl_7.61.0.bb | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 12ad3e5c5c..743bc08a4f 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -190,7 +190,8 @@ def check_cves(d, patched_cves):
         # Write the faux CSV file to be used with cve-check-tool
         fd, faux = tempfile.mkstemp(prefix="cve-faux-")
         with os.fdopen(fd, "w") as f:
-            f.write("%s,%s,%s," % (bpn, pv, cves))
+            for pn in bpn.split():
+                f.write("%s,%s,%s,\n" % (pn, pv, cves))
         cmd.append(faux)
 
         output = subprocess.check_output(cmd).decode("utf-8")
diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
index 9b6406bbd0..53cfc4a518 100644
--- a/meta/recipes-support/curl/curl_7.61.0.bb
+++ b/meta/recipes-support/curl/curl_7.61.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "31d0a9f48dc796a7db351898a1e5058a"
 SRC_URI[sha256sum] = "5f6f336921cf5b84de56afbd08dfb70adeef2303751ffb3e570c936c6d656c9c"
 
-CVE_PRODUCT = "libcurl"
+CVE_PRODUCT = "curl libcurl"
 inherit autotools pkgconfig binconfig multilib_header
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls libidn proxy threaded-resolver verbose zlib"
-- 
2.19.1


