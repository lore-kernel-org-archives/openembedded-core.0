Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE93C5DF7B
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:11:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19454.1786921884862531200
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=f6VDrIhb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26887e2f0c=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GNBNsj769720
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=; b=
	f6VDrIhbViR9haYzxqQId1xNlxjp2zRxqn8rtmcBhFOAJL8dde2DGw0LdvJFJVcq
	qGRbdWrvEAuY1Qdcq1BZDHOEsuxtPqM8bgT0/bwUY8QYHEpeRsr+PlNUnikHjIbG
	jzqnPmNNrZ44Hu4VlWtrBu2iIIGJT2A8Na2egD8bB/I/8FCpMgCRivNTZvmhQTZ1
	bdlOx2xT81iQPR4d1ksW4U9A265weLG65G2fSZKqKH6YmiTjPHHaygqPlpU2oyT2
	jVWYUiH0LrHRb5MahpIPm1YNnG73iht87ElgiGgYn4gcOVtTN6yC9yCu2meudq4h
	irHCZJic+AxF/46BVuFLzw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023092.outbound.protection.outlook.com [40.107.201.92])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g2f33ss4k-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 16 Aug 2026 23:11:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oC/9tfVnD2xe/CWycOmbB6iaa+YZAF0EyU1UsaVfmeCtpPAl/1JfyRVrZzz2GOPiGU0PoDi7LVQ5zstff6mvi6IdKC672soaaZbrTB+7B3HV4oVFMvRo/jxZ1b8NoJaxt/sDy4SWkdMlgKveIaFUKRG9ujAtQyAErtXRhK0d4Farhrxpe5bLp/gwGbpXyGbYNiFQXClzoSQlm0pstSm2ryqfeXpoPG5AGGGUuYjHPRMLIqTi2UBVrdnY9NBLt5QO/0mhHVVKfZe6RCI0GkERw0r4TvFYg/b3Ij+jxX4uYfadKpluH/wNEQ67tmARJpnO1rOJjLcu1jRSe1d007McGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=;
 b=cOKFldJRqA8+0ra35/F54hA/rt6am5+R9mm1cP3pjiWIDwODuC3AlY8ExZ6FaDOc0p1i7lG/7DX3wrnoVVACq56nM1JH5y8EKDWdGVragYguWtBhed37ePJupu+6qbhoPpvp0fmxD/yfGv44JV9ss2y7yBhGShYglCUsTubup6NjlNDWLa7cttAX/HLDfsVkx+RZpnj6Hz4H/xvZoePWIT/Ai1LlHX/G3cM62Nv+RajCSPvbMMtGox12erygE/1KuXjBO/slL3gfeWdPLx/RB3pnhVQTRAQd4TmKPIkewRsnaOoqpT9RRcSh4VbFtLhl9zJwj/QvBAt8cq+SBr0cuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA3PR11MB9158.namprd11.prod.outlook.com (2603:10b6:208:57d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 23:11:21 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0315.014; Sun, 16 Aug 2026
 23:11:21 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v15 02/12] package_rpm.bbclass: Define _lib and _libdir for rpmbuild
Date: Sun, 16 Aug 2026 16:10:54 -0700
Message-ID: <20260816231104.3871015-3-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|IA3PR11MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: 7808d1f9-5d53-4d00-6a26-08defbebaf4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|23010399003|1800799024|376014|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	pFyDOhdBkAoGnMm0dTQ5yXmAKzXmdwFab789Vmcq4izi3DaZji0e1dqEBjL0ONP9j6mwfvDU8o4HziSOqKQ0J4sk0JyUeKucDDfeS1/vjKF3hlHtY+lsCcNj8HgT89A3G2I/RdrY9Jc4TTrryav+QZrpFnlyy3VAgiCqShZ9uptcjuaiIeOFyvvArAHcnDbMm3wnL3zPKpyR7Pc7JOw+b1tkJo455m24f1l3wiKrCnO0QMslU+q7pbUfiGmjO26m8udoSDL35+ZvDzaOgx4QTcui2JcN2M1QAeICJE8s2ORHzQDX0zuQlqaf+KdIvche8UV5bwqs6HvW9E+yc7B8mqkgcD9K5jwtYc60uV4Z7DnC5zYfDpQ3JpH3bzl/ecV28Yb2Do33Sfd77MUzZYGQM0/zooOn/WJI1LL0R58M4wR4XlBtfA6ZGffxo9RJd2myBu+OzzpmJU7AWNVh5+W09oeiK4Z6tfFCIvKRGtP3TkSrbiXJ3E4rVt+sai8kqqb3HyrGp/pJDcCIal/JGfsxZdImaR3mZjYaeWMZiU4A7c0vrxqLdwSgKRkCitdJ6DZb5nvUlJasuPTQa6L+tTkPGzCf+oMbbPRo1i8cAgR66tQE4fPuzBnw7iNXA1V7KOlMpbWxFheEmsmU+GH43RSKLotoQJKt92s/M+y+jJU+XxFz8ySsrvJNzw74oSn7xEjO6gf4NFlRItwidTBBexZkREPTiKtnz+xhzzML1NEx7ig=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(1800799024)(376014)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uTBrHh1KIF8my3xbn0JlWN1ruLwderNBa7tdmlAJlX9UvlojJMqVA2TjQ4+6?=
 =?us-ascii?Q?MKBUPDrhenZcDuSBUEkcpkfkwBTpCkHZY1bmLM7MEDfJGDwyhMJmaa2xqBmc?=
 =?us-ascii?Q?KoXNC/gm0cEEM2rxdZSjZWMid5YfYFXljTVhNI4DoOX3xlBboBH3QtuMBBZe?=
 =?us-ascii?Q?Yjnn3FeZgBZ9+cpP6LBaXFXMdI1IyimEJR5v397LSX5dbQ5b1hALyjCk1dnI?=
 =?us-ascii?Q?85C04EQgfCqMtsilAYMsaJ6mcpj6u5phA1x89zc/cfM1Vf0j8lB738N6DL93?=
 =?us-ascii?Q?iQ+gkXfHMa+qvpaJi0y4E7rWW4WvfXTUxmaBGc3/J1dmRHVIqW+IqUFJiHQ0?=
 =?us-ascii?Q?5XZqGzdGAY3SpmoQKpBdOaWgRQyqoouLStPNS/hBbPt7+LP1hGq1WEPLn/9n?=
 =?us-ascii?Q?2SkbpSM0uIx1qTSRv/hQ1t1igYdcJoIRG/bvWGGASQxC7ricLxV0NoT44T/j?=
 =?us-ascii?Q?oQYhkmLp0cyb3ntUASo52glxGyIN0euln05JexqAEnTO7nwWE1hFmWhBuNI1?=
 =?us-ascii?Q?Z5Jmr5O/SwYrL8cnAj0ojQ+dEU2Z0djYO2zXluhecpaneCxI9oCTD0gPwJf+?=
 =?us-ascii?Q?Y8UixpjU5+PEXiQ2OLVlKalhI6HmlLnq14Rqki8EP6ayoCF6SPtmw6i/iFfa?=
 =?us-ascii?Q?wh5UtMzjNYzzv0XTrdJhr/nXJFMS8gClMjFHvaVsLO7C0zCoFV3ZugW6FtXT?=
 =?us-ascii?Q?mcIpe6XtFK40c5lwq62l6GxIqN7Dmh5Je27QDO0Y2qEkniwOS9jaMryu33AK?=
 =?us-ascii?Q?+3GCtgLXoa6IgMSqBe7xC7x47P6LdpzTnUHKFAX1rqoqC+jw6pfGb4TpVc2A?=
 =?us-ascii?Q?yRp5gnMVwKkqwhrGOnFuiYpOMKXhDaw78j72MbAqvSPvAdw3imQKijEfA5gd?=
 =?us-ascii?Q?6Zpqg09zMxSWpRQls5qlphHQf2lqoQbKWNPypxFFTDuqIWPldqbW9c70s8St?=
 =?us-ascii?Q?6k4Y50BJGgXvcBIUs5oA3ASemxTyxrvns/vHNT1bAq0O1ihAjXfzO3iAtvOK?=
 =?us-ascii?Q?rkftxNoJokL+N4hvILXwpU6tcuIxnhcGtXst49o4F7IxHlzasTrMKFM8T+u9?=
 =?us-ascii?Q?KU1/uQf2gb4ERN4yaA45HH0VGaUf8KHfElrtFYjf5B6Sw42VxMoxu2pWlYXH?=
 =?us-ascii?Q?hbYFWYKZVYWq1ugro9P68vnCehwfx4Qnh4DYMMMJQrXu0Xdg9FiDYjla7dgn?=
 =?us-ascii?Q?WbRssM2bE255iM631zurnJlEXvgvfRerR7uQ5HJizAErTV78d/rYJP0nIYVD?=
 =?us-ascii?Q?8O0TtTw0jhmDUlAY0X8ZLaHG536m7hW1Nn6gbDEuUPSVe02mKe/MYCTIypD/?=
 =?us-ascii?Q?Fwau4urcxUd1j4X/8ZW/z/bgwGQRtiHy7jxmaA+ArptDF6/KVaCR6P7ervOK?=
 =?us-ascii?Q?Wf6rJpq1rWNha9lZYWdrngduE1f8Y0otbNIwVsboTl7Ysf+C0mDlGJg0i6mk?=
 =?us-ascii?Q?MnkXtCrpnSYvSTZry2G8Y5gsBAknMC/iJVxbeu/6ITXTa3zN3+UKQjJMgS/l?=
 =?us-ascii?Q?nd+xud5KkG1J/UVWUZrtIJJZL4Tt0/1v7lWUsn7fNrUDjf+PXwgS0dD9iUmT?=
 =?us-ascii?Q?ZUcug4Nbn/jHqI+6ZFqOpaXKCmozvl4OshMFTDMPG5jmgbIntXIOsvcZnK38?=
 =?us-ascii?Q?rujUKdexf66l+Eqfdwntb/JG8SLcuhe6Wu2C1RMvdPDXYHMocCNyh3cocf1X?=
 =?us-ascii?Q?zrP1hGMe6hokgxbGG/lHE1wvQJYOhY52L0h/UxEe49I3srQ7xBuriBIXuMKk?=
 =?us-ascii?Q?nJ5lecbL0LO7YG4zBSc0gej3vRrmK2s=3D?=
X-Exchange-RoutingPolicyChecked: 
	iGY+w/xinhQTZgAWFhzSuuJU4Sa2cNqenoNnLD07oLBlSr2IydT3/UV4NMrHKn89EtXq9pUKmDGafEnqiNWC7nOPX0mPLpJm0p1AoXfbXTWHFlmEl0FV2kT49FpIylNMwx/1VUaFl9XJFjxljCCYe1NJyhneCAUHeML+5xp5wJrphed+KO5EJ/lN/TNsQdmm18g1nz1XkpGafeM5dnE7j3i0ArSnrZN1seF6/OhZRkkoYbQUZJtycWo3axGHR8zT/yMEHtsxzjnUEdb1s50I8/VoM/Zv7p1AtQXvpK90i0lIQvjYrwEoaDiyjSs3NGvjWG+psc9P4fONRiWxGEpKtQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7808d1f9-5d53-4d00-6a26-08defbebaf4f
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 23:11:21.2540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GszC6xeevGqQXa7MBRumxGpis+o79z4iQaQ8THtFtIRiv93Q4mqvXPH/rLqFJ+kGuDIyeUdDHzJQ4yi/CS2FiJO0bHtVRjYNpCu5sKw6dFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9158
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfX2OVXRXosVimG
 A1yu+E8GSqki/Xo1WpfraCa68u69tj1zQc43RfG/7IL+iuSlGhOAJ/f9tnRSraRwQMGHGO+RPCS
 1GII7DDTuCqmNGJu8e+LUnBjGOCCgBEsqSyjWglYeZ0ksv6fFrTXCPOYJRVSY66qWsW8zhvYUfb
 LFEfhDIr6XwOPaEPV8S5vPlWPmqIDJZDcCPzoRn7UHFqZ8knCUR1yhZIu6Kny6HHXQusGJWTiYJ
 VQtyyrJaM/hAXvBWYhgUFdrwPn72AZYWjk8bIEYKk5pbqHs8pRsnuSRjmYE7BtxJVCob+yGKCuS
 8R1G8Eosrl7iRMh8Tc01c32HmDykGwzAlLIf5UaZx9tD7Q5Fr2kcjLorEBD32qQPNrsjpEYK2Gy
 0x1zlW3heKCCCIUm+yqkaqBugm+YY2IlpaqxAH8EsUHZrTmwlCYvI43bdAgQ98ok3yLTmqBh0XX
 +ILU1GSmz1Kconx6IzA==
X-Authority-Analysis: v=2.4 cv=JYuMa0KV c=1 sm=1 tr=0 ts=6a82439b cx=c_pps
 a=HDWlEWCLQVEuMJptrEg8xw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=uhQZ5Q_QBcnTBNJc4ooA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: MXI-IuzRirdFNGKE2S4IH-aWVZUor5J6
X-Proofpoint-GUID: 185FH2njD2IovBq4DYBKW2Jx-iBoQHYr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfX/rAGFF4We6S4
 bIjGPGXVO7z4QS7M+z7sRVOO2KdJTjrXt6un8ky9nxw4aTjT+HyOGa4SEYCIW377TpxXyqXZ5be
 O6hqyptfqHMxRgDGa49T2IkrqK92VM26Q98az4qFcWYYlJoFCiPI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243568

The rpmbuild is from rpm-native, the lib and _libdir may be
incorrect for target, for example:

* rpm 4.20.1:
  No pkg-config files can be found for qemux86-64 or qemuarm64

* rpm 6.0.2:
  - qemux86-64: The _lib is lib64, this is incorrect when multilib is not
                enabled, and _libdir is RECIPE_SYSROOT_NATIVE/usr/lib,this
                makes the pkg-config files can't be matched.

  - qemuarm64/qemux86: The _lib is lib64, this is incorrect, but _libdir is
               correct (/usr/lib), so the pkg-config files can be found,
               this also looks wild.

The rpmbuild is like cross build, define the values when run it can fix the
problems for rpm 6.0.2.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index f286d3a0e2..9af4cbdd94 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -585,6 +585,8 @@ python do_package_rpm () {
     cmd = rpmbuild
     cmd = cmd + " --noclean --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
+    cmd = cmd + " --define '_lib ${BASELIB}'"
+    cmd = cmd + " --define '_libdir ${libdir}'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"

