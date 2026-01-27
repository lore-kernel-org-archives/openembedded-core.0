Return-Path: <adarsh.jagadish.kamini@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770C5D2F038
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 14:28:00 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12462.1769524071259813395
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 06:27:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=d7yTqlOq;
 spf=pass (domain: est.tech, ip: 52.101.83.46, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BynGKH8GMwkZiIuQPTaYW5bHPDkGHGTsnFNGPH2cEGbEDJIxTiKJgVf1d/K9n1EMLNAkhit4JwYpoVl/6YnWT77ie4TmGkHwVTmiANjWWWYjsYivxwm8M7Ij/Hzobtuzxpgjz4oexnKypVQ5fYa2IV5j+TRcd8ga37YkJrjS677t3pMlRO0OM1yGk+tMXCD9zFW02mjWLUHP5ZxkHfTYYCj64weLnjUe1sI/9Z9jknRoJDHHH+IHAqwBP+Dpuc4WpAk55DWqy/PyZxWrRisoQuXHHtAkBDIlW4Uyrdf6HmevvBuFmUUJXEviwfIhoanUzoFAqCibYyb8c7gfPNJ3eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iG18e9D961Yf/bVHzO5vm70z+plm+A0dN/n1RHO3O2M=;
 b=pmKby6QcSGddcQnhDyLHlx0lZl37xBVo/t6T+nykdZGvGbbeJDiYFUYGl7+HtKaO1ODLiq3p8eAFy/wEEqT/c2QcD+0k3pmKPzyhTU7r1Iy7JaOQ3uBRWjfFBNd8ViUkJp8XkmXYD2NFuqrqiVnbJOmkKvqOE0AvKbND8OXAyBvSDiXDCXzh4dNE1BwMA+JmoCP65S2trsxprlqkhKLXbZC9UACHqJpqr6SlJH70mduUIaXZkWI8rxmC9xhg4H3GJRh8d5rprhPVJG/ZffqH47vImh53tuKAeQrHlTrwBpLpRlZoQqDDTm7lhOC6J62rJi7Lts7ulKsZrdJ7DnUOPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iG18e9D961Yf/bVHzO5vm70z+plm+A0dN/n1RHO3O2M=;
 b=d7yTqlOqVOKJd8G3N0b3C7sjr2yABbU2XJaFiOFsi3IrwaMacQ5sNUaVHnxqVxZDv2XQUSO64cE35YdjxjY8lWLsSkVMnOaeoFWQAfEBgwCw/gGLlt7rIPelDdIJKG4NbSfCVvxKnyawXm/Qxi0vLaExn+ovtwKyS41lkN4Hs+IbDIvigNW7w/K9AeQa4I7HChtSzsGHOsbPhax1kIGI+8WowSEq8a42Xd9pJaPEvYZolcVrEQ929FqIQUep+QxZ1G1SXFdqcAs7XKOGrZWIgrqCZL5iXh130NuaSEcKJzAWyPvF993mLhp20QqdyLftykmId9Ju2dPGACmudOQccQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AS8P189MB1286.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Tue, 27 Jan
 2026 14:27:47 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 14:27:47 +0000
From: adarsh.jagadish.kamini@est.tech
To: openembedded-core@lists.openembedded.org
CC: david.nystrom@est.tech,
	Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH] avahi: Backport fix CVE-2025-68276
Date: Tue, 27 Jan 2026 15:27:39 +0100
Message-ID: <20260127142742.81887-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0039.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::12) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AS8P189MB1286:EE_
X-MS-Office365-Filtering-Correlation-Id: c4074e9a-4d9d-4f5e-c6eb-08de5db03e01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0anAbsQAz7lavX9K7XWtx/Ux11U8iJ4z7wqSpGaEop+/qISdZ0U61OWY28b8?=
 =?us-ascii?Q?V38x4skEUBNlC/MrdQDwQwjug1P8LqpF0GkaEYnq1FdkEiawV3K2G4VR+voK?=
 =?us-ascii?Q?vfJt0rDQ+GBEf503jWFfciz9rpCfbs0H9VcBGaaEy97eXVonHdnhawMJUAjl?=
 =?us-ascii?Q?JaDFlcTfzN98ZcSgeFPnG9TeV2kM8fl21oVPrr8xTbtFNK7fZk3ssznHDZz7?=
 =?us-ascii?Q?E6swb4HkVlRHqCjlUTDys3KrJIYNOzagqasQXW2k1X0h4HxrYTAbl6r1dzVX?=
 =?us-ascii?Q?VS817QuvIFi+SUYChfbIAArp8ZC5ER6HWE9LUY4iCaQ81bzLm1GJiXFpY7BQ?=
 =?us-ascii?Q?mLKYcW4qBaCWgr+hWqdUUoTeXnIe+uRSPIFmAj/snovHcmW4tKTmYMQTJT0O?=
 =?us-ascii?Q?/V1O6vPlO8kS/xJbsnZRvIRqNW28kUPchs8bM2O41LZjKkuHXjEbnE5JDIEc?=
 =?us-ascii?Q?luZrDQH3gG/uzRC71tutGyp9Tl+V+c1NmQRcxpqdedwWJkGyx+EJHM8UPHBT?=
 =?us-ascii?Q?3R1D/2u9sGLuubE5eokra4z4saB+JITgXLAC3Kj/Pepc3XiNqPz8LwMTe/WM?=
 =?us-ascii?Q?zw21AYUrnzN16z5o1mRlGVoOQNratb7DsqnLi6ittgI7XzcmgrkwDLUoF2Xo?=
 =?us-ascii?Q?amZDeqldCBqVT6JK1OZuuYr6J1Ib0bsOOYMRDJUEB2F+6DaWN31MMakImzSs?=
 =?us-ascii?Q?ZbpiWF+CC04sBCG5V/NmatI5X1Q2SIqGqLACySyMcimwnvYOepKf/ZGEDUb4?=
 =?us-ascii?Q?Eo/nZfJnluqsFHzbqwyoOBbXWzFRsHSdV0HUTYaSM0m/LYrNxVwqpUZ8fflK?=
 =?us-ascii?Q?LFeVvWLIKUl/zPf5pE5ZIq4pGYUFz9Xr65gb6jbwSxzlXUUTZRi93aIkpd+S?=
 =?us-ascii?Q?PCpSh2AtoQNy8Nul4Q8t/A/6/Fcy50vxtcevIChJAn57+mNz4eCvtU0EzUE4?=
 =?us-ascii?Q?wr2GOaE237uGTwNXrY4LGCBWMYeXVwoe0rbkoo15vdL8vZYBc/vuLyUQgOh1?=
 =?us-ascii?Q?aMe+Sj7uarRVrs/qOzpR6alYZjXgBG7PDjGJYzPo5FCSITDAS8KJhJ+WVhc4?=
 =?us-ascii?Q?O7m9g6wmc0praYXFv9zryHwTR83VeuLYoCnhqBFBaqK+6I+SmX+OIve3HN6y?=
 =?us-ascii?Q?jgQ/GKBySxPBzmAIaSB1jACpqGrAQ1SURp78azSYLsyLChwP1qkGbojY36lD?=
 =?us-ascii?Q?lBHPO7M/CV6ktMV7Glj9ZYdux/kqxQxttUEcs0oKnt/nwaXJ+mi64/xta/Rv?=
 =?us-ascii?Q?7bbxoQ6TyJL2GK6FfZrv4Ms0ycdDiZ/bFLz+eFH74GVw8VfNfFhvOPPL5KFm?=
 =?us-ascii?Q?a65nCjucHXJf+K32z8qw0ip28uKuZlHkjuGoxD51fwoZzK6rfkRHP42fbfKw?=
 =?us-ascii?Q?rEH3VsgmWvmlZxa8u8wddn2eKNeCNH9AaTqZJ615md9rQ5wLBXdHHnu2mb+O?=
 =?us-ascii?Q?rkS5MU9zw5ue9YML+C+OIgsHFWX/sD5PER86AlQOSX89KoPCoBiOwFvS6u4W?=
 =?us-ascii?Q?j0gXsjJC2L2QNkIc7yzgFTiZA5bzCbOjytPCNbZeyD3ly1sCV2buEv35xqTK?=
 =?us-ascii?Q?yPEg6MTHN7qrRJzwk6ZTWmQ6CqZTE62dikSjQscD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8ZbiAUMd14xk5Hrd3HeZiNoq9tFgK2cXZpjU/r86+MxaifLmg0hLBrhTmQWa?=
 =?us-ascii?Q?5z0sS5gd612ABvXpzVYOipNmebyndRBsAsCiVLBTuwi5xFLIx2NL3rK/6YWL?=
 =?us-ascii?Q?M7kxhb0wLCGBq8BBgX1RzHz5dkLOQg4YTUT2RqU2qhbH3icSyiPnVdplwscr?=
 =?us-ascii?Q?Vi9mCjcmcaGDO4AEbpnF1W2q06NELTfVxOgt5NEvg9s+T5znZaf2rM8hajmN?=
 =?us-ascii?Q?HViBrG3YIUfDhcvhLYClB4cmi/vdJnH4oSodbFVjQCadYDAxX9ufblXauidu?=
 =?us-ascii?Q?862uUexR2cJV8F9L97dGCRWsPQqFOUfzLqjjNiTmfJG7O+3b2jZyLudziwho?=
 =?us-ascii?Q?y1bFyMR4ApB5EBb5n4pSepThieKppJh3BJGnthZndJgdJdIvZkXGRLzWi1xF?=
 =?us-ascii?Q?bM9KOuEKlhjiPORj0I1wBPPymOpiKpSTAssepUCnTG8k4c87is1cUs3+vLP0?=
 =?us-ascii?Q?ma5XMILS0amMCeNK1dxE93SQhpbpSY71Bn4Yze+01r5dTwimpduZUUIzk3fJ?=
 =?us-ascii?Q?e7B3qNf+uN73yfwk53T85Ug9B50zNb5VCYVZie6AXRyOQq20pVQFpAz6dss5?=
 =?us-ascii?Q?HQ2KQa/eIr7sVmrWf3TK4dUlQKWwgKjuG4BJHNBkfB1DQFfRRlCu+TM3jRJY?=
 =?us-ascii?Q?c2NBRWT4uwr8S4N+1HKrv+8iA6hAwYXk9gdg9TGZ7RhG7FSfbgMwtjGTroX7?=
 =?us-ascii?Q?VQXWcNP/frQcBloAzyMCo90E1pWvEXFiU24oZ2VYKRWHcgx59n4BJznMw3nS?=
 =?us-ascii?Q?yS/ci6KtXS57CqSaxoIrBFlclgV++Z2q6LP/XJl86wMehorp7gZ1GuQwyrxw?=
 =?us-ascii?Q?IZzcHvd+b2ZLyhc5AshSZpmKaQBOTfRf7rtNEnG1IB+9iaJ3dQiN1g+MPhbM?=
 =?us-ascii?Q?X0o4J9CxF8jHtfVltXe2LAUclp8pOXrnt7QHTrndwW8+vv/9WGKK9SwATSyA?=
 =?us-ascii?Q?hc4QmYanfGwqSbUfRppHljo0FK/D5CuQRnyIrCqRkLS3y0DndhNHOr46WkbF?=
 =?us-ascii?Q?znY1bimPxjcR4J/xxHx+TqcaT3/SimIGRSHLmN367lX6dNHbL/aG2endsSh+?=
 =?us-ascii?Q?C6/dReSNetgyGoAFH6pKQRdU3T4iNBdmCmiZNBGTlRbt/iMhZ/5KToKWbhWR?=
 =?us-ascii?Q?Vw5VN2J1siNHRcP/l42qNxxM7Wuu7jb5NQ+2fNkTCQgKiOJCsyAXmfyNYnkI?=
 =?us-ascii?Q?osY4SiNM5sKuD5tFSSzFNDojXY+lRK52QQyw4fTspybUYKVPtgxcIVmvHcPF?=
 =?us-ascii?Q?Wz9oUR4xCG4TDtiWvUsl09aWVfEP+ogxoVeiIR2zkryAlnvB8pDzeL48Fd1A?=
 =?us-ascii?Q?I9xK8DNavx6pRSlcMGdvz6qz3tN5hKprQp30k5apArW6tTmOg0SdtJc0b/7J?=
 =?us-ascii?Q?BIO4yVdJiY1+0KJPWw4eQW3vnuqGauWqQfVB6SoBb0uH9FfpF1ORYYNoPVZX?=
 =?us-ascii?Q?5N4uEpbc399LNV3Grn8ysF5x5WrqGJK6dWZoID7VANuwPPAR15avvOhagIQ0?=
 =?us-ascii?Q?vEeCkdS82QBaUlW55jhmzrl8NEFTlkr4x2yfO2ls+Q5U9ExjAu5NF1cysBIF?=
 =?us-ascii?Q?D6TDA6zj8PG2SpULM2sKSUeqKjyjl977S8bVSWYSEL9wiYIuGe/Z1c7iC/wv?=
 =?us-ascii?Q?g/TFBIRtWIm5NSweIL8XnZYUoOcmW5X5jM2EUfWKlI38bodNQRrie5opoEcG?=
 =?us-ascii?Q?J1RikKMKfUL3U6ctoRPmZlFR8iPDS31iGSIm2s20sTn//RX6lQ3WcgxNjKBB?=
 =?us-ascii?Q?Kd1jIRoDMRc4nZTigqXTNZ89iN+6ZaQ=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c4074e9a-4d9d-4f5e-c6eb-08de5db03e01
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 14:27:47.0347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lxc8b5kxjP2gcj+5H3adaHUPsY5cotz31BU6MPH4EcS7Aq2ZEqe2mkzuS9Vy/uqJpt32CFJi0KU3tN/24gigplCS/wd7vRiP/d4PFAwjoH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB1286
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 14:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230047

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68276.patch          | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68276.pa=
tch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-co=
nnectivity/avahi/avahi_0.8.bb
index 7930bd3037..bb20fd17cc 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -37,6 +37,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-${P=
V}.tar.gz \
            file://CVE-2023-38473.patch \
            file://CVE-2024-52616.patch \
            file://CVE-2024-52615.patch \
+           file://CVE-2025-68276.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch b/m=
eta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
new file mode 100644
index 0000000000..b3e11f9597
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
@@ -0,0 +1,68 @@
+From d5d18ced67e969d6a5052cacdbd7d4b2c97a1a3f Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Wed, 17 Dec 2025 08:11:23 +0000
+Subject: [PATCH] core: refuse to create wide-area record browsers when
+ wide-area is off
+
+It fixes a bug where it was possible for unprivileged local users to
+crash avahi-daemon (with wide-area disabled) by creating record browsers
+with the AVAHI_LOOKUP_USE_WIDE_AREA flag set via D-Bus (either by calling
+the RecordBrowserNew method directly or by creating hostname/address/servi=
ce
+resolvers/browsers that create those browsers internally themselves).
+
+```
+$ gdbus call --system --dest org.freedesktop.Avahi --object-path / --metho=
d org.freedesktop.Avahi.Server.ResolveHostName -- -1 -1 yo.local -1 1
+Error: GDBus.Error:org.freedesktop.DBus.Error.NoReply: Message recipient d=
isconnected from message bus without replying
+```
+```
+dbus-protocol.c: interface=3Dorg.freedesktop.Avahi.Server, path=3D/, membe=
r=3DResolveHostName
+avahi-daemon: wide-area.c:725: avahi_wide_area_scan_cache: Assertion `e' f=
ailed.
+=3D=3D307948=3D=3D
+=3D=3D307948=3D=3D Process terminating with default action of signal 6 (SI=
GABRT)
+=3D=3D307948=3D=3D    at 0x4B3630C: __pthread_kill_implementation (pthread=
_kill.c:44)
+=3D=3D307948=3D=3D    by 0x4ADF921: raise (raise.c:26)
+=3D=3D307948=3D=3D    by 0x4AC74AB: abort (abort.c:77)
+=3D=3D307948=3D=3D    by 0x4AC741F: __assert_fail_base.cold (assert.c:118)
+=3D=3D307948=3D=3D    by 0x48D8B85: avahi_wide_area_scan_cache (wide-area.=
c:725)
+=3D=3D307948=3D=3D    by 0x48C8953: lookup_scan_cache (browse.c:351)
+=3D=3D307948=3D=3D    by 0x48C8B1B: lookup_go (browse.c:386)
+=3D=3D307948=3D=3D    by 0x48C9148: defer_callback (browse.c:516)
+=3D=3D307948=3D=3D    by 0x48AEA0E: expiration_event (timeeventq.c:94)
+=3D=3D307948=3D=3D    by 0x489D3AE: timeout_callback (simple-watch.c:447)
+=3D=3D307948=3D=3D    by 0x489D787: avahi_simple_poll_dispatch (simple-wat=
ch.c:563)
+=3D=3D307948=3D=3D    by 0x489D91E: avahi_simple_poll_iterate (simple-watc=
h.c:605)
+=3D=3D307948=3D=3D
+```
+
+wide-area has been disabled by default since
+9c4214146738146e454f098264690e8e884c39bd (v0.9-rc2).
+
+https://github.com/avahi/avahi/security/advisories/GHSA-mhf3-865v-g5rc
+
+CVE: CVE-2025-68276
+Upstream-Status: Backport [https://github.com/avahi/avahi/pull/806/commits=
/0c013e2e819be3bda74cecf48b5f64956cf8a760]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ avahi-core/browse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index e8a915e..59d53cb 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -541,6 +541,11 @@ AvahiSRecordBrowser *avahi_s_record_browser_prepare(
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_FLAGS_VALID(flags, AVA=
HI_LOOKUP_USE_WIDE_AREA|AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FLAG=
S);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, !(flags & AVAHI_LOOKUP_USE_W=
IDE_AREA) || !(flags & AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS=
);
+=20
++    if ((flags & AVAHI_LOOKUP_USE_WIDE_AREA) && !server->wide_area_lookup=
_engine) {
++        avahi_server_set_errno(server, AVAHI_ERR_NOT_SUPPORTED);
++        return NULL;
++    }
++
+     if (!(b =3D avahi_new(AvahiSRecordBrowser, 1))) {
+         avahi_server_set_errno(server, AVAHI_ERR_NO_MEMORY);
+         return NULL;
+--=20
+2.34.1
+
--=20
2.44.0


