Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C5CC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 20:28:24 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.80])
 by mx.groups.io with SMTP id smtpd.web10.32499.1658176102070920961
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 13:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=garkFg31;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.80,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOXjHwzEmWUDM2KW0WArL4rUXte+hKCCa+VXEOSEV/SaTR30fwPJXY2LkY0k25KVylmuIBKrjRjZYGQ7uIzNlYgAzIUdcVgmd7PPihbHTjGsW+pohFBpISnVQPeiBfuDFtnszJoodddBWJCNLUa9daDruXTdA4LOz0dk8/ckXMxEEe4KfbxUFSF7LbLlbmwtEMO3rLHUKkBnYrp/9NBU4u8Tb0VhCda8gQdQccpQUj6jltQkmR/lImbcCBWPFjwG3lD1FRO4H2s70j9wggXi4G8PJDyQjJKoWWB87IC2EkQmWSuQiPhoK9/BX8GlE3bsKYGP5q/7Ps28n3q2tokWHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMqLmx4teNH39XSvyK4C52/k2lz8ZQPF4HzsHonhg6c=;
 b=IuQTRQNJtLS4kl7GCh/MwoaPTGN9n7f2S0JnSYXPMY5V5PfOBvEyf3FhuwpyU05m7Kj5waR8utfOoHvxMkSIoN3aPNrdJeULEOroHCZtKwRsvMPYuq5EjYYIvylVCuQNS1q/J/f03oEYzfbETEUIUC6FSM6zie5LYkp/TCvqJOywBsm7KJ4tN8gYkS3JrSAZEkPqlWPjTNlL149Yx53FlZBTJ1u+dEQxcj2BzFBrPMhoFOIclG8vpAO/k6aArizlqDd4ZxaAqU5ts1jnXsx0Rad9t/9jsouLRnbjo7bXg/wxa7cn14IwkaUQ79X89xktkVSmY1KVNzbolwwFynbDcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMqLmx4teNH39XSvyK4C52/k2lz8ZQPF4HzsHonhg6c=;
 b=garkFg31IK0JR/XR1fH7NtWu7NxDmx/Rw+TUIZsShPCSyJgv7MFUbXoPa9b7bPHUzv9g2MSHr5g1eX1sD4VBZIo9z9szolNuVYZ1qgpXFjfMTL70qt+hzGezURLBJEEWFsmkc7Fxy5Hcj8rQ/g8uEXU1ubsxQDUdUSiYw5k9tzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM6PR04MB4853.eurprd04.prod.outlook.com (2603:10a6:20b:8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 20:28:16 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4%9]) with mapi id 15.20.5438.022; Mon, 18 Jul 2022
 20:28:16 +0000
Message-ID: <15208757-c36e-5adf-1b74-8d030b53b9a9@theobroma-systems.com>
Date: Mon, 18 Jul 2022 22:28:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] Forced password change in first login
Content-Language: en-US
To: Livius <egyszeregy@freemail.hu>, openembedded-core@lists.openembedded.org
References: <IkQF.1653391044347982572.4xC9@lists.openembedded.org>
 <11484.1654292712146430411@lists.openembedded.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <11484.1654292712146430411@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR08CA0192.eurprd08.prod.outlook.com
 (2603:10a6:800:d2::22) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c79fff33-8161-4cf4-3895-08da68fc0b7b
X-MS-TrafficTypeDiagnostic: AM6PR04MB4853:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+55s2fzRTMxtbKFW08lYOQuQS9/SFsABOVYJ95SW7rtsNNM/XdKFJ6Xd9mCe37tVUh7Rgedva8ejspPFEWUM7Z2BQKQUp3B50HSzdU27othV/JTysYVlltKXgO1Yu8adkfEnEzQHBH9MBaqg0U7c/4oX4a4N/jTR6QtuWgYNgTTBNJoTeWhtdK3nalB0UW42Y/0Y88nW1+B6M6VIgsnDkEYynJxx/TafQI29uuPgRc7PpSVtxrIUQ5FgdMLStEGScybXPYAFAr5N0vfCR1G4yzNO5qyGnC1dTcNwIHFeFR5UgK4f74eSXrruZhoO5xtDTFiTEZl6XZuype148o7j34uZyf+Yudz5/ykj/vz71PPp7FiHhPQwnT1OXxL+ba5UuopzqUAJHT983iMqqiG8UEs5V6Bui1CH1YWvrTRXOTlCSIYG9PE1GOEatTqN6HI9gZYH00n6jyYB+1DTQ3oIy5fBLM08UfD1759OVGrHQ5hROzwkUk/tJD1NeeAZ/lbxDcDGnEaC+ChwYt6CCZOK49JRAd1vWzGk5Lvlbl3BAICTI95KaNLQn/krm4M6vyBroVc77mmls10J/+tn/S1KZx/ypo+83JiLJ4VmxXzHkEYNOFUmdY2kFwdbqTLGHIMl/YHkXQMcrAZ1NVQJ7o0Yidv7CjRe6cJBtJ+1XWted+ULaIAf/QFKPjYTrxlz6nDuBRP44v46ZvXCmEiIGp2vN9wznXdIR5QxcODqOSZaIX1iaDuXpEuEJbcVhG/Nt44cMYiAfYCxbcnK0mtKUNRNgPlwPk993ukJgCL9Oy8XIuZQrn68yQOHYcBKgq9XRet2+hnPGRQnA7qBHEEhKqTq7I8bS17D8YXeL6Uo+8bWx5Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(376002)(396003)(39850400004)(346002)(5660300002)(36756003)(8936002)(2906002)(31686004)(44832011)(31696002)(66556008)(8676002)(316002)(66476007)(478600001)(966005)(186003)(41300700001)(6506007)(38100700002)(6512007)(86362001)(53546011)(6486002)(2616005)(83380400001)(6666004)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TAv93C5Dl9CkGgN6ygN7rMDfU6z84r+0ETer1ig9cRaz2/iaMZX/rwwP+dEb?=
 =?us-ascii?Q?3jBrNoNrZdzempvgA/GVMq/3U3+FEGKC93NnWZ3dKBWyK57AGqbPMkS3l0SA?=
 =?us-ascii?Q?tmQqZT31qRZsjxHU7MPZIStXb7s/ftxJK+sWZsDkyqHUziBbBTK51A28vDK2?=
 =?us-ascii?Q?FQXar2iAVt8poDtfZFX2tpH5d8rBVppo5QHXuIgCKfHeUB0o+wF89PrBu3zU?=
 =?us-ascii?Q?UDQicOJO/HdzdaIWZ8mwZyL5LY+CHGMThhD67fPAu9iA2fzatyqewiFY1Fuj?=
 =?us-ascii?Q?FH1wKZrhJDKmpwuUHAu2Zf5tKXrBV90wM6lrlwNcGQKumFsxsf5rV284sIgb?=
 =?us-ascii?Q?XuEXpdvPJQSN2VNVS6VhspL3+P6f1HeTiEz4EzPFLn+1RN+sEj0rBHy13sV1?=
 =?us-ascii?Q?gPtfkBNhcewNH679omRR3lKmJNlR8JZI5OPojEh0faxewhS1yq4/+CC/PIeJ?=
 =?us-ascii?Q?Pu+i5tEjAzhREZzmAdVZw3e586qiFnxRHF0ev53jwTLEGztt4xholynZxLWT?=
 =?us-ascii?Q?QU6lf7FWWswPX7AwjUrp//m3a1mApJtm6r6t3HF/kMjwF4XH2DNt7g5BUSbh?=
 =?us-ascii?Q?GNEt8cAFP/PZa8CB0seInLaaaqkdLYLnBRNDZ0Il/Td7jIcOM9xy530723rY?=
 =?us-ascii?Q?9eWaXSVa/rUoAtuPdV4cUEVgQbL9RAmDFR9r92JHTurVHQr4qNdlkyiEVl7v?=
 =?us-ascii?Q?tGFDDY0u8peB4MRuqD/96D5r2byG1NqRSoiHDDs62XpJpPgHPDcND6ztkCvQ?=
 =?us-ascii?Q?ODsdlKC8iv0DEsuMaF4cBCWwIkJMxkv9chbKkloQNOsNid0drv4blLqrorRI?=
 =?us-ascii?Q?GldP1Xn+AlC7bw4LIltSRisZVawE9iahjsa3xUfdk1NqqqqVVsail5eYW24q?=
 =?us-ascii?Q?ymdjW+Zmb/rEwsWgbWckTWpjJfAYu0l/PQRgw/ghc1m6wxX+uF5qByMoiZQK?=
 =?us-ascii?Q?OcZ1UjQHadOKI304TGlYc5d+3Yr2FmLOj0L4NWVf02jIile4pcyfdXiI00D7?=
 =?us-ascii?Q?uGMEBpLnHGiEAHClcz87YzELIdV689/h64YHsXsyc6GlENxHmyoi8s5p0Jfh?=
 =?us-ascii?Q?xvCHrb0dvZHY4u2S2WTX75uf9PCI7fangLJ6vTcGZD0DgEJfKVJ4IR637eiH?=
 =?us-ascii?Q?mxJOJtoxuhH65A9HnInLvaG9WVXxGkYZ1gkwFz8FVvlPzenQJk9tC2w4xNmd?=
 =?us-ascii?Q?IBWtxtB2KaqVunAJtspki1FWRdhBNkfyyKeEwuBH82JTkMk5rizWLMdL9XDh?=
 =?us-ascii?Q?CwHnCb/K/t2x4vMk+B09hcp6fAocFJGialZaBu02qmPTxguoivsV+YZXCglg?=
 =?us-ascii?Q?vV8DpgimkbSNdHR8ka0ImltQ40gEKe2EKkPFaAae2SLHfviPm0tKpnpGcBc3?=
 =?us-ascii?Q?eDBQ1giXSajdXYqVUQW8hieWjlp9A+XQHHdYBQmB3zBQW0O7gt/5RgegRJID?=
 =?us-ascii?Q?ceN+LJoDrZU/bGtOCdZJmBixRofZ7NX0Mnq6xIEk6Nr0TGrwM3PG9xze4qSi?=
 =?us-ascii?Q?aU6L6Wj8l+yjkYsPlW4bTmp326pSnNvgPQRSrol5+ddf8iK/WmBsacsDFbLB?=
 =?us-ascii?Q?8qNZm+2tND4kyaTX81Zy2ffrcfzPfnaQlwobxEFR4IfBeTR+NZMjaDZ2cFFC?=
 =?us-ascii?Q?gFtboDq7WezQ0N1VydzrlB79/9JKShZpEkEHuRJCJ2t0?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c79fff33-8161-4cf4-3895-08da68fc0b7b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 20:28:16.1580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bkOvUm1R4Bsj6xkXkSZROoGBd29AJum+RT6iT5tykVS0LD2hMx8JweTVA9j0q/leM7dJRyAFdARV2lLwyGwllVimTRSBlivIh/Vn1czb+fhXOpoyn+O+/HQmxtBy3S5Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4853
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 20:28:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168257

Hi Livius,

On 6/3/22 23:45, Livius wrote:
> Finaly, i found the problem and i could solve it. SHA-256 is too weak to =
make a password hash, this is why on first login we need to change password=
 always.
>=20
> Please fix it in Yocto manual ( https://urldefense.proofpoint.com/v2/url?=
u=3Dhttps-3A__docs.yoctoproject.org_singleindex.html-23term-2DEXTRA-5FUSERS=
-5FPARAMS&d=3DDwIFaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ym=
A1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3D0uV8RQppxWsB3H_ISKM3TtcskB-MI=
QyiSP7s0BMWyk5zDyOJ2v-Hmu1z51A1H1Td&s=3DbI64ytMKJ6c4SoARAXvTxdYfYoS61-EPSeq=
xAbok8CY&e=3D  ). When i set it to generate=C2=A0sha512crypt hash it works =
fine, there are no any change request on first login.
>=20

With poky commit 2d1838b7bc ("python3-picobuild: upgrade to 0.2") master=20
branch and the following diff:
diff --git a/meta/recipes-core/images/core-image-minimal.bb=20
b/meta/recipes-core/images/core-image-minimal.bb
index 84343adcd8..f21f467bfd 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -10,3 +10,8 @@ inherit core-image

  IMAGE_ROOTFS_SIZE ?=3D "8192"
  IMAGE_ROOTFS_EXTRA_SPACE:append =3D=20
"${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
+
+inherit extrausers
+
+PASSWD =3D=20
"\$5\$AEz8bdRlSRIc3Ejb\$g3M6ww5SouP5wwkjw126ulgdxNMlLfx5b.hbCRpZMM4"
+EXTRA_USERS_PARAMS =3D "usermod -p '${PASSWD}' root; "

with brand new build directory created with source oe-init-build-env=20
../build
Then running the qemu image with:
runqemu noslirp nographic
I can successfully login and do not get any request for a password=20
change, even though the password I created was generated as explained in=20
the docs.

Can you give us more info so we can reproduce this and amend the=20
documentation or fix the code for the usecase you found required sha512?

Thanks,
Quentin

