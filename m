Return-Path: <rruslich@cisco.com>
X-Greylist: delayed 605 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 Apr 2018 13:52:40 UTC
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
	by mail.openembedded.org (Postfix) with ESMTP id 70025745B7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Apr 2018 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1571; q=dns/txt; s=iport;
	t=1522677162; x=1523886762;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=Bn64u7aXfhk7CWJUL7GdD2+rqja1RpzZK5Q/AqtDfr8=;
	b=TLtl40iwilfSyyMW2k8Ff9JSus5XjIIi1lCeSi+huucN8qi4rNLJtaDZ
	QUL9wjJyHbv2VkZA29X4svUk8ugqtv49fl7/VaRO9/EOhNnjd+6HW29Hv
	IqeO4lf8eb/5QTf5x3SUoOfV1CHhVAj3xSCRjpda4cm5hvY49BEUWpdky w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CUAABNMsJa/xbLJq1cGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYUSKItcXo8mklOBeguFBAKEUzQYAQIBAQEBAQECayiFJQZ?=
	=?us-ascii?q?5EFFXGYUADbBThFWDZoIrFIkhP4lLhQgCjE+KawiOLgKMNY9WAhETAYElHDi?=
	=?us-ascii?q?BUnAVgn2QUDwwjioBAQ?=
X-IronPort-AV: E=Sophos;i="5.48,395,1517875200"; 
   d="scan'208";a="2954476"
Received: from aer-iport-nat.cisco.com (HELO aer-core-3.cisco.com)
	([173.38.203.22])
	by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Apr 2018 13:42:40 +0000
Received: from rruslich-ThinkPad-W550s.cisco.com (dhcp-10-61-103-248.cisco.com
	[10.61.103.248])
	by aer-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id w32DgZw3013507
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Mon, 2 Apr 2018 13:42:39 GMT
From: Ruslan Ruslichenko <rruslich@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Apr 2018 16:42:19 +0300
Message-Id: <1522676539-16675-2-git-send-email-rruslich@cisco.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1522676539-16675-1-git-send-email-rruslich@cisco.com>
References: <1522676539-16675-1-git-send-email-rruslich@cisco.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: xe-linux-external@cisco.com
Subject: [PATCH 2/2] tune-core2.inc: add cpu type for qemu
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
X-List-Received-Date: Mon, 02 Apr 2018 13:52:40 -0000

Define cpu type for Qemu in QEMU_EXTRAOPTIONS.
Otherways Qemu will emulate some virtual qemu32/64 processor,
which has very basic set of features, and programs built
for later CPU may crash, due to lack of new features (e.g. SSSE3).

Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
---
 meta/conf/machine/include/tune-core2.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/machine/include/tune-core2.inc
index 6a03466..c686bb4 100644
--- a/meta/conf/machine/include/tune-core2.inc
+++ b/meta/conf/machine/include/tune-core2.inc
@@ -21,15 +21,18 @@ TUNE_FEATURES_tune-core2-32 = "${TUNE_FEATURES_tune-x86} core2"
 BASE_LIB_tune-core2-32 = "lib"
 TUNE_PKGARCH_tune-core2-32 = "core2-32"
 PACKAGE_EXTRA_ARCHS_tune-core2-32 = "${PACKAGE_EXTRA_ARCHS_tune-i686} core2-32"
+QEMU_EXTRAOPTIONS_core2-32 = " -cpu core2duo"
 
 AVAILTUNES += "core2-64"
 TUNE_FEATURES_tune-core2-64 = "${TUNE_FEATURES_tune-x86-64} core2"
 BASE_LIB_tune-core2-64 = "lib64"
 TUNE_PKGARCH_tune-core2-64 = "core2-64"
 PACKAGE_EXTRA_ARCHS_tune-core2-64 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64} core2-64"
+QEMU_EXTRAOPTIONS_core2-64 = " -cpu core2duo"
 
 AVAILTUNES += "core2-64-x32"
 TUNE_FEATURES_tune-core2-64-x32 = "${TUNE_FEATURES_tune-x86-64-x32} core2"
 BASE_LIB_tune-core2-64-x32 = "libx32"
 TUNE_PKGARCH_tune-core2-64-x32 = "core2-64-x32"
 PACKAGE_EXTRA_ARCHS_tune-core2-64-x32 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64-x32} core2-64-x32"
+QEMU_EXTRAOPTIONS_core2-64-x32 = " -cpu core2duo"
-- 
1.9.1


