Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F89ED74972
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 09:50:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13680.1766137844213475197
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 01:50:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qr1Ogw9k;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4448c0fa6c=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BINk5DP2462562
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 09:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=24ZiPY/+uLuKeeD5GHa7eiUBu5Y9RT22+J7BIHu06gQ=; b=
	qr1Ogw9kHr8BhRuGcPFmBv68FOelX1ccpHiZSbfHzCfPMlbjP/uOfu6j/qmccNrd
	0x6bTN4IHSV6s4iMnX0x/aQzcirSoqupTA40xmYOTQaoZuv+QJR4vMrJisltUYzi
	SN5gnn6dPlXfpiz8YM/6KCsz2Yovq1LwGS7Z5kn9FHWGue2Bi3/BcbC2ha++X8Ud
	9UiF3VyaheqKIxhBV+BHElF/sLi3XeRp64vAlKmoCMn/i3gg4UySGofshWbd7Vck
	Y0qqSXdMIQmYziAMDWcD6zxmDQ5q2wfsOwaT2mgGpV4nZyDZWq0tsLr3HmcHg0MC
	Au7nei/M0qA+eR659XD1mg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010037.outbound.protection.outlook.com [52.101.61.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b4r2x0p1d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 09:50:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iofjY+Ts0T2jwItk/mSlGBQZvb5NYWJuLRtGCSR/mYhcKpEH1J1p2/AHMnM+3nDAJTnjgb82HdE2Zsq+mQcoU9N7pCNI15TPdJPhf+FV13qlJHiJM5BpzRCKG156Ojg0jVL/Xjvvewzx7tfrqIPcHLvi6OLNxjlJ9QqILUw217zX8fzGTp0Ev1Tn5m+abdIzdcZ9wOoW0rY/UWiTxjvsB5McXgx9AI6FqkpLbW9X0UZ9MkJlmsbcYB1Bpg3+klrj5W502f9ZN9U7FJja7sUAj3Ta8sTJof/AfaAmCo5tn7hdyioQuufzwc2fDZA+k7psoE9n+7hkfceGtrpsyjgULQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24ZiPY/+uLuKeeD5GHa7eiUBu5Y9RT22+J7BIHu06gQ=;
 b=pH73hkil8Ea3Y9rXkV8OdwVlGJlozJApaRbnV+AdLbOfFnuaEwU5zR9Ml1nMo2rKUT29hOjqCjdT+kBJ8ibdJ0jlopdC1TVpdZEuHVypdgbILf61HbqVGu2OfQ/D5FrP8MgAepFjFdShwvDu+n7VqNTni3LB61k1IcQcpCvBLV4zFLTlKJk9yYawzBmp3HnyC3me2eTa4KyH7uKE1mVxokbvd+RKa3bCQN9vv7SpqSysZ3iUpTxZ2DE36NCOf1df2ZZeRZi1eNxSzBVMXBbE/TXA998x0McHB12zvTWbtSiRm/ZsyayaMJ1ErzkK93sQi9qtdC9V6jgagQWSlFDvtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by MN0PR11MB5961.namprd11.prod.outlook.com (2603:10b6:208:381::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 09:50:40 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 09:50:40 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, Yash.Shinde@windriver.com
Subject: [scarthgap][PATCH 2/2] binutils: fix CVE-2025-11840
Date: Fri, 19 Dec 2025 01:50:16 -0800
Message-ID: <20251219095016.497666-2-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251219095016.497666-1-Yash.Shinde@windriver.com>
References: <20251219095016.497666-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|MN0PR11MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f0fa7c7-20ad-421e-06a7-08de3ee411d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fBQDkfm1P/EJbJU2GStDlV4BBOkuELr8OveX0ZI0j2ChK9xRBcKsWviWLlfR?=
 =?us-ascii?Q?BovrvUlHG8aj55fbBzhJuexxMVj2zkt9KfG+XzzmBevZlFSlCKgTdazuQfoJ?=
 =?us-ascii?Q?uAt/KltsOAlBkzp63SDeM8OrHcvAwHplvEnpEVmf9U9+bjyvEMNRokLX9eS/?=
 =?us-ascii?Q?E1DclnzdmYPYs/0dSqpnF6MyHsgWsgRhUtAjwMj/MJSPVdPX9D/h1FlHrL/S?=
 =?us-ascii?Q?AEv8d2j02jjx7Pe+gZR5EiWTVO4kp5qZ6FIfFmkj1CZLRzUhG/WPtGc5Lc5n?=
 =?us-ascii?Q?V0wdp79i3o7OkXK3xTFtuL4uhwZfus49Lz5lImkXS7unDo0uxJukqHQAoTNx?=
 =?us-ascii?Q?3YH6owEetyr3qjAFWQhBj1uFFeFl5XSAZ55TpIsXQ8QHW0Y7oCnPRMHP66nJ?=
 =?us-ascii?Q?V3qpX6UIXNH07AHJkGZLAcGraLBxIVQnXduhpuFIVlYBIL981bl9PBAiKuVB?=
 =?us-ascii?Q?JckiS4okTpGMC1/+2PylUq5gyl6rfw2o1H1QOb4Pz3KOziUi/HdycG6TOazc?=
 =?us-ascii?Q?6Hr/VQM9c8v87JC4gmJjhjy5RNK/jHGgBTGtLaCkyesrklrufyPcdXd+R0dp?=
 =?us-ascii?Q?ieX1TaYfFzFslLaK28c90yHX2+qZLOIrFA2r197uU2mLCQkgCGK250cVNyHA?=
 =?us-ascii?Q?AtD6tk//IWWM6ogZMNq/VkMTTONTq3n4KsQj0mkrk82AJ7t3zs+x5vfwjeY8?=
 =?us-ascii?Q?QRPyksWwO3ypWpM1pdqhj73RzClpK3t8C+RVmmUSJRuYPKf/S4srEJd+3efT?=
 =?us-ascii?Q?CMHRYkdijthuiwFokFUb1a+yaODfoTbv7ds2SXIFFxWhdWSzPWTKvDVOqb+h?=
 =?us-ascii?Q?KwVuV3ZLTwaNp6LDAMPDAskt/aOs3TsQuY4acDCDUJS46PZw/Q5KrH3Vv+0G?=
 =?us-ascii?Q?SD17gyTz3uQwQwOoqsSwh0IIv/3oLchj0ZKjnpXzxuhh1bp9K0ujDI52gw71?=
 =?us-ascii?Q?5fABuW9XAy2L0LGXfWNAAGzO07p78WVx7lU7RNPKghUpRG5liRf0dX04NTic?=
 =?us-ascii?Q?1QEy3URwfzjmU6EbPLQUHsQ3fZInzkTJQTG03z+4skc9jZmA87JUlJTytmXO?=
 =?us-ascii?Q?eYNCFLAV7eyILzuSG5noqRJnvrp45DRBunWsqm80ov9MOGr5JxeW4ocGKzYF?=
 =?us-ascii?Q?s68ex10mnZ81V83C7L6gv1O/IKVjCBy19Jr28MvR0iawyWBQEh7skn1Adkk9?=
 =?us-ascii?Q?sTpJFr/oXhUcvwhvgKqXPUuAmtCUlzdfeZCZX4a8LgN91QnWNmy8lG9r/Q6Q?=
 =?us-ascii?Q?kxzZxRffuNZZkdyw61nPhtjXk6SXcSKbKzIIuRcOOQw+PtmCYBnKi2wlwN9O?=
 =?us-ascii?Q?IUq/bAZES5iQm/HXghSLScmsCaksGUq7bWV3sejWt5Eky7SldNCGlusjc7y3?=
 =?us-ascii?Q?UVDkK/ZT7Tqw5wjarh0XCtoye7VraGAqbWLvDoyiBFzgfKqwIO8K2H0AdzpA?=
 =?us-ascii?Q?c3+/ilzowq+nQ+3QpEafILU/cjc4+4Wbkb7754dDXIG/NRfMH3XvBg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T7t9dPqDmpOae+84ajEYbyqLgDJ105xys/J2J4q4Fthj2xy4pgCe++Vak9iM?=
 =?us-ascii?Q?MIpCylAZrB84T8oqcOvLBLc/7DucArQ4hs/e2troWTG8MBSWG9+c25Hcqfnn?=
 =?us-ascii?Q?1aX88lEm4Ib9TjNwXLttURB4G4OMz9An1qapxc53g+OcOrkhH5BkK95HbF1j?=
 =?us-ascii?Q?Miv2b/V10uyvJdTk4A7ZStxX3Wvqiamla27hJYho5gWMluUgAOu9k5rs94dI?=
 =?us-ascii?Q?ulK3fiOsK4tka2jqHoykLmA2xKNNN3kWXvxjtgGiZ/bmmweZuEMQyyzfBJUl?=
 =?us-ascii?Q?+DSBC5HmeXmefG2tEB82Eas3BmTtp03+koXLOuUk9lJaD0xMFMVqzk/Cuf3y?=
 =?us-ascii?Q?35WhM3WsszdqOnrra9XBvpUPpBJhnKOzom4ThxKnrULjgGUgdoCndRhvRili?=
 =?us-ascii?Q?LN7/tVsub+aLsoiHV+sk/mVOZc1wjy96RdVSP3r+cCtwR819BtIaSfj7oWSm?=
 =?us-ascii?Q?kGuikXqyjStn72ZMA4W7n2wCpSbd7J37BvwCFHNTrnXdM0lQfWJjaHXz58sn?=
 =?us-ascii?Q?u+Q6ekuNPYraTVyaQE/Q3cVmjk1r6RM4jeWVGTru5R01/EQWkpa9bOpVOmAT?=
 =?us-ascii?Q?vwYYbzgIygpHqI48GEoDm4sAMDoorc9vCeVSz1hvZ9scSMwQBhsoCOmTru0b?=
 =?us-ascii?Q?s9NNAmfxhtlEDFOEed+pBJcdgpwNaLl/DPttkDWhwAHoZJlDXiWwjI2JO70G?=
 =?us-ascii?Q?sc3QAXpJTYH4U++ReCbHPeQic3rmNvMu7FeL3elXsAk7pgE0mjueD1fKJwkh?=
 =?us-ascii?Q?jHba0LboXEYloJzUr5H7PwiDKUbMiQqCRvij4tB7/7oAh/CVsLa/qduhKAuE?=
 =?us-ascii?Q?C1xDefXiu/0UfvsrsFOLNMP24qlwXHMmXUbcThLfUg4FDuvUA6sn1kD9BLav?=
 =?us-ascii?Q?GD71X6JOK5EGBXOYedeS635/uilX84YFtLuuaarcU9XrENRWQZH99LQOLpdm?=
 =?us-ascii?Q?sfHCpP64NgMvKEWfTyMjQxydeOkHwgm8eClzCr2mnbUJAcj3FRszivqreDHO?=
 =?us-ascii?Q?RTtrpqoX+Z5rzBZzTFZkgMLQy2QQtXEU9THx1A6P5xuJf9jkLsl+2rlWOaee?=
 =?us-ascii?Q?21l7C7GDuvVG+lv6TL4sqCUj4sFt9TT6CHQsOhUwK8GY4iJ0OZYVlk9Xxq9G?=
 =?us-ascii?Q?t3A4sFhsO0c6Vlan0fzWG+B1h4/u1CuQRNxnBEjoyS6woY6t3eUEd9RK9hg5?=
 =?us-ascii?Q?Y+T+8LfxF2gEt6M/ftdT18SmNhtqma767Z7G0m2U253s+4REX9J7eUTjOW3g?=
 =?us-ascii?Q?/wAXZGNqFZG2pWSvWzlcTP5ts1/V6lTSCwvTbeJGJa+oI3ReNtZAwHPEeBr9?=
 =?us-ascii?Q?gX7pjQtqudewEbwLAHtV//rU0iGqZWg6pdCaFsiCo8T9tYZcjcxcUsoT9A/D?=
 =?us-ascii?Q?yxj1TqYYLnLipFyJKjN80zYby0mSjZzCJkfHnXPHaqQYMjzod6CTMLyib1PZ?=
 =?us-ascii?Q?t0J1SrlPxOSMh1sgH3gT8CNLJzfAlEhLgfLP0ZNYMhsqu5iZXUB388/mxojJ?=
 =?us-ascii?Q?8Hl0aTIB3engxOdHyV2uCxDFNpgjmvDbxMmnt0zFe/qtuZOheyeabsW/Ua+5?=
 =?us-ascii?Q?4zZ8ZLdO2L8RLEgKmAeZ50y/c0iATKcVn1rfW0nOH9Yy7v8Y5oherV+YUQPp?=
 =?us-ascii?Q?xQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0fa7c7-20ad-421e-06a7-08de3ee411d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 09:50:40.6768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdoxOELGtRjgA3UX6H8hhksa1JqUPhzOYVz/kua+6fqnY4LcWSr/03ufIcxzl+nMdjjktZMuJdFy5wT3NoO9vokXqK7mBYVQnWW/dpYYM7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5961
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: pbvQ6WU4YnuwsUglkRDUhZEeaWgG1DyU
X-Authority-Analysis: v=2.4 cv=Qbdrf8bv c=1 sm=1 tr=0 ts=69451ff2 cx=c_pps
 a=I468VFW1STRMRX/li1H5LA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=cGBbg9qyOBkjoRYc1MYA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5qH1_8nv4owbuUJkXcE9x8SPi6rxjI2j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA3OSBTYWx0ZWRfX/dEnjH1STzsQ
 YH15X4PyRORyLIIKhVW1vjv1rksF9CuIPFmZahnNFaDpPG3lLOW40UxOneQaqohU98822G7wzuD
 /YDphAeO3aH/oJGH0FM8QfpfMmRyNfDQV3txSVuwGdK5pZsUkOKfYrrivVPRQ75azpLP7Biheyq
 UVxBsrNV0NGZzf142lNtFLjC0XrjBv4DyIJxNA6B4Exbj+Wn8RPDEyjukxSjG1AV0UA+pkS1Rh+
 gcThXx0We1C979jTEv8GK7uYueYaXjx4Sn4RAE7ZlME9woaj5SYJ47mMOHo/wxQd3lB/PA0Ia+4
 V/2uW5MlEz7ubEJE+YXuqhJ8gZ1at0aM8uwi5E+KvuhtxnFYnkpQKtAtpC2IKvQN34/VxKruTUR
 vdEFEoNFndL8JTc39fJ4CUZUNURdg4O1+IN9sqBeCiMXpqNOzCDJ54mZOszrLXOBmx0EcnWrrNP
 15ntzSnLDAEtg/P/9RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 09:50:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228204

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE-2025-11840

PR 33455
[BUG] A SEGV in vfinfo at ldmisc.c:527
A reloc howto set up with EMPTY_HOWTO has a NULL name.  More than one
place emitting diagnostics assumes a reloc howto won't have a NULL
name.

https://sourceware.org/bugzilla/show_bug.cgi?id=33455

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=f6b0f53a36820da91eadfa9f466c22f92e4256e0]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0030-CVE-2025-11840.patch        | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0030-CVE-2025-11840.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index e045ccf00d..839d31242e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -68,5 +68,6 @@ SRC_URI = "\
      file://CVE-2025-11413.patch \
      file://0028-CVE-2025-11494.patch \
      file://0029-CVE-2025-11839.patch \
+     file://0030-CVE-2025-11840.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0030-CVE-2025-11840.patch b/meta/recipes-devtools/binutils/binutils/0030-CVE-2025-11840.patch
new file mode 100644
index 0000000000..3fb4db880e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0030-CVE-2025-11840.patch
@@ -0,0 +1,37 @@
+From f6b0f53a36820da91eadfa9f466c22f92e4256e0 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 3 Nov 2025 09:03:37 +1030
+Subject: [PATCH] PR 33455 SEGV in vfinfo at ldmisc.c:527
+
+A reloc howto set up with EMPTY_HOWTO has a NULL name.  More than one
+place emitting diagnostics assumes a reloc howto won't have a NULL
+name.
+
+	PR 33455
+	* coffcode.h (coff_slurp_reloc_table): Don't allow a howto with
+	a NULL name.
+---
+ bfd/coffcode.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=f6b0f53a36820da91eadfa9f466c22f92e4256e0]
+CVE: CVE-2025-11840
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/bfd/coffcode.h b/bfd/coffcode.h
+index 1e5acc0032c..ce1e39131b4 100644
+--- a/bfd/coffcode.h
++++ b/bfd/coffcode.h
+@@ -5345,7 +5345,7 @@ coff_slurp_reloc_table (bfd * abfd, sec_ptr asect, asymbol ** symbols)
+       RTYPE2HOWTO (cache_ptr, &dst);
+ #endif	/* RELOC_PROCESSING */
+ 
+-      if (cache_ptr->howto == NULL)
++      if (cache_ptr->howto == NULL || cache_ptr->howto->name == NULL)
+ 	{
+ 	  _bfd_error_handler
+ 	    /* xgettext:c-format */
+-- 
+2.43.7
+
-- 
2.49.0


