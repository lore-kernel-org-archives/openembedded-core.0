Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56CCC77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 10:42:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5516.1750761739906292456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 03:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=827047d704=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O4cDGv027019
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 03:42:19 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14ttyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 03:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsfsGZR/JWOOwa08yRg4fk1HrM5IHC4iN0aiLf1FQ4tXt2VuNj3Hb0f24gMUFSEU51tyzF4FgtRBv94D0szNXE28HXECeLzdGGqD8xPhjzNnMPKSab1l/8eTlyIrW5THinFd9qP4isTk/O3fGxGqs83DypvchNasvKEPQRn6DpbKkWBaF5X2MhgTr/X/ptMF8zS+/9I9iUdda/8RdyrHCBUt7JXnttOtKSMRmwQqYssNBXljCuMzZcDqZTd3BCRfsrAY1GfyI/zF0700oO+pmgaGY9Aay2zCkvGfEhOx5LaHVDOEoFrgrU05Co+F0VDao+upP47dlel4v+dqoJy3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrPzlXpCxxR0acO4pYTsgO8/78FO0/2DMZhNKzsbtdk=;
 b=hOgxgWOuj6kBCiZwd9K/y2SZooVvVf0AJD+KBH+dQ/ZBnDs+snkdA8mDd/tGPwi+nAgXqnbE1J/FCKZ2DOm6IUse0rRwW9ZK3L5A+KyyVg1lylnF34FW9qegsztUWcLReGOp0K3DUdw5bqsq2LNa1nf6fJa27452Nf0fupIidFE8mhuWegVPfuMKAt19Rtz1N1JS2y1xff/8GhO533aoEwCEMeNmzJLdla3Kg+01gEdGbDE404yddQVOmOY4BGGzi++UVsvBFlLDkFxo889uzDEUoYFAPcovYFO6I/LnUpagJaljBgFHukp4qXthQCz2R8gGYuuBUcpFhaCjWwZqeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB8083.namprd11.prod.outlook.com (2603:10b6:8:15e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.30; Tue, 24 Jun 2025 10:42:17 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 10:42:17 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] libksba: drop -unknown suffix from version number
Date: Tue, 24 Jun 2025 18:41:53 +0800
Message-Id: <20250624104155.559827-7-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624104155.559827-1-yi.zhao@windriver.com>
References: <20250624104155.559827-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0116.jpnprd01.prod.outlook.com
 (2603:1096:405:4::32) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dbc1090-141a-47ea-658f-08ddb30bca2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?++S7YDiQGyglEVjZ79gMyqpk8F40TMxIc73Yk2+fe/3A9UsUnPDoCP/vEQIj?=
 =?us-ascii?Q?9fMuC8MoLutjAd86I0Iy+Llg963Pb7yUxQbh/tQCwZUjd3NSiUmDyPSgovA3?=
 =?us-ascii?Q?v/XLl6Ln9F3u5riOyMIMZT4L1/+fOSZNNTcwxCQXXj2CRz005+CGp8e5liRZ?=
 =?us-ascii?Q?3+0iWXqahWGqcnkZxTO2Kkv3HlbZp5VOuj86xCR/V9BJdAAs39IYU39hnm0g?=
 =?us-ascii?Q?ZU+ogaoQA8x28PsPo/VoGC8ezh94sk5AJOXdPCM4wKkfprFaSJ1PjzEqR80y?=
 =?us-ascii?Q?Ej+BaZ9zMCd3IuIA252CHdTDg5+fZTHNveXxoGrFsr4bruCJzYZEq51G4oYl?=
 =?us-ascii?Q?VpGwG4W2YWCiYa1FYCJoM+JR6uw/fUuXufjIPxjMIUuAzGmc5hLeBFjsfx/6?=
 =?us-ascii?Q?iiWZtI5GgMUQNBed0m0/106VXXHGuOhxTGxOyGwM/Xk2gaQyhis6IYIZmb3i?=
 =?us-ascii?Q?9wpJn/UlDvfh5AYRqJCyKQrIB5EfFjNztAnWENMRIZL6Cd4ppt8u0LA+U+nX?=
 =?us-ascii?Q?17zd9DyufgYBIhEnHXtJ5Y8P0fPkDeOnUKDgv/xPANkX7Nxy8bLOCJm8c+W2?=
 =?us-ascii?Q?YTnvBc82XTf0IFG8CBr5OcrOIU2h8Dj71B8RVeJgYYVP8Vsk5NNPhc2plfe0?=
 =?us-ascii?Q?iHop9tAUPaF7rcToNvEqGCOt45dXWpNxJpKGe1r1H53H3d9Z0zTBYVd5Pvs3?=
 =?us-ascii?Q?yb0+YyoKdrbAOryHxrU3ZTOlwfDv8aXF7cbHDzNB0se6qZ5IFOjHq0TTmJTQ?=
 =?us-ascii?Q?gvpIvn372er0fjalSj/jPoAWKAenGuZcoc3UzYteckbgSlFRruQRjwIcwan+?=
 =?us-ascii?Q?5HsDRqXDOOcyt7b0zPyXTnHDAF9XH8flpKR+zkGtiK9hsVB0bTbtJ4ejSpTp?=
 =?us-ascii?Q?K9HYPgewOhQIJSbvI6yW/vH+OBFUq53CP9PRW35vgA+zreEQOlABV+br72IT?=
 =?us-ascii?Q?v856/b4q78YOb2n7GO2Jr173BFmvjJ5YPQVU8D+nFLB+U5OYus93xbHbuk3+?=
 =?us-ascii?Q?tVG338Z2vPJwhkICk9Nii/nFrqg6hCGI8iCEcRt8Fbx0UzXr/deZgOnBX0DQ?=
 =?us-ascii?Q?yVcXhWNN72Z4fccKowr6ouS9KMh3pS76F5bgfZHPB/8KmozC7Dj5MOYTVac9?=
 =?us-ascii?Q?/dFT8jdwV/GSzaHanNJeXfO8jAOMsZZf3b2WgjcGRaXYmp0eWQbKlUsdXCAc?=
 =?us-ascii?Q?QGg5KwuA/hjpADfl3zW5b55kkMuAhCeWqjRd+INr5SMCF0S+zHpPsrEqtv8o?=
 =?us-ascii?Q?e02No7VD+IIPTRbUkw7x4YC002NK9LScR9OCXvoWhgM7WYgicE64rHKkv3/Z?=
 =?us-ascii?Q?lCq+D5Rv6qVal8vwe8fYf/3yFlx237GCZ4+w5Ul4Kt6LfWvBd+hSmEV8A3WG?=
 =?us-ascii?Q?LRQ0Vts6qO3nqyvx/cRkImwj8xol+JXf5wxPl5Zxe5JZTUbEKS2UfOCsThRR?=
 =?us-ascii?Q?94gvyJ8ExbM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hUkd0+200QnrNbq3JZrA0hGpFk51zAzUVJwdZ3ihylyzXseTVeJnNdM5PpBd?=
 =?us-ascii?Q?9j1A4nWMUssYZOPR759083pL4sF8C8uaZxgZ6xszf/DO5PcAF2S/CIPZU5xn?=
 =?us-ascii?Q?dkx919qCmxC1unjismDsBvbvfJPUuIDMjYXs7pAJ/1BO8/ZYNou8xg+oi+K0?=
 =?us-ascii?Q?eRkGRBphILdcNYx2OAXgoaPV8akVeVp45VLFnesyMK9Y3lhbzwV2cP/Y61UI?=
 =?us-ascii?Q?7mN3zq8pwJNCWxoZ/G9gGBY7cYSe4yjdomYu8IWKttUmoR+oko3qIECRqI26?=
 =?us-ascii?Q?C7aUwpFmXMPBcL5bJXY7Pa0iisqRezsotO/WEHlNsqrkSicHXXTEqlAuy69X?=
 =?us-ascii?Q?pgT1bvM4GLoM/uOuSDJlq2rdum04P5cdhrJfPDcApv9pAdnm/WpekUHJ0B23?=
 =?us-ascii?Q?SJ1LVO6GLOphysUOKbKfA3IuCGaygAQcypu8BzgcNTD8HMVWfw9Iti0Y7OPb?=
 =?us-ascii?Q?FXgW3GmMIjx8hIKkUACqh5PJKrvBvuQ6hnjUMMA2CplwUd/WIEKRdkTtOOCd?=
 =?us-ascii?Q?Zn9HctpohlnwfPvq2nOGotaGSlaA4S5Zo5Z3Ib0ueTZze2LG4/oy7YEhkzO4?=
 =?us-ascii?Q?c3nOL8Qad5kisXF1Dzcf0iOlwaoAvOXtvWxiILyebahi3DqOu76y4who7Vke?=
 =?us-ascii?Q?MGKlxL46u+wa/9gcgPoDIbvEFSOW8AOg5f12+b01WjdVofaiMtwXrg6K/e2S?=
 =?us-ascii?Q?5PKR99MadxoLVjxV5qh0rmTocDMug3ahAWgNk+vJCDwcmvekgOaOsFWSEor2?=
 =?us-ascii?Q?rATNrdGUIKqzRET8mBbR+jlR0CV6imughqfAopU8JNkHgGz8K8+LBw4oYw9J?=
 =?us-ascii?Q?LXRQTC32/5eadS1LE2mWPJXlyLOyg5SUT6HNxd/aJX6iXFcVB5C/is/GHbni?=
 =?us-ascii?Q?8N74TGDUQD/IsgLAbVw8Sb/b1VDR42cbbOFHAYxCvfk95XS3Po44zc/aIdAz?=
 =?us-ascii?Q?6oQAyKaz4vm0T7nJSNPCu6CPb11Utb0OLwiH+8zGGA6JlpmLDKMt5BPeSgqO?=
 =?us-ascii?Q?myAhpvEVYBhYP5RL4gX8rVOSfWhZTCKDPlw2NRloZy4rroptRxD8Faj2G18/?=
 =?us-ascii?Q?u6BrlU2TOdMgMFlGjA4ee0VKVNPcG1S+H3yRx6BAAWeF04Lt/CeDlD2ShTam?=
 =?us-ascii?Q?PNmk5dTakUpaZ7J+cwcdTPFrCjLrd2gNnnQGz0vFWjRaD07m8dGSsC+UhnSm?=
 =?us-ascii?Q?oE9ESWvixRwmPYmDqOg3kyzm3aDaOB4T8qOgM8gEN2bYLIiJtBR3XYkN3Fet?=
 =?us-ascii?Q?Z5pLITKdRdQZgDDZyuCOTm7cHYD4ldLUlUBT38JYwTh4jYtnlGWIG8O+K4pb?=
 =?us-ascii?Q?oR5tFcQ83ztnEp+zKqDPKBO5TN5h76JaZ7Qa8Tpdrdf5zmsMZsFxKp55pB4z?=
 =?us-ascii?Q?6zDa5S4BBRRuhCaUAFHh/gyeUE3umcGztX1aYAm/SUKppAU7bQg8f4iGspUd?=
 =?us-ascii?Q?rbXeNtU8V7uUsxejqrPJrTKL1c8OyeRD0dPVjSNHAsMKjBBY+VF5C82NMBra?=
 =?us-ascii?Q?isDGSGIK7SHeu6pC1LMC0E7HWukn4EDB+2xhG6Cgna24fXXatf1qelL5PTFD?=
 =?us-ascii?Q?1RMJt2taQ/MMHBU2oZi20bcDqgjt9H+T3sEw7MmP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dbc1090-141a-47ea-658f-08ddb30bca2e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 10:42:17.6173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fjxdvl6aiEs2ZtNRcJP/7OWAI6pJzwN55OfUSEyHvw3VSoc/Fb3I2WGA70G4L9kPfVyKzG4hX9L1oyWcwJVroQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8083
X-Proofpoint-ORIG-GUID: qrjcdBDuwVdPIkafmrsRIIqxE0u_EH9E
X-Proofpoint-GUID: qrjcdBDuwVdPIkafmrsRIIqxE0u_EH9E
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=685a810b cx=c_pps a=3w+TbvVJ0pkczneH0cxqQw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8 a=99BbB_j3FNS7aohJxzYA:9 a=4f0m0rT7cLEA:10 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA5MCBTYWx0ZWRfX8C+xbEiCqyE+ Z2b8vD7UmJZxxxLw7bHCNro5JQ5BGlEV2iDvFqF+0GuK+II0mzmlQE3FDl9++5DpO4UAgN6yx1D cZnaFNqeab0hCrgbao3BEMDjuqlxd8HkTYHf1AdosVP9YgQUkYMyBGFGSJKNWLybkA3EVvUIxt9
 k7uZjKC7u2vr+X8kKU9xBlUO5ahE+IqEu2ryipBCCIgafpDdLGfMHLjd0T5ijIU81ItphybPiHb WF4+6wlnzwDpXvCfDwQZdFWtJDlF/L4yugb+2Iun6tkVB5xoBsK+lM1O4zuyMgrDn7zJ+TFTK99 qkvGdg0BkDMRgZ+vKzutG1jONL29M2m95e0DijkrporgBh73w/KXg2aboj/8bpggRsjp2NnetB3
 weuG/biKxTqwuJP9Zfj9VaqMEAWZ4EcqZ0McLOlNHumxD8+GagZJF3TJKmA6wRpwF7HL14oy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 10:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219247

If autogen.sh is run outside of a git repo, the find-version function
always assumes that libksba is a beta version and adds the suffix
'-unknown' to the version number.

Befor the fix:
$ cat /usr/lib/pkgconfig/ksba.pc
[snip]
Name: ksba
Description: X.509 and CMS support library
Requires: gpg-error
Version: 1.6.7-unknown
Cflags: -I${includedir}
[snip]

After the fix:
$ cat /usr/lib/pkgconfig/ksba.pc
[snip]
Name: ksba
Description: X.509 and CMS support library
Requires: gpg-error
Version: 1.6.7
Cflags: -I${includedir}
[snip]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...p-unknown-suffix-from-version-number.patch | 35 +++++++++++++++++++
 meta/recipes-support/libksba/libksba_1.6.7.bb |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libksba/libksba/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch

diff --git a/meta/recipes-support/libksba/libksba/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch b/meta/recipes-support/libksba/libksba/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
new file mode 100644
index 0000000000..39d50af837
--- /dev/null
+++ b/meta/recipes-support/libksba/libksba/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
@@ -0,0 +1,35 @@
+From 5837fbaa76e6959ea895dc118893fb60957012fc Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 15 Apr 2025 15:32:58 +0800
+Subject: [PATCH] autogen.sh: drop '-unknown' suffix from version number
+
+If autogen.sh is run outside of a git repo, the find-version function
+always assumes that libksba is a beta version and adds the suffix
+'-unknown' to the version number. This should not work for users who use
+tarball and re-run autoconf in build directory.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ autogen.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index e6efe33..6acff4d 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -269,8 +269,8 @@ if [ "$myhost" = "find-version" ]; then
+       rvd=$((0x$(echo ${rev} | dd bs=1 count=4 2>/dev/null)))
+     else
+       ingit=no
+-      beta=yes
+-      tmp="-unknown"
++      beta=no
++      tmp=""
+       rev="0000000"
+       rvd="0"
+     fi
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libksba/libksba_1.6.7.bb b/meta/recipes-support/libksba/libksba_1.6.7.bb
index b7a9fc4050..28ce97ac6a 100644
--- a/meta/recipes-support/libksba/libksba_1.6.7.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.7.bb
@@ -22,7 +22,8 @@ inherit autotools binconfig-disabled pkgconfig texinfo
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://ksba-add-pkgconfig-support.patch"
+           file://ksba-add-pkgconfig-support.patch \
+           file://0001-autogen.sh-drop-unknown-suffix-from-version-number.patch"
 
 SRC_URI[sha256sum] = "cf72510b8ebb4eb6693eef765749d83677a03c79291a311040a5bfd79baab763"
 
-- 
2.34.1


