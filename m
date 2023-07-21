Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41F1EB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 12:07:39 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.42])
 by mx.groups.io with SMTP id smtpd.web10.5650.1689941259106516710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 05:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=tZvezlMd;
 spf=pass (domain: welotec.com, ip: 40.107.20.42, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IirrG0gwkp89MpoGJx8Oo6jF0doMX+cmQD++CKpgjshT/yWTn9pdWmYM8yzW7mOuaYHoyEmBMyT4hustCmTeJmXhf0VEuWOJ3FjN80uY1MdvjKdZVWuROJgAdDxCak0sgK9Hbg/NhU/ftJ+oNci2OwaX8E9exM3jr3NKxISSz9mL603diPeRA6/SvcgYok2r9v0wgL+Qak3/lkHy8L6GD6ypkuqOB8yvJTanv+rXgfyfXDAUL4fwX128iIcZrYFNuOWLNC/WTPhsByfsX8Y8K3qnSkeHuyPV4DWmjqss9PLtqEaE4bl5obkbrVHuoK1B/tqH3D8PI8Q2YymUHKk8tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXxu/2pjjRRNs521006T8xJQ4bJFYbgWLBuU2rs5ewg=;
 b=Xvy9sbhz5kh8LMivx+NWRAdcDYgC/YCs7R8SF8x3N/eTZTUnIujs/XdDoGJ6X1S0Al9ioGRvfTTE2lj7inZssM8V0wgKH+DmvfD0OM6HLsStXAvVARLxXjrgFKSnKnvlr1pRfFi+tonGuYJJbo5VPbnnF4mLrtLpNs/KeqVkAajIGyzD2FvATiSNTiB67m/PvKK69cMColSp8IVxXx7HL/yrKVKkxKVfRTGw0b7iRmjxedieJ9px3uzSowiJpXraoU4iKZonICa2MmckVY1y47ILXfwdQ4h+1Pw786izJViU4zm2kWC1p6VgkiN9ufc7e0an482bu18rpTOL908owA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXxu/2pjjRRNs521006T8xJQ4bJFYbgWLBuU2rs5ewg=;
 b=tZvezlMd0zZobDZshAr4guBJmSz/oYt/wsyTg29TCYB6+V/5bp9hm1xH/7iIRLKcjHg0ZKis+x6D/k+Qrw30RKwEGqRr/8tn1ZWTkt5HiqkPQA8e0zZHeF9Fn/dhEUoTJmFWsjWGvd94cUWV5nrW0TXLZ1iKwRwU0eqgV7Pv8ds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 12:07:35 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 12:07:35 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbclass: add support for ACLs and xattr
Date: Fri, 21 Jul 2023 14:07:19 +0200
Message-ID: <20230721120723.4006443-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DB9PR04MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a20686f-c19e-4cf3-86fb-08db89e311b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CEKwVjn1GV03uXdiYrLnVpuTbo3EEqLA56lyXNpE/GLLo0RwIu1bRn2cUHE0K5kvRDdyn1kXKxnOVVpFQfb3JU/zW1fo4XONBByw3WPACuPXgpTMLhGGhBrtyCIT+9XH49eLiYnTjah66HXYCW8f+QnFsL9hw+rXrWEvY05zs1C/hhApd7fHm7BiSj7hAJvjeCAEB7J2rL3itqXMYY8e1/BUeEE5WPfw2VG6tKSUZdOAxUxcTborYf+rCCuzKkD4N47RvwCIue6RrueSZeqqNUc7Z1tjG1SZDqvEgfUKnw+CRCkG7iuZ6tF7D2HYLnfUblOBqX6f7eLiE0sLK93fyCw3zOefAPZ0tATeL0rsFN1tXsyhbCyG+IVDhkEDic5W1RZ53gctqJysr7oNm185gRixYeC84scUx4bIgsO2b4/FXEYvm4obZ/6Ha6G2I2HNKmXvaopTxHKkvSQaehOUoRXn0y8FkOVUgJMjWPAfi+/docz6rlCdehe/gpFOqqyt+zTjWvvRnnwopcbngVfqzI9uerhXeMdYVZd5AvZBfdak6QFRqLCYE3oULZIj7mGHm50tDStZTWfLkLpu2LjeXYMeRDRZ06MlqVCLz7t5sIM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(376002)(39840400004)(451199021)(41300700001)(1076003)(6506007)(26005)(186003)(107886003)(478600001)(8676002)(6916009)(66556008)(316002)(66946007)(66476007)(4326008)(8936002)(5660300002)(6486002)(966005)(6666004)(6512007)(52116002)(2616005)(66574015)(2906002)(83380400001)(38350700002)(38100700002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PDm9tsUsBEhEn6WW15vrwS4anuLUuVOVF5vLOOkdwSEki15nO+eJ5b4CeRIJ?=
 =?us-ascii?Q?vtHSYuKozThTUJKIFntLBRrg7zvUBTdtA2d6imaLPNXktL9J34+3v8LEDf1N?=
 =?us-ascii?Q?LMhitJ8ccF3QVMCEfjs5lR/rwE/c2s/t7C47eojzrXv8abXiHxqUGy42SR8Y?=
 =?us-ascii?Q?s/GKKWOU2ePnZtZemgUbDl0beRW3MCxT4x7FSnmueTwBe9fogOf5zHWX9Q0e?=
 =?us-ascii?Q?Q7jnUYVM6wNnl+U9T7jCTxAJUE+NYEvxhPJNCrFKse/5F9TnKAMJf23a/h46?=
 =?us-ascii?Q?d2RcWWEnfWkwiMhY7861xmIUIa+VHoEJ3KzvIT2xr/7f4eA6cATbO0VBfst1?=
 =?us-ascii?Q?SL+CpT+P2iu0cw/t/jYiTkigNp/4tFogzssg14en8+oCU9mIycZCRGNpo5u+?=
 =?us-ascii?Q?S14Rb8lTiOXfwOyblyJSmiWylCnU6VgNKIemsM4caIhR8O7TqpMy53V53cbZ?=
 =?us-ascii?Q?jLOtEzQFT0k23GOAF11SOsychkbdm1OxLhyyNfEM0L9ZScJzhNPvoDcFfunw?=
 =?us-ascii?Q?LjlIAxk+t6spbs5IbHOAesZDRmSBaz36Pa1M4LAyg2LNiLBJFpWNp4FAE+/q?=
 =?us-ascii?Q?nInpPHo//Mtvt8PE/zBiHnskZhBp5q/H7c0yl3aphki+NBCbwsbZhTQsmZEG?=
 =?us-ascii?Q?7wyNnbb7AqvxaA1e53HAZbpKw8KgQ8R0qbL0IIXzPyWYFo2SCPt3TYRWf4nW?=
 =?us-ascii?Q?A7Y8Mr0iHCg91Q4sMkeXSU8OteBgXMXmH3ezt7k06IJGhBMDpIocevoFF8F5?=
 =?us-ascii?Q?YxMr/cc2YavHShJvUEdmeDKzJLE9/MQudr+YSEyoaXbPsfuPO+02lxZjiyfA?=
 =?us-ascii?Q?6Th0gLxXRsWQ0ZWXK6J4wRuLY4U1+QAC7Jn9DXHdHixturRABgm4u0Z0Tf99?=
 =?us-ascii?Q?ZOIrt1NV25YIeoq+xAFDrECUPpVhlu7jheWMPDJ+b8g3k0/SvLvCk5kxqU2o?=
 =?us-ascii?Q?UNBTzGL3FXwVNYfwxZfnxV//BOZhDV9drw5K1p916znQXTlmfXsdEryJfAwm?=
 =?us-ascii?Q?VdNurspzwk1HUaCCMlpOq4ii6nvduxod1nnRsFpTbjCX1PeuhOzRlCwEQ6tz?=
 =?us-ascii?Q?dYo7rU1MRGHKmNF0v9DVB46DS2J8eY+8b5bByXSLGkLqi8+5jc37YowZ2iDO?=
 =?us-ascii?Q?dliis/vSTho239aka7x6CDgoFdQpr0GooGnsdkCaiKeGJdk4eKemwV0wGGEE?=
 =?us-ascii?Q?9us1UesZJUVPK8QFNaw9h350t68ipMwzDysUw0mYYMDeu1PDbG8QRKGOCMYq?=
 =?us-ascii?Q?OBE9kVgtJWosCsuLkWLLhNoxC96SsklQjabL/ZLkWToxwsNWfMP+wmIKDYsI?=
 =?us-ascii?Q?SJDVHzWe9agQxq6C7bEazvy4H5+x+JmWl7HwLjjjP5koCD5TvZB6M3xlHnFP?=
 =?us-ascii?Q?k4V7F8GjPM4ab7uo0b7i8+UZQUlgEo/bRBoSTLhasgsv6QtKARFeOZM62d1F?=
 =?us-ascii?Q?r0QOf84cRJBd9TQnOq/i2zXhJgIMQsI4Tw/GxYEj7KcIZFRQ/9zu1tRbqiQ2?=
 =?us-ascii?Q?IGXPIaSvoJJnvhyUKtgc8SLlzxuyZqyHYNnB+b/oAw76wvLwXkhEWwQ+MdXM?=
 =?us-ascii?Q?OmrEZtk2p6r7bx/F6FU5zoTQLYoonUW5gURz4K7Q?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a20686f-c19e-4cf3-86fb-08db89e311b1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 12:07:35.3043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyiBAwbyfHNRBC7hanyHyaI9Pu2dD3lPggzq50eEv60yKdpSlwQ88SXBWpGNxs9jpyRsGOZWHaa4JzxyvMF7zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9578
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 12:07:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184688

Extend OPKGBUILDCMD variable, with additional parameters, depending
on target distro features, in order to support ACLs and xattr.

With fix pushed to the opkg-devel:
https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
opkg-build is able to create tar archives with ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/=
package_ipk.bbclass
index b4b7bc9ac2..5e151be3cd 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.conf"
 PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
=20
 # Program to be used to build opkg packages
-OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
+OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" "${@bb.utils.cont=
ains('DISTRO_FEATURES', 'acl', '-A', '', d)}" "${@bb.utils.contains('DISTRO=
_FEATURES', 'xattr', '-X', '', d)}"'
=20
 OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDA=
TIONS") =3D=3D "1"]}"
--=20
2.34.1


