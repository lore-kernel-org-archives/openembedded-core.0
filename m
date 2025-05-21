Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F831C2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 04:54:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3836.1747803274937546713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 21:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7236248e0e=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L4oWjU013703
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 21:54:34 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfs8t2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 21:54:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iE+FtqveVp7w5DJsbDjIvUlXJbxoJEVqIOqQXWvhpsCdZsPWky8pxlsr3shK9lgYC3QRkeLXL5w7Z6dZfzOyBms93mDZOD0446xD+QVp8Ng8Ryi7N0tiVnFHk2ZIZuBtHaiOKRos7XmXG8ZVHqA887LEue25MqznIws5x3shcQSv2reDT94vKe4C4k1bCTHWjVRdczMt6EMVC0sLPqbZI+ICim1dCjivGp0EP6CkyrXKzzzEinGtDRQhaL8Wbe7/ma84RqagbkbS2kPAK0kAaka9wnGkFS/dHSCPegy3dJepsPHW9D/KMaWa2ZUjotL0r8dvZJWPlS5gUC3Mgvn/qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgWg3GjiVNQyrUAm1rwAloG2g3hkCZx99k5xQ22id8o=;
 b=F1/AWLt1d2Ek5HgRQ1iS3IQbTo1iTBhpf9ZduWl2jL9pKZIsd7D8e7UVOAWJQE+cM+EoWt3fd3thTpU/+BX7cQMWpuPnjMcA3QLPcIC7x1vuj5lm9oSVosexDo5Zh/LRGdcElTMfpJN7spnTLwQS/5eXwgU9XoFdxin4TWZoxNWw3wN4334qoW5Vpb6W+N0D9CKLOIvTdl5gemnZGbZkCp/wPqYoVd0k2u8UxHTtwuVZb5h8owdmSxvaNHzgEBQGAH/ZBGmZ6LZxtVA6aA89gNorLcHUGbzvsL1jUUa1YbCJle2UjIZQWigxU0s5G7apNf9cJYAXTK3qQCqfWnbS4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DM4PR11MB7326.namprd11.prod.outlook.com (2603:10b6:8:106::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 04:54:29 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 04:54:29 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [walnascar][PATCH] binutils: Fix CVE-2025-1178
Date: Tue, 20 May 2025 21:54:14 -0700
Message-ID: <20250521045414.449621-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0127.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::7) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DM4PR11MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: a18e9ea1-123f-4ff6-2fa0-08dd98239181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QbTc8SyUjai1uyvpyMcUnpjkeDvp3MB6XsE2WwJFiLv7WjWreNl/5067Ns9Z?=
 =?us-ascii?Q?Z14v/2nUd9V6lkcHiUllaSi9OchkeJK081cvNkLqINBQAjlNNwbSI+k18Gs/?=
 =?us-ascii?Q?4V907pvFUiwhoZWx/lsUYOoAHceK8fgp07RqlAsXmd70Z1V7dy8ZlRRjAlj0?=
 =?us-ascii?Q?LjSGe3FPiXuQkCSROL8jQYpjqIJ5ipUf6GBVMklSdOUmQ7FDGLyzIh+OclVM?=
 =?us-ascii?Q?kRjMYrdNlxLH7RKLySB+vx8pq23TGDV62edk1IiCOeapke/P+EKW+bCh4p0z?=
 =?us-ascii?Q?lpeBNbsy1kIHM5SZIcwzMirUedD/AHu4Xy6UbQ2QdDT6sPkESto507N5g/4W?=
 =?us-ascii?Q?JOqD84Kk5vbYFZVnzZDkiOYWXQBoOiIoof1FJdcn5fZCAG9SzDhUf6FMBPwl?=
 =?us-ascii?Q?CCVjASURgwXIon+IqEQE1qE1ZWBeN+QNyhsmXueUHpne9MSx2UHwbQebAzuz?=
 =?us-ascii?Q?9KMLVbvAY+ZDLE8Sax6gly2tpLNQpf2IGtq/8hkgOfTNlO3KcS7h2mdhlNbo?=
 =?us-ascii?Q?oKfZ4fdX85JzaoxMetAJb3ndtPz8YKij7ou+X0I9YSHU5FcSrQCFjSVfuHaH?=
 =?us-ascii?Q?73lo6GrK5Q4GpvMBDaPmEM1BYE3PBB0g8cZ2n3KdrYFFNmYO3VipVxYifntB?=
 =?us-ascii?Q?JmJdve0yPfM6XQ9o/3pgnKQFxCmgJuJhsE4vhK2xw1w/nDanixXOjgcmwXG8?=
 =?us-ascii?Q?KCUZS2HlMhkqRNvB6tKCpn796WPsaU/Twpz9CXHPRkJoHGymVEXuAY80MuQN?=
 =?us-ascii?Q?Qq01ZHhcntYGro2KbSfkHjUizWW1kRkg8S7Z84uF39k1gQjUu3XjnX1IHHP0?=
 =?us-ascii?Q?V7ZUENKFtmsEOoC26ivybtgHydVxeKChYwIo7sxbrggYr8IDXdvVWO8bW4iv?=
 =?us-ascii?Q?Pm+PJkrdWSUArhZeQClaZHJU+3DjwqwmC9ze3sJ8uydWfysRVtQKBONm59mi?=
 =?us-ascii?Q?0e+RDyGlZLtGgJG12GCpfpdRa4cYCzt/EMhbbnAXi9E73hmeoBOxOjcc+AvI?=
 =?us-ascii?Q?xfb9c+U1FkQEYu9dW+2lB6P5lsA1uQluCfLK+fVVCrkMlh2qsZcRoG/Pkij4?=
 =?us-ascii?Q?uWa/3Sj2EGDqqf++aKnLY8K0wmmCvpNzLCwoigTVwBottljvCqFmbdPMpLBc?=
 =?us-ascii?Q?U0J1FdU+Nw8t5Kg7b8IA/uQXF/fEJWxKSNSDfHe2qWw4rXwh3awFPOGKrBsb?=
 =?us-ascii?Q?Bwf+IhCLbaBBmD8axEP3qA1BbrHsQy0j+6lzhOQuBMBv30p4Qba+RDHZFsO/?=
 =?us-ascii?Q?IPYjUe93NGUoD85+hDhCqqwQ/+lJ76iPiDgpXz67PP4Dl+nTr0xjxTfw1grI?=
 =?us-ascii?Q?ydo7pdxtVwsjE4yHuEK3s2bMxed8qacHSo8nIuhdgCpU2bgKGikKbNam5rM6?=
 =?us-ascii?Q?WiYfUQB5fcybh/OvW2o4yORwafTAlBHEMEIlurGLM00Wc3TU1ZH2cUQKsI3L?=
 =?us-ascii?Q?uaDGucMRPb8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zOQXDeDAtvwGsANHBR9j17coYPXCV2Dav/kdDSo8g2461fAoKLEoNveEsGuR?=
 =?us-ascii?Q?VO+6zT7Qaw0pjWT85dMDwhbyPtU3aXS7UfNCFMYOcLMn5PeFGdrk2gFUmIG8?=
 =?us-ascii?Q?Z5zPBN9jCqEOGPFPV0qei8cOSws4pkUMVJvfc9G53NbDpMFJ4Iwn5boG8bkc?=
 =?us-ascii?Q?vufOwFumcdJQhpmXW2aKi8OhruZuJI5h0UiodJd3sT6AyCkghuWnzVzLtsrI?=
 =?us-ascii?Q?rkoKHK74emphrOaKoaCGy0dCaJpTgov2xVVt+vFGR9fGp0OkT6CWEX8Wbjag?=
 =?us-ascii?Q?FklvueAJ8/fX1/yEjVE2T1Lsl5jbunevBAF7hjE0y4rbt3tmdQN9RTP4JQrW?=
 =?us-ascii?Q?v/K2ajU1A+4JR2XAc6MXvb1Y30U8ALYggTVJA0+wetO1ijUAECiJTboVFxPc?=
 =?us-ascii?Q?Ck/41h/AM/4ER6kt6NhyIYH9X8zBtan2P5LN7EoOdWzst74MA1ZNNGsgTiUP?=
 =?us-ascii?Q?gNKnqxtUF03+/EUMbXQBvNcx6NfIp877GjJdu2Ea99S75A/f5yRMvPbECQvj?=
 =?us-ascii?Q?ekB1ldUIccvX5KGx5VEgTzYgi/fYHCvgeb0CpXPV+Tfodl+flwY1WXaNIwj2?=
 =?us-ascii?Q?0r9WQ4fqa2ja8YaFd5WTMqtbqpvBIrJtQ6HUH2mB0JqLCV6wY/m0zntjXxBz?=
 =?us-ascii?Q?+VtXUYvSPuDIwNoO5sWpYYHFJczo8Yoi6ovrX/Gc+gdh5h04X3XMNdzwHx6y?=
 =?us-ascii?Q?nEGe1O0dxcY9U32GKqnfy2bse2qP5NReIThbMqZkCVFxSdViGDNb/ML3gR3T?=
 =?us-ascii?Q?+SPDhmC1b6DDYSjBvkj4kBRfkevehpciOAZuoYATTtWaHzNXw5UntsE+JZ0y?=
 =?us-ascii?Q?kiWRU127Pf1ECPC05DxYoWhFo+WxD+V3fldxZ+nlT2r05m27jwnqgAZh6wRZ?=
 =?us-ascii?Q?ehLlBXWW/5auHfXkJtNjoM1u8caJZJjERqZWZrxUCs8HoPMO04y+6I0hfTfu?=
 =?us-ascii?Q?nj0KjiruPe4WVSGTbeqDSHESGxQgGFElJXWheoxdxrVS/kcgQp51u0J1qUDm?=
 =?us-ascii?Q?55haMlInkIaZULwNmvMjshk6+0+Vi1loyGEYAaEVyQH5HmO0e2vMBgeRXwcO?=
 =?us-ascii?Q?66kkx95KfwX4/fPM5Mk3KxqH4u7KiwRgaxUTukVAPAwb0bh/W0frAx9VcLgK?=
 =?us-ascii?Q?Z9dSCWRv9e76xHs3x4DgNaSEkCVB+uZKHEQwq+MPVBx/OsPXRkTM5s+rrNzb?=
 =?us-ascii?Q?ywqfjofpvYLvrqv8Ea7eKHInZrRSRPzl7tgti8ouJ884PnmiLq/8HT0d42XE?=
 =?us-ascii?Q?u63CTn6026ih8fdyZAqQBgNsdHiiNba+wOAV5kHnlBGhiDbIro5yBfJQIdwI?=
 =?us-ascii?Q?Tr7RPQzvD5Ehz0GkwSJovdNolFm+uc6E/YnJSzZreKDxM+z/AQdpGt17sW67?=
 =?us-ascii?Q?S5Fg77dNhoPq06uxmR0SwSJPnucD8KxymwtQLF8kpZ2QvcgUIjq3wx0FyuSL?=
 =?us-ascii?Q?88luM60a0cog97Vk5URKHfs9gLXy+/lCgMPP/mU1JHzGu05JyxWpXOZQPgUw?=
 =?us-ascii?Q?uv8jXxD2bg7ext75lHxMJMWq6uxNWUxPxoSqauMTqsuFo2vlKFfTm7SgpKS5?=
 =?us-ascii?Q?1mmdNe1fh7K+Zv/vt3qKK88DTFOcHHReA9WUXaSNp0aVZUWF5UdEQDZjPkQ7?=
 =?us-ascii?Q?RChBtFlk5+sSpu0h3yx4n6o=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a18e9ea1-123f-4ff6-2fa0-08dd98239181
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 04:54:29.0521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: duXSzqbVAnQBRpjMbKPlFq2WCApLChXfOOudsT14YUbUspw2dkCytVqI/D37Wb/0dScRpfTKPqVeQQ0ZLnjMFpt8J6PHntElf5V9uTVjHbBOyQAx+4yRlTuVj9q2txQ2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7326
X-Proofpoint-GUID: e_C3I_Tt9T3HjnAA12gfYF3XiTnqJxu8
X-Proofpoint-ORIG-GUID: e_C3I_Tt9T3HjnAA12gfYF3XiTnqJxu8
X-Authority-Analysis: v=2.4 cv=KJNaDEFo c=1 sm=1 tr=0 ts=682d5c8a cx=c_pps a=dIBsZBmI1wyUZqnlzmwqRg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=i07ikm3d_HJQnWEEXj0A:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA0NSBTYWx0ZWRfXxP04msnboLKJ bCIwrMq2zrQ7mgFF2qm8Ra2fUm+xwDdZECh87Vt7SGFJgHVXx9V8Z/0T5iZOv3+j0FExyBrKfSW JdSTPrLyLwGsIcbWWXFirTZ5aBjfrG35RifdAAx+5G790CtIdUsIfKJs2SIV/vH+y44+7D6vFoc
 CNwzzzNMwP7O0yACGfftiKQC7Bvh84S4RVi4mefuNjcQqqSxm9Xx+5pXhHe2EOjReKlXJSevGiP GevfQB6XcvvBLVKC96yUyUxul6C4arLx86oE2OVkX5hkHOxUASRyWlRItKvA5tE5kwEdqHNXbbx oCabRfK/Eq4rxHn2BMjIYg4/XtCGSvKiWIGymsC7cIhw4HGZzgirCw0SyZxJ+FFHbqlbAV/PPMY
 JqwlyzF/e1gb0eVKu+Dcm8qlTVQjeIevjiyySyZ07MSMbnCVDMQ5V6ghgppSkVIQqm288onn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505210045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 04:54:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216965

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Prevent an abort in the bfd linker when attempting to
generate dynamic relocs for a corrupt input file.

PR 32638

Backport a patch from upstream to fix CVE-2025-1178
Upstream-Status: Backport from [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=75086e9de1707281172cc77f178e7949a4414ed0]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0015-CVE-2025-1178.patch         | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 7a19aa31d5..395549a624 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -35,5 +35,6 @@ SRC_URI = "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
+     file://0015-CVE-2025-1178.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.patch b/meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.patch
new file mode 100644
index 0000000000..c39f43fba4
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.patch
@@ -0,0 +1,33 @@
+From 75086e9de1707281172cc77f178e7949a4414ed0 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 5 Feb 2025 13:26:51 +0000
+Subject: [PATCH] Prevent an abort in the bfd linker when attempting to
+ generate dynamic relocs for a corrupt input file.
+
+PR 32638
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=75086e9de1707281172cc77f178e7949a4414ed0]
+CVE: CVE-2025-1178
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index cb32732e..a08e9c97 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -5031,6 +5031,15 @@ elf_x86_64_finish_dynamic_symbol (bfd *output_bfd,
+ 
+       if (generate_dynamic_reloc)
+ 	{
++	  /* If the relgot section has not been created, then
++	     generate an error instead of a reloc.  cf PR 32638.  */
++	  if (relgot == NULL || relgot->size == 0)
++	    {
++	      info->callbacks->einfo (_("%F%pB: Unable to generate dynamic relocs because a suitable section does not exist\n"),
++					output_bfd);
++	      return false;
++	    }
++	  
+ 	  if (relative_reloc_name != NULL
+ 	      && htab->params->report_relative_reloc)
+ 	    _bfd_x86_elf_link_report_relative_reloc
-- 
2.49.0


