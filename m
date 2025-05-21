Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E64DC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 15:02:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1312.1747839765796258937
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 08:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7236802fd5=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L5uQ35007714
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 15:02:45 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfx1h7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 15:02:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/aju9rX2bcy/QJjdiTyW8tBpZbie9DTYgU/DxmI+pTJ7GYHtwBMambOs+vG2J1KBMqptSQSv8wm0Yr7TJi8Nqzz1lbojKXBdnfy9ZZbYMGyBFamzhmVbtgSrR1JxrRVvlgtlUNFOhUQriZoL9bON/lHdcibCt+caLhipEJ8YBnuNDSPjFRkvzYQgYPzge7DvK13u5VYpv1T12l3Kilh3sek3e5lEdPyv3To3VhBL2ouoTngVdIrht6QQM1jLUnnWrizC11apZ/LI0IFhD2wrR5PAm/n88gWTnxyNmvSrLzxWCgRKxMEvrJq7OAQz97vugqZUBKmGxy4iokCi2u5tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6CW8ABeATwYYkaO7dD2Nn1eoOYonSJugBUzBv5YDu4=;
 b=aUss0mklMTqAP8+exXcteuzn7Wnk33gYurnrxK0Zru/jrfYfRER2ly5XWmNIsuU42NWgT8kZOLeM7qhg00oUKkrdewtbatXFK1+6tAl3SBFzhIEvDxWD/gudeMur5uLWItWoLIJvP7wZhhb1gkYaR7KCu1vaolzrIsLk72OPJQwoH96TcRUZpzVfXtZaNdzdaNj+IyDFrV/3toZaf7C5HWTT1+cDDsWcwSxqUEKr3DD0vvYLoQNFgJKgyiiA7q8Qo9QMS9Xs4B8/etlIELdu3Pphpd24ZCNe0gNolaF5bZlj6KxGayAqxrXE5jklmqfxQuR/feZLOTDjUhjA+QwxVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM4PR11MB6167.namprd11.prod.outlook.com (2603:10b6:8:ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Wed, 21 May
 2025 15:02:34 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 15:02:34 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [scarthgap][PATCH] binutils: Fix CVE-2025-1179
Date: Wed, 21 May 2025 08:02:13 -0700
Message-ID: <20250521150213.955672-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P223CA0001.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::32) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM4PR11MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: ab2f63e3-9cab-4f0c-8952-08dd98788493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GffA2wIFFNQeaEkq3BqSA0fdL+P+8/LXnB4tJWRbmltwpF2f9UHtnKDdAcqC?=
 =?us-ascii?Q?IQfSM4NjfB3xgQ8df2qy8CMglva99PmoToJ6t/qofoyW86Dni1hJLzwb5j9f?=
 =?us-ascii?Q?dZed9ZMWrSV35BJ+ijdOymTb45c7llzDZWZ7wqMTscyJZmnzAMpnoblPSw6I?=
 =?us-ascii?Q?nNIBVf3z83zYBZqu7JcCF9N9YnBsPv3J+75OOPOipfxO163jo62xoIlY+mRZ?=
 =?us-ascii?Q?D3m+RpfxuO2XYeYU4+KrIgfnMf//ELI2PYzLmFVtCt4I4G/ltJ0HOsXfa2wt?=
 =?us-ascii?Q?u+Q+F9I/FDqmDRpZc45bqZXuz6KJxMpH3Gpe5DIwVnlPrPjH/vjHYbOqPNmW?=
 =?us-ascii?Q?Vge5boYjsigPFS9PelajV0nK1iH0v8bWVbvc4yzR9m9SwRlZYNRHZ3+LVctH?=
 =?us-ascii?Q?+xfo511+bD2YJXw5EflmZSM0iJFa1BhxvJIiPbOCM/P8Ia6JQx/DGmR6hXki?=
 =?us-ascii?Q?aqctKR9OaLBbw2G2vgIRXPxPWh+USbwVik/hFJ8J+mN0A7rq/Yk9E5Xe/wfm?=
 =?us-ascii?Q?Womn0IYxO1Ad/CkzI8hdJoD9BrR4SJK0RXTkQv6S/FBd7Y3xrj5ssvaUj+Jy?=
 =?us-ascii?Q?AlDYRQP7a4nKeE53GBsqMah05gJnmj68OjNe3yFXUxtzDEQnnH0KF4Bn0YUw?=
 =?us-ascii?Q?WyOMhHvEUzJx+4YjWm0nBC2DB64dcMZKE5/W1T4jdXg/fySB1oSAPU0mePBs?=
 =?us-ascii?Q?QSSFWPNYQfOGLvr2DnDdTzIy9ruziNzLGgJLxcq/nkJ5xaBb9y0ecf4MZCez?=
 =?us-ascii?Q?vPg7RXaDxJVxsg+204qj4Cu6zoUUFkrsHmRNj52ZONfFmZ1Yjetwn45Hxb2H?=
 =?us-ascii?Q?O50PC5Xt1lvSsjQud5EpoKkUnLsAEni4rT71mRLU+Wjz6yniNhkpvQWZzqPD?=
 =?us-ascii?Q?iL3r8mLkOJzzCP/w8zuA+16HUAxGAWfshxiwRs78vCa+dGxs3sLAM4O4q+Gl?=
 =?us-ascii?Q?qvpVgmjbLpucWvoApSZt5MqWZSueRDJujPM32SuVjHmEYamuqLn3vVlMqbbu?=
 =?us-ascii?Q?qz5V995OG58/9142fTBDObdNsAGZSRT83rzVkcx9v96U2ynnACPQp+puLNH/?=
 =?us-ascii?Q?2mJ7Z99EEumRYhx149gtYGsE2wfFnoUMJRC00vNLeoQc7yofl9YDglfDNRoO?=
 =?us-ascii?Q?03SAU/FVOO56FMg0BpkDI2wUmEatr8DHXRiXqFufASXHlwooiKGRkdm9NLsy?=
 =?us-ascii?Q?kc0f3LHx1SH1pNIHfSA32AiwKnOdHp46Xuwq6fPAdVQnwAL2tzsJliZyxrcE?=
 =?us-ascii?Q?Bg/MOpR07gQFIbmi+0WpFVn5vJy0zhzSrtNnjP3v/6xANiDjUNrVXHFFQWJe?=
 =?us-ascii?Q?Z0ArunOVh1Wc8tYKcImEckusRAk715hXVXjmEQZgFmBcNbjZYT7gDSnLrtSl?=
 =?us-ascii?Q?fQw+ensofPiObR580rjAEN212zf3tw7IAGKoNw7wcPy5us1egLoDkRIynSx4?=
 =?us-ascii?Q?AYWFcMTYcfdp8i95ynPxJzgPodlNFU2J?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CipfDLufrSB1TDzdas/OftZNYqa0uUVKVFe088ldIntjobYIu91e7DUegIQI?=
 =?us-ascii?Q?R9esbxWiv5rFXuHMKJv8e7IFRbAqatQ9EID4Hvgir50j35P9zTuZwwbZ2xJH?=
 =?us-ascii?Q?afMd/CQfIufzk99Wy9wIplWGYqxLRZ3Wd7yw42PuDV6MB0qR25+QZTOxRFjd?=
 =?us-ascii?Q?2jeOj9v81F69wRoFExSwCaDZh7W1NpbzFw+ygjbMs/yLZpY2rANL2p6MmAQ8?=
 =?us-ascii?Q?dWEKsdQSDcOXAc+jGvBWs/b47yAKzJ+3iyeY4P/Qxo8YD4EqGfOvwwTRMqxl?=
 =?us-ascii?Q?Iu/7JspdxPHX1LCHq/Eau6JjV7UOXALir26j5gAfHPAJiiVYhB/uyjZ7+e+H?=
 =?us-ascii?Q?1mGi6HlMI5zAwwUQQ9hpU8quwahcuhOKY+LN4vRtOlbUzYvKBloOj90eYAZz?=
 =?us-ascii?Q?4kA+IL4nNY7Z8lCkBIkCn8861/6yiuRVvTV7wBmhD4ap8axowww6TOcvwDQK?=
 =?us-ascii?Q?KB0vYTHJJ6g0MWiVStI0IWWSxr90p46shMKlrm0qvqJgJhuolMv7seNSPxlh?=
 =?us-ascii?Q?rUXhkJSUGmwdlh9zdfkZpCCiz+Bz4kDmyPasjGQ8EzPxapPJM9Dpy3jQMXpi?=
 =?us-ascii?Q?0hBM3v0MysPlyLKQf2dhCS3ENK/ROpWv8iOeYJ1UZ7w2IfvtktebVW9w1huW?=
 =?us-ascii?Q?azmtFrIkL+77lGRjB6LrVxFyhPD5ntmrNpFFrz9VStYr+JIJCnKKptn8SLgO?=
 =?us-ascii?Q?3Zj/8lcyLzcM9ZIPnP2y7LOpwuHBXIfXIzmxJwiC+a6zVNE03dj/wGTqWiiQ?=
 =?us-ascii?Q?7+3mUNApMWFfeZ31RZpCDSFbkslrShXrA8wDSbzknCIx0pEweuhXZnvsJDg8?=
 =?us-ascii?Q?rH8d6z4224v3U1lsA7jQix/dVHFAdRvvqrhCaEw1IriJbGJ43MHmTc9ADaYD?=
 =?us-ascii?Q?ln48MLG2Sorot/8xlcgI+XXy4YKRkgzqT+jAwtMVLd3noSEuNIgRnY/E/qF8?=
 =?us-ascii?Q?aa1rux2h+mLc1NgUAzErUtUwuLLym8oYS4FMCPRhtLH9lARRZOlJe5/f3ebe?=
 =?us-ascii?Q?GrtsAluoJiSMT8SPlUhnbfjB7TxgqB+0Jg95A8E6CbsTflPg45PqZZjFl5VT?=
 =?us-ascii?Q?4BG8IWmmZVhwKn1Yo9qpnAP/WmRfuxTHwomj2szvU1tPYZqx6c6ayyKLE8v4?=
 =?us-ascii?Q?faSn2ccLkXVzOjStv88i8W7y3+JyTljBxPSMyKQSjold22SzQXJLbnIcE4xW?=
 =?us-ascii?Q?1voSBpvZqXlZil8zCSUeb+7JzoTM1KU3YdT8jCpsQEjshVWhQNFN+Q6xRryR?=
 =?us-ascii?Q?B8YmUyPnD657KOnSrMEip+NZz1dIBOK6YT3T4FgnH3fS6KI4BNbSybwkIycf?=
 =?us-ascii?Q?VDDdRfRiqeuGKCZ3pL6Vc7lSiB57ZrPEzYz/HaD7+5sylOH3/jOsbiQqoYGg?=
 =?us-ascii?Q?NT7L6jyFrNdl7avtucTb+/wzNyFqkBUtjUsxswajwBiTxtMA9DsVcETBtmbd?=
 =?us-ascii?Q?q8fEURGxDk33EJs02ivkAwnDbll4i47DG8dTMGVC7W0JEPUODm9gZcQeycQ4?=
 =?us-ascii?Q?6GiA0LvR9lblA4FvKD3mUXV3z3oZJxPHLXPKs+pHVPkZKPR/aPohqZBaSnvd?=
 =?us-ascii?Q?WFGepLGylUPYshFRbkAbMajm7kLrS9tssYjSCeW3I0DvQH22XIgj2ZkoNBZW?=
 =?us-ascii?Q?AA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2f63e3-9cab-4f0c-8952-08dd98788493
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 15:02:34.6637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sUqNswIPduFWbFWQbcoviH7Ho/foOSij/VxoctSa1FnKdbGXmoDMuAQhHpYdRmHo9AfpUJsFw8CZhK73a/a4Pp9X5vwjqsmZ0lTmn3oEycs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6167
X-Authority-Analysis: v=2.4 cv=ObSYDgTY c=1 sm=1 tr=0 ts=682deb14 cx=c_pps a=tyvwN2z/Y66O58r8mq/nTQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=n3x15zIcYO4mU1M8rw4A:9 a=8xwbEJl9mXwA:10 a=G5LFOQ7Mv1oA:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE0NiBTYWx0ZWRfX4dL33ayO/i4L f2/cDpVSWBZCuW2idwquz/G+m5XCq2ddF8az41Gq1lRzZhMB30dR4zoG7Wl05nhmo00gPwYe+p5 GzULFKxg5cMgT2ZWQD9C0wBr4QEsVoohW9cJiMga5iSv92Y1WCE3t+nXOYxC1W1vQqgq8KGql7m
 X6ICNas+NbIc5fpPnODX7HG40OCIxvoThKrBWJX6eLh6Z6FkRO1QcJF6K6T64/BVyc4nJikgPqN Sz/U5jzpy+KrFu36tzY64MvBoMgYMYrUCck7w7yqlW22XVwvxF+Gg4KXNEBESZJEN8NgsTE+g4N Ryc2/LJ2qCO149HLHIm7Ihw4NDN+UH9OnapsJaztzk6EtKpxCa/MdNe8xA4b2YAIlNhqNiBWu/N
 q7xpJmjjbookbL38zFBDJoc2U9x1T8l8oGwfCP+CLupCsGPCqJGpBz3csu81jAnmmwGm8GQJ
X-Proofpoint-GUID: DRScqXKUGxPSudbXWMrJycVagaBIEzz_
X-Proofpoint-ORIG-GUID: DRScqXKUGxPSudbXWMrJycVagaBIEzz_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505210146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 15:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217044

From: Harish Sadineni <Harish.Sadineni@windriver.com>

CVE-2025-1179-pre.patch is dependency patch for CVE-2025-1179.patch

Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141322.html &&
https://sourceware.org/pipermail/binutils/2025-May/141321.html]
CVE: CVE-2025-1179

cherry picked from upstream commit:
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=67e30b15212adc1502b898a1ca224fdf65dc110d
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=1d68a49ac5d71b648304f69af978fce0f4413800

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../binutils/binutils-2.42.inc                |    2 +
 .../binutils/binutils/CVE-2025-1179-pre.patch | 1086 +++++++++++++++++
 .../binutils/binutils/CVE-2025-1179.patch     |  269 ++++
 3 files changed, 1357 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1179-pre.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1179.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index e103e712a4..e3f2948fa5 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -45,5 +45,7 @@ SRC_URI = "\
      file://CVE-2025-1181-pre.patch \
      file://CVE-2025-1181.patch \
      file://CVE-2025-1182.patch \
+     file://CVE-2025-1179-pre.patch \
+     file://CVE-2025-1179.patch
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1179-pre.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1179-pre.patch
new file mode 100644
index 0000000000..b5bf27ec6d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1179-pre.patch
@@ -0,0 +1,1086 @@
+From 1d68a49ac5d71b648304f69af978fce0f4413800 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 23 Jul 2024 23:39:50 -0700
+Subject: [PATCH 1/2] x86: Improve TLS transition error check
+
+Provide detailed TLS transition errors when unsupported instructions are
+used.  Treat R_X86_64_CODE_4_GOTTPOFF and R_X86_64_CODE_6_GOTTPOFF as
+R_X86_64_GOTTPOFF when performing TLS transition.
+
+bfd/
+
+	PR ld/32017
+	* elf32-i386.c (elf_i386_check_tls_transition): Return different
+	enums for different errors.
+	(elf_i386_tls_transition): Change argument from r_symndx to sym.
+	Call _bfd_x86_elf_link_report_tls_transition_error to report TLS
+	transition errors.
+	(elf_i386_scan_relocs): Pass isym instead of r_symndx to
+	elf_i386_tls_transition.
+	(elf_i386_relocate_section): Pass sym instead of r_symndx to
+	elf_i386_tls_transition.
+	* elf64-x86-64.c (elf_x86_64_check_tls_transition): Return
+	different enums for different errors.
+	(elf_x86_64_tls_transition): Change argument from r_symndx to sym.
+	Treat R_X86_64_CODE_4_GOTTPOFF and R_X86_64_CODE_6_GOTTPOFF as
+	R_X86_64_GOTTPOFF.  Call
+	_bfd_x86_elf_link_report_tls_transition_error to report TLS
+	transition errors.
+	(elf_x86_64_scan_relocs): Pass isym instead of r_symndx to
+	elf_x86_64_tls_transition.
+	(elf_x86_64_relocate_section): Pass sym instead of r_symndx to
+	elf_x86_64_tls_transition.
+	* elfxx-x86.c (_bfd_x86_elf_link_report_tls_transition_error): New.
+	* elfxx-x86.h (elf_x86_tls_error_type): Likewise.
+	(_bfd_x86_elf_link_report_tls_transition_error): Likewise.
+
+ld/
+
+	PR ld/32017
+	* testsuite/ld-i386/i386.exp: Run tlsgdesc1 and tlsgdesc2.
+	* testsuite/ld-i386/tlsie2.d: Updated.
+	* testsuite/ld-i386/tlsie3.d: Likewise.
+	* testsuite/ld-i386/tlsie4.d: Likewise.
+	* testsuite/ld-i386/tlsie5.d: Likewise.
+	* testsuite/ld-x86-64/tlsie2.d: Likewise.
+	* testsuite/ld-x86-64/tlsie3.d: Likewise.
+	* testsuite/ld-i386/tlsgdesc1.d: New file.
+	* testsuite/ld-i386/tlsgdesc1.s: Likewise.
+	* testsuite/ld-i386/tlsgdesc2.d: Likewise.
+	* testsuite/ld-i386/tlsgdesc2.s: Likewise.
+	* testsuite/ld-x86-64/tlsdesc3.d: Likewise.
+	* testsuite/ld-x86-64/tlsdesc3.s: Likewise.
+	* testsuite/ld-x86-64/tlsdesc4.d: Likewise.
+	* testsuite/ld-x86-64/tlsdesc4.s: Likewise.
+	* testsuite/ld-x86-64/tlsie5.d: Likewise.
+	* testsuite/ld-x86-64/tlsie5.s: Likewise.
+	* testsuite/ld-x86-64/x86-64.exp: Run tlsie5, tlsdesc3 and
+	tlsdesc4.
+
+(cherry picked from commit:1d68a49ac5d71b648304f69af978fce0f4413800)
+Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141322.html]
+CVE: CVE-2025-1179
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ bfd/elf32-i386.c                  | 118 +++++++++++++-------------
+ bfd/elf64-x86-64.c                | 133 ++++++++++++++++--------------
+ bfd/elfxx-x86.c                   |  85 +++++++++++++++++++
+ bfd/elfxx-x86.h                   |  18 ++++
+ ld/testsuite/ld-i386/i386.exp     |   2 +
+ ld/testsuite/ld-i386/tlsgdesc1.d  |   4 +
+ ld/testsuite/ld-i386/tlsgdesc1.s  |  11 +++
+ ld/testsuite/ld-i386/tlsgdesc2.d  |   4 +
+ ld/testsuite/ld-i386/tlsgdesc2.s  |  11 +++
+ ld/testsuite/ld-i386/tlsie2.d     |   2 +-
+ ld/testsuite/ld-i386/tlsie3.d     |   2 +-
+ ld/testsuite/ld-i386/tlsie4.d     |   2 +-
+ ld/testsuite/ld-i386/tlsie5.d     |   2 +-
+ ld/testsuite/ld-x86-64/tlsdesc3.d |   4 +
+ ld/testsuite/ld-x86-64/tlsdesc3.s |  13 +++
+ ld/testsuite/ld-x86-64/tlsdesc4.d |   4 +
+ ld/testsuite/ld-x86-64/tlsdesc4.s |  13 +++
+ ld/testsuite/ld-x86-64/tlsie2.d   |   2 +-
+ ld/testsuite/ld-x86-64/tlsie3.d   |   2 +-
+ ld/testsuite/ld-x86-64/tlsie5.d   |   4 +
+ ld/testsuite/ld-x86-64/tlsie5.s   |  12 +++
+ ld/testsuite/ld-x86-64/x86-64.exp |   3 +
+ 22 files changed, 319 insertions(+), 132 deletions(-)
+ create mode 100644 ld/testsuite/ld-i386/tlsgdesc1.d
+ create mode 100644 ld/testsuite/ld-i386/tlsgdesc1.s
+ create mode 100644 ld/testsuite/ld-i386/tlsgdesc2.d
+ create mode 100644 ld/testsuite/ld-i386/tlsgdesc2.s
+ create mode 100644 ld/testsuite/ld-x86-64/tlsdesc3.d
+ create mode 100644 ld/testsuite/ld-x86-64/tlsdesc3.s
+ create mode 100644 ld/testsuite/ld-x86-64/tlsdesc4.d
+ create mode 100644 ld/testsuite/ld-x86-64/tlsdesc4.s
+ create mode 100644 ld/testsuite/ld-x86-64/tlsie5.d
+ create mode 100644 ld/testsuite/ld-x86-64/tlsie5.s
+
+diff --git a/bfd/elf32-i386.c b/bfd/elf32-i386.c
+index e2f88a11487..18a28d2491c 100644
+--- a/bfd/elf32-i386.c
++++ b/bfd/elf32-i386.c
+@@ -839,7 +839,7 @@ static const struct elf_x86_non_lazy_plt_layout elf_i386_non_lazy_ibt_plt =
+ /* Return TRUE if the TLS access code sequence support transition
+    from R_TYPE.  */
+ 
+-static bool
++static enum elf_x86_tls_error_type
+ elf_i386_check_tls_transition (asection *sec,
+ 			       bfd_byte *contents,
+ 			       Elf_Internal_Shdr *symtab_hdr,
+@@ -861,7 +861,7 @@ elf_i386_check_tls_transition (asection *sec,
+     case R_386_TLS_GD:
+     case R_386_TLS_LDM:
+       if (offset < 2 || (rel + 1) >= relend)
+-	return false;
++	return elf_x86_tls_error_yes;
+ 
+       indirect_call = false;
+       call = contents + offset + 4;
+@@ -884,19 +884,19 @@ elf_i386_check_tls_transition (asection *sec,
+ 	     can transit to different access model.  */
+ 	  if ((offset + 10) > sec->size
+ 	      || (type != 0x8d && type != 0x04))
+-	    return false;
++	    return elf_x86_tls_error_yes;
+ 
+ 	  if (type == 0x04)
+ 	    {
+ 	      /* leal foo@tlsgd(,%ebx,1), %eax
+ 		 call ___tls_get_addr@PLT  */
+ 	      if (offset < 3)
+-		return false;
++		return elf_x86_tls_error_yes;
+ 
+ 	      if (*(call - 7) != 0x8d
+ 		  || val != 0x1d
+ 		  || call[0] != 0xe8)
+-		return false;
++		return elf_x86_tls_error_yes;
+ 	    }
+ 	  else
+ 	    {
+@@ -914,7 +914,7 @@ elf_i386_check_tls_transition (asection *sec,
+ 		 is used to pass parameter to ___tls_get_addr.  */
+ 	      reg = val & 7;
+ 	      if ((val & 0xf8) != 0x80 || reg == 4 || reg == 0)
+-		return false;
++		return elf_x86_tls_error_yes;
+ 
+ 	      indirect_call = call[0] == 0xff;
+ 	      if (!(reg == 3 && call[0] == 0xe8 && call[5] == 0x90)
+@@ -922,7 +922,7 @@ elf_i386_check_tls_transition (asection *sec,
+ 		  && !(indirect_call
+ 		       && (call[1] & 0xf8) == 0x90
+ 		       && (call[1] & 0x7) == reg))
+-		return false;
++		return elf_x86_tls_error_yes;
+ 	    }
+ 	}
+       else
+@@ -937,13 +937,13 @@ elf_i386_check_tls_transition (asection *sec,
+ 		addr32 call ___tls_get_addr
+ 	     can transit to different access model.  */
+ 	  if (type != 0x8d || (offset + 9) > sec->size)
+-	    return false;
++	    return elf_x86_tls_error_yes;
+ 
+ 	  /* %eax can't be used as the GOT base register since it is
+ 	     used to pass parameter to ___tls_get_addr.  */
+ 	  reg = val & 7;
+ 	  if ((val & 0xf8) != 0x80 || reg == 4 || reg == 0)
+-	    return false;
++	    return elf_x86_tls_error_yes;
+ 
+ 	  indirect_call = call[0] == 0xff;
+ 	  if (!(reg == 3 && call[0] == 0xe8)
+@@ -951,23 +951,27 @@ elf_i386_check_tls_transition (asection *sec,
+ 	      && !(indirect_call
+ 		   && (call[1] & 0xf8) == 0x90
+ 		   && (call[1] & 0x7) == reg))
+-	    return false;
++	    return elf_x86_tls_error_yes;
+ 	}
+ 
+       r_symndx = ELF32_R_SYM (rel[1].r_info);
+       if (r_symndx < symtab_hdr->sh_info)
+-	return false;
++	return elf_x86_tls_error_yes;
+ 
+       h = sym_hashes[r_symndx - symtab_hdr->sh_info];
+       if (h == NULL
+ 	  || !((struct elf_x86_link_hash_entry *) h)->tls_get_addr)
+-	return false;
++	return elf_x86_tls_error_yes;
+       else if (indirect_call)
+-	return (ELF32_R_TYPE (rel[1].r_info) == R_386_GOT32X
+-		|| ELF32_R_TYPE (rel[1].r_info) == R_386_GOT32);
++	return ((ELF32_R_TYPE (rel[1].r_info) == R_386_GOT32X
++		 || ELF32_R_TYPE (rel[1].r_info) == R_386_GOT32)
++		? elf_x86_tls_error_none
++		: elf_x86_tls_error_yes);
+       else
+-	return (ELF32_R_TYPE (rel[1].r_info) == R_386_PC32
+-		|| ELF32_R_TYPE (rel[1].r_info) == R_386_PLT32);
++	return ((ELF32_R_TYPE (rel[1].r_info) == R_386_PC32
++		|| ELF32_R_TYPE (rel[1].r_info) == R_386_PLT32)
++		? elf_x86_tls_error_none
++		: elf_x86_tls_error_yes);
+ 
+     case R_386_TLS_IE:
+       /* Check transition from IE access model:
+@@ -977,20 +981,23 @@ elf_i386_check_tls_transition (asection *sec,
+        */
+ 
+       if (offset < 1 || (offset + 4) > sec->size)
+-	return false;
++	return elf_x86_tls_error_yes;
+ 
+       /* Check "movl foo@tpoff(%rip), %eax" first.  */
+       val = bfd_get_8 (abfd, contents + offset - 1);
+       if (val == 0xa1)
+-	return true;
++	return elf_x86_tls_error_none;
+ 
+       if (offset < 2)
+-	return false;
++	return elf_x86_tls_error_yes;
+ 
+       /* Check movl|addl foo@tpoff(%rip), %reg.   */
+       type = bfd_get_8 (abfd, contents + offset - 2);
+-      return ((type == 0x8b || type == 0x03)
+-	      && (val & 0xc7) == 0x05);
++      if (type != 0x8b && type != 0x03)
++	return elf_x86_tls_error_add_mov;
++      return ((val & 0xc7) == 0x05
++	      ? elf_x86_tls_error_none
++	      : elf_x86_tls_error_yes);
+ 
+     case R_386_TLS_GOTIE:
+     case R_386_TLS_IE_32:
+@@ -1001,14 +1008,16 @@ elf_i386_check_tls_transition (asection *sec,
+        */
+ 
+       if (offset < 2 || (offset + 4) > sec->size)
+-	return false;
++	return elf_x86_tls_error_yes;
+ 
+       val = bfd_get_8 (abfd, contents + offset - 1);
+       if ((val & 0xc0) != 0x80 || (val & 7) == 4)
+-	return false;
++	return elf_x86_tls_error_yes;
+ 
+       type = bfd_get_8 (abfd, contents + offset - 2);
+-      return type == 0x8b || type == 0x2b || type == 0x03;
++      return (type == 0x8b || type == 0x2b || type == 0x03
++	      ? elf_x86_tls_error_none
++	      : elf_x86_tls_error_add_sub_mov);
+ 
+     case R_386_TLS_GOTDESC:
+       /* Check transition from GDesc access model:
+@@ -1019,13 +1028,15 @@ elf_i386_check_tls_transition (asection *sec,
+ 	 going to be eax.  */
+ 
+       if (offset < 2 || (offset + 4) > sec->size)
+-	return false;
++	return elf_x86_tls_error_yes;
+ 
+       if (bfd_get_8 (abfd, contents + offset - 2) != 0x8d)
+-	return false;
++	return elf_x86_tls_error_lea;
+ 
+       val = bfd_get_8 (abfd, contents + offset - 1);
+-      return (val & 0xc7) == 0x83;
++      return ((val & 0xc7) == 0x83
++	      ? elf_x86_tls_error_none
++	      : elf_x86_tls_error_yes);
+ 
+     case R_386_TLS_DESC_CALL:
+       /* Check transition from GDesc access model:
+@@ -1035,10 +1046,12 @@ elf_i386_check_tls_transition (asection *sec,
+ 	{
+ 	  /* Make sure that it's a call *x@tlsdesc(%eax).  */
+ 	  call = contents + offset;
+-	  return call[0] == 0xff && call[1] == 0x10;
++	  return (call[0] == 0xff && call[1] == 0x10
++		  ? elf_x86_tls_error_none
++		  : elf_x86_tls_error_indirect_call);
+ 	}
+ 
+-      return false;
++      return elf_x86_tls_error_yes;
+ 
+     default:
+       abort ();
+@@ -1057,7 +1070,7 @@ elf_i386_tls_transition (struct bfd_link_info *info, bfd *abfd,
+ 			 const Elf_Internal_Rela *rel,
+ 			 const Elf_Internal_Rela *relend,
+ 			 struct elf_link_hash_entry *h,
+-			 unsigned long r_symndx,
++			 Elf_Internal_Sym *sym,
+ 			 bool from_relocate_section)
+ {
+   unsigned int from_type = *r_type;
+@@ -1142,43 +1155,24 @@ elf_i386_tls_transition (struct bfd_link_info *info, bfd *abfd,
+     return true;
+ 
+   /* Check if the transition can be performed.  */
++  enum elf_x86_tls_error_type tls_error;
+   if (check
+-      && ! elf_i386_check_tls_transition (sec, contents,
+-					  symtab_hdr, sym_hashes,
+-					  from_type, rel, relend))
++      && ((tls_error = elf_i386_check_tls_transition (sec, contents,
++						      symtab_hdr,
++						      sym_hashes,
++						      from_type, rel,
++						      relend))
++	  != elf_x86_tls_error_none))
+     {
+       reloc_howto_type *from, *to;
+-      const char *name;
+ 
+       from = elf_i386_rtype_to_howto (from_type);
+       to = elf_i386_rtype_to_howto (to_type);
+ 
+-      if (h)
+-	name = h->root.root.string;
+-      else
+-	{
+-	  struct elf_x86_link_hash_table *htab;
+-
+-	  htab = elf_x86_hash_table (info, I386_ELF_DATA);
+-	  if (htab == NULL)
+-	    name = "*unknown*";
+-	  else
+-	    {
+-	      Elf_Internal_Sym *isym;
+-
+-	      isym = bfd_sym_from_r_symndx (&htab->elf.sym_cache,
+-					    abfd, r_symndx);
+-	      name = bfd_elf_sym_name (abfd, symtab_hdr, isym, NULL);
+-	    }
+-	}
++      _bfd_x86_elf_link_report_tls_transition_error
++	(info, abfd, sec, symtab_hdr, h, sym, rel, from->name,
++	 to->name, tls_error);
+ 
+-      _bfd_error_handler
+-	/* xgettext:c-format */
+-	(_("%pB: TLS transition from %s to %s against `%s'"
+-	   " at %#" PRIx64 " in section `%pA' failed"),
+-	 abfd, from->name, to->name, name,
+-	 (uint64_t) rel->r_offset, sec);
+-      bfd_set_error (bfd_error_bad_value);
+       return false;
+     }
+ 
+@@ -1600,7 +1594,7 @@ elf_i386_scan_relocs (bfd *abfd,
+       if (! elf_i386_tls_transition (info, abfd, sec, contents,
+ 				     symtab_hdr, sym_hashes,
+ 				     &r_type, GOT_UNKNOWN,
+-				     rel, rel_end, h, r_symndx, false))
++				     rel, rel_end, h, isym, false))
+ 	goto error_return;
+ 
+       /* Check if _GLOBAL_OFFSET_TABLE_ is referenced.  */
+@@ -2875,7 +2869,7 @@ elf_i386_relocate_section (bfd *output_bfd,
+ 					 input_section, contents,
+ 					 symtab_hdr, sym_hashes,
+ 					 &r_type_tls, tls_type, rel,
+-					 relend, h, r_symndx, true))
++					 relend, h, sym, true))
+ 	    return false;
+ 
+ 	  expected_tls_le = htab->elf.target_os == is_solaris
+@@ -3365,7 +3359,7 @@ elf_i386_relocate_section (bfd *output_bfd,
+ 					 input_section, contents,
+ 					 symtab_hdr, sym_hashes,
+ 					 &r_type, GOT_UNKNOWN, rel,
+-					 relend, h, r_symndx, true))
++					 relend, h, sym, true))
+ 	    return false;
+ 
+ 	  if (r_type != R_386_TLS_LDM)
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index 2ed120af780..f116e423f61 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -1120,7 +1120,7 @@ elf32_x86_64_elf_object_p (bfd *abfd)
+ /* Return TRUE if the TLS access code sequence support transition
+    from R_TYPE.  */
+ 
+-static bool
++static enum elf_x86_tls_error_type
+ elf_x86_64_check_tls_transition (bfd *abfd,
+ 				 struct bfd_link_info *info,
+ 				 asection *sec,
+@@ -1147,7 +1147,7 @@ elf_x86_64_check_tls_transition (bfd *abfd,
+     case R_X86_64_TLSGD:
+     case R_X86_64_TLSLD:
+       if ((rel + 1) >= relend)
+-	return false;
++	return elf_x86_tls_error_yes;
+ 
+       if (r_type == R_X86_64_TLSGD)
+ 	{
+@@ -1184,7 +1184,7 @@ elf_x86_64_check_tls_transition (bfd *abfd,
+ 	  static const unsigned char leaq[] = { 0x66, 0x48, 0x8d, 0x3d };
+ 
+ 	  if ((offset + 12) > sec->size)
+-	    return false;
++	    return elf_x86_tls_error_yes;
+ 
+ 	  call = contents + offset + 4;
+ 	  if (call[0] != 0x66
+@@ -1208,20 +1208,20 @@ elf_x86_64_check_tls_transition (bfd *abfd,
+ 		  || call[14] != 0xd0
+ 		  || !((call[10] == 0x48 && call[12] == 0xd8)
+ 		       || (call[10] == 0x4c && call[12] == 0xf8)))
+-		return false;
++		return elf_x86_tls_error_yes;
+ 	      largepic = true;
+ 	    }
+ 	  else if (ABI_64_P (abfd))
+ 	    {
+ 	      if (offset < 4
+ 		  || memcmp (contents + offset - 4, leaq, 4) != 0)
+-		return false;
++		return elf_x86_tls_error_yes;
+ 	    }
+ 	  else
+ 	    {
+ 	      if (offset < 3
+ 		  || memcmp (contents + offset - 3, leaq + 1, 3) != 0)
+-		return false;
++		return elf_x86_tls_error_yes;
+ 	    }
+ 	  indirect_call = call[2] == 0xff;
+ 	}
+@@ -1250,10 +1250,10 @@ elf_x86_64_check_tls_transition (bfd *abfd,
+ 	  static const unsigned char lea[] = { 0x48, 0x8d, 0x3d };
+ 
+ 	  if (offset < 3 || (offset + 9) > sec->size)
+-	    return false;
++	    return elf_x86_tls_error_yes;
+ 
+ 	  if (memcmp (contents + offset - 3, lea, 3) != 0)
+-	    return false;
++	    return elf_x86_tls_error_yes;
+ 
+ 	  call = contents + offset + 4;
+ 	  if (!(call[0] == 0xe8
+@@ -1268,7 +1268,7 @@ elf_x86_64_check_tls_transition (bfd *abfd,
+ 		  || call[14] != 0xd0
+ 		  || !((call[10] == 0x48 && call[12] == 0xd8)
+ 		       || (call[10] == 0x4c && call[12] == 0xf8)))
+-		return false;
++		return elf_x86_tls_error_yes;
+ 	      largepic = true;
+ 	    }
+ 	  indirect_call = call[0] == 0xff;
+@@ -1276,22 +1276,30 @@ elf_x86_64_check_tls_transition (bfd *abfd,
+ 
+       r_symndx = htab->r_sym (rel[1].r_info);
+       if (r_symndx < symtab_hdr->sh_info)
+-	return false;
++	return elf_x86_tls_error_yes;
+ 
+       h = sym_hashes[r_symndx - symtab_hdr->sh_info];
+       if (h == NULL
+ 	  || !((struct elf_x86_link_hash_entry *) h)->tls_get_addr)
+-	return false;
++	return elf_x86_tls_error_yes;
+       else
+ 	{
+ 	  r_type = (ELF32_R_TYPE (rel[1].r_info)
+ 		    & ~R_X86_64_converted_reloc_bit);
+ 	  if (largepic)
+-	    return r_type == R_X86_64_PLTOFF64;
++	    return (r_type == R_X86_64_PLTOFF64
++		    ? elf_x86_tls_error_none
++		    : elf_x86_tls_error_yes);
+ 	  else if (indirect_call)
+-	    return (r_type == R_X86_64_GOTPCRELX || r_type == R_X86_64_GOTPCREL);
++	    return ((r_type == R_X86_64_GOTPCRELX
++		     || r_type == R_X86_64_GOTPCREL)
++		    ? elf_x86_tls_error_none
++		    : elf_x86_tls_error_yes);
+ 	  else
+-	    return (r_type == R_X86_64_PC32 || r_type == R_X86_64_PLT32);
++	    return ((r_type == R_X86_64_PC32
++		     || r_type == R_X86_64_PLT32)
++		    ? elf_x86_tls_error_none
++		    : elf_x86_tls_error_yes);
+ 	}
+ 
+     case R_X86_64_CODE_4_GOTTPOFF:
+@@ -1303,7 +1311,7 @@ elf_x86_64_check_tls_transition (bfd *abfd,
+       if (offset < 4
+ 	  || (offset + 4) > sec->size
+ 	  || contents[offset - 4] != 0xd5)
+-	return false;
++	return elf_x86_tls_error_yes;
+ 
+       goto check_gottpoff;
+ 
+@@ -1315,14 +1323,16 @@ elf_x86_64_check_tls_transition (bfd *abfd,
+       if (offset < 6
+ 	  || (offset + 4) > sec->size
+ 	  || contents[offset - 6] != 0x62)
+-	return false;
++	return elf_x86_tls_error_yes;
+ 
+       val = bfd_get_8 (abfd, contents + offset - 2);
+       if (val != 0x01 && val != 0x03)
+-	return false;
++	return elf_x86_tls_error_add;
+ 
+       val = bfd_get_8 (abfd, contents + offset - 1);
+-      return (val & 0xc7) == 5;
++      return ((val & 0xc7) == 5
++	      ? elf_x86_tls_error_none
++	      : elf_x86_tls_error_yes);
+ 
+     case R_X86_64_GOTTPOFF:
+       /* Check transition from IE access model:
+@@ -1338,25 +1348,27 @@ elf_x86_64_check_tls_transition (bfd *abfd,
+ 	    {
+ 	      /* X32 may have 0x44 REX prefix or no REX prefix.  */
+ 	      if (ABI_64_P (abfd))
+-		return false;
++		return elf_x86_tls_error_yes;
+ 	    }
+ 	}
+       else
+ 	{
+ 	  /* X32 may not have any REX prefix.  */
+ 	  if (ABI_64_P (abfd))
+-	    return false;
++	    return elf_x86_tls_error_yes;
+ 	  if (offset < 2 || (offset + 3) > sec->size)
+-	    return false;
++	    return elf_x86_tls_error_yes;
+ 	}
+ 
+  check_gottpoff:
+       val = bfd_get_8 (abfd, contents + offset - 2);
+       if (val != 0x8b && val != 0x03)
+-	return false;
++	return elf_x86_tls_error_add_mov;
+ 
+       val = bfd_get_8 (abfd, contents + offset - 1);
+-      return (val & 0xc7) == 5;
++      return ((val & 0xc7) == 5
++	      ? elf_x86_tls_error_none
++	      : elf_x86_tls_error_yes);
+ 
+     case R_X86_64_CODE_4_GOTPC32_TLSDESC:
+       /* Check transition from GDesc access model:
+@@ -1366,7 +1378,7 @@ elf_x86_64_check_tls_transition (bfd *abfd,
+       if (offset < 4
+ 	  || (offset + 4) > sec->size
+ 	  || contents[offset - 4] != 0xd5)
+-	return false;
++	return elf_x86_tls_error_yes;
+ 
+       goto check_tlsdesc;
+ 
+@@ -1380,19 +1392,21 @@ elf_x86_64_check_tls_transition (bfd *abfd,
+ 	 going to be rax.  */
+ 
+       if (offset < 3 || (offset + 4) > sec->size)
+-	return false;
++	return elf_x86_tls_error_yes;
+ 
+       val = bfd_get_8 (abfd, contents + offset - 3);
+       val &= 0xfb;
+       if (val != 0x48 && (ABI_64_P (abfd) || val != 0x40))
+-	return false;
++	return elf_x86_tls_error_yes;
+ 
+  check_tlsdesc:
+       if (bfd_get_8 (abfd, contents + offset - 2) != 0x8d)
+-	return false;
++	return elf_x86_tls_error_lea;
+ 
+       val = bfd_get_8 (abfd, contents + offset - 1);
+-      return (val & 0xc7) == 0x05;
++      return ((val & 0xc7) == 0x05
++	      ? elf_x86_tls_error_none
++	      : elf_x86_tls_error_yes);
+ 
+     case R_X86_64_TLSDESC_CALL:
+       /* Check transition from GDesc access model:
+@@ -1411,14 +1425,16 @@ elf_x86_64_check_tls_transition (bfd *abfd,
+ 		{
+ 		  prefix = 1;
+ 		  if (offset + 3 > sec->size)
+-		    return false;
++		    return elf_x86_tls_error_yes;
+ 		}
+ 	    }
+ 	  /* Make sure that it's a call *x@tlsdesc(%rax).  */
+-	  return call[prefix] == 0xff && call[1 + prefix] == 0x10;
++	  return (call[prefix] == 0xff && call[1 + prefix] == 0x10
++		  ? elf_x86_tls_error_none
++		  : elf_x86_tls_error_indirect_call);
+ 	}
+ 
+-      return false;
++      return elf_x86_tls_error_yes;
+ 
+     default:
+       abort ();
+@@ -1437,7 +1453,7 @@ elf_x86_64_tls_transition (struct bfd_link_info *info, bfd *abfd,
+ 			   const Elf_Internal_Rela *rel,
+ 			   const Elf_Internal_Rela *relend,
+ 			   struct elf_link_hash_entry *h,
+-			   unsigned long r_symndx,
++			   Elf_Internal_Sym *sym,
+ 			   bool from_relocate_section)
+ {
+   unsigned int from_type = *r_type;
+@@ -1488,7 +1504,12 @@ elf_x86_64_tls_transition (struct bfd_link_info *info, bfd *abfd,
+ 	  /* We checked the transition before when we were called from
+ 	     elf_x86_64_scan_relocs.  We only want to check the new
+ 	     transition which hasn't been checked before.  */
+-	  check = new_to_type != to_type && from_type == to_type;
++	  check = (new_to_type != to_type
++		   && (from_type == to_type
++		       || (from_type == R_X86_64_CODE_4_GOTTPOFF
++			   && to_type == R_X86_64_GOTTPOFF)
++		       || (from_type == R_X86_64_CODE_6_GOTTPOFF
++			   && to_type == R_X86_64_GOTTPOFF)));
+ 	  to_type = new_to_type;
+ 	}
+ 
+@@ -1512,13 +1533,18 @@ elf_x86_64_tls_transition (struct bfd_link_info *info, bfd *abfd,
+     return true;
+ 
+   /* Check if the transition can be performed.  */
++  enum elf_x86_tls_error_type tls_error;
+   if (check
+-      && ! elf_x86_64_check_tls_transition (abfd, info, sec, contents,
+-					    symtab_hdr, sym_hashes,
+-					    from_type, rel, relend))
++      && ((tls_error = elf_x86_64_check_tls_transition (abfd, info, sec,
++							contents,
++							symtab_hdr,
++							sym_hashes,
++							from_type, rel,
++							relend))
++	  != elf_x86_tls_error_none))
++
+     {
+       reloc_howto_type *from, *to;
+-      const char *name;
+ 
+       from = elf_x86_64_rtype_to_howto (abfd, from_type);
+       to = elf_x86_64_rtype_to_howto (abfd, to_type);
+@@ -1526,31 +1552,10 @@ elf_x86_64_tls_transition (struct bfd_link_info *info, bfd *abfd,
+       if (from == NULL || to == NULL)
+ 	return false;
+ 
+-      if (h)
+-	name = h->root.root.string;
+-      else
+-	{
+-	  struct elf_x86_link_hash_table *htab;
+-
+-	  htab = elf_x86_hash_table (info, X86_64_ELF_DATA);
+-	  if (htab == NULL)
+-	    name = "*unknown*";
+-	  else
+-	    {
+-	      Elf_Internal_Sym *isym;
++      _bfd_x86_elf_link_report_tls_transition_error
++	(info, abfd, sec, symtab_hdr, h, sym, rel, from->name,
++	 to->name, tls_error);
+ 
+-	      isym = bfd_sym_from_r_symndx (&htab->elf.sym_cache,
+-					    abfd, r_symndx);
+-	      name = bfd_elf_sym_name (abfd, symtab_hdr, isym, NULL);
+-	    }
+-	}
+-
+-      _bfd_error_handler
+-	/* xgettext:c-format */
+-	(_("%pB: TLS transition from %s to %s against `%s' at %#" PRIx64
+-	   " in section `%pA' failed"),
+-	 abfd, from->name, to->name, name, (uint64_t) rel->r_offset, sec);
+-      bfd_set_error (bfd_error_bad_value);
+       return false;
+     }
+ 
+@@ -2198,7 +2203,7 @@ elf_x86_64_scan_relocs (bfd *abfd, struct bfd_link_info *info,
+       if (! elf_x86_64_tls_transition (info, abfd, sec, contents,
+ 				       symtab_hdr, sym_hashes,
+ 				       &r_type, GOT_UNKNOWN,
+-				       rel, rel_end, h, r_symndx, false))
++				       rel, rel_end, h, isym, false))
+ 	goto error_return;
+ 
+       /* Check if _GLOBAL_OFFSET_TABLE_ is referenced.  */
+@@ -3648,7 +3653,7 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+ 					   input_section, contents,
+ 					   symtab_hdr, sym_hashes,
+ 					   &r_type_tls, tls_type, rel,
+-					   relend, h, r_symndx, true))
++					   relend, h, sym, true))
+ 	    return false;
+ 
+ 	  if (r_type_tls == R_X86_64_TPOFF32)
+@@ -4308,7 +4313,7 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+ 					   input_section, contents,
+ 					   symtab_hdr, sym_hashes,
+ 					   &r_type, GOT_UNKNOWN, rel,
+-					   relend, h, r_symndx, true))
++					   relend, h, sym, true))
+ 	    return false;
+ 
+ 	  if (r_type != R_X86_64_TLSLD)
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index 508fd771da3..b17dad759c8 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -3202,6 +3202,91 @@ _bfd_x86_elf_link_report_relative_reloc
+        asect, abfd);
+ }
+ 
++/* Report TLS transition error.  */
++
++void
++_bfd_x86_elf_link_report_tls_transition_error
++  (struct bfd_link_info *info, bfd *abfd, asection *asect,
++   Elf_Internal_Shdr *symtab_hdr, struct elf_link_hash_entry *h,
++   Elf_Internal_Sym *sym, const Elf_Internal_Rela *rel,
++   const char *from_reloc_name, const char *to_reloc_name,
++   enum elf_x86_tls_error_type tls_error)
++{
++  const char *name;
++
++  if (h)
++    name = h->root.root.string;
++  else
++    {
++      const struct elf_backend_data *bed
++       = get_elf_backend_data (abfd);
++      struct elf_x86_link_hash_table *htab
++       = elf_x86_hash_table (info, bed->target_id);
++      if (htab == NULL)
++       name = "*unknown*";
++      else
++       name = bfd_elf_sym_name (abfd, symtab_hdr, sym, NULL);
++    }
++
++  switch (tls_error)
++    {
++    case elf_x86_tls_error_yes:
++      info->callbacks->einfo
++       /* xgettext:c-format */
++       (_("%pB: TLS transition from %s to %s against `%s' at 0x%v in "
++          "section `%pA' failed"),
++        abfd, from_reloc_name, to_reloc_name, name, rel->r_offset,
++        asect);
++      break;
++
++    case elf_x86_tls_error_add:
++      info->callbacks->einfo
++       /* xgettext:c-format */
++       (_("%pB(%pA+0x%v): relocation %s against `%s' must be used "
++          "in ADD only"),
++        abfd, asect, rel->r_offset, from_reloc_name, name);
++      break;
++
++    case elf_x86_tls_error_add_mov:
++      info->callbacks->einfo
++       /* xgettext:c-format */
++       (_("%pB(%pA+0x%v): relocation %s against `%s' must be used "
++          "in ADD or MOV only"),
++        abfd, asect, rel->r_offset, from_reloc_name, name);
++      break;
++
++    case elf_x86_tls_error_add_sub_mov:
++      info->callbacks->einfo
++       /* xgettext:c-format */
++       (_("%pB(%pA+0x%v): relocation %s against `%s' must be used "
++          "in ADD, SUB or MOV only"),
++        abfd, asect, rel->r_offset, from_reloc_name, name);
++      break;
++
++    case elf_x86_tls_error_indirect_call:
++      info->callbacks->einfo
++       /* xgettext:c-format */
++       (_("%pB(%pA+0x%v): relocation %s against `%s' must be used "
++          "in indirect CALL only"),
++        abfd, asect, rel->r_offset, from_reloc_name, name);
++      break;
++
++    case elf_x86_tls_error_lea:
++      info->callbacks->einfo
++       /* xgettext:c-format */
++       (_("%pB(%pA+0x%v): relocation %s against `%s' must be used "
++          "in LEA only"),
++        abfd, asect, rel->r_offset, from_reloc_name, name);
++      break;
++
++    default:
++      abort ();
++      break;
++    }
++
++  bfd_set_error (bfd_error_bad_value);
++}
++
+ /* Return TRUE if symbol should be hashed in the `.gnu.hash' section.  */
+ 
+ bool
+diff --git a/bfd/elfxx-x86.h b/bfd/elfxx-x86.h
+index 110bcb9ad71..02e2efa6c56 100644
+--- a/bfd/elfxx-x86.h
++++ b/bfd/elfxx-x86.h
+@@ -767,6 +767,18 @@ struct elf_x86_plt
+   long count;
+ };
+ 
++enum elf_x86_tls_error_type
++{
++  elf_x86_tls_error_none,
++  elf_x86_tls_error_add,
++  elf_x86_tls_error_add_mov,
++  elf_x86_tls_error_add_sub_mov,
++  elf_x86_tls_error_indirect_call,
++  elf_x86_tls_error_lea,
++  elf_x86_tls_error_yes
++};
++
++
+ /* Set if a relocation is converted from a GOTPCREL relocation.  */
+ #define R_X86_64_converted_reloc_bit (1 << 7)
+ 
+@@ -908,6 +920,12 @@ extern void _bfd_x86_elf_link_fixup_ifunc_symbol
+ extern void _bfd_x86_elf_link_report_relative_reloc
+   (struct bfd_link_info *, asection *, struct elf_link_hash_entry *,
+    Elf_Internal_Sym *, const char *, const void *);
++extern void _bfd_x86_elf_link_report_tls_transition_error
++  (struct bfd_link_info *, bfd *, asection *, Elf_Internal_Shdr *,
++   struct elf_link_hash_entry *, Elf_Internal_Sym *,
++   const Elf_Internal_Rela *, const char *, const char *,
++   enum elf_x86_tls_error_type);
++
+ 
+ #define bfd_elf64_mkobject \
+   _bfd_x86_elf_mkobject
+diff --git a/ld/testsuite/ld-i386/i386.exp b/ld/testsuite/ld-i386/i386.exp
+index 18d1c9198ca..a8db2c713f3 100644
+--- a/ld/testsuite/ld-i386/i386.exp
++++ b/ld/testsuite/ld-i386/i386.exp
+@@ -541,6 +541,8 @@ run_dump_test "tlsdesc2"
+ run_dump_test "report-reloc-1"
+ run_dump_test "pr27998a"
+ run_dump_test "pr27998b"
++run_dump_test "tlsgdesc1"
++run_dump_test "tlsgdesc2"
+ 
+ proc undefined_weak {cflags ldflags} {
+     set testname "Undefined weak symbol"
+diff --git a/ld/testsuite/ld-i386/tlsgdesc1.d b/ld/testsuite/ld-i386/tlsgdesc1.d
+new file mode 100644
+index 00000000000..2a70e81c444
+--- /dev/null
++++ b/ld/testsuite/ld-i386/tlsgdesc1.d
+@@ -0,0 +1,4 @@
++#name: TLS GDesc->LE transition check (LEA)
++#as: --32
++#ld: -melf_i386
++#error: .*: relocation R_386_TLS_GOTDESC against `foo' must be used in LEA only
+diff --git a/ld/testsuite/ld-i386/tlsgdesc1.s b/ld/testsuite/ld-i386/tlsgdesc1.s
+new file mode 100644
+index 00000000000..c30f7523462
+--- /dev/null
++++ b/ld/testsuite/ld-i386/tlsgdesc1.s
+@@ -0,0 +1,11 @@
++	.text
++	.globl _start
++_start:
++	movl	foo@tlsdesc(%ebx), %eax
++	call	*foo@tlscall(%eax)
++	.section	.tdata,"awT",@progbits
++	.align 4
++	.type	foo, @object
++	.size	foo, 4
++foo:
++	.long	100
+diff --git a/ld/testsuite/ld-i386/tlsgdesc2.d b/ld/testsuite/ld-i386/tlsgdesc2.d
+new file mode 100644
+index 00000000000..2e6a66d372c
+--- /dev/null
++++ b/ld/testsuite/ld-i386/tlsgdesc2.d
+@@ -0,0 +1,4 @@
++#name: TLS GDesc->LE transition check (indirect CALL)
++#as: --32
++#ld: -melf_i386
++#error: .*: relocation R_386_TLS_DESC_CALL against `foo' must be used in indirect CALL only
+diff --git a/ld/testsuite/ld-i386/tlsgdesc2.s b/ld/testsuite/ld-i386/tlsgdesc2.s
+new file mode 100644
+index 00000000000..7d9d556e2ab
+--- /dev/null
++++ b/ld/testsuite/ld-i386/tlsgdesc2.s
+@@ -0,0 +1,11 @@
++	.text
++	.globl _start
++_start:
++	leal	foo@tlsdesc(%ebx), %eax
++	jmp	*foo@tlscall(%eax)
++	.section	.tdata,"awT",@progbits
++	.align 4
++	.type	foo, @object
++	.size	foo, 4
++foo:
++	.long	100
+diff --git a/ld/testsuite/ld-i386/tlsie2.d b/ld/testsuite/ld-i386/tlsie2.d
+index ebb85fde7e7..9f9e63029d6 100644
+--- a/ld/testsuite/ld-i386/tlsie2.d
++++ b/ld/testsuite/ld-i386/tlsie2.d
+@@ -1,4 +1,4 @@
+ #name: TLS IE->LE transition check (R_386_TLS_GOTIE with %eax)
+ #as: --32
+ #ld: -melf_i386
+-#error: .*TLS transition from R_386_TLS_GOTIE to R_386_TLS_LE_32 against `foo'.*failed.*
++#error: .*: relocation R_386_TLS_GOTIE against `foo' must be used in ADD, SUB or MOV only
+diff --git a/ld/testsuite/ld-i386/tlsie3.d b/ld/testsuite/ld-i386/tlsie3.d
+index d993f303c25..506f1a02605 100644
+--- a/ld/testsuite/ld-i386/tlsie3.d
++++ b/ld/testsuite/ld-i386/tlsie3.d
+@@ -1,4 +1,4 @@
+ #name: TLS IE->LE transition check (R_386_TLS_GOTIE)
+ #as: --32
+ #ld: -melf_i386
+-#error: .*TLS transition from R_386_TLS_GOTIE to R_386_TLS_LE_32 against `foo'.*failed.*
++#error: .*: relocation R_386_TLS_GOTIE against `foo' must be used in ADD, SUB or MOV only
+diff --git a/ld/testsuite/ld-i386/tlsie4.d b/ld/testsuite/ld-i386/tlsie4.d
+index 3ca8fddf5dd..a516d002660 100644
+--- a/ld/testsuite/ld-i386/tlsie4.d
++++ b/ld/testsuite/ld-i386/tlsie4.d
+@@ -1,4 +1,4 @@
+ #name: TLS IE->LE transition check (R_386_TLS_IE with %eax)
+ #as: --32
+ #ld: -melf_i386
+-#error: .*TLS transition from R_386_TLS_IE to R_386_TLS_LE_32 against `foo'.*failed.*
++#error: .*: relocation R_386_TLS_IE against `foo' must be used in ADD or MOV only
+diff --git a/ld/testsuite/ld-i386/tlsie5.d b/ld/testsuite/ld-i386/tlsie5.d
+index 3febeb159a9..d3447182e19 100644
+--- a/ld/testsuite/ld-i386/tlsie5.d
++++ b/ld/testsuite/ld-i386/tlsie5.d
+@@ -1,4 +1,4 @@
+ #name: TLS IE->LE transition check (R_386_TLS_IE)
+ #as: --32
+ #ld: -melf_i386
+-#error: .*TLS transition from R_386_TLS_IE to R_386_TLS_LE_32 against `foo'.*failed.*
++#error: .*: relocation R_386_TLS_IE against `foo' must be used in ADD or MOV only
+diff --git a/ld/testsuite/ld-x86-64/tlsdesc3.d b/ld/testsuite/ld-x86-64/tlsdesc3.d
+new file mode 100644
+index 00000000000..bbf22ebeafe
+--- /dev/null
++++ b/ld/testsuite/ld-x86-64/tlsdesc3.d
+@@ -0,0 +1,4 @@
++#name: TLS GDesc->LE transition check (LEA)
++#as: --64
++#ld: -melf_x86_64
++#error: .*: relocation R_X86_64_GOTPC32_TLSDESC against `foo' must be used in LEA only
+diff --git a/ld/testsuite/ld-x86-64/tlsdesc3.s b/ld/testsuite/ld-x86-64/tlsdesc3.s
+new file mode 100644
+index 00000000000..45310654ffc
+--- /dev/null
++++ b/ld/testsuite/ld-x86-64/tlsdesc3.s
+@@ -0,0 +1,13 @@
++	.text
++	.globl	_start
++	.type	_start,@function
++_start:
++	movq	foo@tlsdesc(%rip), %rax
++	call	*foo@tlscall(%rax)
++	.globl foo
++	.section	.tdata,"awT",@progbits
++	.align 8
++	.type	foo, @object
++	.size	foo, 8
++foo:
++	.quad	100
+diff --git a/ld/testsuite/ld-x86-64/tlsdesc4.d b/ld/testsuite/ld-x86-64/tlsdesc4.d
+new file mode 100644
+index 00000000000..b50115c7178
+--- /dev/null
++++ b/ld/testsuite/ld-x86-64/tlsdesc4.d
+@@ -0,0 +1,4 @@
++#name: TLS GDesc->LE transition check (indirect CALL)
++#as: --64
++#ld: -melf_x86_64
++#error: .*: relocation R_X86_64_TLSDESC_CALL against `foo' must be used in indirect CALL only
+diff --git a/ld/testsuite/ld-x86-64/tlsdesc4.s b/ld/testsuite/ld-x86-64/tlsdesc4.s
+new file mode 100644
+index 00000000000..b3d6c12d4fc
+--- /dev/null
++++ b/ld/testsuite/ld-x86-64/tlsdesc4.s
+@@ -0,0 +1,13 @@
++	.text
++	.globl	_start
++	.type	_start,@function
++_start:
++	leaq	foo@tlsdesc(%rip), %rax
++	jmp	*foo@tlscall(%rax)
++	.globl foo
++	.section	.tdata,"awT",@progbits
++	.align 8
++	.type	foo, @object
++	.size	foo, 8
++foo:
++	.quad	100
+diff --git a/ld/testsuite/ld-x86-64/tlsie2.d b/ld/testsuite/ld-x86-64/tlsie2.d
+index 97dcc288a3d..bf8a8198b5b 100644
+--- a/ld/testsuite/ld-x86-64/tlsie2.d
++++ b/ld/testsuite/ld-x86-64/tlsie2.d
+@@ -1,4 +1,4 @@
+ #name: TLS IE->LE transition check
+ #as: --64
+ #ld: -melf_x86_64
+-#error: .*TLS transition from R_X86_64_GOTTPOFF to R_X86_64_TPOFF32 against `foo'.*failed.*
++#error: .*: relocation R_X86_64_GOTTPOFF against `foo' must be used in ADD or MOV only
+diff --git a/ld/testsuite/ld-x86-64/tlsie3.d b/ld/testsuite/ld-x86-64/tlsie3.d
+index 8c982a69838..49d8464fbaf 100644
+--- a/ld/testsuite/ld-x86-64/tlsie3.d
++++ b/ld/testsuite/ld-x86-64/tlsie3.d
+@@ -1,4 +1,4 @@
+ #name: TLS IE->LE transition check (%r12)
+ #as: --64
+ #ld: -melf_x86_64
+-#error: .*TLS transition from R_X86_64_GOTTPOFF to R_X86_64_TPOFF32 against `foo'.*failed.*
++#error: .*: relocation R_X86_64_GOTTPOFF against `foo' must be used in ADD or MOV only
+diff --git a/ld/testsuite/ld-x86-64/tlsie5.d b/ld/testsuite/ld-x86-64/tlsie5.d
+new file mode 100644
+index 00000000000..29de1cebf8e
+--- /dev/null
++++ b/ld/testsuite/ld-x86-64/tlsie5.d
+@@ -0,0 +1,4 @@
++#name: TLS IE->LE transition check (APX)
++#as: --64
++#ld: -melf_x86_64
++#error: .*: relocation R_X86_64_CODE_6_GOTTPOFF against `foo' must be used in ADD only
+diff --git a/ld/testsuite/ld-x86-64/tlsie5.s b/ld/testsuite/ld-x86-64/tlsie5.s
+new file mode 100644
+index 00000000000..c39e46fd97b
+--- /dev/null
++++ b/ld/testsuite/ld-x86-64/tlsie5.s
+@@ -0,0 +1,12 @@
++	.text
++	.globl _start
++_start:
++	xorq	%rax, foo@GOTTPOFF(%rip), %rax
++	movq	(%rax), %rax
++	.globl	foo
++	.section	.tdata,"awT",@progbits
++	.align 4
++	.type	foo, @object
++	.size	foo, 4
++foo:
++	.long	100
+diff --git a/ld/testsuite/ld-x86-64/x86-64.exp b/ld/testsuite/ld-x86-64/x86-64.exp
+index 2a40f0b095b..811813466f8 100644
+--- a/ld/testsuite/ld-x86-64/x86-64.exp
++++ b/ld/testsuite/ld-x86-64/x86-64.exp
+@@ -741,6 +741,9 @@ run_dump_test "pr27016b"
+ run_dump_test "report-reloc-1"
+ run_dump_test "report-reloc-1-x32"
+ run_dump_test "pr29820"
++run_dump_test "tlsie5"
++run_dump_test "tlsdesc3"
++run_dump_test "tlsdesc4"
+ 
+ proc undefined_weak {cflags ldflags} {
+     set testname "Undefined weak symbol"
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1179.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1179.patch
new file mode 100644
index 0000000000..89312d8501
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1179.patch
@@ -0,0 +1,269 @@
+From 67e30b15212adc1502b898a1ca224fdf65dc110d Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Thu, 29 Aug 2024 08:47:00 -0700
+Subject: [PATCH] x86: Check invalid TLS descriptor call TLS descriptor
+ call,
+
+call *x@tlsdesc(%rax)
+
+or
+
+call *x@tlsdesc(%eax)
+
+calls _dl_tlsdesc_return which expects that RAX/EAX points to the TLS
+descriptor.  Update x86 linker to issue an error with or without TLS
+transition.
+
+bfd/
+
+	PR ld/32123
+	* elf32-i386.c (elf_i386_check_tls_transition): Move
+	R_386_TLS_DESC_CALL to ...
+	(elf_i386_tls_transition): Here.
+	* elf64-x86-64.c (elf_x86_64_check_tls_transition): Move.
+	R_X86_64_TLSDESC_CALL check to ...
+	(elf_x86_64_tls_transition): Here.
+
+ld/
+
+	PR ld/32123
+	* testsuite/ld-i386/i386.exp: Run tlsgdesc3.
+	* testsuite/ld-i386/tlsgdesc3.d: New file.
+	* testsuite/ld-x86-64/tlsdesc5.d: Likewise.
+	* testsuite/ld-x86-64/x86-64.exp: Run tlsdesc5.
+
+(cherry picked from commit:67e30b15212adc1502b898a1ca224fdf65dc110d)
+Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141321.html]
+CVE: CVE-2025-1179
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ bfd/elf32-i386.c                  | 44 +++++++++++++------
+ bfd/elf64-x86-64.c                | 71 +++++++++++++++++++------------
+ ld/testsuite/ld-i386/i386.exp     |  1 +
+ ld/testsuite/ld-i386/tlsgdesc3.d  |  5 +++
+ ld/testsuite/ld-x86-64/tlsdesc5.d |  5 +++
+ ld/testsuite/ld-x86-64/x86-64.exp |  1 +
+ 6 files changed, 86 insertions(+), 41 deletions(-)
+ create mode 100644 ld/testsuite/ld-i386/tlsgdesc3.d
+ create mode 100644 ld/testsuite/ld-x86-64/tlsdesc5.d
+
+diff --git a/bfd/elf32-i386.c b/bfd/elf32-i386.c
+index 18a28d2491c..9dea465f721 100644
+--- a/bfd/elf32-i386.c
++++ b/bfd/elf32-i386.c
+@@ -1039,19 +1039,8 @@ elf_i386_check_tls_transition (asection *sec,
+ 	      : elf_x86_tls_error_yes);
+ 
+     case R_386_TLS_DESC_CALL:
+-      /* Check transition from GDesc access model:
+-		call *x@tlsdesc(%eax)
+-       */
+-      if (offset + 2 <= sec->size)
+-	{
+-	  /* Make sure that it's a call *x@tlsdesc(%eax).  */
+-	  call = contents + offset;
+-	  return (call[0] == 0xff && call[1] == 0x10
+-		  ? elf_x86_tls_error_none
+-		  : elf_x86_tls_error_indirect_call);
+-	}
+-
+-      return elf_x86_tls_error_yes;
++      /* It has been checked in elf_i386_tls_transition.  */
++      return elf_x86_tls_error_none;
+ 
+     default:
+       abort ();
+@@ -1077,6 +1066,8 @@ elf_i386_tls_transition (struct bfd_link_info *info, bfd *abfd,
+   unsigned int to_type = from_type;
+   bool check = true;
+   unsigned int to_le_type, to_ie_type;
++  bfd_vma offset;
++  bfd_byte *call;
+ 
+   /* Skip TLS transition for functions.  */
+   if (h != NULL
+@@ -1098,9 +1089,34 @@ elf_i386_tls_transition (struct bfd_link_info *info, bfd *abfd,
+ 
+   switch (from_type)
+     {
++    case R_386_TLS_DESC_CALL:
++      /* Check valid GDesc call:
++		call *x@tlsdesc(%eax)
++       */
++      offset = rel->r_offset;
++      call = NULL;
++      if (offset + 2 <= sec->size)
++	{
++	  /* Make sure that it's a call *x@tlsdesc(%eax).  */
++	  call = contents + offset;
++	  if (call[0] != 0xff || call[1] != 0x10)
++	    call = NULL;
++	}
++
++      if (call == NULL)
++	{
++	  _bfd_x86_elf_link_report_tls_transition_error
++	    (info, abfd, sec, symtab_hdr, h, sym, rel,
++	     "R_386_TLS_DESC_CALL", NULL,
++	     elf_x86_tls_error_indirect_call);
++
++	  return false;
++	}
++
++      /* Fall through.  */
++
+     case R_386_TLS_GD:
+     case R_386_TLS_GOTDESC:
+-    case R_386_TLS_DESC_CALL:
+     case R_386_TLS_IE_32:
+     case R_386_TLS_IE:
+     case R_386_TLS_GOTIE:
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index f116e423f61..7af2e607b02 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -1409,32 +1409,8 @@ elf_x86_64_check_tls_transition (bfd *abfd,
+ 	      : elf_x86_tls_error_yes);
+ 
+     case R_X86_64_TLSDESC_CALL:
+-      /* Check transition from GDesc access model:
+-		call *x@tlsdesc(%rax) <--- LP64 mode.
+-		call *x@tlsdesc(%eax) <--- X32 mode.
+-       */
+-      if (offset + 2 <= sec->size)
+-	{
+-	  unsigned int prefix;
+-	  call = contents + offset;
+-	  prefix = 0;
+-	  if (!ABI_64_P (abfd))
+-	    {
+-	      /* Check for call *x@tlsdesc(%eax).  */
+-	      if (call[0] == 0x67)
+-		{
+-		  prefix = 1;
+-		  if (offset + 3 > sec->size)
+-		    return elf_x86_tls_error_yes;
+-		}
+-	    }
+-	  /* Make sure that it's a call *x@tlsdesc(%rax).  */
+-	  return (call[prefix] == 0xff && call[1 + prefix] == 0x10
+-		  ? elf_x86_tls_error_none
+-		  : elf_x86_tls_error_indirect_call);
+-	}
+-
+-      return elf_x86_tls_error_yes;
++      /* It has been checked in elf_x86_64_tls_transition.  */
++      return elf_x86_tls_error_none;
+ 
+     default:
+       abort ();
+@@ -1459,6 +1435,8 @@ elf_x86_64_tls_transition (struct bfd_link_info *info, bfd *abfd,
+   unsigned int from_type = *r_type;
+   unsigned int to_type = from_type;
+   bool check = true;
++  bfd_vma offset;
++  bfd_byte *call;
+ 
+   /* Skip TLS transition for functions.  */
+   if (h != NULL
+@@ -1468,10 +1446,49 @@ elf_x86_64_tls_transition (struct bfd_link_info *info, bfd *abfd,
+ 
+   switch (from_type)
+     {
++    case R_X86_64_TLSDESC_CALL:
++      /* Check valid GDesc call:
++		call *x@tlsdesc(%rax) <--- LP64 mode.
++		call *x@tlsdesc(%eax) <--- X32 mode.
++       */
++      offset = rel->r_offset;
++      call = NULL;
++      if (offset + 2 <= sec->size)
++	{
++	  unsigned int prefix;
++	  call = contents + offset;
++	  prefix = 0;
++	  if (!ABI_64_P (abfd))
++	    {
++	      /* Check for call *x@tlsdesc(%eax).  */
++	      if (call[0] == 0x67)
++		{
++		  prefix = 1;
++		  if (offset + 3 > sec->size)
++		    call = NULL;
++		}
++	    }
++
++	  /* Make sure that it's a call *x@tlsdesc(%rax).  */
++	  if (call != NULL
++	      && (call[prefix] != 0xff || call[1 + prefix] != 0x10))
++	    call = NULL;
++	}
++
++      if (call == NULL)
++	{
++	  _bfd_x86_elf_link_report_tls_transition_error
++	    (info, abfd, sec, symtab_hdr, h, sym, rel,
++	     "R_X86_64_TLSDESC_CALL", NULL,
++	     elf_x86_tls_error_indirect_call);
++	  return false;
++	}
++
++      /* Fall through.  */
++
+     case R_X86_64_TLSGD:
+     case R_X86_64_GOTPC32_TLSDESC:
+     case R_X86_64_CODE_4_GOTPC32_TLSDESC:
+-    case R_X86_64_TLSDESC_CALL:
+     case R_X86_64_GOTTPOFF:
+     case R_X86_64_CODE_4_GOTTPOFF:
+     case R_X86_64_CODE_6_GOTTPOFF:
+diff --git a/ld/testsuite/ld-i386/i386.exp b/ld/testsuite/ld-i386/i386.exp
+index a8db2c713f3..41e8725d059 100644
+--- a/ld/testsuite/ld-i386/i386.exp
++++ b/ld/testsuite/ld-i386/i386.exp
+@@ -543,6 +543,7 @@ run_dump_test "pr27998a"
+ run_dump_test "pr27998b"
+ run_dump_test "tlsgdesc1"
+ run_dump_test "tlsgdesc2"
++run_dump_test "tlsgdesc3"
+ 
+ proc undefined_weak {cflags ldflags} {
+     set testname "Undefined weak symbol"
+diff --git a/ld/testsuite/ld-i386/tlsgdesc3.d b/ld/testsuite/ld-i386/tlsgdesc3.d
+new file mode 100644
+index 00000000000..f2c29d880f2
+--- /dev/null
++++ b/ld/testsuite/ld-i386/tlsgdesc3.d
+@@ -0,0 +1,5 @@
++#source: tlsgdesc2.s
++#name: TLS GDesc call (indirect CALL)
++#as: --32
++#ld: -shared -melf_i386
++#error: .*: relocation R_386_TLS_DESC_CALL against `foo' must be used in indirect CALL with EAX register only
+diff --git a/ld/testsuite/ld-x86-64/tlsdesc5.d b/ld/testsuite/ld-x86-64/tlsdesc5.d
+new file mode 100644
+index 00000000000..6a0158b44b7
+--- /dev/null
++++ b/ld/testsuite/ld-x86-64/tlsdesc5.d
+@@ -0,0 +1,5 @@
++#source: tlsdesc4.s
++#name: TLS GDesc call (indirect CALL)
++#as: --64
++#ld: -shared -melf_x86_64
++#error: .*: relocation R_X86_64_TLSDESC_CALL against `foo' must be used in indirect CALL with RAX register only
+diff --git a/ld/testsuite/ld-x86-64/x86-64.exp b/ld/testsuite/ld-x86-64/x86-64.exp
+index 811813466f8..82b0520c52a 100644
+--- a/ld/testsuite/ld-x86-64/x86-64.exp
++++ b/ld/testsuite/ld-x86-64/x86-64.exp
+@@ -744,6 +744,7 @@ run_dump_test "pr29820"
+ run_dump_test "tlsie5"
+ run_dump_test "tlsdesc3"
+ run_dump_test "tlsdesc4"
++run_dump_test "tlsdesc5"
+ 
+ proc undefined_weak {cflags ldflags} {
+     set testname "Undefined weak symbol"
+-- 
+2.49.0
+
-- 
2.49.0


