Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AAA9C6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 15:49:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.23299.1679068169687840797
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 08:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OONUAtYS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2440dda1bf=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32HFf5ss008969
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=rdKQm/K+7oZpXId4rHxmy8sMLhoyCqXdTbfr45xX86c=;
 b=OONUAtYSWER7tsBNoQm+WzYujIansaqW8szf1NE3kxvYD5SJhFuodz4muOyeS+mKHaXo
 H3eQIhjSbArYnevEPzcXJ2e8zplGwD0CzChUPZY2DTzUR9n40Kn5haePManp13QVQRdE
 wlovacD9AUh/v9s3lOkJwhiJLB+cntHDZVNV6jxmUqcm6AqaUbS0V7WPjbwtrqajJBFT
 K7eQOmwRIZENJUQ6ulgMYcxQQZAqdsi+MhviSlft5fA31UgGz4UXvuvw+pejg1gIgLS8
 l+3506egVSEv1iDCsftqwGAdLoJFvyvkQQzwb5fremVGWuf3N/kz+eyQ+FOSGybqGYQE cQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbqm79tcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:49:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/ne+xGP3reWCbbVZeXzoOKEyNi0DNqSJJmoYDaLvP4cpr9Q5MSWtWXTBq2IqMX9fUoVCfYDJVrodkOh9O1qPvh91TBPwgwJmjGz9kEqvBS4c8/JqogAncrKXoHG9hOezqK8dlQSYQ2Q6mT2JCaUOqu4LQ59bdbBBELh0+bPHJPBAKO+gH9Kf4K/H1OtmXRe6sXq0Pm2YcQ13qB/EJQ7HHW27fit78ROUxP5UEmFavlmeAmV+DPqYL/onhiSLPUCx0YeHHosQEbJTILVDD+9Q8siI1HH3a+cPi5KUzqRq9Ugzt1LvX5FO+7fD2OTYNQ+q7QJpf6Fv+G7ZxL6m5CwBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdKQm/K+7oZpXId4rHxmy8sMLhoyCqXdTbfr45xX86c=;
 b=KwAO6G8pWg2GfnXSeT4GVKLJt2Y/OcAu+hcve/aQX3OtTvj+mMS27G8l7PTG+hkAE+wFINdOb1dNJJbZPDSgUZxJlsysuyuGkvRGQ5LoA5CIUlWyP7hbDqDRlDSrlE0xVSto1KLCrUyR/gQ/rb1fQlga9OB4pk81KhgLtWaxQCI8bPD9HZ9HeOIIVVKgJ+LDVLqk3e2IOs4wzAr4nshdZ/PnOWLvTSWxxOontvZDVeHhj/oLGA30UIvzuKWJHrYkUY0gP7QkYWPqHngjVz5w2+PXPiD+6UHlfUcQOq5l83gV34wXaKRzxQZoL2hQqsZCDoUZslrvLg5qPvKnniRudw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 PH7PR11MB7028.namprd11.prod.outlook.com (2603:10b6:510:20b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 15:49:25 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4f46:b639:f638:d5f7]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4f46:b639:f638:d5f7%5]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 15:49:24 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] u-boot: fix CVE-2022-2347 and CVE-2022-30790
Date: Fri, 17 Mar 2023 11:49:05 -0400
Message-Id: <20230317154905.1828960-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0006.namprd08.prod.outlook.com
 (2603:10b6:208:239::11) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|PH7PR11MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b783b30-595d-48e1-e6fa-08db26ff2ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZhuK/1tk3TKL5bxcmzxf2GAdAOW4PV79BpKLrCH3SN+jROxeLpPcg6Ng6N2VSN4Hwi3XjA93d7aW4YFJ3LiQzBeFUIwA1AfaZ/zAW4fZElhwOlr059llCQJWMuToefkKd58T+23JNOsAPVRFFbzO6p+xBTTPnyGNKUDdCg2UYDgW/VVYwUkQYf9ZeT2/pbayhTDk57scwvTgTfNS4RR2x8v+UpSt8JCnYmOa2p3gq3sTNJhhAdJLJr83bpKchrVaWzc+EGMKfgP5zPhZ9k6XzmplEjy4S7hB46DtyH5VT6JqAEMi5QQn/cbCtCd7DE8fwYCpyuPsN3BUG39UPy3h7GMSPXf0S7g2KoOtYJpesctVfxNXB0CtG2VPNoIOAakADXFnWfkKCJTI8cNHgOTjcIUSrHtoZ2uhbvkTWvgAtVmxxTemKfiUw+iAwXsFXjq20MSSeBWP5JzjyyU/Dk6eSsxqJ1PC2o3GAjSKgEZxGUJDBiRHdi0v0XZhZ8+aHkmkvK3M2FdIKZf2pGsiSw6H1kR7lqYTbATT0Sj0XpG0vVf3Pes26MDDI6W9oOJOg0/FYm7gT5XX3Z5UyRKIHtDSmknhhNnrW/LvPnIPexv0DwbyM2DPm4GTNiL0zl9/tdBSA//JRZCL/xAjN4cvEwUHmoyCKPhLO5oZf7f2hzPAjL+kGfCpCaMdHtVaDBWwgSXGSWpqk5k2PqdRzTgcRcutIQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39850400004)(376002)(396003)(346002)(136003)(451199018)(66899018)(6916009)(66476007)(66556008)(8676002)(2906002)(66946007)(44832011)(30864003)(5660300002)(36756003)(86362001)(38350700002)(38100700002)(8936002)(6666004)(6486002)(26005)(1076003)(41300700001)(316002)(6512007)(52116002)(6506007)(478600001)(83380400001)(186003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LXl4+Ce3qiUt61ubizURnFqA35/0kMbF0WmcOaqyJ0rLnVTAeDwDNrUyTWxz?=
 =?us-ascii?Q?RfEkYzqHa4+DftTS8hqiEMSwSzH/yvqM3BkC8KzhkM2yeWF0lV6TwAkYjq+8?=
 =?us-ascii?Q?PqkGw6p1KCysADp4kv+k0CRthW4IE9k0bTzzE4VbmBolIfV+JYYstuCzFVp1?=
 =?us-ascii?Q?NbHMcgBNVbngtY/PXtqV8yhzg+G4Q+XhxBJttxCMltLGTzCOXrC0Us8rswRs?=
 =?us-ascii?Q?al0HXKFDrrcpDCiPdyiKtZDbKoNCSs3TgCRlQZYcenogUjG9ToEIf3eIuYjx?=
 =?us-ascii?Q?YWDt6+CEuN0fEU5YD5eQUHDYWWyvH9h9X8x8yZ3EtwAXbQqljRkHnXpF1l2b?=
 =?us-ascii?Q?ru3tlypFk0g9+61AjP/v8I9Fr2G+GlAJ4M2iLfR91dqaL0EJtnS8i4a4P8ZT?=
 =?us-ascii?Q?X5N17m/6+Nv+Q1htwEOPFZSHMzGvDcZnm3huQa/7FtJgcupeD1dAvwulu3kJ?=
 =?us-ascii?Q?Ymz1pLJb4PZG+Zo42lBBdgk/Vo0NuR2WeaevazbZXjk56FaWX+ffoI5PEUII?=
 =?us-ascii?Q?RFqaneyVRsRdDe796MFds4G+wROqDS7loPIJra/oQMKEt1v5AysdX4YwwIdB?=
 =?us-ascii?Q?6KIlnNuqwU16yIgoklqjoPZm2hSuJ+zVpWZLfQocjNTCb/rZYBNjQpteRrEU?=
 =?us-ascii?Q?o67Bc/ZAw6rBJKYNlSrPGlsPeA0JS3yXGe/g6PD6VIgcPq36lOqpApGZhDzk?=
 =?us-ascii?Q?0ypxCurhBoXLirdtOoBJqZrm2j34rSP5BejLMgkS5FrqwWopEmC4Nrz6iH67?=
 =?us-ascii?Q?Otzpr80HV00Mvdmmnf6WePuh7UyCtrqInusHr24LYTSTlILnlq2kCDuXWIRe?=
 =?us-ascii?Q?Nie0jjEYdMYtQD8/YCcDaWbg8l793mjuFzPeheePuVmKyDZ0g0WbtImIkuz4?=
 =?us-ascii?Q?E03aSMJ20EnmAAn776w7L4bMBIp+DZ9Wes+OrUqz7+2gFSxEoR4xvCBnE6Uv?=
 =?us-ascii?Q?a4dd3dVU7pn1XmLdpad2XPUSezSMnGb2DUC9jZAqkuJ2ToB0r5+dL+GzXeU9?=
 =?us-ascii?Q?RhXTsNdl71uAOZmYvj5SkYOuFs0lMH5zZ+nBKk6GGOyQgB1qeMbi2ZJrxz3r?=
 =?us-ascii?Q?UWJhKmWKs0A8LsSVoKtohMLA9ud4mwgzGpj1/v3Hkz4mW5xFUoM3QlXNOdd9?=
 =?us-ascii?Q?ZMtJ/wsB6ltTkG0mtaQUKzyYUs89pHV7hFKD186JEONx01BmWA2OEelvXNWS?=
 =?us-ascii?Q?ESB9Fp2yn0Y5xpqKhHSXpaxt+4I80ea+UxhhUxr/fbGjtkdZrwLO4qlHbw3J?=
 =?us-ascii?Q?+w/KoJ6sZOFlEbmchvQYhG+xV/6tsfh3yVM+P4aIKz2xD8HuVmme59mmvTNC?=
 =?us-ascii?Q?aANnSrSrOcTKXqmMTwc56vbWtj8lvv+ZTV6Smtw2BFBG4wuOk10nwrLCMhmq?=
 =?us-ascii?Q?00SofNhuqxehadGWQ5ULuXiiiwZiCNI+qBwUCjeQoZQIcdcTsOX7NfIACUQu?=
 =?us-ascii?Q?fudcBSxs+p6sLZv9E0Y2Jk49E5lxbrDUjFX+Pl/cBdGFsuMJS8m121GIlerp?=
 =?us-ascii?Q?IkL8qvQHVUajp7MmVz2+98P+hdF6iLwlY1h3oVHviCA5V/UwdG7q2ZX8egBV?=
 =?us-ascii?Q?C2NsOM2/rJU7aFzPSlcewgHzEd6uPAUVRn6UP/pd1PeYQF3H2Ze07HQCSFNE?=
 =?us-ascii?Q?fA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b783b30-595d-48e1-e6fa-08db26ff2ed0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 15:49:24.9203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dLWT+TckHDNA+IwBI0WHil+AoYqzvDzSl9urITCk7E98oW7ZGXDZh4RXp3frcgaBzq5kFeWKNQLY03NlCBG/cuyVyiaDFSkQdIV1/r4SB8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7028
X-Proofpoint-GUID: Tq46i6y7PCYDHcKFaIVksvpkgolHLzy8
X-Proofpoint-ORIG-GUID: Tq46i6y7PCYDHcKFaIVksvpkgolHLzy8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_10,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303170106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178757

Backport appropriate patches to fix CVE-2022-2347 and CVE-2022-30790.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../u-boot/files/CVE-2022-2347_1.patch        | 129 +++++++++++++++
 .../u-boot/files/CVE-2022-2347_2.patch        |  66 ++++++++
 .../u-boot/files/CVE-2022-30790.patch         | 149 ++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |   3 +
 4 files changed, 347 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2022-2347_1.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2022-2347_2.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2022-30790.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2022-2347_1.patch b/meta/recipes-bsp/u-boot/files/CVE-2022-2347_1.patch
new file mode 100644
index 0000000000..34ee82c3a5
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2022-2347_1.patch
@@ -0,0 +1,129 @@
+From 9d2d2deabc49dbedf93a7192b25f55d9933fcede Mon Sep 17 00:00:00 2001
+From: Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>
+Date: Thu, 3 Nov 2022 09:37:48 +0530
+Subject: [PATCH 1/2] usb: gadget: dfu: Fix the unchecked length field
+
+DFU implementation does not bound the length field in USB
+DFU download setup packets, and it does not verify that
+the transfer direction. Fixing the length and transfer
+direction.
+
+CVE-2022-2347
+
+Signed-off-by: Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>
+Reviewed-by: Marek Vasut <marex@denx.de>
+
+CVE: CVE-2022-2347
+Upstream-Status: Backport [fbce985e28eaca3af82afecc11961aadaf971a7e]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ drivers/usb/gadget/f_dfu.c | 56 +++++++++++++++++++++++++-------------
+ 1 file changed, 37 insertions(+), 19 deletions(-)
+
+diff --git a/drivers/usb/gadget/f_dfu.c b/drivers/usb/gadget/f_dfu.c
+index 4bedc7d3a1..33ef62f8ba 100644
+--- a/drivers/usb/gadget/f_dfu.c
++++ b/drivers/usb/gadget/f_dfu.c
+@@ -321,21 +321,29 @@ static int state_dfu_idle(struct f_dfu *f_dfu,
+ 	u16 len = le16_to_cpu(ctrl->wLength);
+ 	int value = 0;
+ 
++	len = len > DFU_USB_BUFSIZ ? DFU_USB_BUFSIZ : len;
++
+ 	switch (ctrl->bRequest) {
+ 	case USB_REQ_DFU_DNLOAD:
+-		if (len == 0) {
+-			f_dfu->dfu_state = DFU_STATE_dfuERROR;
+-			value = RET_STALL;
+-			break;
++		if (ctrl->bRequestType == USB_DIR_OUT) {
++			if (len == 0) {
++				f_dfu->dfu_state = DFU_STATE_dfuERROR;
++				value = RET_STALL;
++				break;
++			}
++			f_dfu->dfu_state = DFU_STATE_dfuDNLOAD_SYNC;
++			f_dfu->blk_seq_num = w_value;
++			value = handle_dnload(gadget, len);
+ 		}
+-		f_dfu->dfu_state = DFU_STATE_dfuDNLOAD_SYNC;
+-		f_dfu->blk_seq_num = w_value;
+-		value = handle_dnload(gadget, len);
+ 		break;
+ 	case USB_REQ_DFU_UPLOAD:
+-		f_dfu->dfu_state = DFU_STATE_dfuUPLOAD_IDLE;
+-		f_dfu->blk_seq_num = 0;
+-		value = handle_upload(req, len);
++		if (ctrl->bRequestType == USB_DIR_IN) {
++			f_dfu->dfu_state = DFU_STATE_dfuUPLOAD_IDLE;
++			f_dfu->blk_seq_num = 0;
++			value = handle_upload(req, len);
++			if (value >= 0 && value < len)
++				f_dfu->dfu_state = DFU_STATE_dfuIDLE;
++		}
+ 		break;
+ 	case USB_REQ_DFU_ABORT:
+ 		/* no zlp? */
+@@ -424,11 +432,15 @@ static int state_dfu_dnload_idle(struct f_dfu *f_dfu,
+ 	u16 len = le16_to_cpu(ctrl->wLength);
+ 	int value = 0;
+ 
++	len = len > DFU_USB_BUFSIZ ? DFU_USB_BUFSIZ : len;
++
+ 	switch (ctrl->bRequest) {
+ 	case USB_REQ_DFU_DNLOAD:
+-		f_dfu->dfu_state = DFU_STATE_dfuDNLOAD_SYNC;
+-		f_dfu->blk_seq_num = w_value;
+-		value = handle_dnload(gadget, len);
++		if (ctrl->bRequestType == USB_DIR_OUT) {
++			f_dfu->dfu_state = DFU_STATE_dfuDNLOAD_SYNC;
++			f_dfu->blk_seq_num = w_value;
++			value = handle_dnload(gadget, len);
++		}
+ 		break;
+ 	case USB_REQ_DFU_ABORT:
+ 		f_dfu->dfu_state = DFU_STATE_dfuIDLE;
+@@ -511,13 +523,17 @@ static int state_dfu_upload_idle(struct f_dfu *f_dfu,
+ 	u16 len = le16_to_cpu(ctrl->wLength);
+ 	int value = 0;
+ 
++	len = len > DFU_USB_BUFSIZ ? DFU_USB_BUFSIZ : len;
++
+ 	switch (ctrl->bRequest) {
+ 	case USB_REQ_DFU_UPLOAD:
+-		/* state transition if less data then requested */
+-		f_dfu->blk_seq_num = w_value;
+-		value = handle_upload(req, len);
+-		if (value >= 0 && value < len)
+-			f_dfu->dfu_state = DFU_STATE_dfuIDLE;
++		if (ctrl->bRequestType == USB_DIR_IN) {
++			/* state transition if less data then requested */
++			f_dfu->blk_seq_num = w_value;
++			value = handle_upload(req, len);
++			if (value >= 0 && value < len)
++				f_dfu->dfu_state = DFU_STATE_dfuIDLE;
++		}
+ 		break;
+ 	case USB_REQ_DFU_ABORT:
+ 		f_dfu->dfu_state = DFU_STATE_dfuIDLE;
+@@ -593,6 +609,8 @@ dfu_handle(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
+ 	int value = 0;
+ 	u8 req_type = ctrl->bRequestType & USB_TYPE_MASK;
+ 
++	len = len > DFU_USB_BUFSIZ ? DFU_USB_BUFSIZ : len;
++
+ 	debug("w_value: 0x%x len: 0x%x\n", w_value, len);
+ 	debug("req_type: 0x%x ctrl->bRequest: 0x%x f_dfu->dfu_state: 0x%x\n",
+ 	       req_type, ctrl->bRequest, f_dfu->dfu_state);
+@@ -612,7 +630,7 @@ dfu_handle(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
+ 		value = dfu_state[f_dfu->dfu_state] (f_dfu, ctrl, gadget, req);
+ 
+ 	if (value >= 0) {
+-		req->length = value;
++		req->length = value > DFU_USB_BUFSIZ ? DFU_USB_BUFSIZ : value;
+ 		req->zero = value < len;
+ 		value = usb_ep_queue(gadget->ep0, req, 0);
+ 		if (value < 0) {
+-- 
+2.32.0
+
diff --git a/meta/recipes-bsp/u-boot/files/CVE-2022-2347_2.patch b/meta/recipes-bsp/u-boot/files/CVE-2022-2347_2.patch
new file mode 100644
index 0000000000..708c7923d2
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2022-2347_2.patch
@@ -0,0 +1,66 @@
+From 0f465b3e81baa095b62a154a739c5378285526db Mon Sep 17 00:00:00 2001
+From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+Date: Wed, 30 Nov 2022 09:29:16 +0100
+Subject: [PATCH 2/2] usb: gadget: dfu: Fix check of transfer direction
+
+Commit fbce985e28eaca3af82afecc11961aadaf971a7e to fix CVE-2022-2347
+blocks DFU usb requests.
+The verification of the transfer direction was done by an equality
+but it is a bit mask.
+
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+Reviewed-by: Fabio Estevam <festevam@denx.de>
+Reviewed-by: Sultan Qasim Khan <sultan.qasimkhan@nccgroup.com>
+Reviewed-by: Marek Vasut <marex@denx.de>
+Tested-by: Marek Vasut <marex@denx.de>
+
+CVE: CVE-2022-2347
+Upstream-Status: Backport [14dc0ab138988a8e45ffa086444ec8db48b3f103]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ drivers/usb/gadget/f_dfu.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/usb/gadget/f_dfu.c b/drivers/usb/gadget/f_dfu.c
+index 33ef62f8ba..44877df4ec 100644
+--- a/drivers/usb/gadget/f_dfu.c
++++ b/drivers/usb/gadget/f_dfu.c
+@@ -325,7 +325,7 @@ static int state_dfu_idle(struct f_dfu *f_dfu,
+ 
+ 	switch (ctrl->bRequest) {
+ 	case USB_REQ_DFU_DNLOAD:
+-		if (ctrl->bRequestType == USB_DIR_OUT) {
++		if (!(ctrl->bRequestType & USB_DIR_IN)) {
+ 			if (len == 0) {
+ 				f_dfu->dfu_state = DFU_STATE_dfuERROR;
+ 				value = RET_STALL;
+@@ -337,7 +337,7 @@ static int state_dfu_idle(struct f_dfu *f_dfu,
+ 		}
+ 		break;
+ 	case USB_REQ_DFU_UPLOAD:
+-		if (ctrl->bRequestType == USB_DIR_IN) {
++		if (ctrl->bRequestType & USB_DIR_IN) {
+ 			f_dfu->dfu_state = DFU_STATE_dfuUPLOAD_IDLE;
+ 			f_dfu->blk_seq_num = 0;
+ 			value = handle_upload(req, len);
+@@ -436,7 +436,7 @@ static int state_dfu_dnload_idle(struct f_dfu *f_dfu,
+ 
+ 	switch (ctrl->bRequest) {
+ 	case USB_REQ_DFU_DNLOAD:
+-		if (ctrl->bRequestType == USB_DIR_OUT) {
++		if (!(ctrl->bRequestType & USB_DIR_IN)) {
+ 			f_dfu->dfu_state = DFU_STATE_dfuDNLOAD_SYNC;
+ 			f_dfu->blk_seq_num = w_value;
+ 			value = handle_dnload(gadget, len);
+@@ -527,7 +527,7 @@ static int state_dfu_upload_idle(struct f_dfu *f_dfu,
+ 
+ 	switch (ctrl->bRequest) {
+ 	case USB_REQ_DFU_UPLOAD:
+-		if (ctrl->bRequestType == USB_DIR_IN) {
++		if (ctrl->bRequestType & USB_DIR_IN) {
+ 			/* state transition if less data then requested */
+ 			f_dfu->blk_seq_num = w_value;
+ 			value = handle_upload(req, len);
+-- 
+2.32.0
+
diff --git a/meta/recipes-bsp/u-boot/files/CVE-2022-30790.patch b/meta/recipes-bsp/u-boot/files/CVE-2022-30790.patch
new file mode 100644
index 0000000000..e67cf391a8
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2022-30790.patch
@@ -0,0 +1,149 @@
+From 1817c3824a08bbad7fd2fbae1a6e73be896e8e5e Mon Sep 17 00:00:00 2001
+From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
+Date: Fri, 14 Oct 2022 19:43:39 +0200
+Subject: [PATCH] net: (actually/better) deal with CVE-2022-{30790,30552}
+
+I hit a strange problem with v2022.10: Sometimes my tftp transfer
+would seemingly just hang. It only happened for some files. Moreover,
+changing tftpblocksize from 65464 to 65460 or 65000 made it work again
+for all the files I tried. So I started suspecting it had something to
+do with the file sizes and in particular the way the tftp blocks get
+fragmented and reassembled.
+
+v2022.01 showed no problems with any of the files or any value of
+tftpblocksize.
+
+Looking at what had changed in net.c or tftp.c since January showed
+only one remotely interesting thing, b85d130ea0ca.
+
+So I fired up wireshark on my host to see if somehow one of the
+packets would be too small. But no, with both v2022.01 and v2022.10,
+the exact same sequence of packets were sent, all but the last of size
+1500, and the last being 1280 bytes.
+
+But then it struck me that 1280 is 5*256, so one of the two bytes
+on-the-wire is 0 and the other is 5, and when then looking at the code
+again the lack of endianness conversion becomes obvious. [ntohs is
+both applied to ip->ip_off just above, as well as to ip->ip_len just a
+little further down when the "len" is actually computed].
+
+IOWs the current code would falsely reject any packet which happens to
+be a multiple of 256 bytes in size, breaking tftp transfers somewhat
+randomly, and if it did get one of those "malicious" packets with
+ip_len set to, say, 27, it would be seen by this check as being 6912
+and hence not rejected.
+
+====
+
+Now, just adding the missing ntohs() would make my initial problem go
+away, in that I can now download the file where the last fragment ends
+up being 1280 bytes. But there's another bug in the code and/or
+analysis: The right-hand side is too strict, in that it is ok for the
+last fragment not to have a multiple of 8 bytes as payload - it really
+must be ok, because nothing in the IP spec says that IP datagrams must
+have a multiple of 8 bytes as payload. And comments in the code also
+mention this.
+
+To fix that, replace the comparison with <= IP_HDR_SIZE and add
+another check that len is actually a multiple of 8 when the "more
+fragments" bit is set - which it necessarily is for the case where
+offset8 ends up being 0, since we're only called when
+
+  (ip_off & (IP_OFFS | IP_FLAGS_MFRAG)).
+
+====
+
+So, does this fix CVE-2022-30790 for real? It certainly correctly
+rejects the POC code which relies on sending a packet of size 27 with
+the MFRAG flag set. Can the attack be carried out with a size 27
+packet that doesn't set MFRAG (hence must set a non-zero fragment
+offset)? I dunno. If we get a packet without MFRAG, we update
+h->last_byte in the hole we've found to be start+len, hence we'd enter
+one of
+
+	if ((h >= thisfrag) && (h->last_byte <= start + len)) {
+
+or
+
+	} else if (h->last_byte <= start + len) {
+
+and thus won't reach any of the
+
+		/* overlaps with initial part of the hole: move this hole */
+		newh = thisfrag + (len / 8);
+
+		/* fragment sits in the middle: split the hole */
+		newh = thisfrag + (len / 8);
+
+IOW these division are now guaranteed to be exact, and thus I think
+the scenario in CVE-2022-30790 cannot happen anymore.
+
+====
+
+However, there's a big elephant in the room, which has always been
+spelled out in the comments, and which makes me believe that one can
+still cause mayhem even with packets whose payloads are all 8-byte
+aligned:
+
+    This code doesn't deal with a fragment that overlaps with two
+    different holes (thus being a superset of a previously-received
+    fragment).
+
+Suppose each character below represents 8 bytes, with D being already
+received data, H being a hole descriptor (struct hole), h being
+non-populated chunks, and P representing where the payload of a just
+received packet should go:
+
+  DDDHhhhhDDDDHhhhDDDD
+        PPPPPPPPP
+
+I'm pretty sure in this case we'd end up with h being the first hole,
+enter the simple
+
+	} else if (h->last_byte <= start + len) {
+		/* overlaps with final part of the hole: shorten this hole */
+		h->last_byte = start;
+
+case, and thus in the memcpy happily overwrite the second H with our
+chosen payload. This is probably worth fixing...
+
+Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
+
+CVE: CVE-2022-30790
+Upstream-Status: Backport [1817c3824a08bbad7fd2fbae1a6e73be896e8e5e]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ net/net.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/net/net.c b/net/net.c
+index 434c3b411e..987c25931e 100644
+--- a/net/net.c
++++ b/net/net.c
+@@ -924,7 +924,11 @@ static struct ip_udp_hdr *__net_defragment(struct ip_udp_hdr *ip, int *lenp)
+ 	int offset8, start, len, done = 0;
+ 	u16 ip_off = ntohs(ip->ip_off);
+ 
+-	if (ip->ip_len < IP_MIN_FRAG_DATAGRAM_SIZE)
++	/*
++	 * Calling code already rejected <, but we don't have to deal
++	 * with an IP fragment with no payload.
++	 */
++	if (ntohs(ip->ip_len) <= IP_HDR_SIZE)
+ 		return NULL;
+ 
+ 	/* payload starts after IP header, this fragment is in there */
+@@ -934,6 +938,10 @@ static struct ip_udp_hdr *__net_defragment(struct ip_udp_hdr *ip, int *lenp)
+ 	start = offset8 * 8;
+ 	len = ntohs(ip->ip_len) - IP_HDR_SIZE;
+ 
++	/* All but last fragment must have a multiple-of-8 payload. */
++	if ((len & 7) && (ip_off & IP_FLAGS_MFRAG))
++		return NULL;
++
+ 	if (start + len > IP_MAXUDP) /* fragment extends too far */
+ 		return NULL;
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index c4cfcbca19..4120ef9ff0 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -7,6 +7,9 @@ SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch \
                    file://0001-net-Check-for-the-minimum-IP-fragmented-datagram-siz.patch \
                    file://0001-fs-squashfs-Use-kcalloc-when-relevant.patch \
+                   file://CVE-2022-30790.patch \
+                   file://CVE-2022-2347_1.patch \
+                   file://CVE-2022-2347_2.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.39.2


