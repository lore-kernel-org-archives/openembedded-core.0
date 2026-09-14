Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A67AC88E50
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 12:11:36 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18563.1789387889938555241
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 05:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Bt3MwcnH;
 spf=pass (domain: est.tech, ip: 52.101.84.60, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZpd02M38kTd7QUvb8ZhCAN8zPE/o7qHFdRVqiw1mACcvF1SxYHPtWSIjmFFfKKzj6q6Rj5Bo+riURwn40kNKBI8NwYO9Uc3CJ1gpfA/buyLDd0zTvs9K3B4bHJE7kedCMES8egIhfbinYfgqdo9EsEMpQc4GjKQpdUDhg9IXOjA5fTeHtzfw/TfGjUk1fPDRfJBD0u1ZF1tzs/sFt2lzC+rFZ0QGXavCg+0QOyYGRyJkXgUS3CZlYQ24mfxrsy6zO4LKQ3pPvRN3FCJPpTjNw2VzDqQ4TAcJ9PMH3g8jQZziEWIfcdIVrDxXprxXtzMkOp2RUQdlMI/UwKo4Bf92Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6gSDZAIlkG+lCqQTQ7S4cPV5upfSJ2M3TXOCSMfNUk=;
 b=UoPgtX7u/DFanhdSEhtdjIY0uCXA/Bo9hw6aMpV6fPc0DInO/b4/3MvzAX8g+qy7qH0abDlTInWgqkByCw0nWe7hUXqLpCbU2rxs2Lv8jp1ERVQkv+6EFsJAw5XIcpYiijDP9jqTRreJAR1PyTDk6gWrPU1ikYcj9QMVVVxBc2TnSiHbypdtLkpw875zgDQcr5TRdpagStbVMSxW2p+DCCXo4YTlxxusO4Pt16AD3mFiX5vG1sLiZpMqCkfDmNGNmOkJY8/qoKIYnPla5LPtgRgWCZjNofi946EFuO44s2x9bACQ8hmkVLkmbmZPpaH/grOTKFj9n8r086Ro5QFlog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6gSDZAIlkG+lCqQTQ7S4cPV5upfSJ2M3TXOCSMfNUk=;
 b=Bt3MwcnHajJhNMFJrkRxYZaheOvIb4mKTSqDPGGwzekJpg2tj5tVo3MrZo4YQnF56VTs1p40jS+VcwnmxGENPT/WTQBz1Y3Or5zJB7XXxnCpvxoJ2Dpakod0fjkwlAsV5NuDjJHTM5kiA7PxyeFm/iwjueLVcZ1jBG5PvIHlDpBAmTqlO/PTO5+9FM3AIu/FUur2DFjbGkloQZSAqk28kA8n4PTJfbS/wpvxEauhf4uVme3WEEBHx6Lc3JoZEhGcMXUGfiXH3tEzGTGjzyW9XJYGECpCYgfngi6hJhAl13tKYi+Pxpc06UEn3NXJxI2tVGG74CUcPrO17+zpRB6pWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS8P189MB2444.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 12:11:25 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 12:11:25 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 1/2] dhcpcd: remove obsolete explicit debug packaging
Date: Mon, 14 Sep 2026 14:11:20 +0200
Message-ID: <20260914121121.81692-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260914121121.81692-1-jaipaul.cheernam@est.tech>
References: <20260914121121.81692-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0201.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::12) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS8P189MB2444:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b0b8cf-a1a2-431c-1aea-08df12594c24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	zAjGJjLQDswkeqfYEMIFGvnqap9MWcLNInVXsAxb/M/wLa3xlS7bZMfXnpC712t1nA/I01e72CDtWADP7zk++0coMvTBP6PRqFVtSuF9sxqHGhiRXrqm9umnD3z90eeu71SOPURyu43hcmNS7sEprdCKmVKlNydK/ncUNPsJnzknROW5ZYIbaBM9z+WE6cPD3RNQenqGUzWd+/c69faVClq1NBpvw4214yoJynwJI8hi+C0CtSnvJQyGJANAchSAtfYLx4lcxZXJygM+BCncnkohPnXcILXCIZlxaDwImnc06y+GwbDG1tos9urIZr4i5hmX6jqX5MV2R78D9kjh33BNzPoIZbI86WpQ2P7vDFyytcaBp7VFD+xGrMpKnJ41mAEinJ8N99Simss2iNTF7K2sHb64E5SlM0jR7G6pi3qjOsjpjLdgYXpcmKFdIB+Mo9CtFo/a4MyXGjUmWQqke1cYX6iXSV0tcVjHwmtp65lZuGqbIcGEO4j9uOC7YVfmvTnhCWP5Zx8m4evdRvfnQecrBaCAsiguZFQTGyObWloSldbLVcuZ5/iTD/PFyM5eaEh7+PMEH2wvnvMu7EtgytFfYWeFbfAWOG9rk/1M0FpIh7D2VOZoMIjHv6n2dx52d1hXRWjzFD+G7Qyib42wDfgHtwaFJSpj9mMMlezccSI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TyKrhqw9kPlmLh/nX+ZD5UGSwkxP9CS87bbsJr2gRYGJ6uCQoOPpQitzLhVC?=
 =?us-ascii?Q?eun4GrRAFdCAnCTBnzof5iRNNxspzmA3SPGxR0WWMJ6Un++ZqOwvugxkHptt?=
 =?us-ascii?Q?XhARCVEXsI1UIDZdRIBizLLlU4IXhDBqW86mEK0hRbIl/izsBhFjWoD59SGG?=
 =?us-ascii?Q?H5a+MyBrm8wlhhUGImlxvJJHHQJ0kf4mbLcHI06KyBnqrlx/uhQoEtsM28+E?=
 =?us-ascii?Q?FP3/3XEwka7vRPQ0m3Lkke5VlFxErrMCAqg/DQv/0S+6lxq/dUbv/R72F0CU?=
 =?us-ascii?Q?8/yk4c1r1Qepg45qDQ95yePYS82DwFIe6jLAzRHWKH5BUoDCUW0FZ0RmMuBL?=
 =?us-ascii?Q?/Yud6Cn5dBFqbW41oDlLNSKlf6CFfHOHEUxEW06uTEaCf2w2LBhsMIsuU+Ek?=
 =?us-ascii?Q?75IcqgTQIKIl2LzbsO/Uorv+o1bAWNquC+nH7wTI1WwGo4vmtlg5I/5sFRHw?=
 =?us-ascii?Q?n+F1PkRBashlhstvPpRUXhAPHw8iGGRU9Hq/oB+cBbk+smhqGT7Mg/AzpKqM?=
 =?us-ascii?Q?GUIBzFmQ0xmgo+6eH+DK0yH3ZHGNaX6njJsTcIszteBTTfsKElZsErGF+zpf?=
 =?us-ascii?Q?0h0p+k8Km5NzyASsBu9RDurE+O9AY2MWcP8QJa8c+9X+jQbtItAdFuatB516?=
 =?us-ascii?Q?CmFRGmeJFYisLxQDDd5iG7LdwrqQWsHwVYRxwJ/skSX0sH/sBvltqthh6YIZ?=
 =?us-ascii?Q?me066A/iEwmMAT/zHWNOrhYxhgDAl1d5CS8IFHuOj8TXZVItj/ESGqEORO/D?=
 =?us-ascii?Q?u+Vx66uGVLukp8zDJcqkwDDR5EsrOYwrnLaS7tEnQTL5qrzk6JDsd2K4VkEC?=
 =?us-ascii?Q?dj5F6xG1VUUKkN0ESUnGPACchy3o4D77uUU129BxDTyZkd4ZTKeBTFJ6Saan?=
 =?us-ascii?Q?HLMWIU+4XQekkrQ/qvh8VEPbylr7z12Q5P/HJ0drQqqhKEauSL3+QnXTP4BL?=
 =?us-ascii?Q?PQbSTgS0VaAx5V5SrWHV3kDq3zGBy5S/F12h/Z5E2Gr8vZXqODDhT0mGviZP?=
 =?us-ascii?Q?RKU7gLzgCNyEWnKQqzWZlCmhjjfLGfAMVm7TOVnuPJTyY2yq/KPSdpAOfQW/?=
 =?us-ascii?Q?8LJwBc/I6RgwBvE5X1xr8xMHb38ggjCVO+hfijSYughMqQbUJtiTZIFZAIoH?=
 =?us-ascii?Q?DpNnobLwY+ZYr5C68WwwRqXyYvX0klQ/8LjX5j5LY4TJ80l9Jh2InGWpiTrU?=
 =?us-ascii?Q?ibxdEz8FnX8vFo0c2Ips9V+HU1pYsCWDgdFcUBkdyZkfw+2U085e6i4xS/Rg?=
 =?us-ascii?Q?KM0Nrsdj7qG/ecV6j5B84K8WEoKKmyEgm9AyfhLYZ5qpI0vg7Ft34VT8I6bP?=
 =?us-ascii?Q?IELad44NjlD4wtrwM1u5FvhzrmoFIk0hT/yL1Omz7T2RU83o++F0mEU9ptLo?=
 =?us-ascii?Q?ekiBj11tznTWrrJn0iWO/D3SG98lWZtsdSJGs+1XNOYpNvhRMtp5/qztLi+n?=
 =?us-ascii?Q?WwrYICVYvSeMzjgtBO2VDGd0yob6A2peqAcLG8worMAq6kZquY7YDL0snbtW?=
 =?us-ascii?Q?8QQWEKXj3QGNwiY73Cbz87bNyBs8+kA45HvT40sKbLW1O9oUB0USVfIlFuou?=
 =?us-ascii?Q?O534vX+7TbYa7m58Qk74HJsb3Nm5duOJJJBL8aO8CnZZs3T3F0kcP2syGvmb?=
 =?us-ascii?Q?4+3sAwXl8EMOUziesgo5Zcw1NsmVDs15ygNjv2Nq05YQlPo5n7L5y4KdJIyE?=
 =?us-ascii?Q?HKYQZwYwsyuP96z0yppnlY9k/VFN4ME14trSneSaDIEsIbuWxkTlYgexY4Bc?=
 =?us-ascii?Q?r5QhEPx7ow=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b0b8cf-a1a2-431c-1aea-08df12594c24
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 12:11:24.9990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rbN8wb49SApTrFQK3FVUnspOOPaQVHHcqYrycY4DatMIm+iMyJryHlYavjL3o7Pl28bmW/iaNUvNy0M+zS9yKSmOg+6buYijUSNF3hmrE5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2444
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 12:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245775

From: Ross Burton <ross.burton@arm.com>

The .debug directories are packaged automatically by default, so this is
redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8c3e8394c53581fd6b1d69669f6e0668c5af9d13)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb b/meta/recip=
es-connectivity/dhcpcd/dhcpcd_10.3.1.bb
index eb257cb27c..065451c065 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
@@ -67,5 +67,3 @@ do_install:append () {
     chmod 700 ${D}${DBDIR}
     chown dhcpcd:dhcpcd ${D}${DBDIR}
 }
-
-FILES:${PN}-dbg +=3D "${libdir}/dhcpcd/dev/.debug"

