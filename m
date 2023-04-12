Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314F9C7619A
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 08:36:17 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.79])
 by mx.groups.io with SMTP id smtpd.web10.37862.1681288569849815707
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Apr 2023 01:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=pS6a+ID3;
 spf=pass (domain: vaisala.com, ip: 40.107.20.79, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjoYQoHzoKfVMRkuNb8mkGXYEWk4b+dbT5RIHHf5rftLvghBUuoN+HZWP7MrSbiE1FC79RkGUVxCZ+9mx+yspWvvfcGNeLd/z7F+xxTHRkm5YCBlCZN7qqKoZbD4pbIBLg+fdLgC89gvEoN49Kp6HfelV7JfQOJ6zaDsOCa9evE29BQMgPND+qi1OMnfJjr0tvOs3o48lb8jWJbMETlj76RPoHFfwdsM8DTnVpEsu1TP+sAINZuci+MN0Ndzo4za8eXwOPjqrB+4iuhVwaT7vXwy8EQU+o0Xfc9l20md+HgUHCN08OR8rQWVMjiRvyocG0X+VmcKotvoJmp0O6oJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+O0VGu4xyBZOaW2hEkE4owFA4qAKzJLJRHC9MD6/gu4=;
 b=gZZcBek9g1ribOgZyTDYQpb6RcpbQpBDwl+mtd/V65s2zyOB9XVfUirCHHrm6n0kB5cLOQss9mK/Oxxwmzu/t/AonVbO+Ifh/a1fkqcfzr+SPE+pg2/haSqjWkLzX+Rwpe2sNAWK0QYyDv+w1Kql0AM++sMYiwnDuEBA3IhMxrgou/cFqhza1dpMjv3sSAd5btfJilI9Y3ob+y8qPiL/7rE1O9tu2XdgqxkBYWE4DRdWqbSgWMhm0rh+f/2A/EkqrFFpP7WUWcAW7Jx+3K0THfeFkSyjfozMw0LtfylmO3LPOWQTLcnjq+XBnK3MaWOJyPMGW9k9Sv+6Oo2Vwjt0Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+O0VGu4xyBZOaW2hEkE4owFA4qAKzJLJRHC9MD6/gu4=;
 b=pS6a+ID3CEGORRnbE1sZR0a9+0G/lpmhgt86zOFUMeu+WcwSp54NX+tUxD0j1WcRwu/7eQdFgMFQrHphQCHpcGIsZT7jwH5VrbjGqj6iqRTMaEDKXXSgw+uHvJbCRxwsfW/NTJguRzhByx5l7JjuJyfTl9hpF7+sEY/1rTlLSYzfhk8FnOP9tJ2vKnnIfXh0eT3pY+GaZdceRiuYCIIzmuCWC3kp4cYI20LDtaggR2fspZMdZE91gLkWK9C0mFyTZnl5tHfmwrJipWDXup2WUxoWZeBNPP43UwDhTSpKQRc6iunuFz6sWKruib7457ZfO0WGDgsK72342minU5+MGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB8111.eurprd06.prod.outlook.com (2603:10a6:102:1ad::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 08:36:06 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::9b07:4b2e:9949:63cd]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::9b07:4b2e:9949:63cd%2]) with mapi id 15.20.6298.030; Wed, 12 Apr 2023
 08:36:06 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Mark Hatle <mark.hatle@kernel.crashing.org>,
	Mark Hatle <mark.hatle@amd.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] openssl: Move microblaze to linux-latomic config
Date: Wed, 12 Apr 2023 08:35:30 +0000
Message-ID: <20230412083530.2452114-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0078.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::26) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e3113e8-6a11-468c-9d74-08db3b30f554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	diUuvonbYFwY+glvJEK+aySs47hGA20F+FU7SOAku9wJbw4pHjy3TXURXcHzQLAw2V55AZXCK2WOU/6cEfTueNERXIEuLbZe0wdXO9UopCUIEQLYv4rWxv6kjz9w1pO8pdhKwkLvV1oqfTnBE0PJ1gRR+VehRV18vdA6FV/nwkrHy1PNzct07+kvMAWRBOgDy8TRnBHUy7yQe0JgWMvTEKaU4ZgjmRgEffXJqP15mpA0iDj7Zeffg8z38Nu22RyBJDngry71BlppSzcQp0fPVjfi9W02nJtolZCCWkQJj0Jbs21D32wQ2mTjL0NldhC0ICOTw20ZyPbVYLFs7dG81Vad8OAPjLY8I1W2DmQ6R+aSrLgukr9yNMuTq7BaC074nNIHBKTjVbpDo7kY/nZOsazeihNtLPRcHWlbKDBgUCwZExspwG8L8dhcXOLbcD24yhJ6ajPyaRTzASOczhfXoZd/IcNRhw/WKkYaiyBnV59da3PZfyAqihGwXo2bR5KI/KGL4+asD0Uc7J9eRaidq0ggvy/ZwMYL+fN+C+EmUkXP3Z4q/EjtmcflOuYALxo017ruYWhkLuVa6MbkLpbj7JYD3+zTQdkuXXlVJtLqNLWff0NY1n+3PX4f/j13Cyar
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(451199021)(26005)(1076003)(66476007)(66556008)(4326008)(66946007)(6512007)(6506007)(36756003)(9686003)(2906002)(83380400001)(6666004)(6486002)(52116002)(2616005)(186003)(6916009)(54906003)(86362001)(5660300002)(8676002)(8936002)(38100700002)(38350700002)(478600001)(41300700001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VU6m3VZ4u8oJXXz0GKt1JGYWq/Jfn8CGtqltwNLkvpwgzjWuAmbT62iSZ97R?=
 =?us-ascii?Q?ZMLh8/vcI6an1eR78gX+h/4mzqI0mSVrMmVeRNVys0E3GNVJxL+s30yPswfc?=
 =?us-ascii?Q?Y1ARWvuhMS1e6jzZrhTPSxTPbyTAObTZ68Z9jVcz5L2gHSaoqsjaZQdXRuOP?=
 =?us-ascii?Q?Y9l8NpaKKzKwf5W52cxq7p4zFg+/E2djZ/9u+atr548W8HmsngQR8raxDR40?=
 =?us-ascii?Q?lkv8y51GLvn0fD24AlwqhgnDVdlynYHNWnUUj1EaAavK2ckSVOudxHKlAn4R?=
 =?us-ascii?Q?pIgR5PUuMQ5XWgzN0N2EEhNAnNirpyU1GJzryPMj0nJH7CE9UDv+5eWlzqnv?=
 =?us-ascii?Q?pbtLdSlxNAADvLtau33YF4g306c5VZMydePVmYceHDVQxEHmUYUhRfhVNzZl?=
 =?us-ascii?Q?MTM00ApC7FfTwlcjcsydFcdp5qgsUFyRUandikAv11ydWp1lFpFBPsvgdpwI?=
 =?us-ascii?Q?rvE7s3nq0d/Myu4Q7XtOMZeR+kVhXtQcFt1E4gMTtnR4scPPWVOTXka4N+FB?=
 =?us-ascii?Q?xPkFF8Vv9a1dIt5u/wDkZa8gDLcyJjupZdmVZWZN8xkUZv4tvvHy8jW7Mpkj?=
 =?us-ascii?Q?cTB9ysz5Z8xcRWSF8Zfh7Fy7yYv6cAbHgt2pUKkxRQ9wkv/B2WT7kadecq0w?=
 =?us-ascii?Q?YWb0bhKknVnXIyazLhD+5ZzUU3z4XqzWj3NEXLMMysChsOPFRWVD/3zbETRt?=
 =?us-ascii?Q?YAmvcxHuU094Okiyaw4Z/oYLUxg3bthx3C/0dn8abut8P40ZBaKe9pSLNsdp?=
 =?us-ascii?Q?RfIXxp/kitEvDmg6hmc8tKlJu2CSacfW9MXIr+lbT2lF+ElFSKyRly202Z+6?=
 =?us-ascii?Q?rER2TkQNK3BxE6oW9oQCTYtTr+UyS9vK93qhyT8DR5QZFDQ6T1opDTcTsHb2?=
 =?us-ascii?Q?TnKk+lt44d4MicoU2uuRh/f3lcw+Gl9Xn7VvdOLUtu7K7DrowEgN4XtqLIrm?=
 =?us-ascii?Q?ZDb7BkeKl86I1hT1gOTv1MQ830fhIPbUTV1PiyTjmCx3XP9cRS8vCwZ+GIXo?=
 =?us-ascii?Q?RqGbovwhrxTshRdnUpXgUtZ3L1Voc+ZHFnvrkQofvm+V/hdLx/7cPAt/catf?=
 =?us-ascii?Q?OBxD+uFIH1MP+Prpa29uch+SSYQ4Nank+UaDhz/O8koYyLUduxec+aBEueni?=
 =?us-ascii?Q?SkTlHn1u1EU7dq+0u1vdfCecTg2zYunTXSDb8jRQR8BZS1GAiq1d6b1iA7bq?=
 =?us-ascii?Q?ZiJUeehscv+y/pqt+FCQ4V3sOauGEvbxCr96iQ9WPKIf9sJJ2vYqSuvpiNly?=
 =?us-ascii?Q?X3+oNd0BgSiTGtTSGwsBLz+0W9BwsWyPKVmMGMX0EzsDDFLQrd503zGdFSQd?=
 =?us-ascii?Q?TKWnUfpePlg4YI1vJDBtZWX/ZT5pCa042BXWDM2b0PHmyg0ttC0P2RNxhgjF?=
 =?us-ascii?Q?OrrPDOrTUBqk9s0hZ65jrLyuIOhci4a2g+53dRt9ZOyy+gL1+kN8i6Hl+Zcu?=
 =?us-ascii?Q?d49ut5c37ugDHCmZs/uwTv+RvufKH0v2YG/2fGj5BJhftvPvim3IALRmLI/2?=
 =?us-ascii?Q?BTAWWB2p5ks+hi/pmCII+n+rXYVwjPWLJcHSFctXRLoQ7ur2WXtzVIFUEG6G?=
 =?us-ascii?Q?vXwBfx8FVh7Hu4owvrnMXQ1rzUDirESBeu5PFsEmGlA3gJNA+pJNCegJ3jJF?=
 =?us-ascii?Q?tw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3113e8-6a11-468c-9d74-08db3b30f554
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 08:36:06.5023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SttxYBohKAZ3AqRVrj+sJkUFH66Bgquo3OhDPoSaRku9B98Vbpgx9x6H7pvaR0kAEhwxkzW/6Y6//P06DWc6Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 08:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179943

From: Mark Hatle <mark.hatle@kernel.crashing.org>

When building with the previous a number of atomic functions come back as
undefined.  Switching to linux-latomic fixes this.

(From OE-Core rev: 88d5bf78ffb1d120df48139b1ed3c2e3fa8310d0)

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssl/openssl_3.0.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.8.bb b/meta/reci=
pes-connectivity/openssl/openssl_3.0.8.bb
index e1f30d7a47..82f3e18dd7 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
@@ -80,7 +80,7 @@ do_configure () {
 	esac
 	target=3D"$os-${HOST_ARCH}"
 	case $target in
-	linux-arc)
+	linux-arc | linux-microblaze*)
 		target=3Dlinux-latomic
 		;;
 	linux-arm*)
@@ -108,7 +108,7 @@ do_configure () {
 	linux-*-mips64 | linux-mips64 | linux-*-mips64el | linux-mips64el)
 		target=3Dlinux64-mips64
 		;;
-	linux-microblaze* | linux-nios2* | linux-sh3 | linux-sh4 | linux-arc*)
+	linux-nios2* | linux-sh3 | linux-sh4 | linux-arc*)
 		target=3Dlinux-generic32
 		;;
 	linux-powerpc)
--=20
2.39.2


