Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DACDC83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 15:48:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.528.1751384882882022437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 08:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=927761a2af=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561Bc5vw010785
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 08:48:02 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jbp4b2y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 08:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+5Ok0ItY8NBv6i1jt/xmHYOa/jeG1ewlA2hoBioAbuzZy5vZ4eZVman5PJVxITqQQAM6l+DmhOtAr+t3pfHe/z56mgDjgD+mbd8lkMcLc9kaDe/+KcbvZOdhD+t09jWHulPNO/SJv4cMyAJ0ISzYvrzcidF5ZTWj8cklz7eK5pe4zJvhVqxL1JUMNnUxGnf5xJuXDrBuCyaD+B42CsHYLIJ8Xl+MyAAD9xmY0EzWZ1uu/+tN5rufq0bsx/6/QJIOVJDKrsuTMyLHNJ/b+3WMq01dJKtsAdBZiJx0ZRHA0WFhHeH9asQ45o36W1BaPaw0Jin9Km9Ng27tcXr6SWqvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8u+TGWIauXaykkGCFjHkWVdOYEB1V2bcHjzHPdmnOQk=;
 b=ckFDywvO3eXQq/ulvEc0poiDvrR9LaSebUDajjXakj7o8nqKDJAMAv56ngOnKe4HZ0xbF+mYx6oFLIvrePKC3o9eh+Gj6tNCkAlXdJK5WSldoGkHV0edYxGVPaBvfo10U8C8HqkwcLM5eD8RMCvkwfrzcT8Ool3NEURD0PY+w+gT5/elGW9i6rF26GdwF1enJHgNLGIHiDGYPjIOqGtRMxY4dVHgYMQYxf70LIU3BPWIbQGMz3xhTB6y5X7JEp5dAV/HzXsFgys5e5VDKX60r99jEl7rOqRKvABt3Nn2Vva8DlGbkpO2F1xCnfGbvwOd1Cwib/bB2UHu/IYluWB//g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB8130.namprd11.prod.outlook.com (2603:10b6:8:181::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.24; Tue, 1 Jul 2025 15:48:01 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 15:48:01 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] psmisc: fix runtime version when using git shallow tarball
Date: Tue,  1 Jul 2025 23:47:31 +0800
Message-Id: <20250701154731.1465906-10-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701154731.1465906-1-yi.zhao@windriver.com>
References: <20250701154731.1465906-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0090.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: c73c75ea-f9f3-4bf5-c78f-08ddb8b6a877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?C+2EmbEpcEsbXPCyD6ouGkiHJ88iB7v5QcBxQk2AKZ2oZHg8CZAv0nEX/13x?=
 =?us-ascii?Q?ONYZAG+pLF1bgvmAOcFl7Mvj9ViVE1BjmrnEZZgRDsvTXQB9C156GLy3cZyx?=
 =?us-ascii?Q?Il/mlSxoqtfcdL7GAQPHBCijjLv/nCj1+DTAzs74J6T0NsOrs1rmpEWtXiAH?=
 =?us-ascii?Q?HCnDG7ITMGGNQj0X8JE4obWJn6QtaMQWc/WPlnZ1buiRbpxGTp6lqw/404Ua?=
 =?us-ascii?Q?JOebHGOinzbXve8zV8xdDw58mtlL+obvFC41QZ1k/wJyTlIxYIrGEzlJKbD+?=
 =?us-ascii?Q?1T+dMsWqCFBWsj5Fco9vTaujzxON53M90FiAp8/HT7b2KiwfwxogUe0U/5OE?=
 =?us-ascii?Q?Wh29ldTYU/kTktP7kYuIREWmgjCJUGLqGqTEBejTkPZKOyUwNC4ErG9l8yts?=
 =?us-ascii?Q?zy7xamu7i7N4+3jz4tsXqspal67lCrPbuIKWfcfwiWxEZW4g0VxYkZF1xhzf?=
 =?us-ascii?Q?dQUtLxVGPsTrbHOLgs2wsx8EiuG+KczOdTs+4JognJi4Eb4/MkD+0FLBvFV9?=
 =?us-ascii?Q?L5YaHfGerp5SLfn1+1L75rxoASlxvHC/oRP6+93h5DJDKzhjluBGRENc/Vnc?=
 =?us-ascii?Q?Eh9BxRyI7XiCZoTwzM9NO7ySl825SUnMW0UGpMyiVZBQhi50FmASQrhtGT9c?=
 =?us-ascii?Q?7kcn8EAn+9Ff+b3lktSOOeNuUiI7W09VpjUygpssJoOCXe76NiiwGwxjKNfm?=
 =?us-ascii?Q?m1IGrYhmQexOF8Xf5uaqIK3TYlgEGyqzItaqHla3tq7owLGRD0ep7qGJBVb/?=
 =?us-ascii?Q?NtwuuLHBmI5r0PO7n0SHHf1QUVS1+ioKnoQsQTUJsWiRMTJqC93fgEHnMhbP?=
 =?us-ascii?Q?YzBspNXXyOSKA83JK7NqveYHTF/CWeWfPVYYCbbYhGbuR9kSd9pCTSD8cg74?=
 =?us-ascii?Q?7ktHN2YVGaBEXEqon2HMwSPCuvw0X2Hsbm4+nJ0cmEsjpQxrUdEGqPfRRUXy?=
 =?us-ascii?Q?ZlqB7yr++o2oMyiCLx3sNnzmL75IUQmQwEkXV+20aZaBmjxTtobTdy3DGbmi?=
 =?us-ascii?Q?M/omdHIIyYwWhvhDyqSO9HQ08YxXpK0ZNt1JfSsiR0dXEA+vgYDilbZU0OF9?=
 =?us-ascii?Q?0dF1Nsb4BFuAL2QZ7RLFyOOk7YdlOHmlC7oqNmRDO44zA9i0pwMSltVuVIBy?=
 =?us-ascii?Q?vlGayA586UdXnGpIqV9XLeYgTh+v7s133fgBaPwAhFWeoFk5SN2C+Y2ir7th?=
 =?us-ascii?Q?Tiz3gsnn78jQlrCfWmPkz8lqlekQ5kP80ALDmaWCvgttVQa5o2liLiYyg/V5?=
 =?us-ascii?Q?o53MEbFEs67gLw+0HsKhLYEF2xAe7W2gb4D3Fi7h4hOKR2NOnhcmGiZV6ar4?=
 =?us-ascii?Q?2DQBjsB4YfjzQyLfreRXVs7qcD4XCdxbxj6zrXDwitBnQrLIQuUg7uNEuoVc?=
 =?us-ascii?Q?4IN8TjcpM5m5V85Y6KNg4soGXrVAmTUr+yOObZHy+iAhtSCcSN2t6XoCPLng?=
 =?us-ascii?Q?gn4p2VeHReVRv2u6wkBma8D61Sii7wFoCc+1lVpMur7PzRX3GfiTBw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xeqCUnoNA4qeuXwxmLZ1xnCHsuaU6pgxjv078xGfESZu62ABb34y1/UcTpBD?=
 =?us-ascii?Q?aJ6uMS7D/UtHkCCvBHAwESELqMnasVxgCek4a1eHzTo5l5bbTAkwfathSbus?=
 =?us-ascii?Q?p0Xr+FGPU7dx5KG7xxGpC48l61FOWu0bdM98J9dz3sVhWTToOIMT9elynbw3?=
 =?us-ascii?Q?+tJAk0JUz5HbkkJsJ2uQB71+Hl1Xa7f6nICNpJZwaldPZVi0r96BR8WXrIdn?=
 =?us-ascii?Q?Cly4tyG139jlDt/jcHDF0mN8WqAqdOCRu9h4g214btmV9dELm2NXcSGaDqSZ?=
 =?us-ascii?Q?cj16wrmvErWZcmlqcNSLR5c3wXYqMZ9xciQP0t/mCFKfCucpsZmaCnCPGnja?=
 =?us-ascii?Q?YPJimk+IwWenD1FsQnCG6K1+5iVRQRScTGRoj5twhvz7y2FCV1BjUsSq6xCg?=
 =?us-ascii?Q?XwOsenPc6aDYrOWNOeCOnzB86ig6qUIEMYlKe826aGl158Zpxza8LW5k3RGL?=
 =?us-ascii?Q?/6gToRYs7tMPtF0VuxzQs4yyC/gHXdYAOGFX4v30TJHGOtAuPej35kzeHne8?=
 =?us-ascii?Q?k87MktE9yn/TZK6B0dIpOoJicr8X+vE4A/9GK+stk8Kk0elfi3WI+CV5Xen+?=
 =?us-ascii?Q?I0C9aU1xsVKKI26QKoMPWcR8f1icvaT7gMvVu+ItXx/ssCfH7Eiykc8iXcDR?=
 =?us-ascii?Q?PcBHODzIWKcsK7gJ+TDtfFYOC8S5rEkE1I6rqHLYB1sJ3pgLC9DtLKDF7oqt?=
 =?us-ascii?Q?OBKWFFMzEm/hvh2YJ0l7kxx2CFTV4osRHeyuTXlnJE3RaaIZZe3J1+IzQlaL?=
 =?us-ascii?Q?DwycKL90uajZucyQnM3uZUYWps7DZA4Hw9guaFOWEITQqndCYePCn4WlCm0v?=
 =?us-ascii?Q?3yb2kTvONATEMev34iNk1YOlaI4mjbwZbVaGe1MGzyS2r8ADmNKhaAZIEnDC?=
 =?us-ascii?Q?us49OR0+rVE+K8u93s6Ly0CRwXY6960AFFD1BBuPzBE0H3cSg843+C3aVI4s?=
 =?us-ascii?Q?ydq/79Sc9S14rDaVNCmJ9GYs/vsqqC9GlgIx4oyQrkOloSQ1NWcJ3xP4GU3m?=
 =?us-ascii?Q?hr/D970Eb6TRCU0Ex3dLnMjj0clHmsfH8vTOU+LgSd2f5Wc9ABNl3U0r4WCy?=
 =?us-ascii?Q?vJ4wPJ8aTDQ+zlhrIN1DKxvf+c4yUgatX10M9ValQBBWCJq+01qPNMlezHD6?=
 =?us-ascii?Q?3mIlI6L/1I+dcLsm4O14JSKugJxFOOGf1XF4wLlDUK5a20xcC1GSf6fhxhR7?=
 =?us-ascii?Q?VVenOxzHarBXkYmFU713n3u3T3HS5oy2SQ//gRztNr+81S+QZWuq5gGDwpE5?=
 =?us-ascii?Q?ze7OHps66aCtyolSUuvYeph9otDO4uk4KFgSdiOqw32PxFi+7xyWUMWjtY4X?=
 =?us-ascii?Q?mxnquOoNS5Jd+r7VNvSjPXiE1Yo4MTtcB+xv+xh1bHyA+4Vf3NOHSUL/qgjo?=
 =?us-ascii?Q?6ntx/DHOdA+NYYbzUOlY2dpIHc21P5K4CHgtU99DPp9zub112LbKjlGKz/CV?=
 =?us-ascii?Q?9j3swyJo0p+GKvk701+4CxyMvINQMPm2YT3pxcdzA0J8wMeoZFh7zFbj55rm?=
 =?us-ascii?Q?MIWLeUDuUunypC7H03eRd/PpL3nbyoo7+nBsoQefifdW5RVQUyeGffIuOu6x?=
 =?us-ascii?Q?Mi2upq5s2pckSScCHtDcms/AMX8gj6OpN0qP38Bt?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c73c75ea-f9f3-4bf5-c78f-08ddb8b6a877
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:48:00.9576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPfraTiy6OCcB7dFwjmhWvqo380uCQHfNtHMv1nNyqgbbuUoom6yXzqZUgW1W4X8R5KTDBfQBLG1pR1NAwWtWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8130
X-Proofpoint-GUID: d4tZSUenZOCrClDO8XZQrxzuP4jsysRb
X-Proofpoint-ORIG-GUID: d4tZSUenZOCrClDO8XZQrxzuP4jsysRb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwNiBTYWx0ZWRfX4klUBI6lgG7/ FHRyOg4J6Eb8yv8dc708mUJh8DBo7bTB5QdV+rFmKsG/IS/gXQY/7jP+BwYyRHUA3hFDaEHrfBt sHnqxee/SDy1UlDAp6Jq2e6dZfWKWpWFNTFFgl/5EfZgzMYsSlRrJMrhRDsf8/lHv8Ll/yfyQhw
 ZF4rZmcY6BHLKjc6CdghdEg2gtannLC8T83hwcorngoodu/taEr0GhlbhJDErWEzLQV1vG41PvW 7G+gEDhPymmJ3hHsb09+8p1PLD06wlC/e4CDsAFjNOHiRNOtQ9yjvMaA9xXaBIovZpny97wCamz HFA4e/O1QfiYtKUkHj4J2YpzbcfDlmKCRFojXsCbKrAt/BpVlX/IZgvv814glBBaK385O+P5Q69
 qpLkqxjF+ZSNmj+mEN169j3nT3VhB+MkRP0Psq6Td6xqoTQb3g24ACGEXD15XSvfNK2blwSs
X-Authority-Analysis: v=2.4 cv=JMg7s9Kb c=1 sm=1 tr=0 ts=68640332 cx=c_pps a=LKjW2ISLMUJKWi9uHAe9VQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=p0WdMEafAAAA:8 a=0gDct7OKsOyg5-76syYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=909 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507010106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219597

Add tag to SRC_URI to fix runtime version when using git shallow
tarball.

Before the fix:
root@intel-x86-64:~# pslog -V
pslog (PSmisc) UNKNOWN

After the fix:
root@intel-x86-64:~# pslog  -V
pslog (PSmisc) 23.7

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/psmisc/psmisc_23.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/psmisc/psmisc_23.7.bb b/meta/recipes-extended/psmisc/psmisc_23.7.bb
index fff1f218f4..44f8530977 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.7.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.7.bb
@@ -12,7 +12,7 @@ DEPENDS = "ncurses virtual/libintl"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https;branch=master \
+SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https;branch=master;tag=v${PV} \
            "
 SRCREV = "9091d6dbcce3d8fb87adf9249a2eb346d25a562c"
 
-- 
2.34.1


