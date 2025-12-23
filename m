Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F54E6C5FA
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 07:03:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96611.1766473415842632116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 23:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U84IvwlD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4452694da9=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN3wIDx1687466
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 07:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=iCAuqjL1nS6OkhVmHD34bLUwCOAy3WEVs+6yk8c6T5Q=; b=
	U84IvwlDdY0ouPC7oJIOtWbXn6S8YkGdU0ZJdRskN607GiVa7j+gB0UWbRCBiOuw
	O/FCnU8Xyp190h543I3L+YKUiqXb0ry5JJFOYZ8TB+qhw2FF0YgrJL7VCPYnXcoW
	ZnrKKjONrMFypzy3PerA/k2Wd2WGL2Pwf6NHGv2RGlyNYLc0NVNK5tMyusJK2J9C
	baAwRZj73zcSpM5u0XPZk7lEXGVyqCC5O7CRWV/VWehAGjbDfY001FSiN0ZtLGL8
	w5MKMxGlcoW7Fsnbk9byZU56av44ELGoGK9Wtp5LG1uudjxo00K2nBnZwnlkQgxP
	vF8YqZVHLVxH/r3POfKwxg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010031.outbound.protection.outlook.com [52.101.85.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5h0vjtf7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 07:03:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AgMAJkvPD8BypG2Y1zErh4NIuzjm8z5sfrFxdAopkQ67fl+F8B98M8agdw84fHU2AZHNMzBmjPo00WMMaS7UzS8U5m1ghwFjHY30xTArw9GIJxlKbyLsPoLdkJqcEqwEEET1+mhnNzIhmIchm792sfPBjxngR7296vT8+FjBRomw4HyBuC8Sg+HicP18Ca7LNR32a/5TctW+5kN9YKFUZ11Dffd9Ni4OPspXOjtrLO0dk2V5PWtzgmpcqR6fwtOY6c+nb0VcjUw2hoMhxKqmsv6d/s0pI1jnidvIOaNhsEOsJNQLmcl0JtdGQkLP3b8JhBzVS7lN3d7BD5xTrIP/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCAuqjL1nS6OkhVmHD34bLUwCOAy3WEVs+6yk8c6T5Q=;
 b=ywVS59B4r5Yu0+nlTLGf7piFO/fwuGpQ5G0TsHgbb5+pQnkRx+Al67tTdlKs57vTKZ4yfU5ZUgvmyzHqYETTfnWgUzVHwmoFDd8BfXndrhCredbIk+rgRSiZQcik8ubCkvRddkPqZmye/6bMeBvv2vplN0CCnUXQDB/143Qf7TRliypGni4CMK6Vi8o+3/seeLO3qmP5lsMZJg9aCyZx2ZARdPmqVuD/43bpPyiuFENFZVK1nWDm9jZ0yZ7xzdMMYXTSEy59tqD7YakjI1BPxic2WihDbTduHqRNBgYIMpOtEcJkR/N9eRHTBJ2tVydV3ND4f/IGOamx7RzWv/GJQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB7599.namprd11.prod.outlook.com (2603:10b6:a03:4c6::7)
 by PH8PR11MB6950.namprd11.prod.outlook.com (2603:10b6:510:226::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 07:03:32 +0000
Received: from SJ2PR11MB7599.namprd11.prod.outlook.com
 ([fe80::8345:1cb3:a109:be24]) by SJ2PR11MB7599.namprd11.prod.outlook.com
 ([fe80::8345:1cb3:a109:be24%3]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 07:03:32 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, Yash.Shinde@windriver.com
Subject: [whinlatter][PATCH v2 2/2] binutils: fix CVE-2025-11840
Date: Mon, 22 Dec 2025 23:02:51 -0800
Message-ID: <20251223070251.3052834-2-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251223070251.3052834-1-Yash.Shinde@windriver.com>
References: <20251223070251.3052834-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::28) To SJ2PR11MB7599.namprd11.prod.outlook.com
 (2603:10b6:a03:4c6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7599:EE_|PH8PR11MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: ba646295-c8db-4fc2-73e8-08de41f1624d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2JPRoRAJr9C/ReLnKGL3JWc3dLa0MtCV8mtw8uo9yuI/ao5iq9WnlVdtrpIl?=
 =?us-ascii?Q?tRvSxIsFlCtPggVTvZ4vhnxRll60aiLOwomXeN0v864Mf9tyAmFBEKu1gyO0?=
 =?us-ascii?Q?kxb6J5c+Hm50zl1/HR8KVQKlu0P3Tps7XDIn/xI5v/EUe4o6wAU1d0B1YUCY?=
 =?us-ascii?Q?VUTmIR8W9aU0NBe+qYivghaJkacUDCsmjddVNuped7V18hk8dqUq3Dvr/sHx?=
 =?us-ascii?Q?yQoz56xE2dER7TN3n/vO+1QrBSy7XFQeQ84WcE5iKB2yvj/8D22fghamTcvC?=
 =?us-ascii?Q?6EfbM+Q39MgPKkZUYoZywWhdY0hGVNr+oTu1lfKB3mIy1Zsb74Z6oQvF9Eub?=
 =?us-ascii?Q?YzcUOZXsxOuFqWeSiYZkff9Be6PtDa64+AlAe4y0YWlpDCHJStJTlwqisIO+?=
 =?us-ascii?Q?hh5zQdgsOzhkOzUtqGrdaK+AWtB06a5lEkqRbvTZoBi0ecUI62AG7sk7hOzN?=
 =?us-ascii?Q?ilVxgI1X2CHD2NrMUg0i0MJXtLmYyB7YEDfTScpEYfe9ev6X106bixQb7P5m?=
 =?us-ascii?Q?/J2dWHmN+wwuTjMF+PAAlbhg7GTamD5hQ+1o2Q6jIn9/RbyEo1pkbynT10cZ?=
 =?us-ascii?Q?nd7dlaU24oeDH4Lck8xECSXjExRs2wfsfGQCyaaJEGdCDx0SY82xTK+aXhjn?=
 =?us-ascii?Q?2DfBe3MC2gxCm9iK0eI6fCrSPzS5NjzAH4WbyqBn22KCvFik8U4BMCqaCqY2?=
 =?us-ascii?Q?9V7tHb2np5ocdj4ufPBC64u2t28vYNypBMSB9sIlrMR5vdZ2igxFK9/dVKAs?=
 =?us-ascii?Q?BfTf2jhGTS4fqg+RSrref4qu9mdR6c/bjU885nkcpY9HTi+X8TJh8lqKEpV/?=
 =?us-ascii?Q?oYQkvy9PNp790IXRHy5Xe/v+AzwxPGC6InAV/DZXchVNo4zMTUqxSyha9QKc?=
 =?us-ascii?Q?tTFFtE7k7abqwCrNTEaFQmMNLqQuSpscYZNeT4DLDwSptJJ72cPewBOLRb7p?=
 =?us-ascii?Q?mYETDmUgTDn1Uiw0x8F2mLewylxJnVR7drL7ffr9CbMODusaDCjxPdQGEW3Z?=
 =?us-ascii?Q?9J1kvaxpTsIPwsQvuZF6nw6u37S5FuMtU1jlK7AGRbJRKHmbL2xgIhdVDEG6?=
 =?us-ascii?Q?DNrj80t+7K/t32nCcbEB2C1PiU0QuIa9ChBz0FMAwR4HntZeywh1NT7qI5qq?=
 =?us-ascii?Q?cZsqA1okGGbgZarRi/xIzDdMjUuFFwF04Q8WyAsB6CrGmD0EDdxt1zKXNEcL?=
 =?us-ascii?Q?s+XwsxQWVUQOt+SuCJ5jKDJmsK3NULmLFOokawmjFSUIzu52aPJ60MB87kJP?=
 =?us-ascii?Q?HROi4ijSotqxLLdpzimodhsS1m2iWFB34QgvBlcRFEvgV82Mhor/hxHWZ6p3?=
 =?us-ascii?Q?MkRNXF5QeBhiFtg4EURFcjDCRKvzyPwKrAqBuunWPg5GyegMgCaBCIZE4ZlO?=
 =?us-ascii?Q?QjM2mS5nn3+MDS6vSKMhLbRazWhsrtEWU86G7U9E71Ap3xZyOVZd1VhnUBMQ?=
 =?us-ascii?Q?3m4liMFJyNvKI7XMFdf03g/kNOXksJUT4QmzYYXI54rIfJYcai0Ck5Ar4ZWt?=
 =?us-ascii?Q?TbgY/T6rX5kL3WzXI+EcBL+LddJHWwoXfgl0h49RXhp2kRxF24cYTejG2A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7599.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cuXZFFimF/17B6DQnVQAtmPf4+dwXq47KSPKVyRd3p1Fn5Ma3EVye400gB82?=
 =?us-ascii?Q?QNyiuRLCCZOCujvzoLYK2tFYONVDC+LFx9F/mXWj4Hx+w0bA4BXngpTQ51ed?=
 =?us-ascii?Q?Z4vNC+SGd9A4tb0rM8Kzu6MNHa5UYosNuAtrsDWvyO0fBSI3lyfzy2o2Hm7I?=
 =?us-ascii?Q?EtYjict46RJaonNUeolXLXkVrqCgednrcT653S0t1LAlSeBC3/mIZGijb2jN?=
 =?us-ascii?Q?kId/lmpBDFTU01jA8+XuyHwiPk/jLPS4PMxV0okbHSZQmPymutjqm1vrMI1H?=
 =?us-ascii?Q?wd1ZdnKfIdSJXRtbvNtHJg/5W8J8IBe9qwFA4DqJwoB7Uf5bNxwStQiTw1I6?=
 =?us-ascii?Q?W1dBFr9rpIs+cZxgo8Od60++eU48UfMfQvnirlUTmQpmaOf2QDw3U3L3u/iQ?=
 =?us-ascii?Q?qDCi4wVtZXah2GIlGt1fDTSs28z5E1nF2oyt8sQSAf9PrQUx7Xm5B/md0+Im?=
 =?us-ascii?Q?LVCYACvmOeKEkIs+rdRufmW1/Ghyya+zJB794U8G9O5opYzW4UhYUKxytddt?=
 =?us-ascii?Q?hOz4bY6GS/es+1TXGn6p/lrUfwXZPlnMbpJs3omkebpqG5e2QWcAAqa4yr5h?=
 =?us-ascii?Q?GAITpaZlHzbMcEL3FFxUZhAZQ7Q2T6wqCcJProDFNF+qeMDRi45fD46NRAoi?=
 =?us-ascii?Q?NSyHkTsM7DsQmUOWliA4S6oQ0/fZZXCefTA9+Pt0GLVzuGT0up1J7FFI7tYh?=
 =?us-ascii?Q?7fMi9KEiss2y/qlxeVDf8oBh2HmuCrMRsvcLuX+07QBaBUlow8/O4oSKP0rk?=
 =?us-ascii?Q?VrAfOgeLI9H0FEVqtgZAc+3ji9d0Q9OWbBA2knfM2QyvuSO6pRWX41maL3rc?=
 =?us-ascii?Q?3RP933oYZg1b8/XncsC9c1/Ki1PPAUPA20DGm02lj70SVes7uOf6XowJIOTl?=
 =?us-ascii?Q?crUwGuBjvBiYab4EcVeQzlxt3S2NZRBKVJOwv22ob8wH5pECWkwLnPucGFcf?=
 =?us-ascii?Q?DgDYS2UQsQ/20/BeRFkynAEnMSorydEDEqFMExRmRAPGGnEEf3tQMaqrHn5x?=
 =?us-ascii?Q?FRWhUqgn3RVzfiFlp5xHKC3P211qZWw8HUtXttPH1NXw1xXgBXUjF2ns7od3?=
 =?us-ascii?Q?bMd+A78gHZ83pyrr93Ia+ua4hM8NXTJ2o+LPK1GQTR7ZkYHSjM8fhKQorLrR?=
 =?us-ascii?Q?2FGrkEB3aV7AF0tvfmo8pMsMFsJWjyVQ29i0VLHrp2XyCh8VdBX/6/kKPukU?=
 =?us-ascii?Q?6OuwZy9owePv3I/E8K/692DKlWbm1QNtQvUviBEVFdIkaiaoxehA3f9NKNox?=
 =?us-ascii?Q?NvBu753O4KKzE1gyqEvO8D+5erzsW/F15+V/Geo3nTmFnogWoUM1/++T7QUE?=
 =?us-ascii?Q?nowypkeqQbF2gDHGxSZeTQxlfrSDXJKsO4Xac9eTCe2v9roaBHVmQlX+17Rf?=
 =?us-ascii?Q?0879FMD9Rw1c/T6bc8Vdn6Fr5sj0kzcuSTQn/AyofVk7jvK9Y/1YE/6Tf5ZZ?=
 =?us-ascii?Q?7OiWny9TQ4YqBJ3f/UsSasuHVBm2/ZSilowlOs84Za3JzH9EVrwTu55D8XF+?=
 =?us-ascii?Q?XtKBWJsRn1r8rp/6iHqmNiZ1H7IZwj6vf8hAsVug94t/JwXCp2FX/f8eZchv?=
 =?us-ascii?Q?zbLcUlq3rzpj9saVPqz0T/9Hf3VIgnVIlUL3OHtUsRNkHkeIDHMaVGIs0++5?=
 =?us-ascii?Q?+ekAmAh33TTM1KRoUHAyqUqt2Pn23EuwDvU5HgFkGDxEfM0uujDxWycsvIPg?=
 =?us-ascii?Q?qaA6m7iBORHoL4Bkt4pWpfj8xRyjK/dooeKrXPGZLgp+/BFkN5d87pCOqupd?=
 =?us-ascii?Q?cmsC/rFzZAb8pXiQMer0V6kkpZoSI8Y=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba646295-c8db-4fc2-73e8-08de41f1624d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7599.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 07:03:32.5983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0NCuYVDBAEbjuyp/QV7nmm0Emglc/nfgMSJsbdNiCVQ7ZkXGw485o78RJRUmJDvIiBttOFgj1B6MiCINfgzzMBcleMgo155JEiNjlBMpOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6950
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: LPfrIlFshFQiDLUvm3tmFjtG_IUQDs1z
X-Authority-Analysis: v=2.4 cv=I6Fohdgg c=1 sm=1 tr=0 ts=694a3ec6 cx=c_pps
 a=mGKQszq4vdWEHw2ByKFqMg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=cGBbg9qyOBkjoRYc1MYA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 56OVnM-KXQ7RDhOTID5VYbx4fqg5VyPf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA1OCBTYWx0ZWRfX/vqtjo5bdNls
 g1ron1+xjaL0g1byfB1GIbYi68mVDS6jwv9U2RdxchJw/w1dkKOybCtWLxwm/nL3AcmnXmxgiNV
 wmt+ZVC52VYGrnQqGAAZtPDla2oaFI8YGBrqKdE09CareTI/dtAyMhYpw4vn/z4zbpDzLXLbBwd
 d7wyYkhTCK61qNlY7BPXQzSU02npWEqdHJ6d0M4JCqdUu4hDR+qBsMey7bZ3Uz9inmRRxLofADw
 FeZEQ8ihIZT6+fUWbvFORBdVFyLLA+26QI7HGXAHOsP2CgaSWx213nzSRvPFnZ5zHJdwp4Ps9gs
 7fgseAkYi1l0DN4lTLmhSKoUKMhELO911IQczEw41LLiSnxL8uyyxgQCUVcGsNH1Rb/yiFLhNBX
 HLHbg13KVDpDwS8tYEwY4UMnV6/a8B72H1r6UHNbxr0bpLEMenYSZaS7MIWFUfpzB5q5oygwrI4
 9ycECIh1CRzuUqrFjYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 07:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228451

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
 .../binutils/binutils-2.45.inc                |  1 +
 .../binutils/0020-CVE-2025-11840.patch        | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2025-11840.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 9ae0e72e60..16a63cabc5 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -45,4 +45,5 @@ SRC_URI = "\
      file://CVE-2025-11495.patch \
      file://0018-CVE-2025-11494.patch \
      file://0019-CVE-2025-11839.patch \
+     file://0020-CVE-2025-11840.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-11840.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-11840.patch
new file mode 100644
index 0000000000..3fb4db880e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-11840.patch
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


