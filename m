Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2F4C54F56
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43757.1785192984108608893
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CBmom1bE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1668b11650=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RLx3k01688372
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=MfgyRssN+UdYrwV1SraStVNFPJX3DlPW/QUr//Ar+pY=; b=
	CBmom1bEb5mQzTHQqTgxa/EWAkJmYociFnT0m72nCXiJj0+vMnHbfGXmL0LIqGTl
	+EJuVLDIs3gWECL99bCOQYyl/6c24njyZ0R1cPa23Kx4YT+QUdPbTK7SJzNBPBid
	woSb63ScHVlfCfruUZoEu6yuV500PPYTZ0gen1B0Vknoz7E5ATv14peXHeQfOFzv
	skG8ko2xXVn6Tw/EGkmj0V/nig4g3dm0clV1+i5M8zOluD1dajM8iKSp6s+cthie
	fDHeUGqlLp0CoI2RSLPCo7/3evd0bjRwtoA/KrrlVXSYMN+hN33T+M/XrFACLxws
	vJLsd8CK476clhtOMYy3kA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012012.outbound.protection.outlook.com [40.107.209.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fmvnf2s9c-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 15:56:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnCh19HgkUT9OHJxsnMJI2sPo/q21aC2jdEm+tyfPREcS5a/LX1OBkR12xwqM8kMke3EKsDzFmtFU9DeTPwLwdlp45rCaJnd8Y1OLqrgs274QYR68mNwnWGrDFeCSTbAYcI5q8vOGMLVN0y//ZV+5YaAc+dlXlInP3RJUJuUc28tDE6ZOjNLc1fKyhvsGLDon9fqzZxET0oTYVjR3QHCJZmelYMf66p3hbYa8ViuuLBXQG9ZkXBMj/zV77Dbpi18VX+qEq0Sx5trrg2dIbyDm4okLNeqCnZW3qucYxSEGWQQYQ8h0YqcJKJO67h1Ryq6d2FzY3+braNBel9lS2Edpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfgyRssN+UdYrwV1SraStVNFPJX3DlPW/QUr//Ar+pY=;
 b=WNraCIYoUdRkNeqEwso94VnplYfHIoaEaLaJNv1ZNU+dOCjJ4p6re2Wctoq6UVbt8qmeMvNPOx4VtAPD0G736k1aN0xKjDX6uG+U8b3YY4bV25sAX98FPXaZTpPTswkHUNKchS5VYQi3rRlUcjWcpzHanAzINKWjss2oB5jt0TAaiwajkUJNoCINT5QWWEBvk9jvmGaU3XHu9Edj+PcGj64rB5TZ518ZA0hq3lcud+xqX+hdbLARzduGhyJBewYafMxpYZFuUxQ1cGKv6ACV08FWyH+9Ky4Cqd+/mfbAJR7t+5PcIPtFd2E5ZyztH6A0M+hoUg71fmzU8AhZiYUg9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA0PR11MB7259.namprd11.prod.outlook.com (2603:10b6:208:43c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 22:56:21 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 22:56:21 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v10 5/8] lib/oe/package.py: Don't redirect stderr
Date: Mon, 27 Jul 2026 15:55:57 -0700
Message-ID: <20260727225602.342005-6-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260727225602.342005-1-sumanth.gavini@windriver.com>
References: <20260727225602.342005-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:a03:505::29) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|IA0PR11MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a7b30a-755f-47cc-cfa1-08deec32469b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|52116014|366016|10067099003|11063799006|56012099006|3023799007|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	8cD7oVwsaKTdMEpmF+Fyh/2MUnA5OkUs2q/ipYYFE6Eb4FThhcKrzjb6dQ0rdiQnKVPZgInimy6QatHtdAAr9CSXTa7cSiFW3YcrrHpxk9RhcNCTDvPyCy7QZ5k5u0vZql3WkAjLZBDyJRX3o91RtBnHqSe1MyJ/NPmy22CboueSOeT1FS0jwd+B1th77C+LZ5LUpTNf9TuQECBe6qoQPZvUu+OEznkLua8hQwqRwWr/2c2tesRScJbnt049Cd6MsEXPZIFein2bY54DQqrbfbqccuI0MVb82lNCbuYQlYa3AY2CoFCW3vmifdO1G8GyrBsMXnFf4cJYtCfiljS5T7Gq59z1cZncaPCvcvQm4dhH56U3Pid2+HKm4s8YI3pVaBzhxiErZIalzJHO3LzGLqePNfDGNxNxuh3f3FGr5Q0pwh0zrvffR9pcjyUHch1+pAiuQvY9lEG+9Ob87C6FZlaE3tBkI8+jKTsFQfyzXhr6NVD6KjhZviTRvaBYCKOdgQCi1D/H2JR8XUFud5qzEa4YO4865chdPsw6lfo2iVf2TK/iFUCR1EIFQ+TwMZa5Kff47VXaCeg+U3TB209tUOgh9oQGnbeXLd0XHYNxl9+ooveVNZqu4/RmtUCdRgc2+58S8+D6xaewhzqCi+A1bk27w40BtUdM28JnsGsaGVvuHh5ZdnLmeW/B1LMXpuGReY3NGgrg8QHBZ71mpHbNd/IDnH7qSygxaBrp2YpbwJ8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(52116014)(366016)(10067099003)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L1UY370sQ/fjToYLzdfmPHmcgFcF8Ix1fQ95elVTTLy3xYUa3aNZOc0gl1M1?=
 =?us-ascii?Q?4Yz4RPUlIMBtxSYIzP15iwZiuqAYsQF+BZbHNEFT0c0t5ixtNmtaaxg77Sxp?=
 =?us-ascii?Q?STNFMgBfkEf0NaigtPahOmCVoQU1ZT/YXVFU/Zt0lwmU4Em4p7QkEh1fg5GN?=
 =?us-ascii?Q?auT7TsUZiDXSQOD4x5SAvl4D1tL6hSCRGNi9vk8F6FK93OYquumZcm+5WDLG?=
 =?us-ascii?Q?9Eau3RT2mDIyfztZKerNbu0DsKPWYybSz5QgvjKFufpWm9KUt/yUoIuTw2a7?=
 =?us-ascii?Q?sEnR3CfHd9hSYiGzHPijkbCXz1knHpbz+K93P0s8j8FqS3cn2c6HC9sUoSl2?=
 =?us-ascii?Q?h123syMqlCsTq2NUZOL9/6zpBvTSApfme8plwz5bltsAY42jGFnNyrSQAfXH?=
 =?us-ascii?Q?PnOJXQmDsh3uMG8si31khwHg93N/dWJ79UE6/6N7aOWAQOWbsNJYfWwT5S+b?=
 =?us-ascii?Q?T5bXqnW8J1F2NfH7Bks8xHH1QqTVLtvfRGNvjkS0UoZnd2ry+ciPWZTbi60E?=
 =?us-ascii?Q?aJgWjO69Ls/AHpmdIOadZaYXOMaR6e2ull7uG2UEUs3dKoeK53Qq6oI852pP?=
 =?us-ascii?Q?BYTXIaqRGQE7dCDX7PeC555G7wtkpKC95X4Zm1XDy6x6V5qt0N0JyfeU3KUg?=
 =?us-ascii?Q?C1FyWv8WL+1H7GQzNS7neieCDC4evoIW2f5Fvq8Dd54dNF5RECUG+MAnC2au?=
 =?us-ascii?Q?urZV7z2CjgyQ3EP6ltH7sBUNa2KsQtjcAvmLzYDm3wYzqzmVXVNU2qIbEi7X?=
 =?us-ascii?Q?x+nfIOSNBeUghbq7JZhmQ8boxMAh9LclavqdZxClfEED2IHQJW7gNMhc0kXJ?=
 =?us-ascii?Q?AuDblrR41QywYtbOE0PHQInjg8qRFGUbcM0HttHe9dTPd79FRHM+DXKDLY1n?=
 =?us-ascii?Q?nFKOyfDYgaY+89cC2ooetruFBbQOjrVbQY+EX7HOgj4jmD3m6jvnUH4GWkqa?=
 =?us-ascii?Q?gItIBqW7YRcXvUYKHd9SrjzjMTvohHjPuDqYYlUbfmPf/tr6QjGkH4FuMWMq?=
 =?us-ascii?Q?kWaIyPKek+e0cjtQmrCl2lTmg31MDNygSSOUDgQO/tq2p6Go7425OFMyjepF?=
 =?us-ascii?Q?lq10gOMAvk2SjLX2mBRZEX0WUr2JRMKdGTZiku+tvc4hD2zq8k/kSmGeGkDU?=
 =?us-ascii?Q?wIuU/3jlhhR1QFEAc7A2YMZgNUFOHyDtWiVNgK42L+BA4LkvyqgqVwKYAEk7?=
 =?us-ascii?Q?E71gSOCpYqahQmnFXRjoFpHoBkWh3y6n/l/CYJQHsyavoBl9xF778CdkRRwA?=
 =?us-ascii?Q?UkCIA+jQwNyCW6qzbCtKnr5N8HYbSKspEvT/+7Oj9mqFfMh5VUmMCHCf8yIM?=
 =?us-ascii?Q?AmedTDydYWbxczIgAxctOoTFfP3uwopE7Ip7wVqnbGWv/6pjkYbTQzUIWPvF?=
 =?us-ascii?Q?/yU6GJPQIwbfmSdqDoX2dzqBt7XIrO65v6LiZEYhLBais8A9XI1B9WwNXyjV?=
 =?us-ascii?Q?PRSpyQijXYetg50uxTp7VumsVcKJ8HgwbaVtle13sTKyicSyZyIFJEuUtioc?=
 =?us-ascii?Q?ANK0jF7kepeWlRvmFarXU217FjPfW6jys/xnVfD+lAL+G46TQtZxRiFTzhgp?=
 =?us-ascii?Q?GzXqwHIdpMIc1t3IprRTQI9NYvKNXEhRHbTOXUcyt3H+KHuatkk8qp24NxmX?=
 =?us-ascii?Q?UfHaozZQstSQJgCJtN2bgUuC8rvNnf5LkQRxX48LIwTpajxzHKxzHAGffieb?=
 =?us-ascii?Q?ulnpjNOQhaV/6AG9dGaR0KGWuRLWu+7Bo5DR3DqbEuHVvF9C6h8DmKWZoHOk?=
 =?us-ascii?Q?G7UZAL0dvzaKZ+YFamIa4ixRSHT/1NQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	BFRWCy8/tsWtANiZxKokCgmuXwx6MvWxj5958fyMgDa5blEO7MaM1jT4/GhL1OKl7IqP1legFSCBsVgF6lHgAlfmR4dDwaAToVC4ELVkPw5d2HMGzXvmOIMz58VDl6NsSGU7U25+f+RnIXKLENqBFwgrSqWx9OMVFpjR+KlcC/zgm/u69cf/ICF7hyv6SvpHWjib4DQn4ZaY//KUAId1LBePHzIoI+J5jgMAdngpBbrkpEnxy+sW+mwX+GPSCllEVPakcZfyePmwtPimquVXEdMl1cIbt4fX9tS9J18y7vUAGOcBlzRcdznO5rVq9ZXT21Cpt5Yu6cudSjXzUoRSuQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a7b30a-755f-47cc-cfa1-08deec32469b
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 22:56:21.2088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4v+POnlq5MSq8mCwFDm1ZDqynothaCIdNFnDrDkvUsKD82NPBla2b3dFBMPb7AeYZLLg/z4RjjOPU4ZSG7gy2x0ol6nNE8w9Fz3aEao09YA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7259
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDIwNSBTYWx0ZWRfXztrzgFl0VlsQ
 +XEK7w2B1W6eF/bT2Kw+MpLsGurbxH+VjuKBnp8LjidGIZCsJZA+TaxmveU5vDjeqjgsvwHmL4q
 GtPY9n09OOhps39JxRz7ZI8ACLhOXPNf7qblCj7VdUX4Dl2ZoEld
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDIwNSBTYWx0ZWRfX9px8dvkjGoMe
 PJx+rFVwJ4txWndpGWO3QewaYFRZcnN1y/UFH7IbDKs8Kebq+BLfuxKqa2mBc31ojC+RtxgGVy/
 PTaFRMQYwYlcCsRIzhih8VZWevKholRLhwpvrwJQV0GJ48wMKeCbRPQeiBbF4kWlhNV3ITThmEm
 IF5tjiMrZCmlsqaFILLuUtrGxuprouAHrSPn8QIchZfnALx4M4Pkbjww/MBAe9Rs6ADucHTOkMf
 WQQhLVNyfOn4/Qptaf9NL8oXnXajP0AXY9r4Nvsy06NhOMQAdXdZm5jGCS01l+ZmrAkyqj6GJ/5
 Qr3zhi5QagYEHjPuFfwUESMUDZFjD68V+upQ/1G+8lvsl0uRm573NqMinJwYy0o6wLx1jD+wwaX
 UJf1vM+SQSIR7m85iGX2dUUTxmPgiaXSP4dXs5c+FfJcSo4o8rZYpfYr2m/E83rwxsQdCAEmfwx
 ssOoWqj/sQUliuCOlMg==
X-Proofpoint-GUID: rfkrOFNRhHgzLVCxTJL_kZ598YKHakqG
X-Authority-Analysis: v=2.4 cv=M7x97Sws c=1 sm=1 tr=0 ts=6a67e217 cx=c_pps
 a=ul7AMzggcqKAecwK2qVOCw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=gZyeYKPtWqWysoXHKEgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 6rYGTlMExSJSHopNv5TF2DaNsIWurGqI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_06,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270205
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242125

This can make the debug easier.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index d210b4a73b..d6617cbac3 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -291,7 +291,7 @@ def filedeprunner(pkg, pkgfiles, rpmdeps, pkgdest):
 
         return provides, requires
 
-    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles, stderr=subprocess.STDOUT).decode("utf-8")
+    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles).decode("utf-8")
     provides, requires = process_deps(output, pkg, pkgdest, provides, requires)
 
     return (pkg, provides, requires)

