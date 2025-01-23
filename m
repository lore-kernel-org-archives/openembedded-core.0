Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59CCC0218B
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 15:49:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13940.1737647379144172607
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 07:49:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31187efd39=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N9vhQc026689
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 15:49:38 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqfw1upc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 15:49:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9/wxu26NwWTomtfrlZuAXNbfjBJycYutbrxmS0NmAnv+VTBY/HzV2PSGMNnfN8EQj7ra5vmjMLLvb9pIVy3EU/ZvjlOK1Q58G34LzkUT/QEgEIjtv2Fi7NKCmELn2S4p+VQ+7ZI8v6vCiR12g9ZlflidPiLQ3kvKAYNX7jJ0wJ+GsBNl0uSaOywV3Mmcir9DTS0qRVc54AwaKUT7ze2Os81NMUZRimjAVEGZs/fqmTNO9K13ga5uLVOkouGSj0YhoYfC2WSXKn20R0zbkE6UySrxz5pyuUvs8fOZe6mUMX09cwjcrWzyHQKpArCJV+o5jj0c4ZkWBKvoipDZkY+Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTH4E80H2gAdtxwBg9XoSRVDbkU60Je/mhbl6Q6PYw4=;
 b=apw02r1bOgcUO6q9zMVh4fP9oM5ccPtzaE67sb0l5e/8ee/M1OKHZF8Cc4QosF7HDe1mPPy7DaVNQ45aSjmMWH9UfDhRwuya2QOFhelI4Mh3Dqk1kwbtlc1eBY4jCoqytQRU8jry4C6ez1MvGgj17FTOOr+tvwN2TimhHffJFj83aJoIdriQyXECv610go/U/u9ysibcXyXNUYKqkb7NYiVVBzYh1QcfaTj+K0yKGJ0Zs07mc76AEimVK3Q6y8ln2UOGpuPafn7dmVG8jCs/AFGok3Uod6zU67uontdpUy4JlzBnsl9bJ+Q8VBSqlgY/QB0xJikCiEOLJh8ruIx4Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 23 Jan
 2025 15:49:36 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 15:49:36 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com
Subject: [PATCH V3 2/3] rust: remove redundant cargo config file
Date: Thu, 23 Jan 2025 07:47:54 -0800
Message-ID: <20250123154755.3579988-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250123154755.3579988-1-Harish.Sadineni@windriver.com>
References: <20250123154755.3579988-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::34) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: 696a3dfc-5065-4885-b523-08dd3bc58984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lPKtzy0kEOEByG2Fxo8HuyRlYgbeJw41CB7qvgyvcifFgxeup6HWU2JmkOHg?=
 =?us-ascii?Q?ym/ddC/xAcOCrLKe/VEYWbYZmlGMxE0NttLt5o0p4WcTPTss/AgDM5WcjWmw?=
 =?us-ascii?Q?laSVvhdrqlXBme4cHETCsU8JXoJHz/EGYXeX9kZ5/5E/i6cRpJX9ZjpEDWNo?=
 =?us-ascii?Q?ub+wSj3VpLYDFnYNxUF0bc7qzuFQZ/uPARz1uaSqRsn+/xBX53TGJ2WPICBQ?=
 =?us-ascii?Q?T/f4FNahCCgpq2hSpM+1uBaFeLe0hDtrbWGdFbDm/Wp5rLPn1kGpJrs76pqf?=
 =?us-ascii?Q?f+xf3VWV5TEmkUVc16XeF3LlrevWsSo+SDH/SFgI2Q4N5L6QAEcW0cSmysjV?=
 =?us-ascii?Q?tK1pjj0cnCMgxnkdgKL7QbQymYwxxz/oSdkYSwmeVK5+Ch1ckmqaA3BFa5ai?=
 =?us-ascii?Q?7j6CaCyoK4iB//XXLJOWbo6ThUBB0VJksnJMCdKycJdXm9pvHX/zpcuqavXa?=
 =?us-ascii?Q?rhKVuNYhY1RgO/AOI5FuuUl8yvYTXLClKJf3t3VC8iPOiT0a90SiA/4BK2Hy?=
 =?us-ascii?Q?eGmUkx8gBrUVhdjZ4P8xmAm+Pw7lDllOr4Rz4ouewtJHGGU9vvnWfOh17N8g?=
 =?us-ascii?Q?AKBHX7NDcv5J1ZAnO1d6x2bbm76E9pchR5DJ+NSMOMx3FH2Llmn1gNY4e6bU?=
 =?us-ascii?Q?0zhtQzJdWcze93PF6VxKXQ3PQLrtIBlahwbABK3KB30p+DgF4t0rizBaki86?=
 =?us-ascii?Q?ROXTXL+nV5pGLqJbUZL3yJvWhap0Dkr7hWiL8jpvA2Y/3+w7HAgKB6L3C3rn?=
 =?us-ascii?Q?JEuYuHpEnft+0xZSywG+TDWCzsLCxHSgR0ByRRuGwif6Ee8jH+N6P1SnH8MT?=
 =?us-ascii?Q?Ggp2NtsKxs+wGIm+N4tplXQmkDC1flb1DtPRfUokE8Gn4rYDEgSrFrhMf4Mt?=
 =?us-ascii?Q?2e9yQXRSeijNmKx+mVTkb1zwZnvExBEpq9+mlOvLeNLAzzcG47to1fvP3vOL?=
 =?us-ascii?Q?oCQXdJvi3hK1+Yixi4Is1TW2+iyOiRy36GHLck/rj4zM1IUCsZah1DCLpUw0?=
 =?us-ascii?Q?w6ZbbnbBvGRiU/hMCuEH8ra89Fxbm9N9/3GGIMI7QOO6DoKWwJKXMRXz2Mm/?=
 =?us-ascii?Q?f/SSCtn+nOa/2dQYMd6LzgBQPDZK6WAbLg9UUt5248+4zNaPZsinq7D4zI3c?=
 =?us-ascii?Q?pRmKOMhNzPzOZwfjS/yAlxmhkI4uFYbM/RtipuJgCLkdROAg90abM6MuPTAU?=
 =?us-ascii?Q?4A2w25Qbm5iqn0lIbLLksmOpE7sisAR8L/VkzkBH2zkFKY5QHbxsTCBDBZZy?=
 =?us-ascii?Q?3GHivycop2vj0a5QG57XJD+R4gvsRHWpLnrRDkN6Rzqga3VrHAjH7yh/UieL?=
 =?us-ascii?Q?FVCqwroLeCNrmwMQs3STY4KU5DP93R9zi9bOTEiluE7P5cvXrP3amq0HM/kH?=
 =?us-ascii?Q?VWFh5LycfCIFlA4nDUgXQ9Cm9RUE+9MNBe6kqUkWXqAKU0JkPLgQp/7+rQxs?=
 =?us-ascii?Q?znycn5dXTi65pCqoC3dX89ucz/hp7OpW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NW0gB4wT+u2uL3d8OpcJXyKRPsa8BVzIP7YG0QKOdLXsTSB3DY01CE09ujeg?=
 =?us-ascii?Q?eeg92cpEyumdjtvFzB6L+uWF7dbFTUSViXuWPJBE7apLEHjBt4XInc7ABQvf?=
 =?us-ascii?Q?bEA6G3o5s64B8mXvzkUc0qxm6ryW6o6A02BrdKzic1unizU5owr5LPCBSVBK?=
 =?us-ascii?Q?h632DenXHi0WnFP8BloZ33ulZvK7y3isu2s2kxQWguI484bgOLvd/rb2vBG0?=
 =?us-ascii?Q?4L6KYdVak59lc7BPzI/zcOZuyzXhkmN0RrDJKPzwAECohS//lMZJdOCqu/l4?=
 =?us-ascii?Q?JPDrzr1eCxsVVG7FzP7pPYRqrOObUCkBij1AVg9Bz1ELv6FZYuP/0b1GbTN3?=
 =?us-ascii?Q?uPvMiqgxEnRR3DGp22XsNva88WGpX8Kolt8Rl3U8vo1WTQa55xc6jOcVjMRX?=
 =?us-ascii?Q?FWQD+6x8x8f/jt8VCwshC3WxAcK6tunssvYt7Z0CWIWaHJOlpoGAR48IABVE?=
 =?us-ascii?Q?RvnOOWcJTtC5dqZ/KC3kkAQu1x9/TldYMcdpFZbZN0r+Mvl2vrTqBpLaOKFt?=
 =?us-ascii?Q?5KsPTW+0vRFGxSZPIYU6xRUuNkH2s9EFvIzix9U21YS1AzYSUjfpvRfkX/va?=
 =?us-ascii?Q?W3lbzm3VJhgb969KCFYGq+xX0cQD453BYoa1A/eJzhyivrzIicEqxrbYEXz/?=
 =?us-ascii?Q?O7RJozZ9F/wmqo16ONAIvwxrK35T5Z9FY8H7OMhy//K3+iWnZHS31rBDUmvk?=
 =?us-ascii?Q?P0DQGn0T13/XLNEB2HBZQijGFl5tnNAbVwBJBLOlqGy41qVHsVEGCXCovBCu?=
 =?us-ascii?Q?wzxUoZATts7dhX+Kz6GEHpNiZ6qrfb3tXsnTEswrjlGdSFuUKYpbl1eDHdDO?=
 =?us-ascii?Q?hSBDr3odOglIbAId27r92d4n0F6RxWCDW4OUwnCjX1dgDhnqDDQBhvNJJVbT?=
 =?us-ascii?Q?4SLelgia0JcuuYkZd4jUqh4MzodiBRcCllwC7dEGdd1J/X1o4S8kjm18XLof?=
 =?us-ascii?Q?o5O7mc1uzDIFy7PnT+2hko42YK72Xm9vI1A4M9T5qz8ThCPK/vXOzyFONJgb?=
 =?us-ascii?Q?EPT4Uvgw3Y1ToNDVSG+GoZTgkAGeQoTWXsz+tEdcIof0hhALVS27YX4BGqDy?=
 =?us-ascii?Q?MFWUIZp01V0bTTjrlFdcGtKh/d2EmAsEXUetzNKFHVO/U6uc4WrXjNZYl95H?=
 =?us-ascii?Q?02ZJ0WydnPCnPBM6bkqYLVNiTxnxd/sWZKXSPQXbQpEAru1BJyj7OeMhlDcp?=
 =?us-ascii?Q?p3S+bwxnfChJ+xYqy/NSS499Yr9pl1uAKlGixXtm13O03461ZfXkbogA1SQz?=
 =?us-ascii?Q?0XQZQ71bkpgZqpc3DIZPBsxoSx2A7f7yg1bsuIFqKkDw13rYRUX9YaCcXkiY?=
 =?us-ascii?Q?0P5DisrPar5Yzla5cRmIDnZMbOFyLBO4t3pjNuhmrdKzO5j1hdh13sxVK8d7?=
 =?us-ascii?Q?eJGKdcVtkGThpTso1sKgd0EsDvm/tgnxSCwQBeeT1WdLZkIVPaOyGY9KLc7T?=
 =?us-ascii?Q?+qzYerFJLpgL/N1yysOqxJaT0a2TB5aJ9ZKKQBVqDK8iXgipKYkj7EAoMWxl?=
 =?us-ascii?Q?fx5ztyE2TuptnjN0CknG5baFi+0mzG7h9hOhUuT6fgs4Io94TBOxC8NI0Xs8?=
 =?us-ascii?Q?QKGJZnForwoSM4Q97gK5guw7Yjyg/1RQFvFMslVI2Yqce1f8NWI0zvWNYLKc?=
 =?us-ascii?Q?LLDjWO6aSZZyVqBmqQ1Dl1k=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 696a3dfc-5065-4885-b523-08dd3bc58984
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 15:49:35.9472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5+r2+r9MCxPp/JLwIR9P8DkpWDe7oL35l7nSr1Z/tzdetwk6NNh9gKL4Iig/LmR08hh6m4gXOnl5cdPhPUkwWb2Yq5fdHPl60FDm0cH1h0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
X-Authority-Analysis: v=2.4 cv=b/xI4sGx c=1 sm=1 tr=0 ts=67926512 cx=c_pps a=VzeH2YOhhDlPZ0WtbyP6yA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=jCXEwfVgUjATtFLOCtYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: pZyOdaIh7nphMAfp4uPBCuecSIzd0Oud
X-Proofpoint-ORIG-GUID: pZyOdaIh7nphMAfp4uPBCuecSIzd0Oud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501230117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 15:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210197

From: Harish Sadineni <Harish.Sadineni@windriver.com>

YOCTO [#15061]
The rust target and linker are getting setting from the sdk environment and
so the config file is not needed. The redundant config file geneartion is removed.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 846dde4dc6..09e1b911a2 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -65,20 +65,6 @@ do_install () {
 
     chown -R root.root ${D}
 
-    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
-    cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
-	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
-	mkdir -p "\$CARGO_HOME"
-        # Init the default target once, it might be otherwise user modified.
-	if [ ! -f "\$CARGO_HOME/config" ]; then
-		touch "\$CARGO_HOME/config"
-		echo "[build]" >> "\$CARGO_HOME/config"
-		echo 'target = "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME/config"
-		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
-		echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/config"
-		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
-    fi
-	EOF
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
-- 
2.43.0


