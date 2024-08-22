Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08C8C5320E
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:27:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9315.1724318817982596416
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8964b93f11=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47M4iO8b006526
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:26:57 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412j0xn5uk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:26:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e49ln5fXsG6lLtKgH4ufKpsEXkDn1GufmYj8GCSyMCi6d60Iq3TOrmNQj/aNt77FDKcIOJUXfy80cT6eYuS+xgR7CO9QiBNv8GNpsO+8LWig6Tk6cKOmkymtxGm+3vvH96JFJ/MK4DqWexswRF2oRbdAtvap2ABAqD/xISKIFQi81aKq3jnCS5Pmhn7WftCtbFY903+AEl+jbUTiG2HkvIOvJyQdplQc/ppSMajLt9hlojcpDzfhO6gACEDA1Lo33Oo0u83qdRg2mmCcJ0Q0dWFHeM8+cd4l9jQKcQf7WLyJxM9TUEb1LVcQ+TltwR82L6CLOcqEgcp8PCtEMWCqrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Vij4bKK2KJWIcw2Y7GMFn1gMVzkGrF/6Vq5pY8t+bo=;
 b=gFxhmzCi3H9ZT2ZzvObBRHEhcvGG08bY+xyc1vVFiqktBODcs0g+ky7aFoz8vOSwpK4YGnLvjz2t7neNs+6mqG37ozMypldWfdz1m3N+ncEHwSdL6+zbpWl0T6YV7siafymY+3jd4T15BzDRIBcqYOiza6Mh0UNdUDg/ENLDhEsSBK7aS/5z0itlQBBKuVP/7OvaLuG4dFkmbiqwhbUMrF6BUrwbv4LO1eO3i/Gpw7ZRVFn6vgJfOerMy+ciqNzxJrkxfli3+GSsssH+prj8lr3YJ2WbD1HzqizoybM4ZV6aWmNeIbLpKbH0UmXycyTqmYfsSwXhxEMxhIZqeHIAXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SJ0PR11MB5104.namprd11.prod.outlook.com (2603:10b6:a03:2db::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.26; Thu, 22 Aug
 2024 09:26:54 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 09:26:54 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] shadow: upgrade from 4.15.1 to 4.16.0
Date: Thu, 22 Aug 2024 02:26:42 -0700
Message-Id: <20240822092642.893250-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822092642.893250-1-Qi.Chen@windriver.com>
References: <20240822092642.893250-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|SJ0PR11MB5104:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f39da27-bb60-4664-b7eb-08dcc28c8f72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?izUTDzxulPZbnDgcmJwCsrbEePWTqcDBMy82U8daixxI2XjSXuyifR2PXMNr?=
 =?us-ascii?Q?h3yJwZ3XG5yemZbS9lPpn7IEg0qic5Gj9fD5Uk3lU+tWTp4G2jyEl1sDZMqA?=
 =?us-ascii?Q?3BefyU6ZX4P6s8kazIuB07/5bTj2DMDmkSPX+r9qz9P+FT382roQHXKKxJyg?=
 =?us-ascii?Q?FV0L9dQpDsswD9UtCVH9x7AKg3GcGaxyo5VAUYcrEwHb0+B1h16vFRIRSL9A?=
 =?us-ascii?Q?wF3SyrJWSNtKgA71+8DsnQNHrosPaZ74rEPPOPVIUPVhXEgYl5PR/BjWOGbI?=
 =?us-ascii?Q?vF7g8Hc8scXGbpYsEkGRwqIVIOYuPNs0AMUJbNit9Hjw7yrf2cGwmf6dwja1?=
 =?us-ascii?Q?NEK8DbDjvc3gSL1il0/JTQn7i4isy9KHWpgF62Up8/XU51WM4x05wFJPogv9?=
 =?us-ascii?Q?DZ51cJEovWL6/BSyTqvwTVju8SAEgU6QacckcOlLuQDIbWWWEC0cfaxKx1/h?=
 =?us-ascii?Q?DPLfsXbo7/nEIBvl0C99l6dk/lZMD8CnFNhz9NIZgbdwWK06EzGaR5kxGFk4?=
 =?us-ascii?Q?g1cw9+Aaml5qQhKYKiVpXhlDfpKGAX/ypJTlTZt75+ulXr+GAmguFkADV2UA?=
 =?us-ascii?Q?TNk6j0Ej9wy96BJ7seR/yRbdDxLvL1s6kC8W/yDoPQIWSS/UouInFWsH6biP?=
 =?us-ascii?Q?WhFOi6Tw3621U7ukotDLWQZv1R5r8N42F9L6p8iLmF5FeK+nR1I3+88b/hU2?=
 =?us-ascii?Q?IC0k56zhURqHpz8lcdZtcBN8oFCKLYzJj8mvWRL+s4+SeRGDnj7DjPO0wmTE?=
 =?us-ascii?Q?AP/DyDsJf6WvfYas7MkXSJmoxbD2Mrf1pvr7nNWMJJNs5mTGg7s3O6JBHo8n?=
 =?us-ascii?Q?mPC7zGkZV9Ek8V9xW5nKf4y0T7i6R4Bs3r+52cZUthPvISk5PYv3eTvhixgm?=
 =?us-ascii?Q?B6RY2yHbejR7YmkByYw/CA7UFi8Y8yi/16JVS7WUSfE6Yd1RmT/RXsRX1ryS?=
 =?us-ascii?Q?Lo6tSJgd5LLiV4TVjyiMYgtZzcbtoAjLnXM1JjureCLdPI9gN6ValyNTpuOO?=
 =?us-ascii?Q?rOif1zpT/2thKB83TPZnj82yZ9OYQNoTNpcQDmKvfyWpemuXvhtiMoDgvNDp?=
 =?us-ascii?Q?oCB/PJwrGtGeeBHErrNrKuEPOIppJa+wkYGo465shQ4d9QVTT4kqIRNrK7YK?=
 =?us-ascii?Q?4y+EDCV886nI1TRM++w4lYXoepwb/7HDfF66jVqrXI9B9wQ6tLguGhoSRyae?=
 =?us-ascii?Q?G8D6nZfTrmnXitOOkeFUmi+cFNieLPoB7ktkU+m1R0bNj9/aHEU9r68XUnkN?=
 =?us-ascii?Q?L19J4wLTProzwmwkHJ0Vzome1SHhxu9f6MoErwCh0+1qrbMYs+id6cWWyf/j?=
 =?us-ascii?Q?qqtF7JDI9VubB6LTGMs4XgSJ2gsoBNfN+Dli4JFmaF0sRU27lf4sB2rUEDVh?=
 =?us-ascii?Q?d6D0MFUgK8VJJ6TyGFb07N46ottYxSrE6cEMGw3lqIFZhbB6yQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?R0vN4HxUQLOEN+VBjpRPCxeZcMJV42h9DpabQLyhHeCJ9OP4N8WT4kLCUAC8?=
 =?us-ascii?Q?oMxOQDbIvnHJ7bytkqPFIbf1iUzvlB6MS8D491iTaoMVx4/XrDzOOx70jLUP?=
 =?us-ascii?Q?4KDmq6c6XdxvVO5bbpt29SHpwmTVCLmi+kPJUrdEhRB9ixcF/9G6BMHn30lx?=
 =?us-ascii?Q?UchwM67JKz8rq4HPbZXs2PNv9cWitNDRWWdzzxIvRPEKzgiEfjkAHAiROvUn?=
 =?us-ascii?Q?r7aY4y9O9h8JWKY1hmdpMorBZTWUC9Q5jG0DF/aWszXwnjDnCytXbofXmHSQ?=
 =?us-ascii?Q?+iy0NngAIr+iDDbTixxrAP5sdF5WwAORjF8XOKp6N8CUbTwDka0d3u6gJhWv?=
 =?us-ascii?Q?PCNTc+CQ76vfk6nuokHfxyVRJgOonZyf7tg0DyFU8WYlks50r4kiaUyRDTbk?=
 =?us-ascii?Q?Vs8cvnMZIB+pPOPLwyEVKe82NUqMCOZUGhfUfNwCtO5n+eNenKrjXmtfPKN6?=
 =?us-ascii?Q?7GVaSrah+ehLUggYNzXxRNh6S+sGYpEAsRxuXckWSSlL72GS8l/dE/XqJKUQ?=
 =?us-ascii?Q?I2pcx64RVWk3rlIrfB6E6I0TptUEPBJl2dJj6r5Ywb1Fd7HlAwFzC2XjDzWx?=
 =?us-ascii?Q?TY+g5pluemx7GkHj4BLAQxbVMdzTE2AbmMpe5R1lyrHS7pgyjaJxt40ypuvn?=
 =?us-ascii?Q?CmzcHvyYu02p3fzsn4shDcWw/KVwse4++yx1EuKYaKxmeZzSVAUXXcbyoY58?=
 =?us-ascii?Q?ovcY+Qvz5ePOYREcrag1z0OBcpuP+JeeLZe6cnJA5kWWt0stJVuysnrOL3gH?=
 =?us-ascii?Q?lT7zIZs1JqY2QgH6RI40+FLSK1tojHsxAclmNkQLgyJ62LzPrro4K4pAqnv/?=
 =?us-ascii?Q?E2hkqxln6AOpGaKRP4QTgdeh72zSUMpuOu4hPb2mj39E4YxBXE1O4FEO/JOT?=
 =?us-ascii?Q?VzZKqVNgRhddSnqEwaJNGORcSdoGUtzRZxAUwWZMLB78ZxffOQKG5We2sLt3?=
 =?us-ascii?Q?+WuKeLXvGNHDUPdI+jGk6SYgAUasP4ccOoBTnF//y7i2rRLRDn9dQfSxQeai?=
 =?us-ascii?Q?G9SwHLBvS5S72qEyOstM5KbyWdYoI5EtjXG41w9vPdMMvmD22gXYZZY95CBm?=
 =?us-ascii?Q?+W1ecoYDanxWVw+18ZpZys+6hTclltciRqICYtaSdU5AozAAQp14gwtZ2fpC?=
 =?us-ascii?Q?L6M2esPjSL0DtbOUbnc/jEmuOZwOL7BsljD6R1wn8WAtubj+IuXo2MiFVwYn?=
 =?us-ascii?Q?eOoQgW5vji/SB2nIvjwHjA8bGHS05sm0P6Z2WYhjrlrVSF/JtSF6X+6Bwup2?=
 =?us-ascii?Q?HCm2esDY1+fI7VawR4XQzyUyX7Z/m4Dyp9BFYTxftEkv7u0Jkjz95qPb093I?=
 =?us-ascii?Q?1l6xRZy5IQdJPhos0URDwzPr/86xWZFU1jx85lx/ptKQ0/gOCz+xxI5wpsEF?=
 =?us-ascii?Q?joafWcGsVWv9fr6aFPWSE0f1HMCJQiP7RvNu6+LHHP2i90hKBUF1zHkP0TH5?=
 =?us-ascii?Q?7RkPP3FKm7ARUJUdxZQvep0OP/8d+Qzqn8UM4m1foduT2aAAu8CBFTMJ2PLu?=
 =?us-ascii?Q?9ZSS/BP3WPEuiabi5JWID1elfJ+I/zzEXPVxCR3j5hadVZ4Js2KdtxgZjVr/?=
 =?us-ascii?Q?/82jZpUDjo2w7xbF7F4O0U6yoFuE/A34q5yDUKWMkxg4Xiibvps7syhNGcic?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f39da27-bb60-4664-b7eb-08dcc28c8f72
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 09:26:53.8943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwg5TtdlfzOCnjGt6Pg0WRsUhHbFRTRhTtXNI8OEjZwy0PjyV/09TeoN34441GmQ+3ccalX6eIwmDVg/pGSIow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5104
X-Authority-Analysis: v=2.4 cv=PszBbBM3 c=1 sm=1 tr=0 ts=66c70461 cx=c_pps a=PK5aExQQjalka8oDlC/sVA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=sd87TSp6Do60Qp9E64EA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: d4UE2Mio1h1j9FT-cx-HsoNyiJzXuG6c
X-Proofpoint-GUID: d4UE2Mio1h1j9FT-cx-HsoNyiJzXuG6c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_03,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=905 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2408220069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203615

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade shadow from 4.15.1 to 4.16.0.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/shadow/shadow.inc                         | 2 +-
 .../shadow/{shadow_4.15.1.bb => shadow_4.16.0.bb}               | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/shadow/{shadow_4.15.1.bb => shadow_4.16.0.bb} (100%)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 3991006b43..b5e77b9874 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -24,7 +24,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
-SRC_URI[sha256sum] = "b34686b89b279887ffbf1f33128902ccc0fa1a998a3add44213bb12d7385b218"
+SRC_URI[sha256sum] = "1744f339e07a2b41056347ddd612839762ff565d7e9494fb049428002fa2e7e0"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
diff --git a/meta/recipes-extended/shadow/shadow_4.15.1.bb b/meta/recipes-extended/shadow/shadow_4.16.0.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.15.1.bb
rename to meta/recipes-extended/shadow/shadow_4.16.0.bb
-- 
2.25.1


