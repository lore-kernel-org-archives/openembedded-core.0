Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4DBE81BAA
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 12:09:08 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46133.1770638939128938471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 04:08:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=pS4oFhW7;
 spf=pass (domain: est.tech, ip: 40.107.162.62, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izo9Oz3Ya1v2pVJmv9GggmttaADXM8wAJn5ukIdlKlYZ9kTzxSOzhDbLLY3sTtcE4WxlzSYKGKDpJRRVu+WLZRzD7ZWTUKFjiZzcsXbW+69GUZJhWOHsTeIlRsdGJuQFd8io/wEq24z+l7911yCmMUFeo4DVV7vzKetQatVVxGyZiGGMOLddB8HqB/PQ5KdWgDT/syj0bozTAi/i2cX+B9c0Rim/n6qTEtsThiIW8WOBvK49vZYjo0W7auif7Bdk3LcSgg6Oae0ipyVPgalS6Jem64yTafPXA0zJLRs5DAWMrxYcbnBSwInSsFpeyRkhZVaBY4bezKiT30BELk98WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bnyo/WKK18VAUzYbS6ou/JrQayeT3E1JfTYW0r2xHI=;
 b=eQ4z/AsHw4zHbiZ79/E8voOTF5pDSQNEAQ5ztmIEBPYHfYPVGfmd8G8vbbhx03CxzKhI8l/Q7iYNDS+XTlDIQMB7IpsNDKTGFlDQURKGZ3Vyvqf8BvXgGZX412RjZn55JNpbuhHYtJq2Lfo0hcKBqRtB7lXYh2gTvNQbQVStlBHHqtpH7GCe5RzVDGC4kJN2nJ7a0jinU0x5MOXPRvFMQlWq6/aXVuAI5QvVaWmKCIwQph7OuaPJGnUsmYY9+axXN//ctAftWhBL5QBhxNZxPG/NLPQmyYpi1iTjZ3AmTeUk7qdc92DT/s0sZUmLGq5hxbO4X2M5LhvTkiFwzRbOig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bnyo/WKK18VAUzYbS6ou/JrQayeT3E1JfTYW0r2xHI=;
 b=pS4oFhW76wQgARJ13LKdsSWfadcHIrzWmgS7kqPRocaCN+TH/JZ2bkOG0huJQgAcnNSTo25uEOmX/JDeo+rEKfv5Hmhnb8ijQLsanyILKIxbSZA5vij1digPDkwY4dACWa1bg62JsiS5DPQOl8OTDnsDukDmDO1rghy8rVgfQByv51D8ndUFUkRf1UTijoMqhDEnZdY9zRsM+S3Y44C2WP0ZMSDhnArhECVrafl95K+OVValBTzqO+/jC8KOCyVOzuO08VIxit47cxHPynhZEDznoF+jOBglyTlhauTHHh8k4l7Q/50rpnfg6T74jNfTUNWGq9NakMTQczmjGqvFQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by PAXP189MB1951.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:277::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 12:08:54 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 12:08:54 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] libevent: merge duplicate inherit statements
Date: Mon,  9 Feb 2026 13:08:48 +0100
Message-ID: <20260209120848.34882-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0516.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::9) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|PAXP189MB1951:EE_
X-MS-Office365-Filtering-Correlation-Id: d8fa1dda-b7fb-4606-dc74-08de67d3fec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?r/KGgjzaiQYkDs8xqNZqznNmKBi/FragR3RAm+NI/RqWk3jMpfGUCi1tkey+?=
 =?us-ascii?Q?jgPNmmQGsEp/XbL+YE7G5JbfaS1f9FqKx5DkyKIBVBIPio2p7NgeJ9tOnCXx?=
 =?us-ascii?Q?9jf3KgYnhPZ6KJs97RjDJ5fyXJYTfOZ/V7wbyGDo52uKCFnCSwjGNkKhhcC5?=
 =?us-ascii?Q?3HX3tsENjGnoSFScw86tvJ1UvokoQXXVOnkLgWn2/a1DBU+NuZquaOALl/vD?=
 =?us-ascii?Q?PgXgF35HBzqlGXvNvuoqCGtowMOslliwHrkGG1gNogXoJPHA7k4kJcngBK4R?=
 =?us-ascii?Q?oW/TmpDh3AebKOec3K33fG28IHkzIxD35tAkCbd1q6vto9oL/TWzXDcdPj5o?=
 =?us-ascii?Q?Ok6OcZZ8wXZQMEdYvd0Cv3HWKgyGmObQ5t4F8nuPXaZwH9yinTMNfn+eaeX2?=
 =?us-ascii?Q?a7saWMXfoj4MQoNs46T1UGZil/0pRR317e6EDVHfxrVPBB32DZmR3v8tlRP4?=
 =?us-ascii?Q?YKMwa3PU3QTZBlSxBVV5y98ynyuhZNSOE+0O7xIKJTofM6RgtSreL1bVfVK2?=
 =?us-ascii?Q?OFxvIu8bcbvIsmlFUrTsB3yJYcvEnjFh1U9A9Hy2rZOx4Xvuyb+FOzaSmfji?=
 =?us-ascii?Q?vAvcl63ombGNb7WdQ5hTVAikSUzIXjyWY4pyEMbaD398CCGfyL4BiNWm1wtS?=
 =?us-ascii?Q?Gbw4q2A+xx8VNbhKEUxuPgg0z/ktKrdmu5wVKgQjdGWpz/P+psFuIOurBTzm?=
 =?us-ascii?Q?ZONTY9V+tRB13QUKrHSOcQ5e0ru/759ZDl4th7q0+mujnhlIGgOFbcIVPpO7?=
 =?us-ascii?Q?9hU0+gJq4lC2PkntX6/YO4a2Jni3kpUBRM4n+sTzKDS945XBNVdNxTBXd6iS?=
 =?us-ascii?Q?x4FkhxO58k3rRpT+BQk/hm+KQA72csWwo9FXVE2XFsoli1ywmIl12VdUJZit?=
 =?us-ascii?Q?vXhXpM9I1Ulv7gXEVy+KM36ZU3KGIr2QVPOwRduKAqWsl/fg3/2W+NqZazoZ?=
 =?us-ascii?Q?U9gWbDqchowJOy8lBfvc4g8BW3Vpr5Wqi1tVqA5PQe3ATXUHx7/NYQqXGLcs?=
 =?us-ascii?Q?4TuQPAHnL+ETs/lO7R0Ngdk3zVUZQzxjRBGaDHP5+O+7pUP/xn2GhF7wUqPj?=
 =?us-ascii?Q?hOEuY9o3XFiWExf6jlEI3l7GaZvfO+5DqCJncYdUyeJ+4Lq0nQdLfTfPoID3?=
 =?us-ascii?Q?zHnq3L2xxAMS7FE9vZ2WeNuxWkP8mFaFUXEejnB71my42TCfv1xhChZtZeuP?=
 =?us-ascii?Q?SsZbC04CzKbxqBqjIy3ROjS2FJDN/QrooVXiR+wlifRWQCzI5Ux3V4HW41Iw?=
 =?us-ascii?Q?t95CsC+aRed4+CEJGif+c1mxxED0y0GxYBWoS0wVz8XWuE5p/1kXzwH5kSWD?=
 =?us-ascii?Q?WdP6ZV45FFvPyf64qb5o7uZfHzOCd0HzsAeEr1E9RIkE49/NVfMDWXnqXF7i?=
 =?us-ascii?Q?HIYNk9sNZh4pblF9A3DelDe4hgTH6pwH3ZqOmaWSGtKuNm4ltnurYRglF02A?=
 =?us-ascii?Q?aeJaqWZKdy2yDyY8q2I1/3PtnFqM+9H7TI/YGOnPV+5BVac3g2fryvKQNpqJ?=
 =?us-ascii?Q?Gg1TFNQ3nI3MOEuIH4P5DMJ0KFoU7+aJ3s0utj1QSQCTZdanvRfVXP8MImTS?=
 =?us-ascii?Q?jRVdjqNT2tmqi4PRDGU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5eMWANfowUEACNirnb4CUqxAn314mU9m7VZ2HbcIQ8tOx3dbWribkcETeKbR?=
 =?us-ascii?Q?8obAmkLRiQ0gzBb0nqEZyVeUNCrRFPME60Hm9EeCNvEBORmW5u4r0H+Y6HAq?=
 =?us-ascii?Q?7Dcm2NMrVFHy3G2klGmT94hPFCy6aEiEr8t889zs0TiQQSPRETToTlwmzg5x?=
 =?us-ascii?Q?w6NFhPPlM9rPJ34Z/uXU8Lp5+YXlWnlJD7VDCOwG52FikP/UskiqvuraR4Z3?=
 =?us-ascii?Q?/PiSBR5G/Cr0zV7EAhEzdTtb0J6yaWs0MSbwPPhNjp+Nbw7vMHw8Nhvclo9a?=
 =?us-ascii?Q?FLzTnONOU2md1Z8nT10eQKpx55AxO8EcW9LlzyFvNY4O26NQ/VmIjWG34Mot?=
 =?us-ascii?Q?lB6YTqY3YR7JaDczNuZp+SAGhXldM9c0Tiz4MlL8lT5bc3m44yENTaFREXHQ?=
 =?us-ascii?Q?tYUIPtIT07r7CH944TRRKuK39VHtXgl1HShwYPcHqef24hJDEppnnS1LnY6V?=
 =?us-ascii?Q?2f2TbRo8xZ/0iEn8pvHfRBZxEf8EbyV0820BAX8lcMDnYT+CKwhG6uTigM++?=
 =?us-ascii?Q?8ZVjX4k8hBYOJFaxhnAZAtHfmiRf84pMmmcOWuzvsFZiSnnbUnB4/TESwQVp?=
 =?us-ascii?Q?dXbRGWWy4j9/TKT0udYsS35vefAITjD6W8wBr7rAaaWPcDHWvJ0ZSFWC4zf8?=
 =?us-ascii?Q?bTrLuS5BrDPYnw6HoxvbIcLiwd+QlNu14W+d68yyGGDorCCK5GG1Vv0iEOyS?=
 =?us-ascii?Q?TRD8h3F+GMDO3QVMm0aiN3qGzcR830t1x4YQBeOgvgBaR4DBb564as9Tg/jA?=
 =?us-ascii?Q?3gT4POy/b7Jkg+4hC67gLgEmd02K8LKQYm4zyjE0poQlEEZuIQvbyxC1FmTq?=
 =?us-ascii?Q?NHasDGcMIM9jTP8iJYwGDrt6eYmzetrUHIpBOQn9y8AHT8jT08VCf7QMQXIM?=
 =?us-ascii?Q?/x1CyfXjxg6iYooCMdREi5vGpUU7WaE9ZRCp3Gp1FVgxMqwgkLZCrVdIM6o1?=
 =?us-ascii?Q?Q29I+OPbLBCGQ+P5RpCPKabTPztuGSV+sC5ojs5rbuZrO7hTAmbxbKzHjyGs?=
 =?us-ascii?Q?Py9lpxMLsh+VqAgIfhXEy3H6U9mFxfB+2lI4zgyVV/McT5EOKTqyyg9ASymI?=
 =?us-ascii?Q?8+XFY2En25gK9s2AtigkN9Td8MeSl0oOVMBxdrnMBjoX4tBG6RJVGGavHJBw?=
 =?us-ascii?Q?uCGHyZVIJdZaGzXmLKZSv6+JRSRcbZt+EMjmrboCJ4VqZEaFTfwBiy+8K2xd?=
 =?us-ascii?Q?5mFs3XRO4QH/B41zTTX+Z0VolAug9QKQFsroEHULKXsk4ftqL4oG7gLtnxy7?=
 =?us-ascii?Q?i0MgooS4b6qSHttVnrQWStewJrkpa/zXPg7xCMMufmDEKD4XROFP6KY6h6Ei?=
 =?us-ascii?Q?XfXCh8kF7tuMMqoBH3brlee+T1EftKKXgQickE9kOX12CoCGUyDXge4L3lBT?=
 =?us-ascii?Q?hCCW38VTQ9vDP6ZRP+E13baWQ3sRGRenirq7ZoWDZFS3aaqFz9UgLWpuSBVq?=
 =?us-ascii?Q?80Pt28hXmLX1iImMqXDJnfYLM6EOE6q89g8xkvCdOPp7vIAKruWPJI6G1x1g?=
 =?us-ascii?Q?jrsrcAOdwd6aE2xzp0qFHlOaYi63XD6lO162gSem3etXJSm2f9LPzQLBXVA/?=
 =?us-ascii?Q?92ZvAA4ltwgzkSpz7WiBbTCl3eg95/krRXWr8LLywB0OXo3Uds1T/8dRUkVh?=
 =?us-ascii?Q?dM+GBE3F1jdE3OiV3ZoHMAqheYqNAhTAIWKikkaMs2XvZo2GWcFjJlzSDFVu?=
 =?us-ascii?Q?QQM+qfIed48eIyH+P5tAv4b4YStV6yaiEM9/T4dmMaDNfu2sfqg5RGOjoE+b?=
 =?us-ascii?Q?2K7n5wzUmg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d8fa1dda-b7fb-4606-dc74-08de67d3fec4
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 12:08:54.4863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RLAn68N71sKIUKz4M1PUS/DsnKiI953v13g+EmtyuM/z29us3qBdiV2Z+C1xmy7NSlIxqpPzDCwc9VFP/0C9MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1951
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 12:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230783

Merge the separate inherit statements into a single one for
improved readability and consistency with OE style.

No functional change intended.

Change-Id: I12615c2ba986d5802eac02d768fcfa5dfa1ace5d
Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-support/libevent/libevent_2.1.12.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipe=
s-support/libevent/libevent_2.1.12.bb
index 4e32b5217e..8bb6d90d70 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
@@ -28,13 +28,11 @@ S =3D "${UNPACKDIR}/${BPN}-${PV}-stable"
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[openssl] =3D "--enable-openssl,--disable-openssl,openssl"
=20
-inherit autotools github-releases
+inherit autotools github-releases ptest multilib_header
=20
 # Needed for Debian packaging
 LEAD_SONAME =3D "libevent-2.1.so"
=20
-inherit ptest multilib_header
-
 DEPENDS =3D "zlib"
=20
 PACKAGES_DYNAMIC =3D "^${PN}-.*$"
--=20
2.43.0


