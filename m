Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A266E7719A
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 11:35:47 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.web11.15163.1736233082056556082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jan 2025 22:58:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=EjFUDEyS;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6241; q=dns/txt; s=iport;
  t=1736233082; x=1737442682;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Yk7g7RbacYs/NkrupHuKzzqH92vRMteSTbWY4/4bFEw=;
  b=EjFUDEyS3yt12OtLTLTExKkvvyuoBhyo1pZ9QpgE3f/GiHABtpDBuyws
   kau/ChvoLWzg7DdQ/WN3Uqwn2c14UcpdEsoI07q6oTx/m84hZ93qeH4tv
   03lay8OimehDaqqmuWg4G6rLgHPTLDLsDYJhGv+SGPuiB2ZGhDH2arAp4
   M=;
X-CSE-ConnectionGUID: veLa2zEoSWqIET9nx03fSA==
X-CSE-MsgGUID: wWwWWyRDSi+gJaKWb2K+SQ==
X-IPAS-Result: =?us-ascii?q?A0AcAABgz3xnj5P/Ja1aHQEBAQEJARIBBQUBgX8IAQsBA?=
 =?us-ascii?q?YM/WUNIjHKJUYt2kiWBJQNWDwEBAQ85CwQBAYUHinYCJjQJDgECBAEBAQEDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQsBAQUBAQECAQcFFAEBAQEBATkFDjuFew1JAQwBhgMBA?=
 =?us-ascii?q?gEqCwEYARsSLAMBAlojIYMBAYJkAxEGsDSBeTOBAYMoATEFCQJDTtk4gW2BS?=
 =?us-ascii?q?AGNSW8BhHcnG4FJRIEVgTuCLYEFgVwBiCUEhC2DP4FsiwYdL4IujghIgSEDW?=
 =?us-ascii?q?SwBVRMNCgsHBYFzAzgMCzAVgVtEOYJGaUk3Ag0CNYIefIIrhFyER2EvAwMDA?=
 =?us-ascii?q?4M6hWaCF4IWgm5AAwsYDUgRLDcUGwY+bgeaZQE8gnxygQ4BK4F9BSoREZJ9G?=
 =?us-ascii?q?hOSDKEDhCWMGJUuGjOqU5h8jgSKBYw+hGaBZzqBSQsHTSMVgyIJSRkPji0LA?=
 =?us-ascii?q?gmDWIF/gxWvSCUyAgE5AgcLAQEDCY1AhBUBAQ?=
IronPort-Data: A9a23:FoC356p/9noK/RMIrRjO8k/rhXdeBmITZRIvgKrLsJaIsI4StFCzt
 garIBmFOvqKZGKgeNAgatznoUhVvMWAn4AyGgBuqn8zHyMTo+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9T8kiPngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYQXNNwJcaDpOtvra8E0355wehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0vh6JWgU5
 9EfEw8UTz2/1uSmmOm1ccA506zPLOGzVG8ekmtrwTecCbMtRorOBvySo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LV/rSn8/w7pX7WyZAtUmVvak+y2PS1wd2lrPqNbI5f/TWHZQKxxjG+
 z2uE2LRHS4FC+OO8xa+8zGjpObsoimhe8EpLejtnhJtqAbOnjNIUkJ+uUGAif6hh0izXthSJ
 0AZ9m8lqrI/3EiqVcXmGRqgrXiJuxQRV9ZdH6s98g7l90bPyxySCm5BSntKb8Yr8ZZuAzcrz
 VSO2djuAFSDrYF5V1qD+5Od9yGfPhMqNE4vWX4CXVNe7eLK9dRbYg30cv5vF6u8j9vQED72w
 iyXoCVWu1n1pZBSv0lc1Q6b6w9AtqT0ohgJChI7t19JDz+Vhqb4PORECnCCsZ6sybp1qHHa4
 RDofODFs4gz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJv2ogfRc5aZ5cJm+1C
 KM2he+3zMINVJdNRfImC79d9+xwlsAM6Py8DKmNMIYeCnSPXFDXpH00DaJv44wduBNxyf5kY
 8jznTeEBncBAqMv1yutW+oYyvcqwCt4rV4/trilpylLJYG2PSbPIZ9caQPmRrlgsMus/l6Pm
 /4BbJTi9vmqeLGlCsUh2dJIdQhSRZX6bLiqw/FqmhmreVY3STx7VaSPnNvMueVNxsxoqwsBx
 VnlMmcw9bY1rSevxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:geOfRaqF3NF+qGZSC0zv0hoaV5ogeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9SZIVycygaYvp
 0QFJSXz7bLfDxHsfo=
X-Talos-CUID: 9a23:YmgFw24bmEvFjqW+H9ss6kMwE5o3X3rm827xDnPpD3YxE7OuYArF
X-Talos-MUID: 9a23:/raXOQbe/MQcFOBTqADzuw5zDutT4uehKkkurp9cmIq/DHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.12,294,1728950400"; 
   d="scan'208";a="409716657"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Jan 2025 06:58:01 +0000
Received: from sjc-ads-5718.cisco.com (sjc-ads-5718.cisco.com [10.28.88.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 1E57F1800026B;
	Tue,  7 Jan 2025 06:58:01 +0000 (GMT)
Received: by sjc-ads-5718.cisco.com (Postfix, from userid 1839047)
	id A62EDCC1280; Mon,  6 Jan 2025 22:58:00 -0800 (PST)
From: Shubham Pushpkar <spushpka@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	spushpka@cisco.com
Subject: [meta-openembedded] [scarthgap] [PATCH] wireshark 4.2.7: Fix CVE-2024-9781
Date: Mon,  6 Jan 2025 22:57:56 -0800
Message-Id: <20250107065756.642432-1-spushpka@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.28.88.232, sjc-ads-5718.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 11:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209452

Upstream Repository: https://gitlab.com/wireshark/wireshark.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2024-9781
Type: Security Fix
CVE: CVE-2024-9781
Score: 7.8
Patch: https://gitlab.com/wireshark/wireshark/-/commit/cad248ce3bf5

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
---
 .../wireshark/files/CVE-2024-9781.patch       | 133 ++++++++++++++++++
 .../wireshark/wireshark_4.2.7.bb              |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2024-9781.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2024-9781.patch b/meta-networking/recipes-support/wireshark/files/CVE-2024-9781.patch
new file mode 100644
index 000000000..eb8c733da
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2024-9781.patch
@@ -0,0 +1,133 @@
+From f32965be7c80ca6eb330d0e9b34f0c563db7d869 Mon Sep 17 00:00:00 2001
+From: Gerald Combs <gerald@wireshark.org>
+Date: Tue, 8 Oct 2024 11:56:28 -0700
+Subject: [PATCH] AppleTalk: Make sure we have valid addresses
+
+Make sure ATP, ZIP, and ASP have valid addresses. Use sizeof instead of
+a hard-coded value in a few places.
+
+Fixes #20114
+
+(cherry picked from commit 3de741321f85c205c0a8266c40f33cb0013bd1d2)
+
+Conflicts:
+	epan/dissectors/packet-atalk.c
+
+CVE: CVE-2024-9781
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/cad248ce3bf5]
+
+(cherry picked from commit cad248ce3bf53026cc837fedeaca65d0f20ea3b5)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ epan/dissectors/packet-atalk.c | 44 ++++++++++++++++++++++++----------
+ 1 file changed, 32 insertions(+), 12 deletions(-)
+
+diff --git a/epan/dissectors/packet-atalk.c b/epan/dissectors/packet-atalk.c
+index 396e7af519..065d6aedb6 100644
+--- a/epan/dissectors/packet-atalk.c
++++ b/epan/dissectors/packet-atalk.c
+@@ -232,9 +232,18 @@ static int hf_asp_attn_code     = -1;
+ static int hf_asp_seq           = -1;
+ static int hf_asp_size          = -1;
+ 
++/*
++ * Structure used to represent a DDP address; gives the layout of the
++ * data pointed to by an Appletalk "address" structure.
++ */
++struct atalk_ddp_addr {
++  guint16 net;
++  guint8 node;
++};
++
+ typedef struct {
+   guint32 conversation;
+-  guint8  src[4];
++  guint8  src[sizeof(struct atalk_ddp_addr)];
+   guint16 tid;
+ } asp_request_key;
+ 
+@@ -502,6 +511,10 @@ static const value_string asp_error_vals[] = {
+   {0,                   NULL } };
+ value_string_ext asp_error_vals_ext = VALUE_STRING_EXT_INIT(asp_error_vals);
+ 
++static bool is_ddp_address(address *addr) {
++  return addr->type == atalk_address_type && addr->len == sizeof(struct atalk_ddp_addr);
++}
++
+ /*
+  * hf_index must be a FT_UINT_STRING type
+  * Are these always in a Mac extended character set?  Should we have a
+@@ -744,6 +757,12 @@ dissect_atp(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void* data _U_)
+   conversation_t  *conversation;
+   asp_request_val *request_val   = NULL;
+ 
++  // ATP is carried over DDP
++  if (!(is_ddp_address(&pinfo->src) && is_ddp_address(&pinfo->dst))) {
++    return 0;
++  }
++
++
+   col_set_str(pinfo->cinfo, COL_PROTOCOL, "ATP");
+ 
+   ctrlinfo = tvb_get_guint8(tvb, offset);
+@@ -770,7 +789,7 @@ dissect_atp(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void* data _U_)
+     asp_request_key request_key;
+ 
+     request_key.conversation = conversation->conv_index;
+-    memcpy(request_key.src, (!atp_asp_dsi_info.reply)?pinfo->src.data:pinfo->dst.data, 4);
++    memcpy(request_key.src, (!atp_asp_dsi_info.reply)?pinfo->src.data:pinfo->dst.data, sizeof(struct atalk_ddp_addr));
+     request_key.tid = atp_asp_dsi_info.tid;
+ 
+     request_val = (asp_request_val *) wmem_map_lookup(atp_request_hash, &request_key);
+@@ -1018,7 +1037,7 @@ get_transaction(tvbuff_t *tvb, packet_info *pinfo, struct atp_asp_dsi_info *atp_
+   conversation = find_or_create_conversation(pinfo);
+ 
+   request_key.conversation = conversation->conv_index;
+-  memcpy(request_key.src, (!atp_asp_dsi_info->reply)?pinfo->src.data:pinfo->dst.data, 4);
++  memcpy(request_key.src, (!atp_asp_dsi_info->reply)?pinfo->src.data:pinfo->dst.data, sizeof(struct atalk_ddp_addr));
+   request_key.tid = atp_asp_dsi_info->tid;
+ 
+   request_val = (asp_request_val *) wmem_map_lookup(asp_request_hash, &request_key);
+@@ -1051,6 +1070,11 @@ dissect_asp(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data)
+   if (data == NULL)
+     return 0;
+ 
++  // ASP is carried over ATP/DDP
++  if (!(is_ddp_address(&pinfo->src) && is_ddp_address(&pinfo->dst))) {
++    return 0;
++  }
++
+   col_set_str(pinfo->cinfo, COL_PROTOCOL, "ASP");
+   col_clear(pinfo->cinfo, COL_INFO);
+ 
+@@ -1183,15 +1207,6 @@ dissect_asp(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data)
+ /* -----------------------------
+    ZIP protocol cf. inside appletalk chap. 8
+ */
+-/*
+- * Structure used to represent a DDP address; gives the layout of the
+- * data pointed to by an Appletalk "address" structure.
+- */
+-struct atalk_ddp_addr {
+-    guint16 net;
+-    guint8  node;
+-};
+-
+ 
+ static int atalk_str_len(const address* addr _U_)
+ {
+@@ -1241,6 +1256,11 @@ dissect_atp_zip(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void* data)
+   if (data == NULL)
+     return 0;
+ 
++  // ATP ZIP is carried over DDP
++  if (!(is_ddp_address(&pinfo->src) && is_ddp_address(&pinfo->dst))) {
++    return 0;
++  }
++
+   col_set_str(pinfo->cinfo, COL_PROTOCOL, "ZIP");
+   col_clear(pinfo->cinfo, COL_INFO);
+ 
+-- 
+2.44.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
index b80710683..d68b082bb 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
            file://0002-flex-Remove-line-directives.patch \
            file://0004-lemon-Remove-line-directives.patch \
            file://0001-UseLemon.cmake-do-not-use-lemon-data-from-the-host.patch \
+           file://CVE-2024-9781.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.35.6


