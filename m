Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E093CCFA06
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:27:08 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15413.1762154827579534555
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:27:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=YhpuqLsG;
 spf=pass (domain: navimatix.de, ip: 52.101.69.89, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAzQh5kCMaF4vbQROHsodNYkXqSuVfjphkyvchDNDgz5sfZw4aMfamCL7cFCNDUtrDADvRtNSIZMgvYBofiBBcUBqndq55VgmtYOVud+daktPeMRn/lZ8CTob5muSRxy7zo4GRNvLoiVz54qlJqdcKqTJMZbloIJml/nS1jrd6tTojNZgZMa5gIfaTJNwf8gGPC7p1pIkGj4quwnsiq/HcHGXP+5/JmAW8SbNH+bvRYGNFBAC3nn//RMwbjj76BCcWeKnkhu5xwtueXljGlEjTgr5xEkatVOQis5BrA8DwFXEM8VtmXKpEW5v7Fn0Jo6KBvG5l0UVcoKAawWCOVaag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+d6VRxzjOSlMnAhhhSOQy9cD5YfE6x8Uz+VSABE4G4=;
 b=YGdT4qKKtEqBdGQV/dN2tWTa8KpinkI+7VMG9pq+z1/+GpcgYhI+8DYs1k80CSQQDXV7vAar4dUEaiEiLCN6CGrTTqfqBorfHGyUKHWPKmGCznLgXHYOO9pvCPjB4wxPzUstBlfmX4yqEWeVJjp2zsRwHTk5QspDGksXiOcZ3q5aA04LAkipXhHa1AX578WFwqvIPtbBnaxWttlqIKT6Kydlk6tlmDKADnDdD2A7ghbqlFS7xI1H3P9wGIHU3Sgzor7imSt7rwocqdztlrE3JexNPOCCYOZowH59kXFbM9gPbGx2bIdoWNl61DsHz0vrerhXi09PpK/+prvVesC27A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+d6VRxzjOSlMnAhhhSOQy9cD5YfE6x8Uz+VSABE4G4=;
 b=YhpuqLsGc/zi7DzvJmoSY42PLct6yG0Kul7GAnIg5zBh2vBBzlfjXW6WFtIz8WN3jlvCBlwQROl46e5KYtrdjORpbyyOMYUapy9rpImQPTzxQYby//J9udZw8uyNyDgpPOwa03iAP7HBizD6ctjYIh0yS4nqjDBubUJZSdnJ+ag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS1PR01MB9155.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4d5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:27:04 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 07:27:03 +0000
Date: Mon, 3 Nov 2025 08:27:02 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 07/18] epiphany: Use SRC_URI from gnomebase
Message-ID: <33ac8e9b1b3f68a98a348057dcfea67fd295db6c.1762154252.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7a::14) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS1PR01MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d6ca7a-8178-4707-839c-08de1aaa62ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mD9niMZLULOtGmAQjzd76+GN3ZcmN6dOZ34o2C82aT0pFxYiaofejeCm1bUK?=
 =?us-ascii?Q?Q20guazlaDCOh8dK7XMZ5dtCNYDZsnehcwg71XsV6uNWqiv/ciy5HGaWqG0P?=
 =?us-ascii?Q?Iyj90QZ8iQ7Fkmoohni2zkvm5jpt2N/QLP+oRv6NH4q517878OvHuTqROG8D?=
 =?us-ascii?Q?+0B2PpFFsI0zggjmXkUfcWgBU8eOqBRT5h+7rkHQkhVZfNdTjcLjI7/F2gJv?=
 =?us-ascii?Q?PDiwIiFum8TXdh84I7T+U37BTQge+QJ/WrA/x3iy90QnxWaA3WPhlc6mnH/1?=
 =?us-ascii?Q?jPEngWCWstb1jDOgWuh3GgL+6YmfdzmveCgG00mxCMGSZz3XzQi/cbUyHiVj?=
 =?us-ascii?Q?zfQ/aaBOLV+IqzUAvgqmkVPKzdTD75RdBqCGe2cXBcXaiRzA3Uhnmt96U7fU?=
 =?us-ascii?Q?hpQKM3MajWGymMvAh948OlJT6CAlrbChIXVDqvqd2830n+9BAbPYoQMDiJnI?=
 =?us-ascii?Q?HD6pKFugE3xpOpa5imge0vn8zTsEGbX7oyQGCqjUfSdaccx5m/qm7hHb4Z1k?=
 =?us-ascii?Q?P0qR7X2tidUEOQHzrEL1F+Hnq/ydhrC+LSVSv2jqXkKnp4ZFFMTJkx0+hldc?=
 =?us-ascii?Q?d9jZ8b/kY302LwKg/I0gyRzJrauEBTxWbAa+TVVnMqmQ1uhgDq4q+rmfHu2D?=
 =?us-ascii?Q?5mPpRRvey/V4JxbW3C77cZQ3xVbPJotcoMYo03QEjJvbnpZZNdNvv6IY420D?=
 =?us-ascii?Q?uMpHD0SfaHwfim8hjmdsCCFqrmd+csqO61N5OefuSdGlkDdWwj+lUhQw/b5N?=
 =?us-ascii?Q?pw1LFqboAsn+4bi04F2sefMe72NmoVA3pRauDuGGUwe5d/SyfC3Q290XWCVE?=
 =?us-ascii?Q?wJerjzegCW65oXWJGFAEltNCquCHlLBDEhMiYks/tdLauQm/Pj4y9yTP3isZ?=
 =?us-ascii?Q?aAeuEdyLWlcstRA8uymr1ThKjMdN3MNLynBiw0+UUdvmdB1nJo+I1c5Dny86?=
 =?us-ascii?Q?0YZudI9ZnWHrxAu0elPhpUc7AR0lUROPgXJD1MDc8BrDuLuKJ1qSVCslHHY/?=
 =?us-ascii?Q?Gx44hDd0pRpesKiu4r+GzEtmmOGimFZ0gKFBUQNBInwpeHl0xppSBUDU26v5?=
 =?us-ascii?Q?4MAI2xN1zOmG3xkdD8cWjI3psbeWOakqfkAk8xGt27mzo0Zopal+pnLkkyGZ?=
 =?us-ascii?Q?xD/mzjm5o1cKJq9ooFGg7oNmlF7uw7/I71Vz9xTC5MQk8+tx7nV7dUgn/0e5?=
 =?us-ascii?Q?HcQVNXDr52TnUHW4r+XUjc8xzsTFx9ycAi9XaO678HvEeLUWX429dgSrOnaQ?=
 =?us-ascii?Q?0TfXBAPCyvLlOS3wui0gcCi2Sc3464IF9EstTBNkGmt/Ft3PP/PzakrU6OZP?=
 =?us-ascii?Q?TJk8AZfbHKvoW0vz0GWH8lUhN6SwrYWBUmp0E1QL+D/URlN7+E2UKVGu21AM?=
 =?us-ascii?Q?dnanlJqK4w7qJrIl/f8RNDqJX0Oy9qefpEj1Ho6FGTfrz97sj/GXDozW+n8d?=
 =?us-ascii?Q?lDm9K5XIpANh1jKKKwcVKnO2Iac/t5Yz?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Wjug7tv4ZEiyqpZTZLXErREvwShl4UGoT15587BG0oxXmlBOVkDCPKmyJe0P?=
 =?us-ascii?Q?vBxNLwqw+BAbZ4wiBUuDafsjOxDgC6oPFuz0sX7oft2xA4NVjD5wVeI8Snx1?=
 =?us-ascii?Q?GSuJ5fY3pYEqLWj0QU2yhAb1XiIuxiocY5uOJXLpbgDcJC2za+6phWHRyWmH?=
 =?us-ascii?Q?V9FFrPcR4wVVhc0xsAploQ6YHtRbA7c0SufOtOJX+BhjXY7N5cFlm017f8+q?=
 =?us-ascii?Q?74VSbTr1L/5G4B6i7npF3h8EPb5rfE79+7DnLhGyxFz5ldZoZYYX2XRmity3?=
 =?us-ascii?Q?v+7qMk5D2sSKrkSZPX/9PKtSxbrPpJaMcriQEfkF6Af3azvZNW+v4OMpIGo/?=
 =?us-ascii?Q?fo7kwO2Gc1S4XJX/BMuPWoOxMR1cZO1n2PmLX+50M8KEREpemtwotdX5kiKn?=
 =?us-ascii?Q?RPad9bj1IMMBvuSRLPodErc1VCbpZ9dYBeOnuSjqZIy4uUw/bbC3SJ+L1Fhz?=
 =?us-ascii?Q?/Yja/K4aPUwLJ0ahNUWZ/TWG3lFeZ8UDNln1mGdFmzFkAoeED/S7b9QazxZl?=
 =?us-ascii?Q?E8xleD0HuqxznnbJk3ry+yhvUiW8Zxxj6dF73l1+cbb2Ot/yy0DzcWCTpbN9?=
 =?us-ascii?Q?ReMVVYXgvoqNq0qXaUNweJI6Rir+K7zectq7UKwXZm11wPd3lrGH0mghAFRw?=
 =?us-ascii?Q?dRftUx/be2M/V4TicYOIwj74QSJTJ8s6oEtKwA2b0Yhek8gv/+TNioUlWtVm?=
 =?us-ascii?Q?RGjspPMAF3vHz3drpdR8+WDFIeLfQEebIAVGuKaZygTN+dp5FoezMKNDQxJq?=
 =?us-ascii?Q?1yVPzCa+Jzfs0NSeMMG2S/EuH9SvTCzmu6FtZSG1IRLqjy7oPUGumHEuRHWN?=
 =?us-ascii?Q?YlvkVt0vRkAo8EVFvP3wO0RFhvpyYTbODeLhhk8rpQJ+0V3smCStO2javA4s?=
 =?us-ascii?Q?U4JD4NDxEWj0CRgMo+D9rqxHBpuLp4QiB3oYxWTi5hy5uXMCHVzNuNzGD6UF?=
 =?us-ascii?Q?ZxFHZt3IDs+qbnVVndLegjsL5wm53IrRIrILv14Ea4ja+Z5m1yXoZXtUyfXL?=
 =?us-ascii?Q?xahsHxHgUvaR2JyWdYUWw8vS3S4n+V2KTjennJmhBWEkIeyKd2/LqlFYW/rz?=
 =?us-ascii?Q?rZjwOMKYncYYUQwRrJYjmNdIf21/l1lIMQcbWb+hLj7BWo558U3Xx288goOT?=
 =?us-ascii?Q?N6j0yQKSnKtAZOu7802y7wCbvK0NswWSOy3pG6CcPttqWs0+GexfdeAOgLPJ?=
 =?us-ascii?Q?uMo2ZxHKwhvBYhF/4+88thSNga55nXltdP7eCE5Zj9aD0mmQjNEZ71Uzy6qw?=
 =?us-ascii?Q?ss1PNofZdD190OX0Ra9bq4AWwfIvRUOep/CK8Be0kCY3Sz4uvgR6Yw2zrwDs?=
 =?us-ascii?Q?FxgRVPE+7JRcs7+Nr7Y4c9H+kMY+SaZYlp0Md57J6IOe1qoTypsmEgDIFkTI?=
 =?us-ascii?Q?+uYEJG2nzp3lpRCNWoK5L50wgJe6RNhOr0/giXso6Z2Rr6MXOf4e7ibbUACi?=
 =?us-ascii?Q?WkOp+Hv6C6pmW/vtB/8bF9eXP2hfWTNwuDNIeGT9xOaKx+WRhs6tdRvh/b77?=
 =?us-ascii?Q?9R5QlxIb3u7QtlHVazah3GU8HBm+4GiMgchTqXfE+MfpKFwOBXcHU8l3Q22y?=
 =?us-ascii?Q?I/A67+C2MWtLDN+mVW+bFHSQhw4CIMqhBfJKuCc1Mcc2PYEutykxMPhdsH9r?=
 =?us-ascii?Q?hg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d6ca7a-8178-4707-839c-08de1aaa62ba
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:27:03.7699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJSrSE3UcVVg9BCZz2igdRR9J2kDGcFKPhb3TMmGPM2CBACbg7jf6flMp2qyeNnafPDeigA14oE91h8hlOt7r/8TuGBVpmO3TQvYQjoI8r4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB9155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225598

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/epiphany/epiphany_48.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_48.5.bb b/meta/recipes-gn=
ome/epiphany/epiphany_48.5.bb
index 8129cd79f8..6a1abdc553 100644
--- a/meta/recipes-gnome/epiphany/epiphany_48.5.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_48.5.bb
@@ -26,7 +26,7 @@ DEPENDS =3D " \
 inherit gnomebase gsettings features_check gettext mime-xdg gtk-icon-cache
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", =
1)}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=3Darchive \
+SRC_URI +=3D "\
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            file://migrator.patch \
            file://distributor.patch \
--=20
2.51.0


