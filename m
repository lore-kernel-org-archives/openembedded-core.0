Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BCCCD342C
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 18:58:36 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26814.1778093908544289473
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 11:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=ayZNvMur;
 spf=pass (domain: est.tech, ip: 52.101.72.11, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMn8KFCajTLJVj3kLpwbJUDItGgoRbIBR+322Jfq1doR3+3h5yEh/br6pprQ6BvfeU3RtyXCrnU0+CKgtzGMpcOuj2u63WnG4Ctyi0wdUQ0okRX9BARwtWV5L9tCuDjBB7PT8UzLMcUdnVHEdRGqk/p+wTfOamfVfGvBYcQ/hllz0nTdgjOkdX5ia2oBallurxlkmrZFiEgn2TA7imihhV1wm3ETzRrSVNV5hg2a3CUQESCoP00ut6KC6bAJ8OWg9EselfnNCq6uKLOAPF5s0Ih8yOfaLnj8nCchqpE41N0G2Xu3zlvDIlriuB1UJLbXE+O6+MZJmyxkDvdMFqekAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrIJRa5DICMpirf/LB5PEdUfORVQszClQsZCwNRwjsc=;
 b=xaWOYwwKSowPram4FiycVOcIBJ2H7v1XqTmFwxZI9EXW+pUlsKNnV1SCv0d39JWlTv1F1feAoPzN9TptkY2RUcWzIsJv/pjc/1kDCo4BQWp4uc2b+vBJbRE123y0vBhfJlcua4u9xZaKf/Af4ikDoq84erp6vItOXYG6OX6OH0TN46AgXsAFXy4XJgH304ox/5lBQe6bJj2aSgDJCVcYXU50PCyX/05W5n+cCJBc44lZTPGp/ZKdHFosbmwuqtcZtlaHhVXji/Knd5GOE/UjzIh3sJezFSIjdv3/eaufmAMSq74SY+XZJfw8OGk+cwOcT045rq56iZXwyUweJDjkDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrIJRa5DICMpirf/LB5PEdUfORVQszClQsZCwNRwjsc=;
 b=ayZNvMurp0ZumgeZ6LFacIb3AHQBW7UXK88cVX0Mnr/oO4DYIQ8q8lH7YZrW4PifvMPwF8679lPViGZWt0Q9Ku4aDgmKrpr1+rpo9HjKx8f5hnib2aWKTFrDxSXK5/PtHLReeJzscx6plBV5hjjtQAJjrFXvIMIS3oABmoK30pvU3kYlBNOWB8e472Aw6XMFb5aqGw8YLQxHvwhknCNfU1clDBLiZw4ED3wYxelJ3ftLX6LZPqNk8+ls/tlheAcdQDx4sZ2OnRWZl2rmS58o9lSXfO5lm3nhOcaXV1PzJTJmbdmfytqSYIo3wtPbChNd15tGH1TYp03IgSXjqOIIzw==
Received: from DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a9e)
 by VE1P189MB1008.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:167::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 18:58:22 +0000
Received: from DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
 ([fe80::48a0:eb8a:db1e:38bb]) by DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
 ([fe80::48a0:eb8a:db1e:38bb%7]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 18:58:22 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] gmp: add ptest support
Thread-Topic: [OE-core][PATCH v1] gmp: add ptest support
Thread-Index: AQHc3SxxrA63AqOjH0mvBNDrKLwOh7YBLeaAgAAqmSI=
Date: Wed, 6 May 2026 18:58:22 +0000
Message-ID: 
 <DU2PPFB77F8FB19A906AB76BF556089CCF3FE3F2@DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM>
References: <20260506074618.15882-1-pratik.farkase@est.tech>
 <DIBQB0RVEATG.2C6WJ1E87VNPL@bootlin.com>
In-Reply-To: <DIBQB0RVEATG.2C6WJ1E87VNPL@bootlin.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PPFB77F8FB19:EE_|VE1P189MB1008:EE_
x-ms-office365-filtering-correlation-id: b9563e01-0705-499b-a70b-08deaba1721e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 0whSpI7FxaCQJxKsvR+V2PTc5Im2nVrK7XzXE4WI7lGm1si4syCjs9rsKTdMMJ5XYx7o00zdvgeHec/OwRtRiAOyljgSR/6Btq6c0Lp23lMaa12ZsLM01V0/FEluDwLvn+qkvqEeCpllhbtQtzitaYqBkuhpJq9GrPtP1Bac+4F8cJP1KJLjDRaCbJcQVY+nsuP4idayDvJ9hOr22qWbSy+smCtg1kNmAwb0VYndWjPzgpgDy/uKz98VdutTyrDRW3VzihP/ML2hzdEDePyr0dMP9THS4Lpr/0Ha+O4D5E2Bg88ebmnYr0ldKcuc09YFlBEdgom+Y5KMBCRvsgV14mfDxiAeg9b7mBI13BX1mMQj0Z4MhD/Bi8QVDAFjI2Nt/CMYeCv6sQtwr7S1SNDFwx0qqqd8KHz2Ml8iB3ldmWKYb4YNnYFt16zG22S7cTANOTCxWrhi9Pz+rQ9NLwr4H89DlKTyH9GA/Vm8id1RJcPuPmZKUeAVr92+v3mIP365d4dLF+4Z73pMaEzJoJ6FHytMxmo553BVi+MPVJoCfnyPi3ut8FIi/j389i4prb1qoXBha8NbY4lY+ewc4VEX/JcTpAzphcPfpjbDdV/GH7DFoF9QDXDC3pULMrvddAQczi0dNgSjteJ5cCPp0R3SYSvAUVDEy8f6AiRDJGYnU/W7notTEFlcs0X0hQPBIyw2
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?lbi1D6hURPHzDDPIwiOt7RghAtikOq5I1buLJuKvj45BTf24bdD+n/IdVJSS?=
 =?us-ascii?Q?c42o7KcSkKEsCQDWqzLlGzkB3HSk2lhAkIHJtur7oyV7xYD7O56QONJoTAFC?=
 =?us-ascii?Q?qYzuqcuC7iLfdhQwXyj+M8sNrsSBgQCrjNrwPcJreTBRJmGiCmDyCIR+eeev?=
 =?us-ascii?Q?5UITKkHbvmWVLvhRFVlho8dIVrm/AlBheJ0BZ1XuksyqJcaFEMvIa4pfWYuT?=
 =?us-ascii?Q?FQdnCIsXuni1cNGdxZs8M6RouZlzfNl0NqfHFS0BKunGLO3zTJ5CKOFiZ6rK?=
 =?us-ascii?Q?PouXOm4BM/UYcjORZbjUMKXyttHN/+EsNDmOtqs8lXIKHO8d/PHTSpDp3yLI?=
 =?us-ascii?Q?yiZ0HNy1IrZZM8L+5282/z0KXdzlJ/zrm6auKHcWn7SAwWi/BVr4CH6PnmU6?=
 =?us-ascii?Q?/6Sf5uDLcHEmp+9s+VEXFpwCPnI4UZspNmbIDG/z+aJFFoBNdRi1lm7+JPAj?=
 =?us-ascii?Q?ZUdZOBPHJITinszDoJimiUQE6mkx2QM0+iGCvHejJif1X6kmfNBDAPbTPw16?=
 =?us-ascii?Q?TO52tPBfbJd4yAONOTdQ8km250h+vW0wueRf1HDc1OYdg5WKMxcxN4DIxz4B?=
 =?us-ascii?Q?aegU+cEZhl9QYlUla+LykVVZWzJNd2TOoazSPY2jsTgSVAk22qyvHFbkL2s3?=
 =?us-ascii?Q?6Fwe2yfhxR/CnKpOXK7q8CUDkrjL4N8X2D1YD3At2xRuBLKIPHtR/DRtepL1?=
 =?us-ascii?Q?PxDc00wG6tmhpSJTO79IG6mZR2DSvqgq3peA+BB53BZPI3Ch1yaeHaMiRipj?=
 =?us-ascii?Q?wkPfdZctHyd3OZEKKp0WargxA+xHl+jveK/vyeAeAvIoquVNHu5SGXUsacIb?=
 =?us-ascii?Q?KgelkDTrcnAIBZs4BEKfcFi14+xAql+8HUNIn9sza65AoGCDHUBBlUIPhE+f?=
 =?us-ascii?Q?LNcmCT2arn3/b52wcKqz/bUPDst9DUufPxw2NrHFyfRBfpxUXdU1ipk+HS7k?=
 =?us-ascii?Q?A+UZfkzZJWDkFYnhEyghEEyXL/Rsv89jLBAHhbLzqcsdozER7QphJIPy5DBa?=
 =?us-ascii?Q?cY7YxxAq6mtRqWMQYUnVYgMcnjPl/eR563ZuuXRZiVo/4ivrQqgXj8hWCmaR?=
 =?us-ascii?Q?JsUAIFe8jrmPawHaOjDv7ahbSoBk//6huLqvkt+qf2JcnmRymKBgYN3giQPL?=
 =?us-ascii?Q?p1nxvPBcgiGIM0ToC1E6rgAudeVsfpc/mXonTkOfNWhHw7CABDg/PfbJQrvo?=
 =?us-ascii?Q?UHOGa4/Ac1TkrSbBZoJoxBhnnLCZ52+HUUiHPxG92jhWrMQPnvdEXv8w0ot4?=
 =?us-ascii?Q?yw1n10zny+4hqrX1X5TAX4AwNfpuKykBq1d/2dYcfn+5kpesIQJfSRMMYIze?=
 =?us-ascii?Q?JPqTJV0f9ws8Th32pDWVl4omK8wVLxmmiLtbl7+KwsQqBxeRjCDYYQewU9k/?=
 =?us-ascii?Q?THJ/6Sa+AQZeo9tOUeTHw2w7pU7bopqufRN4nQmk49g1p1+14WdaOtk1fm1q?=
 =?us-ascii?Q?9zPP9Hy9Tfn2+b+5r74M3VNNFlTEDkDB9pbDpGf8/oRMTFkWPJo8u7II2ba/?=
 =?us-ascii?Q?sZBOJfwZ80xenz+2gqgj0hvA4f5mbkqLY+P9LDbMiq5gt9Jq0lpjeyQ6bVLE?=
 =?us-ascii?Q?ggnx85oHvka20qxPAgm6HzvcPTitJR4S3W1y+Q5YaCWrjsiwK9FYCAtxQ9oW?=
 =?us-ascii?Q?cpog6iH0PVO29Mkkh7wZyb9XhA5+pjgKJMO2aC0lPjHikLafC9glWHDz0e7Z?=
 =?us-ascii?Q?drRzBsLRG85OAgEDCL80f7CRtdag3U68pPGMsg5NMzlg4LTRBodb1nkDsnhp?=
 =?us-ascii?Q?7DtOVjmMlQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b9563e01-0705-499b-a70b-08deaba1721e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 18:58:22.5839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N+I9yzSzFOZAphR1KpT077uNEGbgznFV9i5pYb1FDc+j77uTC/ejpa+LuTs4tg1jeov87R4Ve2QtGIXuDKlNHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB1008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 18:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236550

Hi Mathieu,

  Thanks for catching this. I see that one test "mpn/t-addaddmul" is failin=
g only for qemuarm64 and qemuriscv64 platforms. The issue is that mpn/t-add=
addmul exits with
  code 77 on architectures without a native mpn_addaddmul_1msb0
  implementation (riscv64, arm64). Exit 77 is the autotools convention for
  SKIP, but the run-ptest script was treating any non-zero exit as FAIL. I =
appreciate you catching this as my test setup has qemux86-64 as the MACHINE=
 so i did not see this test failing there.

  I have sent a v2 with the fix to handle exit 77 as SKIP.

Best Regards,
Pratik

________________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Wednesday, May 6, 2026 6:19 PM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v1] gmp: add ptest support

On Wed May 6, 2026 at 9:46 AM CEST, Pratik Farkase wrote:
> Add ptest support for gmp, running the full upstream unit test suite
> (200 tests) covering mpz, mpn, mpf, mpq, rand, misc, and C++ bindings.
>
> Tests are compiled with 'make check TESTS=3D' to build without executing,
> then installed via libtool to the ptest directory preserving the upstream
> subdirectory structure.
>
> Tested on qemux86-64 with ptest-runner: 200 PASS, 0 FAIL (268s).
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for your patch.

I believe we are seeing some failing tests on the autobuilder:

AssertionError:
Failed ptests:
{'gmp': ['mpn/t-addaddmul']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1552
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/367
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1553

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20260506-64/testresults/qemuriscv=
64-ptest/core-image-ptest-gmp/
https://valkyrie.yocto.io/pub/non-release/20260506-64/testresults/qemuarm64=
-musl-ptest/core-image-ptest-gmp/

Can you have a look at the issue?

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


