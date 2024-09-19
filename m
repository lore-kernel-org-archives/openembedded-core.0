Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE494CE8D67
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 09:43:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15690.1726738972554210063
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 02:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9992e69025=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48J6OLrv021125
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 09:42:51 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41n1f9d9ry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 09:42:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcRfXngF9Sgm76CV6Q/syQKq9EN6fJ4poE5XVQ/Q7dCTVTJht9DWOTXraI/eHl59BR9jY5MXrT/P1d35uXOsY1ORrx72l24WH4CZrQtQtqeIkJbOd1LmviICYDKtlPH4eX6SimD/cTLAprxgmYWuiC7A5F/+j12Hgi7W0qdRe0Yta8/wxYrorhg7OXMCZ1bWVeBPNNBbUXUC3WnFI/CHQ7if+kUTHpB5KQIJRkhTF3KuvVy5g6PTLmCVZ5/rx5L9NSk1EKQ3C9evYJI1Uva7QY3kbBOPcQs+3ys42cKo7pfC1Y2qj6sJ4boR8p+c3mm7HpKlCwoumV0PJnOLRgaTfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUAJ19lsTMUzVIOSSsAToA+kRnTGRFCfpyVMm2tMHWc=;
 b=f7I+gY93JOEyzaY9cZ3tu92S5nJxjBF2L0fbm9fLtbaaSGc+mcnIRAp39NgwohzOYpfpoHJpCFC+ayuZAnGmG61v9qNcQBV+vKB5/l2KJBclid+rFuLLmiIp9pXmF53IMdPANtpTw2WZAbqKx7FpSL5oV//QxoxwS/YyStyJajmoyqb/sOYMYCJrEOvdFcMMqqPxR1RA2TQ1eWb/LScSKLkNs1aE5IjYf9c1u8sg8eZW3ZNAJZoRr/6pKlBWT1eqc3joCUJgAYNMCDPAB27OGffmoa7UD0pbEV9YAlu/cBQvcKR1/ToymTgv0V+LHPu1FKieaRC9gyG8Hu0vcwjfzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Thu, 19 Sep
 2024 09:42:49 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 09:42:49 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH v4 1/2] binutils: Fix packaging of bfd-plugins
Date: Thu, 19 Sep 2024 02:42:30 -0700
Message-ID: <20240919094231.3840077-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR19CA0083.namprd19.prod.outlook.com
 (2603:10b6:930:69::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM4PR11MB5293:EE_
X-MS-Office365-Filtering-Correlation-Id: c617430c-b9a1-44ef-66e8-08dcd88f6c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?U2gwx+HXfkDNi/ID0F8uQ/BaKFwhWwyAXGuh2O6WgK9xbSuYezKAplVShRLa?=
 =?us-ascii?Q?LrPcAgMY7/QdvMz/GL+p8W3yHG6y1P+9r6ZFDj5gdhm/q5sNozKRSwpAzOGE?=
 =?us-ascii?Q?iQsSDGh5TI0HfxyKeHKabvj1KhkxWmD8XNkEhvxoa+i+WgyQ4FllKMz/lT9K?=
 =?us-ascii?Q?Ug5qoCwjovxqacG/ENTleWYvtgkCwtwvPGPRA4VKV1tGNlNhEXHgXakhhfr6?=
 =?us-ascii?Q?mAkIRVp4kIUVreeE1d4eVltRKEd+/jlhMATLfmFZ5RouCPl5BxFcjh5Bs7x9?=
 =?us-ascii?Q?rOThWOjAX9tSfSGFtGHvnD+ksCQBipC55YGylBL4Rt6LzxSx9IomB+jXyyuC?=
 =?us-ascii?Q?C1aosq3H+wcVCLMbpVgsAdW7+ikQ0fD6bUVWz9BkVssomLBT+zfrDHQueua7?=
 =?us-ascii?Q?ZHenQC7wDsKLSUtYmgaJjKUJWNQbX4rkM8kFHXf28UQinF9YkAgDNEcPCe5k?=
 =?us-ascii?Q?tF9yAITtRkhCxF4ywIGWncZexr+zLa+Cz5gmdTLt5GAiB4M05XhufcigqP6P?=
 =?us-ascii?Q?l2lDYMHOJsAy5HnAN3LiUvfCsAUot5+CXfaxtzHTXgBpdTzoAAJjsoY1vlo6?=
 =?us-ascii?Q?3xLZb7w3UjlXpmOc8A+54gU48/y6xA6jhzxkawyKE+cw687wIHT/1T3R4Cz+?=
 =?us-ascii?Q?c+kOI3uJmRMeSSEpXDrASf/9473FqPtfTJVvvTWrHLydFcXAOErLoYKb+wpx?=
 =?us-ascii?Q?qceWX9XjtleJva/DdR+dsCUscA2Cfmhl0wV0prg48ZPKJhGLraHXWsDrZ3Iv?=
 =?us-ascii?Q?nBfVDFSagomhdTxGC4IiJPvwFgU/3k+G6MIOKZEw/6MmImXjsXugk03i3drC?=
 =?us-ascii?Q?rcYY4+awuUveECfIXwGH0+Y/z0IRZIMM2tPa6Vs1D7KiANs48ctvJVULoW+M?=
 =?us-ascii?Q?uuIoE+/+xqir6n0xf8S4j4HBvC4PA2CZR8m+taTXo5Aj3kvFuJ4lBm4iKmDN?=
 =?us-ascii?Q?U0Mo6eTEr1g3CLbmMnMyeo/mdP8NJkY5hKj3dXfItpB4LYfIZUBpHN7giOx9?=
 =?us-ascii?Q?I9nd8J4bbMTDCLBjvsGo2uM+eMHldcQ3lp9+Ssef2OmcSuOYfMpIBcVBw7oB?=
 =?us-ascii?Q?khjnZrjbQJmVHUIsb9H/bzF1O+XMmLd6g7NyaxllQIWoudwN6n4uQ1jpa//c?=
 =?us-ascii?Q?n72ElzXZGkuCt2t+LwmOKjhwEEsMNPed9LU6uXMymNkjGrJCXoNcqbyGFRDJ?=
 =?us-ascii?Q?Y5P+Htj7QUugYZ0hpOqNFKbgoc6pBdS5YLunw/tBJTmicys9X4oGK4LjnqSt?=
 =?us-ascii?Q?8mNZ5qeML9KARrviSo4CYRFH/JQPBSQxhlPPG0FmooPd57qGrwT6+EuUfuPO?=
 =?us-ascii?Q?FXB45MCecwHv76dmIBno6HCux55HpuQXR1Mg5NK0+YuGUqQMHQ4eQ83UwqYL?=
 =?us-ascii?Q?VI1c/j40VBkzd5o2Qn7e339vf1O+NCX2uLuaNMdYV+AnpDk2xw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qUzNgh4eQyv65IUX5A2oncfu7AegevNNBi4VNmfJgp3uUXpyXKCj3RkM88As?=
 =?us-ascii?Q?CIc0Y/XdlDXcdR6iQ0ixbKJnfTnPGA9lD3N80bUPLcozBONAc9NoBQED6uH3?=
 =?us-ascii?Q?D/Qgw2hT7K0z9dNlCnoFM5lfhmbb6Eah/pq0UlyL7sRyteq1l3AjbOzgj4D8?=
 =?us-ascii?Q?BuGSxG1Owzy84v9h7R1EBK7dfHubTvGUhFLZM274i60whNofyqcBcROdupi3?=
 =?us-ascii?Q?hMp5mg2Fi8h0clBXTlU/UEf3EhINy8zPamD1qBkd7Orxc7LtAPUaBpqTAhp/?=
 =?us-ascii?Q?34mbZunoDk8CgYcZtsXGGZ0R4v/xe6HDAQ+70/Th6RUapL/crdpqoZqbERbF?=
 =?us-ascii?Q?hDIns6RkFauupHmfmx8Ju1EpcqVZStQoofu5QgcDushxiDlmOACXjJBozaBS?=
 =?us-ascii?Q?0/ieoB76nZ3jWpoYqkqVD7dUBnLbgKbesUeKpyog/ITZ304hoGCeXsLL8kG+?=
 =?us-ascii?Q?qWG4qt9HS7dI23M5bMfbW6foGLoPRF+Btamb4I2s8WV/NMFqkUAUaAna9Tqn?=
 =?us-ascii?Q?xt79GKE+it8v+RAzfKhEf6j85FC+4sqZN9Hs47tdpYd2QsC8jLSxYgo2s8Gp?=
 =?us-ascii?Q?N2L3e0Eph6gWro58kDV5ctefYpFm1rWaI+geobQR5wyJ43ALYsyVpsV9EAM2?=
 =?us-ascii?Q?QjEnfhp6lVvqEDDEq64IXohKTvRY/gUo4kzKdgkBYtLErsWy3+S9AXploDsh?=
 =?us-ascii?Q?MENQxO3fJTGPOFK34JqsHMs5xMfFTHmMdAjP+3QGoh21wZZRCPRDAQPEJ1rT?=
 =?us-ascii?Q?TkI60Z5vnC97eiyMHccA6mJMmwo0+NI8mliZAAn2F5LH51/Lx9jLtAV5HFvA?=
 =?us-ascii?Q?fcgJFXeOFprFMY3xIOwVJCk0u8NGyWZCEiCAJsekQOfxa+7aj7RjAFnqDQ5w?=
 =?us-ascii?Q?6Snj7MmjRRwVGk4B0dN0BI7vj6SWE8UC7JHGoBpiys2XYhw6HLQ6TOl0RQ18?=
 =?us-ascii?Q?WpabZYcETic+BL5Ab29dBFmAw3i4UVlsAk3f4JeNXqdLBcxDbRDFwZoqUj9q?=
 =?us-ascii?Q?zIHWq5xyU88us6fQ4QvOhnWz44+34zJ0dkC/Ra9vyYuOnSwd+6Sk+VNHoXIW?=
 =?us-ascii?Q?wMPDw5mivn6kq/4OWERJ3UBxuDboHSSRGsaeU32rmus1vKPaZlTmM+sOI9jB?=
 =?us-ascii?Q?kW6I7/piNdcbZpK5Xm72k2w1i5+lEN4LPBqr2TKaKmXVgfl3rcgGZFx3dLbM?=
 =?us-ascii?Q?kgaUjbQupLrid3ouFVb6BK1kSpA5X2gMmEDO8Z1KxuU4KOnPjNFhorpXi6Mt?=
 =?us-ascii?Q?OT3TFMB49d2gdZ8dbegK4kVdnS9CZuOeySrab/qgS44eLa1E6i/jY+FJRFaL?=
 =?us-ascii?Q?xeSZplRuIWWrqrty7TF9ftbMCu+bmRlulDbhgWaMJnU43uVSArteAMZUKkqj?=
 =?us-ascii?Q?HqZY2O+KwO636u9ksg8EDgHchwfvoKRNIMNv5f2Rcpw0OEGRP5BfwBfKCiEc?=
 =?us-ascii?Q?QFxYSNMpjcuBsEgsyABQevtalUKewtN8ptTtnLEdDJR1i95NdaI5VqZy43Y8?=
 =?us-ascii?Q?yE8AiwRMQMab3GmES/ypH+5ml1D1uJDJXWlxTnTRBix0BADFfjAfynVdTHUL?=
 =?us-ascii?Q?vtT0tNv3PpQK4uOi7l3fShPtzWo7eOU/3PhuHtrFt1k7jfjLn/+pAxeB6RHM?=
 =?us-ascii?Q?DA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c617430c-b9a1-44ef-66e8-08dcd88f6c45
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 09:42:48.9787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gaDVwXzKP6SJiubbbdaaXYIg4/d9s46ZdnoWv39Myz/jHtOw4CzcHFzAVPXLOmEQ/5xjrgDUh53QRmSpvpFp+yzEHq02Wzw0qfY60ObbDoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
X-Proofpoint-ORIG-GUID: xj63ouz10W_xAvKD6YLSHWWZyX7io-sN
X-Authority-Analysis: v=2.4 cv=afUzngot c=1 sm=1 tr=0 ts=66ebf21b cx=c_pps a=28bFCgguF5sZfysLuYgbMw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=VzVOzZWKrabdcsoWxU8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: xj63ouz10W_xAvKD6YLSHWWZyX7io-sN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_07,2024-09-18_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxlogscore=704 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409190062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 09:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204659

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes the follwing error while building nativesdk-binutils with i686-mingw32 as SDKMACHINE:
ERROR: nativesdk-binutils-2.43.1-r0 do_package: QA Issue: nativesdk-binutils: Files/directories
were installed but not shipped in any package:
   /usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-w64-mingw32/usr/lib/bfd-plugins
   /usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-w64-mingw32/usr/lib/bfd-plugins/libdep.dll

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/binutils/binutils_2.43.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.43.1.bb b/meta/recipes-devtools/binutils/binutils_2.43.1.bb
index 2cce40f1ef..eb7c16cbc4 100644
--- a/meta/recipes-devtools/binutils/binutils_2.43.1.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.43.1.bb
@@ -72,5 +72,6 @@ SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-al
 
 USE_ALTERNATIVES_FOR:class-nativesdk = ""
 FILES:${PN}:append:class-nativesdk = " ${bindir}"
+FILES:${PN}:append:class-nativesdk = " ${libdir}/bfd-plugins"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


