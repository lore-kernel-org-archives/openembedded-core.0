Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55038CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 12:45:48 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.80])
 by mx.groups.io with SMTP id smtpd.web10.53236.1697805944544979644
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 05:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=GC3VNUWh;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.8.80, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DE7HEe8Acg/T6eXyrYbkXcBy2bQpIoNAr7hq+RoWMeiawySkY850bZcxcRiWWki3w/ualqmbhjvsvxW0Cx3tIRD6xeDMzTgDA6nd2z8x1HvBR0gCc1OuGwRmNlI4/LaVIF45HeKVJ9kdEPqLfCNWqBz2IS9NzEFimcnjCOhqRgYDFO53utGt2sDXDJpx3WMz7pwhwgZOv8MKHfYNJc6tobyz5/gXYMFOWavxGNBVglzoff/yLPznYRCP+eGOwmbOUYEVazPDKflONEb1c1EIWWrA6yXVDEFDd9IMGWjJygXO4GBKXSbYPwRYJzj0J10K7iOp/uxizB7iakcu/miLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJByWmyqH8jRsXIaeY07l1jELxY6HwQcX36wiF0XwfM=;
 b=jQ50Hq9uMaSzJieiKxspRPKcAffWdT2W45evv6Fz+HW2dQICDDJDq4k/uFiIXV0WWWri7CMPbw0UUICQDnuQbu4Gr9aj8W+5gbyE3qOz++ug6sAoBoVGUwziKYbVX4LDW3g3MoUoqvSDK2563AmEFokGGlfkqj+NK0uqY9J0YzAIVD0FBVHm6aKhc+h0UEAPMaEBNdHfQ4HU2fH55cQW3DTP2fbeC92l3ZIXH+3ZW+KN8EkJ1AjaHc4nDRq8SReL1hNOd4G7Mfeomeai5NODbILFe7B96C0aDprmpDelgmMa5ULGI2OeGbTYpdUJppMfH4FWfpVE03t8YLnMFbnoSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJByWmyqH8jRsXIaeY07l1jELxY6HwQcX36wiF0XwfM=;
 b=GC3VNUWhcF7RcfyiZrxxIX0nl9PRSDGkUBehIfmfGizFTfOC6OyTYRnC3KcNhNwq8la4IIJnOOaook1lvxcx9YOzTI1x5IdnUxjU8Eiw9TGVOulOjHu243WR5p2kHIEwPDZ+LcZxBpM5cox2goCrPumK9AtFNGTAQP5qq9WAveUdBq4F2TubV7+4qMY5apkYESCqn3ykL2RVTCcR/vUacKlXBFRqyQOEqxiDkXN15MdbxHrEV1kiIoROtigSWG40fxOU7K+1D5pxMQNk8Y5/fmnO2skXsj30InC63eZV3rXpB99SV7Vr5xtFwLlE+MyJJPm0SDQFfxcyX7JQn5Y6pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB7515.eurprd06.prod.outlook.com (2603:10a6:10:260::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Fri, 20 Oct
 2023 12:45:42 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::cf3a:acd1:fc53:af3c]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::cf3a:acd1:fc53:af3c%5]) with mapi id 15.20.6907.021; Fri, 20 Oct 2023
 12:45:42 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 3/4] package_rpm.bbclass: Remove unused definitions
Date: Fri, 20 Oct 2023 12:44:49 +0000
Message-ID: <20231020124450.9736-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020124450.9736-1-niko.mauno@vaisala.com>
References: <20231020124450.9736-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0033.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::27) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: ada6edf2-1546-4fb7-1c56-08dbd16a786a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Szs/raE5duIfEJdng+bhmuEfslmRAZqI/jm/ttrRdX5uSVEW2MxzxG2xpess4ceIz3mlgniz6UaKJyfjpdHREN1NAkgrw9lfOtdHg/kW7eVoNccLAHA5QArWjkldCWH4V9PKOzHWjtg16LdEzD7Sr4ZaAw5cVr0U60rhxwTNHtwyT6+8LsMNIh4LSIAO41J9fdTxRxyFH4bPc5IYhj7zCBitfrC2nAsQR9ci5rVVGThENYVQPAtFJT3S6dZhLMiMBPHYDeIaKF5B/NUhs42McuCpai2Y4rW4XA4cSGggu4N0YUM1PsFqW9dCx8kps4y4Vae3KSxWn+RD9LGtp1okkpKGQxlu793QcDQOnDiwNjkbViA2+EOKsRjXDorsHb9VOTjaT5iqfjwGZEw+N9ErKcADqTXDvz/DnZDPAEhKKdUFZAaAMm+KSbJQgRQPeuoaNuWRyCZepnRfsBIT/37Vmq7tOv5d4PnfoKuljEyvsLsVXYB6wCsZmLj8U44eXYhsgtT4MVFGu5xcoyD/+52fVzDehMnXfvLQuKUOoHpZ+Ajit/UOmL7TZApwgTOSSHFD0/XXp7B5+DMkBwCWG9dhLssH8F6LK0Vw5CBao5rQqnZqvNivBBlyHb92v5k+/4mB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(346002)(136003)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(41300700001)(83380400001)(38100700002)(107886003)(9686003)(6512007)(2616005)(36756003)(1076003)(2906002)(5660300002)(6916009)(66476007)(86362001)(8936002)(66946007)(8676002)(4326008)(66556008)(316002)(478600001)(52116002)(6506007)(6486002)(26005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H/Tbek2asVAiWMMYdVPZ2i43unxznChIj8BiYgC0FZbLW+lTfI22F4xTThXJ?=
 =?us-ascii?Q?qpcVfl/av7mo2hzV95WBi9JDiFPBZZ/EJo7+Kswfv6sZLWq8Ihe+wDSgcMZC?=
 =?us-ascii?Q?iHCoG3cCHWHii6ANODtoPqctFbCevBrL/+9VXRt4LJ5ImsQ3KXOf8iqhTpvJ?=
 =?us-ascii?Q?dEed2A+qF7LVhSWBWt5rMl6jHW9PSyCzeFbeNeFD5oAnnn1j14vZfCkgb828?=
 =?us-ascii?Q?BHOxR3gCTa0g5oNzt56HoIdtIQPNx2g8fOLg4OXNXdyLzTaeiAqC1XwQthE9?=
 =?us-ascii?Q?jBCYBsvZyIEs38PA44R8bbRNeqx7TnJtDkdM2OL75Ao2a1cV+PJwFF9ULcEa?=
 =?us-ascii?Q?HJDNdZZzmXmMVamstjF7sZHJo8HcR84rV4Xo37pTnifZjR6VMGmOVX5DiuxE?=
 =?us-ascii?Q?GuUB9tWX8Nw43UX1eDq1joiIEUqpp6C8PVKjaX+zElhDEuI1uUObYSqzMO4t?=
 =?us-ascii?Q?ISOrMxUwhMiiv31+kLmC+UCmdzoBcRhXm9YBbvpZtHh9rpDdGWTx2dYv2qLB?=
 =?us-ascii?Q?jDE3baQ/tnRI6cu5tRBsvfi0fb3SsC/MOymweZLsc2qIY82OJOrj4JAehI9J?=
 =?us-ascii?Q?3fCn2YmtCBmGnTGO+u36rPog+/SJ/gXFa98rT+lkyehQA8t2NFIQM0yKFeIg?=
 =?us-ascii?Q?F7atf1VNy1jOKzoMu1o5JHWz1J1cQyvabQjc8FJ87CCSOJJ1338U8ryAv9/t?=
 =?us-ascii?Q?PLGCkXv+s58Bzbzrkk9ayyJQ7L9Y/2rD/B7e7fiTBGh3qTu+nXDxkkETSWAB?=
 =?us-ascii?Q?uEq67lSnKY6Y8czXYnxSvwVYVPz45j+bqmn+i2ZTcivnWdnBsN+ZALuEfARW?=
 =?us-ascii?Q?O6NuRkmGrJQrRTMYMItx3ex3YR48RM7QJqoudjbJqF0k0KEqC1vdmogdfoR8?=
 =?us-ascii?Q?gjr+A3Q15plFAjRj6JBtxR58tMh6scTUG+1QN/BzDGoe/1PK15spviXy4mnB?=
 =?us-ascii?Q?f5t6OH68fAG76USg8UZC6C+e5iCU4Wtq2jsHgi0Psezcfbml1SRcoLMdG3Tx?=
 =?us-ascii?Q?Yc88GyEuknG74+wakvH0hYk5HMZyC5krtgvKGD/GlpYNWnD7kLb8QTFVwKHN?=
 =?us-ascii?Q?NUYTBLkLyZcvp5ku/oYfk+HCxIMb6+JRDetOz1DLMhLCmb4qWn23J98xytUK?=
 =?us-ascii?Q?UgAmj9/cmVl95VOR/Ml63u1uReREncFESXxMZYFuzUpywOvoRQYlodT14epz?=
 =?us-ascii?Q?7nPorR10icjPKITC3Y1xras/0EiA5EXT+eu7kEkWX+06hdabIlgCUlnkgZUP?=
 =?us-ascii?Q?k8vWnB2N2uNsO+AJvvfZpZE5f5P8Ixk6Im9eP/LggTCNoPu8zUbqVL7fBoM5?=
 =?us-ascii?Q?H/b6C1X+FB5ix2rVppn7/PAfjcWTndKaugtzlcU9nknxxagJvLkqigWhg2vr?=
 =?us-ascii?Q?ez5WP8/Z2Mbr2moThCSfq+QXK2saUv4PzCRueXJ/6Mb+qo4KgYBjsehEXRld?=
 =?us-ascii?Q?pTla3VDKD/0+vuJf1kMKxgxvXMW0uaYXcZTbbKly3hHd5Nf9bnJ2/NSj+kNx?=
 =?us-ascii?Q?ehI2oi2UNvl88UwWJSFhM1mq7yPRfSMBY3uo+MH238VUwlhUdBH0MSECmb8c?=
 =?us-ascii?Q?ABt+pb2Xwjt23Q88uk4GpMJIVoV65PYUx7UdlxkpdX7zSvlxjLiWItQwoNkz?=
 =?us-ascii?Q?yg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada6edf2-1546-4fb7-1c56-08dbd16a786a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 12:45:42.2188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKx3dQxKeYOHJyTqjoJVHL/84DwJ5wV2lY1vQT1JD1DGV/zR1ZpOgzW9dao8UZiggTm+ptYeUkqrKftbjW4/3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7515
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 12:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189522

From: Niko Mauno <niko.mauno@vaisala.com>

Some local variables defined in do_package_rpm() are not referenced, so
remove such dead code lines.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes-global/package_rpm.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/=
package_rpm.bbclass
index 402fa5c4e8..246106ea4f 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -633,7 +633,6 @@ python do_package_rpm () {
     workdir =3D d.getVar('WORKDIR')
     tmpdir =3D d.getVar('TMPDIR')
     pkgd =3D d.getVar('PKGD')
-    pkgdest =3D d.getVar('PKGDEST')
     if not workdir or not pkgd or not tmpdir:
         bb.error("Variables incorrectly set, unable to package")
         return
@@ -660,8 +659,6 @@ python do_package_rpm () {
=20
     # Setup the rpmbuild arguments...
     rpmbuild =3D d.getVar('RPMBUILD')
-    targetsys =3D d.getVar('TARGET_SYS')
-    targetvendor =3D d.getVar('HOST_VENDOR')
=20
     # Too many places in dnf stack assume that arch-independent packages a=
re "noarch".
     # Let's not fight against this.
@@ -669,7 +666,6 @@ python do_package_rpm () {
     if package_arch =3D=3D "all":
         package_arch =3D "noarch"
=20
-    sdkpkgsuffix =3D (d.getVar('SDKPKGSUFFIX') or "nativesdk").replace("-"=
, "_")
     d.setVar('PACKAGE_ARCH_EXTEND', package_arch)
     pkgwritedir =3D d.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}')
     d.setVar('RPM_PKGWRITEDIR', pkgwritedir)
--=20
2.39.2


