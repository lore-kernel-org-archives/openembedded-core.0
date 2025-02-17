Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE06C02198
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 03:26:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.43776.1739762768218822640
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Feb 2025 19:26:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41434a3e80=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H3BP8b021605
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 19:26:07 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44tq381aum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 19:26:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZV93BWlqLCHLCLXC+lhbTohxq5OLPHUKeigeIU78+pFjEHBy4odgNs/ewnekgHSgLiA0wjK5Yg/ZqDVWLnxOXNgYtfRGA7s49Q/qJrVOv7o7DRGRWmCGTPnPC+F8ljt87srsPozxeMt8j8JJ3XaRmWwpfIS/CZeoWAmepVvkzVZ7/NKNAj8akhKBATIQ+oudP53yG4Jfdkv2sjaY8TEP5PCmmbAXlfqnYXiaKwtVGfFn1eTrcN7MsKP1N81EjtdbOyoDv6uaB3PmBPlmdyCXG1yXmhyiuU1Nd0szcZuad3gFtuR+G5JJaq2JxeMi36TRuUrgrcHcYjuBQlLcsThuYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/np6RdFyEN5qN+8kOCqEEmQGastin0cXuoQmYW81UTs=;
 b=Wc6V6r/4V/1XJ2SRsR8TcJOLFAqx88gENfsxQa2rRFNf1SyEupBbkTmg+6JvGgzsn+JN8PEQWT4WBucYjaw86/chqq5n2iOnM5Ns99L29FcOAh7a+u2deYsNL9qeHp7hH7+GgxvGpVQVoS4bLdveb7oqpHSXqZgK6+S0b+XPAdtLYbEPUSur8egzeKyCE/2GONWng0RpecnYaEnuNO2i1Wrt7vwknJEPAmrUBPH2wmjtLZZ+I/ERqMEtsZZojYrODA+kLaJY/UMeUa/NknNG46K088X2IDZPSRCuxfrk5PtMZI+QhUukSxXK97d9m11ecGDfFC2UKoQ48qjrNMsNfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW6PR11MB8366.namprd11.prod.outlook.com (2603:10b6:303:24c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.15; Mon, 17 Feb 2025 03:26:04 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 03:26:04 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] psplash: update to latest rev
Date: Mon, 17 Feb 2025 11:25:47 +0800
Message-Id: <20250217032547.3784081-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0102.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW6PR11MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee1bff9-b1de-401e-28cc-08dd4f02cf38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Tb5rfQzMYsCB9c/6Lpj+VxV+qPiIiynjv5rCvHpwXC5oP36wdoCYF3hvyeeA?=
 =?us-ascii?Q?xbBxcdLCnzq/i4iG9/zy4LWSfYhshw0E5szx2R0xR77CXfdS//fTAE09Whdv?=
 =?us-ascii?Q?Sd7ps5ArDHJ8NBi49gL53uco/C4WMyTfd7DWp5lWNgy9TkeOZ+MTviXc7gL2?=
 =?us-ascii?Q?EkUqV97IXD2KJofa5Wuk2jtKccJvNsBaLfQBl8T6PavZrIwX+8ZpwEG42fg+?=
 =?us-ascii?Q?hP0q6bU2YfWLJIT1RGqfGHPF107ZbvjuL9x6ss2jrEMp1qTkD7HaLpyTMUNi?=
 =?us-ascii?Q?2Ly9iNyamdr4B4uI+9ojgIN0iH1DSDjfxQPA7QNA8WN4Eu+b/vUB0gFrDUi4?=
 =?us-ascii?Q?l40BRLGGpAC5KWeu/TluNJ9+dId7iA9iANr4TTLDk/pvEQjiOzDHi+f3q5w0?=
 =?us-ascii?Q?eBTyoCyQrPmV8uFLpqibEQHpqiWSOczWnpzz7UyStglBuTXJ1/6m1FjfD+yu?=
 =?us-ascii?Q?UILz6nfDNTDBEQ9/KBe7hbbC1sDupzxNKtfRvchHdwp4smtj8jN4MpazDS3I?=
 =?us-ascii?Q?kwdyN8V6L9gLduAPp1gnuML+yNFNCw6zL+qc4eZEdlXYPV2LmrJC0iZ4L+H+?=
 =?us-ascii?Q?UCU9HrhjXtS0K0mjbWJKsTIn3/PMBV0up6F16zWxMR+6btnt2NJaUm0j4vxy?=
 =?us-ascii?Q?ugGWC/cnyVRKC8DTigkAABoht65NGQ3EigV4Mm3sulqb1UwYCReZNdy8FBV6?=
 =?us-ascii?Q?ZVE7cRjLsd46KgWH+GWidLddKX1DpTbmbbvss/hCT5VvTY+R+kdlNG+PbL3x?=
 =?us-ascii?Q?khQ1Yke5HYcJ2dRA0M7WLcO0eWbC66qJ1mjTEaS1ds9UNCcCwJl9vshLDksv?=
 =?us-ascii?Q?i9cWgf4suRigtvDOJW7PycTwfhNwULeE9FByINpMFqcPD5uIPhrRjQp7AtYL?=
 =?us-ascii?Q?TMXCFTn16tb8NkNYLv0fhp5BNuaoQq3SDUqzKZcuGGCvcLKTeCnQqf8HnlA0?=
 =?us-ascii?Q?ixgcF8Bkq2jET1bRMbifp+lsHnkj1+cSflhL3KmOZG/efmZJP9aYSeEZsWcl?=
 =?us-ascii?Q?AhvjDatH5Fu9susIIVfjQP9lUlxv72P/t14ygF5Eg2AykvsRHAzk8jOUqmuU?=
 =?us-ascii?Q?WE6l960is6ao0U+9QalJP2TRL1cuhmN+qDz8/nDTOlsbQ7Zey4d+5ZawZlF4?=
 =?us-ascii?Q?ZE9seKPB/UyQiXB7Nr8x+k9S7yH8L2ibNng/V2bl03LiprE7x7+acBWBhW3Q?=
 =?us-ascii?Q?0zbdoyporTAGdTwhBcjVnr5uLTTIGDlNUGNnOrDy8HjnsvBhfqgMW+owb7AW?=
 =?us-ascii?Q?TagltIq4jjb54NYuEoUHBAC2CJtqi6wKM/CupvVSpyy+sHBxhGNA/9CxXWsJ?=
 =?us-ascii?Q?53GdBGuSL85d65wNWDfVzEuysh+/18lVxn5HO9696eBnnw6yLcAt/EB/kwC1?=
 =?us-ascii?Q?RRHeDgtqtwSBWfg6a18yzNE32FNsGGUeIbTGFBpQVC/IGyl8lWxNa94L9h5Z?=
 =?us-ascii?Q?WwKuY/bn3uTJ4qudNcpaVCLFOouTQTeu?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?O3h1uOuYLGv58bvDflTM785PtXnNjHVvngaVIkP3vN4zzOw7wOPpP+Dh5c19?=
 =?us-ascii?Q?oGYb2Q9IoYRGOfKz5eVm5PKC1rV7BbDK+GRhiqfc/cF9JaPoOmADVD6ImOTc?=
 =?us-ascii?Q?Q5HSG4MhVzBrzDHfvHlZ6/6PbfPPX1+sl28dhoq1A03lJfnvkcWzKnmCh6s8?=
 =?us-ascii?Q?56cq9YX7sUnn0XgbXTDyKldXIVMLUO1MysdJf4I7KEY28JvMXk4xUj0xaZO3?=
 =?us-ascii?Q?BpY2+mGHNshBmI2NDwVsTfm+BNRHnNVpFf32yMWssHwhKg2bKr4qzV+7pZ2+?=
 =?us-ascii?Q?24+H1Pz3kuGfWIjqVmi0J+lFaeIh57drY7RBpJYu1s9CMKRpeRPWRRb8A6bR?=
 =?us-ascii?Q?NcGAaMO4ORQ+lLk30wv41qzMOdX2m9ikzwhhXmRFTVJX9PBm5YyOv5uFiSdA?=
 =?us-ascii?Q?JOjCnj817mDMW0NWE/NlG7DPCKavZ4QjMRvfm+IMb2fxfw49ajy5HcybNFZp?=
 =?us-ascii?Q?J42br9/FrifydY8IKC3bu4dpwp4y+tB6uPB6osajBa+IqulUBAuyTkpfdx4B?=
 =?us-ascii?Q?07r5zvfke1SqkkHQI7+7uH9RAj53iTiqoDWGxu3qn/giXT8CbBgf94kICBqX?=
 =?us-ascii?Q?eTsbl29OivmQ3Qd85ETiez/TUw+/XAQ82HYQq2Pc6ToxjlBEeZ7lH8c7TMb1?=
 =?us-ascii?Q?qLNNHNsk5JYSuovrKcxJYVQLZKmi4f8w7akOoCMkSQvLcyPVqbx2qbpic2IG?=
 =?us-ascii?Q?uV+HNbEIlx66UY/YT3EgWeMB4YMFdtmXv1MRgnF7w18oWBkE9i+72qZLJ1qt?=
 =?us-ascii?Q?oFpyhg1lvjBJXOuD7cYenXMMDIKS8txQPD/uPiSltWFcUdH39XTkbL4EL71V?=
 =?us-ascii?Q?P2d4FuGOzplBnICz+W2P4kdgheiUWt+mMBbrIftE7H7fc8qyaGDEoqpha/rR?=
 =?us-ascii?Q?cv+vE04Wc0x7kdlPiwMfFlAXzph0oxknc/Vsdk2VEH1lACvffHnV700Pq61V?=
 =?us-ascii?Q?V/3ZDBZHH7YDN1PocusYGGEQSCNvCgAL5kdjwyLhoC3u6qKvOTU0YWKWgVZb?=
 =?us-ascii?Q?dHvXQYP1iScUR28WuL22BpcgLu9UL5eMO2wGYuDTQ7o9YhL8efGqZ/SEJL6R?=
 =?us-ascii?Q?VzysATrzfACkDYqDP1imlvI3YStf4C1QjyaMUH+9AA8oB3b3w7vV9VVXZvGI?=
 =?us-ascii?Q?uwnPxcCHvlVuFUNmmmdzIJjOCPYGiuyWmKqzJ5D8Nzwlknfc/NsV7os36llh?=
 =?us-ascii?Q?+Il8H+/4V1wwhYQzpUDoHDfbn4X/41BSmR3uXyJQJz1ZB6qdfAEUgd4/zVf1?=
 =?us-ascii?Q?fC4LVcFELXydr2Jt/b4XapEsodSaUBWYOOixjK4MIN2QAmwyJ/8MwM6dWWF6?=
 =?us-ascii?Q?cHts3M+IOIWEw6C/iLF7DH/+PW079FtdX9nfvXhw6aprk9cy0//PS5MsOOTL?=
 =?us-ascii?Q?K3HlgBXxz7pJoQqDpVH33kJDMLBqy28vu46tu5lmYHCAO8Zf+XHPUk4krV97?=
 =?us-ascii?Q?OU2v4UTtp6g+Xjiyl5QPWgZ7YVwdoIvzm/hsg+Gb+y+SfuYpUaDRVEsgcMw2?=
 =?us-ascii?Q?Kv99qxSwWScX7rKfQcIyxU+5IRHwcrhiaFeSoCVgi3bFpkgyRYOEECUE9Z9D?=
 =?us-ascii?Q?OwjuBjZ1J1kizaHanxrVN9cV1kJ3qNKibhZIn+AZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee1bff9-b1de-401e-28cc-08dd4f02cf38
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 03:26:04.4119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/ZefmksfqRfaFtv2sR/vLMA5a/5uzdwfCJCVQOE+MqaogKEmYyTiHyFv1iYR7strmGbqZTGfgxm26+TER845Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8366
X-Proofpoint-GUID: dRX-ZV6gVKalkhhhBz63MnAyYnMw2yPz
X-Authority-Analysis: v=2.4 cv=fLPD3Yae c=1 sm=1 tr=0 ts=67b2ac4f cx=c_pps a=gHjWyi4SN+6fNgZLRl0D7Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=iGHA9ds3AAAA:8 a=mKcwmjFzIoA6mwRdmAcA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: dRX-ZV6gVKalkhhhBz63MnAyYnMw2yPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_01,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=592 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502170027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 03:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211509

* 5a32cf6 psplash.c: fix crash from length becoming negative

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-core/psplash/psplash_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 30cf61a2cb..c70c266066 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=8;md5=8f232c1e95929eacab37f00900580224"
 DEPENDS = "gdk-pixbuf-native"
 
-SRCREV = "ecc1913756698d0c87ad8fa10e44b29537f09ad1"
+SRCREV = "5a32cf6392c784a7ae1983a354cf07b024625cd2"
 PV = "0.1+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https \
-- 
2.25.1


