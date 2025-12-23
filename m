Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2367E6F079
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 09:45:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98062.1766483133426914643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 01:45:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CDjTiQVU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4452694da9=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN5tnKJ1878464
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 09:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=t0NwOgDpV
	UHVwnuM+O2aV+6tK8gZyZqdIL1WAACWYz4=; b=CDjTiQVUzXBF/jqlpEDMAfqAb
	ch9LuIf3hqThCFC1rIMYA66CGwrnqusF09raKE88OV+oms1vinJqs3hfGZVw+Zs3
	brc3FPJB0s6tgulfBWJsj+a4zBvVtGpEDnZDeGQv57kJ+PK16GWGcKvNHAUax89E
	+qo8C9miPSDGRg9bim2ZiswDsPf6TorqL5wgog5B8W0lVu7cAqFqxK2VDe3MY4Hv
	qST7aS2bgrUlXIvbUaX05V8DG8CHFXe8GAE/SJB1N4s2jLXD1UJhkS5Fei2Ii4F4
	NQ9OlmRVp2cUgmIHd8GGL19HlMYj16cqJcLNvTuI7zeHOcnWo8lORDbOGBeWw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010027.outbound.protection.outlook.com [52.101.201.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5h0vjxrx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 09:45:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjNgZB1gdNTZ7Oc9iLRx4QEA+dNppyh0A0tjktZ42zJxpend8iVG+/K4UTBSEwIjjMczFB9FHmRAukBWIOlgviDUytC6/Q6fITBcTCvKRLmPzMM1kq6DLyktvdkSCEmIFPF+5AyWsXSODlPnJezhVjRt3IE0Ke2c8GtWEpuVuvYkDN7DcwUPayK7KNwP/fqDgr8FGQRvnMJnHBPN3J6m/AX9TuO6Yp9fGxQ0zyY//A96T7+SQIV3Urpdh2Y06iaWK5lhkkTCcTOwUWHoy8i58DCLTEFjcWb3r0LWl8BrrkY2yQRBvE3JupxrB0O+WjPlDqUmsuqypxlpzgqs+6qrcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0NwOgDpVUHVwnuM+O2aV+6tK8gZyZqdIL1WAACWYz4=;
 b=X7W4RloROQu+0EI0cFs1XS4Rb53/Tsiek7D6s2eo+hMOZUrF24Y6EkCEEQcmbWpGcYja3+rC3xxdzy/t3TI3eBwuJeCnDfdE7zPMT0EgFFZbzYamqMalBCdckumSEvUGm1tzUT4cUsnAvb8d3xIl2qE5qyK/Uanh40sKxu+f6en2+S0j0yneCX12RqB91u11iH+WhrmM42aRtKofcQlaZoiH0E4Fd6pj1IzErrXScFPXWJXG0LPiJ2VZtEA6UNrLfaXOvfilrkYlXtoebhjhmdUOnoz/wCnrjozMfsNTUsLFTpwV4hcFtB5MRWhdlGGfYXuSFWarsJK9K2hYr0tDNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH0PR11MB5000.namprd11.prod.outlook.com (2603:10b6:510:41::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 09:45:29 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9456.008; Tue, 23 Dec 2025
 09:45:29 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com,
        hemanth.250302@gmail.com
Subject: [PATCH] llvm/clang: Upgrade to 21.1.8 release
Date: Tue, 23 Dec 2025 01:45:04 -0800
Message-ID: <20251223094504.2919922-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::12) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH0PR11MB5000:EE_
X-MS-Office365-Filtering-Correlation-Id: ef08b0df-3f0d-4fd4-6fad-08de420801d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?l5tAHNljOU1BtLfJsMTaP0RZ4t/LgUHxkjRTwMXlU/7eJgCsfW5aaHJFdzd+?=
 =?us-ascii?Q?wEud4SdrVSYJd8Q+0bUYv5k9dNk1rwy1MScxjPP8NisettxxxNE8HKPxjqjS?=
 =?us-ascii?Q?Qcr21IuR+d5ltxUBnpzDvwOmI+kpxeoQASJZmaY3fy/mJ2wRjErrv3gxdcZt?=
 =?us-ascii?Q?clOqR6Ok9NInpjZTC2u2tVqInsxumDWk/giM65Rgv2Ji7YY/Uw7pyK7KIyqX?=
 =?us-ascii?Q?e6dPxqsJgLBTIJAdN2/9oyndGr1lXxsV5f70Cdu13yLW8j8GdM06omPRZ8wW?=
 =?us-ascii?Q?bj1fwOnqICD/ke9nGdk167peSaSu6FZiQxb2KPtpBeXOI1wtjtOuPaqLO8LD?=
 =?us-ascii?Q?vyfvAw7+j0w0vVgdgidAT3W/bXkyXzW0Qv39o9mPz1tg383viHmHVSC+cFWW?=
 =?us-ascii?Q?VyiUodWMneWIkI+q7rUy844s5HBglSMwtlF3g+/xiY+qx4bcOdmhMUO9jqkE?=
 =?us-ascii?Q?CPiensDnXd4WLAOfFnsNYsI9cERwEd6TtBGJekwr9JHZVdq6Jp0wgcpQMJZR?=
 =?us-ascii?Q?YuJRWpcKsRhtIJ3XxK3vceF0gzUp9apIKhCY0jCWbMrG2Fo12eNdr0uAyves?=
 =?us-ascii?Q?p9AGi2pf3qp7lyiu0ZW1js6PuvYjBwL0v/DgbX3f1HspWArTtVBt0l2IMP1d?=
 =?us-ascii?Q?5ouPrAv5DyTXRrLZ7QdZlszcOUoeFmCM531MV6DDuTsL0QvyN33Twaf3efQb?=
 =?us-ascii?Q?uME0rmhZ6cQUik3IFk4WcyDKZn8ltkGazFctDMyT1fcqJKPj+MIGAyGM6Q/+?=
 =?us-ascii?Q?MWg7Ga5j9b24sZ5O0tzmHXovVMkDFqK5QE/QLq8asgS6hwDTr7W7WNFMsPS7?=
 =?us-ascii?Q?/Bbxh+RRQF5C1WN+A8ZJ/l+fqCTYskOfBc5ptRJMyqFN+4FJ3Eov0bwe4MMg?=
 =?us-ascii?Q?ZPMS2VxYc2BKmft0D55BlOc8HaI70ABqEho8tnD2kWn3lDQYPpI1UJFlqIja?=
 =?us-ascii?Q?v73sfoKZS8Da6LTeKXsD8rKyjbLs6+hp7rncabzcBJRvy3YmcIroGXqyR89G?=
 =?us-ascii?Q?psrNf/wlpYaOQrPTTAME4zJRH+xUzoS3Qpm3M8pMnrA/1agvCy6Rh+GnrUaC?=
 =?us-ascii?Q?SSTnTMDEPyDxpZcDpLwV0KlYHv+GPF3uml35DUskQNKUwAepoMvtzHxNDiGX?=
 =?us-ascii?Q?3u9U7xfEZJm1lp3KqaWD1mZl6WcbsegmY+ULiJrhWK0YoUjAyyDgFetGjkIX?=
 =?us-ascii?Q?Fen+BURA0ZwaqRsKLLrn8Vi49VnULxXuEmBKn7VF5XbHytdXjyWK0NlurXoD?=
 =?us-ascii?Q?5ttIZgPfMU4HPEVwtYdiP8O0Ng8bSByJbxkI+n37caXsSxwDVrr65oqInMdp?=
 =?us-ascii?Q?ANGatoczBwkbiQpmyVTxr8WIMP6K83WZBeXhmE+kUibhdvGnccsKqs1ZFi+9?=
 =?us-ascii?Q?N66Lz+dnzv9xOiIjjJqSdUqizNYUq448cyDuFs4cYE7fUc+2JThB0BVw5Ihq?=
 =?us-ascii?Q?aPEN7Ykfg8+0BG1YcH3n7RC/tCaMWGyZ/KZCewT9vOhK/2meCHeQ9t3FwxSR?=
 =?us-ascii?Q?NSAlLUlgrZ9lTYy0+2IM5yFHWeP3gYqXtobe?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YGZGdnv8pFZvUMvXGvXo4IDaknczD74s5cFaTzMJ/he7ivx8VXgFNYs+jYYF?=
 =?us-ascii?Q?Ls3SbHNcZv2cIHp5WOumuCpPev8L5PUAxkt0P/tRvXPU79t+dIS5ayACTXJ1?=
 =?us-ascii?Q?Zp02DlcJnlVI3I6wfC8d6LNr5nv0MBrdkky/IfkgVTovJZ+Zw7FsiBWHvMYR?=
 =?us-ascii?Q?Da26binC1xvUH5eVO5pXu6aYPGdFFuJ6URupQYptZ0hUWu3Q3n0QDZdBPrBe?=
 =?us-ascii?Q?kjt0e/X/EQMWnkx9hBnJ5cHVBT4ZwhVuVp+EPfyDudKVwVh7jR2OH6+tdGTn?=
 =?us-ascii?Q?EmqKph/kXxqgGO2sCoRS0cbTrcQwsx0PyBI46fmCW3suUBk88gTpelmHmaW0?=
 =?us-ascii?Q?WDJ7dx562zyE3xmd+66QFX/1YIGJQWTU/tfAaDjQQGvNNhG/KPlOJ89mFgfO?=
 =?us-ascii?Q?3gzhvhn+U9E8s4KKX0jRXobP9YNlqjqS6c8cZDIAJM9HBNdKO0iAgs36m1sL?=
 =?us-ascii?Q?5t9rQqfWE9WGkIvVHdNVpMbx/mEI57iqGBS7+mEWovkZxloK790162yElKIf?=
 =?us-ascii?Q?gqS4Xv6mooE/lUyDkW5mGF5lkaz0y0VNxJklJ7QHET91p10R5yZVDt55sUP3?=
 =?us-ascii?Q?5tlNyUTgRMwAx4ZlftRnu73iv4zcfB+XLOAImh9hKjf74zvsTki0UUKNhgPD?=
 =?us-ascii?Q?ssrz3gVGBmTGmlBQPuyRUdWSri035CEjtM0SrooxVlsbrjGGHQ6n6z+ONPQd?=
 =?us-ascii?Q?zGgjtxfgSJyHluVHdYA3l4dwjdiIxnBDWqCaJlvS8xHfMf4wjpORpp4AH9Qq?=
 =?us-ascii?Q?WgxZBbC8Z9hcIiavesEuYDSeJsPvDm08VQFeZ3g/K2IdgflFcqe0jEezorKE?=
 =?us-ascii?Q?0RJLl5/t0JSFsz+01YsO0MU+AzaULRssJe3e22TaqJSVrUOOsa/uV/4CuDNB?=
 =?us-ascii?Q?0s3lmMaqDpvtwHjVvDFp01BSaf2QB1bjQ16zSqyLufYQKbmvYpXc5FQZg7lV?=
 =?us-ascii?Q?yHRbAauLy9K1/WwMph8LPTAeOIAkT+9V1H9iS3eR4kuJlnuagy3NP2YSMcZH?=
 =?us-ascii?Q?CUB/76YchQqVfWXuYh83VU1+hGHFLaHYGe0AT0LPzZRBAExTg7Z2KNFbz7As?=
 =?us-ascii?Q?QSj8HziM9q3eNm+6nEoH67RDTGit5yRRhTN01zc1GQkhCIZGs/KVs+4fLOIK?=
 =?us-ascii?Q?Rf51iQ2jwAJY3sfzBAH7nCLGTpH8W2I9OMGAYZN/mZFYetWFVfyDBDOSlfU0?=
 =?us-ascii?Q?uMh7CBBg01F45GruupNA1rTtRiXAsWuvr7xRxb0VbBidh81ACWmMwu/U/jkm?=
 =?us-ascii?Q?W40qGMGyzPMPbLqCrOQ6TIHA88zofXtkcWBPc82/j+bXWJkERCqGkt5qgcSU?=
 =?us-ascii?Q?YD2nbFOrwwNrWPsWKJRfoz8EchJmHiSPTzaJLa6+JDCy6V1CJruIsvZqAb1Y?=
 =?us-ascii?Q?F8IkarPopKS6iyNH+iRehKJ/ziANCaL8XLLu4L+iZmQSsEG5Re1c3pYx8gbF?=
 =?us-ascii?Q?x0EAjlSrG1A3+yuYImPV+Bx3kov0m62JleZ/nXq9eMwHI4AQVy05l04M/tns?=
 =?us-ascii?Q?UKj+Z+sGVglLoT6bifCZHW6wEH6rDoWDN/4nKkSAvmF//8Nn1lYdxWixhqUr?=
 =?us-ascii?Q?Id1H6yIrQhUj6ZvscMy8wLRJcRxAicuKLsjO43IVgHYHSM+vmb0DjnpoKoM0?=
 =?us-ascii?Q?1+HBvxlJFSXfWwegcRshXH7O/QOGILnEUYrx1CNb3xfdm92TnOYq3DtEorZw?=
 =?us-ascii?Q?VTDHTESlH9vHMLd8TAo9MGoE7uxeVG6bmpyqfi+bnbszFi5wQb/ObiqKZOFE?=
 =?us-ascii?Q?6aPnuKDEC0sRh24PaZpHPN2LyKzt838=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef08b0df-3f0d-4fd4-6fad-08de420801d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 09:45:29.1753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FIU2NTuyo1MimDcPnvvkPdjIscffZXGn5VP+yTaz6cTm8XDFltfoxWgjT1yWWcC3nBav2GWza4k6Rc5ecCZ5ZJmYBYKba84tfKvjfhr0Hk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5000
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 7ea4YlcDkTDeHWUnIE89BZcFjBgp2Lww
X-Authority-Analysis: v=2.4 cv=I6Fohdgg c=1 sm=1 tr=0 ts=694a64bc cx=c_pps
 a=jolozQ03zpjfpn/maDJ7eQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=LnvSZqSQZIeKJYYFDDQA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: KnYeVbAiV_nbkY0_CwEJ37qPAt7-3lw5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NiBTYWx0ZWRfX9k1yl3yt2LZb
 7WmBc2ggpscMypy7G1VhsKNUtDuqPktKtt+yQ/V053aWENQzQjIMfDv9xUdfbkQ+8k8/R4mwSqU
 0M8if1NjS5lM/nB69sJy+rQIl9/7lyfVwdM+191h0eixiUZEIOAkMLH//drl375UockHAvQaq+b
 FIQpQXBCIefzkR8N235D0SEdd7RWyJYgA7MFj/s72PgbAnmd0KGnHK2jITGS2Id6/uZEcvhuwRS
 8wBcjefJapJQXuVboBHX+pR6OcrOWNbsEZoX5nlKDCbuuN6aPKcjVGDl8oCwzYSziAuGn312kW6
 4xIyHG2mWSyT/T0H7x9A6jmOmF4wTMVEEEoLTLQGapo3xvytAWrCZBWx9F8h/KJPcY1jayk8y+1
 svSI0zHNTpKKQIvaZl87kyrjIMmmvUYRmj7kHMyScTuxmcQQWJqMujGRtMyF3c2XUgwJTXqfml3
 ca3jakXRBhx+M7zcX9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 09:45:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228462

From: HemanthKumar M D <hemanth.250302@gmail.com>

Brings following bugfixes on top of 21.1.7

2078da43e25a (HEAD, tag: llvmorg-21.1.8, origin/release/21.x) [Github] Remove use of setup-windows and install-ninja in llvm tests
b6360d3bc7a9 [Github] Remove install-ninja/setup-windows
7eb4bfe053d6 [ExtractAPI] Format typedef params correctly (#171516)
51e5074676d4 [compiler-rt][sanitizer] fix i386 build for Haiku (#171075)
d2e835bd4638 [SelectOptimize] Fix incorrect -1 immediate for large integers (#170860)
4b24e73d34ca [WebAssembly] Remove FAKE_USEs before ExplicitLocals (#160768)
4582a800c588 release/21.x: [clang-format] Fix a regression in annotating star before lambda (#170969)
a5658809ac4a [clang-format] Fix a crash in AlignArrayOfStructures (#167099)
94c40c61c1ce [clang-format] Don't swap `(const override)` with QAS_Right (#167191)
b845b4cd771e [rtsan] Handle attributed IR function declarations (#169577)
f68f64eb8130 Bump version to 21.1.8

Signed-off-by: Hemanth Kumar M D <hemanth.250302@gmail.com>
Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index ae0caa6f01..1f77400dd4 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "21"
 MINOR_VER = "1"
-PATCH_VER = "7"
+PATCH_VER = "8"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index e852f03c1e..1e70e9c64b 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "e5b65fd79c95c343bb584127114cb2d252306c1ada1e057899b6aacdd445899e"
+SRC_URI[sha256sum] = "4633a23617fa31a3ea51242586ea7fb1da7140e426bd62fc164261fe036aa142"
 
 SRC_URI = "\
     ${BASEURI} \
-- 
2.49.0


