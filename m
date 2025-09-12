Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D976CAC592
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 03:33:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7391.1757648021514857312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 20:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=c3FkpYcL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1350ab43ad=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C2Zg2L247567
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 03:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=sVVhunFtvsj3F/dMlEZvxu4eNO5U1U7j7oSobsvG++I=; b=c3FkpYcLrU9x
	yqQo+GHgvAXh26J7rngmMNLyH85AqQMDo6S11TbrMi15PN61ulq7RM5l48nXWT+G
	X1bv+QKpbh8FsXRTLbu8wtK4BY4Bs9ININYpD3c8MjAUNciZEk85qv5QyD7Scb5K
	a5yChP37FdEOpySuMIU3o+Hbk/oKI2TuVhcL80JtUwj5nBKs6CXO/fqC3J53gpBW
	0Du5u7/Rsb0+KcVHM1FdgoxE0kmDrAbfcQTiP/NYG+19GKW8FOl5LVPX26DdkXyc
	P4UPo5cU3yErgYYfo8J0Ef1U3c4D2O5PUSra1lgZRly8bxPQFQksIetfdGWEzPCv
	ZZnyrNmwew==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 491ve35ckt-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 03:33:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J06tx/VTzU02b0/8Q+e3A0/HJHsRdZu/HOQ3IM8I9CsCoNd0Uxm50IwSpiDkEGObgTDfXzg5d/izzq/AR4RN8NkgGidEbDNFkKg11Cj8njt1aPOGjuMxBdLCUKQnfZInH0F/HKoecXJmAPcW+27UEpWkiy6zKIP/Z0U42F0zz8K0g/NSK7Tlt7oartmEW72G2Q0OTL4eZGnrTKnb4y+4bCINcKyVfiPOT94kw2WimERLZ7AIBAmY8AlHK6EbyQSCig3c9rZdk3CdZl+Zz5nG6ztPlLOKZuzQ/4BI4M8W/SZhQ1V9WXNP/gZxIVff54bjYRMiZo08zkYIcYe+VbreaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVVhunFtvsj3F/dMlEZvxu4eNO5U1U7j7oSobsvG++I=;
 b=yYOJ5w+Tisx5IRRqTEG8NItV/YXDIlM2DNjZXO4dL69Wf6OaPDxD+oLtpMAGGZYlO7OABna9LQ7I/+GnGECd12CM3Caks65O7wvgTYYylZji9hEmgigPjos0lFTVTcJGXA/U4HBEPgLKhbHdMDvMLNHstljlEMnNrLCfNapb3Hk+a60kZEkAjZ7E2HhocZgZInkSv+Dd5hLRoI5Klw8P2CAbAxVj8Flg3+1+WY29vSfCYE9g/rQdT6RgijPoHKu8yLnACKaV4TAUGGidFnfcJ2XAzRI0/b/gRhmLS7B7cKvpGGxGaKGwvrqPb87k5pL/pN/MWnWHHkYPPHXQwZGbAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA3PR11MB9376.namprd11.prod.outlook.com (2603:10b6:208:570::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 03:33:38 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 03:33:38 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/4] package_manager/rpm: give out useful reason about unmatched packages
Date: Thu, 11 Sep 2025 20:33:23 -0700
Message-ID: <20250912033325.2887890-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250912033325.2887890-1-Qi.Chen@windriver.com>
References: <20250912033325.2887890-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:a03:331::26) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA3PR11MB9376:EE_
X-MS-Office365-Filtering-Correlation-Id: a12d1f27-cf64-4591-1929-08ddf1ad2909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VRS0UADdNRaYRYoO/99hR6HeZYH2uHq6nN2rDsx+mbar0gOgOrjTU0j8FiZt?=
 =?us-ascii?Q?nYLpCI26DmOwTS8jYXkF8xPBzzdWMVgIoyTiQjEJM1cx7ehKja5d8UH0Cm5V?=
 =?us-ascii?Q?47DvpIsuCH3ybjo/yaN3y8sg1HkZ+QI2Jddn2PdGdVDUNF+rCmVmciPF7dKd?=
 =?us-ascii?Q?hT74172PD9+82bnb3A4AN7MNws41mVsxh4lc+RoJ0ujfRI/N1x/SJ1Dji2tF?=
 =?us-ascii?Q?In8DM88+GbfTu9eHG/JOVsCUqNQmpTWWER3NarQ6M6G23LjRhuQZY5HJQX17?=
 =?us-ascii?Q?eJxrlAjnNy/mmrMjDkHjdfDJUzxe8SmCb/l4f9tNvQEe6iir5ZGznVOB4fTZ?=
 =?us-ascii?Q?c+Qncdlr2lRXkz1Tbevcrs0DfM5dQLpNn4f0iF/L7dhQ1uYjqfNyhpUUO6ei?=
 =?us-ascii?Q?iAlpJGY7hi2FMzVMTDvYmP5/xbsItfGvlg5qBiizsq9LAJVV/Lz2rfFEj119?=
 =?us-ascii?Q?40KmEA+xcpu/lQ+521dKPiSDwGgqLRcJPL/ANETd58XcrEH20OeOtYqsP4pY?=
 =?us-ascii?Q?blqSXGmn1m/vmn/S5QzXAXljqhgI3sDnb7MSlVFSCbqwWbg3hvveQfH0MHNe?=
 =?us-ascii?Q?QB8vUsbuTfu97l6MDnwvGIwgBoCUYGVia5M3MuMSDMqnMtVGvMaGvXCEbVL1?=
 =?us-ascii?Q?yajN1IN+jQCOeSw+Pnre0r+XhazmBkmshvz5BSU/SzOqSSE4mhIzSfq/84hv?=
 =?us-ascii?Q?tq1ycHXSE886F4stUgeqFgdouFtws1xyqXmteIpDUbRjtjTyy9fE/imnVnC+?=
 =?us-ascii?Q?Fdzv+C9qhhSleRneofImfTVTW3SuGYe13enIo4lq3vKD3Hl7q6Vn63K8PDc3?=
 =?us-ascii?Q?y4UZ+4YdiDTtGh7JaiOx1ey36woestvTiOmUMyjL1aTbj+Yk5lvwIbCLGTQF?=
 =?us-ascii?Q?OPLFAM69wuQcXyCcGoheLWuHbPRstr1MrGKx8yKTPS44NyIFCfRk/SvRQkNR?=
 =?us-ascii?Q?ZLvtBT2/PF4WwLkdf0UYoxLO+n65uojzXUPPFnWerzLbLqyeTehOzNOFQjdF?=
 =?us-ascii?Q?x1tjUojsaW9JeVxyy4e9exYJFkRIqMY7gh2DC85NSy5z7lUN6AtdHCBrZzkM?=
 =?us-ascii?Q?njO40mUe2btV1tNDQm0PTjNlhjT6kzQvdnTBsyK7w2OILaFVdBz9xAd6SvTg?=
 =?us-ascii?Q?or/m4vR+9Q4CnXxHY96afdHgTI603qFqdHi8kYJ/Q/PFnI2/VarDnaszuChD?=
 =?us-ascii?Q?zCUMCUrHP5AIdWbN6/5VVh0YJ80rvmcdoJslvXioAKAVjpOCTZENz+fWNHhQ?=
 =?us-ascii?Q?EerAFmQzFtzh7xgVxJ4kTrYSXTbdUM7OJknzVoC/Anu7wHVKOYPEC6zD/NnC?=
 =?us-ascii?Q?VeaJWTviL7ap2ZloIoPbE/sJ8Gzw4nnwx785UpuCNjLj66G07c4cJcysnUWw?=
 =?us-ascii?Q?qgXq/Km14BVshXKBnqbi6z7Z8103bOWrm8538s3LSN+P4Nm04+xGJALkB2cU?=
 =?us-ascii?Q?UoFPPwxsXi8cWwYpSy/ne+IXDHMyrhqZ5hlVUv0vJIKfAvECtc4oHg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Izo8r0E7QOiaTVzceomCJGhxLR6xkIYZbZVpdmCVgcou+Wyypzuw8/GqSq8/?=
 =?us-ascii?Q?ObOd8UY3FagoaZN78Z8eIY+WPpuIA5gwrN55ejjioVD7DHXQ3LQe/At7wADF?=
 =?us-ascii?Q?UFjKuv4cBG+J5wDpeFVNTBuGfQDTb9XVBMrWM0snqFBvICqECoV5yVyf7Bf7?=
 =?us-ascii?Q?Nulyu8h+xJPMu9CbAX6rDJb7cGEawLzZvrVxKsZB0a0iRAYWbzfmGd6LnFoL?=
 =?us-ascii?Q?NRFi47bw0QwxiltQ92XXs0QXQw2HhRwTPDYQZmdSPWLlsy2NnDn5KPF1KeHE?=
 =?us-ascii?Q?011oEbsitd4LXaKSEsg0jgHNXWYDZ8EUJ3MFi1lQndNrCoGLtAw7LXXLhWj8?=
 =?us-ascii?Q?D0RB1Dze0MnOgRFmg8IYayAz2eyP4LBRsWqEs8hZpNASr/3vpM1IPC40shfu?=
 =?us-ascii?Q?WCMSgLu3QcRWHw0IYofK5JRQPN1iRCRU6RRdbyvogFi+zFJYfuKtlxAbbTCb?=
 =?us-ascii?Q?e00uKCzE6r2zXNZtnNFRDWqpfA7lOAfPIYQBV/Tl5H0zUylVJCzp9PP6f0Hi?=
 =?us-ascii?Q?5vrPq/CVkg1Pk2rb+tBKFXOus3EkvYij/OvaiEzkrEQr9pvHjMLNImfPd6vR?=
 =?us-ascii?Q?iBBpnIbJhtYjqHDwVpo1FSaYURNrIzq0U9jzNM6b1nc8JypyBOCTfZeTHHjl?=
 =?us-ascii?Q?kSHEVuz+4aAYqEXFpzpXrI8Tuy3hV4SpRI719xMXeHgNZqvrhcpiqq1xjc29?=
 =?us-ascii?Q?+U3epDT5yyt5K9Nlt3aF00iErGqmQ82qrtiTRqlfLCVDfdA2HExbtvbRi6cL?=
 =?us-ascii?Q?vpT1fO/jZquLo0eI3UdxDxMjef+y21/q1TrDMEO/Non9YfSRz63b+oL+RozS?=
 =?us-ascii?Q?r/P4L6vVpD2fNhjTTfbbXE9oSTfG1vEvnQTuVwDIn8MEwCM2yT8bYcBbphWA?=
 =?us-ascii?Q?lIACb0bGQLF/budjWUAeU5IqCm0t868mDMEiWB0z+g3S/Q1mKJbQXTj9pnTX?=
 =?us-ascii?Q?o7NBtMeN5uwWXOtwYWKC4xpDA2ywlTT5626r8cyqt59zifGG8UIdeVnIi+gC?=
 =?us-ascii?Q?F2HjWIj1J0ZHjzCO873s4Env+/SN9d+p2JAD9llrrSh53dvbPqnFt3IPYcAt?=
 =?us-ascii?Q?6WzMrPaqiaCyURAoQVTQFUwNllgOyGoG8spwcKCIVaFubLbk2Qp1h7b2KpWo?=
 =?us-ascii?Q?cTnvwUpCvdC+pJ+PE1gZ+M6ELuFEJE6mx6sZySr1x8XqjGU6ZawRS4BL05gB?=
 =?us-ascii?Q?/pMCBM7UlnUWkBYv6RNEc91pcUIOLMHALQEDqvfwbKVD2KdTnvBwY8lUJula?=
 =?us-ascii?Q?1I1P21YwCtq0I8nXjFoxWrPaHBY71wBGb08fny7OU3enC+B4R0l8ej5FpHUP?=
 =?us-ascii?Q?0YnZIvOil7JuNNHpvrUzovkNPxKRWc6b+t0G7uf7eMwpaZeGoMsQGa/W0hiR?=
 =?us-ascii?Q?fSdXUIff0yzlhIUzwemXhOaSCnOAuTKp4kKqNXruMSR4FBVnYqLxaQ1TwJDV?=
 =?us-ascii?Q?QLdkWeZluVvlr+CFyskbCCpomv0da2SwVAIpAiNJ7nrg6NS3P0iIeVwQgVEy?=
 =?us-ascii?Q?a+PNKwiTHhJcCf73XQqic9VFu/nlZduv9MVgr6y0BMgha2vCFu06GjZ8yKDH?=
 =?us-ascii?Q?oXJxah0MYmpHzY2sYE46rqwhMh+7QO6WK+eWZhOetbmhZPtVFt5OQKcJNJYt?=
 =?us-ascii?Q?Cw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a12d1f27-cf64-4591-1929-08ddf1ad2909
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 03:33:38.1385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTHV5sDqcUwoy5RNAnNMcxgk8pvrcEgsxdI+VSswfpvXEo8PpgWbkKk5Cqe2EflgjNBf/IQK5bahPgh0k4K7CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9376
X-Proofpoint-GUID: sORRXnfK-QAUnrn1_oCklD3HnQyUw_aA
X-Authority-Analysis: v=2.4 cv=U4mSDfru c=1 sm=1 tr=0 ts=68c39494 cx=c_pps
 a=QqSBEdqS7BUxypinyQlWrQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=7CpQ28xfwMhiR0_kpb8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: sORRXnfK-QAUnrn1_oCklD3HnQyUw_aA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDAzMyBTYWx0ZWRfXw9w59Qe7dAXG
 4sSlRq3bEp1Ep2XzmpKGn69E79Ph66MeU20czPyJeClHN3ngTed0BfHZskT5f0W8ne55bLzTKFL
 gRGeOQZmZoj+kxKxMAF0+UCax7aSFnh38en6g6fDvDys4dU8yYjMeZRFn+/9vBPv8Vz1eyby612
 DuyJz8b/XVBJUu7qkabDRS66KCyH54wPjs9zY6euvbHyo0xXpl+EA1NSp25VrPLkchri/xqcNib
 nLNwTmkYPt0Lx1XnQsUy2yl+ASBpj+J3m09o8ANLEPEmuRhdKlye0cc4Lo9QOhugWROpWevluJq
 V4jWfH7kOiTUSJfTrW9ekGXm91V/MOjcdU3BBlua1Br0PA674f52I0O5W4orD8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 03:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223301

From: Chen Qi <Qi.Chen@windriver.com>

Unmatched package error is a common error at rootfs. We want to give
out more useful information to user.

Before this change, if some user specifiy IMAGE_INSTALL += "catch2",
the error message will be like:

  No match for argument: catch2
  Error: Unable to find a match: catch2

With this patch, the error message will be like:

  No match for argument: catch2
  Error: Unable to find a match: catch2
  catch2 is a recipe. Its generated packages are: ['catch2-src', 'catch2-dbg', 'catch2-staticdev', 'catch2-dev', 'catch2-doc']
  Either specify a generated package or set ALLOW_EMPTY:${PN} = "1" in catch2 recipe

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/package_manager/rpm/__init__.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index 323ec5008f..20e6cb8744 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -330,8 +330,15 @@ class RpmPM(PackageManager):
             return output
         except subprocess.CalledProcessError as e:
             if print_output:
+                e_output = e.output.decode("utf-8")
+                extra_info = ""
+                if "install" in dnf_args:
+                    if "Error: Unable to find a match:" in e_output:
+                        no_match_pkgs = re.search(r'Error: Unable to find a match: ([a-z0-9+\-\._\s]+)', e_output).group(1).split()
+                        for pkg in no_match_pkgs:
+                            extra_info += self.get_missing_pkg_reason(pkg)
                 (bb.note, bb.fatal)[fatal]("Could not invoke dnf. Command "
-                     "'%s' returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+                     "'%s' returned %d:\n%s%s" % (' '.join(cmd), e.returncode, e_output, extra_info))
             else:
                 (bb.note, bb.fatal)[fatal]("Could not invoke dnf. Command "
                      "'%s' returned %d:" % (' '.join(cmd), e.returncode))
-- 
2.49.0


