Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB16C43334
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 02:46:22 +0000 (UTC)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com
 [68.232.152.246])
 by mx.groups.io with SMTP id smtpd.web09.3378.1657248372546391273
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 19:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fujitsu.com header.s=fj1
 header.b=GXC/Okbb;
 spf=neutral (domain: fujitsu.com, ip: 68.232.152.246,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1657248372; x=1688784372;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Ld1/mHbtC12BHkY1JplZfs3xvfPCEnyROC9yuFp4INE=;
  b=GXC/OkbbYVkcFp/Y40jT4G8OF+qYD/qfDJmvt8DRgXgnzoQyzgi5MrXf
   MiLGkrXmRuR5N/djjviHYdYAxYFLHEvQ0TEI1xijNqVsZz7VzFxWR0aV/
   hAvxBHHLlsa+c+bcjv8tr8UpV0hJZhRRHMzHuyi7IhydOfKTtoy75nYds
   jC2rcw5rjcyUJkffrKSgTEorL/PrnAcTqs4lY3UxhBU2h9lZSQbDVSC+a
   gK1aDgRNY1VMQI7ZN3N/cSUzmDCrsQcA8ltQ20auKf2x1tXYaxtwLoPOu
   1Z98R7hGBiBRFwhG289XVYRFTJD9DSE1ZKiKKSh+HRyvwIGjknPqy97KT
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="68157088"
X-IronPort-AV: E=Sophos;i="5.92,254,1650898800";
   d="scan'208";a="68157088"
Received: from mail-os0jpn01lp2113.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.113])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 11:46:09 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGIMz2psIWtMwEBq2gf9XLM7QFtDCvhL3Yb5pi0DoOCR7RKsJEcoIzSeqgFOLkdY2zYEkxx28D1skh9kuv29n+AR6EEC+rhHLpEM7MrYfzaQqY1crtsgfYt3Xh+wN9NE6NGKMiTIjXwji2fdZUw4gyqhMzxuu9kwhOseCivMXi3K56PSX4eCOdv0SuQ9l4bRTmzk6GNZ9w9bKGns9UDvU+rzJTZ4Nv+PY9xuTnoO5FlUA5mE629BZ9kS4bD0ZB6EeY8VCNfmCQZkZTnETP3hORbEoSBrgr9EWPmI8umUVu8aQfvpynaDQvTgmBnJRzey2JIwHRXkQkfvdarUvmCN5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ld1/mHbtC12BHkY1JplZfs3xvfPCEnyROC9yuFp4INE=;
 b=CNIhuH36mdfIJXNA/ApaIxJPeEffqFI1bpLm7CBbhwZ0SZssroNOzfQn/RQXOM2x0oi64nLy5jl1k9S2mLRwprD+yZUsGcnTHrNXTr/xLHQqH2kQwMqfpwWUo1bhM2VdPkE732Zfy82hG8Ck0DTi+8ng/OYmzGL5QgOxV2p+MP8MLgy/zmSCzH1gA7iwJXYvOl6VSAlV2bV8wSNBTg3qxdezJYQnqLTQdWwqrpsBPLvReiNqro8Vru1mf9sz9+TZAYnvJvwBZzvOIz7kzJ0mwYryeMsvuTNUJab2yU1UDr2IkeqmO+mj3+dDpvQ5aNKe7mZ6b5sNxtytpRHEO8MFWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ld1/mHbtC12BHkY1JplZfs3xvfPCEnyROC9yuFp4INE=;
 b=DCGgI/gHaDYAQzB9g5gqIGvAychgPex1nNdlQiOScMvnVF7MwRAVI1SuUfczvlD4RUI4QM7BmSs3SM9wBYR4YFWWO928UEy2gvz8oTYidYQh5IZHyNz2bdgCMJbTC8FYkFi0kARoOysLR+8VhGoulfARvsrjb+r7L/kMEaY1I6M=
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by OSBPR01MB3512.jpnprd01.prod.outlook.com (2603:1096:604:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 8 Jul
 2022 02:45:44 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::35a5:7a16:e935:822a]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::35a5:7a16:e935:822a%7]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 02:45:44 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: "Chen, Qi" <Qi.Chen@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] Question about nativesdk-qemuwrapper-cross
Thread-Topic: [OE-core] Question about nativesdk-qemuwrapper-cross
Thread-Index: AdiQ6Emp1+TO49DUQvOutr2UU6Cf8wAMDqCAAB9Ii2AAAs6JoAAM9hhw
Date: Fri, 8 Jul 2022 02:45:44 +0000
Message-ID: 
 <OS0PR01MB61781AF3963D1AF9D95790FBA0829@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: 
 <OS0PR01MB6178C500A5157ED31549D49DA0809@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <8b13b18a7aa7568fc234d58e5871cf9adb3debd5.camel@linuxfoundation.org>
 <OS0PR01MB61787554070A3029E0F3C518A0839@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <PH0PR11MB5611356C578CCD2075DA618EED839@PH0PR11MB5611.namprd11.prod.outlook.com>
In-Reply-To: 
 <PH0PR11MB5611356C578CCD2075DA618EED839@PH0PR11MB5611.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NzBhNGVjNzMtYjQyNS00MGIyLTlhNGEtYmNkM2E0OGU1?=
 =?utf-8?B?NDljO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMi0wNy0wN1QwMDowODoxM1o7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee0178b8-8414-4167-2319-08da608bf45b
x-ms-traffictypediagnostic: OSBPR01MB3512:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TqGp9XJ1GlyF5W4sF2MczTtsiY/sgitX5RK8QvhU/GKW4ZqfQM/RuA2WXRHJhK1FMfAPRdyIQgXog94NDufBeYdkxfPbnV1eWUCwhV41BTsWWmDJl8sk0//mOKnogzdTFtITMZY0PwNu+U7/2m4BU1GPDZf7wukK7Pprnv20pUN2v7nkTPyM0cqXdZnWPN6AhVtd434U/J55dRq1GfBW05QIJA9N/Pgy1/FTBBjoqJ/dIsfhfHTltIrKd+xcRlVA/aqmzpd3hf16GeYhBo8zlnpKrKA2cgG6M+I4PnmYLZpH9vlob7TKjysPagxt7fRv6x8Lg4wvpLucLbQuPxySN1X57FozHblbO0Z1btE9+T3DAn108/ElOgZwTt5lzlIyaHZq0EYzo+0Khe3FG5XG+aS2Npy2MMLDKzhXCownZB2v4553L/tEMSzMdbYc6fOL8wS+fX2qqLMRQzMuK3YTEZc1B+6hBxmHszlNEhwybCjXMZByAuiMTdB0oNGk8rJ0009WTQ3XTyvJ94rnGPNOEq5k5l6AD6m8B99RMeqEnFrISVLO6h3h/tj+/VHoua3nsbRqSnxCwFh/g49cZO4GbUV56Q3jvMXdO7rjoLXrdoLSZMfB73RxeHoY7s6D1A22tQfW75TFno37FdefEzJ0yyMRrIMZn2df77K4HoGKFmLNO0nMP6Soor8x+45ncwLT7p3uqPhvQOcaUXrFYQDKWTuoD57b0wlwJA1IxuMHqyiHvrYR17VxYIAUU6l27A7gOS4DG2u5kbwS2xlnpkbCdZi2Lr3cgulzsKNwXWdW5BSNrn9T7uPeFZMjiudbt1aV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(8676002)(64756008)(83380400001)(2906002)(66556008)(66446008)(186003)(8936002)(66476007)(55016003)(33656002)(85182001)(76116006)(86362001)(66946007)(110136005)(38100700002)(9686003)(122000001)(38070700005)(5660300002)(53546011)(82960400001)(478600001)(41300700001)(6506007)(52536014)(26005)(7696005)(71200400001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Q0RnL3Rpa2s5eXY3eGNNVk1yVDEzaTRyMG4zc0RVaFJ4b1h6RG9McnlWY3dZ?=
 =?utf-8?B?K3c2Vm1NSlQzaGpNTzZUTnFIRms0VUxoV0NkNW9vaUszdWtSempobXpiMHh4?=
 =?utf-8?B?MDhtN01VWGtGaVJhMWtvYWFDc29hSEhCZWovK1ZQR2p1R3VnVDNteURZVFlT?=
 =?utf-8?B?L2FFQVk3OWh3cTZTSVN0SXlHem9SYklWcXFkc0M0aW5TVnYrTDJPa0t5Qzk4?=
 =?utf-8?B?OEJPakNmRXZiRy9MMG1ONStPblJrU2Z5YnZEcWo0QzVDRW1PNkY4akkvWlY2?=
 =?utf-8?B?MDRabTQyemtnYmZibVluM1gzVUlENjlaWkV3N0JGckRyMCs2OVJGYjBCUTBF?=
 =?utf-8?B?YzdEZ0dVeDhob2dIMnQzS2syUElobTdJZkEwWlVyb2NxV1Fkc2dxT0xSNWoz?=
 =?utf-8?B?T1pNTUpIa3BiNnhvbzd5bTBBWEtIQURVeUx6cytFa3lSaUJ5ck51YVY4Z1J4?=
 =?utf-8?B?aTUvQlNyV3NvV0ZxZ0FwSmNkNHNoVHZlb3NVT3N4bUExYlNBQWVNVUV3S3o1?=
 =?utf-8?B?QWFaOGlWbXdnQVZJVEFRVHM2K0lyQ3pwMXlTWkNaVmljYmE2Q1hUUkZaRmtZ?=
 =?utf-8?B?L2VMcXJnRThEU04rL01wdEpmZllVNjV0aDdieWtpMEUxcFRmMk5KUXl2bnBr?=
 =?utf-8?B?cDB0N0s2WnFnTHZ0RzB2eGxhdDZhUTNxN1VHN2VISGJ0Y3Q3cElmb00xTnZz?=
 =?utf-8?B?WnJmVHhsejVqL1N3UnowVlRzYkRjTk81Q3R3ZUpGdDczclVyUHhpWUpXUmtJ?=
 =?utf-8?B?SjlYcHQxYUJ1NGU0enhpZXV2SkJiNEdyRHY2RGRjTXZSaG9FMy9mdFlwUHhY?=
 =?utf-8?B?eGVPOWZsMVJwcXdZRVZtaXN1Y0xCNFpKQmtHMFFzT2dEUjJiMEVvZHMvbHpF?=
 =?utf-8?B?SjR3eXAvdzE1UVpPRC91SHJGZWZheUluQUZObkZvMjNkcnpGd1VvOXJDS1JY?=
 =?utf-8?B?T0dwd3Z2TkpYdGl4Rkxnc3kxY1ZsOTZMSXFrU1VDUUg4YzloeDJ2RmZ2YWNG?=
 =?utf-8?B?RWl0WUNsd0U1YTJ2U0toTGRxU1k4QmdhWWhoTWMzemk5TWJBQzF3SGRYbGJ3?=
 =?utf-8?B?eVBCYzJ6MUlaaDdIV0FURk5Sc0hnbkh3dFFsb1dWck5TUTJBSkY1dFhuSG9o?=
 =?utf-8?B?ZVAxUDNuN3pHTjBQa29PV0FkV3dTQlJ6ZlNYNVVKNkdrR0QwVjdOSDVGV3BE?=
 =?utf-8?B?UzBkNzUySGpBbkd4OFQxNEhxd2JBYVJpaWFaVjhpNmRCK3dqdmxYalVKci84?=
 =?utf-8?B?emZsYlJqem8rdHpyZlFSRWJ5TktjdTNGbmFmcllENVh5SkllVXpwK2psU2Ft?=
 =?utf-8?B?anZiZzBFTEhYeGdVU2FwWFArS09BMVpXWU45SlBsUi9HL3ZScGM4aytwellW?=
 =?utf-8?B?MVNMRmp1RFZpRzJWWW5pTS9BZUVWQytqT1R6dmRobGx6K0FqcXNjTUp6TW44?=
 =?utf-8?B?U1JvMFUyNHJveG1Lc1Vud3VQNXR6d0ZtOWRyUllYcUMwRXN4QW1NeVhhWFBD?=
 =?utf-8?B?ek92c2FlaE5tSzkraFFqbHBldWtBcUl1VEF3Z0xUYkRpMHhvM0V1WWNhZkVX?=
 =?utf-8?B?Y1Q1enFPMitTWjJEdi8vSDBMbmZ3SnVBaGZpd0xOUDJQOXF0bDJla2ZFbTRF?=
 =?utf-8?B?QTgxdjBhanpnSmZKYVNockdQOXFwVWRkeDNwcGxlSUxRRCtOVEVxNnFFVjhR?=
 =?utf-8?B?M0d6cmhNUTNRaDNROFBrMnE0MVY0NmZoemVQRzNOVVFsSU0yM0c1S216ZWQr?=
 =?utf-8?B?cCsyRWhhcVVTT1dMZ2thYVl2OGcyb3hOMk9KbTdabmRmaGJpMGg1N2tWT01D?=
 =?utf-8?B?UHJSSE1ROGRPQ0hZc3JLc0VjNWVOSHVvY3NucFpjSk5GSmJ4aDloeUdKbkkw?=
 =?utf-8?B?aC9PR2dZMnBJTXhnMFkzeGxnSm0rcGQzb002cXFLODZycFE5K3hOcXdwVUwy?=
 =?utf-8?B?dFFuRk9RWGtzbmFhVjNDVC9zVkxqdjJORTFHck0yVlBnVHJpQnJVSFZYOVRY?=
 =?utf-8?B?Z1QvZ3o1Y1h0TTdCS3RndHNWY3IwZ0VocU5kSG9SNHQ5YnJVbEZ6cXNFd2Yr?=
 =?utf-8?B?YUY5b0lPb2Y4L0h4Smd5bVkzZkFXTGdBendCcTlldUpubVBlKzRpK2hQN0xG?=
 =?utf-8?Q?OoI7GWwS8kCse5YYbdQ5LzoBb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ee0178b8-8414-4167-2319-08da608bf45b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 02:45:44.2055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 SJ2RY7vAr7421ZeHOtb4RcEUL/BM/YWB2zS56ORS90VuDg2FPJ/lGWtSf39DytdLD5BLNeYJvchZjORSiBjQWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3512
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 02:46:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167814

SGksIFFpDQoNCj4gQXMgZmFyIGFzIEkga25vdywgcWVtdXdyYXBwZXItY3Jvc3Mgc2hvdWxkIHdv
cmsgaW4gc3VjaCBjYXNlLiBZb3UgbmVlZCB0byB1c2UNCj4gcWVtdXdyYXBwZXItY3Jvc3MgaW5z
dGVhZCBvZiBuYXRpdmVzZGstcWVtdXdyYXBwZXItY3Jvc3MuDQoNCk9oLCBpdCBzZWVtcyB0aGUg
c29sdXRpb24uIENvcnJlY3QgcWVtdXdyYXBwZXIgc2NyaXB0IGNhbiBub3cgYmUgYWRkZWQgaW50
byBtZXRhLXRvb2xjaGFpbi4gV2h5IGRpZCBJIHBheSBhbGwgbXkgYXR0ZW50aW9uIHRvIG5hdGl2
ZXNkay1xZW11d3JhcHBlci1jcm9zcyENClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgcmVw
bHkuDQoNCg0KQmVzdCByZWdhcmRzDQpMZWkNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IENoZW4sIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQo+IFNlbnQ6IFRo
dXJzZGF5LCBKdWx5IDcsIDIwMjIgOTozMCBBTQ0KPiBUbzogTGVpLCBNYW9odWkgPGxlaW1hb2h1
aUBmdWppdHN1LmNvbT47IFJpY2hhcmQgUHVyZGllDQo+IDxyaWNoYXJkLnB1cmRpZUBsaW51eGZv
dW5kYXRpb24ub3JnPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBTdWJqZWN0OiBSRTogW09FLWNvcmVdIFF1ZXN0aW9uIGFib3V0IG5hdGl2ZXNkay1xZW11
d3JhcHBlci1jcm9zcw0KPiANCj4gQXMgZmFyIGFzIEkga25vdywgcWVtdXdyYXBwZXItY3Jvc3Mg
c2hvdWxkIHdvcmsgaW4gc3VjaCBjYXNlLiBZb3UgbmVlZCB0byB1c2UNCj4gcWVtdXdyYXBwZXIt
Y3Jvc3MgaW5zdGVhZCBvZiBuYXRpdmVzZGstcWVtdXdyYXBwZXItY3Jvc3MuDQo+IA0KPiBSZWdh
cmRzLA0KPiBRaQ0KPiANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8b3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIGxlaW1hb2h1aQ0KPiBTZW50
OiBUaHVyc2RheSwgSnVseSA3LCAyMDIyIDk6MDQgQU0NCj4gVG86IFJpY2hhcmQgUHVyZGllIDxy
aWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFF1ZXN0aW9u
IGFib3V0IG5hdGl2ZXNkay1xZW11d3JhcHBlci1jcm9zcw0KPiANCj4gSGksIFJpY2hhcmQNCj4g
DQo+IFRoYW5rcyBmb3IgeW91ciByZXBseS4NCj4gDQo+ID4gQSBuYXRpdmVzZGstcWVtdXdyYXBw
ZXItY3Jvc3Mgd291bGQgcnVuIGJpbmFyaWVzIGZyb20gdGhlIFNESyB1bmRlcg0KPiA+IHFlbXUs
IHNvIGlmIFNES01BQ0hJTkUgd2FzIHg4Ni02NCwgdGhhdCB3b3VsZCBiZSBjb3JyZWN0Lg0KPiAN
Cj4gT0ssIGl0IHNlZW1zIHRoYXQgSSBkaWRuJ3QgZ2V0IHRoZSB1c2FnZSBvZiBuYXRpdmVzZGst
cWVtdXdyYXBwZXItY3Jvc3MgZXZlcnkNCj4gd2VsbC4NCj4gDQo+ID4gSXQgc291bmRzIGxpa2Ug
eW91IHdhbnQgYSBxZW11d3JhcHBlci1jcm9zcy1jYW5hZGlhbi0ke01BQ0hJTkV9IHdoaWNoDQo+
ID4gaXMgc29tZXRoaW5nIGRpZmZlcmVudC4NCj4gDQo+IFRoZSBwcm9ibGVtIEkgaGF2ZSBpcyB0
aGF0IHdoZW4gSSBjcmVhdGVkIGEgcm9vdGZzKGFhcmNoNjQpIHVuZGVyIFNESw0KPiBlbnZpcm9u
bWVudCBieSBuYXRpdmVzZGstZG5mLCB0aGVyZSB3ZXJlIHBvc3RpbnN0YWxsIGVycm9ycyBvY2N1
cnJlZCB3aXRoIHNvbWUNCj4gcGFja2FnZXMoc3VjaCBhcyBnbGliLW5ldHdvcmtpbmcpIHdoaWNo
IGluY2x1ZGVkIHBvc3RpbnN0YWxsIHNjcmlwdCB1c2luZw0KPiBxZW11d3JhcHBlci4NCj4gU28s
IEkgYWRkZWQgbmF0aXZlc2RrLXFlbXV3cmFwcGVyLWNyb3NzIGludG8gbWV0YS10b29sY2hhaW4s
IGFuZCBob3BlIGl0IGNhbg0KPiB3b3JrIGFzIHFlbXV3cmFwcGVyLWNyb3NzIHVuZGVyIGJ1aWxk
IHN5c3RlbS4gQnV0IGl0IHNlZW1zIHRoYXQNCj4gcWVtdS0ke1NES19NQUNISU5FfSB3aGljaCBu
YXRpdmVzZGstcWVtdXdyYXBwZXItY3Jvc3MgcHJvdmlkZWQgY2FuJ3QNCj4gd29yayBmb3IgYWFy
Y2g2NCByb290ZnMuDQo+IEkgaGF2ZSBubyBnb29kIGlkZWEgaG93IHRvIGRvLiBTaG91bGQgSSBh
ZGRlZCBhbm90aGVyIHFlbXV3cmFwcGVyLWNyb3NzIHN1Y2gNCj4gYXMgcWVtdXdyYXBwZXItY3Jv
c3MtY2FuYWRpYW4tJHtNQUNISU5FfT8NCj4gSSB3b25kZXIgaWYgeW91IGNhbiBnaXZlIG1lIHNv
bWUgYWR2aXNlcz8NCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBMZWkNCj4gDQo+IA0KPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQu
cHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+ID4gU2VudDogV2VkbmVzZGF5LCBKdWx5IDYs
IDIwMjIgNToxMiBQTQ0KPiA+IFRvOiBMZWksIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29t
PjsNCj4gPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gU3Vi
amVjdDogUmU6IFF1ZXN0aW9uIGFib3V0IG5hdGl2ZXNkay1xZW11d3JhcHBlci1jcm9zcw0KPiA+
DQo+ID4gT24gV2VkLCAyMDIyLTA3LTA2IGF0IDAzOjMxICswMDAwLCBsZWltYW9odWlAZnVqaXRz
dS5jb20gd3JvdGU6DQo+ID4gPiBIaSwgUmljaGFyZA0KPiA+ID4NCj4gPiA+IEkgYWRkZWQgbmF0
aXZlc2RrLSBxZW11d3JhcHBlci1jcm9zcyBpbnRvIG15IG1ldGEtdG9vbGNoYWluLCBhbmQNCj4g
PiA+IGZvdW5kIHRoZQ0KPiA+IGNvbnRlbnQgb2YgbmF0aXZlc2RrLXFlbXV3cmFwcGVyIHNjcmlw
dCBpcyBsaWtlIHRoZSBmb2xsb3dpbmc6DQo+ID4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+ICMgY2F0DQo+
ID4gPiAvb3B0L3Bva3kvNC4xK3NuYXBzaG90L3N5c3Jvb3RzL3g4Nl82NC1wb2t5c2RrLWxpbnV4
L3Vzci9iaW4vY3Jvc3NzYw0KPiA+ID4gcmkNCj4gPiA+IHB0cy9uYXRpdmVzZGstcWVtdXdyYXBw
ZXINCj4gPiA+ICMhL2Jpbi9zaA0KPiA+ID4gIyBXcmFwcGVyIHNjcmlwdCB0byBydW4gYmluYXJp
ZXMgdW5kZXIgcWVtdSB1c2VyLW1vZGUgZW11bGF0aW9uIHNldA0KPiA+ID4gLXgNCj4gPiA+DQo+
ID4gPiBpZiBbIFRydWUgPSBGYWxzZSAtYSAibmF0aXZlc2RrLXFlbXV3cmFwcGVyLWNyb3NzIiAh
PQ0KPiA+ICJuYXRpdmVzZGstcWVtdXdyYXBwZXItY3Jvc3MiIF07IHRoZW4NCj4gPiA+ICAgICAg
ICAgZWNobyAicWVtdXdyYXBwZXI6IHFlbXUgdXNlcm1vZGUgaXMgbm90IHN1cHBvcnRlZCINCj4g
PiA+ICAgICAgICAgZXhpdCAxDQo+ID4gPiBmaQ0KPiA+ID4NCj4gPiA+DQo+ID4gPiBxZW11LXg4
Nl82NCAtciAzLjIuMCAgLUUNCj4gPiBMRF9MSUJSQVJZX1BBVEg9JEQvb3B0L3Bva3kvNC4xK3Nu
YXBzaG90L3N5c3Jvb3RzL3g4Nl82NC1wb2t5c2RrLWxpbnV4DQo+ID4gLyB1c3IvbGliOiREL29w
dC9wb2t5LzQuMStzbmFwc2hvdC9zeXNyb290cy94ODZfNjQtcG9reXNkay1saW51eC9saWINCj4g
PiAiJEAiDQo+ID4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+DQo+ID4gPiBSZWZlcmVuY2UgdG8gcWVtdXdy
YXBwZXItY3Jvc3MsIGl0IHNlZW1zIHRoYXQgbmF0aXZlc2RrDQo+ID4gPiBxZW11d3JhcHBlci1j
cm9zcyBpcw0KPiA+IG5vdCBjb3JyZWN0Lg0KPiA+ID4gV2h5IHRoZSAicWVtdV9iaW5hcnkgIiBp
cyAiIHFlbXUteDg2XzY0Ij8gU2hvdWxkbid0IGl0IGJlICJxZW11LWFhcmNoNjQgIj8NCj4gPiA+
IElzIGl0IGJldHRlciB0byBjaGFuZ2UgbmF0aXZlc2RrIHFlbXV3cmFwcGVyLWNyb3NzIHRvDQo+
ID4gcWVtdXdyYXBwZXItY3Jvc3MtY2FuYWRpYW4tJHtNQUNISU5FfT8NCj4gPg0KPiA+DQo+ID4g
QSBuYXRpdmVzZGstcWVtdXdyYXBwZXItY3Jvc3Mgd291bGQgcnVuIGJpbmFyaWVzIGZyb20gdGhl
IFNESyB1bmRlcg0KPiA+IHFlbXUsIHNvIGlmIFNES01BQ0hJTkUgd2FzIHg4Ni02NCwgdGhhdCB3
b3VsZCBiZSBjb3JyZWN0Lg0KPiA+DQo+ID4gSXQgc291bmRzIGxpa2UgeW91IHdhbnQgYSBxZW11
d3JhcHBlci1jcm9zcy1jYW5hZGlhbi0ke01BQ0hJTkV9IHdoaWNoDQo+ID4gaXMgc29tZXRoaW5n
IGRpZmZlcmVudC4NCj4gPg0KPiA+IENoZWVycywNCj4gPg0KPiA+IFJpY2hhcmQNCg0K

