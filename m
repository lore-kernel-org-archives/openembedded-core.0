Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2EDC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 13:33:18 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.53])
 by mx.groups.io with SMTP id smtpd.web10.6552.1700141590038717834
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 05:33:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=AJDsNX5/;
 spf=pass (domain: weidmueller.com, ip: 40.107.105.53, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsAkkKysSKeVFMFa2DDELiE7Xmx9nwlHQUN6Y0lOwphMT2vkDlHzQfh/QmFxaeuis+aIrpgQOzOj/yEt4WOTSe7hlulM9nfPoYnzRacZjqxpZi2AuWE4zGRjKVf05/I2jeXxDnJ7HXz21Fh5MmoGYmFMx1Xp5AGhLkEhYtk5EBXE5W9Ohxve772OXmWYcrXePGtelDjlrxrWjDNwRH+70Jb+Usys/Fr0moi6udOYc6RFS6H0+gDevTaQqBsors7U1cEDJShggZAYdNdeB3T5kfTH3hqe8ge/2fCD9aSrYFKosmeqQhIUmD+CV5DPg9msy6Mi+sh1FzduRRLspn/HQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5mgdZEocV39JYgq4GRnuERjwqMVt9ic4WXHecq0dso=;
 b=PDxFna5v+e2zbxLTBlGSTR54+hq+SLGme6aZzE2JFCSSfYr71Af9mHqI/mde6TWARU6Jog1xy7tqGfk54Hh8fNfbyKTN9dTmlPWs7dehOZsXWj6y9lVbfUPEWr3P2sxtO7ZQIsXPUisFKHBYTW4GwlZfvOLvDgjKaKolGpmJVHws0hrg80a5eunwxdEzmAvgM3jCGbzm7mMoDg5zXrPdGJG9kHblHbfzSdjB6aAfvGBKa6jUMeU09912Bt/pNuxFPhUWaFd2P1O57mMd1HOW+XQl5M1cpkRiQU3+uBycZs9DDT1kSURbQzDUSCD/m0CikZ6Kgl25XvYav/zPwgm7Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5mgdZEocV39JYgq4GRnuERjwqMVt9ic4WXHecq0dso=;
 b=AJDsNX5/7oP3PvvGM94mLiMLBvhQZhiMD5wlHB0y/MMZRZz8hATMbo8OQ5xgeQqcGAdNgx2x8IUvMWO81brf9PQeMH/S0CKhkuBIshdQbQ2wNYoEAhJA12bYqxeJieASdvdRwhhTx4yzPuaYvMzTCXc92d6l4fXbvfmS43ebutw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by DB9PR08MB7724.eurprd08.prod.outlook.com (2603:10a6:10:393::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Thu, 16 Nov
 2023 13:33:06 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.7002.018; Thu, 16 Nov 2023
 13:33:06 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [meta-oe][PATCH] classes: go-mod: do not pack go mod cache
Date: Thu, 16 Nov 2023 14:33:00 +0100
Message-ID: <20231116133300.1503470-1-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::16) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|DB9PR08MB7724:EE_
X-MS-Office365-Filtering-Correlation-Id: c97933f5-b0cc-4768-92e5-08dbe6a890ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u4+oHpcRdOd7DyAV1MoHUjXUbrzaja6TdFwf2/mjGynnFBlMhRXLqMVAXoY8KU5JyVCoPSwC9MZvEGM+bWl6R86S1YcRpVV7PEBjqVYtDhi/mBlzN101Cd8eQt/wlENhpR1afM4BwvMvXkfh8e99WIKxZOQIVCpX5KiuoE9/Osbbrm5E+CwqyIqTM4OZwMEo2xxet3TGBuZQaBUxhmbSOxLRNPa5SM17Fgh0oH2wIsJ/YchCpNw6z7DTQFyT2NfyHIefLuij3c0BdcmeQW0VEBhEzlGSzTcW7fq5J20Gwnw/4aAG/0qAJZeHpMnSPQShdReiD1or4sSml1+6f7ptTMNb/iGJvjlz4KbbkMlZ/YRouURq3iqHhkaFu5ZbDeygwFhiNSCZDBAJWrJqMZw/Se0aZmC46LHB+TVriNRHeZdrGQerDlmFdDeBKcBN29+N+jm8ohydcVPPwet0Yxo7UdgMjlMvEeXA25we5nDygdQzf2BtZIuz7b9NkVRTpssC2zlQ0wevH8bw7xha4LXnIT+UGzdZYs2aqAqPDeQfON4CYIzrjveBujNQRxkYNR+PTfKirMDDocmkZL8+g762bgX9NDuKFKakIK5zJObdzgp7LmOrWn5CKCT18qabWh96
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(39860400002)(366004)(376002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(6506007)(52116002)(6666004)(2906002)(2616005)(36756003)(1076003)(107886003)(26005)(9686003)(6512007)(41300700001)(5660300002)(4326008)(38100700002)(8936002)(8676002)(66946007)(66556008)(6916009)(66476007)(38350700005)(86362001)(54906003)(316002)(478600001)(6486002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wZUu+2U0FcfekGfb7GYQUgvK0UCC/x1vuTqcmT6CHf5fUYn4J2TawUZeobpV?=
 =?us-ascii?Q?cAGdx+xOiBvninWt0Sjv9Ycx3JDXC/z7/kPcqKyXMSjG3qIk9oJ7s622Ktlx?=
 =?us-ascii?Q?n9oEUDYTRJeuwqPLqwQrfh4rT3EaloKAoyb3YdFv36SSqp2IbCHgRNQJ+94b?=
 =?us-ascii?Q?pqY53I9AOKKYl5zqznsm+o3UDFYe2brYqjOzZWPURr8O/UspKnSrRAWOXoC2?=
 =?us-ascii?Q?1bUEdzis99d5bVdVdENZ3woUQyesXuRbogpF37bMY1SaJZjronMN8FpBkuwe?=
 =?us-ascii?Q?tX2JdYTMXJ9j7AwjTp/HatlScMs8ryZtnaTd5hLXGEC3UckmcjZYNtiyKtlr?=
 =?us-ascii?Q?IggMwNiWwlMJxpocs4vyUTdehBEHlxYg3BpkmGyoZdr+Azn87GSnagdCmP8w?=
 =?us-ascii?Q?NFAK8AcFUgVtWv1y5vpvSLFoX/bWTXfJMAFTm1Xz85sBMKkQuZDanY1DeWLd?=
 =?us-ascii?Q?Texmu2apz2x0uQOaJMw0vZHtN6WN/tfpxw4IGuNgLDe83Y2RJJzUo8RCLYl8?=
 =?us-ascii?Q?/sefv4oo4UdzLGFCLxul9/CQVHt5YIMyHMXt2QGBQT09YagBIU+7N3LDqF4b?=
 =?us-ascii?Q?TwutRyGANQS45IhITaPH49oZWXJ9jmDXwnPwzew/M//qf88vWXyRW+cGPh5x?=
 =?us-ascii?Q?zYCcC7mt7tDQhE5ZdOkiKIsL+WtllPnY3co214sxBtguE2/af5aqqpC3oQzP?=
 =?us-ascii?Q?FRVmhnkLQ8aV0F76rvSLZ3krb2iBz0wqm8ENxPF2Dfug/LqsS5KkYSKsoyS6?=
 =?us-ascii?Q?6J7M0c8+X3RQF0AXk8jU0Tfq+C+WuHhqYFUBEEIobGAOtv2MAMiwJY181JFr?=
 =?us-ascii?Q?C51zmynbvsy66M5Vgx2e5ZiZL2M2HDE0fkG9SRmskvqa0Sxt8wId6t+lsmKb?=
 =?us-ascii?Q?l8kIsKP2stpdsYbacYUQEEerri8m0KUv2em8zIx/RKxWB7bbgocA6ppIbP+Q?=
 =?us-ascii?Q?1WYPXBfD73u8LJgk+LUtJ02yl+VcdyiBdPoAFyGD6rXbNtj7POXHDrO4zV49?=
 =?us-ascii?Q?U+hN+vqG4IKesuSumM+lCJ5jVFcMpyZpkcQlqOUoMCg7jdcNwL2eowweE6n+?=
 =?us-ascii?Q?iZfS4HWmQ+fBaTkW3QtfVuOEPNiJI7nh2GYAK+T/osnbcirXP4X4F33EG6zR?=
 =?us-ascii?Q?WRkf/y1y/iIPh68FPgaRPJBOMPr6xaXRmNBdyIkOTey0rtnkxmGB9I2ywS72?=
 =?us-ascii?Q?tRerBMkdBGAwKmaJJGbyIi97g0c/sxiXtFqh7xfjerIySa/WWEcXGqDYfSBe?=
 =?us-ascii?Q?BTPN0IDpmxqRgxSoj+f2ZdqxjfE7trK4EDzPZuKUqprE0UU2wf3s7Ae0dEya?=
 =?us-ascii?Q?T4FDD7qpXjiwSj3je7eYwPeBOR5Ep0NenfbjY7xhGk1U9gslsr9WEiTd/YQA?=
 =?us-ascii?Q?yB2WUVFl+K/TZUaCIIJ6JAVVW8ETkwiciAITi9CkTRDA100/EeQ5pxB5h2wH?=
 =?us-ascii?Q?WY/skV70jr0ru99MToWflgYXOASwo/ARrmZdTZHjqPSzfCO/sAvc9unQkfOV?=
 =?us-ascii?Q?k0Lu4+yIeuWiTnWRsAGKtFeDfE7u5nrBmmsDfl9U7cS3zDSGgrd1dULh1RoR?=
 =?us-ascii?Q?5gKUeHEH/UiKgrARW4RpD1N04a93i6OErM0+OiIaUcgyxMlFPrk8WujYBW1A?=
 =?us-ascii?Q?dQ=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c97933f5-b0cc-4768-92e5-08dbe6a890ae
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 13:33:06.0834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyTYgspyFdAasZozYNDmrHHoymvbSVhpD0lAbV4+uaqjo4OXAv+qEmP+m96SDF/KD3R0vCgNOLLVQBT4X38YOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7724
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 13:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190795

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Clean go module cache from builddir to prevent it of beeing packed.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 meta/classes-recipe/go-mod.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-mo=
d.bbclass
index 61571596bc..ca3a690d05 100644
--- a/meta/classes-recipe/go-mod.bbclass
+++ b/meta/classes-recipe/go-mod.bbclass
@@ -24,3 +24,7 @@ inherit go
=20
 GO_WORKDIR ?=3D "${GO_IMPORT}"
 do_compile[dirs] +=3D "${B}/src/${GO_WORKDIR}"
+
+export GOMODCACHE =3D "${B}/.mod"
+
+do_compile[cleandirs] +=3D "${B}/.mod"
--=20
2.30.2


