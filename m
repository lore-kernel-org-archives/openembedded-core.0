Return-Path: <thomas.de_schampheleire@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D48C6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 18:34:33 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.139])
 by mx.groups.io with SMTP id smtpd.web10.110220.1680633262892860774
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 11:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nokia.com header.s=selector2 header.b=ED5EdlCS;
 spf=pass (domain: nokia.com, ip: 40.107.6.139, mailfrom: thomas.de_schampheleire@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YiEKJeAe28USF++VHsyiafwaGpJL2IMLVhF+QZ4aE8p3rd4CHHPaPHcs3SlbHdjenj3N4ZKkYIfKz3ElV+vL7OIjEotpPQ2iEoiACtmaVThA8/hmP69x0NBCdGQ68koLzvDXGC1gGWyeGDDxf/ephXYjJuL4wC9VMosU7Oey3FF+7ofbvZypkX708NWDI8qxvf+/p6ti4q2I1lyegWwpqTCBMh8NjCRKptq+gYiwyFRe2Kopof9XFGYJ+qnxBf/pIt5GFpWFd5JyuYaiZSj81qfx5axw+w/Mx2Bxk0mby1i1NTTgMcj6Q94mLtgDNJ9tX/3bkgH6VlzhGvOq97sk/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiMR7yqilA+fn0rdsBqOpNbVhg7tHs2FK+nZYgDsfpM=;
 b=IKnLSGF13dRLCABil32Ic4sJ4nyzdaRlHVcQZCFa4Ki7m72kRMT0nkd5CboPnChgXetAimWrtxzpUUKoTHUvJiBqJ5Lt2mJ9RD0PVHgh+a+Xv4qPd5U2dP0ATuiYS+SRqIndY8gxV/mWeoMAWPQ9HpJ2fC1VSun5Ng+SSZdd/NyVh102XUR9g9UFHTjIpXulZeaFEORP/1tNDLNMoyGGg1nh4rGHlIozYVGncVRWqJNPls6hotrkRjteRtQJBzEd9zsEnGo5U7HRHolhetzE3+rnP5v6x2RKnFqGvN+PIJoStyfEbSM1Ei3MWlcxukJXMi14MofZUmvfZHW4JcN4XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DiMR7yqilA+fn0rdsBqOpNbVhg7tHs2FK+nZYgDsfpM=;
 b=ED5EdlCS/rQq3iSkgWgyutfTdvYXDfHgfBYlD5I7CudBVRKHKi45Sly1qo2Gmz9RV8j5fge8BzuU/T+1EfMDRRmupjBx6uPR8mnLSvLpprG8DtsaZRN4zscl/gekWN2PUToBwSPFtvlIpr1yL1fh+Lw3yVrcv1Q7dHEDjjqpgF6tSiJ+Vz10RZ8ame1DxysWnRv4vE5IKmV9jmP1r4zv7OfX9qNjYoPg4g263YCgCqBB5AJe4eX/dIgHkXcvhKlQGK5RBaEn8PBRfImUfmJFhQI92EXUPe24uHYbJpUVtzDjdmFFEJNhQRCURzw2a77vEzp4auCJCe8u6SQ/IiZJxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AM0PR0702MB3700.eurprd07.prod.outlook.com
 (2603:10a6:208:23::27) by PAWPR07MB9511.eurprd07.prod.outlook.com
 (2603:10a6:102:35d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 18:34:20 +0000
Received: from AM0PR0702MB3700.eurprd07.prod.outlook.com
 ([fe80::447d:928b:ac32:587e]) by AM0PR0702MB3700.eurprd07.prod.outlook.com
 ([fe80::447d:928b:ac32:587e%5]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 18:34:20 +0000
From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
To: openembedded-core@lists.openembedded.org
CC: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Subject: [PATCH v2 2/3] qemu: retain default trace backend if 'ust' is not enabled
Date: Tue,  4 Apr 2023 20:34:04 +0200
Message-ID: <20230404183405.14769-2-thomas.de_schampheleire@nokia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404183405.14769-1-thomas.de_schampheleire@nokia.com>
References: <20230404183405.14769-1-thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HE1P189CA0032.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::45)
 To AM0PR0702MB3700.eurprd07.prod.outlook.com (2603:10a6:208:23::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0702MB3700:EE_|PAWPR07MB9511:EE_
X-MS-Office365-Filtering-Correlation-Id: a1417f46-6841-4ee2-e57a-08db353b3458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	evXVPm7Rc18W6Ws47K3p+OMItbZjVdD7Kj+1Yh5ZeSyLH5JRW5lkUV7EEYm4M5m2MWFz51vVthNqM90LWB5M5t08ceV9uD9eHotg/Vc5EH4wEIcaCOMF+/2y8pyhMhW+WK2qJn5NnVBGWRBQi8MZ//Jxk07wVx4dJEb+D7ciqC875WBpf7R6UO/7/A9DDVjpqddR6yVJgjxlP72VQohlZdWUgGJg0sG1kCLDxv+b1bRzdq3k5BXOChcd4fIvBXQaaLqJD7bSwKfmWjmafzvnN9srecS7+3LZj2t9jF0G+3sXBy5Rb60mXIPwRvdRartdA6/A6hgyUBN0ItR+VNA9XxfA1j27AZI9BnW0qUyglqB3XYFqblhSyJyfay8rd/w+j/5kXA6GoQEdYjORAM7hb5ywheMAlbOvRrATvBlhowxQd2lU/c7rAJ1y5ftrqJIguikM3WUByV9BaxGrXc8fj1//y8BBOkQAJUCsHlDlwriztKsvp5jQJ5Kv7NvVxGYaxZ3Qvy5gxgkjcMxLMIF9OuSURAj/6tobpUQAScNJpzmniN3n68rV3x9teo+NCAyh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0702MB3700.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(451199021)(86362001)(38100700002)(36756003)(6486002)(2616005)(4326008)(107886003)(6506007)(6512007)(1076003)(186003)(6916009)(6666004)(8676002)(5660300002)(66476007)(66946007)(8936002)(2906002)(478600001)(316002)(41300700001)(66556008)(82960400001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w609uSBZ7Sa0LFxrlHfoFg4QAeBIGzpWlh7iFLywY2ohmZKyj36mJdu/M2SJ?=
 =?us-ascii?Q?FskZqKQF2VE5cPtvt4p4x7p9uWN4a3wxh5F3KPLgSBIFtWkoPsKNr4NoE/BA?=
 =?us-ascii?Q?VPCTA3gz7tcMUMsB1fITdJm15YHqcfAFt3O+2HGIlXBaea0F4q9Jk3gdj/M+?=
 =?us-ascii?Q?d63HMbXZOIq8AMd5SAV8gMyNobgiVIfnGI6OJ/x5JKK40exDO9sccY9SfS5h?=
 =?us-ascii?Q?sc7sGtKzVkVHC9ovqjH06mx8u+bZPYwoMq3dHjbUDO3RaLAGEdGCn6pmjA8e?=
 =?us-ascii?Q?Pid5Ed7F2muNwjw1QxYVpE5KpQYslMZ+3ahnaM3/iYi9RdbDcq5bhr1Skrm3?=
 =?us-ascii?Q?To4tI91Jvv4qfq0YkhjPN5UoT1iOY5IbCcdF9adidRWwLYK5GTtITZALy8Tg?=
 =?us-ascii?Q?ggNKoEA1BkTVN+sporZYYR+jak8IgtMSZI/9fRJbcmffbDxJ54k05tFGs10b?=
 =?us-ascii?Q?ixfkhbhwXzySiPUXPuXbebApMmTa21fQ01ZRwNHRn8ooY7uaHwfLfsyeCWry?=
 =?us-ascii?Q?8lC43Z0K3J0mgGG+bFM0Bzlqx6rHVhdMQ/UBceFBF37ea2D0NuWMTGRhd9p7?=
 =?us-ascii?Q?YluMWqKpJkoxN0on+q/GC3G/DeXZYpAYezdd3mZS4KpB0mWVua0E2klE+vyc?=
 =?us-ascii?Q?0yl1SiCUFlesRFjbRzaiUacsbVZCPQoMl8LMwz5FGTavc+G9rSJmjUbpvUlX?=
 =?us-ascii?Q?U0LCNvDuh0hic+Z0Z05ERRMCsvTxt+cEMLoFxFEt5XK2IjWpWl1ZMrhAg0iI?=
 =?us-ascii?Q?QbKyXLLeoos4U8LonYPpwHf80dZtEWT6T8GunPMRXWtIyEglsb+7MsHN9XRZ?=
 =?us-ascii?Q?3wLR1N+/C4TVBKwEOJx2PCnK81NfF8JsU4FxC6GzFVSH0mB40ymyJSwpM1i7?=
 =?us-ascii?Q?gZTcapMmXxKAv5GHDQkkuTX+XzzpAVultBIkU8FVQT5aUjlY2TeYzpkUEQb2?=
 =?us-ascii?Q?OvkUDv+Mfw1sAmxYIrUSYxVWOPeXQTGXOyaLsW0O3X552rJSWNt9lnW5Sf7l?=
 =?us-ascii?Q?MC/ULb2Jqxfx1SQk/WJaUmC+1suPWFDU+uWeKuNiQI/dr1nb0mDHy+7OBeJs?=
 =?us-ascii?Q?rp1G1dbp40h374/JCsg/qzD3n5EGWv6uzbUzDi6MTGEXqgIa8b/GCMOvO2Dw?=
 =?us-ascii?Q?0oLDcWS6QkuLIktvPPjK8BRnEjN/o48Q/ghFThj0ym9ygx1fuCg8h48t+GXv?=
 =?us-ascii?Q?vkVS5t3S/UChXG4XNn5LUYSY1sKdDWzCG9vCL3wvwadxWiOtv7KFad36yzGZ?=
 =?us-ascii?Q?pgGbmA9a/VwONYkye+tPRo+jhhM2RrJ2B/yAdR1nRmDauM31KmtQYfEd9ewo?=
 =?us-ascii?Q?LERumzptkurdkuN3jcoy+P3VfgJ00RpsBOuIW8aMWEVhquSJ3TL09+9IzKG6?=
 =?us-ascii?Q?s9wIId7f9OaLpfUyhDI/QHjIX9mxVt3unof0hgGrz1a31LVF/0NqscVsstAw?=
 =?us-ascii?Q?3AaawUqUjk9+znDE6XOyYc4p2/ct8OzAFyWxn7eCZDkE0Hc1aL8YRtNXzoYW?=
 =?us-ascii?Q?o7Dy13gKkUm+J46FRo41cyHl3i8smKlj+r5X34vgLnRDvYgmEQ63XrEuSBoz?=
 =?us-ascii?Q?7dTV5QPWyRRNEmdO+8APSuXntvogvVJiR4tpgxP2Hl5eZBcgBi5JlJKXV2bS?=
 =?us-ascii?Q?Gz65RDkGDvc0UmRYs0jwj4vW55lACPM7Usu4HzJe/T77H5mMBpWCOx0byeJZ?=
 =?us-ascii?Q?ETymaj281k9OaI1QhbuPlR3hc5k=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1417f46-6841-4ee2-e57a-08db353b3458
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0702MB3700.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 18:34:20.1927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+cdrOvTjQ6wVY1bmACfvmZz8AUbnkjlo8okj5ONKTbfHiY1DAD19GpuRtPLtsjRXSWoAIXpUNdjlwAGL6Xq6W42S88frakpJKHkxqVI0RHWfxiKdhULu5z7FuHrd0Td
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB9511
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 18:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179706

The qemu build system enables the 'log' trace backend by default, if no
explicit choice was made with '--enable-trace-backend=3DCHOICE'.

However, the qemu recipe uses the following PACKAGECONFIG line:
    PACKAGECONFIG[ust] =3D "--enable-trace-backend=3Dust,--enable-trace-bac=
kend=3Dnop,lttng-ust,"

which means that the 'nop' trace backend will be explicitly selected if the
'ust' feature is not enabled. The 'nop' backend removes almost all trace
points at compile time, and thus basically means 'disable tracing'.

To retain the default trace backend if 'ust' is not enabled, the above
PACKAGECONFIG line should either explicitly fall back to the 'log' backend,
or not provide any value for the 'disabled' case. This commit chooses the
latter to not make any assumption about the upstream default.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index 36b2f14638..10001c3e66 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -208,7 +208,7 @@ PACKAGECONFIG[libudev] =3D "--enable-libudev,--disable-=
libudev,eudev"
 PACKAGECONFIG[attr] =3D "--enable-attr,--disable-attr,attr,"
 PACKAGECONFIG[rbd] =3D "--enable-rbd,--disable-rbd,ceph,ceph"
 PACKAGECONFIG[vhost] =3D "--enable-vhost-net,--disable-vhost-net,,"
-PACKAGECONFIG[ust] =3D "--enable-trace-backend=3Dust,--enable-trace-backen=
d=3Dnop,lttng-ust,"
+PACKAGECONFIG[ust] =3D "--enable-trace-backend=3Dust,,lttng-ust,"
 PACKAGECONFIG[pie] =3D "--enable-pie,--disable-pie,,"
 PACKAGECONFIG[seccomp] =3D "--enable-seccomp,--disable-seccomp,libseccomp"
 # libnfs is currently provided by meta-kodi
--=20
2.39.2


