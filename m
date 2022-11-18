Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00ED3C4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 13:39:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11729.1668778758408599372
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 05:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cFmJYI6O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83210575dc=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AICTsYA018107
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 05:39:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=fs8NXbuogYGswlIScCETdoeSxlViLu4IgF/TDPJHJIs=;
 b=cFmJYI6OqgpRWIben6/T1/80wwsD3q1xczWINO0ValSFoZtVy7kivTSskCdKHxu13J3h
 qH+l+U87bo/HGtHreDvk7bskgV1Ky3RSND8EeIE7YNRdUctaoNpqHPJnG5FjAeZdhwxp
 RR+vEPatZGLBj51+u1N84ab3yVfZ3dwKoXTjLMO8SOao3XZqHhtMsf4wgNx6RgWnfSma
 tEK3I96m8QeAqVPmMg+OrVOCFk7Py1tY77IdnjS6wy//C0IiI2MpZYq+J3KBo8QgZW9Q
 bcTYvvqeiAWYXexgMPgJxP+v8V9L2fI2sijtmg7M2cQVEUnJ3B9pbEgiKSAk+hKWJSWr AA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kx0ng0ef0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 05:39:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ri3rn+MEBYZANPjDFJTLsqUeFga8AMiQNvP8GSMj79tyD+kdS+X7w0g1DeHMPCO+i+M++62g/Y7wcJloLj/f8fY0QyabwEOSk1bq5rg+2D8KgqMi+hYSlN7eVKm2Pz8tHZOkPzBKim50MvydF/KKK0QAiyaA4aHV7cS5JgJLSC/aev7yIFWwcQXiTOWMilkiRAO0W2mFVIBzSqTEBiOOUDfhIOnT3TUBoDWgyIoAfuLbWY+tjJbDY795VMcRVudzS/ycVtWOgyhUBpylB1b4QuLJ7JEy4x5uOeg3WKH+Ktd4ZrElpAl1twfNeVTAXU7ANhKFNdDWt2IjMahhCcWWoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fs8NXbuogYGswlIScCETdoeSxlViLu4IgF/TDPJHJIs=;
 b=f2Crvz7qkpyjv2s1NTSGkun0+eslqUspl0hxIdOKtOFxS3XI7Cdg2aBOzj/cTEXsLOMTvgR/iLDaXijS/HPn1MuNVqjgPgHjOjX6wmu+pLszkumBB3vgmAVxuWYHkCcw60Q0DpoODKfK+jxTpYPW4RHI/tcU84dC1hHIVv7WPYApGIuwbrbRIlKfWlaa+QTBsdP/HM+ZQPxFCkzgcA1tPUrRVs4FE62EdAASZIo0HDGxRszKoDd9SWgKYLoZ3T1RrCZWl7ZY7tMzkCMZ5L3eAO/M3V4zfyox4vTmCe95mqKYt/1/S0fKcdqokRz51tdY4zwpv0AOdxnCIIsrI1xttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB6860.namprd11.prod.outlook.com (2603:10b6:510:200::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Fri, 18 Nov
 2022 13:39:14 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d%3]) with mapi id 15.20.5813.020; Fri, 18 Nov 2022
 13:39:14 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][kirkstone][PATCH] dhcpcd: fix to work with systemd
Date: Fri, 18 Nov 2022 21:38:55 +0800
Message-Id: <20221118133855.17290-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0167.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: 70e801d8-2c85-4855-6ef9-08dac96a4701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lbM/9a8RU6veDng+8nxGnV1mJnF5uEvXCb/4Ux3AjilwxjPMgTO2FP7Mzbx38K3HPA0n++NzYzGLUrN3q9q/ZmlMrlwssA0wtWRuGevcpbNYs52GPltWPjsp9BtELyvN+Xjq7ZPUO3Pbaeo2e8MXtdgPwKMKoePrfbt9iznEMdaNbxE+WDDdKVSBt4ElQYRu/Qf/Q+y9JlR5tyzbCFNATD25LtrI93TxJPTqDBaByclsT6QDeX10P0Jy7h1LiLYFX/oH2YeZiZURxwCZkImyPyP36c3/l8kK6iwLYO9ra6uqVwJklqZImE0Kd29ReqJ5NW9LpU/+FsdgbdFvdyh8L0IOwZZrxYtatSsajS+oJ9P9N8fha36JqG4mn8QpT6ePMB4F8XTBXCm+tWdGm134xUjMYTpMtLHq+OqJ8DiMMOeZdSr2lflFDtnh2MU/nJ/1vfWlXckartT7rADUXV4DxCzj0KHgyYYi2fl73XHeaAolttMYSsj7EugJoa6nHu9Hp6tlCdd4735UZC3+f+4AVYDZ5oH3G/vn8xYJt8W7IT5MriJb8SPL8PTKJgwmxYrLQZnv2g2vjq5QzIvGtSNhaEHqNYR4Qo92pIgkWMvyo97jS31T9EPGck0jV6KfF/PBoG+0OYkWX6qeTxbxC+lEy0j99GVKppQ2KScocEwLbSIdesV43aGEt2dXf3mP+4n9nBDNKdrQsS062iTyhpvwB6ANZWwpDYQYIC9ynoaHw/FwMDKbckwPhiRUDFSxhxegHnVpQxMdggQhnSfSvoab4w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(346002)(136003)(39850400004)(451199015)(86362001)(36756003)(38100700002)(38350700002)(6506007)(6666004)(316002)(6916009)(6512007)(52116002)(2906002)(41300700001)(478600001)(6486002)(83380400001)(966005)(66556008)(66476007)(26005)(66946007)(8936002)(5660300002)(8676002)(186003)(2616005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?okABiXmZhejpXQfXXEEfuRlTq5y/dzp+Oni8I0JH+WgTHJBoHLuYiLnaOCDn?=
 =?us-ascii?Q?oApBHJZ8+L0SdYGAXAfVincXmR2j6u2JlzQinQOb+sR6TZv488nWtDkpulOt?=
 =?us-ascii?Q?RfHoC7T/FzZF6Jie1ezGVU62TNVh9QKK/nTOU4tnk8IgysTQk1IMwBHejdSm?=
 =?us-ascii?Q?KgwBKxLxjMc6rVe/YvXkdnd/sqoyq5uWqNcofbTanHcVv0cnVZ+TMaICKn5n?=
 =?us-ascii?Q?V0yvN0WZh1VLAObMwBpjCN9Uep7mpqWc88RY3Z+3VQIDr/9+SAfySlf4Hs3d?=
 =?us-ascii?Q?zFcc3gI8d1kRj3DeuSNyO4W9otK664FzqP4/e5xwx5BMCIA+8p4/+maXa7aV?=
 =?us-ascii?Q?1n/nU2qdRjxeGHMWZ6ItnCbhOEHdaHZpanSdGDcCaA5Bbg67FQjOrxA002GY?=
 =?us-ascii?Q?JvQb70iO5OOmRWyOPS+mWktOQ3hUjq0DQFIB3Ekm70goGy0izQJApYHc/vvc?=
 =?us-ascii?Q?958WlEewT8aV1Wf5eWv04VVhlUD9brvNlI6H2/OekHsDiTF7VsMio6wkGaeN?=
 =?us-ascii?Q?ScTvyCAPq118WNJXG1Q+gBA4a9Y7IeLUIWvmADMbnEVs0fFb4SwYx2qVoDIS?=
 =?us-ascii?Q?jVjaeDzctb6K8smHSsHfyeOY2hksBq6WYot3jiWxP+e/3IUVhTELLWXoZIZg?=
 =?us-ascii?Q?DwrzmyXDRIyJVrcPwEgnMCBO114TXCLCJpJDKLNccGkMApGcnJOEqNwlIuFm?=
 =?us-ascii?Q?k6csNnWWA6ZD6/xypn0AiUIHeAw0sRICbg/vXGjU9HXY6v1ezSMa7p7BLCxv?=
 =?us-ascii?Q?HhOo4s8KNijxu24WteKqkMTDFDHo44cGpXADrVRiXlQviYcrxitw7oSwRtnR?=
 =?us-ascii?Q?uUgBW0jlKUjCKrkGqNxoAWygbQgCjhFwXDbH2zxXhK1iBiw3ieCVmM+Plds0?=
 =?us-ascii?Q?oQHzM1RMpUSSTM/m8GjdrbbQcGk06odIx8Kw29d3619Z9GGPQelK/Vu0qk7m?=
 =?us-ascii?Q?OBDyZsi+eBq1jEwHVGJUjZxy0cnizE/rWKCgxAQpT6kW3x4e/VsEgvSaPW+p?=
 =?us-ascii?Q?1l7heYzxg54ZAmJbxsRueG98Au83HhvhDYDS6k6UPv6F0xCO3noyPWqLV1vQ?=
 =?us-ascii?Q?R2v7LqfJgZFgw60OV7alWVjUVMfaiJWn3818FVrdT1L6xbEZwUGcsk+J3tHc?=
 =?us-ascii?Q?rlCO5IQJ8R5d+abqmypxW+8J4FVhd9rqwyc6dooz6pJDiK1APPk1ojFjIXm3?=
 =?us-ascii?Q?rPZ8gWB9aX4AxOIe+czqbm1ComKTDRK/NrnOPStq9YErEg6uyHTVfzhKSxVe?=
 =?us-ascii?Q?KwDeCZIpyTWf6GcdRzqLChTWgWvPp4TJDDPO/lHM2EYZ8w9bKnS3TLtQkAf9?=
 =?us-ascii?Q?rt4osg10A7kbnIFpDD1O+1X03rSKx8PDezDd11BmwPNQOfh7LWA3wDU1fgT4?=
 =?us-ascii?Q?mz77/K2h2qdO28s4PSSyCQ9PH/cHKtJ/kGS1oVPz+LMClCaeEELI2+LCBQN1?=
 =?us-ascii?Q?iUnmOjiS2ozL6SnCn2vvSzYZRSZ7WUc3xC4sdF2NdXtToyZP+so5EA+QwUtV?=
 =?us-ascii?Q?oJG8dM0s2nATeUq/Uzfb/LOXN/r5icx5Ke+p3Nkej7TiW6ZCImX8EmSZyz3P?=
 =?us-ascii?Q?demCMof0dF5FCLmuVSKXGiT+hGyIllw/JxaXOTdi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e801d8-2c85-4855-6ef9-08dac96a4701
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 13:39:14.0098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eaoJ0jgE54N0E8IarJwXckPKf/vUIB5xEbfna62sXzXIJz7aqcMinN0MdGD4ycRNaGvuQhiY5oRL5e39q78phw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6860
X-Proofpoint-GUID: 6FVV9HSoVnFFaJ33v524CUdGXubr934t
X-Proofpoint-ORIG-GUID: 6FVV9HSoVnFFaJ33v524CUdGXubr934t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 mlxscore=0 spamscore=0 phishscore=0 impostorscore=0 mlxlogscore=903
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 13:39:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173460

Currently, dhcpcd does not work well with systemd. When using dhcpcd
to configure network, the /etc/resolv.conf contents are not correct.
This issue could easily be reproduced by using 'qemu + slirp' to
start a systemd based image and using dhcpcd to configure network.
The expected 'nameserver 10.0.2.3' is not in /etc/resolv.conf.

The root cause of this problem is that dhcpcd assumes the resolvconf
should recognize .protocol suffix[1]. But systemd's resolvconf (which
is a symlink to resolvectl) has a limited support for traditional
resolvconf interface[2], and "may not work with all clients"[3]. This
of cource includes the clients that use the .protocol suffix.

The current situation is:
1. systemd is not going to support the .protocol suffix in the foreseeable
   near future[4].
2. dhcpcd does not want to merge systemd specific patch and insists
   systemd needs to consider the .protocol suffix[5][6].

It's a normal thing that people have different opinions. As a build system
that supports such combination, however, we do need to come up with a
solution to fix this typical integration problem, making dhcpcd and systemd
work together.

This patch solves this integration problem by relying on dhcpcd's ability
to manage its own resolv.conf contents. But instead of letting it to write
to /etc/resolv.conf directly, we supply the generated contents to resolvconf.
In this way, the resolvconf still stands in the central place and dhcpcd remains
a supplier to it. And the /etc/resolv.conf can get the correct contents.
With this patch, dhcpcd could work with both sysvinit and systemd.

[1] https://man.archlinux.org/man/resolvconf.8.en
[2] https://man.archlinux.org/man/resolvectl.1#COMPATIBILITY_WITH_RESOLVCONF(8)
[3] https://wiki.archlinux.org/title/systemd-resolved
[4] https://github.com/systemd/systemd/issues/25032
[5] https://github.com/NetworkConfiguration/dhcpcd/pull/152
[6] https://github.com/NetworkConfiguration/dhcpcd/issues/146

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../dhcpcd/dhcpcd_9.4.1.bb                    |  1 +
 ...mprove-the-sitation-of-working-with-.patch | 82 +++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
index ab6ffe986c..1d03de09c8 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
@@ -13,6 +13,7 @@ UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
 
 SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
+           file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch \
            file://dhcpcd.service \
            file://dhcpcd@.service \
            "
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
new file mode 100644
index 0000000000..6f90c88249
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
@@ -0,0 +1,82 @@
+From 02acc4d875ee81e6fd19ef66d69c9f55b4b4a7e7 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 9 Nov 2022 16:33:18 +0800
+Subject: [PATCH] 20-resolv.conf: improve the sitation of working with systemd
+
+systemd's resolvconf implementation ignores the protocol part.
+See https://github.com/systemd/systemd/issues/25032.
+
+When using 'dhcp server + dns server + dhcpcd + systemd', we
+get an integration issue, that is dhcpcd runs 'resolvconf -d eth0.ra',
+yet systemd's resolvconf treats it as eth0. This will delete the
+DNS information set by 'resolvconf -a eth0.dhcp'.
+
+Fortunately, 20-resolv.conf has the ability to build the resolv.conf
+file contents itself. We can just pass the generated contents to
+systemd's resolvconf. This way, the DNS information is not incorrectly
+deleted. Also, it does not cause behavior regression for dhcpcd
+in other cases.
+
+Upstream-Status: Inappropriate [OE Specific]
+This patch has been rejected by dhcpcd upstream.
+See details in https://github.com/NetworkConfiguration/dhcpcd/pull/152
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ hooks/20-resolv.conf | 17 +++++++++++++----
+ 1 file changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/hooks/20-resolv.conf b/hooks/20-resolv.conf
+index 504a6c53..eb6e5845 100644
+--- a/hooks/20-resolv.conf
++++ b/hooks/20-resolv.conf
+@@ -11,8 +11,12 @@ nocarrier_roaming_dir="$state_dir/roaming"
+ NL="
+ "
+ : ${resolvconf:=resolvconf}
++resolvconf_from_systemd=false
+ if type "$resolvconf" >/dev/null 2>&1; then
+ 	have_resolvconf=true
++	if [ $(basename $(readlink -f $(which $resolvconf))) = resolvectl ]; then
++		resolvconf_from_systemd=true
++	fi
+ else
+ 	have_resolvconf=false
+ fi
+@@ -69,8 +73,13 @@ build_resolv_conf()
+ 	else
+ 		echo "# /etc/resolv.conf.tail can replace this line" >> "$cf"
+ 	fi
+-	if change_file /etc/resolv.conf "$cf"; then
+-		chmod 644 /etc/resolv.conf
++	if $resolvconf_from_systemd; then
++		[ -n "$ifmetric" ] && export IF_METRIC="$ifmetric"
++		"$resolvconf" -a "$ifname" <"$cf"
++	else
++		if change_file /etc/resolv.conf "$cf"; then
++			chmod 644 /etc/resolv.conf
++		fi
+ 	fi
+ 	rm -f "$cf"
+ }
+@@ -170,7 +179,7 @@ add_resolv_conf()
+ 	for x in ${new_domain_name_servers}; do
+ 		conf="${conf}nameserver $x$NL"
+ 	done
+-	if $have_resolvconf; then
++	if $have_resolvconf && ! $resolvconf_from_systemd; then
+ 		[ -n "$ifmetric" ] && export IF_METRIC="$ifmetric"
+ 		printf %s "$conf" | "$resolvconf" -a "$ifname"
+ 		return $?
+@@ -186,7 +195,7 @@ add_resolv_conf()
+ 
+ remove_resolv_conf()
+ {
+-	if $have_resolvconf; then
++	if $have_resolvconf && ($if_down || ! $resolvconf_from_systemd); then
+ 		"$resolvconf" -d "$ifname" -f
+ 	else
+ 		if [ -e "$resolv_conf_dir/$ifname" ]; then
+-- 
+2.17.1
+
-- 
2.17.1


