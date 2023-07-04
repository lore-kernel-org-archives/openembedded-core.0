Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85135C001B3
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 07:39:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.53707.1688456383588620080
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 00:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lQzJ8kwZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65495b23ec=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3646e2nT013068
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Jul 2023 00:39:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=UJPfHq35KwqTLQxe/N2zyK5Ti3qbtPbO7neshyeADcA=; b=
	lQzJ8kwZUs0nSls7lPRxugUMQEsxN3n0xKw3Ju5w9u+0G99flD9YYrgE6gwushjb
	pbFyjVqepSXV0QDera4HF/xdydWnulhz69jSo7kNUTERbqo7ESMGWRdfksVaJb5V
	FS103AGKr0KlyLxuJbaAFrus4gp435pAHdTfXVQpeTeb2xGue6JdNbGaE4+EV/X+
	c+Z1nTuFKLvZlSGyz9sPcuZfQnq91zt/ZPychTdRSE26Suv9vy776+KM6O4G91as
	sAGPbgTiwG0j9RAqZjL8hxshXXF1LxQkNfVyBuS+ho+hACxtZ7gps0eWLjW1xbfu
	Q53BkTQ9aZ8i2r1tmcLB4g==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rjfdyt1nc-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 00:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8DgpUyp3JtbaCJo5Zc03wDscTy8IBHvuc3XKX8cndlMP0VJFqiERlK4afVOlTxP59MsHyc/viYxflXRGk+zgliOcrd5OsX3g8o6se6KQw5WIF134AMbQ6g+6IAws/8IDxfvSP6pSK8GtsuisL85AV2bO/TiabTZY6Ljsj4Sgzr5wkohbTNiQDAjgM5VZzgCOrjO06djYcnzrSRMwu18B0O/C5cuOM0lFO3GY7riTH9RCRDhlWt/eMZ+pop1k21x5NDSicZSU8PD+49+LwIyLDfc5+yjflzVoLDLNp3LSKHGWcuiSFUul7VNjMHo0UylSyC9Sry7s17N8ZkA2HGniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJPfHq35KwqTLQxe/N2zyK5Ti3qbtPbO7neshyeADcA=;
 b=fj740mvCf1/FvpnpP9l7a6kCRi/c4kIwQIG8C9gpwZRYo88mKksjdnez5nB2w0PVUCL+E3fq+i9obJqHU6jbacyVBU4lsFepQf24eLoV79sx70dnJK9bFDSsuV7s5V/KlDHeA3JLdxDzXk+SrhxJPIBdt/Lf/QgAUD7lJhZBL8GXKTnwU6wxGAafX6gkOxUjJ0o/bXMTJd7LvowSzqrUOE381E8jUuyYQtPp+SwIiHa6xo6yJhiSh7XaWJeqaF4EhaDFFHjm6YplppiNNL2uKmUFT1xy7wAt28gqbZ0uHsrgSzlQFsCTb+bD2dhaBx/ARSZGCqY1CjRWN/3NssfB1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by CY5PR11MB6461.namprd11.prod.outlook.com (2603:10b6:930:33::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 07:39:41 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::3686:e9c9:56d6:8949]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::3686:e9c9:56d6:8949%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 07:39:41 +0000
From: ovidiu.panait@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/5] mdadm: re-add mdadm-ptest to PTESTS_SLOW
Date: Tue,  4 Jul 2023 10:39:19 +0300
Message-Id: <20230704073919.1593400-5-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230704073919.1593400-1-ovidiu.panait@windriver.com>
References: <20230704073919.1593400-1-ovidiu.panait@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0102CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::17) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|CY5PR11MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: 42b81132-4659-4984-72a4-08db7c61d427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9iNPGeeyAuxeelACA0WZKUPYCJGzvbNa+5yJ1XA3GqmRftCCmA6A9HZTfHvkf/GNWSTlTvco4IwdXEZTo2za/h1FLetplNaONhTYUKUvBNUhnSkY/1rHb0gDqG0+dSbkoEXaeBwRDpfu4iF4hcNpVi5BNqgjbqkc4VVMNe0ZnOSltGTZiZAMVUXoMf/O5UGBEDNIEONOAqqUUorrD9Zeg8m9YJEZAq6u2veE5fyuZtn6rIZLnZrEyNKW4RCMWi5gFbbH9gLed0rmKF8DFBrU3i5GJn75ZltZI8SYtz4cEjLOcvx/+zCdTjYf1x4G0dyiSOLhIn3FYrYiqrqfCTG3lGrrCjt8b97j+kUiSDnYYjqvei6LZbi0QoMlcpwYKOUnNClB3jDtV7RcmKOMJBu/lLw15YxzsTONhyXxbAOyKSmWz0CPAWK3pWH7nEdFsaoDO7NuD8qG+ZabigEXOj5EJ6XU64Cab1RBtVe/JFq1S+bf0MyRRJos5dqmr9pq2KW19GrWaCQ9bXHQKUJ2hIIEeL/M4MslALklf+7HMmUoy43khVr420u3KFnuwzfeQ1IiEVcy3afs50Wr98JZ6pGbPIbTPr2ag4N5DUAqde1ND2w95rKJ1ifGFLre+zgJROkk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(39850400004)(396003)(136003)(451199021)(41300700001)(38100700002)(6666004)(38350700002)(52116002)(2616005)(83380400001)(6506007)(26005)(186003)(1076003)(6512007)(86362001)(9686003)(6486002)(478600001)(316002)(2906002)(66556008)(66946007)(36756003)(66476007)(8936002)(8676002)(6916009)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+7pTME4tJRhSuL2Eq67cbnJcEhLqiZUy9fJn8pCmy2rqZXiLG7fL8gzNKjd9?=
 =?us-ascii?Q?LqoF6toedOdyBQRUag/sGw34VmM/m12S/TIiqVHOf/i6E3gyGSTDI4unYCcX?=
 =?us-ascii?Q?IMDEM4Ah1C8R8q15ujpPNdJpbwkv/i07RgghJhJBFM8JeTbF+DyngpQ7YKJn?=
 =?us-ascii?Q?kx+kFX9K+lvgrqpHAXrvEDUe6U7MjOD0+7JXjGKJWhrBFNuNG9l3TRaHV+vB?=
 =?us-ascii?Q?Yk9IaNHZ7oyzNbfVok6axG9e61dDG6lvm9tntlLqy8fVEyrfSzrq/vaX7L6U?=
 =?us-ascii?Q?+DF5NuYbYWZWn3zs8BwayRZKpkj8YCifgo9ISWGpHDFV5ew3aassLeKERP7O?=
 =?us-ascii?Q?RXbn4HLrZj6M+pwUFjtloxifvg9Pzom/p7CQLDtjO8YXm4dbTj1aZG532oGf?=
 =?us-ascii?Q?Ibz/1r5mePqx4zqzDs6NCSuGMPxGfNaMPqZEq6vMaTbpbRuxLU3VhfcK8vgR?=
 =?us-ascii?Q?Wj0klHl/sKaoK0N8SjBuWa14beIDzcIpBPxnNVZcXrqXHK68GGUg+B9QMpyv?=
 =?us-ascii?Q?S/Ri1SJ0GAQczTBSTzX7wg4JKnOWPK2HDc97KsnanfF3Z1fUHYtj2HGDKn9i?=
 =?us-ascii?Q?7kDMVwNRvKsBNbRM6aqPzSu1d/FjkoCPgwGs7Tvu69voRJgekLskXPOWikL/?=
 =?us-ascii?Q?rVfUMXItgy9eFPLB2YfW3DBhK6/U7jYUtD39FIdV50efaJDMfGd4JTRGhOBA?=
 =?us-ascii?Q?EbFCpMu14ANnac3CSPMPJQFZiECE3KmwGwiRS+N4FNpGIw0NapBXMZMtDFnG?=
 =?us-ascii?Q?wO5NVrq9gLveZ/Tk1YNMe9KDw3IGxefOCLUYtyzYtPVe/QLQS1TrrINTjuIZ?=
 =?us-ascii?Q?RZTxRmuUPPBwp2x7HMUH3vP1wZfZIPv7/Dg8Bi6SkgusJbk2hhx3qI8H7TIZ?=
 =?us-ascii?Q?vfWW3s4DR4h06DEUqNmj2Lke/acK1xrhLwvsCvCYwGM8wYTkBHNbJrd/YGVk?=
 =?us-ascii?Q?4Z8gPqQTNH7Ou263oFJFqsz3ap45/C920GYaqIH0sgod/cO6+e2fKPi+4Rsq?=
 =?us-ascii?Q?sSf9lgwu1khiCDX0CTxUAhMLs5AgrGlCy68TjZBGHwtsdN4RiT7FqBgVPSqI?=
 =?us-ascii?Q?Z9gqXtuvsAU3vYsJM0mpqmtBHSfYruAq/BUEiNWhquiIMOtD9Ho3zKi/VNk5?=
 =?us-ascii?Q?aDYjskRgq0PdXz2Q0AWu49zGIjkPrP+rKD6YJYBEZasFIHQIcQDN5oT0q369?=
 =?us-ascii?Q?WLFmOMWYloOZMVZmXq/yxdtuSloZ++3B1crOZJSuxG62GjZ07+GUklc22WoF?=
 =?us-ascii?Q?grJCenIf7uCNefupdCgLeg31lgJOXu5TF2nhKSCklSvYR/Bhi3xMwepCm/Qf?=
 =?us-ascii?Q?zfOD83tH+H1dMZLFgGhBFzGsGb0tJXLZBi4qdKq4xAp9c4/xKOHUCDANY+Ja?=
 =?us-ascii?Q?gNXHStazzUpfdAXGPF2FvOzjy2ZA4k5JP6PrjrIvzZmQI2p8jE7DarF0AtwU?=
 =?us-ascii?Q?JmcM0jkcrR9GyCkbZCcCja+g/luMgLo5gSrXSJLHbmrVPLybEwQXS2x8oqih?=
 =?us-ascii?Q?3wB9HKOCmyKLw2R9j0A8zTCO/2Fx1gVcthphmnk0CEFBGNVUdz+C0JwEv52q?=
 =?us-ascii?Q?7FuvY4sXzYSe8ydYXonbsrOK8yIXCPSyNn6Z3QyJtagg4nJlsGFyA4/mwwPz?=
 =?us-ascii?Q?mw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b81132-4659-4984-72a4-08db7c61d427
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 07:39:41.7586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IntMY/dRsCfVBRdNJFaNRTWbFAul2qpOTzdm7RGgASMsE5AvKjJh/KUi7AKizbpjZMJRwbP4HzTpLpVg4O34+zAKUfwowX/JqTLLdaIruO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6461
X-Proofpoint-GUID: etdqEbJV5wPrGb5-ASp_83qnyh7VliH7
X-Proofpoint-ORIG-GUID: etdqEbJV5wPrGb5-ASp_83qnyh7VliH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_04,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 mlxlogscore=943 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2307040061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 07:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183817

From: Ovidiu Panait <ovidiu.panait@windriver.com>

The ptest problems reported in e21021dc00ec ("mdadm: drop from PTESTS_SLOW")
should now be fixed, so mdadm can be added back to PTESTS_SLOW (a qemux86-64
test run takes about ~12 minutes to execute with kvm).

root@qemux86-64:~# ptest-runner mdadm
START: ptest-runner
2023-06-30T08:25
BEGIN: /usr/lib/mdadm/ptest
PASS: /usr/lib/mdadm/ptest/tests/00linear
PASS: /usr/lib/mdadm/ptest/tests/00multipath
...
PASS: /usr/lib/mdadm/ptest/tests/19repair-does-not-destroy
PASS: /usr/lib/mdadm/ptest/tests/20raid5journal
PASS: /usr/lib/mdadm/ptest/tests/21raid5cache
DURATION: 723
END: /usr/lib/mdadm/ptest
2023-06-30T09:16
STOP: ptest-runner
TOTAL: 1 FAIL: 0

For the testcases to run correctly, there must be enough rootfs space to create
13 loop devices. Similar to strace and lttng-tools, add a new
IMAGE_ROOTFS_EXTRA_SPACE entry for mdadm-ptest.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 3 +--
 meta/recipes-core/images/core-image-ptest.bb    | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index da9153b998..6250cf081e 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -99,6 +99,7 @@ PTESTS_SLOW = "\
     libgcrypt \
     libmodule-build-perl \
     lttng-tools \
+    mdadm \
     openssh \
     openssl \
     parted \
@@ -122,7 +123,6 @@ PTESTS_PROBLEMS:append:x86 = " valgrind"
 #    rt-tests \ # Needs to be checked whether it runs at all
 #    bash \ # Test outcomes are non-deterministic by design
 #    ifupdown \ # Tested separately in lib/oeqa/selftest/cases/imagefeatures.py
-#    mdadm \ # Tests rely on non-deterministic sleep() amounts
 #    libinput \ # Tests need an unloaded system to be reliable
 #    libpam \ # Needs pam DISTRO_FEATURE
 #    numactl \ # qemu not (yet) configured for numa; all tests are skipped
@@ -134,7 +134,6 @@ PTESTS_PROBLEMS = "\
     rt-tests \
     bash \
     ifupdown \
-    mdadm \
     libinput \
     libpam \
     libseccomp \
diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index 90c26641ba..ddc56c8f9f 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -19,6 +19,7 @@ BBCLASSEXTEND = "${@' '.join(['mcextend:'+x for x in d.getVar('PTESTS').split()]
 # strace-ptest in particular needs more than 500MB
 IMAGE_OVERHEAD_FACTOR = "1.0"
 IMAGE_ROOTFS_EXTRA_SPACE = "324288"
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-mdadm = "1524288"
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-strace = "1024288"
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
 
-- 
2.39.1


