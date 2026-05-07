Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC87CD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 06:20:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5972.1778134834149833871
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 23:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QACWwqfM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9587885fd3=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475U3M53018582
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2026 06:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=8u8Eu66BKsSKnXo3KrftGEwWsaB1uWIpRvrIWHgM0Lk=; b=
	QACWwqfMxvnRf00/HUsauHxUH0fixChPKN6tO5oiFYy1EqYFLXpFFdaX750LNAKK
	731V/JsyOhlTIyIt3IJWvLi0vnXqHQrHrNufoLvmVlKOd6YMMerRMmZSn7L6cldM
	GuY2LQ0cXqOGQJpLqjE3MxzAIu8Q4ZMGPGTGcJKbO53IVFgqjxlOZZurmY5zW5vX
	ynSgLGp6NQvyl7NsjQs4pCJBJx/3ueMT8AixjnqDtn7Vi930PRNM5il6KYTQHEYY
	vOxQnqs/GzYYp9t21MHSnF1O0FHH/NcTGXKpF0a8Pcn+ss3pXJRYlvrkd31t9n0K
	WqMpRT3e6e+sSjumgKENoQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010010.outbound.protection.outlook.com [52.101.201.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dw8pu64qh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 06:20:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FPQAVNLVP9lGbxSGKtupaT49kSzljerPOdZ6SWuHP1n1zyF3NXxsq0qdLES2HTuFYjObQOOH+mv7YCD5E/uQFuM+XXvDo1jxGg0K+fHRc9sMSbPLCvIC7nx5bItyrMGTM+kUYjNEV0boNpkGSiJsiLtprEVBNOBUMurLYJdtfoZ85l8WOzuDY44KIvjcua6gujks/CTV7AVcB6sto2IcTwJjkkS4u69wag5kAQEztONJtbDYx/XT1Hp1SKLvFQX+aMHYkzgsuo7+ysuip6XHHx7KKXNQuEb5ni9iNKMA2uXsVAWrQY8N7khYWBvLqSMqcrwm31NDMX0p0q7XC9002g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8u8Eu66BKsSKnXo3KrftGEwWsaB1uWIpRvrIWHgM0Lk=;
 b=UKuTUjzOEQDRqK+NuXkosHcoO25SX4Vsjklq2DRNgfx0NtLhCPvJOgUEDGa1j50iXakoNzABr3MdaEI/3dbWBif0NMCT/syToPkJOW6hOHgbAX2JW3oTxu9BZ8xC6RlegDND7jy7oAsAttdl6tFDLwHkOGAptVS3EQHxfJbyt0Sd5QyZO7iEVs69eZ7BiUaVUiis+25YBtv2XITS2xFi8dYqp43VqCOnsb8FshMEuBb+Gr0PmJu1G6CIUM0QqefJOcQmr3tJlPB/yTmL/+eE8r7O9Orj4TyyL82KwG/99bZ6io+Fi4VAPoPaD+tfGtupKZG/7+n72hn/2bb1IcewEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH3PPF383C22AA3.namprd11.prod.outlook.com (2603:10b6:518:1::d17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 06:20:30 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 06:20:30 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V2 3/4] kmod: set UPSTREAM_STABLE_RELEASE_REGEX
Date: Thu,  7 May 2026 14:20:09 +0800
Message-Id: <20260507062010.1461027-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507062010.1461027-1-Qi.Chen@windriver.com>
References: <20260507062010.1461027-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::9) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH3PPF383C22AA3:EE_
X-MS-Office365-Filtering-Correlation-Id: e6f74422-57e5-4624-aca4-08deac00bcca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|22082099003|18002099003|56012099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	gL7xrK/XzEdxw8sIpJFBR8FaTk1oQAdQjf3vP5o8uVXV0QIGI463D/OSsNm3OGFL6rX5+3JJzkFlSNWw0eWQGzIeLALG6BBhOMea9V8MRtQ71OhfDTIcyR5XfTHifQr5SYhkixoQ9ca7WMBbzAxbBsf/G+Ear2Xwvq2dmgGk2IZ9BHzKWJrfhW3XegJLXkRee3Yy91nGRlRmZrlMU2BL/pBTVCdVxw6I9uygfoTVa/JAIUcrLA6Do+29oWErH6ggBcQhsBzHPgEN1E75AdQK7yh4/vBI+IekaPSsjC8VbfZFkSWdrhC11s6QQIRV+C7GdjEKw4UKaFqsKGU4CpPSxhuVxI9cbcMEauEhhS25Kt1G7BXVMKOgLvn50PB1OVYR5gKaq6Kk4r0Po9CHbVBJUHAS+cEmzOO07BSHQpuB5dvgSvwYXi3GFmAVIELIHV0MmkK1LJB/xKCqx17Sd0/jUFP9x9utvUo5Ppv1s+SxIbQoWIkrXmbuDaulx4a0Bvpvz3vLIJBXI4k6KIHPDVnnPcV0/rmoB3sRzV80LJRIza5AFKapd6vFCl+SKRirLCrKrDv6QqE4gk9CuC9t8uHuv4zmVDJihn9gCcC0JttHttnyHn64T3AJCAj76TTBinZXzPMstB7OB+iPHJS7Y5F1DGhAZSfkXHwc2DyqjkiBM9YG6tXp49aCUBn2Hi5B0bnnCKETN/ykW1nR5Ro44NAd+JqRLBCXIJxsrX89Wb3yjpPVl6D0q3SkfZiZmdhbFapL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(22082099003)(18002099003)(56012099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6TQcIJKZK7EAViFHvwDntgXzJTJS6lPe2pOyfAC5Q9RWPEyuJfQ7sRtrby19?=
 =?us-ascii?Q?u6muQSvHF2sY/d4sKdGcfnr1n+0sgCMnT0agk4OjHw2BSEN/TBT9hlCEtPsM?=
 =?us-ascii?Q?oL5LbJkj8gzu/O751CjWnseu4O2/eWO0vLVR8Y1VMOt7ZlY5u4OU8GOuCOuW?=
 =?us-ascii?Q?GlHPqLRRLItz8fqtAC48hRnxDWj5W5rDwjiV3RQPvHAQUCODq8+X69ZMdgaJ?=
 =?us-ascii?Q?m/XifhL2FFnGEStmdG5mOsvGXtgBt0OnP5gkmFJx+p6+Jojgw43OZqK1PvhB?=
 =?us-ascii?Q?W/ldoFDrXTwcpQTFWvXFxTVtGdkJJGXOxxcIylNsZgRnnIbP7H0T6RFSVdI9?=
 =?us-ascii?Q?rkA1hX0vNrz71DPT/1D30sFitaFJsHIc/bpc+3au9abHtv8mqfYp7L4ixkrU?=
 =?us-ascii?Q?Km0E0QmPfxaZO2rHUBkKiQYOY26HIfk+f35+smobfVJ5Zaedngl4T3O5YWQc?=
 =?us-ascii?Q?ENHIk8YsrTeYpLgIKE6OwLF51AGFBQ5mirydH+vW9kODDCjm/cYgkAiYdbPO?=
 =?us-ascii?Q?ZrnI2+VJBP7JLvlY5rnKeb4HK0Ot7Z9NN77pPLuGBvPKjC1i1S3P57xOOAQt?=
 =?us-ascii?Q?rbUrDLCAEongKt5/TdaGIzPAdLviZlwpkw5fCsas5kpYjBg0GHBfzRT/czpd?=
 =?us-ascii?Q?1O8GC4DtR9zOIxa5Mek1KYuEapF1ALXv3VInLgd5qgTGZyrnn3r5k3FpElGD?=
 =?us-ascii?Q?aRnLkdJt0dKTz3+g6aVNp+kfUsQX3rEeUy/l0hs/HRhfIjeaW1GLGw106HIn?=
 =?us-ascii?Q?v8TYs1zQuikczgq98p+gKug4WTItSnxVY1xBm7DDKMYMMYYLLWm2+53fSeQQ?=
 =?us-ascii?Q?MpulTxKc+DPsyXOiQHBu22z7Q7iFHmqaE1Cs7f1Dzcj2P78DPxglO5iMuJfm?=
 =?us-ascii?Q?Dwm+eAAlsMsSVSCGS7LDU8JnsifRgGEVcLtqJJA4CTMOq2IDQj3W5PiS5Yod?=
 =?us-ascii?Q?ie9gqPrOUKgQbQN2lDlv1lNM01NTuuFUR42rjl97nLjq/FjMj/npeNawAVxa?=
 =?us-ascii?Q?JiOanseFJSXs9IjTHxs+0LddT0n2etxI6E299RQSq4kyjZyeUzM6F30DfAqy?=
 =?us-ascii?Q?vXxtN0tTcDRmZ60CZHmUAAnPBShf3KRvzrMaGPgfmWKpvZZGgxQ+8P+Vg+UP?=
 =?us-ascii?Q?R/Xk3Jii7PHrXMQZuQa5UV7YaLi7vHsh9UfNcxJA5zJPdkKqJuT/iQ1vm4cY?=
 =?us-ascii?Q?mS7itUDV+9OnYC7K96JNZzkxGVX1T/KfHhTOtWS9oWPS7DgZxu2eWgB2OidJ?=
 =?us-ascii?Q?nP00ARFjZxP1yoW64rcvzR7tpKRBs8mUV4H/MYwJPPLiz/MuM6xBhl+lRfkS?=
 =?us-ascii?Q?i9UTQB3TwwOcSN7q5PB1t03iWjzF0A5wKXK2pBz3Lt5LoKeEyzxaGEfAzaw/?=
 =?us-ascii?Q?m9OI18afwO3bKQHJCO7pEFUqpbKtZq6+Ilf7iis/HYCAbUTy0EY3INNlTS1M?=
 =?us-ascii?Q?itzQXsiQGKL0X53/ascxej7fTA6g7YvzUfH/KRh7DGCgwMcjbfO/KEJkJ8YS?=
 =?us-ascii?Q?uLRwv2bZ1mpAwborsTCtdsgQK+69E+jxKshVoxz4JjvhqZYD8yUhCspeh4KV?=
 =?us-ascii?Q?cFqs+6KjT7KzLZ30lCT80R9Ah9iOCcELuJLIGZGbqm+SMdPhLOBPSbnC3WUN?=
 =?us-ascii?Q?urqGMKQst2AYXWrEPjh0E1l/B8suHXEcuWiL6CRtzzQPdJfLDYCKqt3diCDB?=
 =?us-ascii?Q?XUdYUE586fRQqKfR28388rK5Vb+ybPyj44PKPQkO8cscg5A0/xRBWdJ1EvGp?=
 =?us-ascii?Q?oZ0Fbp+YEA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	cNjwai+0dX90pnjCgeHvK3hzPAotgArA87FW7VTaRVvOsO75N/VTcD4CYAs0A0PLB7/cBGlssWVnvQVHpiww6ealw00DthT3mz68Blos6LxrxTPqzEb47zAMGxRjDgwPOkrM9GVXq7aJ3YK3pJGzPGcIVz4OigJHQSemQFP96AnvrJmeHDto57JvU3eY5vlnjjEU8wZQM+A11ojkxry/ILG5hVmX3tH8CzByalHuMfwbk7u5l/5fZfmh1rLEyFWpgmDZcgPn/+OUrXZsR0mp0CoQ8X45YF8KhDVAMP18IO9by4bRPlz4VK7fm0faRpMI1ouebHwFaBHEatV4tIgkAQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f74422-57e5-4624-aca4-08deac00bcca
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 06:20:30.3052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmoaUU91wDhK7vJ0lEgSfNZtvnTHSGSEDBta69M277c6jljO4z+bT4pm7+iVLu0/rGPjC6cHCINKfPi71ShLow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF383C22AA3
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AdaB2XXG c=1 sm=1 tr=0 ts=69fc2f30 cx=c_pps
 a=utU5wDo5Le20VJoxH2NzxQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=tiOQsDj17wmZzvHrvdsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1OCBTYWx0ZWRfX+OS/yM7eEnMG
 NjrvUPrx3Y6uNtNZydbf8ynszitArB0mK5lsK/BkgNfjevI75/NLt1d0joFTbr3URBn++j9vyB3
 Z+Cpykp1WiIRLocQJWWMEKfYrsbrq6QdXrFCSFBXHpkFqt7JoBa0F4cnx4vBvru9ucaIkxdqPfX
 BuJYxcOCASp/olqKDVGdd250rn9qr9ySKQTxo+3JQ+3IbUG6c7ph7OoAkXxmcOb87QoNxxesYQp
 eFOPo8PtMXnSZQWDwyMnTlY/imGHggjY8HkxcGw1ullWoroelOduaxUht9xpYuY5KVLlrZhefJh
 pe9bxgsER2UuZtCA2jkMSGvwEIJKmuHjZBp4K6RFMpAbAgoO+gq/DArjoOwTyZMUntUe8EETlPQ
 +NsKVGsvydWa75kP3YGbrsEuDaVQ9HVMwTXPbxOfEzPPzEBHS6gvMzJdfD60dmu8mGLJGhnEh4X
 fjkbcdBNgG2XVKPeFkA==
X-Proofpoint-ORIG-GUID: WFTI32p3Nqb2dtAxkLqtr7LBGxXQI-dr
X-Proofpoint-GUID: YkKdD4EcTA-pfWrKQXVokpPPOHik-fwF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 06:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236563

From: Chen Qi <Qi.Chen@windriver.com>

For kmod, 34 -> 34.1 is a stable upgrade.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-kernel/kmod/kmod_34.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/kmod/kmod_34.2.bb b/meta/recipes-kernel/kmod/kmod_34.2.bb
index e5923a64cf..b055b9409f 100644
--- a/meta/recipes-kernel/kmod/kmod_34.2.bb
+++ b/meta/recipes-kernel/kmod/kmod_34.2.bb
@@ -20,6 +20,9 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/kernel/${BPN}/${BP}.tar.xz \
            "
 SRC_URI[sha256sum] = "5a5d5073070cc7e0c7a7a3c6ec2a0e1780850c8b47b3e3892226b93ffcb9cb54"
 
+MAJMIN_VERSION = "${@d.getVar('PV').split('.')[0]}"
+UPSTREAM_STABLE_RELEASE_REGEX = "${MAJMIN_VERSION}\.\d"
+
 EXTRA_OEMESON += "\
     -Ddistconfdir=${nonarch_base_libdir} \
     --bindir=${base_bindir} \
-- 
2.34.1


