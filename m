Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 622 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 26 Jun 2015 08:14:53 UTC
Received: from mgwym04.jp.fujitsu.com (mgwym04.jp.fujitsu.com [211.128.242.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6D44D601E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 08:14:53 +0000 (UTC)
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by
	mgwym04.jp.fujitsu.com with smtp
	id 6394_103b_2f6af931_a730_4a79_bf7b_51527be6c589;
	Fri, 26 Jun 2015 17:04:31 +0900
Received: from g01jpfmpwkw01.exch.g01.fujitsu.local
	(g01jpfmpwkw01.exch.g01.fujitsu.local [10.0.193.38])
	by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 341BCAC05BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 17:04:30 +0900 (JST)
Received: from G01JPEXCHKW13.g01.fujitsu.local
	(G01JPEXCHKW13.g01.fujitsu.local [10.0.194.52])
	by g01jpfmpwkw01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	56B1A6923B0 for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 17:03:23 +0900 (JST)
Received: from [10.24.19.99] (10.24.19.99) by G01JPEXCHKW13.g01.fujitsu.local
	(10.0.194.52) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 26 Jun 2015 17:03:23 +0900
Message-ID: <558D07C7.5000203@jp.fujitsu.com>
Date: Fri, 26 Jun 2015 17:05:27 +0900
From: fan.xin <fan.xin@jp.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Subject: [PATCH] wpa-supplicant: Fix CVE-2015-4142
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
X-List-Received-Date: Fri, 26 Jun 2015 08:14:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

    
    Description on [1] and patch taken from [2]
    
    [1]https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-4142
    [2]http://w1.fi/security/2015-3/0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch
    
    Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch
new file mode 100644
index 0000000..79c5af8
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch
@@ -0,0 +1,41 @@
+From ef566a4d4f74022e1fdb0a2addfe81e6de9f4aae Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Wed, 29 Apr 2015 02:21:53 +0300
+Subject: [PATCH] AP WMM: Fix integer underflow in WMM Action frame parser
+
+The length of the WMM Action frame was not properly validated and the
+length of the information elements (int left) could end up being
+negative. This would result in reading significantly past the stack
+buffer while parsing the IEs in ieee802_11_parse_elems() and while doing
+so, resulting in segmentation fault.
+
+This can result in an invalid frame being used for a denial of service
+attack (hostapd process killed) against an AP with a driver that uses
+hostapd for management frame processing (e.g., all mac80211-based
+drivers).
+
+Thanks to Kostya Kortchinsky of Google security team for discovering and
+reporting this issue.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+---
+ src/ap/wmm.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/ap/wmm.c b/src/ap/wmm.c
+index 6d4177c..314e244 100644
+--- a/src/ap/wmm.c
++++ b/src/ap/wmm.c
+@@ -274,6 +274,9 @@ void hostapd_wmm_action(struct hostapd_data *hapd,
+               return;
+       }
+ 
++      if (left < 0)
++              return; /* not a valid WMM Action frame */
++
+       /* extract the tspec info element */
+       if (ieee802_11_parse_elems(pos, left, &elems, 1) == ParseFailed) {
+               hostapd_logger(hapd, mgmt->sa, HOSTAPD_MODULE_IEEE80211,
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
index ebae239..fee8384 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
            file://0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch \
+           file://0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch \
           "
 SRC_URI[md5sum] = "f0037dbe03897dcaf2ad2722e659095d"
 SRC_URI[sha256sum] = "058dc832c096139a059e6df814080f50251a8d313c21b13364c54a1e70109122"


