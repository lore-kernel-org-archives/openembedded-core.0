Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEDBC19F2A
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 14:12:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.6270.1660140748404108474
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 07:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=jgM9pLN0;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5221100a95=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27ACdJdG006366
	for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 07:12:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ooJKs6CRSPu0hORkwi4vTwjE2GHGIqP32yYfLDuVBdE=;
 b=jgM9pLN0KUIWnxs9qiWCjJPHhEQSHm8p2Jw+CALWMv+DtiY4DhrtAOsxm140zbxCKzZ/
 HPK4kCpCoSUP9wX13/5zbZZuSvTMaULfgFtPb0mQx5tzfUoOOP1C4wOrQWc+6R81L/zC
 nwInPWfXmDoDKpyKxxUnAjFiu73OOO5KqZrc7smkQ8EDIl6y/KmDDsDvA1Fsi/QFoVhe
 OzSZssnzXsEclL2DvzZ1tjzUAshQks/U3YWjrrATeamTwdFLmwY4ETcst2ISLz31pjRx
 ptXirkxeHGJmu6/5838gtyT23C+cw3C5HGLoU6vgYjTAn33uGrpNz66tKVc7uuIMKcXG Yw==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3huwr7rkp5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 07:12:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFMuZ90kNds5O6DNdWkNR/0dfLfmcnqDwVwAaxOc19jeNVPkMkEQ5qN1W5JzVP0n7+EFWLFz+lRjsMQpvDYg8aP128d2QNLK7WCmfGlZFM3uUjR9ZxZ635P47fckzsdZM38H689UBeSa0XSCB8bTK5L+NGpyersjuqoMfVIeu41Z/7HsAYohREu8jlSReIrhS4ry+ARwaJovIkzq2oUkEcs6wNzJkZcGd4Dy0XXxjChNbsVE4vSGdcHslx62t0QUUXF8bv9ayV0qzknmsuJRUk4zwcNB1QkANAv1eWD3WoirM9s3o7SMbactSySIKHg7b3UiihQXfmMY523vq3HbxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooJKs6CRSPu0hORkwi4vTwjE2GHGIqP32yYfLDuVBdE=;
 b=dw8+RSLewx5VyjgXFqHVanfa9FikkYH16L91tytFxUrciu+Ed0vsugBDy6+msWFHopYDihRtlfCl371rbzuzYq7PUqB5WoBe3+Yho1AaiP8acio0anE0f8LUvy4QhUS8iYBWXZZzcwgLXAHdRgQyEWnPP7mmDu3misKiXcvIGry1uF4+JsC9jGSJzfl/3N2FdsHs15+yUYifnqINYPqJlAI9Jo+bdlMWGr226kDrWjTjpAKlLi+2PcyUtCv0i5lHvbvhFzg16Fv1XAFuJp5X8JGgsz6G2f9Z0XVJkX1dGtjKe5syYV4fxPcKbK/FzjvKOH5eWotF7ymitCoNvaBYHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 MN2PR11MB3646.namprd11.prod.outlook.com (2603:10b6:208:f4::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16; Wed, 10 Aug 2022 14:12:25 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf%7]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 14:12:25 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 3/5] qemu: fix CVE-2021-4158
Date: Wed, 10 Aug 2022 10:11:57 -0400
Message-Id: <20220810141159.21182-3-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220810141159.21182-1-sakib.sajal@windriver.com>
References: <20220810141159.21182-1-sakib.sajal@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: YQBPR0101CA0130.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::33) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e21eb52d-5927-4823-02bc-08da7ada590e
X-MS-TrafficTypeDiagnostic: MN2PR11MB3646:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h5j9PBBoJ6Jgi8QZLq5UGW1aYnl+t+aOEXntw1UALsiMtSNtYiaZKjnCSHkZExlxydEhp3OXkvmqLC/k+B6GFbD/keujy5BA/tEa3/5r2Ixc/MdjCtmhnAV4ZogeYntrowgrKg2DsBXe1kCONKGm3KLxjYAPNnQlmYNmDrTYq7GQ4vPOFrPObZ6Mjx0ynObyquoYoKK1iGvrtlw8xRDE9EUCKZnhhfOaaow9BeChkrGCzHcpToSl08QjIaXNox6ZE1xarvmniFbSgvE0QBQDkIGm3WP+X3BGjFYsPPlcDoLwgWQf++/L3gX02X9cDGW/kmdBzmqhngcDaugtDA9Cc+of1dx7uKq9v/UW1xqJ6QyI05mni0outYJjkSAP19cMD7+aN2a03kC9SL3AB58F8KMMwlQEP+jXmJLwuI8O6s9gYJ1iTR9tTn95EQHQugLk2k4iDxioNB72HbZHmXk7RafESnGOHLvEhiXwBTAGi2WdQa3mlz7fhdEsqufeUoMNoO7sRAbujhpmUBLG96FRmCCQVAZBggNFcuMUW3jgX3H5DqKWc33jmuWX5uUEe0hID2gDZcBzfKlrgrLkyIsB+rH2IAXaIm2G/d4pidnGDSI238qYM5votLHcGZi844944F/QdB0XpCkOr5MQ0EDG0DUWT3UTul7BnX21z7vrTvcdNmUZtJxYY/ogpSDQG+G57yLn8A4v3DI9jG7m+u6Yf7LqnqRNqucRaUcrRWxofmTyYZU9pzR0/vHw8b+nsxSXuRAYLiAHBMbpPlrY7/kPy5aSpdBApzCrZ8YkxZhem9ebtqqOsYTmiQ/NFJxl1tyL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(478600001)(6486002)(41300700001)(86362001)(966005)(6666004)(36756003)(6512007)(26005)(6506007)(186003)(2616005)(52116002)(83380400001)(316002)(6916009)(1076003)(8676002)(66946007)(44832011)(8936002)(66556008)(66476007)(38100700002)(38350700002)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?am85RFE5TXBPZ0VHc0ZHK3QwbXFCcFJZRnpUTFI1eU8zZFBSeEY0c09JeTBp?=
 =?utf-8?B?MGZiOGV6Wlo1dk1MTXg2TkdrbDdTWnBHMVRnQXFza1E1a2xBaXhSS2hreXpP?=
 =?utf-8?B?ZHhDMm13L05MazNYR3J5Z0VpUGhZWklxOE8zUDhVekZXY0RCYkw2b2NkUkhT?=
 =?utf-8?B?MmFZYU5VK2hzMG1iTUdMOStraUFHUVlGNFBYU2lFaEF3MGM2dnRmRlFsQ2Ev?=
 =?utf-8?B?YUZVKzRXMXB3SzVNL29abkVoUEJzVm1VdG92VUU0WThQenQ1V3F3K0E0M3hN?=
 =?utf-8?B?QWZqYVNIcnJnMTVEckxJdlBXdE1uaU5MTktQMWltbzdyQytIRWVUWFVWQWIv?=
 =?utf-8?B?Qjg3c295c3AxOHRHY29FY0lKL2I4bmhKbjkyZm90NE4rZ01VbDFYSEtmbitN?=
 =?utf-8?B?KzFZZTQ2dHM3VFkwRmlLVGpoNDJyNGFVVElnMVhMUDlET0dmbGsxV1lQeVYw?=
 =?utf-8?B?b1ovQUljQWRHcGhmaUZoYTdZWW5JLzk4TC9VODFKTDVFWXU5QjJQdXhqSVFn?=
 =?utf-8?B?a1g5clNMQS9vcGplUUg5SElpT09tbm1vbTFraWppQzIxd1U4UG9GNUhzMXkx?=
 =?utf-8?B?eGEyejM3TzJTU2o0SkFlQmtpME0xVHNKRXo5UzU5aG95b0JSRkpzeEMyQ2Yz?=
 =?utf-8?B?Ky9sU3hoSlNnN0MrdFk2cTlpc3RxbkdLNU5kZU1Ed05NUTlYNG9IZHpTMXN3?=
 =?utf-8?B?KzVnYUR3ZHVOZG01emxqUkZyb2JJanJ6VS9qZVNDUGx2NTNyOG5RYmxGd3pS?=
 =?utf-8?B?aXVlZFRnTGsxa0Q3cWZtQUxHbHFDcnRzT0g0cUdpcnhFdjZaN0ZSYnpxd29o?=
 =?utf-8?B?VW95RDlHOEV0OXcvNkV4VDlYSERXY25vNCtpZTlCUEN5QzEzVUw5QTJWZ3VF?=
 =?utf-8?B?M0JYS3VLUzcxbDhxTjc5K0dTcEZxYmw0bDlTSm9NZFNRd043dzRVYU91MUg1?=
 =?utf-8?B?ZVV4VUp0Wm9MeDQzeTNxb3BwRkh4djErMk40S1g2T0ZkdWNyc0RyMFVZdi9n?=
 =?utf-8?B?WXdqcVFGbkd3S2MrWE82QWJlQ09DazU5SW9VVDBNTGtXaUNlUjJiVEwxb2Nv?=
 =?utf-8?B?VVh4TDA4bXg4WDExbytVNnpZL1d1UWZJMXUwQzJCOVk3bHlNdk93Vkg5ZEJV?=
 =?utf-8?B?bFJYM3Z5VGw3OS9CMm16Vm9tdUE4ajZyczdVTFMwSDQrUDdBaDY4N2JtZ2Rn?=
 =?utf-8?B?Rkw3eVFDSUJDcG5WMzN2NEsvRnk0OUlMbS9HMUtUM0JSRUc2cWNqVnE3cE5N?=
 =?utf-8?B?K2Y3aFg1ZWxMMzRrV0p0OEd1QlEyOHJRUEFUVlVmR0k4cVIwaFlnaG1qQ2hi?=
 =?utf-8?B?MnBMMjQ2T3BVOXlzUlR0TDJQeWEyaDFsdTgzMnIrb0tYMnVPVUNtWTJMM2FZ?=
 =?utf-8?B?Tm1ZMUVZTTlNeFpPNmZJakhvV2ZNdElFb1NLZDcvbGRXd090MEQ3eHI5Q0Vi?=
 =?utf-8?B?dTRsZHF3ZkJnY3FQdm9qdEtXNHk2eG4yejJFdklQc2JNZ0p3a2NKdnBSQTZF?=
 =?utf-8?B?NE9hTmJIMzR0bFhiTllWMmJWZ3VHbnFoYUo2WkZRRFBvejdZTzV3end0K0Rq?=
 =?utf-8?B?YVNObU9RN3o2cWR0blJsUUd4dXV4NWlTaUZmd3RFa2dBd1hLb2NvRUx5Z29x?=
 =?utf-8?B?WFlZUFlTazA4Z2ZNYWJoeDVTN2lPMUU4dTZ1UVJvcENCY2VuaVV0ZFNYRjRq?=
 =?utf-8?B?RHlDdFlJVHRxMDRtS1k4a3E1UmI3S2E4NjlHNDZKbkxHd0FoMGdzYlR4M20y?=
 =?utf-8?B?ZGdkczIrQmZLbkxVdC9IajBIUk80YnViTGp4S0hSTUZRSHRTTmxmSmJ0a29k?=
 =?utf-8?B?RWFxZm9Fd1ExS1MvL0NCaS9Qc3VNb2lIdGFQV0EyZUQzSGdaSkc3YXgzMXFB?=
 =?utf-8?B?OUc2bkNCVWRmdVA1S0N5WVV6RkNoaXMyaGZiVFFxTkgvZGE0ME9yV1kzdFlv?=
 =?utf-8?B?NGZ5bzRQWlpCVTdxQXQxbnBtRDg4dDNkMzNDVGVQMkVsV2F2WWdkS2lFVzls?=
 =?utf-8?B?YkljbXB4OWZVRTBFaFdwdjB2UWJmREU1MXVwRzAxUEM4akhCdXhUbVVzS2py?=
 =?utf-8?B?Q2k0SmF2Nk5uTE1tTUZVa2hlRkROWVpnVGZ0R0pBSFdPV0xmUnVidlI4QUYx?=
 =?utf-8?B?RG55VEpHYWcwNWNXZlJGSFk0eHY5eVJjVzE1bWNicEJzSnYrVXFqR0I2SGs4?=
 =?utf-8?B?Nnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e21eb52d-5927-4823-02bc-08da7ada590e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 14:12:24.2989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6G6TojpbT+d6BpdG7a91cjY3+wubDazxFaHBVyoC0wCd0hITKl/bOfYH21XkWPlrzUtzb2OyyvSlnoCzKhgwuNXHLl2Da2oWhKythGiCBDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3646
X-Proofpoint-GUID: m-YFcJioLwi7qLFmCHsWpLGbNmGc31vB
X-Proofpoint-ORIG-GUID: m-YFcJioLwi7qLFmCHsWpLGbNmGc31vB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_08,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 mlxlogscore=525
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100045
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 27ACdJdG006366
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 14:12:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169193

Backport patch to fix CVE-2021-4158.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-4158.patch             | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-4158.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 53bad5c453..1d04ad3c67 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,6 +39,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://CVE-2021-3507_1.patch \
            file://CVE-2021-3507_2.patch \
            file://CVE-2021-3929.patch \
+           file://CVE-2021-4158.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-4158.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-4158.patch
new file mode 100644
index 0000000000..f6de53244f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-4158.patch
@@ -0,0 +1,46 @@
+From a0b64c6d078acb9bcfae600e22bf99a9a7deca7c Mon Sep 17 00:00:00 2001
+From: "Michael S. Tsirkin" <mst@redhat.com>
+Date: Tue, 21 Dec 2021 09:45:44 -0500
+Subject: [PATCH] acpi: validate hotplug selector on access
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+When bus is looked up on a pci write, we didn't
+validate that the lookup succeeded.
+Fuzzers thus can trigger QEMU crash by dereferencing the NULL
+bus pointer.
+
+Fixes: b32bd763a1 ("pci: introduce acpi-index property for PCI device")
+Fixes: CVE-2021-4158
+Cc: "Igor Mammedov" <imammedo@redhat.com>
+Fixes: https://gitlab.com/qemu-project/qemu/-/issues/770
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Reviewed-by: Ani Sinha <ani@anisinha.ca>
+
+Upstream-Status: Backport [9bd6565ccee68f72d5012e24646e12a1c662827e]
+CVE: CVE-2021-4158
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/acpi/pcihp.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
+index 30405b511..a5e182dd3 100644
+--- a/hw/acpi/pcihp.c
++++ b/hw/acpi/pcihp.c
+@@ -491,6 +491,9 @@ static void pci_write(void *opaque, hwaddr addr, uin=
t64_t data,
+         }
+=20
+         bus =3D acpi_pcihp_find_hotplug_bus(s, s->hotplug_select);
++        if (!bus) {
++            break;
++        }
+         QTAILQ_FOREACH_SAFE(kid, &bus->qbus.children, sibling, next) {
+             Object *o =3D OBJECT(kid->child);
+             PCIDevice *dev =3D PCI_DEVICE(o);
+--=20
+2.33.0
+
--=20
2.33.0


