Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 612 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 06 Nov 2015 07:36:36 UTC
Received: from mgwym01.jp.fujitsu.com (mgwym01.jp.fujitsu.com [211.128.242.40])
	by mail.openembedded.org (Postfix) with ESMTP id B3ACA75D22
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 07:36:36 +0000 (UTC)
Received: from yt-mxoi1.gw.nic.fujitsu.com (unknown [192.168.229.67]) by
	mgwym01.jp.fujitsu.com with smtp
	id 787c_485e_b4a13205_127c_4b49_a9f8_a249bb848ddc;
	Fri, 06 Nov 2015 16:26:20 +0900
Received: from m3051.s.css.fujitsu.com (m3051.s.css.fujitsu.com
	[10.134.21.209])
	by yt-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C135AC0343
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 16:26:19 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3051.s.css.fujitsu.com (Postfix) with ESMTP id 5681610A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 16:26:19 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id 36BB51E0089
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 16:26:19 +0900 (JST)
To: openembedded-core@lists.openembedded.org
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <563C5648.5050009@jp.fujitsu.com>
Date: Fri, 6 Nov 2015 16:27:04 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
X-TM-AS-MML: disable
Subject: [PATCH] wpa-supplicant: upgrade to 2.5
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
X-List-Received-Date: Fri, 06 Nov 2015 07:36:40 -0000
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit

wpa-supplicant: upgrade to 2.5

1. upgrade to 2.5
2. remove eight patches since they have been modified in 2.5

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 ...integer-underflow-in-WMM-Action-frame-par.patch | 45 -------------
 ...r-Fix-payload-length-validation-for-Commi.patch | 77
----------------------
 ...e-SSID-element-length-before-copying-it-C.patch | 47 -------------
 ...Fix-HTTP-chunked-transfer-encoding-parser.patch | 53 ---------------
 ...ver-Fix-payload-length-validation-for-Com.patch | 70
--------------------
 ...r-Fix-Total-Length-parsing-for-fragment-r.patch | 56 ----------------
 ...ver-Fix-Total-Length-parsing-for-fragment.patch | 54 ---------------
 ...eer-Fix-asymmetric-fragmentation-behavior.patch | 36 ----------
 ...wpa-supplicant_2.4.bb => wpa-supplicant_2.5.bb} | 14 +---
 9 files changed, 3 insertions(+), 449 deletions(-)
 delete mode 100644
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch
 delete mode 100644
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-EAP-pwd-peer-Fix-payload-length-validation-for-Commi.patch
 delete mode 100644
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch
 delete mode 100644
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Fix-HTTP-chunked-transfer-encoding-parser.patch
 delete mode 100644
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-EAP-pwd-server-Fix-payload-length-validation-for-Com.patch
 delete mode 100644
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch
 delete mode 100644
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch
 delete mode 100644
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.4.bb
=> wpa-supplicant_2.5.bb} (81%)

diff --git
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch
deleted file mode 100644
index 882674f..0000000
---
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
-
-From ef566a4d4f74022e1fdb0a2addfe81e6de9f4aae Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Wed, 29 Apr 2015 02:21:53 +0300
-Subject: [PATCH] AP WMM: Fix integer underflow in WMM Action frame parser
-
-The length of the WMM Action frame was not properly validated and the
-length of the information elements (int left) could end up being
-negative. This would result in reading significantly past the stack
-buffer while parsing the IEs in ieee802_11_parse_elems() and while doing
-so, resulting in segmentation fault.
-
-This can result in an invalid frame being used for a denial of service
-attack (hostapd process killed) against an AP with a driver that uses
-hostapd for management frame processing (e.g., all mac80211-based
-drivers).
-
-Thanks to Kostya Kortchinsky of Google security team for discovering and
-reporting this issue.
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
----
- src/ap/wmm.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/ap/wmm.c b/src/ap/wmm.c
-index 6d4177c..314e244 100644
---- a/src/ap/wmm.c
-+++ b/src/ap/wmm.c
-@@ -274,6 +274,9 @@ void hostapd_wmm_action(struct hostapd_data *hapd,
- 		return;
- 	}
-
-+	if (left < 0)
-+		return; /* not a valid WMM Action frame */
-+
- 	/* extract the tspec info element */
- 	if (ieee802_11_parse_elems(pos, left, &elems, 1) == ParseFailed) {
- 		hostapd_logger(hapd, mgmt->sa, HOSTAPD_MODULE_IEEE80211,
---
-1.9.1
-
diff --git
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-EAP-pwd-peer-Fix-payload-length-validation-for-Commi.patch
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-EAP-pwd-peer-Fix-payload-length-validation-for-Commi.patch
deleted file mode 100644
index a2bafc8..0000000
---
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-EAP-pwd-peer-Fix-payload-length-validation-for-Commi.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
-
-From dd2f043c9c43d156494e33d7ce22db96e6ef42c7 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Fri, 1 May 2015 16:37:45 +0300
-Subject: [PATCH 1/5] EAP-pwd peer: Fix payload length validation for Commit
- and Confirm
-
-The length of the received Commit and Confirm message payloads was not
-checked before reading them. This could result in a buffer read
-overflow when processing an invalid message.
-
-Fix this by verifying that the payload is of expected length before
-processing it. In addition, enforce correct state transition sequence to
-make sure there is no unexpected behavior if receiving a Commit/Confirm
-message before the previous exchanges have been completed.
-
-Thanks to Kostya Kortchinsky of Google security team for discovering and
-reporting this issue.
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
----
- src/eap_peer/eap_pwd.c | 29 +++++++++++++++++++++++++++++
- 1 file changed, 29 insertions(+)
-
-diff --git a/src/eap_peer/eap_pwd.c b/src/eap_peer/eap_pwd.c
-index f2b0926..a629437 100644
---- a/src/eap_peer/eap_pwd.c
-+++ b/src/eap_peer/eap_pwd.c
-@@ -355,6 +355,23 @@ eap_pwd_perform_commit_exchange(struct eap_sm *sm,
struct eap_pwd_data *data,
- 	BIGNUM *mask = NULL, *x = NULL, *y = NULL, *cofactor = NULL;
- 	u16 offset;
- 	u8 *ptr, *scalar = NULL, *element = NULL;
-+	size_t prime_len, order_len;
-+
-+	if (data->state != PWD_Commit_Req) {
-+		ret->ignore = TRUE;
-+		goto fin;
-+	}
-+
-+	prime_len = BN_num_bytes(data->grp->prime);
-+	order_len = BN_num_bytes(data->grp->order);
-+
-+	if (payload_len != 2 * prime_len + order_len) {
-+		wpa_printf(MSG_INFO,
-+			   "EAP-pwd: Unexpected Commit payload length %u (expected %u)",
-+			   (unsigned int) payload_len,
-+			   (unsigned int) (2 * prime_len + order_len));
-+		goto fin;
-+	}
-
- 	if (((data->private_value = BN_new()) == NULL) ||
- 	    ((data->my_element = EC_POINT_new(data->grp->group)) == NULL) ||
-@@ -554,6 +571,18 @@ eap_pwd_perform_confirm_exchange(struct eap_sm
*sm, struct eap_pwd_data *data,
- 	u8 conf[SHA256_MAC_LEN], *cruft = NULL, *ptr;
- 	int offset;
-
-+	if (data->state != PWD_Confirm_Req) {
-+		ret->ignore = TRUE;
-+		goto fin;
-+	}
-+
-+	if (payload_len != SHA256_MAC_LEN) {
-+		wpa_printf(MSG_INFO,
-+			   "EAP-pwd: Unexpected Confirm payload length %u (expected %u)",
-+			   (unsigned int) payload_len, SHA256_MAC_LEN);
-+		goto fin;
-+	}
-+
- 	/*
- 	 * first build up the ciphersuite which is group | random_function |
- 	 *	prf
---
-1.9.1
-
diff --git
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch
deleted file mode 100644
index e108a93..0000000
---
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 9ed4eee345f85e3025c33c6e20aa25696e341ccd Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <jouni@qca.qualcomm.com>
-Date: Tue, 7 Apr 2015 11:32:11 +0300
-Subject: [PATCH] P2P: Validate SSID element length before copying it
- (CVE-2015-1863)
-
-This fixes a possible memcpy overflow for P2P dev->oper_ssid in
-p2p_add_device(). The length provided by the peer device (0..255 bytes)
-was used without proper bounds checking and that could have resulted in
-arbitrary data of up to 223 bytes being written beyond the end of the
-dev->oper_ssid[] array (of which about 150 bytes would be beyond the
-heap allocation) when processing a corrupted management frame for P2P
-peer discovery purposes.
-
-This could result in corrupted state in heap, unexpected program
-behavior due to corrupted P2P peer device information, denial of service
-due to process crash, exposure of memory contents during GO Negotiation,
-and potentially arbitrary code execution.
-
-Thanks to Google security team for reporting this issue and smart
-hardware research group of Alibaba security team for discovering it.
-
-Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
-
-Upstream-Status: Backport
-
-Signed-off-by: Yue Tao <yue.tao@windriver.com>
-
----
- src/p2p/p2p.c |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/p2p/p2p.c b/src/p2p/p2p.c
-index f584fae..a45fe73 100644
---- a/src/p2p/p2p.c
-+++ b/src/p2p/p2p.c
-@@ -778,6 +778,7 @@ int p2p_add_device(struct p2p_data *p2p, const u8
*addr, int freq,
- 	if (os_memcmp(addr, p2p_dev_addr, ETH_ALEN) != 0)
- 		os_memcpy(dev->interface_addr, addr, ETH_ALEN);
- 	if (msg.ssid &&
-+	    msg.ssid[1] <= sizeof(dev->oper_ssid) &&
- 	    (msg.ssid[1] != P2P_WILDCARD_SSID_LEN ||
- 	     os_memcmp(msg.ssid + 2, P2P_WILDCARD_SSID, P2P_WILDCARD_SSID_LEN)
- 	     != 0)) {
---
-1.7.9.5
-
diff --git
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Fix-HTTP-chunked-transfer-encoding-parser.patch
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Fix-HTTP-chunked-transfer-encoding-parser.patch
deleted file mode 100644
index 2568ea1..0000000
---
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Fix-HTTP-chunked-transfer-encoding-parser.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
-
-From 5acd23f4581da58683f3cf5e36cb71bbe4070bd7 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Tue, 28 Apr 2015 17:08:33 +0300
-Subject: [PATCH] WPS: Fix HTTP chunked transfer encoding parser
-
-strtoul() return value may end up overflowing the int h->chunk_size and
-resulting in a negative value to be stored as the chunk_size. This could
-result in the following memcpy operation using a very large length
-argument which would result in a buffer overflow and segmentation fault.
-
-This could have been used to cause a denial service by any device that
-has been authorized for network access (either wireless or wired). This
-would affect both the WPS UPnP functionality in a WPS AP (hostapd with
-upnp_iface parameter set in the configuration) and WPS ER
-(wpa_supplicant with WPS_ER_START control interface command used).
-
-Validate the parsed chunk length value to avoid this. In addition to
-rejecting negative values, we can also reject chunk size that would be
-larger than the maximum configured body length.
-
-Thanks to Kostya Kortchinsky of Google security team for discovering and
-reporting this issue.
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
----
- src/wps/httpread.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/src/wps/httpread.c b/src/wps/httpread.c
-index 2f08f37..d2855e3 100644
---- a/src/wps/httpread.c
-+++ b/src/wps/httpread.c
-@@ -533,6 +533,13 @@ static void httpread_read_handler(int sd, void
*eloop_ctx, void *sock_ctx)
- 					if (!isxdigit(*cbp))
- 						goto bad;
- 					h->chunk_size = strtoul(cbp, NULL, 16);
-+					if (h->chunk_size < 0 ||
-+					    h->chunk_size > h->max_bytes) {
-+						wpa_printf(MSG_DEBUG,
-+							   "httpread: Invalid chunk size %d",
-+							   h->chunk_size);
-+						goto bad;
-+					}
- 					/* throw away chunk header
- 					 * so we have only real data
- 					 */
---
-1.9.1
-
diff --git
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-EAP-pwd-server-Fix-payload-length-validation-for-Com.patch
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-EAP-pwd-server-Fix-payload-length-validation-for-Com.patch
deleted file mode 100644
index c477c2f..0000000
---
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-EAP-pwd-server-Fix-payload-length-validation-for-Com.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
-
-From e28a58be26184c2a23f80b410e0997ef1bd5d578 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Fri, 1 May 2015 16:40:44 +0300
-Subject: [PATCH 2/5] EAP-pwd server: Fix payload length validation for
Commit
- and Confirm
-
-The length of the received Commit and Confirm message payloads was not
-checked before reading them. This could result in a buffer read
-overflow when processing an invalid message.
-
-Fix this by verifying that the payload is of expected length before
-processing it. In addition, enforce correct state transition sequence to
-make sure there is no unexpected behavior if receiving a Commit/Confirm
-message before the previous exchanges have been completed.
-
-Thanks to Kostya Kortchinsky of Google security team for discovering and
-reporting this issue.
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
----
- src/eap_server/eap_server_pwd.c | 19 +++++++++++++++++++
- 1 file changed, 19 insertions(+)
-
-diff --git a/src/eap_server/eap_server_pwd.c
b/src/eap_server/eap_server_pwd.c
-index 66bd5d2..3189105 100644
---- a/src/eap_server/eap_server_pwd.c
-+++ b/src/eap_server/eap_server_pwd.c
-@@ -656,9 +656,21 @@ eap_pwd_process_commit_resp(struct eap_sm *sm,
struct eap_pwd_data *data,
- 	BIGNUM *x = NULL, *y = NULL, *cofactor = NULL;
- 	EC_POINT *K = NULL, *point = NULL;
- 	int res = 0;
-+	size_t prime_len, order_len;
-
- 	wpa_printf(MSG_DEBUG, "EAP-pwd: Received commit response");
-
-+	prime_len = BN_num_bytes(data->grp->prime);
-+	order_len = BN_num_bytes(data->grp->order);
-+
-+	if (payload_len != 2 * prime_len + order_len) {
-+		wpa_printf(MSG_INFO,
-+			   "EAP-pwd: Unexpected Commit payload length %u (expected %u)",
-+			   (unsigned int) payload_len,
-+			   (unsigned int) (2 * prime_len + order_len));
-+		goto fin;
-+	}
-+
- 	if (((data->peer_scalar = BN_new()) == NULL) ||
- 	    ((data->k = BN_new()) == NULL) ||
- 	    ((cofactor = BN_new()) == NULL) ||
-@@ -774,6 +786,13 @@ eap_pwd_process_confirm_resp(struct eap_sm *sm,
struct eap_pwd_data *data,
- 	u8 conf[SHA256_MAC_LEN], *cruft = NULL, *ptr;
- 	int offset;
-
-+	if (payload_len != SHA256_MAC_LEN) {
-+		wpa_printf(MSG_INFO,
-+			   "EAP-pwd: Unexpected Confirm payload length %u (expected %u)",
-+			   (unsigned int) payload_len, SHA256_MAC_LEN);
-+		goto fin;
-+	}
-+
- 	/* build up the ciphersuite: group | random_function | prf */
- 	grp = htons(data->group_num);
- 	ptr = (u8 *) &cs;
---
-1.9.1
-
diff --git
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch
deleted file mode 100644
index e46ce43..0000000
---
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
-
-From 477c74395acd0123340457ba6f15ab345d42016e Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Sat, 2 May 2015 19:23:04 +0300
-Subject: [PATCH 3/5] EAP-pwd peer: Fix Total-Length parsing for fragment
- reassembly
-
-The remaining number of bytes in the message could be smaller than the
-Total-Length field size, so the length needs to be explicitly checked
-prior to reading the field and decrementing the len variable. This could
-have resulted in the remaining length becoming negative and interpreted
-as a huge positive integer.
-
-In addition, check that there is no already started fragment in progress
-before allocating a new buffer for reassembling fragments. This avoid a
-potential memory leak when processing invalid message.
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
----
- src/eap_peer/eap_pwd.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/src/eap_peer/eap_pwd.c b/src/eap_peer/eap_pwd.c
-index a629437..1d2079b 100644
---- a/src/eap_peer/eap_pwd.c
-+++ b/src/eap_peer/eap_pwd.c
-@@ -866,11 +866,23 @@ eap_pwd_process(struct eap_sm *sm, void *priv,
struct eap_method_ret *ret,
- 	 * if it's the first fragment there'll be a length field
- 	 */
- 	if (EAP_PWD_GET_LENGTH_BIT(lm_exch)) {
-+		if (len < 2) {
-+			wpa_printf(MSG_DEBUG,
-+				   "EAP-pwd: Frame too short to contain Total-Length field");
-+			ret->ignore = TRUE;
-+			return NULL;
-+		}
- 		tot_len = WPA_GET_BE16(pos);
- 		wpa_printf(MSG_DEBUG, "EAP-pwd: Incoming fragments whose "
- 			   "total length = %d", tot_len);
- 		if (tot_len > 15000)
- 			return NULL;
-+		if (data->inbuf) {
-+			wpa_printf(MSG_DEBUG,
-+				   "EAP-pwd: Unexpected new fragment start when previous fragment
is still in use");
-+			ret->ignore = TRUE;
-+			return NULL;
-+		}
- 		data->inbuf = wpabuf_alloc(tot_len);
- 		if (data->inbuf == NULL) {
- 			wpa_printf(MSG_INFO, "Out of memory to buffer "
---
-1.9.1
-
diff --git
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch
deleted file mode 100644
index a4c02b4..0000000
---
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
-
-From 3035cc2894e08319b905bd6561e8bddc8c2db9fa Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Sat, 2 May 2015 19:26:06 +0300
-Subject: [PATCH 4/5] EAP-pwd server: Fix Total-Length parsing for fragment
- reassembly
-
-The remaining number of bytes in the message could be smaller than the
-Total-Length field size, so the length needs to be explicitly checked
-prior to reading the field and decrementing the len variable. This could
-have resulted in the remaining length becoming negative and interpreted
-as a huge positive integer.
-
-In addition, check that there is no already started fragment in progress
-before allocating a new buffer for reassembling fragments. This avoid a
-potential memory leak when processing invalid message.
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
----
- src/eap_server/eap_server_pwd.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/src/eap_server/eap_server_pwd.c
b/src/eap_server/eap_server_pwd.c
-index 3189105..2bfc3c2 100644
---- a/src/eap_server/eap_server_pwd.c
-+++ b/src/eap_server/eap_server_pwd.c
-@@ -942,11 +942,21 @@ static void eap_pwd_process(struct eap_sm *sm,
void *priv,
- 	 * the first fragment has a total length
- 	 */
- 	if (EAP_PWD_GET_LENGTH_BIT(lm_exch)) {
-+		if (len < 2) {
-+			wpa_printf(MSG_DEBUG,
-+				   "EAP-pwd: Frame too short to contain Total-Length field");
-+			return;
-+		}
- 		tot_len = WPA_GET_BE16(pos);
- 		wpa_printf(MSG_DEBUG, "EAP-pwd: Incoming fragments, total "
- 			   "length = %d", tot_len);
- 		if (tot_len > 15000)
- 			return;
-+		if (data->inbuf) {
-+			wpa_printf(MSG_DEBUG,
-+				   "EAP-pwd: Unexpected new fragment start when previous fragment
is still in use");
-+			return;
-+		}
- 		data->inbuf = wpabuf_alloc(tot_len);
- 		if (data->inbuf == NULL) {
- 			wpa_printf(MSG_INFO, "EAP-pwd: Out of memory to "
---
-1.9.1
-
diff --git
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch
deleted file mode 100644
index 4073600..0000000
---
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
-
-From 28a069a545b06b99eb55ad53f63f2c99e65a98f6 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Sat, 2 May 2015 19:26:28 +0300
-Subject: [PATCH 5/5] EAP-pwd peer: Fix asymmetric fragmentation behavior
-
-The L (Length) and M (More) flags needs to be cleared before deciding
-whether the locally generated response requires fragmentation. This
-fixes an issue where these flags from the server could have been invalid
-for the following message. In some cases, this could have resulted in
-triggering the wpabuf security check that would terminate the process
-due to invalid buffer allocation.
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
----
- src/eap_peer/eap_pwd.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/eap_peer/eap_pwd.c b/src/eap_peer/eap_pwd.c
-index 1d2079b..e58b13a 100644
---- a/src/eap_peer/eap_pwd.c
-+++ b/src/eap_peer/eap_pwd.c
-@@ -968,6 +968,7 @@ eap_pwd_process(struct eap_sm *sm, void *priv,
struct eap_method_ret *ret,
- 	/*
- 	 * we have output! Do we need to fragment it?
- 	 */
-+	lm_exch = EAP_PWD_GET_EXCHANGE(lm_exch);
- 	len = wpabuf_len(data->outbuf);
- 	if ((len + EAP_PWD_HDR_SIZE) > data->mtu) {
- 		resp = eap_msg_alloc(EAP_VENDOR_IETF, EAP_TYPE_PWD, data->mtu,
---
-1.9.1
-
diff --git
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
similarity index 81%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
index a124cf2..5455034 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
@@ -5,7 +5,7 @@ SECTION = "network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=36b27801447e0662ee0138d17fe93880 \

file://README;beginline=1;endline=56;md5=7f393579f8b109fe91f3b9765d26c7d3 \
-
file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=3430fda79f2ba1dd545f0b3c4d6e4d24
"
+
file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=3430fda79f2ba1dd545f0b3c4d6e4d24"
 DEPENDS = "dbus libnl libgcrypt"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"

@@ -24,17 +24,9 @@ SRC_URI =
"http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
-
file://0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch \
-
file://0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch \
-
file://0001-WPS-Fix-HTTP-chunked-transfer-encoding-parser.patch \
-
file://0001-EAP-pwd-peer-Fix-payload-length-validation-for-Commi.patch \
-
file://0002-EAP-pwd-server-Fix-payload-length-validation-for-Com.patch \
-
file://0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch \
-
file://0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch \
-
file://0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch \
           "
-SRC_URI[md5sum] = "f0037dbe03897dcaf2ad2722e659095d"
-SRC_URI[sha256sum] =
"058dc832c096139a059e6df814080f50251a8d313c21b13364c54a1e70109122"
+SRC_URI[md5sum] = "96ff75c3a514f1f324560a2376f13110"
+SRC_URI[sha256sum] =
"cce55bae483b364eae55c35ba567c279be442ed8bab5b80a3c7fb0d057b9b316"

 S = "${WORKDIR}/wpa_supplicant-${PV}"

-- 
1.8.4.2


