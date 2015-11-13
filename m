Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 51BC8772EF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 11:08:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tADB8Jqr028980
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Nov 2015 03:08:19 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 13 Nov 2015 03:08:18 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 13 Nov 2015 19:08:06 +0800
Message-ID: <5c711f4f61c7a1481e415ec45290301141d45b48.1447412835.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447412835.git.hongxu.jia@windriver.com>
References: <cover.1447412835.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] wpa-supplicant: Fix CVE-2015-8041
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
X-List-Received-Date: Fri, 13 Nov 2015 11:08:30 -0000
Content-Type: text/plain

Backport patch from http://w1.fi/security/2015-5/
and rebase for wpa-supplicant 2.4

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...load-length-validation-in-NDEF-record-par.patch | 64 ++++++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.4.bb           |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch
new file mode 100644
index 0000000..bc1d1e5
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch
@@ -0,0 +1,64 @@
+From c13401c723a039971bcd91b3856d76c6041b15f2 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Fri, 13 Nov 2015 05:54:18 -0500
+Subject: [PATCH] NFC: Fix payload length validation in NDEF record parser
+
+It was possible for the 32-bit record->total_length value to end up
+wrapping around due to integer overflow if the longer form of payload
+length field is used and record->payload_length gets a value close to
+2^32. This could result in ndef_parse_record() accepting a too large
+payload length value and the record type filter reading up to about 20
+bytes beyond the end of the buffer and potentially killing the process.
+This could also result in an attempt to allocate close to 2^32 bytes of
+heap memory and if that were to succeed, a buffer read overflow of the
+same length which would most likely result in the process termination.
+In case of record->total_length ending up getting the value 0, there
+would be no buffer read overflow, but record parsing would result in an
+infinite loop in ndef_parse_records().
+
+Any of these error cases could potentially be used for denial of service
+attacks over NFC by using a malformed NDEF record on an NFC Tag or
+sending them during NFC connection handover if the application providing
+the NDEF message to hostapd/wpa_supplicant did no validation of the
+received records. While such validation is likely done in the NFC stack
+that needs to parse the NFC messages before further processing,
+hostapd/wpa_supplicant better be prepared for any data being included
+here.
+
+Fix this by validating record->payload_length value in a way that
+detects integer overflow. (CID 122668)
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+Upstream-Status: Backport [from http://w1.fi/security/2015-5/]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/wps/ndef.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/wps/ndef.c b/src/wps/ndef.c
+index d45dfc8..f7f729b 100644
+--- a/src/wps/ndef.c
++++ b/src/wps/ndef.c
+@@ -48,6 +48,8 @@ static int ndef_parse_record(const u8 *data, u32 size,
+ 		if (size < 6)
+ 			return -1;
+ 		record->payload_length = ntohl(*(u32 *)pos);
++                if (record->payload_length > size - 6)
++                       return -1;
+ 		pos += sizeof(u32);
+ 	}
+ 
+@@ -68,7 +70,8 @@ static int ndef_parse_record(const u8 *data, u32 size,
+ 	pos += record->payload_length;
+ 
+ 	record->total_length = pos - data;
+-	if (record->total_length > size)
++	if (record->total_length > size ||
++	    record->total_length < record->payload_length)
+ 		return -1;
+ 	return 0;
+ }
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
index a124cf2..6e4d028 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch \
            file://0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch \
            file://0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch \
+           file://0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch \
           "
 SRC_URI[md5sum] = "f0037dbe03897dcaf2ad2722e659095d"
 SRC_URI[sha256sum] = "058dc832c096139a059e6df814080f50251a8d313c21b13364c54a1e70109122"
-- 
1.9.1


