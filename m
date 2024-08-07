Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45429C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 03:34:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.24871.1723001660743283916
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 20:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8949aa9b73=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4772rfCg008721
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Aug 2024 20:34:20 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v0hv80n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 20:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OsvFKSwFOjAxEYAO3J2XZtfI/3Ywljdn4Wp3l3YiTHrCuaRsFilc+EgWnJzf0H9IKbbUn9JsKNp0UKZz3zlKvFBn3PV1rAWd+5z1y73dYzdSJEAyByPzgiQ97RDyMW/Br5I5YQ4EXdt+VJQUTgDy/3U9zO5J5Dpbeh6EsiM3f8CWuclX5XwRbw+lG/pKmSSPi5uEBLCxRAqR/ctd1KrVgSpzmyyoDzOYonLNyXyxwxO9Gbbtt65l2BoMca45CtXH7UKrpo3cAw4/FvwmmdRvJ4nCId/tZKuaAaqIi5wQzvffDZfRpvIaYekOD+pBB+Au9xFbFbrsnf3kluBlUPDxcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpRzpA6EqD2Q6a4v6xHwlceSXYMf+KMVfPy5GP89aQY=;
 b=XZWfjDozycZPoF/81xzIEQzHe1R3RIk0M8q0+K/HkBbn1q4EAqQUPlkmFLgzPtZ0Dhy7a9+7OD0NmFmAQLmxIY96D3MseaE02scZ++akK7fj58dverANVuyKicFXBTLcY+h7hpMtrkpqqPTPT46oUORwaQT5+SZROcYPGZ06Z9eGXF4aFuaowY6YH1bYbKEkFa1j/fewNhH6GodNnPpR/owIisq/wzDzpeDRGAae87u+qb9FwQZKj1M+g0eeLDy1rkJOGmbLP6yL1HjS0wKOJg4tbG0E5tiGrchtXgrEvQA/z4waSk0Xfl3MA/VoZUZ1a3Q68CXijqDlQKd67w0Jxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB8523.namprd11.prod.outlook.com (2603:10b6:806:3b5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Wed, 7 Aug
 2024 03:34:16 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 03:34:16 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] kexec-tools: avoid kernel warning
Date: Tue,  6 Aug 2024 20:34:04 -0700
Message-Id: <20240807033404.1513069-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0050.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::27) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e90b93-c612-480d-ed0d-08dcb691d031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ztWnUPkWzYAaenm369PWofkDCzo1Nz8HL8v7qFeztrUFOa1coVkxIK1eGG00?=
 =?us-ascii?Q?LmTjlX3MSNlcR/EQO5Rca/Awc9DIfpdhvYa7qJaFoafVhjAkLC0XUB+JYax6?=
 =?us-ascii?Q?PCorzPza+ge1m5UvVxQW8GBT0weZJsBtbcC8VJ3QFhJEQp3Be1yKFOWq5h8X?=
 =?us-ascii?Q?gMjpbI1zaJxkubYLXbL08GSQIKGcemMDIC68QFbDQ+cSqdrGxrizZpOjpGDn?=
 =?us-ascii?Q?Zd5ztTatkr0sy0H4O2VSlpBeivENoxlCBw3dvT/VF0tEWV6Vb/uo9s3Bdryh?=
 =?us-ascii?Q?mIg9uaPsnjlYww8Or7xSVq9bZEy13Y2qytQOumRlfBxdSiGtTME0jkvs5p3M?=
 =?us-ascii?Q?juA4yI2xpjvrwxjb5RzgS6DaYV/mUjg5aZ874yeAB3h+BU7/SsfG+PLw2bd/?=
 =?us-ascii?Q?ulpt+h3LKzHIb5+f9jFYzbCOW2VTkzkZCpMHoFPC7kERL0Z0IkYnuE7gzYwY?=
 =?us-ascii?Q?8UZbZiIL8Kpc/7wNLRhXSHEvzcPADEfZJjjo0Z14P5khj65GqQdYP70RQBfU?=
 =?us-ascii?Q?sC1MvlxD4w7VLBotq1AcQYDWlihRAE3pvtBioaoUDRgaljqXAdk70E7soNNd?=
 =?us-ascii?Q?M+vOqlRxBCwXg/+FTcwSGacIjmmnoqQ8mxN7QajDoP3Yg3dH6W6Hkae050Z1?=
 =?us-ascii?Q?Wo+1/ffTnF/SiiaT+Es9B3JcvJxDfr8zzrwSPzBlbL1yWjE+tVjQVLWNbvnQ?=
 =?us-ascii?Q?wznopxn2ri2/9jwAB9PY2wGQ0HS8EWCOc5b/k+MgzD3Rdc8U2R/4c53XU+6M?=
 =?us-ascii?Q?dm3KF/YKbo00tLxFPgabNWjQ5s88+q3GYPUFq0O1xiudZnGCIxRSmDM82m1T?=
 =?us-ascii?Q?8DuGDcz45fPDBp3q773ZQXnR07cIb1gvRt2OSRjglXk6cehT4O1BAjZKEQV2?=
 =?us-ascii?Q?GcBoBA8kPV8FdpL4zfyYJSpa4V+ePJ/GlSNRt++n47H/PU4lM7bqmfdrzcV4?=
 =?us-ascii?Q?CER9UijZ8UD+PehGmgJxHvJjlbz06Wq2+TbcUSGLJeYAwRQKFBPidScuCcwf?=
 =?us-ascii?Q?aZL6B+phv8qUaPiFCpED9UTbb3zj96NQHABQreStdkEGgv2FDLAhnOROD0nW?=
 =?us-ascii?Q?lQib1tMctGjW1ePjnKRIr8bz21OGLGH9lsTOhWo8Mv4h/o6vlcN5mRRdOylf?=
 =?us-ascii?Q?a3iSS0BAIUU47fi8Wd6Bx1v2cj8FOgmzJE0/mp58m+f0Bk+QdllI/L3o1InX?=
 =?us-ascii?Q?QQfXRqYeolBZfGfldvfXBHIyfkSCfVdvfb2ju9PmEYRZR1c5w7bIGKeelGc9?=
 =?us-ascii?Q?F1qarUfiwTD9nKJVkG5VJaJAkemWKw29Yo3H+QsaHdeC0yl+qRyd2yDb4+hT?=
 =?us-ascii?Q?C5C0hDvxvPYkqyVpCgnH9PNW/UWAqIEO5TmCXJX9rFsxs5Okid+TisnDQ9qC?=
 =?us-ascii?Q?gLuEs3Etfk11J8Vu8NJ6fxnG6hRz+fl8VvvpPGdyGs/7u/DyNw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DyKMPGXQS9bg0sWIctmLZ7Jb5s4qBZPw6EaGJKbOb8CIG2OdVbOJU2R0TVlL?=
 =?us-ascii?Q?pyzyUh49x3ORs7HWwFunB74cqWSs93/AYAr5EyfAVT64P4NFZI/djYQvS/FB?=
 =?us-ascii?Q?5E2UR5/DfDzp9X5F/TzrB7iONNpteHCK39KVB4my3kZLBj4rirFdguzZa54n?=
 =?us-ascii?Q?r62Q8PxyivjivZlpHx8ne283j//+eps/38GwzCHpG+xVFz4ANLoHZicnEyXm?=
 =?us-ascii?Q?FF/gTjyggsqF2lfbY0LWG0amDGrbNymJSHUvkkGrNQNw/GgHJeqAK9V0rXEk?=
 =?us-ascii?Q?yVdvoSDUJeCgg1U9FS8u45zSp/j8V08dH3xn0gmOI0ICLUgfgMOjwERnNSC5?=
 =?us-ascii?Q?XYkfhd/L2pOotdNEqAwOn4ko05tPRudRtF77peeugaOLE5Y+8ETJ930DS8H3?=
 =?us-ascii?Q?s0o5Z7JlqEOjbPn0uHt1s0+HLf9P+Jw2F2lWwwU4bn2agQYo+GwbcTeZkL4B?=
 =?us-ascii?Q?gQBaLXlk00cf6EjqJUsp+rM61xDPUve7tHYMkh+a/xgeAPS4eZd6/JXdtecc?=
 =?us-ascii?Q?vS0c5K8IGat1kxHGvpeFLeQSPwjIWrHNkBawYB9XIgHr2QYEhyGWUwCS+673?=
 =?us-ascii?Q?fi+jx/f2NsLA9dXHmSnd28WAlaePKSSS2Ri3JHWRYMxniQQfU1o/l7lBeMXi?=
 =?us-ascii?Q?9614tfAURcszBO8LJs/hTa2mqIC40GcA77dGTU2dzT6ISButAKKxj1vPf61D?=
 =?us-ascii?Q?ow6siDfKHzp1BhaEW0URLVt6lywW7shubHcsqyURaPhZzTdE39eMu/0+wTvw?=
 =?us-ascii?Q?1BTpSNjxAJmUioRwBQh74xEe1cFTxOiqq1OJ8sI9Mb6TSvCAdhOf6Qoo03pa?=
 =?us-ascii?Q?8bnZsiQRpH8HpQElAb0xIB9O60Ux5dGLnwZEhn/KoDvy3L8LnxkO6gGFJFan?=
 =?us-ascii?Q?u9X9oCmHKgiNV1BSFy+lkNymKNQzF5A+lCfLqcoWxEYwu0SDuq8pYIDiucPv?=
 =?us-ascii?Q?7VgAWJwwiFX/AhgW58Z+G/jTEAjLbDGbY2VGDJNfw0LN9COnAy8bqR7cRVRc?=
 =?us-ascii?Q?vaU2uV+8XQpolbtmCQnNyO0FGrMRK4HVsdHbWNtwwXe8k7GAFhvpxodeXj/o?=
 =?us-ascii?Q?eWQEaO4aBBUXuvZqZzBmQWLMdSwBZR40W1iUDVjSsO51HOfZI9oXMdg/2few?=
 =?us-ascii?Q?XDzUMPdOgMGhnCC0WuiiXbeJkVEssAIsV+hFDBaGscu+S7GOphjiwVtE+IHp?=
 =?us-ascii?Q?uE+Q6s8AjMtClsanzUf2TIrdX91Kkbku9OFWo9wtM2rrxPcOoUBac4pQyl8d?=
 =?us-ascii?Q?Q+chZmqgwSEKNORcEoH2w7Oxak18w+NstTb+5C4GKJ02R6gg0/+Nulig9UWt?=
 =?us-ascii?Q?rnZV71kQSz6aSDxLTKGykzOVJ75oUVHCy2TPFn/Rqv1KUiXKi2921NnPLmOk?=
 =?us-ascii?Q?0Ie9R9GAm11vuxTRjCfwOeD/ctIAGZrDAZPQUf2cZ2QrwqvSR3KrQebZOs6F?=
 =?us-ascii?Q?1P3TG1p63n3ac1El2pVusRmLgxZl1DVsRFJbvpVe5+Rqg70nzrmuGlsN56gC?=
 =?us-ascii?Q?IIxzsuxwZbTE2Md0Boc2J9SwcEDESzAROH/rOhF1OzEudDGQbyfuQjq2GjZ3?=
 =?us-ascii?Q?faZdPDMugmV1CEA5SJUeApyGV0oOsPps3k8moKJ2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e90b93-c612-480d-ed0d-08dcb691d031
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 03:34:16.0071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJSAmGA6xmlwDqfXjSVph3sybEwXYLXHW2HApfqTNWeorIvyVEJNtkDrvwCcP8RcSPGUqnLLxAiGiRJ4uWFyUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8523
X-Proofpoint-ORIG-GUID: ZvqgKm3LpPrQeuZ5ooTGFmgFTDob3HQg
X-Proofpoint-GUID: ZvqgKm3LpPrQeuZ5ooTGFmgFTDob3HQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_20,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408070020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 03:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203052

From: Chen Qi <Qi.Chen@windriver.com>

Running command 'kexec -p /path/to/crash-kernel --reuse-cmdline' will
give out the following warning:

  kexec[970]: memfd_create() called without MFD_EXEC or MFD_NOEXEC_SEAL set

Add MFD_NOEXEC_SEAL explicitly to avoid such warning.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...-add-MFD_NOEXEC_SEAL-flag-explicitly.patch | 36 +++++++++++++++++++
 .../kexec/kexec-tools_2.0.28.bb               |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
new file mode 100644
index 0000000000..3b11555a1b
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
@@ -0,0 +1,36 @@
+From 6436da0b58b59e1b4cd3924bd007108b8ddf73dc Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 6 Aug 2024 19:41:30 -0700
+Subject: [PATCH] kexec.c: add MFD_NOEXEC_SEAL flag explicitly
+
+Add MFD_NOEXEC_SEAL to avoid kernel warning like below:
+
+  kexec[970]: memfd_create() called without MFD_EXEC or MFD_NOEXEC_SEAL set
+
+As the above two flags are only available in newer kernels, ideally
+we need to do some fallback. But we know for sure that OE scarthgap/master
+is using >6.6 kernel, so we don't need to do such fallback.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ kexec/kexec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kexec/kexec.c b/kexec/kexec.c
+index 08edfca..c5f52d4 100644
+--- a/kexec/kexec.c
++++ b/kexec/kexec.c
+@@ -655,7 +655,7 @@ static int copybuf_memfd(const char *kernel_buf, size_t size)
+ {
+ 	int fd, count;
+ 
+-	fd = memfd_create("kernel", MFD_ALLOW_SEALING);
++	fd = memfd_create("kernel", MFD_ALLOW_SEALING | MFD_NOEXEC_SEAL);
+ 	if (fd == -1)
+ 		return fd;
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
index f0a484f884..830d9ce585 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
@@ -19,6 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
            file://Fix-building-on-x86_64-with-binutils-2.41.patch \
            file://0001-x86-linux-setup.c-Use-POSIX-basename-API.patch \
+           file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch \
            "
 
 SRC_URI[sha256sum] = "f33d2660b3e38d25a127e87097978e0f7a9a73ab5151a29eb80974d169ff6a29"
-- 
2.25.1


