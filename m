Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA6EC41513
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 07:56:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6985.1720684618357998721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 00:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7922740ab3=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B5DVwd020873
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 07:56:57 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 406u4x4pvv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 07:56:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYlduJGK3UsCj7fSmKuQmC/CBfiE7fUgO12pFVMIqMWeTDKgag5HmjruYuO7FQEtiQCMK26X2mlgMn0Z3MtEHWFMsmldbzr6IddCtUXI8Fb9ftgkNPBg3WnNxR+VCmIIcgusVAH3UvtqGAzDZKSdohRKTpGWDNXgUvE1NZwtzJyX1BjdtSE8lO6bNnZd9dVRqDqevLxNXpDCJOLesV7DRX8zKgTctHjcFuycW3tcv8G/oZZtSmZ/IeFFTKXTSeKGn/fJf1SI9+icLkdCkMntOP9tStUn05II/Lzfz3wpTtbzjYkC3d+l5vXiIQmWW60Q28Rn6HySR4Qj+2MIvlHLzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Id6XlMB7AkZTMl1BgYRM7M2MlBt7OJiRtwPkrOkolY=;
 b=JAntGu1d7BdkyDVyMAqYleADbLmDqiuguW6VcFIaKBVihjTMa95g2j48yXBvXqV6QniD3Z7+ZA2DnZneLSUD87k0tQ/p5MmsJsTwv8AowrC54/4GvEIAEn/dFhstHj+bBXBkRKsWMsiLdQwBqEVCAzQiniE6S82K9aexvO+/tlPrMWvp2gJcUiU6E03s4lLvUTvHbXbjhiYW7qWWrCzHcAXdkawsBfMmy63kWv34JqKFvkrJ3z/2+T0ijGswHWO/0u5I2VJwONU1u1jRSiBLRr2rFWWtLqT/w+P2l9DaUffFfKCMNN4mZ1dLnQkAJmzF/Lq9QT3jZknzqWKiH4owKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 07:56:52 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 07:56:52 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2 4/5] libssh2: remove util-linux-col from ptest dependencies
Date: Thu, 11 Jul 2024 00:56:36 -0700
Message-Id: <20240711075637.3023203-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711075637.3023203-1-Qi.Chen@windriver.com>
References: <20240711075637.3023203-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e92019-c131-462e-d694-08dca17f05d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Unj9JU0hbkTn7ozf07bPUrVoGBGC85dEFrd6IM6zGPXyljtPXMwyzk49frI6?=
 =?us-ascii?Q?9FKbG/6OtkgNCV7stF+iPPpHep7jyzafr+RM2VLnmGSmrAeAyUS87yF8iFrh?=
 =?us-ascii?Q?OvUKAWS5aRfChOQfP4viKoMpavZ/0qbn4IjMTykF2A/GBuirBKkNw4BiLFeW?=
 =?us-ascii?Q?pUXTjyA/lmEysWiZPUNJ6LzBHPHiuvBm17I31C7IUUIgQJ5s1itXwQyMZQ8q?=
 =?us-ascii?Q?VOdYZ3ZI3oopMdH8Rf86m7gzEaks6dONFjQmXW1+OVEE+2ei7YgfeK5MFn00?=
 =?us-ascii?Q?AaJ2nHNQ5B1MWggqhiKlMjXE+bqI49kfwgwxXtBKhGk9jEiKoGWBI1DfLz/x?=
 =?us-ascii?Q?6dSyFcEVlo82mprrLAElYjPiYGrN7qa8GYqEgwnxdhPYSjWMo0aElpCl05+/?=
 =?us-ascii?Q?E5EBnQ49k6QTzp2yVDuww7BCrY/J7YWFThp59lPp9JYgkRHw5WvdsIOSrX3x?=
 =?us-ascii?Q?I12uQeUXJzUB7zG1on/acuY/i409CMU+QCVj8mMLMV2ziOsP91oIbMgke16u?=
 =?us-ascii?Q?fhcLTerj4/hG3LfZDwgk9VDgql34FA9b4jN3Oe0aLFGIoPllsU8bIX7tICE0?=
 =?us-ascii?Q?xbepTelshHJl64KvsKYCffvDoOWZFVCSGwcI/4vh3+k6nlMubnyF3n5UMw6C?=
 =?us-ascii?Q?xzRFgL/vl7FmA2HOA+/9GyRQ4fVU9z1Df2zAD3lsJxIKzEuUc2jpbwCZL/s6?=
 =?us-ascii?Q?CGsK38PrRosFWfLhxmOg6H+QrIgUUqQeX50ANvu2ZCyC1hm4F6XMnrhVXPvm?=
 =?us-ascii?Q?upi5hQm7Em7pw9y+EwKow73s8mg+xP85Pp45BDAwY4cG34GdIHgFTw2rFnDs?=
 =?us-ascii?Q?i276w3ArIphtGQE9ZD22ljkxM6u8eEHbsIWFzIYO32NW6blMWluhp6B8QJPu?=
 =?us-ascii?Q?S6ldHgUlarUwsY6JseEwuAKNNcSku6kyw7bW+2sbKLFLhQPUZBpCCvMSmPBH?=
 =?us-ascii?Q?OR3pH6NiVQD7egKzAcCCiTUkMRCGl2kgAYWR6EyRfGfzdbwCkxHMzMWBjU2k?=
 =?us-ascii?Q?hKEARgnfGPrU+Zo29FctdJDnSjDyCs1tjqFtuMk99Dr2Zcb7C8cJM6vNc8SH?=
 =?us-ascii?Q?EIVTAC++tlvNWhgGiJYHP6lB3y93r0IZFiHpfmPK9DwaMVZBiJlkKa1FGrWh?=
 =?us-ascii?Q?rsVJ/NScGTFaWGcGgQs6U5H8XnhwkMRiFeHMkEMF7l4cNLc7hQQ8zMTD6Hnk?=
 =?us-ascii?Q?Q0txkYMVXx6/OqISt6sL8pIzKsHkkRiAfwd/dXjwFK6FTVb1bETbYJvaAonc?=
 =?us-ascii?Q?QxqBpcL2XnE5ttNBiUFrnFV3l5kDSZ3z1i7pTkuK/yGdfWxHkJagMYVdaGuU?=
 =?us-ascii?Q?/n30qECrYXt3RGnfzqfDJajupNMYuYrbl6IeINP2bz1LEzHn9y2HSfWyNAWg?=
 =?us-ascii?Q?fT59x3A=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VwnMEYZGJwRIzzNfsV/rUC92KVRAnHWMM6ixVpmomx/owCjB0CTgTOkMX+0B?=
 =?us-ascii?Q?D9sRxldyVSG/4kHCoust13cYqBJYhcIgTt7dTsIpZtJw95DEYhSeyPVidP4W?=
 =?us-ascii?Q?J1cLjO3nZNX4JpkeBhzk5mpgkqGbMMSLH3SWu/IT20JAH+v117wlPclWiD8Q?=
 =?us-ascii?Q?YZ/mZEwgzoYWUvE57X1twWf4B4LEZImu/sMppsvcmLviJcZN7hAN9RY1C5u1?=
 =?us-ascii?Q?5KCEBqms2KnU8enHo10/zKxVMlh30PVR3KyeAexLLh5Lpo2yAP8f4S3iF6SI?=
 =?us-ascii?Q?BeO4rMdcNqynobwtEuRAWWFvj3jvKx+rfcCtReqDziIVemgUtUohbfGv3KQl?=
 =?us-ascii?Q?Xbs2hUsUnuGHQOK+F3F1aXEFE5KtZtxNpo1cmw+vRRXJkHAIha243sjEv+uB?=
 =?us-ascii?Q?mXn076BsjHqKczMhoHtpiZj8W1oK40sKVnI6aW5jz5NsuJEG3rsM6mtw2V43?=
 =?us-ascii?Q?kfsDv30yqUM6ewCFkubp9YcNTGx6Y8ZElMKGuArvi/bspU6wIgdaGsjnz7lW?=
 =?us-ascii?Q?5rIp/fG11FKH1HJhXDj0aIM+Ur3ObAOss8rE8tyHu51AIEhFVEX4K6dA+8dl?=
 =?us-ascii?Q?l6uo5bwtEPtnGocQfKQud6ip/VSOiJsh/yJcCaom0ICWjcoE6adyYlGMXDj4?=
 =?us-ascii?Q?Li3+ycOncV+/Pp9+CR+T9vDwwvBDZ2SKfuhaNpLL/nWbWN4Bw/Fol3IPvUht?=
 =?us-ascii?Q?n9VVJVLlNM5iZzjvD3r/JhBA9FCO8Q4CAP67+zx3auIURnRKmIqzRVn3iRLA?=
 =?us-ascii?Q?YWM6+MlZbrmkFd11yC7Iyk57fXxBhnSanvRy4SvsXm0ODN/YMcMHLnYcKhe1?=
 =?us-ascii?Q?FGqQTmZbUb3n0hhAqYp6jwfkGxQSClb3IKf2fQx2mKlTczjCdqIo4Sjv/dsz?=
 =?us-ascii?Q?6NdSPE71HtYw8W03pqSMBIdYEgOmxcs6zqG5BKomrD2jVI8Ekfbq/2A09Xxn?=
 =?us-ascii?Q?1NO7h0sm+6uVepC9Vlmcqo1GyHB3T3Xz2T+bZk52MLAGnMw5zBkGlnGKRpUl?=
 =?us-ascii?Q?qjV+vxgAmTZjH0aPXYG23PIc3hSndmdbnhAHcNNy/VkNXm3NkS6xU/0QqPUH?=
 =?us-ascii?Q?cOhW1CTOpwrOimWYa8ZsjvCeQHiMu4hRGqMu6HKVpyiek+pMNfMewSxFUT6h?=
 =?us-ascii?Q?U/HGoDpmnGO25g26H80hcnn8gJqJq6aFaaVMx3AgE5W/2sOxwQpHYNaPEyzi?=
 =?us-ascii?Q?63ZnKQmxcXEF2HKZBg8eJoi2++gKkFNHfo5/G2OpJT/qBE4D5e6bcAntHAqs?=
 =?us-ascii?Q?3nFcxW7ZFDtiQqnqFgNSlCOzU4bHS5lZv4/Ofn7h7wGr57ZbjxeHFMaMu61c?=
 =?us-ascii?Q?iT++koI55l7vsm/KzXbVNpPSF6jm+v2qorw+IQ6nwTkWCY7Xx+hJBb/CE9/X?=
 =?us-ascii?Q?DGPvXdqjQn5W6m1BxeEyXQSr48XGkAcnRGQ47weIxxK16IQGDGG2G2GhDd8k?=
 =?us-ascii?Q?knL+qoVBlCYOWol6DEN58/BtzTSJEWFJ77Vo6zCfVxsDEfCji0biMEcKhx+f?=
 =?us-ascii?Q?N2L8HGGJ+ENBoXH2WHtQYceasgoqldw2r0t4Vt3ICvxu74VtQgL0BD6OHS3I?=
 =?us-ascii?Q?15Piuqe+Af+z6lEKAvwDHZ/s7vjTvKaVZFhiWqij?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e92019-c131-462e-d694-08dca17f05d8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 07:56:51.1716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVO6gnz1fKhdst4zfZATVKQpqnRKlhKMv3/c8+xkiABwO2+rFC7N+wd2RpLY0Ne+3RviuS/c1kEA6oxjoha8nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-Proofpoint-ORIG-GUID: ZWHNLeBn7PuiBs_rux6DYTvSkr53j4LA
X-Proofpoint-GUID: ZWHNLeBn7PuiBs_rux6DYTvSkr53j4LA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_04,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407110054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 07:56:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201764

From: Chen Qi <Qi.Chen@windriver.com>

After util-linux upgrade to 2.40.1, we got the following QA issue
on musl:

  WARNING: libssh2-1.11.0-r0 do_package_qa: QA Issue: libssh2-ptest
  rdepends on util-linux-col, but it isn't a build dependency? [build-deps]

The issue appeared because new version util-linux has disabled
building out col on musl[1]. In short, the reason is that col in
util-linux requires something that musl does not provide.

This 'util-linux-col' dependency was added in 2021, at that time
the libssh2's version is 1.9.0. Now the version is 1.11.0 and I tested
its ptest, it does not require util-linux-col to succeed.

[1] https://github.com/util-linux/util-linux/commit/8886d84e25a457702b45194d69a47313f76dc6bc

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/libssh2/libssh2_1.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libssh2/libssh2_1.11.0.bb b/meta/recipes-support/libssh2/libssh2_1.11.0.bb
index 5100e6f7f9..dc9b9ae364 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.0.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.0.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG[gcrypt] = "--with-crypto=libgcrypt --with-libgcrypt-prefix=${STAGI
 BBCLASSEXTEND = "native nativesdk"
 
 # required for ptest on documentation
-RDEPENDS:${PN}-ptest = "bash man-db openssh util-linux-col"
+RDEPENDS:${PN}-ptest = "bash man-db openssh"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us"
 
 do_compile_ptest() {
-- 
2.25.1


