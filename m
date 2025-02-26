Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BED6C021BF
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 12:14:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.246.1740549752713737982
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 22:02:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4152c34f3e=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q5MGJ2019894
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 22:02:32 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 451ptmgbh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 22:02:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bF4Gnp3f2el+uNcuo0vOUXToor1o3SmmixRCX29fsexBRUzFO8uurOIv9d3wcB6dHJxDtEzKnuC8mZovccfQyGN3TQ2jN14gd6+k/9sROHb+1sKB9Yu/DUE98YKfJKyba7pjqfiAqNRGkvPCM/wstPvwyo20um35mV6/qizNTpAUWg29qw6P2cH6CewpYwNxFd90IYDk6azBXj3XHh08DUTf/hgW4i/z5c/CVdW5fMVpWPAiR/v6dSUJIB/E8vDig5t3EgEGoCswRgJ1Tg3c03cDdRvZf3Exh0p/jom36BT5DKqHkn9SpVzGqJocyIwKXYii8s76cBq0NsRi8s87hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQm8Xc88PkfK7w391Ol7GmAN5C25dlBTiIDvXejEcno=;
 b=LO00r5PWh6nLq4mrYxZoJ5z1rGUXnhMCVBOQgUHxmfAnUf1g1brB1UMB3QV32w/e+2PGejZjx+x7Xk8Ux+eVs8YfAPEGcB569x2PBn+jOA4AAypDjVpHAhdcyIJpZPQ8kS90y84X0zqCuYCgawyt3gaIFxCzJSYcjekB3o5czfZQtODGmcEb7IYts6H7FnK/KcEP5YNbYNTRXhooii0TpERPL6IUQUh+sxDTRbtDBJbRIZ4drtY0QilHjWaYqk7ibAbDLbUED98SAdoO4XqbVuMfm9EHMmUQ/SQD72iUIPt/EBhzXmcvrlS+pqyN1yR/lIvRpujlx5AinaKiTefIQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from DM4PR11MB5359.namprd11.prod.outlook.com (2603:10b6:5:396::21)
 by PH7PR11MB8275.namprd11.prod.outlook.com (2603:10b6:510:1ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 06:02:29 +0000
Received: from DM4PR11MB5359.namprd11.prod.outlook.com
 ([fe80::5647:d88b:4841:5f90]) by DM4PR11MB5359.namprd11.prod.outlook.com
 ([fe80::5647:d88b:4841:5f90%4]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 06:02:28 +0000
From: libo.chen.cn@eng.windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] boost: fix do_fetch error
Date: Wed, 26 Feb 2025 14:01:48 +0800
Message-Id: <20250226060148.133937-1-libo.chen.cn@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SI2P153CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::21) To DM4PR11MB5359.namprd11.prod.outlook.com
 (2603:10b6:5:396::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5359:EE_|PH7PR11MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: 6309a3bd-cf8b-42d4-577a-08dd562b2675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tXZOA5GSl9tKDAN50lMXplL8yqxGYhVXMxWGepmqti/Jz4JabuaFj1PJYpN5?=
 =?us-ascii?Q?yf68H0vxtEmQl1OytpGVIdtZKYYTCLR0qiGlcuj9v6trKlUZ0LMy1HjVwb0x?=
 =?us-ascii?Q?sVYpNTIxASDURdanrfBa8HCxJyib4lBrP9Qi7kK46ovswtoL8Djtrd128Ukm?=
 =?us-ascii?Q?njdm+jGo8wqRFq5VcMuc5jhfKr4uFMykrqH9233sogbZH2eXSJqV+eF/1kbz?=
 =?us-ascii?Q?f9xARAnwNVqRXadP25W8XxinePc6vko5+tNv00RQJ4DPfpYfx03YZhvwM3T0?=
 =?us-ascii?Q?6Tg9znudAnYuEoQ/5uu6i/wtmhm0ZHwQhHsa5JqSMmHlNpGV1oyLnOXZUhqf?=
 =?us-ascii?Q?EvwROEYph8f3F5+MKQRJqvESuzeKWF5Bg79Fth+qkWdKUKkj8UG8Z2YCYyLJ?=
 =?us-ascii?Q?f8C1+9O9XSF8CItLm61NdbRJD3LkETxz6FAezkLaEC6ijwZTaHReRPLBD8hH?=
 =?us-ascii?Q?/UTfbRUZVKa7bJmu+CS460fkGlQOBDYUs+NQMwjwB0ylN34/CFsgCGh97jv+?=
 =?us-ascii?Q?crs9RYnNlIjFxuWIq3yB3Teqq31N4s0os2brB3WjrHSXVvDw0iROGCPiNKmp?=
 =?us-ascii?Q?fUx5CSPI6ScBvVV3bh2sBJvdxzsrUb9FdlY9uWmNLK8aMVMfGHTLRl4ZsONE?=
 =?us-ascii?Q?4C3luZgoOKGmGIEc+vbzCyx7ILNMkKQscmm3hK7fZVf5//3gVreUFajImGHS?=
 =?us-ascii?Q?/jlrmHAXjOMXeALx5LrjpWyuPHHw4vd1ST/FPOxjbfvhNGmJnEWViZcyxTZu?=
 =?us-ascii?Q?9hm9QOGMVDo/BhtAKD7IieZwpDiGSfwfHaWnWDlPBSZAfBX9ihOXXaKFaAYm?=
 =?us-ascii?Q?eXBLBSyew0B92OuYc+tL6fOqlcZQCXZFFPBEN8KvVoBJQMEiIuYNdzPYwMk3?=
 =?us-ascii?Q?K2oMargUNVb4Q8XgqGsdepEgCO94rtN/IqHKDJ3dnbmqsLXt/W2gypcOZ5Js?=
 =?us-ascii?Q?a+5QykyusvIjj7sgk+/+bDIoUhREldPMryu1DyerPLhOMTf+Hj26YZCkfUnY?=
 =?us-ascii?Q?fSI17zlnJjmP2Ye8faJI1a5kDQlp4/R1AWCCwC+PqQMK3mQAmngssS9nHzqK?=
 =?us-ascii?Q?wjf6w0VpxSYQRVLt2rh+TwgaTracJS/6E/7sa89peTKieVl25Vz9GSf0GXlF?=
 =?us-ascii?Q?KrE0PRRzR+Z1vFJBzIlwLYCrK7PKRozI76ashZ1BIV+Q9m1ILKGkwQy1MjQw?=
 =?us-ascii?Q?/YObk1qGMsWOfwXsSuEN+/cnpmYdrRAnYCqN20jAeZHAEsJ+9aIjL28m8A7z?=
 =?us-ascii?Q?IVDUlvIoty/y18lArak/x3Q4vCbn7xlwtQTFKoxGFPrjd/mvaeDWp4fnexKU?=
 =?us-ascii?Q?R105632UZGa8B9rwNVl10FlkaiQq8Jxpzr5v0L9uB3vE3yoGxp2wDAJSx6z1?=
 =?us-ascii?Q?pnq+NGAnTCZsOrFYAZmdSQGavlxu?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5359.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xMtujrCnIBPOO6QK+ksZXCDFtdLkDr9fwZaVNyMpL53/NcEsrt6XXN+jUcJR?=
 =?us-ascii?Q?yzm751geWpi4MtQWLWuKFVcEt//pNrYldXg+XbmjOW81MNFf0zs0ppTQ918X?=
 =?us-ascii?Q?rDDRjFlU53h/dRLiLqZlX1020BopbpgOCFelO/NHeZO2hYPo+QAVjb+dllKo?=
 =?us-ascii?Q?8ER8lS6nxhKV8y7hrB614Y0lZK+60JP3vywu1pD2ia/t3SiW5CjjQrDd6Av8?=
 =?us-ascii?Q?C12LLG+3Fx59f3SrnsPQTIcPd2ckn99mBmHKTQvlb5iJtf5fx5PA87McdA2/?=
 =?us-ascii?Q?EIF0UN/tZmgQDU4vsscDfp0A5aCvHGxyVZOoaISLyrtvSGddZTtT2EAwcQTI?=
 =?us-ascii?Q?k3XDjlJN3/E+7qKD5JH56EjBusz6HN6wX0/xsjTK4a5ij/J3ij1mCeV0Y3xI?=
 =?us-ascii?Q?2AaFWMeAyPO1mQ2JyXrs6RE3FCpWXiqLbzkqgO8gZHhGamqZNhGuv+6pfNHe?=
 =?us-ascii?Q?arbPpf+OzJawYoiTXMhyvAlp96hclziW/dehPTBttrA+GYMaeZn+ACV8BGwz?=
 =?us-ascii?Q?yE43slt/qL2JEzdZhaVGWuYJPgqeiKsWHM9fjSUWLCVg4X2E9Yww4QTSzEyp?=
 =?us-ascii?Q?JZea9hUIO5sakXnf4GY++NG1Sn4NyHb3dFQw2q2hjyDyPunFqiG7WeMxtjbz?=
 =?us-ascii?Q?9vpX9Ic9myHzhGzGgYJmOv31nDKn6eHDEQf9QVlInl/uVfxBtm68jW46Yzb0?=
 =?us-ascii?Q?Wv5ghiQ1DrAn8MeVwTMUzJ30Odx+fU5ybQkcwJJz5j0veMDq5EkLSnaXgjVw?=
 =?us-ascii?Q?CoQpCjdKO1lpdVqC7b4hm+GuxfFvVEyo7uvGeBA1twbPARv83Csfo27MISpX?=
 =?us-ascii?Q?fpEgKzStwZ6EvPX1FIBQomalKQthyCxB7Wt2mGqGglV5Ie024iW5G3+ADP1d?=
 =?us-ascii?Q?kibMC3pHnt871hoiujVHQ/EFUZkmzPXVNLGt0W2F4c37JnHy+z0EY0oihwjj?=
 =?us-ascii?Q?TdRyrx0BjLU4JmInr7h9mbvuOzmCcySo6yy8EbkF3LG7Lnm8CzxgOQTRItSg?=
 =?us-ascii?Q?1jyNZ9/uchkVI/HKCxL+SWKJGvOkc0PMp6vTPoxVQEYO44j3h4U7qNE618Zk?=
 =?us-ascii?Q?PLUk8euYMNK8s8OPEaSILpIXsee6tkCS6KvviZxIo8ZVh2ErDXhy8P8urPLj?=
 =?us-ascii?Q?VKkIdbpsEMTBL431vF5JxY6xZ5Kt+mh5PyVcMqJg56NFAwpEQD5xIyLPBwAX?=
 =?us-ascii?Q?kDqrFTsD4Sn6aqeNmQV/v2sQz8Jvav/NyuU4r6barVLFGVK8Bk2bVC0U1fqc?=
 =?us-ascii?Q?oLdNkHE4ZUq35GOAwV7VVRkyAvam0HTTJxC1+c132NHQxNceoZEKF6gbhz70?=
 =?us-ascii?Q?bz7wDynCQ+e5gX1TO50M2fvXKD5RIl+J4gZI8l99om9Z1rD4Q/S3b+lrYxX3?=
 =?us-ascii?Q?/9s2oOokJkt1zUkxESx7r97LPF0gZGZBOsQAe+nCLFyGk0qnhdP5mY9cs6Xr?=
 =?us-ascii?Q?mdWGEzbLNMRNGPKkBPEmmt87sOTqHd8RwaQXskZSfO2KtCNpBKgDko0TviKk?=
 =?us-ascii?Q?FiA9EFeMo2204K841ut7SUeM2cFL8iEOzFutsvGiDgCCoCp2HO1IEni0Fi7z?=
 =?us-ascii?Q?0VT8zKu+PkKHco36Xq9Akhto5bWz7JSCxehn2UgArsgKPmWHh3nUPSR4YCVr?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6309a3bd-cf8b-42d4-577a-08dd562b2675
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5359.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 06:02:28.7342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uFgRVXoT0Q8OysehdtSDzTObMHUefZj9xGAe4rS+OBVH6F4qZtIrUOJKyvQbwkSJnp345C8f5L8pktfL7hEosqcN6kOO1xxwL6dymIDSu6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8275
X-Proofpoint-ORIG-GUID: xfB-U4cVeQi9EYwOhpCI4dXxMIAyRCK7
X-Authority-Analysis: v=2.4 cv=UK8nHDfy c=1 sm=1 tr=0 ts=67beae78 cx=c_pps a=AuG0SFjpmAmqNFFXyzUckA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=ovJmrJClAAAA:8 a=gvic6WYWAAAA:8
 a=AIPdC31oAAAA:8 a=bLZqKDXHAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=qGZC1g6ORkK1xQXCNfoA:9 a=brTEhlvMp4NY0_u118I2:22 a=PupUpSa0FqD61Tkl4dNl:22 a=5478VIVnyzLWgM9zoUhq:22 a=SM0NOtVXJcAQk9PFKD3C:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-GUID: xfB-U4cVeQi9EYwOhpCI4dXxMIAyRCK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=944 spamscore=0 bulkscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502260046
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 12:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211953

From: Jiaying Song <jsong-cn@ala-lpggp7.wrs.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: boost-native-1.86.0-r0 do_fetch: Checksum failure encountered with download of https://boostorg.jfrog.io/artifactory/main/release/1.86.0/source/boost_1_86_0.tar.bz2 - will attempt other sources if available

Signed-off-by: Jiaying Song <jsong-cn@ala-lpggp7.wrs.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

backport to kirkstone.
Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 meta/recipes-support/boost/boost-1.78.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost-1.78.0.inc b/meta/recipes-support/boost/boost-1.78.0.inc
index 729a47b54f..98f4f7ff30 100644
--- a/meta/recipes-support/boost/boost-1.78.0.inc
+++ b/meta/recipes-support/boost/boost-1.78.0.inc
@@ -11,7 +11,7 @@ BOOST_VER = "${@"_".join(d.getVar("PV").split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
+SRC_URI = "https://archives.boost.io/release/${PV}/source/${BOOST_P}.tar.bz2"
 SRC_URI[sha256sum] = "8681f175d4bdb26c52222665793eef08490d7758529330f98d3b29dd0735bccc"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
-- 
2.25.1


