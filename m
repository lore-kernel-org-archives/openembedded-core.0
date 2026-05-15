Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D26CD4851
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 10:22:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31994.1778840522324913821
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 03:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TqCCyHrD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=959551ff5a=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F8BMie1873253
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 03:22:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=GzGPd5ntpX4rtvZKRMtq
	5eC43PFfI3hCng1CHx7FGvw=; b=TqCCyHrD4NrB/eay2dfOu/Y292FkXh2aU5ec
	v6zXLz8JGOYoQxLsJD6tVJFawJ8gEQWOKVyqOHTU1aGpVJK4kKcoxCMXr+H0hqhE
	Yo3qocyOGwQbxpNbN3CU/9/Oxh6Z1AeDefCUSkQn5mSaeMOwDBptchB22E0iQxXP
	3ZnC81jE3p2ax+sVvbQqjivJu+nfaTrEMo6iXcyDkVWwwU6GeBO0ZUoQiNTOOIfE
	cN9fJ817Lzg6/w9QtskOJ4N+jKtJeYGTEKClNRcQECJXRguJp5heTYO2tSud5sBt
	4nDBuRT6M4tRNYlzg77jnawLTcgqD7jizMIRKAXFjYrtlztvIg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011039.outbound.protection.outlook.com [52.101.52.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e5m688r9w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 03:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHXdekKIw+dw9goK+eSzjDAJm7iDh4UcaDQsAmwgVRWakVJgCOFmAnY4lQk2yFGsoNjYjwrPuchBtpLzG57bAKq4JLLYTwIsl8sPItUJMB/tQf9jQEcvjeLYLYLlDSWu21d6UWxckfI6FXZNOwDr/6ksgUmvup+XhhhsDD9kLLpr1JNor9ddUJHExbLOrbl5DNFdvxSE4mCGkZv/bah7ncM3CFHhx3RXeuRrtYPg0IwIs9oN4CbyBaRThTBNcTCGNTGPTsdmSL1I8A29Rg22X332oCdadWu0NPkE8uUUDCkw50s9tki5ltid+zVPiD7+FbiYvw95rc3h3ohn0SwI6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzGPd5ntpX4rtvZKRMtq5eC43PFfI3hCng1CHx7FGvw=;
 b=FORm6fAoA3TTz/+xChfrZV607fZH/1qEN6yMYECi1CPb8cY5kJpxLg1INFH+yn55uYVM+3jUMuELz+e0VTbGJo4NCzYN5/NlqWmMDXFyJii2uqpG7rc3U7ylP62RGFZRaPc5aSA0AbWg5ZsIAwttnSZXWDY+uwtoxJO4aoZoSJ8kAMvHyF7U5Nhu8rF68IJ8F2z6K9Ag65qcJ2FGhzFyrL5xsz3J77htiNs/HF2g3x6TZ6n3Kv55snUctZkBhmWagCTd5YJcXMdk0K7DQqYDHSWT6NeaO2xbEwZaQ9fGOLhJv6Bo8/CnVYNL94n+SijUyG2jhntKFRVIGrIqPuBfpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by BY1PR11MB7983.namprd11.prod.outlook.com (2603:10b6:a03:52b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 10:21:58 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 10:21:58 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] subversion: fix svn-revision.txt conflict between 32bit and 64bit packages
Date: Fri, 15 May 2026 18:21:41 +0800
Message-ID: <20260515102141.3748275-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0049.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::18)
 To CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|BY1PR11MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e6681c-09c5-48b0-fdd1-08deb26bcbd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|18002099003|38350700014|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	bnykBwmg/uf6yrNZqqcVInAZelkHvqXD5chWgPhSQH1d43Oi8yu9VCOAQxHPCqAVUCkNoNVerl0LfjwqF4uE8VLErF1h1ilTYhMueU3ULBcK3gTzlCuYf05PFFHXsQyGxeZWetQtm4KafZ6q5IKEOTGuH43kxLUpfb+fjaDgfWrtLRHPvgYEbihcsqTh+/JJEURWiJo4RRC55cWhYeirpMDZkxIPy7uWx0Z7C/mm2sOI9FewzE2OHCPsNvsQ9qokc/vAS81k02Cv1RLo6X+apATP03sHpdONV+ifJtFmCcbRzdK2y7VvYXpHquUnNNSmaln+KDrGREUxZGrXWJVZaMaBvWQOGIPfW6EOQPr9Zp5i+yP4LOdhApifSyCK2RZPjwZppxHuQ1H9fo5hFotUdi9lWV44+DOEY8f74BEvk8GWmFl4buInoCB9tKXyLEdXf0yYlrEsDVVVSlF2+/H/yqybgB5CxTaESnH7lPEIP/MOhvq6nmG9XQTV6EBTyyaAl/ny4gEsdiyJnsUUINZ9dFreDpSWqeMUVXS14S3NurB6t15TzhcfeY2DXCLwt2DVx1b10M9YKCre/j5QQbZjAXTGWVNjV/v+KMLOwLU3zZ9aqaj/VTyjwqcHIni0vk4cBdY+KMZrUGQFekCURRx02VxtuTVwgN756i4f7aiTVQ6Ri+gL3m2xzQETBlKqK1CelKzglFc4gyv/aeXzX+zOQx+J1B7JYPV6Ab7oY+yfbKu1BcHcPw+gQVGvm0ErJ0bR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(18002099003)(38350700014)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aJOQIGCwBSqI8M4Iwb/2uPQBW/j6CHiD0h28u/b1c0M2NHFTqTIDKZjwZpNe?=
 =?us-ascii?Q?E0JIdoPoFDCvpPJW/zebH0BtzODqkGf3NezTSGhiv0sCJjbe2szLJEcT1fcd?=
 =?us-ascii?Q?jmnVwPP8GOtvZQd+uJSoloHNKGJ0IqnrM12AHQB8pVdZfWjPvCPQ2/jwO6NQ?=
 =?us-ascii?Q?NzRyhithVyf0+9466+H78KfvsDMxfBuJ6D0XbbRi2iTh/k43SRgCeGtemZ6O?=
 =?us-ascii?Q?TBDCSnrb6wi2S9dD99aUpyEf0bOlYNUai+N5q3UG14Htc300CqYerRLDv+53?=
 =?us-ascii?Q?s+uGW4Vos3pZMUHPoNepXbJLg41Oh4cKUb5obyqkC8UoSxaT7XIhg4KiZXpA?=
 =?us-ascii?Q?YwMg+JRSsEt8mtUiOLRymqL6zDac9bHToCqRN6YtzlSvbkHBJw/qyt4LJ7dq?=
 =?us-ascii?Q?we6ThSG/rQOPoZtacERiWEe1y8jdlThnbMo/gek5biWygCquw2CLVqIxdB1d?=
 =?us-ascii?Q?K/t7PdknfvUmQtHmBNZ1Dn44qYNZ639oItTKisvZifk3uYDx7cvlLK3gzI31?=
 =?us-ascii?Q?jp6Z3oyPWnXGO9BBfuxqUzIXB7Ms7qUSAutWU7dHM1NgGQpV12XiRgPUUdg2?=
 =?us-ascii?Q?xg9dCXCMRgbz3PfdqivabxYKtmgHVEvmeaH+YYg7uI9+NzMpnqC7etWW02vi?=
 =?us-ascii?Q?SMb+SrgrZNbbKI/4p8J0ZbK4mKBv0yHWMC1cYNlOTGeba6u9l8S36nLVjMJn?=
 =?us-ascii?Q?mOwWpKzKWpsEMEHK2qcRORG7Bh3tqNc6V9AsIhTk6Qo+jJSpnDIvNCNY2E+n?=
 =?us-ascii?Q?dLp9ZT6dMBPDqI7XD9DS/ItH+dpx1PZg88C5qHKm0p4lknNfyYWlq43kSKhq?=
 =?us-ascii?Q?7Xjxx3xmxcLqMSvw96+5vpaCGCawH3vM8W7NwG9t8bK3nRVjNBsZhJkh+Pk9?=
 =?us-ascii?Q?KLwEyZ7HhcnIx5JgjsTVx+WOIVrc+aIdimFZTkh1ZDTLmArPnt9SzHdG5V+l?=
 =?us-ascii?Q?b1cWnlwwTB96yExEmk4R4QFWrpwyF27erDacbkhXHSj5XXWHGty7I+1lqzq9?=
 =?us-ascii?Q?HY0zwmglrp9e9OJx7wOgg7dfxafISCCO6mVNxId+TVzmsB2H7uqRT+//uCNx?=
 =?us-ascii?Q?NQ7cW71ayqCNX/V0Sj6jocvMT6E+uSvH3gLvRLItqaT3CDl2JIwihnT3t/S2?=
 =?us-ascii?Q?TdjC8tyK6hh7Ku8mQwBx7T3V48boBmp7cgX5DoY5gpXWirBOl27YfR8DW1PV?=
 =?us-ascii?Q?UqSzAJHpOWAW2yz6ZxC2JiEodFEd8M7aaTi1BODsp1zRcCTw4NZbjef0Hz7G?=
 =?us-ascii?Q?hX++R9GyxME3vFmYIJvKn7Dip1zSgHe5RqVCBMwJsjZPoFXvLrJn9urR2WGo?=
 =?us-ascii?Q?eBqoFxQ3CVB463MOr6Q2XJIkTPYG0BGL6qXgi7S/jUOV1OmguL6fl5GzOp1M?=
 =?us-ascii?Q?wwgAhv17T0ZjXsGfMatUMIpozJ0iWh8yEbkdpD/dw5kFJfG7ppOd9tFtzKJQ?=
 =?us-ascii?Q?BSi4K+0PAyasYAz8BZS4IF1htgKQW2m+jVIg+MnT/svir1yMArb3J66JrkKv?=
 =?us-ascii?Q?37Pa6el8ev/YEcLPlyWxUn1hcyjgo12QYbW/diA/sKbbfreGkEmLCbJDNiVh?=
 =?us-ascii?Q?Iwg2aYXgbPimah4g66C7+irxqCBfuSr3/gzghDyLThl0y3JvQ6tL6QgiXxWH?=
 =?us-ascii?Q?n666X7r7r+l+3qcbIpaszynR6i0IbJqTHvfnh95IYLAJMAvQiGkAv7CkSILT?=
 =?us-ascii?Q?1rm781yIFhep73PiCTK9uYoCJCpsbC2R99hc5fYGe7H7HQ//yhwy28D3DZf8?=
 =?us-ascii?Q?Ds0iPZ/FfVPkJ8zbLnKFR9w2K3uVeuc=3D?=
X-Exchange-RoutingPolicyChecked: 
	CCTabKRul5UexpIEi4woYk6oGfnflRBoPNeKAA05yMbgbaC2w/9JSlS41BUWANPK5yK/WCldypLEP+09eNRB3Mjf2vWO+oPnaY0bmtIJI9cFnECNcvzwQABUZLJ+kapS+wz3GCRDPulkppFlmMng+OfY3iQwpOvv7nbY9dj8r6GXP+byz/nJq1FyxgwFXa2+0d9UlawW8aYOJSQlN4td84CC9fAAfqqIaHfXUgkZLSexmttFLVoA71ebOvp6om+ehunFpVcpy7o2NFybBbp3krcMoKOx5IjEAbkkq94Q1al7V33AgP3ydF1Tl0PgLUiHRTampAdLFhB/LChDW+f8MQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e6681c-09c5-48b0-fdd1-08deb26bcbd7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 10:21:58.6319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJt6EqsXHMVmXbXIMiYleNkWKOA11TA1Id9yWk5vecGaJtKoYuZOvPdI0FiQPvP7MHB9tkizjxLXVHNUjIvoGeTv5pBJs4w8iBNvlXwTR2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7983
X-Proofpoint-ORIG-GUID: ZieHDx69jk4R-ignGrYiiBSOApRytsr9
X-Authority-Analysis: v=2.4 cv=GoZyPE1C c=1 sm=1 tr=0 ts=6a06f3c9 cx=c_pps
 a=GQEFHjoEDIuuLG6+yye4Mw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=OMsZk7hLZkWxwCrxhA4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ZieHDx69jk4R-ignGrYiiBSOApRytsr9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNCBTYWx0ZWRfXwXZO7B03cUpf
 r/sWgJwORKarVLh9eGzcIOV++xaVt8fQtKk1KoOQxwEp84IMr+JHH7DfCO5ldFUeSLlteQm9kLz
 Ujmts66FcpdBusKQPNjjS8SN1/0s1YR1KYo6GyfCUuSsAl0YYtKhku+dfoIknaz7cldzSFnW4br
 B7l1vQvdjj5MvGPGJ2oKwcuqWpY5mU2SM8UkEgR6mxspnnUBqqojTVGC7WONFkTyueMSwW0OC7r
 ZbHI50J5wTl4DpdT3310BRiZEOYfS6yOykN7si5jB3LzzZH/mpPQ1pxeK+qjOYCkMGdt+pyEvtR
 UcmndWvW1NjksPXgBrry2xANvbq9+g+XBxOW9fsJnvpfZhuRjvULuaw7JQZQjtFPAIZ8WUBh/3e
 vDM/3m785526iOyqhTaA6D1GpfE+qab8uRwJVRFkbeiV8W4MjjcNmOVqqFgbPfPtb1Cm8d6oF8e
 3c/SS2ctqIyyd/4FjLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1011 spamscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 10:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237077

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

When the build host has libapr1-dev installed (e.g. Ubuntu 24.04), the
cross-compiled svnversion binary can unexpectedly execute on the host during
do_install, producing "Unversioned directory" in the 64bit build while the
32bit build falls back to "unknown". The differing content causes an RPM fi=
le
conflict on /usr/include/subversion-1/svn-revision.txt when installing
lib32-subversion-dev and subversion-dev together in do_rootfs.

Force the file content to "unknown" since the source is a tarball with no S=
VN
metadata.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 meta/recipes-devtools/subversion/subversion_1.14.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/subversion/subversion_1.14.5.bb b/meta/r=
ecipes-devtools/subversion/subversion_1.14.5.bb
index 13bec4ad5956..4545ccf6c532 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.5.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
@@ -49,6 +49,10 @@ do_configure:prepend () {
     cp -f ${STAGING_DATADIR}/aclocal/libtool.m4 ${STAGING_DATADIR}/aclocal=
/lt*.m4 ${S}/build/
 }
=20
+do_install:append() {
+    echo "unknown" > ${D}${includedir}/subversion-1/svn-revision.txt
+}
+
 #| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuil=
der/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/sub=
version-native/1.8.9-r0/build/subversion/libsvn_ra_local/libsvn_ra_local-1.=
la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-work=
er/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86=
_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yoc=
to-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion=
-native/1.8.9-r0/build/subversion/libsvn_repos/libsvn_repos-1.la' has not b=
een installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa=
-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| /usr/bin/ld: can=
not find -lsvn_delta-1| collect2: ld returned 1 exit status| x86_64-linux-l=
ibtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/n=
ightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8=
.9-r0/build/subversion/libsvn_ra_svn/libsvn_ra_svn-1.la' has not been insta=
lled in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotat=
e/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86_64-linux-libtool: ins=
tall: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-l=
ogrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build=
/subversion/libsvn_ra_serf/libsvn_ra_serf-1.la' has not been installed in `=
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/b=
uild/tmp/sysroots/x86_64-linux/usr/lib'
 #| x86_64-linux-libtool: install: error: relink `libsvn_ra_serf-1.la' with=
 the above command before installing it
 #| x86_64-linux-libtool: install: warning: `../../subversion/libsvn_repos/=
libsvn_repos-1.la' has not been installed in `/home/pokybuild/yocto-autobui=
lder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linu=
x/usr/lib'
--=20
2.43.0


