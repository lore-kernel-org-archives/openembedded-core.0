Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7F9CAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 10:28:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.29286.1757932107023894626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 03:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=c+8ZsNNK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13533b6b07=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58F9n077583025
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 03:28:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=+0P8LWocLSXQj1MOgkZQP1dQEfcAbeUGdNjXPzTKo+0=; b=
	c+8ZsNNK5hEIPC5mkXRRnrGQWE/TnEMOdqwymGlyv5kNpTE9Ap4n0JYiO89xt2j4
	HCuvfsWi/YWnGj9nz9HpFdQJycVinEEDgpv2z6dyyexorMdru0Zj3AUQGsXUHPvL
	H7yvIaaYdO0yo8NefDKB+3ThxM6fRJ5cTp2YRghJQXlRoUHO768gLqg6UkOV7pQv
	BCPBSk3u0FBfwz058prRnZaHyQBY1YiZTgmDU6pIaMWj7nzDN2UbA+/QNpvDZEe/
	H+UCO1O736HJ1iBGyjpFPva+VcvlMuw5XFU4sMJsUoWdm/mc6po9gri3xwzj5bp2
	mgFqB5szm+WJTgr5x6XBYw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012020.outbound.protection.outlook.com [52.101.53.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4953w29qwy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 03:28:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYAOxzC/rP5zx21L4WKm3rwnSqeCzfAL4J0DubIOkx+A+Y7OPiHg+sTyKjqHpp7ipAG+wvLF/BNxqOHS+vFrx/EnPi2A9Tl27sjJDrjKXQ4w6GWwvswRQ73cVhp/b5PMVGuYNVCIgf01zk5RsIPVBIVvIzzK6W6ux11gCIZ3RKvMAj/4CiN/cerVf8NQnC8N2QmuEigrCEXDQHf09dwHPcazslrcbK0ki4QtEIewlZ1DDV0R0YmNkXpUVeg8ACSkES0eh2ctKF9mu9hxtwKkABvmIDdKKOWwii0Zsn6PJj9PbEZZ6Zlnce7byTN2qKSY83mode5spFnOmhioj31coA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0P8LWocLSXQj1MOgkZQP1dQEfcAbeUGdNjXPzTKo+0=;
 b=bab7A+VNYrkEKImGuSa4FmFYMhoiAm8m1xCKYqNQZRo74X7QtLJUXmw/NXIM7nxvtHKare6XR5kx3XWnncN0hdxye0J+A0Eqn/Icv9lN0auJqqOtHUNpXQgulU5ugtGvTF/SzjLlIH5GKpkofkzwf0Yn/YhEliAw4sWSQabIFc8xbSNtI2Zm0dnVdGH+4IGgg5WeH7WeX73ikXNNcD9WQkQTeucFr9JVA1H+l/dMNB18GLSdTYlU9wVMoyAwffceh10zCciQeS1eh8xM/UB+7aL/mrD6WXQ143+YRbkBnuJ8ZF28mxZPHx2+78jIpMkwCv0rmcatHBEPgpM6jrFVwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 10:28:24 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 10:28:24 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 2/5] toolchain-scripts.bbclass: Support target-specific environment setup scripts
Date: Mon, 15 Sep 2025 03:27:47 -0700
Message-ID: <20250915102750.3298492-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250915102750.3298492-1-Harish.Sadineni@windriver.com>
References: <20250915102750.3298492-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::26) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 29db1876-3064-4454-9ccb-08ddf44299a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BM0A3gX2gOCSbblEu/lvOR2rs0bieQWSr/YI723UfzCc/osZWVfxhrayBgov?=
 =?us-ascii?Q?bFMwAkkc+VIy4wNpkoWDYIU19U9UmGPY86IPxKg+VW7IbPUss25zswpMbHr8?=
 =?us-ascii?Q?ELhvY00jtDrhIToIVDMQHauhMaalsymiQ8JzxdnKoOh9l19RfJLCRGslzv0Y?=
 =?us-ascii?Q?/gsVXTD94AFowTzYS6uj8HCA6w07nSX7z8P/uroxolU0zoMlo1fR0WHjOwQY?=
 =?us-ascii?Q?AIRKaZiYFGwOQMocw3WG/zYz0kcpT/3Gon9aIw/1oxjFUjEHvG4pRs93/BNm?=
 =?us-ascii?Q?nu1BULu+EfxnDbhY18gX6kpuE7CqNQgf0OIhdKe3l2ePrxolTTo3I1X4y76S?=
 =?us-ascii?Q?z/j8HGwzQNPt+Cw2hBKaXOCryeV8nRwaHacQIKSHzK033rOcBi+jYCB6ZDHS?=
 =?us-ascii?Q?xaO5f62plVXswdubQQnHNOhf65TBbDJXEmxl7lXrue7BisyhaI6irIMoWM+k?=
 =?us-ascii?Q?+7AtxXhfB5aDzjHaD7GGONXsu9rB08k4O+TtmXsaI8ajdZ5TMitim/wqqmFt?=
 =?us-ascii?Q?ALH+FokdbF+KBxZp52dVvdNeDPSYWP2aYUsuel1dFxsaM1415LNHRTNFugnh?=
 =?us-ascii?Q?L0Zcnne/Up1A6aW8DqUp4/yaHRrsM0/R+UFYzXGwYG/vUe3HpcjisG/QR7+t?=
 =?us-ascii?Q?F8BDK1mu4uRN19Kk6F5Rc2bmqZroQOXmOGx0zdQjj6+OLz3b1QsmYiMsWuvn?=
 =?us-ascii?Q?9worm5uRaegjL8+lHkPTUK+apJN4eYAl+xScQtYtJET31d5OHbAw0HtPf+HL?=
 =?us-ascii?Q?wkelQZ05wEJZXeoNVvL71ThuOyJfUj58j6cPuwiR8ifjG8Ik1Q4GXry1gtDo?=
 =?us-ascii?Q?/VMvHUlcWFSPnrhClHzhb5sof74xtPEOAN8bSkUSuZsDRM0FA8M/R80LwFes?=
 =?us-ascii?Q?v9VtXY7GoHK6u1TFFexJNIJeU7VMl3k8K0r4WIvqczzSV5+4wsezqIN0Nkzo?=
 =?us-ascii?Q?v9f439QUshha79OHuw4TpT4UQLtMUpbcUeKPrmuetssjp+xnSIl8yqgt993b?=
 =?us-ascii?Q?gHRnBIzr7unAf7vwDNyN4TelSHcB3IulX0SbSfwlouZS8kjUpbtOY2zZJwFb?=
 =?us-ascii?Q?P/frIqPEExrAxBOUtPwV1wenQ27tVYc76ijv/uambAI7yJYFzpDjmA/gLSRW?=
 =?us-ascii?Q?a3cREBku8DOl6D1DpUsPRgS1E2//ZI1I8PVAaez+Cw0Jb6xI+EYXj1OMhhg9?=
 =?us-ascii?Q?TpbB1JMiMJOzB6wfZS/AylQiq7Fksbt7Z2F+sb22MqeZ5Xy42/vciBcsJPg0?=
 =?us-ascii?Q?KTdvFxnJgSvcElUKxypBIdvb6PLxBDFnvGVEMaYQ4XSzOgOiK2fcoJJIwIfr?=
 =?us-ascii?Q?2UyKJAIEEJIawmXIBslwLQeWhreDt878YDUIXwl2ZUMRMxabFpfKmkffbHfp?=
 =?us-ascii?Q?+r0n34LpT+K5zXzMi9EdW3KHg1I9n4XzYsz3sgwn4L2WdSy7I+1z2migSpj7?=
 =?us-ascii?Q?fs+MGYyKFp0nDIzTTAc7fPZZYW3Jfkkl85vA6ihdXYVb/mxSXaW0kQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mbV9OSpOWv/p/mwZhizBFY63BlCKr83jUs3SlRUD9cZkCqMrpTGbxBbaOSrU?=
 =?us-ascii?Q?lwC2Fb+6Sjn7HxxDvSdEONgFDNwqJ+PiiAs4pc/dzf22dp/MQn+V/yTvelwz?=
 =?us-ascii?Q?KQnaZYhPWU/7wKikpyG8IRq5Ln3irK67eKk6IpOhv9wcaxHYkI5CwhSeaIyt?=
 =?us-ascii?Q?Ywl9q+gp4JCsiORXZ2GLwa1z2zCPFlMpF3NhjRykbn0+mJZclrBOyo2cEyPE?=
 =?us-ascii?Q?xT40hq7ykEvKB2ly1ZM4n+knFb2GN9t0YYJGsAaw8G0fjMtjlamLE1HNq7N1?=
 =?us-ascii?Q?BETSmDqrC7y2PnEz653tIMxuq6Wa1C7ndMp1mzAAKhe9xm1cIoOIQYIdp6XI?=
 =?us-ascii?Q?o95Y2ZSmTnGwQdKfhmicZzDOawAwunJvPZeTMIqzLsZgBKFHqRff1sWcUtqV?=
 =?us-ascii?Q?07QAuKzsNonBmN8XEvOQob3vwW23TSj9oF9CA6VTphNIoylpSWYm5ohK4kG5?=
 =?us-ascii?Q?pkmDZYw9XGACMtr6Ra2pYdQgggbiPJPAfEXNtmWFNoVHcZCFAUWGvfa8NFeK?=
 =?us-ascii?Q?LNCs7t5r0ZWxkD1VkJ5YNC96E6OYnSEhdcQaaV1z6Qe5j/oiVmrfkJ/UCISb?=
 =?us-ascii?Q?BbliJ6hwchL0qSdeJ4E6SN/ENrIeKM9ezOKM3kuFn97dzf4idm9Zcb36G3/4?=
 =?us-ascii?Q?owOYSvouz0fMxHvyCmjofnnIpmelhfTjFma1czJd4A4S0Shh2Nq6SRoy2Ivk?=
 =?us-ascii?Q?IoqIISPkw4MZl9pVvgbAuNInJgU3N9p6p4yz6Sajt/E4l/hjUJg5qM/nlTjI?=
 =?us-ascii?Q?zoGc4qk5VVcfg9dXWOvPtwsS23RREfEsWuiw7H597yCnyVzYo2vl0Nk3KHYE?=
 =?us-ascii?Q?F65b95lkBXujHLIqZ7cKGf5X1rYRhOHOwC9JQzayMHn4hC+AzIN7vm6naEnb?=
 =?us-ascii?Q?+i9hqDs73LHZDLzo1LIQ7sIApP+R4jbQR0DnG+KoSLt9owU1jm+A0udegdDk?=
 =?us-ascii?Q?YGJsLLYC59aInJSp7ybqzGkaW6scv8kxik7eTp67K2RWUJ916ag9DgzC1UdR?=
 =?us-ascii?Q?6m0+EtnaXXT7yRwgp6CyVyVMLMcPg94p2gKVw91QE4BCen0AZI0FEl/iu3Vu?=
 =?us-ascii?Q?VmjvGYpj7w9mjba26O7mF6d79a6LGQAvOZ0S0QB4xG+5OJIo4njJrZB3QFfl?=
 =?us-ascii?Q?Jw7OE0/B+b4au3yTahgxzvc7dmwsvsy0sE6bUAa08TMISzfYTk6LCjBbEJZj?=
 =?us-ascii?Q?4Uz9wwmxsCY9Vx31z/zJyx2XGIp4h0/6tWecxYfTRrE3/HQIz+faFk2VmJrE?=
 =?us-ascii?Q?4Zp2SOV8Zb4ygvh3qfJ8X4NzGV7CMB9KRBscWl7Sp+xCWLpnVPtrpehPGT4M?=
 =?us-ascii?Q?sqy3qKqytXAFeAsKmX+q/GbecjRNmf7DUkprBLVeNnG8xHHncj7t2eoh2hiX?=
 =?us-ascii?Q?4MLMsaNTdjJzN7Tw8i0bGgeHF2YMnM5QSmnUpCnLai0OuDhBVS5keZBFii77?=
 =?us-ascii?Q?wGk7f0dTwJn3TSm3Tr0DRg67gpPxM+/Q94OFYuMafKi48UFct7jZz/78j8Q6?=
 =?us-ascii?Q?XpQxl6Ybw+vmsqY+WMxoQ3+vNsOC32S4P8wGKydopyRwuuhBiv34njdXbTLu?=
 =?us-ascii?Q?UUOHuHWgMB2v0OxVzxEt9TwT7AxZ/tuqm9qjJI9kkZZQuLLCFzO8mIjWsuxG?=
 =?us-ascii?Q?tg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29db1876-3064-4454-9ccb-08ddf44299a4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 10:28:23.9976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/beC5qTsMmJk5+XU9BK5NYtLhwyeM04uQrrMB8v3SwmtGi29tiSL5L6yjluCjmLSlMJ4brXsd1I6hi13w2xAUlwBIBrbxR1r5aTA1nWIuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
X-Proofpoint-GUID: s9pCm5X7HI5ZEyqnnNFn-TmZNK0GUqg7
X-Proofpoint-ORIG-GUID: s9pCm5X7HI5ZEyqnnNFn-TmZNK0GUqg7
X-Authority-Analysis: v=2.4 cv=PuaTbxM3 c=1 sm=1 tr=0 ts=68c7ea4a cx=c_pps
 a=3tfckwpITFtzIurveUQz+Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=eBDB5BFNjr592XKNvTAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5NyBTYWx0ZWRfX/63xdeunl9+V
 j27Oy+15pb/4zYXHmkbxOleiIZxaaJodJwZJyU02eRrjEUb7f3p4CzQkH4IB+cCDrN7pA3XiFFN
 aqglRb+NSHLIVgwQOhSTsNKKexczGw1T55KF4ItRhF3kxR7g0sHEeQchj9wi7yCTMkV/xPaa0Es
 UQh/v5IALUOShlfO4M7e0GIRdvcmu+zzacnLiWmPdhJqGwzfUPYfO43kGjQasetWbndCXPN1Lp1
 4KalicxPYLx12Ims490XG0NvofPnHLNVnyUbNLeiysRF4z8Cbyy3CENPkhFW12BoPPYYuz7XnBA
 +PYU4e5XucnR2612mGwF+7BeI/OAllI8T6cNLb06fsnoOt93yO/d6eVTwGNnZA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 10:28:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223399

From: Harish Sadineni <Harish.Sadineni@windriver.com>

YOCTO [#15061]
Extending the SDK environment setup logic to also source scripts from a
target-specific directory `${TARGET_SYS}_environment-setup.d`, if it exists.

And also printing the what all scripts were sourced when we source
enviroment in sdk

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index 5d28df845b..c6f7faea81 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -163,14 +163,22 @@ toolchain_shared_env_script () {
 # Append environment subscripts
 if [ -d "\$OECORE_TARGET_SYSROOT/environment-setup.d" ]; then
     for envfile in \$OECORE_TARGET_SYSROOT/environment-setup.d/*.sh; do
+	    echo "Sourcing target env file: \$(basename "\$envfile")"
 	    . \$envfile
     done
 fi
 if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
     for envfile in \$OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh; do
+	    echo "Sourcing target env file: \$(basename "\$envfile")"
 	    . \$envfile
     done
 fi
+if [ -d "\$OECORE_NATIVE_SYSROOT/${TARGET_SYS}_environment-setup.d" ]; then
+    for envfile in \$OECORE_NATIVE_SYSROOT/${TARGET_SYS}_environment-setup.d/*.sh; do
+	    echo "Sourcing target env file: \$(basename "\$envfile")"
+            . \$envfile
+    done
+fi
 EOF
 }
 
-- 
2.49.0


