Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym03.jp.fujitsu.com (mgwym03.jp.fujitsu.com [211.128.242.42])
	by mail.openembedded.org (Postfix) with ESMTP id 59A647196D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 02:19:54 +0000 (UTC)
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by
	mgwym03.jp.fujitsu.com with smtp
	id 4761_ab74_5830b795_1e0d_474f_8028_75606d5f614f;
	Tue, 30 Jun 2015 11:19:54 +0900
Received: from m3051.s.css.fujitsu.com (m3051.s.css.fujitsu.com
	[10.134.21.209])
	by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 618CFAC01F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 11:19:53 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3051.s.css.fujitsu.com (Postfix) with ESMTP id 59424131;
	Tue, 30 Jun 2015 11:19:53 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id 3995B1E0087;
	Tue, 30 Jun 2015 11:19:53 +0900 (JST)
Message-ID: <5591FD43.7080306@jp.fujitsu.com>
Date: Tue, 30 Jun 2015 11:21:55 +0900
From: "fan.xin" <fan.xin@jp.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <558D07C7.5000203@jp.fujitsu.com>
	<CAJTo0LYdeaZMRkEMmd+k4Qy91aMC1fYSRcQGBBfzgqKXt79pqw@mail.gmail.com>
	<5590FD9F.9090204@jp.fujitsu.com>
	<CAJTo0LYGb84kOe9hdRxfedEwwq4vgvt9CXMPynQVUpK4KvV_Qw@mail.gmail.com>
In-Reply-To: <CAJTo0LYGb84kOe9hdRxfedEwwq4vgvt9CXMPynQVUpK4KvV_Qw@mail.gmail.com>
X-TM-AS-MML: disable
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] wpa-supplicant: Fix CVE-2015-4142
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
X-List-Received-Date: Tue, 30 Jun 2015 02:19:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

wpa-supplicant: backport patch to fix CVE-2015-4142

Backport patch to fix CVE-2015-4142. This patch is originally from:

http://w1.fi/security/2015-3/0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 ...integer-underflow-in-WMM-Action-frame-par.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch
new file mode 100644
index 0000000..882674f
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch
@@ -0,0 +1,45 @@
+Upstream-Status: Backport
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+
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
-- 
1.8.4.2


On 2015年06月29日 20:43, Burton, Ross wrote:
> 
> On 29 June 2015 at 09:11, fan.xin <fan.xin@jp.fujitsu.com <mailto:fan.xin@jp.fujitsu.com>> wrote:
> 
>     Upstream-Status: Backport
> 
> 
> This and signed-off-by In the patch header, not the commit message.
> 
> Ross

