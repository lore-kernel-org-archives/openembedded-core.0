Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92059C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 16:35:59 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.41])
 by mx.groups.io with SMTP id smtpd.web10.9546.1644597356497480820
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 08:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=PFmclYye;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.41,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgjTS803+mzoOD3EExYG33OmROFZwh9YC3kbYb8TE0js3wfcNsUhQn83j9/mcup9mlIgDMagbQ6JtG0D2CWgxO5aPav6W45E5fHcqI1UTdXBB9KBOx6GngqLZuHSTTS+Zld920PRTUVCh9vdgW6auVvCjMfeYOrgZlbQStRRwduJ8cT+N6JxVw/qkfvOkOnX2jcqF6V+Mlka0TpDBmzciWMbMJdFrgf1sZE7JRtFbpvHtn3Ir3kCdmAGw58l9jKdH+dejdJMKxYqmlQye5A+vOvuG8zStaDwRB0otWnW1BBD85r0DQpNCO0z9S8wZZ6y1U6jCUWjkG6ssfdGwCGtBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvgumOHZQ4NsDiyzujO4zQoGdILlV4Ea1peZjPCFTMI=;
 b=UceuMW+7JYnX34TQDqHn4/TBkGOXzM2vFkBNQpJ4wJOTPramfm7CBjeDiFVxNLNwCirrty2+1DYTshF8K+1Vuv9aPrSGsBcQiZSPv8a5BM9pWdTK9fumq7M76VAUJ03wFBhC9SHpPFb2GvDuzMv3Eu8eQ53TC1p+gXTXmx038eK2vDX42KXAAuwbGzK5BnAlUECpukdko0a3saDUoj8D7OfraqsE5SydEcsWXkXmHnyFPwgV7S/TimQXBA1Vzzz6OaDX1Zxql0xKOZC1KDCEZLhGwkH/rBEcEREKTutmFkeuuliY61eUOFzugWGsWc2t7HXCoJtzIZoDS/a3FCTm4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvgumOHZQ4NsDiyzujO4zQoGdILlV4Ea1peZjPCFTMI=;
 b=PFmclYyehcoPv8F7Q1R3Cz+Yj1bg0/MVsp+WFeVge5yD6Z1AtP6EY6W1sO/fQo4fpvNWCXLsrpyiibSXJpRtEes5Tv0FdUGBDmb6ucPjCdWn6te3tx+E1h64u0n6KZuFhkHCLOidykseQbO9kBhgvVkCJ2E5X7v+RTSmbXk/yWo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by DB6PR0801MB2054.eurprd08.prod.outlook.com (2603:10a6:4:77::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Fri, 11 Feb
 2022 16:35:52 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4951.018; Fri, 11 Feb 2022
 16:35:52 +0000
Message-ID: <ca463ffa-0da3-870c-b6ce-7bd154845f1b@weidmueller.com>
Date: Fri, 11 Feb 2022 17:35:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [OE-core] [PATCH 2/4] wic: rawcopy: Add support for packed images
Content-Language: en-US
To: =?UTF-8?Q?Ulrich_=c3=96lmann?= <u.oelmann@pengutronix.de>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 openembedded-core@lists.openembedded.org
References: 
 <20220210161738.17989-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220210161738.17989-2-stefan.herbrechtsmeier-oss@weidmueller.com>
 <6r7da11ij0.fsf@pengutronix.de>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <6r7da11ij0.fsf@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0024.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::37) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a6221f3-a665-4449-e8a2-08d9ed7c91be
X-MS-TrafficTypeDiagnostic: DB6PR0801MB2054:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB2054AD127FF3EBE0F462CF7BD7309@DB6PR0801MB2054.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uJGeJl4fnCMfXsYjYPIzEMopIstg4tSjKoBULrKxM75gNEu/bP/fdUIE8bv6yn9pogL8IrqfZrZ9mQAtFu9wnJarge5el8bdtfYtwSfd22sYhOGsfHXooeXla8J3slssdK1txY4/r9LSeuPVH3j3HBKZ9DsTOaIoNHKuYauKl7p8yXiy2bMFmakvmCdJPy5JckhpoeW7FDr9bqOjprwnEJGUeDDzNzdE22hSP/h2U0Pq6Ro8hQbeUPxzDXayLM/JTAJjQhSNCpBuZBzXAZop4gAg3XWJ1Ix4T0oBhltEraBzURcJMmktn5XDFprAuGca2kwfX/KoxxVcWETIqDMxgDvQ2uJJwF0Od1uMz4O7NYUy+L070geJ2KWu3SsVNhmkrNY4vrzAagMvSiADrwhUqKTwMUj6aPc7TmMrUXwsYUTWPsZjUGGS6OwN+e/1OY81pFAVeYqPGitXMOXmNnkEfoEet+uIZ5ad7a+jOFmglKluU7VwKrAvA1junUp6FvKfydYBMfQx69dJlSHbb+7Iv1gnn4+IFBS75quUgoCAVEDb3dOUrt5Z1UAQtd/30w86jcZuzBDogv10Hct38NVQ9kY4uyTKeK61Zu7Z4geRisxMCNTHcLvZtZJTTs/Bv3KdyfSUqIk4c0lva7jbUwuqfOERFXAnfKPHFYBnUtGfjOU/B6jH156HWx4sJ98929bwZCQ6aGNWD2qy32+GY3rzQfPgCwYVkb5y5vCSOcVd7eeFQVIHAy7kXmHlfUri5nDd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(186003)(2616005)(508600001)(66574015)(5660300002)(86362001)(31696002)(4326008)(26005)(2906002)(83380400001)(8936002)(6512007)(6506007)(6486002)(38350700002)(8676002)(316002)(6916009)(66946007)(66556008)(31686004)(66476007)(36756003)(52116002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3aOMC3fAU+KuD52aN8liK4gmefOfnBE8t7W9PIeQLpuM1YDBf8MOpRM4U5es?=
 =?us-ascii?Q?8+WJodKqKjPW9O6N1i9ODVeZLBF/sAhYBzfkDt7PW6uqMm+20PiVCu/C4My2?=
 =?us-ascii?Q?zWtL6N5A+i+ANz27mmjC6qKgD7bRKZEldTXZb41oluhJ7yFA/BjQynLpur4V?=
 =?us-ascii?Q?BEUtQLAKszjR2TqYQQlu0ZWCQRKLEmE1EuOO16taJBJOAcc6eYjFMxq2vcun?=
 =?us-ascii?Q?bTQ2YS+77L42ezc+d/65FNXwkbCUEnWaUbkc/KWsCTmIfN9BzQrcySjrH9+J?=
 =?us-ascii?Q?nHHrU/yAtUjdfQnesTA6300XYld4y5vQEaqxsTVHXsMI1vMlEfuDsAcD8H/Y?=
 =?us-ascii?Q?sI9kBqgMOtKE3NoeFEdxxjCYcyDyZqW00m5Ztg61O5pnmFKu8zEeVdLEdLVQ?=
 =?us-ascii?Q?EtTZ4FFMLSUIOntY89xjNHM2XQJjGeqIgA0SHNF1N7xVskTiIwP/eMVQqkhm?=
 =?us-ascii?Q?kt82Z7pUHXFikKFc3DM763Ft5dEmd2beO8RbdkicX06IU7sgiVHnYJB5eMcF?=
 =?us-ascii?Q?yPjwdHvT6cs4bGA/TXazGXv3x0/hC2umR87g1ukKhGLludZ+/qXhX0c+CyQE?=
 =?us-ascii?Q?A5/SSqjVyNOjVZeG4N14g519GaiHNBo9iyPutwXbH2C0BfgtSVuet61vBC3b?=
 =?us-ascii?Q?OQm+HzBI0NLO+dymQNIEHvI89FCnPiEgBxyUzNFioim9fSL8H7pMefyMIkTo?=
 =?us-ascii?Q?vITXJJj1js9sBLmy8l0roJHr8fAR2cY4S3BLlL4z8UOz7ZwqmavnKlTmD34F?=
 =?us-ascii?Q?3lRGS5PSJkNr34Ncx3bLMqY5rWp0+50PYGrWWfawY3USqnwwfqT443IcaFT0?=
 =?us-ascii?Q?k3wwtTNaWANVcNTIdf9mazsvIjtv3O+uNp91Bxk65Xbe2v50OGfEgaRldBLZ?=
 =?us-ascii?Q?4EbifcNJBMV25UOnctWhZW7MlNg/bLj13cby8gSolKNmO+GJaSgp+AGIm8XG?=
 =?us-ascii?Q?AkfkFJ4RzoY8s9SrsxdqqUuQ6TiIe7mhb4/TxA6D691z5f99mntwrSVw7VLy?=
 =?us-ascii?Q?hc5MMmEebgd8jJZRwFQ0sxgcxhzGfyIwQB/xCyddb9KAv8OUszQBCENMHXI4?=
 =?us-ascii?Q?vX0R7eR61mtCiPHxMZ05GIaamYe1OfqrJ6uMTYI/W6AlORgdeZr8o78XgOMS?=
 =?us-ascii?Q?eztkWI2L55kV3IQmWod1ukUmOSqHEInRQvQ7kTVXRFpVq5b1oWOq2lnORAut?=
 =?us-ascii?Q?LEw7Smz9+XpcxTq0d/4jgXUtRybL+U7+4wDMzgAIuR0leY1m9Ey8nE8mYGRj?=
 =?us-ascii?Q?NXeRTh5e4fbuoOTuZP5TMhfacV5yQfOj2pCihADsa95WfRgOSP6rpJYzBDV7?=
 =?us-ascii?Q?YPT2MnwKLGzaYOyMPW7lFU7KI9dPOwPNP7Ax3S2c80GaJAJ9cyc4RL1KCEj4?=
 =?us-ascii?Q?89bgw2JEa7AqGrfDi1Ax0LBS59bQ83LXPvbx67oqP5uzKXxlN549w6OvwNCm?=
 =?us-ascii?Q?jaq6/UO/JLsTpMLXkCgYiFUM6w9raNid/++CppDyEEBgHkLgD2MHna0cnUlc?=
 =?us-ascii?Q?Ws6BN2gfG3rA639Cr2NlgOCdDGIlRnjOw3/asOBO5NJevom1IAW3vokbGvAO?=
 =?us-ascii?Q?FlGo30tu7CvmHs3XK6mpU0VTVsYJvPyxjtYKUZAl9knsOaj7FDtOa6UnSGrV?=
 =?us-ascii?Q?ozARcVtLZ1cCo5bp6702j4Y=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1a6221f3-a665-4449-e8a2-08d9ed7c91be
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 16:35:52.8133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TQEGysUOs1vfF33F7gsGW7DY7AizVgAX32Xu/tJREPp0T43MRcP+cYuVaFq+gQfjw3ZQFNDDA3hsknXofoo6rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 16:35:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161658

Hi Ulrich,

Am 11.02.2022 um 17:17 schrieb Ulrich =C3=96lmann:
> On Thu, Feb 10 2022 at 17:17 +0100, "Stefan Herbrechtsmeier" <stefan.herb=
rechtsmeier-oss@weidmueller.com> wrote:
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> Add support for packed images to wic rawcopy handler do minimize disk
>> usage in deploy directory and reuse of packed images between wic and
>> swupdate. Add `unpack` to sourceparams to unpack an bz2, gz and xz
>> archives.
>>
>> Example:
>> part / --source rawcopy --sourceparams=3D"file=3Dcore-image-minimal-qemu=
.ext4.gz,unpack"
>>
>> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmuelle=
r.com>
>>
>> ---
>>
>>   scripts/lib/wic/plugins/source/rawcopy.py | 28 ++++++++++++++++++++++-
>>   1 file changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic=
/plugins/source/rawcopy.py
>> index fa7b1eb8ac..7816e00e49 100644
>> --- a/scripts/lib/wic/plugins/source/rawcopy.py
>> +++ b/scripts/lib/wic/plugins/source/rawcopy.py
>> @@ -4,6 +4,8 @@
>>  =20
>>   import logging
>>   import os
>> +import signal
>> +import subprocess
>>  =20
>>   from wic import WicError
>>   from wic.pluginbase import SourcePlugin
>> @@ -38,6 +40,24 @@ class RawCopyPlugin(SourcePlugin):
>>  =20
>>           exec_cmd(cmd)
>>  =20
>> +    @staticmethod
>> +    def do_image_uncompression(src, dst, workdir):
>> +        def subprocess_setup():
>> +            # Python installs a SIGPIPE handler by default. This is usu=
ally not what
>> +            # non-Python subprocesses expect.
>> +            # SIGPIPE errors are known issues with gzip/bash
>> +            signal.signal(signal.SIGPIPE, signal.SIG_DFL)
>> +
>> +        decompressor =3D {
>> +            ".bz2": "bzip2",
>> +            ".gz": "gzip",
>> +            ".xz": "xz"
>> +        }.get(os.path.splitext(src)[1])
>> +        if not decompressor:
>> +            raise WicError("Compression not support")
>=20
> Here is a small typo: s/support/supported/ .
>=20
> And what about substituting "Compression" by "Compressor" to express
> that not compression in general but only this individual compressor is
> currently unsupported? (Or even better: in addition explicitely name the
> currently unsupported compressor in the error message?)

What about the following:

Not supported compressor extension: %s

Best regards
   Stefan

