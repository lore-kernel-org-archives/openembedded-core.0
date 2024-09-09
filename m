Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2155ECE57E
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 08:32:52 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.92.50.56])
 by mx.groups.io with SMTP id smtpd.web10.48300.1725870763222988007
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Sep 2024 01:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=pjQ5MuNe;
 spf=pass (domain: outlook.com, ip: 40.92.50.56, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQ1odnXOUNPFRr95hxrC6FDWDeUfRb+uQ9eb9CC+oHcYjPyM3T1xVJpJKhZIA8/L3Am+saMlOmSHwhU/PKDjxoaykuglUj2K+g6JGMcwKNjAo5dMKa3TWS5ZOuQjyj6HcxveF//AKrg5PskwlvUdy9G7fL3KSi1CvOIJOiohhiJ80FsBUHEX129Az+XBsDnzcOf1YeSIZN7V4gByx8LFXoWs7axSEXOcRFG0ElRPK3BmCvn2dh+daksaiDiB9i6m3QuPa2ViKOF0SQSS5pTpL1nMOhIbEqakUSkKCvEYJmyozaBzCuONYH13xtBanx6PTzYvG81b4GFv6h7xq5lhyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0WM+aDTDrJwH5FAJJp81z99J7Wo6v4poe9p2WEOhk8=;
 b=ufsZuIOTRSdrv43uCuP/jQLaY41mjcBbLm7xzyGS8+ng0gvzC/gZs/WXPu289px3I8gSOCdrljkkBksePIhlEuIj92zWVe7mQeGV906iU1+RX1oSeFPG0avVPxf6KBnE1eaDtbSETP/WfAgz51y29GnfEJQBZi3EOGqMlLNUKKP+/frrkGdUOiNdvN+t/17gnUScmJFfapAG6hbBMrzKsanoFAOMlZgRFB4DbN9xz9yNni711doIU9SeU6HkQBXADo0mA4bWKUhZ3vkfbdG5cpiVDeQPoHJeBPPYb6bShnXxorsUeLTHRKSzN9hlI1Ih73MGJpVOn+xpECT+R1WadQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0WM+aDTDrJwH5FAJJp81z99J7Wo6v4poe9p2WEOhk8=;
 b=pjQ5MuNeqjqhs+or95krCL8voGWjSHQDMeEoMJPZm8xtvAPyim+BGsMAhWr5TlnV1kETNevYnBSojK6VPBZaVo0+fFXxAdZHmDI8+VLcsga2loQyefuAS1ZfmG1yzfg+a1eAhZuEY9FtZ67Mc0HJJrFcPyyYbkRbYB2jYrjxUtDZo7cPdIRO+3/oitpfMB5m8OculMAh9B1YccjVDdmbNnn5V+MVJinnTKiOhi4VzxSVD2TpNvyhfK/4byeuFJ1SLzUsdKIRTVJsrpWahjy1gSZyc1w2OgOzgz1ApNTGjiOrjVvAzB8iEIP+nc9UZCRkt1pwLRnvuSWpPEHsKayM1A==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by VI1PR07MB9996.eurprd07.prod.outlook.com (2603:10a6:800:1d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Mon, 9 Sep
 2024 08:32:42 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%5]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 08:32:42 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 2/3] runqemu: remove unused uid variable
Date: Mon,  9 Sep 2024 08:32:16 +0000
Message-ID: <GV1PR07MB91200546874076A7A6C8BD43A8992@GV1PR07MB9120.eurprd07.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909083217.33315-1-kweihmann@outlook.com>
References: <20240909083217.33315-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [woJ92fLHvz2QS/nscpii5ZRudTYVImjRRFxjomJG7i9TVXPFcIvKmWCxG6HKDtyz]
X-ClientProxiedBy: FR3P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::6) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: <20240909083217.33315-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|VI1PR07MB9996:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6b812b-53f1-4c06-1897-08dcd0a9f8e8
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|461199028|15080799006|19110799003|8060799006|5072599009|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: 
	d5LHW1p5y9q/Fa4aNQz7QdT89nucfln0VT07zuGws+Dj/POL/6b+2rkMXwyzTVgd4SnLD1etORy45pFvxrINcC4wvGIoVJQ/QdcaK9TURmDngP9zyw7vHQRLDztav1A61JHi4rrVQ1g8yduqZgIkMihnbJjuP1COvjcu3Fc4L65evSx1dB4RJoLsee1pbvDY9D8PbSx5VqJ3/g178hsx/5MZ1GgeUHAYXJZBqgNiPsGedFmNxyCd1fUzJ3v6mZvDK1luv3LjbelRVnjC9B7LE3ouQZo3M5V3E/dass8Pb5yjtZAw/MILN/Lmh9r0eGb+0OOsr1G/K5vUYAYM3UytoVNUMPm2JVy2J86IMZLRdwsVVfGzcgngKUlKfC1Wd/j81r/r1FNHFAb42GsKVXLt4vKDNTUqQmOJ+1LGHmvl1NaQiONQvAaODbQHvnXAYppZ39PTv0+yKyqSFkexMamS7O8Of5NrAWiDmp/wIRbKYTeeUDa5wlG9IlxSj4OzhCUlK5ZfEHvZAWIcOSxmcxeGW7MOE7Rv4d095AlSrOTV6RRHFws9Y/RM0Ya+d22UUDDTYrbEfmORkKjFOwXmYOR72LrVzjAI6+LDQLEipnXmDEYIokR7kUgpzyDrHEKihHCOAR8JtQAKibeNnZviSnM6S5czibtZrdqTou9iyfN1CmNgCgrhDf3T8OdFs1hCGvyOxItG37uIdqIHc9I09D+rRtKl1KIMyGUNwZ7GLYzuRHY=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?x+MgI/I++fbhEnG8P5LsPkPVju8RE71V593FIfpS6yvBd0rcEIsXMyoCqalS?=
 =?us-ascii?Q?YDe9+L+LkxisqYDIwgL9+cO7D0pqiFqkQEpBsgybO67gHlU9zvf6Ey6jaa4u?=
 =?us-ascii?Q?H4wBLlxFAOqXj3byjHR1o/L7Iuej8Z+bIdrmxpE0pLU2e04sF7JXbDcW3bv+?=
 =?us-ascii?Q?Jvp39xWgeIlp/egQTKg3zRHdsSgvXbMIVUzYCoXhKA22jc5A0b1lb5m79gZP?=
 =?us-ascii?Q?z50C7fOIB08LD6QXnzN2xO/McMw/mVVaMVbYZD7kCc9yp/dK4D4dgWgfgH9e?=
 =?us-ascii?Q?wJWjn1VGQLAWHhmwrh+xOkWhse4faHE8fpb/svRn8QLgjD2a6JHigGa1UjUC?=
 =?us-ascii?Q?eSFYBlUklGTPFaRXxA3bAPRUi29tQAj1d0oByMdPG4YsL3XNEPMJfz06leC6?=
 =?us-ascii?Q?wJfCg16yIblqYdB/aqHws2UxK8LPhiajPl9CF7z6mcfdeDhgS8p2JzMjPO+d?=
 =?us-ascii?Q?vxA+hTpLRmEAuCViSRWp+P4jVELgt1rOXv1zvn73MulFud7bgj5KhfHyErEe?=
 =?us-ascii?Q?A/RhZEFwtabyY3Qdr82RvSVpFhg2lVM6pkiNnedQOXPukL3+20SJYctfkJd6?=
 =?us-ascii?Q?6vtszuUV6zvCSDfXUuJxiWBuIWjsDBiT6wJ1GaihFayDXV0VQuajYBH34ixI?=
 =?us-ascii?Q?ruPf7Q0A6BUciv+55PDLqY73RSzAfH2sVD6VluzYNCAaP8f3dXHqF9dsaX/y?=
 =?us-ascii?Q?zThdTsIm4zfFNwwaXobQwiu2+pNP1WZ/LINWkpq96tdSPLL/nmck7mYDRZT9?=
 =?us-ascii?Q?q/jJLnUR7oajQJY+ApNdlCrYCIjmJdeNj5q7mWa/GkswxyvpdErQnA9fQIqG?=
 =?us-ascii?Q?b34RkC9r9V6M/P56lboPIO4IGlr7ow20iYS38k7V8TER+mCfjwqNA5AvrRDE?=
 =?us-ascii?Q?TAQGy45Auih1a/1moR2GPT4QXuy7a1E4S6niHX+CniizEpFoQmmGiP0BTFqH?=
 =?us-ascii?Q?MxQzRtwB2/lvX4AGBedJFyQgEPhW1kgQFhDunwEAu+H5rNjH/nHK4l8p6tCo?=
 =?us-ascii?Q?ytk3ZuZ9s3+wqU3/WjA2N4EJfIp+oWxkaO/XnVrbWVUM22Vd2ktr3ddR6wvn?=
 =?us-ascii?Q?J16Ka3x3FaJYGmJcwxOf3JOvZT/NJqYk+1o0/F7nWM1GMia1Ce5AQjE4udhb?=
 =?us-ascii?Q?CvqGHbr98UMpKnjNUsEMPqM/HeJkjQTtXAVFZHAaw2eFD2QeS1Cj/sLFQdfX?=
 =?us-ascii?Q?xbgnc0oCwf6HvkhKOBPB67XgUfHxcMl5KHBYOPt5l5wUIIsXrYwCOTWnM/yP?=
 =?us-ascii?Q?VQ3Q7bJxvSRfvhWMEFkybozD9qUh9Anb+t2q9NQi3/wXP0t/j4G2ByKQGbzp?=
 =?us-ascii?Q?lbo=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6b812b-53f1-4c06-1897-08dcd0a9f8e8
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 08:32:42.6558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB9996
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 08:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204315

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 scripts/runqemu | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index cdbb625505..14eb939b3e 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1192,7 +1192,6 @@ to your build configuration.
                 raise RunQemuError("a new one with sudo.")
=20
             gid =3D os.getgid()
-            uid =3D os.getuid()
             logger.info("Setting up tap interface under sudo")
             cmd =3D ('sudo', self.qemuifup, str(gid))
             for _ in range(5):
--=20
2.34.1


