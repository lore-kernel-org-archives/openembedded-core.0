Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33070CA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:16:16 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5975.1790925367210363324
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=S/WMgzf2;
 spf=pass (domain: est.tech, ip: 52.101.65.19, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtEuB3C3zGUQbrnFXHLsasz9IQOwJ5E4++u/vRelvxn1s8ImnW5zjjlTIjshHGYLf9dUv77v/9aerRDe6ILfcePMBAIAAjDqhKFkiqikSdPGpml203D0/gJPm+xTKABFcrMi7FbOXwuZq3r013vdnhUpVz0qLMKBmLTlXTG3Zv2D+PzPmW4gVK3qCJhKneyn4lDYqNuedNs98HdilSTpcyiNTK+1mv5QjHKhXb0mBnmP/DWKfChOlHYlysgULJt++tRqF9TYMQv4W1BUqJjasJ7fS+ERPi85rrixmyoIQ8YUY4pIx2JKG9XIDx9MzD96TI08IG5BPPSI0kZQwrF/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U226zUDZQ22MbgMbZoZ0z3leojG1FwpuPHGtZJDpi7I=;
 b=yxruzHatyk8SMk5A2cmqBSGbLbbdG+w1GLDVBbkgjfEBzEahKLPu9/nnpRh/7EylIMUMkfh3zzuUdCY5r19iEcIbeoDCeJz/sz6US0G0ItxGp0sQBH645sjjiP658KTH0TcT5fB6+ELRN8UtxzcysTLlUWsAQyciroBZemL2QccOgNI6WRIK3MDkLIV6qMrQUvDNnBrWpncICdQADfAmQi154CXL2KJmF59g17/0IVdGVn8dB+P4HbknUJgxdDjv+YgUi4xt9msplvWUDq29oMV+LUQxDrYdxC1drcW9h58j91GzarnAtLmrUCSijpuS03rf8YX31HdAnufjkgwhgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U226zUDZQ22MbgMbZoZ0z3leojG1FwpuPHGtZJDpi7I=;
 b=S/WMgzf2DpTEpfQe9or4tsbwZ1HHLYcbZ+XAcXBKnq7EeIBKkWF9frVHXsXfoonirYDHBzCNbiFUZb3hNAkSWPrGpU+w3CwLZ1hpPn+jSYctX/rxc8FAKFVKSQZw/RA/wR7T8fpYUQgMCPxi75+xnwVeHF9yN3PAoi60MQ1DYWoPAGdwkGqBiw1Mq2FFVlhpfTvaxIZQG6J/4RXrZ9ogK57L3hZdbRkSgP/mXqMZQU188XCqZg5rfBg+PHYFpTvqd0+7386cO9kTZpCBff/Zu1CVgGaKNKoXIprhYMmnsaTKNsGsVr24/kJwNeTr55s1SUQK6ot87Wqh8kDa6P8Y/g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU7PPFF852A1B5A.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::aee) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 07:16:04 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 07:16:02 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] libjitterentropy: Fix HOMEPAGE
Date: Fri,  2 Oct 2026 09:15:55 +0200
Message-ID: <20261002071557.74249-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261002071557.74249-1-jaipaul.cheernam@est.tech>
References: <20261002071557.74249-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0161.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::22) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU7PPFF852A1B5A:EE_
X-MS-Office365-Filtering-Correlation-Id: fafa07be-7afb-4985-da73-08df20550417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	4X01VFCBhBoHsHzyik/T2D5a53h1lFc0CqeQG8uyH91XajKlo6ESReXamw5zKSUdy49BeLuPIjlcpUAvknLv//O3oZKI8zsuGsD51fXid2XZMK4PtFoKfgmTgVieSvpsiQ+loZoxqz94Z8kJ+3zGk0aLrCDVu9ZZLGyu3ehETyuf570Ui8ewHSauLpUmwykxLxynMasZbiaosCvv//S+9rAGzNttbbT1mGX7vXjhZFrA8XETUZ6Pco4N1DlFizZ2AJtYShHUPP0W9rkGfj2/rom9HmpPo0Y9pF6i1bLCgp1dOas4lM4rMANhoJ9Z22Nj8ynMMfeasL6yztqp6fl2eVGg0qeib/hedLl8kyiMsj/60CnblB1QAD/qxMO1dUh9DvdA5OAmpqtZ7As4C0xzC9Bnd5XiZBak+2AUTTyZyq/BbNut0H2bRz0kEuagsn66QCdEf+BoCYsNNkvkDw8P/vlrocnT2sLpWF8/qL7Q7HE9nesA9liU4P6Xd3kudZttoPXFIaLTiUE3ahTBpYAmMt9fLD2ECoaG7C9Lpyy0OBGXAOjLKwcdiEB/iMy93HeS9z2yRcSYzN/FR/RmU1Vwqj7wpfWrEWEBml7T8za8CcTXsNyINtqGI2m0CA/aSJAb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YTvkHcRz6QU3UfPYsdlMbsmiiyBSwuX3agDw55Avohe5SInvP1RNE6ESKyX4?=
 =?us-ascii?Q?ifLGr3OrLZD9eIG8JDSdhPEARTi4o/Sjsltk/wV8FX42yOOEWg7xMtAefBku?=
 =?us-ascii?Q?BcmBYUvXt103XHahE9Yp0hRFgFhiaPzaYxypgeFm5k9NWRAEh9z1rp/Cr56D?=
 =?us-ascii?Q?RAQCs5ePF/krmUF7W7gLDGtnMGoNW5r+6Z7UENhlB/72VjiPr0b7IV3tc0cd?=
 =?us-ascii?Q?kUHBSBoUOKUkR9NytCF20H7Xic6MLygleh6cNrHP9apAShKf034JUg9V66fv?=
 =?us-ascii?Q?8DNY9wM8EtMrU5T8Kekwj+ZzhDAvkgV+8Rp9HzLJMy4DcQ6PIX2T+jt6I1ID?=
 =?us-ascii?Q?g+1gaHfN4b6A6pWBadT5qkCTkY488YJNBl89Isdz0YcvdEkV5LPfhzzIBq5j?=
 =?us-ascii?Q?KECZjR6BR9P3SdMzzyFt0SHsvvRk/n9SvC6rj43pSDtGU8XExWUBGZIZMPbV?=
 =?us-ascii?Q?StUsv0ITkhNWROdx6+/E2bDgahKJEeziSneSdUi/UVqfBUe27/9NRKH7kk0+?=
 =?us-ascii?Q?a+WaVgT/awjpjlmVYPPKypLuGg2FPKUWmOdVW3QeO6DTs1LPXq1XMSl/OW2i?=
 =?us-ascii?Q?9Bb2XeMK7XbTVYwhPL6L0mMLS2OuPN1n1oOPTIS8SJyHcSruhqC8fYbEdZ1n?=
 =?us-ascii?Q?Cwr7GLSILYdc105LsmB9kU0DdWn7OWHytqQ3kKdqzt/rqE/9LMWHCjjlbQBJ?=
 =?us-ascii?Q?w8Gmpy5H8dTe1nvBwgL3G/8Ch7dHrK70suSMIciHEc702uA6+TLXc5eTuNFx?=
 =?us-ascii?Q?yhbSxRwz8e4HFBDJdSSKYITVwW77eLjFyBuyhrHJrLsv1G1zK0SU+5XTlaak?=
 =?us-ascii?Q?mXilU3OGVypl28Qo/u4aWcuuY2bWL53aH0XOBnDiBOLksmIJwEyygYXgZ0Nn?=
 =?us-ascii?Q?WTFdEYVvUb2hp6ukemP784+dE9ZxhbC23tLhcasO1MlHXdcjoQtd0dyXdF+v?=
 =?us-ascii?Q?lAOaO34swmXbM0pRQc6nfUINEgOcKxdnoytiClvVUc3WMQOhniGU9LE1Pjch?=
 =?us-ascii?Q?5o92i3eY1tC2qR4XbxiVPPKqjse7LdkxpaFTvRpoHHHuszEvZQwVxjIg5lKj?=
 =?us-ascii?Q?t2P87tuFZ0/YPj69ji4zuHIPY0pCYFN1tsqsJKfn6waFeUXW0HqkGotY7e2P?=
 =?us-ascii?Q?n0USfrZ3OoADuw/so9cFd19wmk+Ij6sACNOfPvA26ZFpANFcnjTHllNYB7iH?=
 =?us-ascii?Q?4Qd0kNiChuRFklPYhvJ/dloOZfSxuu/ins1XVm5JgIdLJ8VWDobFYJ8obJ6f?=
 =?us-ascii?Q?QJqDA1XMOEg4Z1S0F80J5Ixz2gu1ptypQV+1dWx8OnXpPre9i/i5GqvQiI/0?=
 =?us-ascii?Q?Lr/EI4mu0ZeD+XEpu/xqEgTlroqVJgZ8865TDqUfONMr0eBpjHqH6op8kD7Q?=
 =?us-ascii?Q?pRhhTdu511yJb/bgym8vVvMcdKu2wzJeI6r7p2odNIXxq5LoC8f3G/3spEHL?=
 =?us-ascii?Q?csXqHvooxwlLMZJ4YXOhNQNrw3Kbo2of+tDlgIxxGw45AAyAwLC9IhIXAcFe?=
 =?us-ascii?Q?NY6DSSJ7Pzpe6KI6pkiCBtMJ68m/QJmyJThJRZGBKULWF5yhX5LfH3EHDIEO?=
 =?us-ascii?Q?PRNSYSl950BpBXJAeCZyOzWZjHQKhjVyx/Xfr9REPKWdz+MthV6BhE+f1wdQ?=
 =?us-ascii?Q?/yQBt0lIa92otX7Ywa9VaBlj+CZQWD6Jd5MwV80RmTCbkGdKYQE8AMEV9Oth?=
 =?us-ascii?Q?9gjEnIX4/5Agiq0/OciCmHqKBxxMLxSt/Lqa9ZrcpQDEJSaqTBAlJxub9Mgx?=
 =?us-ascii?Q?1T1iOm/Lyg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fafa07be-7afb-4985-da73-08df20550417
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 07:16:02.3832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2exFoCIeHfPwrHiRC0C8au+qraoGUC9OFmQSU6UZx9vV7IZWJQxq5Y4DV+7rX6RKhzKhlOYeamijVVR4Yz01ZDVp1n0hanrCInVIN8VYavc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPFF852A1B5A
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247070

 - Fix URL for HOMEPAGE

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.b=
b b/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb
index ed3d850e81a..fc74b1a3611 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.7.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "The Jitter RNG provides a noise source usi=
ng the CPU execution ti
 It does not depend on any system resource other than a high-resolution tim=
e \
 stamp. It is a small-scale, yet fast entropy source that is viable in almo=
st \
 all environments and on a lot of CPU architectures."
-HOMEPAGE =3D "http://www.chronox.de/jent.html"
+HOMEPAGE =3D "https://www.chronox.de/jent"
 LICENSE =3D "BSD-3-Clause OR GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfcaa2e2fa77c4ea22e45bf79e9a4109=
3 \
                     file://LICENSE.gplv2;md5=3Deb723b61539feef013de476e68b=
5c50a \

