Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E8DE81E10
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 15:38:02 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.72])
 by mx.groups.io with SMTP id smtpd.web11.16250.1696606677985650601
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 08:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=ji2xdF0v;
 spf=pass (domain: axis.com, ip: 40.107.247.72, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9JmdybHFzEP6eApwqdCsu4VuAWJ2svInp0h+oJDzB0GEoS9aQ2LyHbZHmxdXramW7cJhw9SrThoX70kzjJx+0TYm0uOHEt6R8BZX0r8POtsEYoWAadF4nr0EWYub9wPOjCMg7V/uisPlCFCqyJnNXEHQfPC7t+iqV/QG+Frqr5ml9UON3El+YQAk/MVf3Dimo7q2J0jUpm8v63jLerI1+slyYB90iRa7yA7B+nYnSfLhciEYfnUf/b3j5qHqmZoPTaIcahqOHOyqD9n78E0tOrffJxpA3x01ahowGG4fgLLl4mKERUTHABSr5V19qUpLB1yyBHUzK5GzYt5YxUqhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktQg044RbAwnGqBn58QnPjYigAlsBxJ9EXm1l0QPAJE=;
 b=K99EZ3J57z3F5/xpPh4eAohCLgEY0WcXHKdUIv29jAojoY+nauwOM8JE5fFZIOrJoSfR+t7zjyZ6WqrvyjrL4wOJYWDJAUailJMPlb0GdWQGYGG31iXZsEMWZAeGP/JcZfwmgAR95155UkYyyoc+96aq7cvJQaAcWFMb3sQL7/BwGda78/ViUB3kU+hMaT5jFoPircD+kytPPMNlwuIxlJxLSlvyn90/mH7jmZhXFdPOYi/Iw7e94siSqb9O1ZsCbaW1+NyuwOqPIQdGTJAL15gSn/XijPFoMLvv4UmhVNZ4O1Kr3HdG/wBrpLgBC2v9PqpvzXFEMfnDg+r5hy7jgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktQg044RbAwnGqBn58QnPjYigAlsBxJ9EXm1l0QPAJE=;
 b=ji2xdF0vUVA/k3Be7ZnlTCq5cbzn2tF0tskFHS6qfPXlqSruhpzfboKczJXHbvPGAHFNJT7/NlTLKuyyTr/p9dGidoDwqEwfJZKpRNOYS3OT64B75eC7QCuAvSgRXKa06I1ImdD9cKPCG9Qpxd9bvv5WbjAAjxpgIGlN1F6x89E=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV1PR02MB8513.eurprd02.prod.outlook.com (2603:10a6:150:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Fri, 6 Oct
 2023 15:37:52 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::46e8:4a9e:ea9a:7861]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::46e8:4a9e:ea9a:7861%4]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 15:37:51 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] oeqa/selftest/context: Rely on bitbake-getvar
 --value to only return value
Thread-Topic: [OE-core] [PATCH] oeqa/selftest/context: Rely on bitbake-getvar
 --value to only return value
Thread-Index: AQHZ7dNQBuGOE7P8TkCgeq0+pXQXJbA8+WHQ
Date: Fri, 6 Oct 2023 15:37:51 +0000
Message-ID: 
 <DB5PR02MB10213B6B0AAC6676AD3A4E156EFC9A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <17876B7DACCED7E9.31286@lists.openembedded.org>
In-Reply-To: <17876B7DACCED7E9.31286@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV1PR02MB8513:EE_
x-ms-office365-filtering-correlation-id: 6d9c4b12-d998-4aeb-3674-08dbc68233c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YQOpEyTND3/sk+FB6NpNPrC3rHr6AcfD493GDEKQ6ZlTpgbSdhm70uQC4+bc7jpt0Vz+2AosEbuyLVuraln+BgKPQt1z/hmarpJUV94hcDIySzfvAV6UxVv/AtR7zADKrtiolbbk3suK3eVQcJRqP5WcNtMB/099yrc0y6iQBD119HD2u6QnQ+t4Skjz5nbAQ9pQAEFjyqA5jHl1A0pk1ZiH7zxsfDpmP2uqgiu5URm46NZnYFofpL9Ul1fbFKBM4i+ZwMjTjM3v40T1hO2S8Ms957oq7QwulT77xQzuI7oDyXePKF6rhBC9rZqFdHrOVYYxkocZ/HCmmmP1Jnta0amjnZb+FO4y9M3GZdChHTKQq3eLcUH/TUNUUMeVWjyxgi5rPuQf9i+w+8nSKciHYK1FA8MLciTiDPFc4Om7wuohuLOMmvS4eOL6FDMEwn/+xrl3/ZQ3uAK8qZCMy182tcX3jwUaoJOvnc7gEdXJW0Kg1Jj280sa9CrGBdbA6jucLmPR1sA9P9a15ccEfilaFSPCpLj6RYfcD5qlu0VHR09w2sN9yk6/CZJytNi98cULk7DCP/2whThckT4LeQF6Ki6GiXeD0pDA7rDzqY/RBqWxKk+nwUxqRVoJXjW6PnEj
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(396003)(346002)(366004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(66476007)(26005)(9686003)(86362001)(38070700005)(122000001)(33656002)(55016003)(38100700002)(83380400001)(64756008)(478600001)(66446008)(316002)(6916009)(52536014)(5660300002)(8676002)(8936002)(44832011)(66946007)(66556008)(76116006)(7696005)(6506007)(41300700001)(2906002)(53546011)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?cGfgUZsTfHX/CSLA0+S/HLEpM3pOqu9fOyYQaau+cg06OdV0chxQx3GzyUoY?=
 =?us-ascii?Q?6yvfauJVIcmQrcVNefVVQvJAQGXWq5Wg/ViHYQdEecGR/dMPdKEysIdCgiS1?=
 =?us-ascii?Q?GEOMCGPdDo1CRpxQt4qU5Dxh+5pKuaTf8MMRZUC6ycIYqCemEuNWBU7A/eQL?=
 =?us-ascii?Q?77rbXVd9PvZfHHovGmp778xrnT4ugs2BtiNgxfpIqeiooUM3jN7rjOZ85FEB?=
 =?us-ascii?Q?STlkHsFrkTJpCuUSFov7mma5SGwtS1d82nJtbX2fADRObK06tSW2nRgd31Sg?=
 =?us-ascii?Q?EUPQk55hfta5FR4Sa5Hj3l4mfG+Itcm54AS3hYWKXdhut4JWs8ty8aWwQVAk?=
 =?us-ascii?Q?82sHSuNeauQYHb0CLQ5XroRoYONy2hBomLHWZiF5G0UoR35q5jf/t9ucw/bx?=
 =?us-ascii?Q?+bJpJK4kl7VS+4pA08teeXtLPntTj7nBf3XmkkaBMU8zZCjQ6W308aGtHsB4?=
 =?us-ascii?Q?6neXgy8TfwFrTwTOoJRVd3Jdl1qqSxsuFNudd9y5zGgVpmDBdXLXGgaBGmzE?=
 =?us-ascii?Q?/t3I0ZcJ5ZYdNC2HVu5DLZV0Y0guf8KFP+GevnnBQDsAOJgVrhWoAi3mCCTS?=
 =?us-ascii?Q?0LstYZW+xQABgEYYdLdlMFjbqhqvNfK9eJoNDPlXII3QwtOF0OODjSTGA7rA?=
 =?us-ascii?Q?4gBy3jUEeyWRNkMj9ivXtqhYpzX7AN8GXRZ7D/cb32XVeGeIb7wTBiKqAS2k?=
 =?us-ascii?Q?AWu4NV+rEnRilb6AG42Gwerc0Tu3jKjs+3Mn0cngbX2itqP+Z3cmycYyOYmh?=
 =?us-ascii?Q?BPOD83vqC5KEx+WMe8fRD+0ET7ExK7XYvTlss+jkgn9hyok64c4NwH04jBba?=
 =?us-ascii?Q?qgsD2RJs2RFyTN1vZjo7LrJVxr799xFzjRrttOdhuzKRWXo4w522b90C69/X?=
 =?us-ascii?Q?V69kKp85RJmTdGDHnDkReADwzaAuWigPO5+tRjonTSSeFypJEoaCqo8lXVw2?=
 =?us-ascii?Q?JnPIRSJSifVhwxuRuCv6hZNNTKjcXRDfygVYsRf0hiQHNkv6tJi6LPmDIpvS?=
 =?us-ascii?Q?WdGmh1g8BKtt/H3iFKSbQ4rd3vUoSboFeNyNdTt7eD4V4xDYjpQeS9xdRv1J?=
 =?us-ascii?Q?BPSNHuAWGqvMle5Bnc2WmDk5/28nKABklN3yNEhpkibIvJfNrr46Sd+suPJA?=
 =?us-ascii?Q?1AsMM5+HXycBVsLf+IwPuYgG7m54F2a137hDPa2NicgadAHk3qwk6xDacTQO?=
 =?us-ascii?Q?lpiKNe8gc9nlDj5cYQVjzprDVMWniDyZ9BjfSX4z02wW1FaNbmNAcvFe1gfo?=
 =?us-ascii?Q?KZpo5VtCG9u/WAcolqNQqHCFr6WknDuTuQNku7nnJfNIFe7EDN3OedSGTWIJ?=
 =?us-ascii?Q?rzpeH4EDj/ydqFI3bGfck6a2y+hrJPMqKs4id+GaQgh+BwqdgI5/lUg7bL/p?=
 =?us-ascii?Q?w4B7j1igFvUhhZGPWbqfhLgx/oC4PQqyk7EJlepbYsgENSf0899ZHqJmhfh0?=
 =?us-ascii?Q?CdIkHueF9FWUTKBAt0gBQGq2eQM9dIGtyWsEqjMn3qTX7pTVxCpz69feXY3T?=
 =?us-ascii?Q?jN8Kfrr8r4S2/bs7sV3B3wjGKWmw64eY3iG5NPZzAn33rbXe+KwNMrrFiQ8x?=
 =?us-ascii?Q?r6ZaIWnLRHOHTuJLwWs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9c4b12-d998-4aeb-3674-08dbc68233c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 15:37:51.9794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dj+35KaXJvtD6Kj0NdaGvMmqMYtlrrbZb5OcwWTLhBgWVLquy9TQqVwvtypuBAp0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8513
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 15:38:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188776

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 23 september 2023 06:06
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] oeqa/selftest/context: Rely on bitbake-getvar =
--value to only return value
>=20
> Before, "bitbake-getvar --value <var>" would include log output together
> with the value. This was handled by piping the output to "tail -1".
> Now, "bitbake-getvar --value" will no longer output any logs so the
> piping to "tail" is no longer needed.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>=20
> This of course relies on the corresponding patch for bitbake-getvar to
> have been applied first.
>=20
>  meta/lib/oeqa/selftest/context.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/c=
ontext.py
> index 5a09aeedff..c148aa5aab 100644
> --- a/meta/lib/oeqa/selftest/context.py
> +++ b/meta/lib/oeqa/selftest/context.py
> @@ -111,7 +111,7 @@ class OESelftestTestContext(OETestContext):
>=20
>          # Relative paths in BBLAYERS only works when the new build dir s=
hare the same ascending node
>          if self.newbuilddir:
> -            bblayers =3D subprocess.check_output("bitbake-getvar --value=
 BBLAYERS | tail -1", cwd=3Dbuilddir, shell=3DTrue, text=3DTrue)
> +            bblayers =3D subprocess.check_output("bitbake-getvar --value=
 BBLAYERS", cwd=3Dbuilddir, shell=3DTrue, text=3DTrue)
>              if '..' in bblayers:
>                  bblayers_abspath =3D [os.path.abspath(path) for path in =
bblayers.split()]
>                  with open("%s/conf/bblayers.conf" % newbuilddir, "a") as=
 f:

Since the fixes to bitbake-getvalue have merged, it should be possible=20
to merge this now.

//Peter


