Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E6CCA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 10:23:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9779.1757413414192161746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 03:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VR6fSiMa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13475ff707=divya.chellam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5895Najs1305533
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Sep 2025 03:23:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=yDCHuY5CbO6Uc8XDBdUb
	FPXcQA+zpx9As5p6UF4HT1c=; b=VR6fSiMamCHNHprroAn+GawPGVRC1pGzpUMc
	rgrr0FXmWDV0kR1t3tCMk0X0qOWInUJVSXBaj5BOtW0SZiNT8B30HfMV/lk+oOAL
	6So/U1hZFTIfqFY+P2Jtcmp5NYXoOVU20qL/E44e8fPuKlSbzCKu8rOcHXzNhaAV
	ZMB1TDC7lxDzDOzt/6yzkoBf63WAEBVdgYK5jNiGqpw6EHwDP+Vb/w7YGAR4EDa3
	hNmDVnGyRubqZhjjB23gsvgk6QxmJysxYS5Vvdllg3DE/bHixyp/4bPOQb2iCBVC
	xuaM9g7zFeBV5rCdw4S8HlvqUDbB2gPow7kcL0tfDzRWGi2JRw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490mfg2jab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 03:23:32 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 9 Sep 2025 03:23:30 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] wpa-supplicant: fix CVE-2022-37660
Date: Tue, 9 Sep 2025 15:52:33 +0530
Message-ID: <20250909102233.1944739-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: xerjNGYc1oW1OblhJUroggsKIUAPNYAV
X-Authority-Analysis: v=2.4 cv=d+v1yQjE c=1 sm=1 tr=0 ts=68c00025 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=xNf9USuDAAAA:8 a=yaAG3qJ-AAAA:8
 a=t7CeM3EgAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=AYSCyj6Te5TWYtHA9y8A:9
 a=Ew8GRf84zx451BU3:21 a=oLVlbjkABFOu4cUI0CGI:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDEwMyBTYWx0ZWRfX7+rBuyj6cFGw
 O60pLKvVCSqyrmftf2kTsNE2LMxvY4p04HaqZca7c/I7cgPS4qYyqrFR3Cin+AM7gK8/LU70km/
 18OdNk8FiTs2A0jQnv6S8o7jSeO39t2+pmcxRHL5BwKMD2EzgNbXVBek8WGAHV2nahhZFnI9VfD
 G2tK6bgqwowdJGwo0dsVUOo13d+4vFBJYEamnzqr+dxC10C0uNQs7uDuXlBImMDYkQT6UmVftFC
 mv6BHS1e2UqRdcMARGuu7zxIRshVi5d+/Bs7nxvSICrV8f9356C72A7CvbIDqW5MoLrk12Ux/Vh
 ZtGDImN7SzhQbYLRBr/L0NJbS1VqpIrtU2FBaLfsRMF2HJrmE3FbXY5U5C1UbY=
X-Proofpoint-ORIG-GUID: xerjNGYc1oW1OblhJUroggsKIUAPNYAV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 10:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223098

From: Divya Chellam <divya.chellam@windriver.com>

In hostapd 2.10 and earlier, the PKEX code remains active even after a successful
PKEX association. An attacker that successfully bootstrapped public keys with
another entity using PKEX in the past, will be able to subvert a future bootstrapping
by passively observing public keys, re-using the encrypting element Qi and subtracting
it from the captured message M (X = M - Qi). This will result in the public ephemeral
key X; the only element required to subvert the PKEX association.

CVE-2022-37660-0001, CVE-2022-37660-0002, CVE-2022-37660-0003 and  CVE-2022-37660-0004
are dependent commits while CVE-2022-37660-0005 is actual CVE fix.

Reference:
https://security-tracker.debian.org/tracker/CVE-2022-37660

Upstream-patches:
https://git.w1.fi/cgit/hostap/commit/?id=9d3f347a2b14652e767d51142600206a32676b62
https://git.w1.fi/cgit/hostap/commit/?id=80213629981a21825e4688fde1b590e4c4d4bcea
https://git.w1.fi/cgit/hostap/commit/?id=bdcccbc2755dd1a75731496782e02b5435fb9534
https://git.w1.fi/cgit/hostap/commit/?id=d7be749335f2585658cf98c4f0e7d6cd5ac06865
https://git.w1.fi/cgit/hostap/commit/?id=15af83cf1846870873a011ed4d714732f01cd2e4

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../wpa-supplicant/CVE-2022-37660-0001.patch  | 254 +++++
 .../wpa-supplicant/CVE-2022-37660-0002.patch  | 139 +++
 .../wpa-supplicant/CVE-2022-37660-0003.patch  | 196 ++++
 .../wpa-supplicant/CVE-2022-37660-0004.patch  | 941 ++++++++++++++++++
 .../wpa-supplicant/CVE-2022-37660-0005.patch  | 144 +++
 .../wpa-supplicant/wpa-supplicant_2.10.bb     |   5 +
 6 files changed, 1679 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0001.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0002.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0003.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0004.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0005.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0001.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0001.patch
new file mode 100644
index 0000000000..e7d3a967fa
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0001.patch
@@ -0,0 +1,254 @@
+From 9d3f347a2b14652e767d51142600206a32676b62 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <quic_jouni@quicinc.com>
+Date: Mon, 24 Jan 2022 20:57:19 +0200
+Subject: [PATCH] DPP3: Add PKEX initiator retries and fallback from v2 to v1
+ for hostapd
+
+This extends hostapd with the design used in wpa_supplicant for PKEX
+initiator retries and automatic version fallback from v2 to v1 (the
+latter is enabled only with CONFIG_DPP3=y).
+
+Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
+
+CVE: CVE-2022-37660
+
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=9d3f347a2b14652e767d51142600206a32676b62]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ src/ap/dpp_hostapd.c | 188 +++++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 171 insertions(+), 17 deletions(-)
+
+diff --git a/src/ap/dpp_hostapd.c b/src/ap/dpp_hostapd.c
+index 13e1fc5..6c30ba3 100644
+--- a/src/ap/dpp_hostapd.c
++++ b/src/ap/dpp_hostapd.c
+@@ -216,6 +216,163 @@ static void hostapd_dpp_auth_resp_retry(struct hostapd_data *hapd)
+ }
+ 
+ 
++static int hostapd_dpp_allow_ir(struct hostapd_data *hapd, unsigned int freq)
++{
++	int i, j;
++
++	if (!hapd->iface->hw_features)
++		return -1;
++
++	for (i = 0; i < hapd->iface->num_hw_features; i++) {
++		struct hostapd_hw_modes *mode = &hapd->iface->hw_features[i];
++
++		for (j = 0; j < mode->num_channels; j++) {
++			struct hostapd_channel_data *chan = &mode->channels[j];
++
++			if (chan->freq != (int) freq)
++				continue;
++
++			if (chan->flag & (HOSTAPD_CHAN_DISABLED |
++					  HOSTAPD_CHAN_NO_IR |
++					  HOSTAPD_CHAN_RADAR))
++				continue;
++
++			return 1;
++		}
++	}
++
++	wpa_printf(MSG_DEBUG,
++		   "DPP: Frequency %u MHz not supported or does not allow PKEX initiation in the current channel list",
++		   freq);
++
++	return 0;
++}
++
++
++static int hostapd_dpp_pkex_next_channel(struct hostapd_data *hapd,
++					 struct dpp_pkex *pkex)
++{
++	if (pkex->freq == 2437)
++		pkex->freq = 5745;
++	else if (pkex->freq == 5745)
++		pkex->freq = 5220;
++	else if (pkex->freq == 5220)
++		pkex->freq = 60480;
++	else
++		return -1; /* no more channels to try */
++
++	if (hostapd_dpp_allow_ir(hapd, pkex->freq) == 1) {
++		wpa_printf(MSG_DEBUG, "DPP: Try to initiate on %u MHz",
++			   pkex->freq);
++		return 0;
++	}
++
++	/* Could not use this channel - try the next one */
++	return hostapd_dpp_pkex_next_channel(hapd, pkex);
++}
++
++
++static int hostapd_dpp_pkex_init(struct hostapd_data *hapd, bool v2)
++{
++	struct dpp_pkex *pkex;
++	struct wpabuf *msg;
++	unsigned int wait_time;
++
++	wpa_printf(MSG_DEBUG, "DPP: Initiating PKEXv%d", v2 ? 2 : 1);
++	dpp_pkex_free(hapd->dpp_pkex);
++	hapd->dpp_pkex = dpp_pkex_init(hapd->msg_ctx, hapd->dpp_pkex_bi,
++				       hapd->own_addr,
++				       hapd->dpp_pkex_identifier,
++				       hapd->dpp_pkex_code, v2);
++	pkex = hapd->dpp_pkex;
++	if (!pkex)
++		return -1;
++
++	msg = hapd->dpp_pkex->exchange_req;
++	wait_time = 2000; /* TODO: hapd->max_remain_on_chan; */
++	pkex->freq = 2437;
++	wpa_msg(hapd->msg_ctx, MSG_INFO, DPP_EVENT_TX "dst=" MACSTR
++		" freq=%u type=%d", MAC2STR(broadcast), pkex->freq,
++		v2 ? DPP_PA_PKEX_EXCHANGE_REQ :
++		DPP_PA_PKEX_V1_EXCHANGE_REQ);
++	hostapd_drv_send_action(hapd, pkex->freq, 0, broadcast,
++				wpabuf_head(msg), wpabuf_len(msg));
++	pkex->exch_req_wait_time = wait_time;
++	pkex->exch_req_tries = 1;
++
++	return 0;
++}
++
++
++static void hostapd_dpp_pkex_retry_timeout(void *eloop_ctx, void *timeout_ctx)
++{
++	struct hostapd_data *hapd = eloop_ctx;
++	struct dpp_pkex *pkex = hapd->dpp_pkex;
++
++	if (!pkex || !pkex->exchange_req)
++		return;
++	if (pkex->exch_req_tries >= 5) {
++		if (hostapd_dpp_pkex_next_channel(hapd, pkex) < 0) {
++#ifdef CONFIG_DPP3
++			if (pkex->v2) {
++				wpa_printf(MSG_DEBUG,
++					   "DPP: Fall back to PKEXv1");
++				hostapd_dpp_pkex_init(hapd, false);
++				return;
++			}
++#endif /* CONFIG_DPP3 */
++			wpa_msg(hapd->msg_ctx, MSG_INFO, DPP_EVENT_FAIL
++				"No response from PKEX peer");
++			dpp_pkex_free(pkex);
++			hapd->dpp_pkex = NULL;
++			return;
++		}
++		pkex->exch_req_tries = 0;
++	}
++
++	pkex->exch_req_tries++;
++	wpa_printf(MSG_DEBUG, "DPP: Retransmit PKEX Exchange Request (try %u)",
++		   pkex->exch_req_tries);
++	wpa_msg(hapd->msg_ctx, MSG_INFO, DPP_EVENT_TX "dst=" MACSTR
++		" freq=%u type=%d",
++		MAC2STR(broadcast), pkex->freq,
++		pkex->v2 ? DPP_PA_PKEX_EXCHANGE_REQ :
++		DPP_PA_PKEX_V1_EXCHANGE_REQ);
++	hostapd_drv_send_action(hapd, pkex->freq, pkex->exch_req_wait_time,
++				broadcast,
++				wpabuf_head(pkex->exchange_req),
++				wpabuf_len(pkex->exchange_req));
++}
++
++
++static void hostapd_dpp_pkex_tx_status(struct hostapd_data *hapd, const u8 *dst,
++				       const u8 *data, size_t data_len, int ok)
++{
++	struct dpp_pkex *pkex = hapd->dpp_pkex;
++
++	if (pkex->failed) {
++		wpa_printf(MSG_DEBUG,
++			   "DPP: Terminate PKEX exchange due to an earlier error");
++		if (pkex->t > pkex->own_bi->pkex_t)
++			pkex->own_bi->pkex_t = pkex->t;
++		dpp_pkex_free(pkex);
++		hapd->dpp_pkex = NULL;
++		return;
++	}
++
++	if (pkex->exch_req_wait_time && pkex->exchange_req) {
++		/* Wait for PKEX Exchange Response frame and retry request if
++		 * no response is seen. */
++		eloop_cancel_timeout(hostapd_dpp_pkex_retry_timeout, hapd,
++				     NULL);
++		eloop_register_timeout(pkex->exch_req_wait_time / 1000,
++				       (pkex->exch_req_wait_time % 1000) * 1000,
++				       hostapd_dpp_pkex_retry_timeout, hapd,
++				       NULL);
++	}
++}
++
++
+ void hostapd_dpp_tx_status(struct hostapd_data *hapd, const u8 *dst,
+ 			   const u8 *data, size_t data_len, int ok)
+ {
+@@ -227,6 +384,11 @@ void hostapd_dpp_tx_status(struct hostapd_data *hapd, const u8 *dst,
+ 		" result=%s", MAC2STR(dst), ok ? "SUCCESS" : "FAILED");
+ 
+ 	if (!hapd->dpp_auth) {
++		if (hapd->dpp_pkex) {
++			hostapd_dpp_pkex_tx_status(hapd, dst, data, data_len,
++						   ok);
++			return;
++		}
+ 		wpa_printf(MSG_DEBUG,
+ 			   "DPP: Ignore TX status since there is no ongoing authentication exchange");
+ 		return;
+@@ -1783,6 +1945,9 @@ hostapd_dpp_rx_pkex_exchange_resp(struct hostapd_data *hapd, const u8 *src,
+ 		return;
+ 	}
+ 
++	eloop_cancel_timeout(hostapd_dpp_pkex_retry_timeout, hapd, NULL);
++	hapd->dpp_pkex->exch_req_wait_time = 0;
++
+ 	msg = dpp_pkex_rx_exchange_resp(hapd->dpp_pkex, src, buf, len);
+ 	if (!msg) {
+ 		wpa_printf(MSG_DEBUG, "DPP: Failed to process the response");
+@@ -2172,26 +2337,14 @@ int hostapd_dpp_pkex_add(struct hostapd_data *hapd, const char *cmd)
+ 		return -1;
+ 
+ 	if (os_strstr(cmd, " init=1") || os_strstr(cmd, " init=2")) {
+-		struct wpabuf *msg;
++#ifdef CONFIG_DPP3
++		bool v2 = true;
++#else /* CONFIG_DPP3 */
+ 		bool v2 = os_strstr(cmd, " init=2") != NULL;
++#endif /* CONFIG_DPP3 */
+ 
+-		wpa_printf(MSG_DEBUG, "DPP: Initiating PKEX");
+-		dpp_pkex_free(hapd->dpp_pkex);
+-		hapd->dpp_pkex = dpp_pkex_init(hapd->msg_ctx, own_bi,
+-					       hapd->own_addr,
+-					       hapd->dpp_pkex_identifier,
+-					       hapd->dpp_pkex_code, v2);
+-		if (!hapd->dpp_pkex)
++		if (hostapd_dpp_pkex_init(hapd, v2) < 0)
+ 			return -1;
+-
+-		msg = hapd->dpp_pkex->exchange_req;
+-		/* TODO: Which channel to use? */
+-		wpa_msg(hapd->msg_ctx, MSG_INFO, DPP_EVENT_TX "dst=" MACSTR
+-			" freq=%u type=%d", MAC2STR(broadcast), 2437,
+-			v2 ? DPP_PA_PKEX_EXCHANGE_REQ :
+-			DPP_PA_PKEX_V1_EXCHANGE_REQ);
+-		hostapd_drv_send_action(hapd, 2437, 0, broadcast,
+-					wpabuf_head(msg), wpabuf_len(msg));
+ 	}
+ 
+ 	/* TODO: Support multiple PKEX info entries */
+@@ -2319,6 +2472,7 @@ void hostapd_dpp_deinit(struct hostapd_data *hapd)
+ #endif /* CONFIG_TESTING_OPTIONS */
+ 	if (!hapd->dpp_init_done)
+ 		return;
++	eloop_cancel_timeout(hostapd_dpp_pkex_retry_timeout, hapd, NULL);
+ 	eloop_cancel_timeout(hostapd_dpp_reply_wait_timeout, hapd, NULL);
+ 	eloop_cancel_timeout(hostapd_dpp_auth_conf_wait_timeout, hapd, NULL);
+ 	eloop_cancel_timeout(hostapd_dpp_init_timeout, hapd, NULL);
+-- 
+2.40.0
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0002.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0002.patch
new file mode 100644
index 0000000000..9d39f18f43
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0002.patch
@@ -0,0 +1,139 @@
+From 80213629981a21825e4688fde1b590e4c4d4bcea Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <quic_jouni@quicinc.com>
+Date: Mon, 24 Jan 2022 20:21:24 +0200
+Subject: [PATCH] DPP3: Start with PKEXv2 and fall back to v1
+
+Use automatic PKEX version negotiation as the initiator by starting with
+PKEXv2 and if no response is received, trying again with PKEXv1. For
+now, this is enabled only in wpa_supplicant CONFIG_DPP3=y builds.
+
+Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
+
+CVE: CVE-2022-37660
+
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=80213629981a21825e4688fde1b590e4c4d4bcea]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ wpa_supplicant/dpp_supplicant.c | 81 +++++++++++++++++++++------------
+ 1 file changed, 52 insertions(+), 29 deletions(-)
+
+diff --git a/wpa_supplicant/dpp_supplicant.c b/wpa_supplicant/dpp_supplicant.c
+index 584654a..43c85d3 100644
+--- a/wpa_supplicant/dpp_supplicant.c
++++ b/wpa_supplicant/dpp_supplicant.c
+@@ -2557,6 +2557,45 @@ static int wpas_dpp_pkex_next_channel(struct wpa_supplicant *wpa_s,
+ }
+ 
+ 
++static int wpas_dpp_pkex_init(struct wpa_supplicant *wpa_s, bool v2)
++{
++	struct dpp_pkex *pkex;
++	struct wpabuf *msg;
++	unsigned int wait_time;
++
++	wpa_printf(MSG_DEBUG, "DPP: Initiating PKEXv%d", v2 ? 2 : 1);
++	dpp_pkex_free(wpa_s->dpp_pkex);
++	wpa_s->dpp_pkex = dpp_pkex_init(wpa_s, wpa_s->dpp_pkex_bi,
++					wpa_s->own_addr,
++					wpa_s->dpp_pkex_identifier,
++					wpa_s->dpp_pkex_code, v2);
++	pkex = wpa_s->dpp_pkex;
++	if (!pkex)
++		return -1;
++
++	msg = pkex->exchange_req;
++	wait_time = wpa_s->max_remain_on_chan;
++	if (wait_time > 2000)
++		wait_time = 2000;
++	pkex->freq = 2437;
++	wpa_msg(wpa_s, MSG_INFO, DPP_EVENT_TX "dst=" MACSTR
++		" freq=%u type=%d",
++		MAC2STR(broadcast), pkex->freq,
++		v2 ? DPP_PA_PKEX_EXCHANGE_REQ :
++		DPP_PA_PKEX_V1_EXCHANGE_REQ);
++	offchannel_send_action(wpa_s, pkex->freq, broadcast,
++			       wpa_s->own_addr, broadcast,
++			       wpabuf_head(msg), wpabuf_len(msg),
++			       wait_time, wpas_dpp_tx_pkex_status, 0);
++	if (wait_time == 0)
++		wait_time = 2000;
++	pkex->exch_req_wait_time = wait_time;
++	pkex->exch_req_tries = 1;
++
++	return 0;
++}
++
++
+ static void wpas_dpp_pkex_retry_timeout(void *eloop_ctx, void *timeout_ctx)
+ {
+ 	struct wpa_supplicant *wpa_s = eloop_ctx;
+@@ -2566,6 +2605,14 @@ static void wpas_dpp_pkex_retry_timeout(void *eloop_ctx, void *timeout_ctx)
+ 		return;
+ 	if (pkex->exch_req_tries >= 5) {
+ 		if (wpas_dpp_pkex_next_channel(wpa_s, pkex) < 0) {
++#ifdef CONFIG_DPP3
++			if (pkex->v2) {
++				wpa_printf(MSG_DEBUG,
++					   "DPP: Fall back to PKEXv1");
++				wpas_dpp_pkex_init(wpa_s, false);
++				return;
++			}
++#endif /* CONFIG_DPP3 */
+ 			wpa_msg(wpa_s, MSG_INFO, DPP_EVENT_FAIL
+ 				"No response from PKEX peer");
+ 			dpp_pkex_free(pkex);
+@@ -3271,7 +3318,6 @@ int wpas_dpp_pkex_add(struct wpa_supplicant *wpa_s, const char *cmd)
+ {
+ 	struct dpp_bootstrap_info *own_bi;
+ 	const char *pos, *end;
+-	unsigned int wait_time;
+ 
+ 	pos = os_strstr(cmd, " own=");
+ 	if (!pos)
+@@ -3315,37 +3361,14 @@ int wpas_dpp_pkex_add(struct wpa_supplicant *wpa_s, const char *cmd)
+ 		return -1;
+ 
+ 	if (os_strstr(cmd, " init=1") || os_strstr(cmd, " init=2")) {
+-		struct dpp_pkex *pkex;
+-		struct wpabuf *msg;
++#ifdef CONFIG_DPP3
++		bool v2 = true;
++#else /* CONFIG_DPP3 */
+ 		bool v2 = os_strstr(cmd, " init=2") != NULL;
++#endif /* CONFIG_DPP3 */
+ 
+-		wpa_printf(MSG_DEBUG, "DPP: Initiating PKEX");
+-		dpp_pkex_free(wpa_s->dpp_pkex);
+-		wpa_s->dpp_pkex = dpp_pkex_init(wpa_s, own_bi, wpa_s->own_addr,
+-						wpa_s->dpp_pkex_identifier,
+-						wpa_s->dpp_pkex_code, v2);
+-		pkex = wpa_s->dpp_pkex;
+-		if (!pkex)
++		if (wpas_dpp_pkex_init(wpa_s, v2) < 0)
+ 			return -1;
+-
+-		msg = pkex->exchange_req;
+-		wait_time = wpa_s->max_remain_on_chan;
+-		if (wait_time > 2000)
+-			wait_time = 2000;
+-		pkex->freq = 2437;
+-		wpa_msg(wpa_s, MSG_INFO, DPP_EVENT_TX "dst=" MACSTR
+-			" freq=%u type=%d",
+-			MAC2STR(broadcast), pkex->freq,
+-			v2 ? DPP_PA_PKEX_EXCHANGE_REQ :
+-			DPP_PA_PKEX_V1_EXCHANGE_REQ);
+-		offchannel_send_action(wpa_s, pkex->freq, broadcast,
+-				       wpa_s->own_addr, broadcast,
+-				       wpabuf_head(msg), wpabuf_len(msg),
+-				       wait_time, wpas_dpp_tx_pkex_status, 0);
+-		if (wait_time == 0)
+-			wait_time = 2000;
+-		pkex->exch_req_wait_time = wait_time;
+-		pkex->exch_req_tries = 1;
+ 	}
+ 
+ 	/* TODO: Support multiple PKEX info entries */
+-- 
+2.40.0
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0003.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0003.patch
new file mode 100644
index 0000000000..7334720dfb
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0003.patch
@@ -0,0 +1,196 @@
+From bdcccbc2755dd1a75731496782e02b5435fb9534 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <quic_jouni@quicinc.com>
+Date: Tue, 25 Jan 2022 20:06:49 +0200
+Subject: [PATCH] DPP: Change PKEX version configuration design
+
+Use a separate ver=<1|2> parameter to DPP_PKEX_ADD instead of
+overloading init=1 with version indication. This allows additional
+options for forcing v1-only and v2-only in addition to automatic mode
+(start with v2 and fall back to v1, if needed).
+
+Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
+
+CVE: CVE-2022-37660
+
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=bdcccbc2755dd1a75731496782e02b5435fb9534]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ src/ap/dpp_hostapd.c            | 37 ++++++++++++++++++++++++++-------
+ src/common/dpp.h                |  1 +
+ wpa_supplicant/dpp_supplicant.c | 37 ++++++++++++++++++++++++++-------
+ 3 files changed, 61 insertions(+), 14 deletions(-)
+
+diff --git a/src/ap/dpp_hostapd.c b/src/ap/dpp_hostapd.c
+index 6c30ba3..fdfdcf9 100644
+--- a/src/ap/dpp_hostapd.c
++++ b/src/ap/dpp_hostapd.c
+@@ -272,11 +272,19 @@ static int hostapd_dpp_pkex_next_channel(struct hostapd_data *hapd,
+ }
+ 
+ 
+-static int hostapd_dpp_pkex_init(struct hostapd_data *hapd, bool v2)
++enum hostapd_dpp_pkex_ver {
++	PKEX_VER_AUTO,
++	PKEX_VER_ONLY_1,
++	PKEX_VER_ONLY_2,
++};
++
++static int hostapd_dpp_pkex_init(struct hostapd_data *hapd,
++				 enum hostapd_dpp_pkex_ver ver)
+ {
+ 	struct dpp_pkex *pkex;
+ 	struct wpabuf *msg;
+ 	unsigned int wait_time;
++	bool v2 = ver != PKEX_VER_ONLY_1;
+ 
+ 	wpa_printf(MSG_DEBUG, "DPP: Initiating PKEXv%d", v2 ? 2 : 1);
+ 	dpp_pkex_free(hapd->dpp_pkex);
+@@ -287,6 +295,7 @@ static int hostapd_dpp_pkex_init(struct hostapd_data *hapd, bool v2)
+ 	pkex = hapd->dpp_pkex;
+ 	if (!pkex)
+ 		return -1;
++	pkex->forced_ver = ver != PKEX_VER_AUTO;
+ 
+ 	msg = hapd->dpp_pkex->exchange_req;
+ 	wait_time = 2000; /* TODO: hapd->max_remain_on_chan; */
+@@ -314,10 +323,10 @@ static void hostapd_dpp_pkex_retry_timeout(void *eloop_ctx, void *timeout_ctx)
+ 	if (pkex->exch_req_tries >= 5) {
+ 		if (hostapd_dpp_pkex_next_channel(hapd, pkex) < 0) {
+ #ifdef CONFIG_DPP3
+-			if (pkex->v2) {
++			if (pkex->v2 && !pkex->forced_ver) {
+ 				wpa_printf(MSG_DEBUG,
+ 					   "DPP: Fall back to PKEXv1");
+-				hostapd_dpp_pkex_init(hapd, false);
++				hostapd_dpp_pkex_init(hapd, PKEX_VER_ONLY_1);
+ 				return;
+ 			}
+ #endif /* CONFIG_DPP3 */
+@@ -2336,14 +2345,28 @@ int hostapd_dpp_pkex_add(struct hostapd_data *hapd, const char *cmd)
+ 	if (!hapd->dpp_pkex_code)
+ 		return -1;
+ 
+-	if (os_strstr(cmd, " init=1") || os_strstr(cmd, " init=2")) {
++	if (os_strstr(cmd, " init=1")) {
+ #ifdef CONFIG_DPP3
+-		bool v2 = true;
++		enum hostapd_dpp_pkex_ver ver = PKEX_VER_AUTO;
+ #else /* CONFIG_DPP3 */
+-		bool v2 = os_strstr(cmd, " init=2") != NULL;
++		enum hostapd_dpp_pkex_ver ver = PKEX_VER_ONLY_1;
+ #endif /* CONFIG_DPP3 */
+ 
+-		if (hostapd_dpp_pkex_init(hapd, v2) < 0)
++		pos = os_strstr(cmd, " ver=");
++		if (pos) {
++			int v;
++
++			pos += 5;
++			v = atoi(pos);
++			if (v == 1)
++				ver = PKEX_VER_ONLY_1;
++			else if (v == 2)
++				ver = PKEX_VER_ONLY_2;
++			else
++				return -1;
++		}
++
++		if (hostapd_dpp_pkex_init(hapd, ver) < 0)
+ 			return -1;
+ 	}
+ 
+diff --git a/src/common/dpp.h b/src/common/dpp.h
+index 8d62a0e..bfea446 100644
+--- a/src/common/dpp.h
++++ b/src/common/dpp.h
+@@ -177,6 +177,7 @@ struct dpp_pkex {
+ 	unsigned int exchange_done:1;
+ 	unsigned int failed:1;
+ 	unsigned int v2:1;
++	unsigned int forced_ver:1;
+ 	struct dpp_bootstrap_info *own_bi;
+ 	u8 own_mac[ETH_ALEN];
+ 	u8 peer_mac[ETH_ALEN];
+diff --git a/wpa_supplicant/dpp_supplicant.c b/wpa_supplicant/dpp_supplicant.c
+index 43c85d3..61b300f 100644
+--- a/wpa_supplicant/dpp_supplicant.c
++++ b/wpa_supplicant/dpp_supplicant.c
+@@ -2557,11 +2557,19 @@ static int wpas_dpp_pkex_next_channel(struct wpa_supplicant *wpa_s,
+ }
+ 
+ 
+-static int wpas_dpp_pkex_init(struct wpa_supplicant *wpa_s, bool v2)
++enum wpas_dpp_pkex_ver {
++	PKEX_VER_AUTO,
++	PKEX_VER_ONLY_1,
++	PKEX_VER_ONLY_2,
++};
++
++static int wpas_dpp_pkex_init(struct wpa_supplicant *wpa_s,
++			      enum wpas_dpp_pkex_ver ver)
+ {
+ 	struct dpp_pkex *pkex;
+ 	struct wpabuf *msg;
+ 	unsigned int wait_time;
++	bool v2 = ver != PKEX_VER_ONLY_1;
+ 
+ 	wpa_printf(MSG_DEBUG, "DPP: Initiating PKEXv%d", v2 ? 2 : 1);
+ 	dpp_pkex_free(wpa_s->dpp_pkex);
+@@ -2572,6 +2580,7 @@ static int wpas_dpp_pkex_init(struct wpa_supplicant *wpa_s, bool v2)
+ 	pkex = wpa_s->dpp_pkex;
+ 	if (!pkex)
+ 		return -1;
++	pkex->forced_ver = ver != PKEX_VER_AUTO;
+ 
+ 	msg = pkex->exchange_req;
+ 	wait_time = wpa_s->max_remain_on_chan;
+@@ -2606,10 +2615,10 @@ static void wpas_dpp_pkex_retry_timeout(void *eloop_ctx, void *timeout_ctx)
+ 	if (pkex->exch_req_tries >= 5) {
+ 		if (wpas_dpp_pkex_next_channel(wpa_s, pkex) < 0) {
+ #ifdef CONFIG_DPP3
+-			if (pkex->v2) {
++			if (pkex->v2 && !pkex->forced_ver) {
+ 				wpa_printf(MSG_DEBUG,
+ 					   "DPP: Fall back to PKEXv1");
+-				wpas_dpp_pkex_init(wpa_s, false);
++				wpas_dpp_pkex_init(wpa_s, PKEX_VER_ONLY_1);
+ 				return;
+ 			}
+ #endif /* CONFIG_DPP3 */
+@@ -3360,14 +3369,28 @@ int wpas_dpp_pkex_add(struct wpa_supplicant *wpa_s, const char *cmd)
+ 	if (!wpa_s->dpp_pkex_code)
+ 		return -1;
+ 
+-	if (os_strstr(cmd, " init=1") || os_strstr(cmd, " init=2")) {
++	if (os_strstr(cmd, " init=1")) {
+ #ifdef CONFIG_DPP3
+-		bool v2 = true;
++		enum wpas_dpp_pkex_ver ver = PKEX_VER_AUTO;
+ #else /* CONFIG_DPP3 */
+-		bool v2 = os_strstr(cmd, " init=2") != NULL;
++		enum wpas_dpp_pkex_ver ver = PKEX_VER_ONLY_1;
+ #endif /* CONFIG_DPP3 */
+ 
+-		if (wpas_dpp_pkex_init(wpa_s, v2) < 0)
++		pos = os_strstr(cmd, " ver=");
++		if (pos) {
++			int v;
++
++			pos += 5;
++			v = atoi(pos);
++			if (v == 1)
++				ver = PKEX_VER_ONLY_1;
++			else if (v == 2)
++				ver = PKEX_VER_ONLY_2;
++			else
++				return -1;
++		}
++
++		if (wpas_dpp_pkex_init(wpa_s, ver) < 0)
+ 			return -1;
+ 	}
+ 
+-- 
+2.40.0
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0004.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0004.patch
new file mode 100644
index 0000000000..0077bb5aa3
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0004.patch
@@ -0,0 +1,941 @@
+From d7be749335f2585658cf98c4f0e7d6cd5ac06865 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@qca.qualcomm.com>
+Date: Tue, 25 Jan 2022 00:35:36 +0200
+Subject: [PATCH] DPP3: PKEX over TCP
+
+Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
+
+CVE: CVE-2022-37660
+
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=d7be749335f2585658cf98c4f0e7d6cd5ac06865]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ src/ap/dpp_hostapd.c            | 155 ++++++++++++++--
+ src/common/dpp.h                |  13 ++
+ src/common/dpp_pkex.c           |  18 +-
+ src/common/dpp_tcp.c            | 308 +++++++++++++++++++++++++++++++-
+ wpa_supplicant/dpp_supplicant.c | 122 ++++++++++++-
+ 5 files changed, 580 insertions(+), 36 deletions(-)
+
+diff --git a/src/ap/dpp_hostapd.c b/src/ap/dpp_hostapd.c
+index fdfdcf9..d956be9 100644
+--- a/src/ap/dpp_hostapd.c
++++ b/src/ap/dpp_hostapd.c
+@@ -28,12 +28,16 @@ static void hostapd_dpp_auth_conf_wait_timeout(void *eloop_ctx,
+ static void hostapd_dpp_auth_success(struct hostapd_data *hapd, int initiator);
+ static void hostapd_dpp_init_timeout(void *eloop_ctx, void *timeout_ctx);
+ static int hostapd_dpp_auth_init_next(struct hostapd_data *hapd);
++static void hostapd_dpp_set_testing_options(struct hostapd_data *hapd,
++					    struct dpp_authentication *auth);
+ #ifdef CONFIG_DPP2
+ static void hostapd_dpp_reconfig_reply_wait_timeout(void *eloop_ctx,
+ 						    void *timeout_ctx);
+ static void hostapd_dpp_handle_config_obj(struct hostapd_data *hapd,
+ 					  struct dpp_authentication *auth,
+ 					  struct dpp_config_obj *conf);
++static int hostapd_dpp_process_conf_obj(void *ctx,
++					struct dpp_authentication *auth);
+ #endif /* CONFIG_DPP2 */
+ 
+ static const u8 broadcast[ETH_ALEN] = { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
+@@ -272,6 +276,75 @@ static int hostapd_dpp_pkex_next_channel(struct hostapd_data *hapd,
+ }
+ 
+ 
++#ifdef CONFIG_DPP2
++static int hostapd_dpp_pkex_done(void *ctx, void *conn,
++				 struct dpp_bootstrap_info *peer_bi)
++{
++	struct hostapd_data *hapd = ctx;
++	const char *cmd = hapd->dpp_pkex_auth_cmd;
++	const char *pos;
++	u8 allowed_roles = DPP_CAPAB_CONFIGURATOR;
++	struct dpp_bootstrap_info *own_bi = NULL;
++	struct dpp_authentication *auth;
++
++	if (!cmd)
++		cmd = "";
++	wpa_printf(MSG_DEBUG, "DPP: Start authentication after PKEX (cmd: %s)",
++		   cmd);
++
++	pos = os_strstr(cmd, " own=");
++	if (pos) {
++		pos += 5;
++		own_bi = dpp_bootstrap_get_id(hapd->iface->interfaces->dpp,
++					      atoi(pos));
++		if (!own_bi) {
++			wpa_printf(MSG_INFO,
++				   "DPP: Could not find bootstrapping info for the identified local entry");
++			return -1;
++		}
++
++		if (peer_bi->curve != own_bi->curve) {
++			wpa_printf(MSG_INFO,
++				   "DPP: Mismatching curves in bootstrapping info (peer=%s own=%s)",
++				   peer_bi->curve->name, own_bi->curve->name);
++			return -1;
++		}
++	}
++
++	pos = os_strstr(cmd, " role=");
++	if (pos) {
++		pos += 6;
++		if (os_strncmp(pos, "configurator", 12) == 0)
++			allowed_roles = DPP_CAPAB_CONFIGURATOR;
++		else if (os_strncmp(pos, "enrollee", 8) == 0)
++			allowed_roles = DPP_CAPAB_ENROLLEE;
++		else if (os_strncmp(pos, "either", 6) == 0)
++			allowed_roles = DPP_CAPAB_CONFIGURATOR |
++				DPP_CAPAB_ENROLLEE;
++		else
++			return -1;
++	}
++
++	auth = dpp_auth_init(hapd->iface->interfaces->dpp, hapd->msg_ctx,
++			     peer_bi, own_bi, allowed_roles, 0,
++			     hapd->iface->hw_features,
++			     hapd->iface->num_hw_features);
++	if (!auth)
++		return -1;
++
++	hostapd_dpp_set_testing_options(hapd, auth);
++	if (dpp_set_configurator(auth, cmd) < 0) {
++		dpp_auth_deinit(auth);
++		return -1;
++	}
++
++	return dpp_tcp_auth(hapd->iface->interfaces->dpp, conn, auth,
++			    hapd->conf->dpp_name, DPP_NETROLE_AP,
++			    hostapd_dpp_process_conf_obj);
++}
++#endif /* CONFIG_DPP2 */
++
++
+ enum hostapd_dpp_pkex_ver {
+ 	PKEX_VER_AUTO,
+ 	PKEX_VER_ONLY_1,
+@@ -279,7 +352,9 @@ enum hostapd_dpp_pkex_ver {
+ };
+ 
+ static int hostapd_dpp_pkex_init(struct hostapd_data *hapd,
+-				 enum hostapd_dpp_pkex_ver ver)
++				 enum hostapd_dpp_pkex_ver ver,
++				 const struct hostapd_ip_addr *ipaddr,
++				 int tcp_port)
+ {
+ 	struct dpp_pkex *pkex;
+ 	struct wpabuf *msg;
+@@ -288,15 +363,26 @@ static int hostapd_dpp_pkex_init(struct hostapd_data *hapd,
+ 
+ 	wpa_printf(MSG_DEBUG, "DPP: Initiating PKEXv%d", v2 ? 2 : 1);
+ 	dpp_pkex_free(hapd->dpp_pkex);
+-	hapd->dpp_pkex = dpp_pkex_init(hapd->msg_ctx, hapd->dpp_pkex_bi,
+-				       hapd->own_addr,
+-				       hapd->dpp_pkex_identifier,
+-				       hapd->dpp_pkex_code, v2);
+-	pkex = hapd->dpp_pkex;
++	hapd->dpp_pkex = NULL;
++	pkex = dpp_pkex_init(hapd->msg_ctx, hapd->dpp_pkex_bi, hapd->own_addr,
++			     hapd->dpp_pkex_identifier,
++			     hapd->dpp_pkex_code, v2);
+ 	if (!pkex)
+ 		return -1;
+ 	pkex->forced_ver = ver != PKEX_VER_AUTO;
+ 
++	if (ipaddr) {
++#ifdef CONFIG_DPP2
++		return dpp_tcp_pkex_init(hapd->iface->interfaces->dpp, pkex,
++					 ipaddr, tcp_port,
++					 hapd->msg_ctx, hapd,
++					 hostapd_dpp_pkex_done);
++#else /* CONFIG_DPP2 */
++		return -1;
++#endif /* CONFIG_DPP2 */
++	}
++
++	hapd->dpp_pkex = pkex;
+ 	msg = hapd->dpp_pkex->exchange_req;
+ 	wait_time = 2000; /* TODO: hapd->max_remain_on_chan; */
+ 	pkex->freq = 2437;
+@@ -326,7 +412,8 @@ static void hostapd_dpp_pkex_retry_timeout(void *eloop_ctx, void *timeout_ctx)
+ 			if (pkex->v2 && !pkex->forced_ver) {
+ 				wpa_printf(MSG_DEBUG,
+ 					   "DPP: Fall back to PKEXv1");
+-				hostapd_dpp_pkex_init(hapd, PKEX_VER_ONLY_1);
++				hostapd_dpp_pkex_init(hapd, PKEX_VER_ONLY_1,
++						      NULL, 0);
+ 				return;
+ 			}
+ #endif /* CONFIG_DPP3 */
+@@ -1883,7 +1970,7 @@ static void hostapd_dpp_rx_peer_disc_req(struct hostapd_data *hapd,
+ 
+ static void
+ hostapd_dpp_rx_pkex_exchange_req(struct hostapd_data *hapd, const u8 *src,
+-				 const u8 *buf, size_t len,
++				 const u8 *hdr, const u8 *buf, size_t len,
+ 				 unsigned int freq, bool v2)
+ {
+ 	struct wpabuf *msg;
+@@ -1897,14 +1984,14 @@ hostapd_dpp_rx_pkex_exchange_req(struct hostapd_data *hapd, const u8 *src,
+ 	if (!hapd->dpp_pkex_code || !hapd->dpp_pkex_bi) {
+ 		wpa_printf(MSG_DEBUG,
+ 			   "DPP: No PKEX code configured - ignore request");
+-		return;
++		goto try_relay;
+ 	}
+ 
+ 	if (hapd->dpp_pkex) {
+ 		/* TODO: Support parallel operations */
+ 		wpa_printf(MSG_DEBUG,
+ 			   "DPP: Already in PKEX session - ignore new request");
+-		return;
++		goto try_relay;
+ 	}
+ 
+ 	hapd->dpp_pkex = dpp_pkex_rx_exchange_req(hapd->msg_ctx,
+@@ -1916,7 +2003,7 @@ hostapd_dpp_rx_pkex_exchange_req(struct hostapd_data *hapd, const u8 *src,
+ 	if (!hapd->dpp_pkex) {
+ 		wpa_printf(MSG_DEBUG,
+ 			   "DPP: Failed to process the request - ignore it");
+-		return;
++		goto try_relay;
+ 	}
+ 
+ 	msg = hapd->dpp_pkex->exchange_resp;
+@@ -1933,6 +2020,17 @@ hostapd_dpp_rx_pkex_exchange_req(struct hostapd_data *hapd, const u8 *src,
+ 		dpp_pkex_free(hapd->dpp_pkex);
+ 		hapd->dpp_pkex = NULL;
+ 	}
++
++	return;
++
++try_relay:
++#ifdef CONFIG_DPP2
++	if (v2)
++		dpp_relay_rx_action(hapd->iface->interfaces->dpp,
++				    src, hdr, buf, len, freq, NULL, NULL, hapd);
++#else /* CONFIG_DPP2 */
++	wpa_printf(MSG_DEBUG, "DPP: No relay functionality included - skip");
++#endif /* CONFIG_DPP2 */
+ }
+ 
+ 
+@@ -2132,12 +2230,12 @@ void hostapd_dpp_rx_action(struct hostapd_data *hapd, const u8 *src,
+ 		/* This is for PKEXv2, but for now, process only with
+ 		 * CONFIG_DPP3 to avoid issues with a capability that has not
+ 		 * been tested with other implementations. */
+-		hostapd_dpp_rx_pkex_exchange_req(hapd, src, buf, len, freq,
++		hostapd_dpp_rx_pkex_exchange_req(hapd, src, hdr, buf, len, freq,
+ 						 true);
+ 		break;
+ #endif /* CONFIG_DPP3 */
+ 	case DPP_PA_PKEX_V1_EXCHANGE_REQ:
+-		hostapd_dpp_rx_pkex_exchange_req(hapd, src, buf, len, freq,
++		hostapd_dpp_rx_pkex_exchange_req(hapd, src, hdr, buf, len, freq,
+ 						 false);
+ 		break;
+ 	case DPP_PA_PKEX_EXCHANGE_RESP:
+@@ -2303,6 +2401,29 @@ int hostapd_dpp_pkex_add(struct hostapd_data *hapd, const char *cmd)
+ {
+ 	struct dpp_bootstrap_info *own_bi;
+ 	const char *pos, *end;
++	int tcp_port = DPP_TCP_PORT;
++	struct hostapd_ip_addr *ipaddr = NULL;
++#ifdef CONFIG_DPP2
++	struct hostapd_ip_addr ipaddr_buf;
++	char *addr;
++
++	pos = os_strstr(cmd, " tcp_port=");
++	if (pos) {
++		pos += 10;
++		tcp_port = atoi(pos);
++	}
++
++	addr = get_param(cmd, " tcp_addr=");
++	if (addr) {
++		int res;
++
++		res = hostapd_parse_ip_addr(addr, &ipaddr_buf);
++		os_free(addr);
++		if (res)
++			return -1;
++		ipaddr = &ipaddr_buf;
++	}
++#endif /* CONFIG_DPP2 */
+ 
+ 	pos = os_strstr(cmd, " own=");
+ 	if (!pos)
+@@ -2366,8 +2487,14 @@ int hostapd_dpp_pkex_add(struct hostapd_data *hapd, const char *cmd)
+ 				return -1;
+ 		}
+ 
+-		if (hostapd_dpp_pkex_init(hapd, ver) < 0)
++		if (hostapd_dpp_pkex_init(hapd, ver, ipaddr, tcp_port) < 0)
+ 			return -1;
++	} else {
++#ifdef CONFIG_DPP2
++		dpp_controller_pkex_add(hapd->iface->interfaces->dpp, own_bi,
++					hapd->dpp_pkex_code,
++					hapd->dpp_pkex_identifier);
++#endif /* CONFIG_DPP2 */
+ 	}
+ 
+ 	/* TODO: Support multiple PKEX info entries */
+diff --git a/src/common/dpp.h b/src/common/dpp.h
+index bfea446..ca33fe3 100644
+--- a/src/common/dpp.h
++++ b/src/common/dpp.h
+@@ -550,6 +550,9 @@ int dpp_auth_conf_rx(struct dpp_authentication *auth, const u8 *hdr,
+ 		     const u8 *attr_start, size_t attr_len);
+ int dpp_notify_new_qr_code(struct dpp_authentication *auth,
+ 			   struct dpp_bootstrap_info *peer_bi);
++void dpp_controller_pkex_add(struct dpp_global *dpp,
++			     struct dpp_bootstrap_info *bi,
++			     const char *code, const char *identifier);
+ struct dpp_configuration * dpp_configuration_alloc(const char *type);
+ int dpp_akm_psk(enum dpp_akm akm);
+ int dpp_akm_sae(enum dpp_akm akm);
+@@ -688,12 +691,22 @@ struct dpp_authentication * dpp_controller_get_auth(struct dpp_global *dpp,
+ 						    unsigned int id);
+ void dpp_controller_new_qr_code(struct dpp_global *dpp,
+ 				struct dpp_bootstrap_info *bi);
++int dpp_tcp_pkex_init(struct dpp_global *dpp, struct dpp_pkex *pkex,
++		      const struct hostapd_ip_addr *addr, int port,
++		      void *msg_ctx, void *cb_ctx,
++		      int (*pkex_done)(void *ctx, void *conn,
++				       struct dpp_bootstrap_info *bi));
+ int dpp_tcp_init(struct dpp_global *dpp, struct dpp_authentication *auth,
+ 		 const struct hostapd_ip_addr *addr, int port,
+ 		 const char *name, enum dpp_netrole netrole, void *msg_ctx,
+ 		 void *cb_ctx,
+ 		 int (*process_conf_obj)(void *ctx,
+ 					 struct dpp_authentication *auth));
++int dpp_tcp_auth(struct dpp_global *dpp, void *_conn,
++		 struct dpp_authentication *auth, const char *name,
++		 enum dpp_netrole netrole,
++		 int (*process_conf_obj)(void *ctx,
++					 struct dpp_authentication *auth));
+ 
+ struct wpabuf * dpp_build_presence_announcement(struct dpp_bootstrap_info *bi);
+ void dpp_notify_chirp_received(void *msg_ctx, int id, const u8 *src,
+diff --git a/src/common/dpp_pkex.c b/src/common/dpp_pkex.c
+index 38349fa..72084d9 100644
+--- a/src/common/dpp_pkex.c
++++ b/src/common/dpp_pkex.c
+@@ -469,8 +469,10 @@ struct dpp_pkex * dpp_pkex_rx_exchange_req(void *msg_ctx,
+ 	pkex->t = bi->pkex_t;
+ 	pkex->msg_ctx = msg_ctx;
+ 	pkex->own_bi = bi;
+-	os_memcpy(pkex->own_mac, own_mac, ETH_ALEN);
+-	os_memcpy(pkex->peer_mac, peer_mac, ETH_ALEN);
++	if (own_mac)
++		os_memcpy(pkex->own_mac, own_mac, ETH_ALEN);
++	if (peer_mac)
++		os_memcpy(pkex->peer_mac, peer_mac, ETH_ALEN);
+ 	if (identifier) {
+ 		pkex->identifier = os_strdup(identifier);
+ 		if (!pkex->identifier)
+@@ -742,7 +744,8 @@ struct wpabuf * dpp_pkex_rx_exchange_resp(struct dpp_pkex *pkex,
+ 	}
+ #endif /* CONFIG_DPP2 */
+ 
+-	os_memcpy(pkex->peer_mac, peer_mac, ETH_ALEN);
++	if (peer_mac)
++		os_memcpy(pkex->peer_mac, peer_mac, ETH_ALEN);
+ 
+ 	attr_status = dpp_get_attr(buf, buflen, DPP_ATTR_STATUS,
+ 				   &attr_status_len);
+@@ -1341,9 +1344,12 @@ dpp_pkex_finish(struct dpp_global *dpp, struct dpp_pkex *pkex, const u8 *peer,
+ 		return NULL;
+ 	bi->id = dpp_next_id(dpp);
+ 	bi->type = DPP_BOOTSTRAP_PKEX;
+-	os_memcpy(bi->mac_addr, peer, ETH_ALEN);
+-	bi->num_freq = 1;
+-	bi->freq[0] = freq;
++	if (peer)
++		os_memcpy(bi->mac_addr, peer, ETH_ALEN);
++	if (freq) {
++		bi->num_freq = 1;
++		bi->freq[0] = freq;
++	}
+ 	bi->curve = pkex->own_bi->curve;
+ 	bi->pubkey = pkex->peer_bootstrap_key;
+ 	pkex->peer_bootstrap_key = NULL;
+diff --git a/src/common/dpp_tcp.c b/src/common/dpp_tcp.c
+index fb8ef1c..1a8a7c7 100644
+--- a/src/common/dpp_tcp.c
++++ b/src/common/dpp_tcp.c
+@@ -24,10 +24,12 @@ struct dpp_connection {
+ 	struct dpp_controller *ctrl;
+ 	struct dpp_relay_controller *relay;
+ 	struct dpp_global *global;
++	struct dpp_pkex *pkex;
+ 	struct dpp_authentication *auth;
+ 	void *msg_ctx;
+ 	void *cb_ctx;
+ 	int (*process_conf_obj)(void *ctx, struct dpp_authentication *auth);
++	int (*pkex_done)(void *ctx, void *conn, struct dpp_bootstrap_info *bi);
+ 	int sock;
+ 	u8 mac_addr[ETH_ALEN];
+ 	unsigned int freq;
+@@ -71,6 +73,9 @@ struct dpp_controller {
+ 	struct dl_list conn; /* struct dpp_connection */
+ 	char *configurator_params;
+ 	enum dpp_netrole netrole;
++	struct dpp_bootstrap_info *pkex_bi;
++	char *pkex_code;
++	char *pkex_identifier;
+ 	void *msg_ctx;
+ 	void *cb_ctx;
+ 	int (*process_conf_obj)(void *ctx, struct dpp_authentication *auth);
+@@ -102,6 +107,7 @@ static void dpp_connection_free(struct dpp_connection *conn)
+ 	wpabuf_free(conn->msg);
+ 	wpabuf_free(conn->msg_out);
+ 	dpp_auth_deinit(conn->auth);
++	dpp_pkex_free(conn->pkex);
+ 	os_free(conn->name);
+ 	os_free(conn);
+ }
+@@ -525,6 +531,8 @@ int dpp_relay_rx_action(struct dpp_global *dpp, const u8 *src, const u8 *hdr,
+ 		/* TODO: Could send this to all configured Controllers. For now,
+ 		 * only the first Controller is supported. */
+ 		ctrl = dpp_relay_controller_get_ctx(dpp, cb_ctx);
++	} else if (type == DPP_PA_PKEX_EXCHANGE_REQ) {
++		ctrl = dpp_relay_controller_get_ctx(dpp, cb_ctx);
+ 	} else {
+ 		if (!r_bootstrap)
+ 			return -1;
+@@ -609,6 +617,8 @@ static void dpp_controller_free(struct dpp_controller *ctrl)
+ 		eloop_unregister_sock(ctrl->sock, EVENT_TYPE_READ);
+ 	}
+ 	os_free(ctrl->configurator_params);
++	os_free(ctrl->pkex_code);
++	os_free(ctrl->pkex_identifier);
+ 	os_free(ctrl);
+ }
+ 
+@@ -955,6 +965,143 @@ static int dpp_controller_rx_reconfig_auth_resp(struct dpp_connection *conn,
+ }
+ 
+ 
++static int dpp_controller_rx_pkex_exchange_req(struct dpp_connection *conn,
++					       const u8 *hdr, const u8 *buf,
++					       size_t len)
++{
++	struct dpp_controller *ctrl = conn->ctrl;
++
++	if (!ctrl)
++		return 0;
++
++	wpa_printf(MSG_DEBUG, "DPP: PKEX Exchange Request");
++
++	/* TODO: Support multiple PKEX codes by iterating over all the enabled
++	 * values here */
++
++	if (!ctrl->pkex_code || !ctrl->pkex_bi) {
++		wpa_printf(MSG_DEBUG,
++			   "DPP: No PKEX code configured - ignore request");
++		return 0;
++	}
++
++	if (conn->pkex || conn->auth) {
++		wpa_printf(MSG_DEBUG,
++			   "DPP: Already in PKEX/Authentication session - ignore new PKEX request");
++		return 0;
++	}
++
++	conn->pkex = dpp_pkex_rx_exchange_req(conn->ctrl->global, ctrl->pkex_bi,
++					      NULL, NULL,
++					      ctrl->pkex_identifier,
++					      ctrl->pkex_code,
++					      buf, len, true);
++	if (!conn->pkex) {
++		wpa_printf(MSG_DEBUG,
++			   "DPP: Failed to process the request");
++		return -1;
++	}
++
++	return dpp_tcp_send_msg(conn, conn->pkex->exchange_resp);
++}
++
++
++static int dpp_controller_rx_pkex_exchange_resp(struct dpp_connection *conn,
++						const u8 *hdr, const u8 *buf,
++						size_t len)
++{
++	struct dpp_pkex *pkex = conn->pkex;
++	struct wpabuf *msg;
++	int res;
++
++	wpa_printf(MSG_DEBUG, "DPP: PKEX Exchange Response");
++
++	if (!pkex || !pkex->initiator || pkex->exchange_done) {
++		wpa_printf(MSG_DEBUG, "DPP: No matching PKEX session");
++		return 0;
++	}
++
++	msg = dpp_pkex_rx_exchange_resp(pkex, NULL, buf, len);
++	if (!msg) {
++		wpa_printf(MSG_DEBUG, "DPP: Failed to process the response");
++		return -1;
++	}
++
++	wpa_printf(MSG_DEBUG, "DPP: Send PKEX Commit-Reveal Request");
++	res = dpp_tcp_send_msg(conn, msg);
++	wpabuf_free(msg);
++	return res;
++}
++
++
++static int dpp_controller_rx_pkex_commit_reveal_req(struct dpp_connection *conn,
++						    const u8 *hdr,
++						    const u8 *buf, size_t len)
++{
++	struct dpp_pkex *pkex = conn->pkex;
++	struct wpabuf *msg;
++	int res;
++	struct dpp_bootstrap_info *bi;
++
++	wpa_printf(MSG_DEBUG, "DPP: PKEX Commit-Reveal Request");
++
++	if (!pkex || pkex->initiator || !pkex->exchange_done) {
++		wpa_printf(MSG_DEBUG, "DPP: No matching PKEX session");
++		return 0;
++	}
++
++	msg = dpp_pkex_rx_commit_reveal_req(pkex, hdr, buf, len);
++	if (!msg) {
++		wpa_printf(MSG_DEBUG, "DPP: Failed to process the request");
++		return -1;
++	}
++
++	wpa_printf(MSG_DEBUG, "DPP: Send PKEX Commit-Reveal Response");
++	res = dpp_tcp_send_msg(conn, msg);
++	wpabuf_free(msg);
++	if (res < 0)
++		return res;
++	bi = dpp_pkex_finish(conn->global, pkex, NULL, 0);
++	if (!bi)
++		return -1;
++	conn->pkex = NULL;
++	return 0;
++}
++
++
++static int
++dpp_controller_rx_pkex_commit_reveal_resp(struct dpp_connection *conn,
++					  const u8 *hdr,
++					  const u8 *buf, size_t len)
++{
++	struct dpp_pkex *pkex = conn->pkex;
++	int res;
++	struct dpp_bootstrap_info *bi;
++
++	wpa_printf(MSG_DEBUG, "DPP: PKEX Commit-Reveal Response");
++
++	if (!pkex || !pkex->initiator || !pkex->exchange_done) {
++		wpa_printf(MSG_DEBUG, "DPP: No matching PKEX session");
++		return 0;
++	}
++
++	res = dpp_pkex_rx_commit_reveal_resp(pkex, hdr, buf, len);
++	if (res < 0) {
++		wpa_printf(MSG_DEBUG, "DPP: Failed to process the response");
++		return res;
++	}
++
++	bi = dpp_pkex_finish(conn->global, pkex, NULL, 0);
++	if (!bi)
++		return -1;
++	conn->pkex = NULL;
++
++	if (!conn->pkex_done)
++		return -1;
++	return conn->pkex_done(conn->cb_ctx, conn, bi);
++}
++
++
+ static int dpp_controller_rx_action(struct dpp_connection *conn, const u8 *msg,
+ 				    size_t len)
+ {
+@@ -1014,6 +1161,22 @@ static int dpp_controller_rx_action(struct dpp_connection *conn, const u8 *msg,
+ 	case DPP_PA_RECONFIG_AUTH_RESP:
+ 		return dpp_controller_rx_reconfig_auth_resp(conn, msg, pos,
+ 							    end - pos);
++	case DPP_PA_PKEX_V1_EXCHANGE_REQ:
++		wpa_printf(MSG_DEBUG,
++			   "DPP: Ignore PKEXv1 Exchange Request - not supported over TCP");
++		return -1;
++	case DPP_PA_PKEX_EXCHANGE_REQ:
++		return dpp_controller_rx_pkex_exchange_req(conn, msg, pos,
++							   end - pos);
++	case DPP_PA_PKEX_EXCHANGE_RESP:
++		return dpp_controller_rx_pkex_exchange_resp(conn, msg, pos,
++							    end - pos);
++	case DPP_PA_PKEX_COMMIT_REVEAL_REQ:
++		return dpp_controller_rx_pkex_commit_reveal_req(conn, msg, pos,
++								end - pos);
++	case DPP_PA_PKEX_COMMIT_REVEAL_RESP:
++		return dpp_controller_rx_pkex_commit_reveal_resp(conn, msg, pos,
++								 end - pos);
+ 	default:
+ 		/* TODO: missing messages types */
+ 		wpa_printf(MSG_DEBUG,
+@@ -1559,6 +1722,101 @@ fail:
+ }
+ 
+ 
++int dpp_tcp_pkex_init(struct dpp_global *dpp, struct dpp_pkex *pkex,
++		      const struct hostapd_ip_addr *addr, int port,
++		      void *msg_ctx, void *cb_ctx,
++		      int (*pkex_done)(void *ctx, void *conn,
++				       struct dpp_bootstrap_info *bi))
++{
++	struct dpp_connection *conn;
++	struct sockaddr_storage saddr;
++	socklen_t addrlen;
++	const u8 *hdr, *pos, *end;
++	char txt[100];
++
++	wpa_printf(MSG_DEBUG, "DPP: Initialize TCP connection to %s port %d",
++		   hostapd_ip_txt(addr, txt, sizeof(txt)), port);
++	if (dpp_ipaddr_to_sockaddr((struct sockaddr *) &saddr, &addrlen,
++				   addr, port) < 0) {
++		dpp_pkex_free(pkex);
++		return -1;
++	}
++
++	conn = os_zalloc(sizeof(*conn));
++	if (!conn) {
++		dpp_pkex_free(pkex);
++		return -1;
++	}
++
++	conn->msg_ctx = msg_ctx;
++	conn->cb_ctx = cb_ctx;
++	conn->pkex_done = pkex_done;
++	conn->global = dpp;
++	conn->pkex = pkex;
++	conn->sock = socket(AF_INET, SOCK_STREAM, 0);
++	if (conn->sock < 0)
++		goto fail;
++
++	if (fcntl(conn->sock, F_SETFL, O_NONBLOCK) != 0) {
++		wpa_printf(MSG_DEBUG, "DPP: fnctl(O_NONBLOCK) failed: %s",
++			   strerror(errno));
++		goto fail;
++	}
++
++	if (connect(conn->sock, (struct sockaddr *) &saddr, addrlen) < 0) {
++		if (errno != EINPROGRESS) {
++			wpa_printf(MSG_DEBUG, "DPP: Failed to connect: %s",
++				   strerror(errno));
++			goto fail;
++		}
++
++		/*
++		 * Continue connecting in the background; eloop will call us
++		 * once the connection is ready (or failed).
++		 */
++	}
++
++	if (eloop_register_sock(conn->sock, EVENT_TYPE_WRITE,
++				dpp_conn_tx_ready, conn, NULL) < 0)
++		goto fail;
++	conn->write_eloop = 1;
++
++	hdr = wpabuf_head(pkex->exchange_req);
++	end = hdr + wpabuf_len(pkex->exchange_req);
++	hdr += 2; /* skip Category and Actiom */
++	pos = hdr + DPP_HDR_LEN;
++	conn->msg_out = dpp_tcp_encaps(hdr, pos, end - pos);
++	if (!conn->msg_out)
++		goto fail;
++	/* Message will be sent in dpp_conn_tx_ready() */
++
++	/* TODO: eloop timeout to clear a connection if it does not complete
++	 * properly */
++	dl_list_add(&dpp->tcp_init, &conn->list);
++	return 0;
++fail:
++	dpp_connection_free(conn);
++	return -1;
++}
++
++
++static int dpp_tcp_auth_start(struct dpp_connection *conn,
++			      struct dpp_authentication *auth)
++{
++	const u8 *hdr, *pos, *end;
++
++	hdr = wpabuf_head(auth->req_msg);
++	end = hdr + wpabuf_len(auth->req_msg);
++	hdr += 2; /* skip Category and Actiom */
++	pos = hdr + DPP_HDR_LEN;
++	conn->msg_out = dpp_tcp_encaps(hdr, pos, end - pos);
++	if (!conn->msg_out)
++		return -1;
++	/* Message will be sent in dpp_conn_tx_ready() */
++	return 0;
++}
++
++
+ int dpp_tcp_init(struct dpp_global *dpp, struct dpp_authentication *auth,
+ 		 const struct hostapd_ip_addr *addr, int port, const char *name,
+ 		 enum dpp_netrole netrole, void *msg_ctx, void *cb_ctx,
+@@ -1568,7 +1826,6 @@ int dpp_tcp_init(struct dpp_global *dpp, struct dpp_authentication *auth,
+ 	struct dpp_connection *conn;
+ 	struct sockaddr_storage saddr;
+ 	socklen_t addrlen;
+-	const u8 *hdr, *pos, *end;
+ 	char txt[100];
+ 
+ 	wpa_printf(MSG_DEBUG, "DPP: Initialize TCP connection to %s port %d",
+@@ -1620,14 +1877,8 @@ int dpp_tcp_init(struct dpp_global *dpp, struct dpp_authentication *auth,
+ 		goto fail;
+ 	conn->write_eloop = 1;
+ 
+-	hdr = wpabuf_head(auth->req_msg);
+-	end = hdr + wpabuf_len(auth->req_msg);
+-	hdr += 2; /* skip Category and Actiom */
+-	pos = hdr + DPP_HDR_LEN;
+-	conn->msg_out = dpp_tcp_encaps(hdr, pos, end - pos);
+-	if (!conn->msg_out)
++	if (dpp_tcp_auth_start(conn, auth) < 0)
+ 		goto fail;
+-	/* Message will be sent in dpp_conn_tx_ready() */
+ 
+ 	/* TODO: eloop timeout to clear a connection if it does not complete
+ 	 * properly */
+@@ -1639,6 +1890,30 @@ fail:
+ }
+ 
+ 
++int dpp_tcp_auth(struct dpp_global *dpp, void *_conn,
++		 struct dpp_authentication *auth, const char *name,
++		 enum dpp_netrole netrole,
++		 int (*process_conf_obj)(void *ctx,
++					 struct dpp_authentication *auth))
++{
++	struct dpp_connection *conn = _conn;
++
++	/* Continue with Authentication exchange on an existing TCP connection.
++	 */
++	conn->process_conf_obj = process_conf_obj;
++	os_free(conn->name);
++	conn->name = os_strdup(name ? name : "Test");
++	conn->netrole = netrole;
++	conn->auth = auth;
++
++	if (dpp_tcp_auth_start(conn, auth) < 0)
++		return -1;
++
++	dpp_conn_tx_ready(conn->sock, conn, NULL);
++	return 0;
++}
++
++
+ int dpp_controller_start(struct dpp_global *dpp,
+ 			 struct dpp_controller_config *config)
+ {
+@@ -1789,6 +2064,23 @@ void dpp_controller_new_qr_code(struct dpp_global *dpp,
+ }
+ 
+ 
++void dpp_controller_pkex_add(struct dpp_global *dpp,
++			     struct dpp_bootstrap_info *bi,
++			     const char *code, const char *identifier)
++{
++	struct dpp_controller *ctrl = dpp->controller;
++
++	if (!ctrl)
++		return;
++
++	ctrl->pkex_bi = bi;
++	os_free(ctrl->pkex_code);
++	ctrl->pkex_code = code ? os_strdup(code) : NULL;
++	os_free(ctrl->pkex_identifier);
++	ctrl->pkex_identifier = identifier ? os_strdup(identifier) : NULL;
++}
++
++
+ void dpp_tcp_init_flush(struct dpp_global *dpp)
+ {
+ 	struct dpp_connection *conn, *tmp;
+diff --git a/wpa_supplicant/dpp_supplicant.c b/wpa_supplicant/dpp_supplicant.c
+index 61b300f..aab94cb 100644
+--- a/wpa_supplicant/dpp_supplicant.c
++++ b/wpa_supplicant/dpp_supplicant.c
+@@ -2557,6 +2557,71 @@ static int wpas_dpp_pkex_next_channel(struct wpa_supplicant *wpa_s,
+ }
+ 
+ 
++#ifdef CONFIG_DPP2
++static int wpas_dpp_pkex_done(void *ctx, void *conn,
++			      struct dpp_bootstrap_info *peer_bi)
++{
++	struct wpa_supplicant *wpa_s = ctx;
++	const char *cmd = wpa_s->dpp_pkex_auth_cmd;
++	const char *pos;
++	u8 allowed_roles = DPP_CAPAB_CONFIGURATOR;
++	struct dpp_bootstrap_info *own_bi = NULL;
++	struct dpp_authentication *auth;
++
++	if (!cmd)
++		cmd = "";
++	wpa_printf(MSG_DEBUG, "DPP: Start authentication after PKEX (cmd: %s)",
++		   cmd);
++
++	pos = os_strstr(cmd, " own=");
++	if (pos) {
++		pos += 5;
++		own_bi = dpp_bootstrap_get_id(wpa_s->dpp, atoi(pos));
++		if (!own_bi) {
++			wpa_printf(MSG_INFO,
++				   "DPP: Could not find bootstrapping info for the identified local entry");
++			return -1;
++		}
++
++		if (peer_bi->curve != own_bi->curve) {
++			wpa_printf(MSG_INFO,
++				   "DPP: Mismatching curves in bootstrapping info (peer=%s own=%s)",
++				   peer_bi->curve->name, own_bi->curve->name);
++			return -1;
++		}
++	}
++
++	pos = os_strstr(cmd, " role=");
++	if (pos) {
++		pos += 6;
++		if (os_strncmp(pos, "configurator", 12) == 0)
++			allowed_roles = DPP_CAPAB_CONFIGURATOR;
++		else if (os_strncmp(pos, "enrollee", 8) == 0)
++			allowed_roles = DPP_CAPAB_ENROLLEE;
++		else if (os_strncmp(pos, "either", 6) == 0)
++			allowed_roles = DPP_CAPAB_CONFIGURATOR |
++				DPP_CAPAB_ENROLLEE;
++		else
++			return -1;
++	}
++
++	auth = dpp_auth_init(wpa_s->dpp, wpa_s, peer_bi, own_bi, allowed_roles,
++			     0, wpa_s->hw.modes, wpa_s->hw.num_modes);
++	if (!auth)
++		return -1;
++
++	wpas_dpp_set_testing_options(wpa_s, auth);
++	if (dpp_set_configurator(auth, cmd) < 0) {
++		dpp_auth_deinit(auth);
++		return -1;
++	}
++
++	return dpp_tcp_auth(wpa_s->dpp, conn, auth, wpa_s->conf->dpp_name,
++			    DPP_NETROLE_STA, wpas_dpp_process_conf_obj);
++}
++#endif /* CONFIG_DPP2 */
++
++
+ enum wpas_dpp_pkex_ver {
+ 	PKEX_VER_AUTO,
+ 	PKEX_VER_ONLY_1,
+@@ -2564,7 +2629,9 @@ enum wpas_dpp_pkex_ver {
+ };
+ 
+ static int wpas_dpp_pkex_init(struct wpa_supplicant *wpa_s,
+-			      enum wpas_dpp_pkex_ver ver)
++			      enum wpas_dpp_pkex_ver ver,
++			      const struct hostapd_ip_addr *ipaddr,
++			      int tcp_port)
+ {
+ 	struct dpp_pkex *pkex;
+ 	struct wpabuf *msg;
+@@ -2573,15 +2640,24 @@ static int wpas_dpp_pkex_init(struct wpa_supplicant *wpa_s,
+ 
+ 	wpa_printf(MSG_DEBUG, "DPP: Initiating PKEXv%d", v2 ? 2 : 1);
+ 	dpp_pkex_free(wpa_s->dpp_pkex);
+-	wpa_s->dpp_pkex = dpp_pkex_init(wpa_s, wpa_s->dpp_pkex_bi,
+-					wpa_s->own_addr,
+-					wpa_s->dpp_pkex_identifier,
+-					wpa_s->dpp_pkex_code, v2);
+-	pkex = wpa_s->dpp_pkex;
++	wpa_s->dpp_pkex = NULL;
++	pkex = dpp_pkex_init(wpa_s, wpa_s->dpp_pkex_bi, wpa_s->own_addr,
++			     wpa_s->dpp_pkex_identifier,
++			     wpa_s->dpp_pkex_code, v2);
+ 	if (!pkex)
+ 		return -1;
+ 	pkex->forced_ver = ver != PKEX_VER_AUTO;
+ 
++	if (ipaddr) {
++#ifdef CONFIG_DPP2
++		return dpp_tcp_pkex_init(wpa_s->dpp, pkex, ipaddr, tcp_port,
++					 wpa_s, wpa_s, wpas_dpp_pkex_done);
++#else /* CONFIG_DPP2 */
++		return -1;
++#endif /* CONFIG_DPP2 */
++	}
++
++	wpa_s->dpp_pkex = pkex;
+ 	msg = pkex->exchange_req;
+ 	wait_time = wpa_s->max_remain_on_chan;
+ 	if (wait_time > 2000)
+@@ -2618,7 +2694,8 @@ static void wpas_dpp_pkex_retry_timeout(void *eloop_ctx, void *timeout_ctx)
+ 			if (pkex->v2 && !pkex->forced_ver) {
+ 				wpa_printf(MSG_DEBUG,
+ 					   "DPP: Fall back to PKEXv1");
+-				wpas_dpp_pkex_init(wpa_s, PKEX_VER_ONLY_1);
++				wpas_dpp_pkex_init(wpa_s, PKEX_VER_ONLY_1,
++						   NULL, 0);
+ 				return;
+ 			}
+ #endif /* CONFIG_DPP3 */
+@@ -3327,6 +3404,29 @@ int wpas_dpp_pkex_add(struct wpa_supplicant *wpa_s, const char *cmd)
+ {
+ 	struct dpp_bootstrap_info *own_bi;
+ 	const char *pos, *end;
++	int tcp_port = DPP_TCP_PORT;
++	struct hostapd_ip_addr *ipaddr = NULL;
++#ifdef CONFIG_DPP2
++	struct hostapd_ip_addr ipaddr_buf;
++	char *addr;
++
++	pos = os_strstr(cmd, " tcp_port=");
++	if (pos) {
++		pos += 10;
++		tcp_port = atoi(pos);
++	}
++
++	addr = get_param(cmd, " tcp_addr=");
++	if (addr) {
++		int res;
++
++		res = hostapd_parse_ip_addr(addr, &ipaddr_buf);
++		os_free(addr);
++		if (res)
++			return -1;
++		ipaddr = &ipaddr_buf;
++	}
++#endif /* CONFIG_DPP2 */
+ 
+ 	pos = os_strstr(cmd, " own=");
+ 	if (!pos)
+@@ -3390,8 +3490,14 @@ int wpas_dpp_pkex_add(struct wpa_supplicant *wpa_s, const char *cmd)
+ 				return -1;
+ 		}
+ 
+-		if (wpas_dpp_pkex_init(wpa_s, ver) < 0)
++		if (wpas_dpp_pkex_init(wpa_s, ver, ipaddr, tcp_port) < 0)
+ 			return -1;
++	} else {
++#ifdef CONFIG_DPP2
++		dpp_controller_pkex_add(wpa_s->dpp, own_bi,
++					wpa_s->dpp_pkex_code,
++					wpa_s->dpp_pkex_identifier);
++#endif /* CONFIG_DPP2 */
+ 	}
+ 
+ 	/* TODO: Support multiple PKEX info entries */
+-- 
+2.40.0
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0005.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0005.patch
new file mode 100644
index 0000000000..92828fbbbb
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0005.patch
@@ -0,0 +1,144 @@
+From 15af83cf1846870873a011ed4d714732f01cd2e4 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <quic_jouni@quicinc.com>
+Date: Tue, 19 Jul 2022 21:23:04 +0300
+Subject: [PATCH] DPP: Delete PKEX code and identifier on success completion of
+ PKEX
+
+We are not supposed to reuse these without being explicitly requested to
+perform PKEX again. There is not a strong use case for being able to
+provision an Enrollee multiple times with PKEX, so this should have no
+issues on the Enrollee. For a Configurator, there might be some use
+cases that would benefit from being able to use the same code with
+multiple Enrollee devices, e.g., for guess access with a laptop and a
+smart phone. That case will now require a new DPP_PKEX_ADD command on
+the Configurator after each completion of the provisioning exchange.
+
+Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
+
+CVE: CVE-2022-37660
+
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=15af83cf1846870873a011ed4d714732f01cd2e4]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ src/ap/dpp_hostapd.c            | 22 +++++++++++++++++++++-
+ wpa_supplicant/dpp_supplicant.c | 21 ++++++++++++++++++++-
+ 2 files changed, 41 insertions(+), 2 deletions(-)
+
+diff --git a/src/ap/dpp_hostapd.c b/src/ap/dpp_hostapd.c
+index d956be9..73b09ba 100644
+--- a/src/ap/dpp_hostapd.c
++++ b/src/ap/dpp_hostapd.c
+@@ -276,6 +276,22 @@ static int hostapd_dpp_pkex_next_channel(struct hostapd_data *hapd,
+ }
+ 
+ 
++static void hostapd_dpp_pkex_clear_code(struct hostapd_data *hapd)
++{
++	if (!hapd->dpp_pkex_code && !hapd->dpp_pkex_identifier)
++		return;
++
++	/* Delete PKEX code and identifier on successful completion of
++	 * PKEX. We are not supposed to reuse these without being
++	 * explicitly requested to perform PKEX again. */
++	wpa_printf(MSG_DEBUG, "DPP: Delete PKEX code/identifier");
++	os_free(hapd->dpp_pkex_code);
++	hapd->dpp_pkex_code = NULL;
++	os_free(hapd->dpp_pkex_identifier);
++	hapd->dpp_pkex_identifier = NULL;
++}
++
++
+ #ifdef CONFIG_DPP2
+ static int hostapd_dpp_pkex_done(void *ctx, void *conn,
+ 				 struct dpp_bootstrap_info *peer_bi)
+@@ -287,6 +303,8 @@ static int hostapd_dpp_pkex_done(void *ctx, void *conn,
+ 	struct dpp_bootstrap_info *own_bi = NULL;
+ 	struct dpp_authentication *auth;
+ 
++	hostapd_dpp_pkex_clear_code(hapd);
++
+ 	if (!cmd)
+ 		cmd = "";
+ 	wpa_printf(MSG_DEBUG, "DPP: Start authentication after PKEX (cmd: %s)",
+@@ -2114,6 +2132,7 @@ hostapd_dpp_rx_pkex_commit_reveal_req(struct hostapd_data *hapd, const u8 *src,
+ 				wpabuf_head(msg), wpabuf_len(msg));
+ 	wpabuf_free(msg);
+ 
++	hostapd_dpp_pkex_clear_code(hapd);
+ 	bi = dpp_pkex_finish(hapd->iface->interfaces->dpp, pkex, src, freq);
+ 	if (!bi)
+ 		return;
+@@ -2145,6 +2164,7 @@ hostapd_dpp_rx_pkex_commit_reveal_resp(struct hostapd_data *hapd, const u8 *src,
+ 		return;
+ 	}
+ 
++	hostapd_dpp_pkex_clear_code(hapd);
+ 	bi = dpp_pkex_finish(hapd->iface->interfaces->dpp, pkex, src, freq);
+ 	if (!bi)
+ 		return;
+@@ -2518,7 +2538,7 @@ int hostapd_dpp_pkex_remove(struct hostapd_data *hapd, const char *id)
+ 			return -1;
+ 	}
+ 
+-	if ((id_val != 0 && id_val != 1) || !hapd->dpp_pkex_code)
++	if ((id_val != 0 && id_val != 1))
+ 		return -1;
+ 
+ 	/* TODO: Support multiple PKEX entries */
+diff --git a/wpa_supplicant/dpp_supplicant.c b/wpa_supplicant/dpp_supplicant.c
+index aab94cb..015ae66 100644
+--- a/wpa_supplicant/dpp_supplicant.c
++++ b/wpa_supplicant/dpp_supplicant.c
+@@ -2557,6 +2557,22 @@ static int wpas_dpp_pkex_next_channel(struct wpa_supplicant *wpa_s,
+ }
+ 
+ 
++static void wpas_dpp_pkex_clear_code(struct wpa_supplicant *wpa_s)
++{
++	if (!wpa_s->dpp_pkex_code && !wpa_s->dpp_pkex_identifier)
++		return;
++
++	/* Delete PKEX code and identifier on successful completion of
++	 * PKEX. We are not supposed to reuse these without being
++	 * explicitly requested to perform PKEX again. */
++	os_free(wpa_s->dpp_pkex_code);
++	wpa_s->dpp_pkex_code = NULL;
++	os_free(wpa_s->dpp_pkex_identifier);
++	wpa_s->dpp_pkex_identifier = NULL;
++
++}
++
++
+ #ifdef CONFIG_DPP2
+ static int wpas_dpp_pkex_done(void *ctx, void *conn,
+ 			      struct dpp_bootstrap_info *peer_bi)
+@@ -2568,6 +2584,8 @@ static int wpas_dpp_pkex_done(void *ctx, void *conn,
+ 	struct dpp_bootstrap_info *own_bi = NULL;
+ 	struct dpp_authentication *auth;
+ 
++	wpas_dpp_pkex_clear_code(wpa_s);
++
+ 	if (!cmd)
+ 		cmd = "";
+ 	wpa_printf(MSG_DEBUG, "DPP: Start authentication after PKEX (cmd: %s)",
+@@ -2872,6 +2890,7 @@ wpas_dpp_pkex_finish(struct wpa_supplicant *wpa_s, const u8 *peer,
+ {
+ 	struct dpp_bootstrap_info *bi;
+ 
++	wpas_dpp_pkex_clear_code(wpa_s);
+ 	bi = dpp_pkex_finish(wpa_s->dpp, wpa_s->dpp_pkex, peer, freq);
+ 	if (!bi)
+ 		return NULL;
+@@ -3521,7 +3540,7 @@ int wpas_dpp_pkex_remove(struct wpa_supplicant *wpa_s, const char *id)
+ 			return -1;
+ 	}
+ 
+-	if ((id_val != 0 && id_val != 1) || !wpa_s->dpp_pkex_code)
++	if ((id_val != 0 && id_val != 1))
+ 		return -1;
+ 
+ 	/* TODO: Support multiple PKEX entries */
+-- 
+2.40.0
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index 459039d01e..fbbbebc450 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -38,6 +38,11 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://0001-SAE-Check-for-invalid-Rejected-Groups-element-length.patch \
            file://0002-SAE-Check-for-invalid-Rejected-Groups-element-length.patch \
            file://0003-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch \
+           file://CVE-2022-37660-0001.patch \
+           file://CVE-2022-37660-0002.patch \
+           file://CVE-2022-37660-0003.patch \
+           file://CVE-2022-37660-0004.patch \
+           file://CVE-2022-37660-0005.patch \
            "
 SRC_URI[sha256sum] = "20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7e17b2f"
 
-- 
2.40.0


