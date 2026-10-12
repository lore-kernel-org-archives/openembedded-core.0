Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A42CA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 20:27:32 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3961.1791836843813899989
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 13:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=DyWft9Ab;
 spf=pass (domain: est.tech, ip: 52.101.84.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4Qo71a3n374xod6UZ5GSEaz1a4Q5hxFq2tqGY7hwVor65mgUNcKIS7z5876NCd/LVDhN2lI7xaPEVNOnWni+bFX9T5zBdDfLpKtJ9ItT09452csREvgftctvQIMsXcE2bLRgWBUa9PbvDZL/NYcy7jERvJ8iwzphsUqzr1KBRfVt7ls/hz9tCRhBz4bCDn9+eTKN05GoQ/Fo2seZDSZIWqczHdYR4nXPvhn/GfGTwL6KrzcUWd44xVflitPPjj+C0gIx6S9qsrTq8H58f5d6MdrxKUa6pDnQsEXXilHRdvhem5Ff9azHG+UiVLIgnimQXUnIj87rbVvSOuy3G4Gug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ot7VpKws9xzRVxajAmPgLxhCntJYdbuvtfZE8tdqPug=;
 b=iqewzCsuTVZrzzAq3qwbZVfCBk8YSBJdxlnRIoSa/OsSsWm1W+qYTexS1YplCwzgWIKQ6ReYdiuA/QLp1mwUY6bFfMWpK/WU70vI+ZjwTnubQ8Xs4fDG/YlO9M9AG8oWSFbvuiocyVLnnIRF5l9TwI0aZ8GiMTeOmALvj0suyEsyqof3Tpy5Q14im+JeVyf4MP/m3rV1NnhtFSZUA6+4wxLwjp6xL6/6OjGyr4WcXQZ1TLE0SfrwzmWlNAESfijVUSRNKQh5iR/PqGUbWPuedIMZuBPK05/pDFiq+1gVlt9iz3KEu+4I5kXWvOY0FITN5QOft7+Fh6pkqqMHpl71TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ot7VpKws9xzRVxajAmPgLxhCntJYdbuvtfZE8tdqPug=;
 b=DyWft9Ab7a4ldNjdngc2wXdlUIMWLSCjURosALbac4MbQBBZkBSb5XLIrvJsRVy46+6MbTgDWJGy29PasV5P+aECo7/O5Jny5HFkg7T5Jd9ppDJQ54rpWmPuoZRrPpoNv2SDDw2Mqkx+G2QJtVEEZbuhxIeL8AqBI0s/pvPzqMEN1LPtHHxXc2w8ZH0HgIKOuTA3jm25FN/4d1sUijuO3JtBje+L7/d4f1Q/6g6EKK+RKiY5Gw/8RfC+JfGQ3P5h3qxFjoMQyrvhVqvHhDzpjyFdty3joFxstixZzlh/FFYdB8WTRovUCUO4WMtnhOYcdbLzRKZjgZY9kSdtbHIhuA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3295.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 20:27:21 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 20:27:21 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 02/10] gstreamer1.0-python: upgrade 1.28.7 -> 1.28.8
Date: Mon, 12 Oct 2026 22:27:08 +0200
Message-ID: <20261012202716.38597-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
References: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0233.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3295:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e7fecc-9125-4b18-61b0-08df289f37f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|12006099003|10067099003|18002099003|22082099003|260925021911599003|260925021311599003|260925022911599003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	kGZCE4MUhxron2LlX9vLy4Ifk9205cjMsjyAFJxnRNVPTk7dNq3w2r1lN+5OQvQQCsJgxmouATyvwDyWLokzUBhCqPDlOwAKYnYIhzPGKjP1lD2br7str3e8aZ26YSDq6DF7X+0Ly4EvBTMxWnUTFY66NujLpY9BgarZRCDLegaMI4+iP9z0G/fRSTXw2Gn7cvm7ERvdEccbgIL8Zwzcf5g9p6N8mUe/3wbKqoxP55QG06RlnwGJIpMayKg1GKHdbAuZSzEGCiURS4J8P9bOH1wSlkK2qYFhhQPKH4pBuHbiVWkfVe0fi0RA/+HRJrRNIPemDWYrvQxdUfCtPcMjWEl7vEacAKliDBqLug1BwppMZjDThTPpXitdYTRra8NshL6mmbkgGRn1GcydmUiOy0kMWLHeK69LXYAzEveEpD8ESEc6O0CD3ezcorVHvnLVhySd8nwqY7xX/hNe6U8kXNwawlvYwjb+UqdqVhQtCxOar5MUZlOvPncnfANMACh+vrj3Is8/AvfC8Wqwep3wuvIAV3JkAGgP0Le5WTY4CGMatATBp/MCmNwbJaTtbzsQMaYx9FKaB9yfaRX+sNCqwIQt53XvXJae9CjnzdCqNI8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(12006099003)(10067099003)(18002099003)(22082099003)(260925021911599003)(260925021311599003)(260925022911599003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PiIO+nFeplk9i+SRbXmieulBoDk7tjbSAiX34acVtHfQ+A2kslnqQOUz6Q5Y?=
 =?us-ascii?Q?Tpnl4GEr3wFYL8vy1a6MXzhq7AXbV8GlRpLhkfT+dTqqL6P62dUx2gY0rEkB?=
 =?us-ascii?Q?tT8c5RRzP1KAU60X8BznkkD6ZyueFm5vPUowcJi1jWrEmn1UbcVbUrAU2QBj?=
 =?us-ascii?Q?VF/1GpDLzxqQS3llmWac4VKnnjuoNy8T35ulAP14iuYjnpMF0UaJ67EWTkNv?=
 =?us-ascii?Q?Z5d0YeOdtVTPcYRqi3W15XT58OWh1jguVm1mhAeZHkNtM9KH6Nsfs6LJRyMZ?=
 =?us-ascii?Q?FhMg7yr4UcoxCG/jL3ZubD0X7vf7/Yy/pK24hfqotfjE/C6h0ZaxhXjNW2Ab?=
 =?us-ascii?Q?9uXU9X53xuE3H2vNQJsleMHnBdc87GIXQ8BXqI1QO3BCiXNix9vAK4e6f/qp?=
 =?us-ascii?Q?aR7LRE2fm4wjb3kQXjPNWh6SG29HrSLSrkawO7/ZSryOCMos/gzC0NcMeGPd?=
 =?us-ascii?Q?kJlt/meP3cfYA1NId6DH/ZQthQXVg2Io0lzN5ccAcCRCpH2Z8PNnBSRduomX?=
 =?us-ascii?Q?E8EsKUDguto4zEDUAqeEqTUx3U2uZBway3YQZdJerReEelTRThz3N/httlNf?=
 =?us-ascii?Q?lVn/M+CTdrRBKJBGhXnlHFi1JocIrB0K5kNiLyNAjHZy32ms/2IIweJeA734?=
 =?us-ascii?Q?7diRdJo3kwr+aBHepvukS7qEdXpVIl8wcvR6npmsYtJY3Zr5Xtu8qX84sXpn?=
 =?us-ascii?Q?3OV3/qwgNxXVm6ul84bs6WAMtcx6wLhPzhbjLlsiUI5VINWwwvyHW+G52Xju?=
 =?us-ascii?Q?eHworUjXdp2hMo09ml+dGeB5wrawoi3Z2nore+Cpv2JVL7DwYcIKHO0lFDew?=
 =?us-ascii?Q?VIi0+NXEPAIlKalQlA0+fKdROIaJGtgwuPK+XRxID7Wqb3glRDpEG6A31agA?=
 =?us-ascii?Q?tM8dv3ASdnJrJjFhwkbnY4uRXQM9x2lOmt5luy65fw2pc/ieugc94N6Ia9w8?=
 =?us-ascii?Q?1qBuASVfkEkY+jxIr/AvvNHjydcGZ7UWYbPIMWJnQRd4/767iuVMamBw+lJe?=
 =?us-ascii?Q?z4dF2oW2+tf0cyouBgAwJhT90QrT2U2T1T4ZdIfqFVBw0NtvvL8i6Bu8BWpn?=
 =?us-ascii?Q?vbw7I4PzW+k7itT8HRnmNlouINX65CjIAP1yuIofXjoodjKCmvUck6b4V4mE?=
 =?us-ascii?Q?6UD8mGb+/VtiZ2Ce/olH5If5XcLI9xCz2ewtf3vYrvwXD4NRRYtDFtuZG/sS?=
 =?us-ascii?Q?f1ct+8L9NNSwJvMgZKicM/lqhHOMF0UOnD+nZZJqgoHT/wphwQOM2l2yGs0Z?=
 =?us-ascii?Q?++rivWd9UyMsLzpNX6nm1ay/aXDY9qT9yDTFP9VD0h1Oe1IiKIqtBjugO0vr?=
 =?us-ascii?Q?7vEcDxIN1jsF89uCKonC+mMurW6hQ51kA5gTP+9ATUtAbkqOYApNcAAY5naY?=
 =?us-ascii?Q?Epet23j9aiU5w5seixCU/B7C+JxtRGm/VzsGXjMHXYDahPypdLsz4YYqHmP0?=
 =?us-ascii?Q?2wJmniocTmPt7OaV1lvin8cmkf+ovV/+dtyE4xyVcY6Z6CUe2xlY80lspZch?=
 =?us-ascii?Q?m718u7lVL3OgHZyLiMd2bD3s2FFiY5fWlL9NckAH3YEhfkwztptwsvQWdOJR?=
 =?us-ascii?Q?YYpv3R80QGVJRwXcuEMV0IRMnrogLZqlRa53bC3cTBHmwX4yBcr0vp+rN9Fg?=
 =?us-ascii?Q?M1CZTTnMbo64VyLi+FiSrOWzlU/423vsLrYBJ3tkVH9d7Qh36eETAiW3ExEw?=
 =?us-ascii?Q?2Fu+ilbIsRRU+719TZrqEEUWenHZBxWm4TFhkxL+gAvFoRFz7P09d5QV0BMJ?=
 =?us-ascii?Q?rqdhL7BfZg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e7fecc-9125-4b18-61b0-08df289f37f6
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 20:27:21.4394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 841H5Xu+sq2qmAhygcUIsAJLLed9V7zFXUN4WmN9I9CWiAFsXZ2R5P7hCogzxMaOwtZqZywOCJZn0AZ/o7YFEHiwJDuDJOPLucvj0Bxm9dQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 20:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247677

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.8

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...reamer1.0-python_1.28.7.bb =3D> gstreamer1.0-python_1.28.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.7.bb =
=3D> gstreamer1.0-python_1.28.8.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.7.b=
b b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.8.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.8.bb
index a33bc0f057..c7efa31ecf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.8.bb
@@ -8,7 +8,7 @@ LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc34deae4e395ca07e725ab0076a5f74=
0"
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${P=
V}.tar.xz"
-SRC_URI[sha256sum] =3D "9c23c5dddfd2c9b94bb1b4e4f5b90ebc6400d84277c77cf91b=
1dbdb4a8b451f9"
+SRC_URI[sha256sum] =3D "6e0d8dd920234b9feeb86003d8f43c1996491f9d8190882329=
bf56f60a70206e"
=20
 DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstr=
eamer1.0-plugins-bad"
 RDEPENDS:${PN} +=3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobj=
ect"

