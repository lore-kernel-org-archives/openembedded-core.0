Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BB3C433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 08:49:01 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.76])
 by mx.groups.io with SMTP id smtpd.web08.9673.1638953339422096265
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 00:49:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=rGjdCI6M;
 spf=pass (domain: weidmueller.com, ip: 40.107.20.76,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5igets2Ecy2XsHeDZn16ypdMz9KjEjcTe+Z5y4MvdJ2RDlCtT92F4JIMkfbtniW1AFsweUViPPb9JjJNGGFGIdAB/8v3yzb4jANIOTD6WrHapFoBNK/IdWpJgqTsfFofb2+euu0Yfc63aL9gmz7r5jMeqDrwhsmJ0mubSJZcm+G+OW/cmwH8DPTCJz0J05QTG1At1LAJ2LrlOC788rRHQZr8wEjoZbTciGb9SaPrC62W5mGKmOZauU+wKT7P4nwi/r863B1ejp/AvJJOe/C2IlixvWJS+K9v8j0/Aqs4J7oFY7fxOXsyFmf6v4zQcJMq17aqlO8o/Dk/8NLe6huog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSRlPPZbZl2kZFNeLemMV8m6nNJ3qRObSUfCuyePM1E=;
 b=haHPSntgq3n7LQz0HtMr8zpCZibZabc6sUCVREaXFZi2PjL9G0nE3zODxOJr1zUZioq6X/1ZjdCbc/NQl4A4F7z6efQ3lDZbMyiqCdCOBvJMz/sfGZlbuJcytSdBxB5E0YECVjBGRV27dpT8SIClTph1GmVZ2NmBDepwqqt+BnoYOpYJCC0JQE1DO/3rwJ0P1n2xH2Tae+p4lHfvsPv4nXWzR95aLqWZ3WcE32iQ0RPwwGlM3SNxyAw5DFYsPQP7/vKbuaz680fK71d6oKI6MEcAWEIsxOKUEP3EsbGF7Lv93fCUGd3DieAI0FgMQ2S7jp4sliXGOw+H7PN/Lp/kfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSRlPPZbZl2kZFNeLemMV8m6nNJ3qRObSUfCuyePM1E=;
 b=rGjdCI6MJdOK1m0fQrO+be1TUgt3OroQY1P6x/Db+n3kaToEqxHZ9ZGbiNRz95IOd8d5CDqis4lv8bmg+62U32EBsm+Shg9qN7GgjpjtW7fNUDM5iN9SlH1OEftJTQTaUgbgHB0cqmODuVDGqEwIBOJ4OJJzwEB75ktwuLSHU1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB5997.eurprd08.prod.outlook.com (2603:10a6:102:f0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Wed, 8 Dec
 2021 08:48:56 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.024; Wed, 8 Dec 2021
 08:48:56 +0000
Message-ID: <a6e249a1-9cd9-7f0b-df0e-866b200c4214@weidmueller.com>
Date: Wed, 8 Dec 2021 09:48:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [OE-core] [PATCH 1/4] recipetool: Set master branch only as
 fallback
Content-Language: en-US
To: alex.kanavin@gmail.com
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE-core <openembedded-core@lists.openembedded.org>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20211206080406.3249-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <9dd70fe87463e8d9cfa9cb0c612ecbc7bd150b7d.camel@linuxfoundation.org>
 <3cda9bd5-1c75-7269-921c-97c1ac6c4fb5@weidmueller.com>
 <CANNYZj9W613_D++e=OH63rE1=rRAciziOKM439Yw4nxLai7ymA@mail.gmail.com>
 <e7ee85f4-b1de-9d49-bc04-2a213f0e6f36@weidmueller.com>
 <CANNYZj_YMQita6Gfya=LhFZvsz1T+97588ExmD8NFK-9pdte8g@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <CANNYZj_YMQita6Gfya=LhFZvsz1T+97588ExmD8NFK-9pdte8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR02CA0017.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::27) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (94.134.181.94) by
 AM7PR02CA0017.eurprd02.prod.outlook.com (2603:10a6:20b:100::27) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Wed, 8 Dec 2021 08:48:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63586cac-5d89-40fc-7227-08d9ba2791c4
X-MS-TrafficTypeDiagnostic: PA4PR08MB5997:EE_
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB5997E38197B99274DC29A098D76F9@PA4PR08MB5997.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YZg4IrlWFqmq45karMA9bYspxg5X3iIPM38PZJ1SsaP5i1Y3aAiZYhiTxSlEMW7fF/QXtqTKLjLun0+r0aC5/JXVKeeI46Shy8tcpcRVk1/eIxrXX/lVncNEJJIK8TT9HJOeFkzMTySd6BH0r0ecimQf8WjhGE5ZGN7F9Vf/nknQx5JyfNZqUJU7VEnQTNi4KeDYaxb7JJRobO6DmLsIHVPU/VwMV719Mg/1QgKJsvLm7OzrWcz9FMxljve58+C3OhfimIxSLsNE9kjEz483mUhnQ8JGRKglHPq+4FIDAICjB/dgkCGRi03I6T/i+N1bEbsp+IYxgQbC1hMsqfWAjAYLdX8Ooh9gzH3qCuIOfUHmkqLQ0zTBi3Akf8C8sfm3MmJKrpSJzcrwksI5+6S4oGOOTIDHKnXkgnCQf0v7HghiU3/ipYHuVXjmvgWEhN1mRSrHfozlboN6G8shNVI2mlwNyKX5L8EK4CxV06hthtZBbmxyDD2zPZwju2zgV0TcsrgIv6vZGwB0aTPXdSPYyJMwkuASU7iQbU2pkvAMZMzVeG51DHR4iSwTP/BSaUe7+tHbmvekikrMMv2Qzd8TAhWWmKY+QV1jdu1MtbkVaPutWQ85FnmDPbjn9G5Jo20Az/WFzcsQgPuQUmT9DucqG5o+Gp5p1SWcqqRaxZ/vMfKeApM6HxFIPEK85mCNJHTkgA+LIhV1uYinp1XZkDiN4J7AR+peYCVM878H8PJT2DXErkv41YS9ODxdCMs2FD67at+wcf+cHwSHU5c0PmnaeA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(2616005)(508600001)(83380400001)(8676002)(38350700002)(38100700002)(8936002)(36756003)(316002)(54906003)(6916009)(31686004)(52116002)(66946007)(31696002)(5660300002)(4326008)(107886003)(6486002)(186003)(2906002)(66556008)(86362001)(26005)(16576012)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3PUzxjmnxAoNq/n6yUe44VPHW14pSqPUXlMUJyb5yXMsIkWYvFMqvqTdbC3X?=
 =?us-ascii?Q?XJPbyriezR+HNHe4XaJU7zDP9RTQGLuiAnW1x2t67GwyBymFPGtK2ZiV5/mK?=
 =?us-ascii?Q?F1VlYslCXSJQ9YpLjSZEIlegUlhka9et0KIXZPmtpFUhxOii2cOQ391PZflt?=
 =?us-ascii?Q?Kb4VUHf1jMQCUv8qJy2Q5/hIBxdYtfhf+u/Prg21yX/AbOg3M0iESgvYpYwc?=
 =?us-ascii?Q?qZp7NQiwpH7fmbzJ6/y+irWwmRBHR62rJUfrKf/NcFMxFRcrRFRalhoLj7rF?=
 =?us-ascii?Q?fepqMS+SmaF08/hAAIS+G4yP0TMsoNb/jznXlfdYxwI2uYWPM8eKEkuH3c30?=
 =?us-ascii?Q?jTxtJ0YqkkTxdcNtidb1JY2zDTsh0/3sgsjEo8dWIvSsqdAFx8H1lBFh0BKf?=
 =?us-ascii?Q?zME4M7RI0+QffbE0wobeBNbKRA4/qb3qt4YmoDHUskEhP3KuQVImIv0AIew7?=
 =?us-ascii?Q?XZIB2BkG53GvTjPsFxQuasIDT80GMZ4SBOmEDUGpJdFQXitLJilT7KX+H3Va?=
 =?us-ascii?Q?mAXqwXYrxBTcJB/Uc7l6dIRHHQV8yXMABvDaoRMY3s40t0f0rny2kbBbseLV?=
 =?us-ascii?Q?oy55FmDsmfGHPxsl7RhkSBuicnlZ0jB+S6z83gZ1qil4/0x87oypfBYelMW6?=
 =?us-ascii?Q?GhIzWo/Blcq9YJOEhRIi9TDPDV+rEMUrEyFcF7AhBIxUWbjyGoMI5dzd1BqN?=
 =?us-ascii?Q?AkjawU7zJDegbj5dMFhmdTTYuqj7DeP1sbHWSTzHkEW3XA9ruGkkFvA+PsoU?=
 =?us-ascii?Q?jt1xe6/5KRD5VdDaQ5AlOnsvQzPLqY7fhK97XhMYUTZcaIFMzpBsXX6Ej/Tv?=
 =?us-ascii?Q?kjp1xyHclOBH8jzCgzeM4Ee6pT0pJ7QhD1U0lZ7rN8opZYaW79DC0deDpVCR?=
 =?us-ascii?Q?OHlugO2qM8vzepxZ7BSYdEIM3XPeVunhvxFMzDEBYhY/jRWMkx4rHSU1SES0?=
 =?us-ascii?Q?acBfk1NhrR1GHCsFAt/pHJn27uurlaUo27n4PB4r/PxMJvad9nYSmjhAeTPK?=
 =?us-ascii?Q?EwK9XtEIb+s2eYA81nPdU0OprNmD9moeAZN0Mlf2UcQQGeXFc6zSDqUYIOxX?=
 =?us-ascii?Q?G7/y02avOuXc3t1DR2/c/cJdeEakV55uzVOf3xlkSDEgBO3rcWknccYxyDfI?=
 =?us-ascii?Q?Jg71frI3T5H2WYvgtHEVGEHhW0YAp2QgCX6rOvkBPza6CewHiY91naNs59sR?=
 =?us-ascii?Q?XmHn/iMWlz7oGiNLFCM9SMdFm6LLr28c+jwb6YJAWYlACy0+esjsy5PHu5Gj?=
 =?us-ascii?Q?EiKGMrprAh7Gu73+EltZAyUm/fdw7vwBikqdDsftTIYjap1RKPhz+CFUxL0H?=
 =?us-ascii?Q?/uNJaGx7rvdJg6tyJ+RrrVV0p4V5Wokh95DeaF7lO8uk7s2R98v02jh0DsDE?=
 =?us-ascii?Q?4rCsZI+ZFrtSeSXn0oT5Ct7MfVdwEzPhVGK1rZeFs8MGmOTjZBT/n/DZ9q/k?=
 =?us-ascii?Q?FgXN1OPYVfxB4grV22IOIoGJ+Pr4hi7emzAmMWJ8rHIEsZwBe7UUyKhznAM/?=
 =?us-ascii?Q?D4aBDnvVFeHWuGdY/XoJYtdMjrckDxzT5M7vte2rxDC2BcVjOwOp00H4F6xX?=
 =?us-ascii?Q?HvGCVYvPfshch4LDYtL60Q9gGSHJSpXy5HG7+oI3tufuWi6vILEOdR0i4HwX?=
 =?us-ascii?Q?mxOMgg64bGzWCVzrCkXZyYU=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 63586cac-5d89-40fc-7227-08d9ba2791c4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 08:48:56.3688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nLeWhaNly081kmZcaBHRfrcfaIAjRTyl1vJUlCy7tGnfJOSPSIAX8o13SDH/mV/FM6dD0RZccMyk+Ca+M07Amg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5997
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 08:49:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159347

Am 08.12.2021 um 09:32 schrieb Alexander Kanavin via lists.openembedded.org=
:
> I haven't looked at this, but probably the test could be adjusted to=20
> first build the needed parts with only the original cache?

This needs a rework of the tests because the private sstate cache is set=20
in the test setup and we need to know the dependencies of the test to=20
build those manual.

> On Wed, 8 Dec 2021 at 09:27, Stefan Herbrechtsmeier=20
> <stefan.herbrechtsmeier-oss@weidmueller.com=20
> <mailto:stefan.herbrechtsmeier-oss@weidmueller.com>> wrote:
>=20
>     Am 08.12.2021 um 09:10 schrieb Alexander Kanavin:
>      > On Wed, 8 Dec 2021 at 08:45, Stefan Herbrechtsmeier
>      > <stefan.herbrechtsmeier-oss@weidmueller.com
>     <mailto:stefan.herbrechtsmeier-oss@weidmueller.com>
>      > <mailto:stefan.herbrechtsmeier-oss@weidmueller.com
>     <mailto:stefan.herbrechtsmeier-oss@weidmueller.com>>> wrote:
>      >
>      >=C2=A0 =C2=A0 =C2=A0I will update my patch series but need some tim=
e to test it
>     locally.
>      >=C2=A0 =C2=A0 =C2=A0The
>      >=C2=A0 =C2=A0 =C2=A0devtool test build a lot of recipe on every run=
 because it use a
>      >=C2=A0 =C2=A0 =C2=A0private
>      >=C2=A0 =C2=A0 =C2=A0sstate cache. How does the autobuilder overcome=
 this problem?
>      >
>      >
>      > If you don't rebase the branch used for testing, and set the
>     cache to a
>      > directory outside of build directory (e.g. /home/stefan/sstate )
>     it will
>      > reuse that cache between selftest invocations.
>=20
>     The devtool test use its own PRIVATE sstate cache:
>=20
>     def setUpClass(cls):
>     ...
>     cls.original_sstate =3D bb_vars['SSTATE_DIR']
>     cls.devtool_sstate =3D os.path.join(bb_vars['TOPDIR'], 'sstate_devtoo=
l')
>     cls.sstate_conf=C2=A0 =3D 'SSTATE_DIR =3D "%s"\n' % cls.devtool_sstat=
e
>     cls.sstate_conf +=3D ('SSTATE_MIRRORS +=3D "file://.* file:///%s/PATH=
"\n'
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0% cls.original_sstate)
>=20
>     And remove it after the test run:
>=20
>     def tearDownClass(cls):
>     ...
>     runCmd('rm -rf %s' % cls.devtool_sstate)
>=20
>     Even a keep builddir doesn't help to keep the private sstate cache.
>=20
>      > The autobuilder uses a single writeable cache for all builds and
>      > builders, mounted as read-write NFS partition.
>=20
>     This doesn't help in this case. The devtool test clean parts of the
>     sstate cache and therefore use its private sstate cache and the
>     original
>     sstate cache as mirror. This is a problem if a test triggers a build =
of
>     dependencies.
>=20
>     Regards
>      =C2=A0 =C2=A0Stefan

