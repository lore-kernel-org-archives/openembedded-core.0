Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 857 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 29 Jun 2015 08:24:23 UTC
Received: from mgwkm03.jp.fujitsu.com (mgwkm03.jp.fujitsu.com [202.219.69.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4F64260670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 08:24:23 +0000 (UTC)
Received: from kw-mxoi2.gw.nic.fujitsu.com (unknown [192.168.231.133]) by
	mgwkm03.jp.fujitsu.com with smtp
	id 08ee_4e66_30298753_a5b1_418c_9a82_e493eef933c3;
	Mon, 29 Jun 2015 17:10:07 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
	(g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by kw-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C740AC04A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 17:10:07 +0900 (JST)
Received: from g01jpexchkw35.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	BDDE8BD6710; Mon, 29 Jun 2015 17:09:05 +0900 (JST)
Received: from [10.24.19.99] (10.24.19.99) by g01jpexchkw35.g01.fujitsu.local
	(10.0.193.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 Jun 2015 17:09:06 +0900
Message-ID: <5590FD9F.9090204@jp.fujitsu.com>
Date: Mon, 29 Jun 2015 17:11:11 +0900
From: fan.xin <fan.xin@jp.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <558D07C7.5000203@jp.fujitsu.com>
	<CAJTo0LYdeaZMRkEMmd+k4Qy91aMC1fYSRcQGBBfzgqKXt79pqw@mail.gmail.com>
In-Reply-To: <CAJTo0LYdeaZMRkEMmd+k4Qy91aMC1fYSRcQGBBfzgqKXt79pqw@mail.gmail.com>
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] wpa-supplicant: Fix CVE-2015-4142
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
X-List-Received-Date: Mon, 29 Jun 2015 08:24:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

wpa-supplicant: Fix CVE-2015-4142

wpa-supplicant has a vulnerability aka CVE-2015-4142.
This patch fixes CVE-2015-4142. 

Description on [1] and patch taken from [2].

[1]https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-4142
[2]http://w1.fi/security/2015-3/0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch

Upstream-Status: Backport

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 ...integer-underflow-in-WMM-Action-frame-par.patch | 41 ++++++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.4.bb           |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch

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
+ 		return;
+ 	}
+ 
++	if (left < 0)
++		return; /* not a valid WMM Action frame */
++
+ 	/* extract the tspec info element */
+ 	if (ieee802_11_parse_elems(pos, left, &elems, 1) == ParseFailed) {
+ 		hostapd_logger(hapd, mgmt->sa, HOSTAPD_MODULE_IEEE80211,
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
-- 
1.8.4.2


On 2015年06月27日 00:19, Burton, Ross wrote:
> 
> On 26 June 2015 at 09:05, fan.xin <fan.xin@jp.fujitsu.com <mailto:fan.xin@jp.fujitsu.com>> wrote:
> 
>     +From ef566a4d4f74022e1fdb0a2addfe81e6de9f4aae Mon Sep 17 00:00:00 2001
>     +From: Jouni Malinen <j@w1.fi <mailto:j@w1.fi>>
>     +Date: Wed, 29 Apr 2015 02:21:53 +0300
>     +Subject: [PATCH] AP WMM: Fix integer underflow in WMM Action frame parser
>     +
>     +The length of the WMM Action frame was not properly validated and the
>     +length of the information elements (int left) could end up being
>     +negative. This would result in reading significantly past the stack
>     +buffer while parsing the IEs in ieee802_11_parse_elems() and while doing
>     +so, resulting in segmentation fault.
>     +
>     +This can result in an invalid frame being used for a denial of service
>     +attack (hostapd process killed) against an AP with a driver that uses
>     +hostapd for management frame processing (e.g., all mac80211-based
>     +drivers).
>     +
>     +Thanks to Kostya Kortchinsky of Google security team for discovering and
>     +reporting this issue.
>     +
>     +Signed-off-by: Jouni Malinen <j@w1.fi <mailto:j@w1.fi>>
> 
> 
> This patch needs an Upstream-Status (backport?) and Signed-off-by in the patch header.
> 
> Ross

