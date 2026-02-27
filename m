Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332C9FD4601
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 06:50:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89774.1772175021248062314
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 22:50:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MqmYFbL7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=651884c08a=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R5Jwu33969514
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 06:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=pz0KnA2Y20sXEWR3Zr8kTZjlj8Yqlhye45vNV2FlMHI=; b=MqmYFbL7988P
	zo1pw9NFbAjaaglUYRrR1ah6iTAP7gkN+s1TIpoPw4omYI7jaLdGnaAJCHolaeXo
	8lhKQ5SwySWOyjjXTCdCwtkg7EFgSOW2C6VMdUxccvIHd5Q+YKSIZeht7p0eltlu
	lUMCVlFnPKeANwuOMJoBk4G0GZWxdaJHO2uRyuRWHdN5iW+1xQCVgcMdiEF3iUlC
	DyuG3uzPUzzNJvsgS2RVzoXLVZy8gQMi3whLPNd0tvltz3UfhSuaO2M8+aouTu+7
	/m72lTiCl4+MBXDEnhYl9fRTadakcz2zM29XH53OO8ghSF/BviIQHkJqpg5vnXqM
	pVkIvtlS6Q==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010047.outbound.protection.outlook.com [52.101.61.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdvdskjn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 06:50:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qksW3a8rPInfcZY8BGOh1RRfGw6zBXfim/XhJmfz0OGBUZz6uun4aj90KRnVMRSX0yELyOZy6PxNUQv+pFptSgG2//iRE4MFo6o4IMRmljcAXE2dci1NOit3MGoVo6m0k15+x6IGVEjizWE8wUW/Xeh8v3/YROpgOcDyX7Yzr2poi16CEfzyKMfJ1TvpJJIWchC/1IIOgidrSSqaMrLsv56sc0lGhBw1cxyXV1PyUoSiGFl7x4tsO5lXXB11E2kJdJQr0eEYtGWhdirXipQEqu2vUJld4zstEc7MM0VGJaeHQklv2KRjQM4DnraNfKg1ll4ttL7/pbOPwAVlAcQjkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pz0KnA2Y20sXEWR3Zr8kTZjlj8Yqlhye45vNV2FlMHI=;
 b=MdWht03bB/L4vnTqDow5MvkkckMr1IoufLxTwvuMbqkWvgWKvH2DjQ1FTCYe0km5GutTlft0Qt1sgPTdoQloiSO2j/QkHFrudxOWlxJHHouz1qcmpRCT5fcSS7u9DGFqau5+0eKITlq6HPX4rhdBazSUc+moEv7e+2k+J2Si77Wak/rDWDPp8a+odkbRYAb21c5V1JYAP4N1EPRKQ7VnJSRv0KtJjCxMvYLeabNtLZmEoVGEaELVRyW+q98N6+dOjswmONzqzExHTSJIuiwCrytsHqan29SxftQumK+7FZJeYW20PE9qMKvIp4I5J47T+2rjtyYTE5/L4vrXMXkx+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW4PR11MB6933.namprd11.prod.outlook.com (2603:10b6:303:22a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Fri, 27 Feb
 2026 06:50:17 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 06:50:17 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V2] procps: support ptest when TCLIBC is glibc
Date: Fri, 27 Feb 2026 14:49:32 +0800
Message-Id: <20260227064932.518801-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <7C785637-73B8-4927-8A7E-C689573CB8BD@arm.com>
References: <7C785637-73B8-4927-8A7E-C689573CB8BD@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0122.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::8) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW4PR11MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: 46368dcb-eb9c-4f96-9dcc-08de75cc775e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	6VDU8aR+1OzHBHY/H5/9GNhG1GbMD1SH7l+zrBHwJeAvSrASdqhUJ9dQsgyUrYSD63wdhHaDxr4PcJo6YoQyD2e+g8mOF7uEEkhb4ozSzTpFPPzzaavzu7LTCM6T8ZsOfzwZS6JadmCXQpsiyF7/FP0tx54dNLo+oiPh6Dfl+jwUfm0RSEGe7AIQxqdGGFq1CNdsG68hpE91C7Fr/ZWSIcDU8uAk8lq7BK9rlBqK6kRE4VNVdrb/8ltPKkYEiMdEWjp3eeYNXo24ehPYNrf4ct7bSKaSHmJ3Cxy169Ny0AQE6ULzCXKyGzBvCbcrHmz/KCBIAMk1xU108UV3BjuKPd3mGKGrFRmFOCeXLW60oNwItbj2wFF07NTsw7dRmskDvfPNQUusGiEGUFYThR3V7XgL5gsXswwgXDbNSfLIFO3PT+/D8TdlALA7XwTiYDe6SyhMQMmALf7cJMcbAYm/WWyqYRGOr1RL6797J3wEbfO4K+SaFLygTcuCv4t3+3pm4Rn6nlFjzo4OWYwZcy+xzrEXLP1ZEOhjS7hAeike4H1+gf+89HMaGH6or4o4PZtdpMFB9TbvLj9KLFrYqEZWrCRGSbl4mMvFYp98Ll2wfy4vNwG/njYjR+lKiafrr+Jvmngs5vXCGKY4ZkAuMg/RuvddZz5SoAL+C6iTvfZV/iq45uHJQJE0O9fd7nrxtRcG7vveiAti2mfZt8P5LSFcc+ybPpetUjoG2K5s7pORbgJIq8LgE2ZK1yNPBlPNtePq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GGXYwa+ioN0w8X2rxXbavrPZlG1TKeNCqn3C+CcaSRrmVIIUsx5MdWH7Waq0?=
 =?us-ascii?Q?4Oxr69sbgv1pYqzu2GBgZlQiwq4JVfDe7zriPFG3uHqwbOPRMjDWc81tUHSc?=
 =?us-ascii?Q?iwESH4t8aNz8XsDloiUopO+vtu3VrBckPG8Nu+n/x2xkxVKAalbaodwHVllz?=
 =?us-ascii?Q?xDQunX9TD5Fsr3oHiu7V4W44Bk2bUYOvdybuf4ltqwFs+gqLZ1WKAPb3sVFJ?=
 =?us-ascii?Q?hxf6U8a76UPcW3c4pkwYhkSUI/rmlMN2sezrOcpEmbgcsiRQzV2ZOGL5miDY?=
 =?us-ascii?Q?wxQW9328BPGQx9a9XuIyzCrdx8hgOVYSxrFA20ZI3e2QFfwRMPSP1JQ/ZxIz?=
 =?us-ascii?Q?2cpCJhkZysXj0jqFXgd9UuSad42klkON1AOqSLapw3dOPOpty/4rwyjTj07E?=
 =?us-ascii?Q?azY4+Dm1It/dHAGfwTnRvYy/+0xhS6slFuqyVFjwbO+LegrepxhiuCyjt3Fn?=
 =?us-ascii?Q?kxQ58t+ilhJYAgxbUFQucSXzqBiZKA5+HLLJJ6uXZLpmxQPnmjprcvAL5RlD?=
 =?us-ascii?Q?a138aFF5adBJyJGyr1Bf/EK4OOvkLs5MeaoUKsISYTr0R10H1zi9bl0jHwhL?=
 =?us-ascii?Q?72S9tZt2q/peQvmIsltplZvRDx/SLbsfNnxaC5q9roI+M73LFJlvHevV8U57?=
 =?us-ascii?Q?XCs/5WLOHEfFZfrMnWYxezZV3NBVenGc81KGVE+fcPKWhLTFKUO58UqK4Nh8?=
 =?us-ascii?Q?G6aphf4t6le8tBUj66yOeWcvt1d/N03KcLqf3c6ZV9rENoyROw161Y0pLwlI?=
 =?us-ascii?Q?tMc9moj26cgmlIBVisJ85ufoJ4qEJ1Hod6Dyi409LYFRzSWgQrX6xGDSgmWl?=
 =?us-ascii?Q?OI7t+LOLkahsu0g5XCB96/CKP5Rku3KhoXX/8TH7Zzc5d4dLUBhyBujvdljm?=
 =?us-ascii?Q?stXnLEVNFY2/cJWg2kshZ84L95dWBrKADbVYoPP7YGPtZHeFm0pYHST2LOX/?=
 =?us-ascii?Q?cPcy7UjEwcGrpS132NRlNTGpsXiUgj43QK+TopYderpeyEWhyGgPAiQQObbr?=
 =?us-ascii?Q?AqCRtEYEbTzLCRwCUXrTWomiByfV0mb9FDkXFT2PmSA9C6a1dYGYvzLvjOgO?=
 =?us-ascii?Q?6Hmry4Ud6fU/rMJznAUGBkOSVQN6XL8iS8kv9rragm1Fu8SZ7tP4HpuAhJSy?=
 =?us-ascii?Q?+Qn8ZAoOPCoAAk2wGhUK7foJ7LADyX9dAt6bn65XcIrihKfW40Z7f5n+drgr?=
 =?us-ascii?Q?D9G6KUK1Cb84UJAuiBpdXOHcd8GbdCb71M1moW4WLO3zxqWaeIf/vUgfGyiR?=
 =?us-ascii?Q?ZKJ6ayouge9uHylScOE8uAdNigVth4Yqpfy5hmElTbRryHNIJYVT/sTkaiP4?=
 =?us-ascii?Q?9bQD/VVc9rfGAXOm3EnxncP8M1nzg7USVIuN5HwwlboS6TguK2/6MFUt/Vli?=
 =?us-ascii?Q?4JmlN71fm/eM26Mq3bJ1ukNQD0q6BX3peyzlE4f0oZcsOYKNc3lN0PUI1UZz?=
 =?us-ascii?Q?nrOLyHbtFXrIkKMmPqHKWrZrSJgmUoAXQ9ya7XHyp8uBie7yVT8/0pfWAmpN?=
 =?us-ascii?Q?SH9Miyx8yDmHOKuszENksk9aBQkkSQ1UdLZpJDS2v50LY8d/uReT7F1VD0V0?=
 =?us-ascii?Q?VOXS4vdexAGbsq6ozpuoQGFjLC3Dnqz90hgudYTrUSCeUNLPrt7/BlEfpq5D?=
 =?us-ascii?Q?1JZxsZ4m+cSYi3oqJe33vcfLlucRVsV3gFJpxhMS0WHUXOjNIJzjJg84KZqs?=
 =?us-ascii?Q?pqySv/9s5vAsEyALsgH42+mEX+y2ED0Vi7v8Ni+AuyMzhfR1fGTUQA3MC8Bn?=
 =?us-ascii?Q?1Dervelm2VDRjYS7i0XM1Q860VTIRUU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46368dcb-eb9c-4f96-9dcc-08de75cc775e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 06:50:17.1452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: doWmqpBaw8fF7nmEGTGYAjDQUbybaI8cE+Su0/AdNfNXQLyq0WXDdCoyQAthyPjr9ySWFYVpgRkS+MFU5x93q63cs+86asNwoAou/yVVjME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6933
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA1NiBTYWx0ZWRfXzQSMKcXB7PuS
 +0010vdjCtguyh33MUhAc38VCJx9EJgxBkbnJRy35WQQazgnfs9DIqwl7txvtmpnFpbKiUDiiS3
 Z0SNxYWKV+I0mYxUlcolODxiwTF1z4bokMWyL1Gr3R1wP+2RsMNkjzJRg3DLyG3EKFjh3qCjNw+
 T8QPZUjt33RExMbH8mnhSwN+lspt7mTQohrYA4YX9kW2Eh80bfjWsGBI34HdxodFIAhWG1SAVOp
 F0/zh2tKxoV8kHSoBjVlMUiIEKzqLZguIIrECe2Z9ywgRUF5T+QwMgllK/jQfU86PNvex9fccNm
 KTvVM3JJG0ChRhNABA+3c53Kt4N/EBaD0Q8xgz12eXBdMiAv8+nzvrNYBqN3gD6qAAOyGhetNY9
 QpJInS28xiss7saN9SuVXhn7Al6gLwpeOn9Tcax/pnkRoQNPIpTj+MV/XVhsWlgTHfs537zS99e
 +53ik83hjh2QBITHcVg==
X-Proofpoint-GUID: YvPxOqjIoIaVUO50dHp-JzY_0qZGrA4J
X-Authority-Analysis: v=2.4 cv=UKzQ3Sfy c=1 sm=1 tr=0 ts=69a13eab cx=c_pps
 a=L3hcPeoaDr12kb94poMUUQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=p0WdMEafAAAA:8
 a=t7CeM3EgAAAA:8 a=jzd3iM5pAAAA:8 a=GjWSY80A04DYgau4zBgA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=TO2bqnfdc2VIsZqNzVeZ:22
X-Proofpoint-ORIG-GUID: YvPxOqjIoIaVUO50dHp-JzY_0qZGrA4J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 06:50:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232076

* Support ptest for procps TCLIBC is glibc. The configure.ac only match
  LINUX as "linux-gnu", we can patch it to make test can run on musl lib
system, but the upstream testsuite should only run on gnu libc host,
some test cases only suitable for glibc, eg: Some of the error messages
for free command on musl system is not the same as glibc system, which
will make test failed. In order to avoid some other unexpected failure,
just support ptest for glibc.

* Bug [1] is filed for musl support, we may can add support for musl
  libc later when upstream add the musl support

* procps's testsuite use DejaGnu test framework.  The testsuite is
  expected to run during build time, this implementation create the same
folder structure as the testsuite expected to make it can work well.

[1] https://gitlab.com/procps-ng/procps/-/issues/420

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../distro/include/ptest-packagelists.inc     |  2 +
 ...sts-Disable-twice-total-pmap-X-tests.patch | 55 ++++++++++++++++++
 meta/recipes-extended/procps/procps/run-ptest | 24 ++++++++
 meta/recipes-extended/procps/procps_4.0.6.bb  | 57 ++++++++++++++++++-
 4 files changed, 137 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/procps/procps/0001-tests-Disable-twice-total-pmap-X-tests.patch
 create mode 100644 meta/recipes-extended/procps/procps/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index b9616e9bf4..8099ff3cea 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -59,6 +59,7 @@ PTESTS_FAST = "\
     nettle \
     opkg \
     popt \
+    procps \
     python3-atomicwrites \
     python3-attrs \
     python3-bcrypt \
@@ -99,6 +100,7 @@ PTESTS_FAST:remove:mips64 = "qemu"
 PTESTS_PROBLEMS:append:mips64 = " qemu"
 PTESTS_FAST:remove:riscv32 = "qemu"
 PTESTS_PROBLEMS:append:riscv32 = " qemu"
+PTESTS_FAST:remove:libc-musl = "procps"
 
 PTESTS_SLOW = "\
     apr \
diff --git a/meta/recipes-extended/procps/procps/0001-tests-Disable-twice-total-pmap-X-tests.patch b/meta/recipes-extended/procps/procps/0001-tests-Disable-twice-total-pmap-X-tests.patch
new file mode 100644
index 0000000000..ec26af92fe
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/0001-tests-Disable-twice-total-pmap-X-tests.patch
@@ -0,0 +1,55 @@
+From 56505e2ac9b703aac979f0849814ab7c83af57e2 Mon Sep 17 00:00:00 2001
+From: Craig Small <csmall@dropbear.xyz>
+Date: Mon, 9 Feb 2026 18:19:35 +1100
+Subject: [PATCH] tests: Disable twice total pmap -X tests
+
+Sometimes the memory count can be just a little different
+but the test is equal, i.e. must be the exact number.
+This means sometimes the test fails.
+
+This removes the pmap -XX pid pid and pmap -X pid pid tests
+for checking the result is the same.
+
+Debian buildds this test never works and has been removed
+for a while.
+
+References:
+ #409
+
+Signed-off-by: Craig Small <csmall@dropbear.xyz>
+
+Upstream-Status: Backport [https://gitlab.com/procps-ng/procps/-/commit/bbe21e141b77398586c90884a43ff75996b83843]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ testsuite/pmap.test/pmap.exp | 15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/testsuite/pmap.test/pmap.exp b/testsuite/pmap.test/pmap.exp
+index d37b55e5..6fb6fa1e 100644
+--- a/testsuite/pmap.test/pmap.exp
++++ b/testsuite/pmap.test/pmap.exp
+@@ -93,13 +93,14 @@ proc expect_twice_total { test } {
+     }
+ }
+ 
+-set test "pmap X pid pid has same total"
+-spawn $pmap -X $mypid $mypid
+-expect_twice_total "$test"
+-
+-set test "pmap XX pid pid has same total"
+-spawn $pmap -XX $mypid $mypid
+-expect_twice_total "$test"
++# Disabled twice total as there can be a small change issue #409
++#set test "pmap X pid pid has same total"
++#spawn $pmap -X $mypid $mypid
++#expect_twice_total "$test"
++
++#set test "pmap XX pid pid has same total"
++#spawn $pmap -XX $mypid $mypid
++#expect_twice_total "$test"
+ 
+ set test "pmap finding shm"
+ make_testshm_proc
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/procps/procps/run-ptest b/meta/recipes-extended/procps/procps/run-ptest
new file mode 100644
index 0000000000..7e132653b0
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/run-ptest
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+# Run testsuite which use dejagnu
+cd ./testsuite
+for tool in @DEJATOOL@; do
+    runtest -a --tool $tool --outdir ../log
+done
+cd -
+
+# Run test programs not used by dejagnu but run directly
+for p in @TESTS@; do
+    ./src/tests/"$p" > ./log/"$p".log 2>&1
+    case "$?" in
+        0)
+            echo "PASS: $p"
+            ;;
+        77)
+            echo "SKIP: $p"
+            ;;
+        *)
+            echo "FAIL: $p"
+            ;;
+    esac
+done
diff --git a/meta/recipes-extended/procps/procps_4.0.6.bb b/meta/recipes-extended/procps/procps_4.0.6.bb
index 168027077b..21da72039a 100644
--- a/meta/recipes-extended/procps/procps_4.0.6.bb
+++ b/meta/recipes-extended/procps/procps_4.0.6.bb
@@ -10,10 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "ncurses"
 
-inherit autotools gettext pkgconfig update-alternatives
+inherit autotools gettext pkgconfig update-alternatives ${@bb.utils.contains('TCLIBC', 'glibc', 'ptest', '', d)}
 
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master;tag=v${PV} \
            file://sysctl.conf \
+           file://0001-tests-Disable-twice-total-pmap-X-tests.patch \
+           file://run-ptest \
            "
 SRCREV = "4dafddf4c3f4646caa517f039a2307e92657ec93"
 
@@ -46,6 +48,58 @@ do_install:append () {
         fi
 }
 
+do_compile_ptest() {
+    for p in $(makefile-getvar ${B}/Makefile check_PROGRAMS); do
+        oe_runmake $p
+    done
+    oe_runmake -C testsuite site.exp
+}
+
+do_install_ptest() {
+     install -d ${D}${PTEST_PATH}/testsuite
+     install -d ${D}${PTEST_PATH}/src/tests
+     install -d ${D}${PTEST_PATH}/log
+
+     install -m644 ${B}/testsuite/site.exp ${D}${PTEST_PATH}/testsuite/
+     for p in $(makefile-getvar ${B}/testsuite/Makefile noinst_PROGRAMS); do
+         install -m755 ${B}/testsuite/$p ${D}${PTEST_PATH}/testsuite/
+     done
+     cp -r ${S}/testsuite/* ${D}${PTEST_PATH}/testsuite/
+
+     for p in $(makefile-getvar ${B}/Makefile check_PROGRAMS);do
+         case "$p" in
+             src/tests/*)
+                 install -m 0755 ${B}/$p ${D}${PTEST_PATH}/src/tests/ ;;
+             library/tests/*)
+                 install -m 0755 ${B}/library/tests/.libs/$(basename $p)  ${D}${PTEST_PATH}/src/tests/ ;;
+         esac
+     done
+
+     tests=""
+     for p in $(makefile-getvar ${B}/Makefile TESTS); do
+         tests="$tests $(basename $p)"
+     done
+     sed -i -e "s#@TESTS@#$tests#" ${D}${PTEST_PATH}/run-ptest
+
+     sed -i -e "/set srcdir/c\set srcdir ${PTEST_PATH}/testsuite" \
+            -e "/set objdir/c\set objdir ${PTEST_PATH}/testsuite" ${D}${PTEST_PATH}/testsuite/site.exp
+
+     sed -i -e "s#@DEJATOOL@#$(makefile-getvar ${B}/testsuite/Makefile DEJATOOL)#" ${D}${PTEST_PATH}/run-ptest
+     for p in $(makefile-getvar ${B}/testsuite/Makefile DEJATOOL); do
+        if [ "$p" = "ps" ]; then
+            install -d ${D}${PTEST_PATH}/src/ps
+            ln -sf ${base_bindir}/ps ${D}${PTEST_PATH}/src/ps/pscommand
+        elif [ "$p" = "sysctl" ]; then
+            ln -sf ${base_sbindir}/$p ${D}${PTEST_PATH}/src/$p
+        elif [ "$p" = "kill" ] || [ "$p" = "pidof" ] || [ "$p" = "watch" ]; then
+            ln -sf ${base_bindir}/$p ${D}${PTEST_PATH}/src/$p
+        else
+            ln -sf ${bindir}/$p ${D}${PTEST_PATH}/src/$p
+        fi
+     done
+}
+
+
 CONFFILES:${PN} = "${sysconfdir}/sysctl.conf"
 
 bindir_progs = "free pkill pmap pgrep pwdx skill snice top uptime w"
@@ -78,6 +132,7 @@ RDEPENDS:${PN} += "${PROCPS_PACKAGES}"
 
 RDEPENDS:${PN}-ps += "${PN}-lib"
 RDEPENDS:${PN}-sysctl += "${PN}-lib"
+RDEPENDS:${PN}-ptest += "dejagnu glibc-utils"
 
 FILES:${PN}-lib = "${libdir}"
 FILES:${PN}-ps = "${base_bindir}/ps.${BPN}"
-- 
2.34.1


