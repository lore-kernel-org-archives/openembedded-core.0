Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3765C61DC6
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 21:46:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23525.1787780773918682987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 14:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=X9exkU/S;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2698f24599=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QKf6Ia410014
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 14:46:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=O7QClXABNFHMI1hvJj3gf2u/4mJM1DGXUpUkezZcGis=; b=
	X9exkU/S+CN2cEDYtnU77KWiamDcsx0b2Jv0XN5p+mQMhQqC3tHihw/lNwR1gzDW
	9vbAHQNx5LcvZG+HJHWNzAWLdUL0L35s18ucRZKuL+8YLjZcCQ+8mchGZ14rdA8n
	fG776IcfP4lpeSMwZyR0ulSAGo/mGsJZgUukbvywUT6fzsE/FwMWZDP425Cly6nk
	io2rdttBTf+HRuFU3ZEWwJDaZUXiMW/cQ7AZxY3Hf787+Cgj5heNTe/lYCJXoQTv
	eSQEDKiDZ5jOzgNVyU/HZ/8ct/OcuaTtqUNvkHuK2V6suao9LKjcJUXVi2WdH8vA
	4h+aJdatWfc3w7LNmVH4Qg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020081.outbound.protection.outlook.com [52.101.56.81])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7721qf60-7
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 14:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjMQgd+MW32ldAaKY2A5acoPhI6UEedSWwYNJ0voOyzNBl7p9bFLz+haZATIeHK6d+c8T5eWN3nhxY8H4FblEv8PUFCqdrrDjDzxPdg+n2+CXqo0ASehkwWM2XJbwYIIxe4iY8FnAIcDYMd4Qj7bBwm6ecDe3T44KGIaCFuacm5rNb7bh5h5Nlp2KPjmhkXj3W5IRyyK/c1jvWIxZoGno1w5f8TaxZ6MdU/swn/lRTmN1/76+XlcyMf+ErdSyKKxtPpcfUYwyiNiKvSolhUQrMojV7KWsN7RGyIsytvFmxoYhQ9Scr4cRlxryaTDevkYgoqeZUW2fJAASw9RhOyYhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7QClXABNFHMI1hvJj3gf2u/4mJM1DGXUpUkezZcGis=;
 b=CPm0hcNTcH5mLpZ7a76d/yEVImk6W/6Uoq6O+5H15pDwFnHU9Jzdgfa73itczfPpiT7HJ1dTf5Ck/41U/dgbD8/qoFSYIz1NlvcUpDuHn8zSL41xuAIVZteVSVM6eHheWjYJTRI03ba6EBH6qTu2h0eoasLs/0UrKr1BcTmHDb4icqG2te9hA8XNtM/hRV2YBnedWHkcJa4UAPK4J9F5eEbeefUpTpASgsaXFEZ9c1eMAbk0pbg25/2VjxgYjxGLwoWQo0QSVHmJcbnkhtIUPVFzgaDebnWQYzOdmYbpx04RoQXJh+sYokX0vNKPyG0HCnuG01BRWh+gVG/M45l4xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25) by CO1PR11MB5028.namprd11.prod.outlook.com
 (2603:10b6:303:9a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 21:46:11 +0000
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b]) by DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b%7]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 21:46:11 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v18 16/16] package_rpm.bbclass: filter pkgconfig() deps regardless of generator state
Date: Wed, 26 Aug 2026 14:45:48 -0700
Message-ID: <20260826214548.3002838-17-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
References: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF5EA507B64:EE_|CO1PR11MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca74c0e-1824-4f33-d60b-08df03bb7192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	tg5onoDJMbIkJWD1Sx39mBDoQtTEpk3LCqTOkM5TjXN2oS4EwYZ67WfSS45Ds3ZbgaGbSTEfZTcy8xLipgQFBwInjxgLITsSXCC/4gLmWjalTLJXqDoChMQgaufmrc8NLASR3E5z5PFW2CwolfjB5JRB7BtIWUaqtgMUkMmB8U4rhYHJuxzTJBuvIFJzB/R4E9gK2EWt/pED8fYyuFBrD1WWiFBNgdtkbFWEuEtcfqan+1RPCiUu2xBFJn2fX1xMwh21s5AO71+f6oNczO0sp/tDGLygRaugkMYTnGhF+8qY5XoP1HSjDGLrL2bPxZJCpUKTxDLwNEuCFWSHtnRdZViP5DH70hSOWnE5k1p+ssGKEtQJ9V5AEay0rqGQ+/E/lbA7v5kfAZqx44OFvelSnH2lduNDM8MsREZvPDBqTMCQMsYLtzCqwUVVhC0K0jxPr4wl5o6vBCTkPQay9ATo3whTmqGD92lrae6m+BvKUdy8L60WdrcW0e/4RhboQbF4xTIbpN6Pm3srCt9/HxeXi7zmHrK8r3i8xGbgHgaj2u5Dg1/76Iy9jGFRdYGSTTuGLXOU67LXAjvDRGw59kylR1jT+KQ3yMkidA0tJkA3UC0/EIGAjdz+kNQjQEjonbH8xzddtX3TXvM8CYrVswg8xUC//PvMgO44n4B+MJBlxHS5ABqBcwvECqb3V65Gu5XMAErcBHaZrZSDTa0S2BkK2V3GNP/Vz0n2/KT6QQHNeBM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF5EA507B64.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CpuJ2PKZZSyeuJUqBCyeLT+mSdzsLfZ5qtq4ir2o5xqIC8TVwZRTv8eSf3lk?=
 =?us-ascii?Q?71OQGWI679kb+0g0zwj/eCD4MlqFa2IOL/dowr3CdJEVScRZj+UUn+ZebUoQ?=
 =?us-ascii?Q?1LXWH99zE4n0yGP2aDOCUrQ2ljPWpt2Agy7Q4lbQ07HBXvk8u+PjAs1MUtHz?=
 =?us-ascii?Q?TX5qMJB597rNwRpqRcP3fiW3vvYz6pqtkCsB9908obDJFKm5axodGj5LVJwq?=
 =?us-ascii?Q?LfdlO3Vr7CMe77kHd0/4v997UKc59DgjxY9KstMHSl0JPjt4MdUjfqn2+Xxc?=
 =?us-ascii?Q?pGy5i+fpNztqxKGLoiVdQyc79QuJT7zIdVOX59ET3wuCyetcEFe7ua9oY6bi?=
 =?us-ascii?Q?hjYIOn2P8HgRFskYVXxISU0KbcwyHyL4dxbF7azjjaA4oXTxQ1b6vLbUO4ex?=
 =?us-ascii?Q?SjfZiuoUDWpx3j8gCDFOeLJQAu7yg9mR3b3Vcsd9CS0zACaEQMYXnVMVWFpt?=
 =?us-ascii?Q?Abf6hsM9xbH14/HEnc5IeJpbNqWJVuv5YTlIR0JVKDC26LiQH5DqDGqW+7WL?=
 =?us-ascii?Q?fD4ahLmBVW0Lb8XmDBN4L9GsYusL0vGKTNFZbHju0WqjO6Oeo9h1vC705zaD?=
 =?us-ascii?Q?R/YpK+gzqjbsrc788V9PD7i+4DBLzANZEdHG5rCYvpjVM7y4AnnaFV4q5wK4?=
 =?us-ascii?Q?dEabJ1ZNkGAdtc1NyBYxjSbJ4LxIzneQ9WH0746CNX/2ACyujicV/vVwPCaE?=
 =?us-ascii?Q?TgCit9gGW6ljCQ/25GBhBL4zkaLZ1VSCWhj8FY14iDIvHi0Hl6p6XR+yJ878?=
 =?us-ascii?Q?qUAhzJQjHDC2VOViLsRxiOudzg6E4214N1h0j2WE3XI18MhZGi9pxL6A0Exd?=
 =?us-ascii?Q?KJ2J85WtvXlIg5Z03VgEMbiJUmzOQnktY9B+G0kTZ9TV6RXcqwip09ZTJ8wt?=
 =?us-ascii?Q?qzM7mgXn5sLANl5nJpp4oIEByP8qgv1kEFl4LGjC0vYw2ssH5k46TR6itRUl?=
 =?us-ascii?Q?A1VCzO8ocI2NHGArD7OJKAo0h2OXGRogSC9c6OWSA5VO3tMpsMDHdVsRNplG?=
 =?us-ascii?Q?9VcdxjS6JeptepQJY1oOrWEci1iM6waZPa7NmMVCf9tVbOIZCJnvTl5qun25?=
 =?us-ascii?Q?57RmQu5lZYXoukiYv+wzNvC4ezKZCmI9BSlu9h6Z3J6MHmT+PFePSbZNaf0E?=
 =?us-ascii?Q?Kvyag7jNNF+aCcUPFMIMZWU4v2IY9gKMSOL11e+xYiYwAlk1WDqQVVlnS4w6?=
 =?us-ascii?Q?dr54GR3DuLll3qa/BfpKSVdimrRVYq+ebm/xsyI21JFW3iTSTwORg0CoLnsF?=
 =?us-ascii?Q?MdAxAdiQq89LxZKcxWseFBa/gkFnHEiMIVp97L0k4TP2DTMwIzx2z2cgC85b?=
 =?us-ascii?Q?tYj773OC1FEOAmkSRH2mwy760IRZ26ObotrlB9je7Ut6KDnv+FKDIcV+gpbi?=
 =?us-ascii?Q?GlqpEB733u+QLdg2TRA4o46FV/ZVvnAob0sp1uCfr11Qgc40K2HZLHg+sBJw?=
 =?us-ascii?Q?z1OSUR906D/OOAIlz05f7omVFds5nvg9PrTBZMTj3uYgylUz08q6nMtJBWqB?=
 =?us-ascii?Q?8fqvwPtKv+lEG4NBoWBnyKeeogsSxe9r+6r6aLgE13Dfp++L8w1UbVcEvgkf?=
 =?us-ascii?Q?hs94XKOVr6BhUdYCQZvITs7Gsw6wl64NRVl8LqhAMAw4+5pT7+ZYq/5ucNVO?=
 =?us-ascii?Q?KHEqLZqb5oCTyMmizkOi08QxMQmZFwRQ4GJWh17LBlHhwznjAIidawAHuo9y?=
 =?us-ascii?Q?+VyKicDm08WcFOeYciuw2VoJ7X7tCI48481vHeDCVMtWXWK5ovuCeMewGKWd?=
 =?us-ascii?Q?mhgP/IR75U9cMcwR+8rIolqfU2ItyYk=3D?=
X-Exchange-RoutingPolicyChecked: 
	orxJpzWkjEEdEeDDGWYBfY7YLSd2d5uY4E4Z9fw3/Um7UfHRg9CwIy8e4bUHyzVH0lwsK5s2ISAEYixqkUrSz/0i3tp6RFWAHyi3UKeAi8UAeheqbPfwl+13ToNTIyvGF9UIa/WfmI59wZlGYIcNc80rBxSQXH1TwY6hIwEv5dZE5BGNorPTEzblBM1M31XjXJYUAZGOtlIE+on8q4G3d6BMVoTVutOpo/DND2O7vz8Ope1xAIgG44Q1gp2+7hW7HnQjn+PyGlnnCkHj32SjMP41jIuGHFHMryGKP5MoXqRottjjxTMycSGUTKRN2oeHGbNqKLMu0EWi9J9X7RMGcg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca74c0e-1824-4f33-d60b-08df03bb7192
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF5EA507B64.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:46:10.9971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MeKiuHF2p8PuYzNG9tWUgf0OY4QaFfGT3GwtCDMdeNBPweOq/iWFkJ0nUmUVowdJu+McQPs2bauOV3qutGJ9pINaY0ntGFcAUaElkNX6QUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=d8vFDxjE c=1 sm=1 tr=0 ts=6a8f5ea5 cx=c_pps
 a=H8KQetTyUVx2NtQIo3bL5Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=cVPVwkwUeXas7e_06K0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: a5loQoJlXYo00bWG27SBR_ez-ddnoBnF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX/O7+rAPRG8ab
 7S3gBnwhsSnjdUZhqt9AZcNPKbz9tx21r4RxZpLrWFMoon/y+z/vZzOGRtUiwLg0NNQV9NMtzzM
 RiMFOgW0a6tSOY+aJ6XMUBI22O31PkdfaswGKPXvsQClNLaGy0RrdU14+UzaAuQi4tSu8NHblz+
 V3tRJNP/oE9TyidIdyRADNV+B+zEOHSgZRKJvnSmxFfadF7ggmBo4wcTYptlOpmXWSV+MhdS4bW
 WPzmN65TuazCU4027rsslrSU4e05dozgzVChlukdo8WcbHEfsYvRJwocoQqLY0N97iKC6I+vCqv
 IgzfCruLkOZ+Xi9ZJBO35l5+vNsa0CgRQu2SZNcb3vhIoQdpym9I28f6MC6/qk3kqR2erS0VuNO
 HxQ8cJmIZP8UiSfZI/hJP3pW5uhiyvDFENlnJYfjDT/Pcvy2I5rrXrC2PUbHJXMLJaf2c1Pm+q4
 SxVSgB9S2KW1gtQQNsg==
X-Proofpoint-GUID: oVYTgp_0mKx7UFjm20GTLxDXuSL4ciM1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX2vJs+GkdQZ3h
 JknJQ6qubUuY8Kf/JBRQNcqoLzisnfCwHPqDSvidie0ClDP+yag5bbeg7HRiEJ9OvxMit4ujuJI
 whf/kIxYUxMPDiRsDKXJ3kF7R9wPQi9kSxB9d922ekAlJwUAl3Hs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244433

__pkgconfig_provides/__pkgconfig_requires %{nil} don't reliably suppress
RPM 6's pkgconfig fileattr generator - confirmed via a cleansstate rebuild
of hicolor-icon-theme still showing "pkgconfig(default-icon-theme)" and
"/usr/bin/pkg-config" in the built package despite these defines. Most
likely because rpm's own fileattrs/pkgconfig.attr re-defines the same
macros later in the dependency-generation phase, after our --define has
already run, clobbering our override.

Add __requires_exclude/__provides_exclude on top of the existing
defines, as a final safety net: these filter the finished
Requires/Provides list in rpm's core dependency code rather than the
overridable fileattr scripts, so they take effect regardless of
whether the generator suppression above was actually honored.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 71d5c5dee3..5a88e3ec20 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -612,6 +612,8 @@ python do_package_rpm () {
     cmd = cmd + " --define '__rpm_lua_provides %{nil}'"
     cmd = cmd + " --define '__rpm_macro_provides %{nil}'"
     cmd = cmd + " --define '__usergroup_provides %{nil}'"
+    cmd = cmd + " --define '__requires_exclude ^pkgconfig\\(.*\\)$|^/usr/bin/pkg-config$'"
+    cmd = cmd + " --define '__provides_exclude ^pkgconfig\\(.*\\)$'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"

