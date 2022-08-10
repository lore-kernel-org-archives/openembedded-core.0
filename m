Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FFAC00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 14:12:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.6308.1660140748211111611
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 07:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=UQDtOhDJ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5221100a95=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27ACdJdF006366
	for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 07:12:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=zMlHjrdWv5Grv+LQ4YnwvU+xejbp79BbnBUfiLOXFSs=;
 b=UQDtOhDJzlKrlJWKiLTy+tC+5i+2A+dD4GYYAUXsrpKh83jeny+E/EExcJKogWDPK7ND
 WjXHENOeeDNHCjX8ySYfrMdAH/KWutUQrQM+Ecam0DGRoLkF822Gd2Y4cWuuMfQBIJno
 CTZQjVm18Tnk9GkCmBEB8WFSPxEjDcnPLZm9X9h3FIJ56I7wXMIhCHdP1flIq+BRagG7
 xqw0RTF0BdAWYE5gNV2A1jdDjxTcnG29GRDDbnQx2+djqX58llc+wg5Kp9BzcaJGf0jJ
 8gdDn6xWSOUxdrOKB18/R5nP34TIbTsHnu468t1CTrGI31zI71qTY51gAsyfZX2OUvYL zQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3huwr7rkp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 07:12:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQmldeaIWV+Y7ymDQTLPJsO06Gq+IudGzwJ8fkxZDgeiA6uw+36YXer+eBIRebpvoV8iqNu0AuNk/7pHsTeIpAJJGBjB3wE5qGc2zL2siltQj51eGXA1+10HED8z4QFKeohpB71iZrlvb62ZhItFippZ3S0yZCezfThBZ/gv5D2yP2+bZCl1tARy0V1TmAf/qY+Lan8S5DopreJuXtAjEhKxquw48j3+TN5lXP7tyb/q9MNuLTw3fOtxdP0rUyxLQv9yDBIe6IU7QbbCvI+B+wd+sOOeAL9ljbpmdVppVdMU6PmgSqdJTZoJpnvFYkLOI4DK0/+cFziF35dgUrbidw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMlHjrdWv5Grv+LQ4YnwvU+xejbp79BbnBUfiLOXFSs=;
 b=LQWdPEJV2eD60BN5gZx6TvFpj46mHy/3pdRpmFutLO7o3zD6qEACZI9ZtRAU93KcN/oufZWCaUY1ICHxpJc99Vl8wkxVe0LKkYZaqhN+q29l968y90XzMLmbp7aClEoJHt+WFm7ZoDa+wiy2IkNIK2xO3Q5Waz31KzVpZOaOd2gz+VrRX0PXhUAr8tvA+qPTyJjWqVGTPoEDx6I2yRseXxNIekfgaTLiWsPyq/BWtXzA2rMFlNu3zcFR8XmMFHxC0heGmie702M84pnLjP2YHOAleVOcZiM37QcPvvUyEWywU5iMsZ+dNgda1gNIXKiInLOHu6hzn00aWTW9WyePLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 MN2PR11MB3646.namprd11.prod.outlook.com (2603:10b6:208:f4::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16; Wed, 10 Aug 2022 14:12:24 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf%7]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 14:12:24 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 2/5] qemu: fix CVE-2021-3929
Date: Wed, 10 Aug 2022 10:11:56 -0400
Message-Id: <20220810141159.21182-2-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220810141159.21182-1-sakib.sajal@windriver.com>
References: <20220810141159.21182-1-sakib.sajal@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: YQBPR0101CA0130.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::33) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a9481cc-5a65-4835-2da9-08da7ada58d7
X-MS-TrafficTypeDiagnostic: MN2PR11MB3646:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xu+TmkihkyhQ78b+H1e9OLNIVcCvby0vNLFeuD7+VSgKj9iVK90EDzWOgZDdJ5q+3vyG05zddgUbZGvPTTSjrAp1StvF6X5xp/S4tYR/IIYaJtF3MnHVqCxU/vRHDipDSJMD2rFYcc1llet3sZb7aVQkrkuwaNP82YaxpMQ4WHI0Sg7h2nuAQSPyV0pcT0+OPo7cphNm0+mxJRVEe9tPcbamIikX6a8E5jJuHvUXglSwWu8JJIAAJ4r/V//l/xfMuIzvu34sL8uterzTuJnaq1UTDAfJUzb7nd73Q+0JyjMs9Nkt9ZfhR8tkRPFuHboR8vHQz683X1BLssdL2Bsmo4BdWYI8pFcNhrqzXD1Hdgd7Fp1RbxZYf/RdREnIVraXKwiLeoh+iE74Ojp4g5OKE/Y2nde95EipQBBq+3H0DiuGxTEjO0DpHh+C6GRnxH5RglXAKiz2SP7G8BLdihyg2gk1VCGvUc4QjQxCDVRqv53TYjTtQNoFb1Ra9BQjGM2LEVS/nmW+LFyZr/5vj3sQt7PmVA3NswHKCeKE5XzI+LRtLhfo1PhuYwu4jByzn0OaXfDyNX/kV8Bw2tWU7a9WSkzj07+NzNmAQMnMMPKLP6ZNbPKlPznyV34pTihe3xQFOU3TAX5hexcKs9vWq5qZB11TDpd5GnnRx/2MFUy3SUNnU1UtottYtIvnjnBKq0ht4VIPANNfsS+gxDLCBDsthAiPkRjn/8LkAe79do/3C49rNP4BUk5MqTVbxm35RMjy4YjmIkRqsFzqaVLmIMa1Ql/Ev8unFE8LeZr0NclKYW8rORFIFTDzBWPjAtwl8kPT349Wd1BQphoAEVVN8dv7cQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(478600001)(6486002)(41300700001)(45080400002)(86362001)(6666004)(36756003)(6512007)(26005)(6506007)(186003)(2616005)(52116002)(83380400001)(316002)(6916009)(1076003)(8676002)(66946007)(44832011)(8936002)(66556008)(66476007)(38100700002)(38350700002)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WEJoZUpBcW9pSzEvTEVGczVrbDdkREJ3R2xBdmRIZEtGc0IyNVJINyszbGxU?=
 =?utf-8?B?bnFHYTU5bmxxc3RVV1lyM0tkaXo1Mk1RbHJ5My91YzhEZFNuaTFHRGpPSHI1?=
 =?utf-8?B?OWIyc2orWk5pcXJjQmNmZDh4SXZXS2JpQzFXWTZoRkNyN2FxSXUvV3FveWh4?=
 =?utf-8?B?QUhqTEhzRk12YmFoSnVBMGtLRElvd3FRQVpuRy81SWQxMTNzUnN3K1JKLzhT?=
 =?utf-8?B?SnE0WGIyWEZoaFI0N0U1M1B3elVLRTFnMm5OQk4zQ3NjNmtaajh6SE5yUU9U?=
 =?utf-8?B?VWNRWEh0bHY4NzdDL2JGNDRKS3dnK2JtV2FaQkhJWmF2WXVXUjBOZVJvQzVP?=
 =?utf-8?B?NHFPVzVrM1czamlHMGhXWjE4Y1dHaldlaE45Z0svNXVHS1QwL0VIdVJOekRR?=
 =?utf-8?B?TXlHdnFQSFdqbzhnQVlVdU9UQzNHdjF1bGVBSGRSUldXNUgxS0hrV0ZTMzZv?=
 =?utf-8?B?YmdsZjFWdzJWSnVHdEdWTG03MExvaThhd2RUbVZUajgzQmhSY3JFeW5nd3Z2?=
 =?utf-8?B?UVlUWXp2eEJwT3lkY0ozdUpzUjhrcm44WGhxdzlpWUR5OHIyUTlkT1JENFAx?=
 =?utf-8?B?N01qVUp4aGV3eGtrUUZOOTgxbGtVcXZtc0FROXh0eDNQMllZTEVPSm5GQ2sx?=
 =?utf-8?B?dVNkN3NlaldyM2lCejZGSFcxTUoyeFFmQS9VcmJyTDh1Rm9NYlZFeHRVUzRa?=
 =?utf-8?B?RlpkS3o4M3p0UENlOG9ucCsyUkRyZ2tWek02QURlRDJObzN1aFdoVjFjT2hu?=
 =?utf-8?B?RHpUS2toOFhaSkxnZUxXeStBT3V6QXRaOS85cFg3bUlPbFJhS0J5N2pXWG1r?=
 =?utf-8?B?VmthY1Rka3Q5UVNFMllkYWlKRXNMR3VjbXVVOVppU3Q4SnBIeUxmaXJEcGJw?=
 =?utf-8?B?TklteVpLekNtd3hwcEhYZGNudlAxVG5qcHVQcFVpZUhoTU53anVwT0Zxc0Zn?=
 =?utf-8?B?SXRENGZmdGlzaGpSMURCTjEybC9UZ3JDQi8rZnN2bEJ5VDZObUxuTndHZytK?=
 =?utf-8?B?Q0FBTDkvamlEUWNyNW4rZkN5Y25zN0RTQ2tDWU9KZFlsTmdKZS9aby9PTnp4?=
 =?utf-8?B?TmYvTEpZZ0tpbEhDY1Nzb21NSWVveitBS01LMVhWamY4RnZkZHZBRzNSRjFD?=
 =?utf-8?B?UHJrcEZJQWtTUSt5OTkwUjZzWjd1Rm5GbGtCbWpyUmZ1cGRrUExtTVB3UCt4?=
 =?utf-8?B?M00wVlAxd2djUGVXRXlvbGZ2VVg0NFhCcXlDZVlqRmFnQmVrY0xIY0JWRGpz?=
 =?utf-8?B?RFlZTWFJc3hxd2ZQMmxMK0YzWmFrdEJNblR3ZnhvS293d2JwUlpsQXNNZWlX?=
 =?utf-8?B?RDhOOEdRYlV0UXRjeHU1NEdHRWpGR2xyeWM0SDFKajRVUSt5ZkJHV0JxZE52?=
 =?utf-8?B?TC9xYk5Wd3pGWHpVRDR5MVVhbUM2bXViaDZuWU1pRW9qV2VybTJNNHZETUhU?=
 =?utf-8?B?M2RBWTVDNFVQK1BzUDVWaDVNaVArZlBHbmowaHVKRktwUllpVHVtQ2lYSWFO?=
 =?utf-8?B?dUk3U2ZVM0ovT2prVCtZZVQxQU5ucXhxLzhIMlRzWlMzbTZCekVlY0s0Wkho?=
 =?utf-8?B?Z2YxSnFxbjBuUEpVQ2UvWWt1SitVdytvdU1Uc3pRZUlNbzhxS0hvaGdvUlhW?=
 =?utf-8?B?MUxFNWlYT2RSbXk4VnhlRXFUK2FEbmFUQ0ZhcVp4Qm9haFV4OGVoR2FUUld6?=
 =?utf-8?B?Y0RyQVdnNFY4SGpNK3hCNUlDZEdnU1JkMmc4VVVrZUdTeTJJSWxkU3d6QVNy?=
 =?utf-8?B?ZHNldzZnTVBXUE5vMW5wMHhYN1dIVE1VeGdBa2d4UTAzT2VaeFRMcDVzcS9q?=
 =?utf-8?B?RE8rM0dDWE8wSHpUUEJ5VEg3clJhR095QUtUVm9PSmY5dXgxeEM2SlpaclMy?=
 =?utf-8?B?V28zZ1FvVVYxbFArR1NlUDNBQ1NpTVM1NUF1MTUvWFBTMExqZ1YvbzJGMXFr?=
 =?utf-8?B?aWVyU1g4OG42ejFxcWZLVkp2VGJIdzBNNnlLL2haVVBhbDhyQXd2eFl5YTZJ?=
 =?utf-8?B?Y05XbUQzUXRPdkMzajFvam5WeVN4T1NiMGdqTmVxNjN1YytHVnVyK2s5d1o2?=
 =?utf-8?B?aHFlTjhuWldTRHI3VGduYlllZmZvMVNnajdyZ0FVQjFVaktPUDFIeXA5MFlv?=
 =?utf-8?B?UXFkZkdkNDJVSHErS1UxZTRPdHRZT25NSFJZeTAwZ3dwWVJhUG1NcGtKSmxB?=
 =?utf-8?B?alE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9a9481cc-5a65-4835-2da9-08da7ada58d7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 14:12:23.9396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 V5UEdYVE82vp2xOHn3n+6/X2b26O6u5XP7LicP2nTI3cHSq6oME0WHqJ0tF12H/ePk/+sdI0JwBWrIgEHb3uHqRS7Qy/l1hJtOedGQ4WLaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3646
X-Proofpoint-GUID: kjV8vgI0C-pWt9ddTmzX0gKYsd2aGMMG
X-Proofpoint-ORIG-GUID: kjV8vgI0C-pWt9ddTmzX0gKYsd2aGMMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_08,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 mlxlogscore=577
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100045
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 27ACdJdF006366
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 14:12:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169192

Backport patch to fix CVE-2021-3929.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3929.patch             | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index dd30313fdd..53bad5c453 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,6 +38,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://CVE-2022-35414.patch \
            file://CVE-2021-3507_1.patch \
            file://CVE-2021-3507_2.patch \
+           file://CVE-2021-3929.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3929.patch
new file mode 100644
index 0000000000..7555e5bc40
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch
@@ -0,0 +1,70 @@
+From 12daeafc9868c1ebe482d580494f9e6d3d5c260f Mon Sep 17 00:00:00 2001
+From: Klaus Jensen <k.jensen@samsung.com>
+Date: Fri, 17 Dec 2021 10:44:01 +0100
+Subject: [PATCH] hw/nvme: fix CVE-2021-3929
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This fixes CVE-2021-3929 "locally" by denying DMA to the iomem of the
+device itself. This still allows DMA to MMIO regions of other devices
+(e.g. doing P2P DMA to the controller memory buffer of another NVMe
+device).
+
+Fixes: CVE-2021-3929
+Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
+Reviewed-by: Keith Busch <kbusch@kernel.org>
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
+Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
+
+Upstream-Status: Backport [736b01642d85be832385063f278fe7cd4ffb5221]
+CVE: CVE-2021-3929
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/nvme/ctrl.c | 22 ++++++++++++++++++++++
+ 1 file changed, 22 insertions(+)
+
+diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
+index 5f573c417..eda52c6ac 100644
+--- a/hw/nvme/ctrl.c
++++ b/hw/nvme/ctrl.c
+@@ -357,6 +357,24 @@ static inline void *nvme_addr_to_pmr(NvmeCtrl *n, h=
waddr addr)
+     return memory_region_get_ram_ptr(&n->pmr.dev->mr) + (addr - n->pmr.=
cba);
+ }
+=20
++static inline bool nvme_addr_is_iomem(NvmeCtrl *n, hwaddr addr)
++{
++    hwaddr hi, lo;
++
++    /*
++     * The purpose of this check is to guard against invalid "local" ac=
cess to
++     * the iomem (i.e. controller registers). Thus, we check against th=
e range
++     * covered by the 'bar0' MemoryRegion since that is currently compo=
sed of
++     * two subregions (the NVMe "MBAR" and the MSI-X table/pba). Note, =
however,
++     * that if the device model is ever changed to allow the CMB to be =
located
++     * in BAR0 as well, then this must be changed.
++     */
++    lo =3D n->bar0.addr;
++    hi =3D lo + int128_get64(n->bar0.size);
++
++    return addr >=3D lo && addr < hi;
++}
++
+ static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size=
)
+ {
+     hwaddr hi =3D addr + size - 1;
+@@ -614,6 +632,10 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, NvmeSg *=
sg, hwaddr addr, size_t len)
+=20
+     trace_pci_nvme_map_addr(addr, len);
+=20
++    if (nvme_addr_is_iomem(n, addr)) {
++        return NVME_DATA_TRAS_ERROR;
++    }
++
+     if (nvme_addr_is_cmb(n, addr)) {
+         cmb =3D true;
+     } else if (nvme_addr_is_pmr(n, addr)) {
+--=20
+2.33.0
+
--=20
2.33.0


