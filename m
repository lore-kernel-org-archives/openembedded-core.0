Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837FBCD6E4C
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 06:47:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22584.1780296424797126638
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2026 23:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=F5NUWUuR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0612b6f015=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6516WMws2575467
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jun 2026 06:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=VqIazNoLAExgYpHqu2SU
	Luy+INkGg7hiKklIHxKGyCk=; b=F5NUWUuRkDJ5fngoyQCDqwT3qs46+EcF71+A
	0MAn6ckHEfvktaiOTX10lYdwMxBXWMQsEQ2v6QSj6QMA7xF7fgAn9DsTNNu68or6
	etV+PT/izPj0ZF1KMkx3k8TePi2fnInfYRoTPIao2a1oc0n3xiLj4t1l8p9GVkMT
	Yu5jxLt6kut1MQEDPykB9iacs6FdjH2f8hoF6xBlJf9n01K5dyy+R4fd/0FjS5Sz
	hrDOjkotYRjdzrKOASmZ8L6hzKWD7G4GBbXR0rFv1roikD0gK1Iu0BE30Dlg8O95
	rjAOHsofHhc5TjcfesfSULQJ+LRf5YJH2u/+7Ad02GuP2GYAmA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012048.outbound.protection.outlook.com [52.101.53.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efpv8ajhx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 06:47:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtS0DLa93o2XuGnfs6qjCTDQUcawFd4ZhYEg4EbO2xvvJhj6a+gVNVOqJ0C6cEVqGF+Wo1Y7E137WfJK2znGIF9pE/RVNO2RcWYAZ8YpVM9vLkwNQt3T+flTbYXIsMeGU6VRE5HBf8Ouf86OSpPgIQNC3+gbEgtcCBL7k28J6jI7hkiYOXXd3spf/FgfaqFRmXkW8kfZ41EGQKpmH+ZDHnUJYScq23qT5DTuu80LVpS/IbtU6SsKEK17SiL/livqHHf6HSrOR5qkj8C7qiCr2K1IIJqorP6b+WmXFXmSrmf4YlLmWBzJ6mEnGrxmy0H1cW2R9u70EMNnmIFNUPZLAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqIazNoLAExgYpHqu2SULuy+INkGg7hiKklIHxKGyCk=;
 b=u/1cNJy/NnPRiNSEBE1ZtAiacIz0VVnOMH3JMjajlcml2RK+euLO0TMKCStrjCLUeN4rY/lIerrOQ2FI3LkIV9P3uOJMcnz40aZ2gmc4sabTvc+4x8H1WYe4xe4L9Z9qrz+kZdroOKuRQLbKudKgfdfgJar+ECjWoG4d/pNSAVzMQCdlivNqKriElJa3ciYsQ86PuJXt6GCdBrPkpCx9zUXpAR0bPxcPq41o2wxAnB84rJr+ih2lYZCunoxH6w5WPQbtvFGN4Xezor2f3nq7KsDSqaY15ogX7uMVPbtvUP9dXdVrWae4wrAxZOjg7pDl8TtIl73QfUuTP2XrR9MGkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by BL1PR11MB5320.namprd11.prod.outlook.com (2603:10b6:208:316::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 06:47:01 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2%5]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 06:47:01 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4] subversion: fix svn-revision.txt conflict when building for qemux86-64
Date: Mon,  1 Jun 2026 14:46:41 +0800
Message-ID: <20260601064641.2204916-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::18) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|BL1PR11MB5320:EE_
X-MS-Office365-Filtering-Correlation-Id: 72a4102e-eaa8-484d-dab7-08debfa995a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|18002099003|6133799003|38350700014|3023799007|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	3R6CLT7ClP1WlUqtoge+z5mHHLxjAgStDAj/3mnmsB2/QKkir+nS9hq//FYwXttvvK+4bNN6Hx29+54GhJWQedw/GJfkCDP1aizMe+Jcxxppky5vuxe92DbhZD5O2B/6bzsYH38CaU/KlrA1y6vdiygc9Zl3XIjxKOjaeEYHQyZ63thpz9wDriUCdbKrCGBGnqWlSoHofi8Ctuvt4+BPZb68akEl0I7NeQDTbVylGW1GIlIeUvE05sxdzVfiDDNryL+4iNigLh6Q+W02tPFzfnCcX98dmYmbxQ/vgbkSpohlYyoZ4O5R5pr3LNutGZdtoQYrNpIzvit/JJ0VlKTR4vcqYQcQ7/FrhbsbGeps2Fn+JUuJnHq4xjLGVZegixuvq67NNimnjPAD3lS6YD1pAfXRdn660fC6tpJTdY5HHuKMTZDKF3v69K49pXxcVF91mDnpgSGmCfUFoV+aHz1SZ+FDkJCIMn4cYlo0v/UuxxMVUL31uJUTmC1iQEEf5fkYSEQB1eGjW/sRY3OVdyMgbdwOs43G48uqbriT6b2FNatYhEG8h/2bwboKlL24jBUliRSxelatP3SF5lTIqdlbiICV0PNS0I6w8qZN6alnsFmWFBsVKTAl8C/YUexdfkr97zGvmpAjWJEJc2s9P72IGDVrSR/j01+xmnXRvuZPrlru/aMoLP0oPntyUsIl+bpX5q8//wPWKkeko3jGM+Vo3w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(18002099003)(6133799003)(38350700014)(3023799007)(5023799004)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FP86JonreGvzyLXvdZ8vTpYa6D3ZE9cH37ML7uSlbMNJTv9gDB4DmJaEaT+R?=
 =?us-ascii?Q?yBoJO8Qqyy8q0J7rmYuoSIrL1wlmJmN+RlzqVfkRt1NWKPnDUIz2hOaBsSyV?=
 =?us-ascii?Q?1p1kf59H+yweQcVDalR/iHPSTExvWPpKI4zSAOEutt1vFF50CMCzTc1Ucp0l?=
 =?us-ascii?Q?PjRWkuJhtje7bqqwewzHEU9ChaGzjZA+4oL0X+Lg9HGV/s7wMo6ldy+mCedG?=
 =?us-ascii?Q?w8yYCPTS0RA1ngUkrZobIei34hpf+ijSmPvwOrOFf1uJXWj1hw+fiO9RzbUJ?=
 =?us-ascii?Q?lMwnjf0uIWIJij2wM0shTthlzbkejCEiG7oe1qYCd6UD6JzvacHMHFwVUJ0y?=
 =?us-ascii?Q?qD8sv7e53Kb5RW3piU99dv1VOh7W+xKvRIm97SEqzIo9nSwx+d0F9RM/S9Lk?=
 =?us-ascii?Q?BmN5ioa4ahGwPZ/8rnmZMaOvpN1JF+Q48eRhbrTRpsVcLoPODZYvEH5WTv0I?=
 =?us-ascii?Q?J+mXzej5+JDs8GutdRGbxwZNH9t2XLBbB8Mb5OqR2r4bLERKkFoV/cjbOPyY?=
 =?us-ascii?Q?Js0BWT3HzdQp5YJ/jceSqrWqE03efPywUX8+AvBUFyPG1pPRl77Ph9b0djDC?=
 =?us-ascii?Q?h7tktZZ7BXZPrEku/qi+BdkEb2ZH8vEEpfnItykPT1Hg4f1rByOTVlHG9kMg?=
 =?us-ascii?Q?xdGkCsjUHKm64UlSRMiwwaFvUqahcOuOzIkPNlfdcvUnPtFzoKpoznlk1spU?=
 =?us-ascii?Q?Dsh1AaF9vyEhhij0FdOtV7bUPV3v+d1xAvQFpTA4GdusZ4l966lR9n7cUJzh?=
 =?us-ascii?Q?znQfqQGPCRn49BiTMGg1peLD2461tbDLD4Jm6v0u4jZruOf6G0J5sKQzysgT?=
 =?us-ascii?Q?khuFCtIFYn1VQXrbRXbYaf2Zj5Fz4ZEN/KMijiwH1p5hseSzIZdzpet/PZ3O?=
 =?us-ascii?Q?mL4paWryb2qLZs10mYlBo4r6wPAocF3ZwF0i4PtQK7cXtnK2KSG5xBJYSfXk?=
 =?us-ascii?Q?kB0+UhHLjdJwixWMuHf0eRQkZ3KSkEe9T48HmYQwr/kXVhfgIBpZ8uFUqpph?=
 =?us-ascii?Q?7+DLlCZg8BYmqt78Kfzi+FvS1gl/ebFpM7Hgg+gtw3nzjCuKBhwUya3t9NnZ?=
 =?us-ascii?Q?l7toA4pCCUuQQldVmFLw9HetTNXPuxF+UMIOzkYRudjnREyBHDrrk8Tfp+iD?=
 =?us-ascii?Q?t252KL0E5L4Homzppm+9/HMaNmB107Mp/iyaSIM3NkV/W4qDZ7ldHRZeee53?=
 =?us-ascii?Q?4dixO6nubR68GOakCf1dGRbklFJuw0hiVJgLQSCOrmxhfrQT1wOwgMHy378T?=
 =?us-ascii?Q?9Ch/I/s/0D4y+y+8rESI7JxFK8K1P/FXLQ+iO21ZsV7OvsQzzwks/7joHzIf?=
 =?us-ascii?Q?//pDEyJaLxRFWBjB2jFydIm817Z1QlPQ3bW/keGA8wH5gVCaUim919utkfaj?=
 =?us-ascii?Q?DFaHAaO+ucoB6RbI7C7XHR0t8Kb8asLw2/oGCxOdRJoXVfDcay93mNmy/DEa?=
 =?us-ascii?Q?uscL+qHqhpRXw+V/dSwtRsZgXqd4cwtSggIcx2+h16I3NdPp8MUWcFhh8GrG?=
 =?us-ascii?Q?DkRPQ5gb2nuI/TNq+72gJREbxWIh/BM7jK1flnSznKydQO6uMhOJhHZt0309?=
 =?us-ascii?Q?2Rm8cTaaSBUxwG0chYKtgyd9eRo915PUb+JdYZMdLGtrl3XScKv12GbyKyAG?=
 =?us-ascii?Q?gpuHObVz061JzcsFSCiSoD0WyZonEFq5nYwnN2iaZmLG7QJTz5kNwJDbyL4n?=
 =?us-ascii?Q?zcfYRY+pEqS2fR/050zMn0cLBcVONo5EnJWYC2EniVni/Jw1V6WO0wZXpefF?=
 =?us-ascii?Q?0PcjsrCM8a0fj5uR3Z0Xd6xHyyYaOdA=3D?=
X-Exchange-RoutingPolicyChecked: 
	S1S+PtLd5rT8vjOsStuCmQNIqC1kUUzXOENtGbxFDDhmus9s3aUOJkTR12ODj7ksqB6jY3NcRuFmNLosh7h4OFN4/HvtFYeoA0PdbxMsdnM0CLalo6pdTydTP0WkkcMlfHzdhGkZ8NcWfHkqichpX0sDtmIuCWuYwW3od1lczmDJNeNl1aYwFOs9fwHcIMta4WXpUPASnbaaNA3lGv5kHGNweBcR7zRShTKQWPR67tI0K3JmEjpYqQPlpdPdz6SOLs6XBrVhPa3AHUy0GRv3WgfqNjqoUxtFQBJCpE8RvRy6LsmAygD8/nLv6Q+j9avgnsE9rVsuSH/QfMEkCVkRTQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a4102e-eaa8-484d-dab7-08debfa995a9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 06:47:01.5990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21zcbmNMYdO/uh0OPr119FPAm2lwLt8ZlNqw75jNlqF3hIdWp0d3IXVf01EGPjM0IrwyDx5X3EYink0UUXl2+twx+dPAl3g3M+COomqv1lI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5320
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA2NiBTYWx0ZWRfXwOJjJjRIekQN
 g/U3MKHcMgmJ0RVEkwi7fKJvZrUVqfYM0ZnIjTXFCZkSbBxxWIRrV14En5WadEb3F/L7+ls56rJ
 ODntWXEqvOi1hSrKz93HcjCEv9Rtm/HGmPFKJ2gU2hCv1byvoyclKUpi3ROTq/XWHAzNcva4rMR
 pWMMZj8916lWGaMGxMdkCCUHhOsgJfcPlLf0rGWJlJHMgUaHXX0IX957FxVw2Uo1yygPjrNl5Jf
 Q+RZTh6HGKS5rBZTUbLfziEhw+78ePDhSQndvSeoPtGcYajC464/M1InaoePCLj8lA/dxTdVu6r
 sfl/ZRrH1MUOC0fRA4m3X+RXyp0vohBTlT/oWfzbB7RQQwpUKr/NQNvedOHZE+FVE0Y4NH8Sh76
 ANTWZxUlHRvnVFVnGzw8iJoA1/CoLnPCidPuQq8emQhWnWLbTBFOMNdpmGietKEXvh0swA3QjiM
 6hpeVCer9g/KomeFyhA==
X-Authority-Analysis: v=2.4 cv=Opt/DS/t c=1 sm=1 tr=0 ts=6a1d2ae7 cx=c_pps
 a=JX9C1NjKfd8eGP+3z/QwmQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Vt2AcnKqAAAA:8
 a=mV9VRH-2AAAA:8 a=t7CeM3EgAAAA:8 a=N5C7i6JgP_lGezvsZWMA:9
 a=v10HlyRyNeVhbzM4Lqgd:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: z8SzvEr4MupOsyLmrk3W3VYQ3mTjZ3uY
X-Proofpoint-ORIG-GUID: z8SzvEr4MupOsyLmrk3W3VYQ3mTjZ3uY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 06:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237815

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

The revision-install target in Makefile.in generates svn-revision.txt
by first trying to run the cross-compiled svnversion binary on the host.
When the target architecture is x86-64 (same as the build host), the
cross-compiled binary can execute on the host. If the host has libapr1
installed, the 64-bit svnversion succeeds and outputs "Unversioned
directory", while the 32-bit (lib32) binary lacks the 32-bit libapr1
and fails, falling back to "unknown". The differing content causes an
RPM file conflict on /usr/include/subversion-1/svn-revision.txt when
lib32-subversion-dev and subversion-dev are installed together in
do_rootfs.

This does not affect non-x86-64 targets (e.g. ARM) because the
cross-compiled binary cannot execute on the x86-64 host, so both
64-bit and 32-bit builds fall through to the same fallback.

Since the source is a release tarball with no SVN metadata, the correct
value is always "unknown". Fix by patching Makefile.in to skip the
svnversion invocations entirely.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...-fix-svn-revision-host-contamination.patch | 43 +++++++++++++++++++
 .../subversion/subversion_1.14.5.bb           |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch

diff --git a/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch b/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch
new file mode 100644
index 000000000000..9741a6499c7c
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch
@@ -0,0 +1,43 @@
+From 54b2cf44445820ea7c3250a25ed957a389aafbd6 Mon Sep 17 00:00:00 2001
+From: Haixiao Yan <haixiao.yan.cn@windriver.com>
+Date: Thu, 28 May 2026 09:20:59 +0800
+Subject: [PATCH] build: do not run svnversion during install
+
+The revision-install target generates svn-revision.txt by first trying
+to run the cross-compiled svnversion binary on the host. When the target
+architecture is x86-64 (same as the build host), the cross-compiled
+binary can execute on the host. If the host has libapr1 installed, the
+64-bit svnversion succeeds and outputs "Unversioned directory", while
+the 32-bit (lib32) binary lacks the 32-bit libapr1 and fails, falling
+back to "unknown". The differing content causes an RPM file conflict
+when lib32-subversion-dev and subversion-dev are installed together.
+
+Since the source is a release tarball with no SVN metadata, the correct
+value is always "unknown". Skip the svnversion invocations entirely.
+
+Upstream-Status: Inappropriate [issue reported at https://www.mail-archive.com/users@subversion.apache.org/msg30267.html]
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ Makefile.in | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 7f0a37dd9a9b..914c1c37790c 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -499,10 +499,7 @@ local-install: @INSTALL_RULES@
+ revision-install:
+ 	test -d $(DESTDIR)$(includedir)/subversion-1 || \
+ 	  $(MKDIR) $(DESTDIR)$(includedir)/subversion-1
+-	(subversion/svnversion/svnversion $(top_srcdir) 2> /dev/null ||  \
+-	 svnversion $(top_srcdir) 2> /dev/null ||                        \
+-	 echo "unknown";                                                 \
+-	) > $(DESTDIR)$(includedir)/subversion-1/svn-revision.txt
++	echo "unknown" > $(DESTDIR)$(includedir)/subversion-1/svn-revision.txt
+ 
+ install-static: @INSTALL_STATIC_RULES@
+ 
+-- 
+2.53.0
+
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.5.bb b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
index 13bec4ad5956..05f80b3319aa 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.5.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
@@ -11,6 +11,7 @@ DEPENDS:append:class-native = " file-replacement-native"
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serfmacro.patch \
            file://parallel.patch \
+           file://0001-fix-svn-revision-host-contamination.patch \
            "
 
 SRC_URI[sha256sum] = "e78a29e7766b8b7b354497d08f71a55641abc53675ce1875584781aae35644a1"
-- 
2.43.0


