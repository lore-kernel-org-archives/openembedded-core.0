Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE661C05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 07:19:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.69196.1674199194941909154
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 23:19:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XQ9mPjsr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0384244ac5=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30K6KErv031477
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 07:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=n8YbFbhDM2iedtaj9vdaWLxENMOr0Y+RUp1bsxDKa7w=;
 b=XQ9mPjsrgIzlZEkqbk4MtZ5120KTl74tVw6sBBP5O0q8qmiHOez6gp1ddgadAPANzjfg
 SXVIVCu9ARwvkQkPbzQagsuW2OHFvhoVHCuwsMHWesn0cZIlohVCQVQiJC3bBfXfor5o
 qsRvAYRki/g+jpBlop2Agd9BWrN/p/RzEsR1YsU7yPzXa1XHUTCxTA7yysCPXeDKTxL1
 wztWY3oJYgnsuXZeccBGNPb+MptaPKRo6bcBh8Y2zjSu1Bo78OnyCUforQLYhBmQOHkE
 EjuEayLEGzQZMbSAtZEyiLVOPkR2m1+YRKnfFJUviQYleyhEVqPxnaMd3xcDbxmHq4LS UA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3jx6p7xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 07:19:53 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30K7Ha71006457
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 07:19:53 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3jx6p7xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 07:19:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8NVODm5jIpFx5udwsEOq7fwk30qbdAoX+XNEkk5aINzDMqFdUcmLoa6I5SzCRiNPnPcKkTsuS7K0IJM6dQ8hiJBr5qLct0cvFNRdikhqxutEImWouqzTCCsyqXRm68+UEhM8Yr0FGzBWuPyNPSNNDAthnFUKmnSWTiz76jdV3nuW5DzUrEQrPMu9nvtBjZaGv3Xet7vZqZqWGB8u2W7AJMZqwBdhxu+h59bUDcAx6G4ydTci3NRoF4l0r639+CW8VmjqyuFiMipZG4eQ7IknPI7jfEI11l3RDd6UpBustoCvQS7UDuy09MnLs1n0uBDM7FAD3cMrSyuecJ8Zir8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8YbFbhDM2iedtaj9vdaWLxENMOr0Y+RUp1bsxDKa7w=;
 b=DaiSHQmx8Mot6I7N+X1perQLwyzruBHKNDHAkv8o9luhaD58IqLRAImD0HrK/V5Yzc3W6/P4Y8HPgEbdHOMp5/WTuOT/f3HUB5bfr7Dlihz1feat07Ecprlx7GmMTvS0WY9LVJktauVDU4/d09j9QRe2RtX/XQwV8EFk7oVUTGLmOj5dIhN5iEfad3asWkhgRovFaOcMoAjSrwzUUhaWCu5JnFFBFYKU559DBUeIfJqU1Er8KN9IpM8C+5r+XwotlPHwFtlzHK31bIhU+tq032Wf8Igl7vgCkGBJTKJcn4Jo9WFslGgbsMHQv2S2tyJmpUbX3E5ZY5ToJNDUS7uoBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 07:19:51 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::7d38:cbb6:a886:3b70]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::7d38:cbb6:a886:3b70%6]) with mapi id 15.20.6002.026; Fri, 20 Jan 2023
 07:19:51 +0000
From: "Mali, Narpat" <Narpat.Mali@windriver.com>
To: Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>,
        "G Pillai, Hari"
	<Hari.GPillai@windriver.com>
Subject: RE: [OE-core][kirkstone][PATCH 1/1] ffmpeg: fix for CVE-2022-3341
Thread-Topic: [OE-core][kirkstone][PATCH 1/1] ffmpeg: fix for CVE-2022-3341
Thread-Index: AQHZLCpcNn0EW+2Gd0ahjCWN3iN61q6mAgQAgADk0bQ=
Date: Fri, 20 Jan 2023 07:19:51 +0000
Message-ID: 
 <DM4PR11MB5550B4811333589A33C5F63BE4C59@DM4PR11MB5550.namprd11.prod.outlook.com>
References: <20230119171657.656875-1-narpat.mali@windriver.com>
 <CAOSpxdaZKx5PYBWgzmQbjXdsYicsqksmjS52oXy7PMxa5iiNsg@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdaZKx5PYBWgzmQbjXdsYicsqksmjS52oXy7PMxa5iiNsg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5550:EE_|DM4PR11MB7303:EE_
x-ms-office365-filtering-correlation-id: 4323b9f6-e8d5-42e1-cbf9-08dafab6b862
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2YFrAi+OPxUNXzNAV/Jw5ZbLgjIBO6UrxV91vGwYyjTAME9vNLYuMHfZ4JbdQPAVGtjQqA7GwJW9Fskfu5Ku49zkoivBknXUG+XXJonqXbmsmgZZGLZVWXSGDtEXDaxhw0oOF+XmbjCcdnhSwxY38VEZ6OiouamROIxsxA5gy6m5mSe8CKii8UgsVw9NJPpWNqMyKfAvZgOEejb5QuBbI2A3doEQ9z/h3wk73hePxoI069bKI2c6hBTj3xx2EJq4j6nU6mjy8KV9+3UmUfN9BS9wIGkujY4a1uDbVQojAu2/pqXcChkQ5opv4EdeC2+qqtruLDpNXVAEzZh0ItJfdwr6SyGkRBF8ULd8lID/1wUn32JPxXHmnQr3mnwBaycoLm94xR60zDlj+yyJXLt70NMU4k9WpL7uJgt9QjNUHAEN8ojUjyUf//5bSauYF8+/1hDHgQZset3i0ofGwZ+TG95XCEo8ADKUCilh95yR0PGZvWxErbNK1d3kYK3nz6zkxpl0m/EQhTVG5fMSCG3VPPSZQ45Z3t+mSVkAvX7i3Varcxc2+n1H7y1Wvv54DuZuhDzTC9Ko4DRrT7vo1fQH/IcbCH/kzZZFAgExDeRtyNAU0VcFuVBrIauVFYQpEDfrs/gQY5TcV6uVPPEvaM9WKwPRbqKOCo4OfRv650GI+4EtaEiRFtZF2S7SRPlkT6ocnxo+a6+5x4uR2AlE4Owl9ElFHturM+mB6uocqkEebYlBjD2YjtedzfPd6YaJXWNwsTqR5VhoAtC3ALrsyqYUmdOBc1b9b29QVCXx8zxPf7c=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39850400004)(366004)(346002)(136003)(451199015)(66899015)(966005)(71200400001)(478600001)(91956017)(6506007)(53546011)(33656002)(7696005)(18265965005)(86362001)(107886003)(66446008)(66556008)(66476007)(66946007)(9686003)(38070700005)(186003)(4326008)(6916009)(64756008)(54906003)(8676002)(316002)(166002)(5660300002)(83380400001)(55016003)(38100700002)(2906002)(76116006)(41300700001)(8936002)(52536014)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Fd08taTTK39QNJPEvQY3WBvC9YQCmEk+6zO6w6zEXQAfqRZShJyyHCpjlM9g?=
 =?us-ascii?Q?gA0Y2h5kVa2Lr4JvdaQGEEnoLLQS8+H4KNRR32lAZ6YLGbmAFgMO2I2C93ig?=
 =?us-ascii?Q?dlVM1xGIWQo0aF4gtR2GiWnyd/URpvVOVkrN6TYsJ1jOo2HyEQzGMTNi/UuT?=
 =?us-ascii?Q?744Xh08LhYAwfN7IWXs+2CTKDvOKm4YMNog8M3bcF9RK6VBag5UnIXIoljQ/?=
 =?us-ascii?Q?C7spoGMQ89huSfpxsZ2QUk6f6QbD9xjjiyHJ7Z/n2eKRr70h+PSa+7wfSNC/?=
 =?us-ascii?Q?+2epgk3IPA80ee3hzfheQEqbTR+P6HQYAGW7bwyGhqIxlymlPKh97vX55bBN?=
 =?us-ascii?Q?mVVZP42r6ttIL9LqYbMIXKJwhWO+UUZVmFDKKODwJxLCtlfZQipSF+4OgpU4?=
 =?us-ascii?Q?ASdE+O9ApbJJogUNitJif5o/GrSM/m0fpOTtKswz0Y0V6Su9R3LfpRoj3ia2?=
 =?us-ascii?Q?H7jO47eRtIxL61F31Vy+CFLRNbsqOBhyIx+eeFaoqvXIQal9YOB83mdoAPOz?=
 =?us-ascii?Q?B6D867D405VYrna6yzfwOsaYdaNNREkh4ErahUxPGxXlszYrEHf9s4OjHlMT?=
 =?us-ascii?Q?751SEPLw78tEVIHc0XvR6ee1EQRlwgKzFqQygwkeIX8mhVCal+DU3Nan/T+B?=
 =?us-ascii?Q?knpP9UBCmYTHslup2ZzgRAlYByPRFW91B7XcDBNNrberOl5RjWI6KFc1rFyU?=
 =?us-ascii?Q?jXAFqI9EKex/xNHLuLo+Rtk56IPYBlL3y+2Fa8K75OfhFx+9KbLKy7ZTrRDc?=
 =?us-ascii?Q?pWHAC3nbNMbVtK4mjd8TxGmnaGDuEpcDVtjlm7ON6f7PK2UbbkJ3/0ZaWC8h?=
 =?us-ascii?Q?Oc83lxdqSiN1+mNbgP3ehUL+ES+q5qWVnFGBnPIJZHq0x225uNB0z6I+bNWW?=
 =?us-ascii?Q?rgLTTrl4nYQONr86ypC8Yj1nMz1W4PlOag5tACz1orlDubEEQYy0wEmMjny3?=
 =?us-ascii?Q?fgaE2pUPuKG89F1C+0wqv341rc58ir3avhUn5vm2AZk4/QTK1AlLqqUVAdPi?=
 =?us-ascii?Q?czzxPUl5PqnEWWkBozrnsXzZ4Wspe2ET8hyNOj55EqeAkJG/LONoJEpKua5B?=
 =?us-ascii?Q?d/AXsChqiDpeFAPlWLYSmjW8hNu/SxdNiQg6QyFSLIxILKxxda049lpzMWRe?=
 =?us-ascii?Q?M5pnNm9R7afBjmOAfrO1dBb8wQ+vocIRE0UnwbjVUMtFUTN6aJrKy3nxAgTl?=
 =?us-ascii?Q?XaDRxitza0APhDjO1nnNk/7r7J8ZahhneWI8t+ToYH5O0FqpD3LKWSWbnBts?=
 =?us-ascii?Q?EvjgygCJ0PnlytMmKlTJTxYWxBoDveL48WzGYrJ3Td0ulzFNSoIm4Vz2A3t1?=
 =?us-ascii?Q?OAsxanik29SVg+S8mWML48ySMyA+gj5qudZUr0TSo82elOpuYSrQVjGU7hBA?=
 =?us-ascii?Q?KaKVzyHNV+rngkygzF2AqEbbHJB69xqfqxzf7QxTNhfxP60gO0r5l0ohrzbp?=
 =?us-ascii?Q?iyzDk19UOzWvlbWbKJj2r2yNCnojbOyUTE/8eWOZdoOnBR98ly2t4P/6zapM?=
 =?us-ascii?Q?e7oZ+3Kp1aC+/SUjlDIjIv2Rq+AAPbWsEES4TGxJXwHV0XxnkIr7OwuMlbqj?=
 =?us-ascii?Q?u7syX1bU6Fi3K2KQpJIQAl2f+A5me05B8ivXTl6xmTobOEjB6qQNIG0LlAuZ?=
 =?us-ascii?Q?QYmcBQ0AnoucnGb/+mhYMYmjFzEs4Yaoy/jL5paLC4Snri8HCCqOBvWHQvMB?=
 =?us-ascii?Q?jokPVyrFT4lbYIxXm4PZaY3WLLM=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB5550B4811333589A33C5F63BE4C59DM4PR11MB5550namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4323b9f6-e8d5-42e1-cbf9-08dafab6b862
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 07:19:51.0195
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TW0KFfZgAiq2FfE9N8LyLz75d4JnSw3H3KPzWmK7sOcZatwcdohgCw24xCNPmfg7k4c54GHU8SCe8DVcbO0L/BcFcsu5xuzpNJV9F9DoDqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
X-Proofpoint-GUID: svj47xM83mem1f_KPtrNT4srAiQ0jjwy
X-Proofpoint-ORIG-GUID: DwZrIa-Gz7WxHUVbMTUhLxJeFySubaln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_04,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 07:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176180

--_000_DM4PR11MB5550B4811333589A33C5F63BE4C59DM4PR11MB5550namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sure, Steve.

Best Regards,
Narpat

________________________________
From: Steve Sakoman <steve@sakoman.com>
Sent: Thursday, January 19, 2023 11:10:52 PM
To: Mali, Narpat <Narpat.Mali@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Polampalli, Archana <Archana.Polampalli@windriver.com>; G Pil=
lai, Hari <Hari.GPillai@windriver.com>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] ffmpeg: fix for CVE-2022-3341

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Thu, Jan 19, 2023 at 7:20 AM Narpat Mali <narpat.mali@windriver.com> wro=
te:
>
> avformat/nutdec: Add check for avformat_new_stream
> Check for failure of avformat_new_stream() and propagate
> the error code.
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>  ...ec-Add-check-for-avformat_new_stream.patch | 67 +++++++++++++++++++

In the future please name CVE patches with the CVE number, i.e. CVE-2022-33=
41

This makes it much easier to see which patches are CVE fixes without
having to open the file.

Thanks,

Steve

>  .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
>  2 files changed, 68 insertions(+)
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-n=
utdec-Add-check-for-avformat_new_stream.patch
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-A=
dd-check-for-avformat_new_stream.patch b/meta/recipes-multimedia/ffmpeg/ffm=
peg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch
> new file mode 100644
> index 00000000000..41d5884f880
> --- /dev/null
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-chec=
k-for-avformat_new_stream.patch
> @@ -0,0 +1,67 @@
> +From 9cf652cef49d74afe3d454f27d49eb1a1394951e Mon Sep 17 00:00:00 2001
> +From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> +Date: Wed, 23 Feb 2022 10:31:59 +0800
> +Subject: [PATCH] avformat/nutdec: Add check for avformat_new_stream
> +
> +Check for failure of avformat_new_stream() and propagate
> +the error code.
> +
> +Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
> +
> +CVE: CVE-2022-3341
> +
> +Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/9cf65=
2cef49d74afe3d454f27d49eb1a1394951e]
> +
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> +---
> + libavformat/nutdec.c | 16 ++++++++++++----
> + 1 file changed, 12 insertions(+), 4 deletions(-)
> +
> +diff --git a/libavformat/nutdec.c b/libavformat/nutdec.c
> +index 0a8a700acf..f9ad2c0af1 100644
> +--- a/libavformat/nutdec.c
> ++++ b/libavformat/nutdec.c
> +@@ -351,8 +351,12 @@ static int decode_main_header(NUTContext *nut)
> +         ret =3D AVERROR(ENOMEM);
> +         goto fail;
> +     }
> +-    for (i =3D 0; i < stream_count; i++)
> +-        avformat_new_stream(s, NULL);
> ++    for (i =3D 0; i < stream_count; i++) {
> ++        if (!avformat_new_stream(s, NULL)) {
> ++            ret =3D AVERROR(ENOMEM);
> ++            goto fail;
> ++        }
> ++    }
> +
> +     return 0;
> + fail:
> +@@ -800,19 +804,23 @@ static int nut_read_header(AVFormatContext *s)
> +     NUTContext *nut =3D s->priv_data;
> +     AVIOContext *bc =3D s->pb;
> +     int64_t pos;
> +-    int initialized_stream_count;
> ++    int initialized_stream_count, ret;
> +
> +     nut->avf =3D s;
> +
> +     /* main header */
> +     pos =3D 0;
> ++    ret =3D 0;
> +     do {
> ++        if (ret =3D=3D AVERROR(ENOMEM))
> ++            return ret;
> ++
> +         pos =3D find_startcode(bc, MAIN_STARTCODE, pos) + 1;
> +         if (pos < 0 + 1) {
> +             av_log(s, AV_LOG_ERROR, "No main startcode found.\n");
> +             return AVERROR_INVALIDDATA;
> +         }
> +-    } while (decode_main_header(nut) < 0);
> ++    } while ((ret =3D decode_main_header(nut)) < 0);
> +
> +     /* stream headers */
> +     pos =3D 0;
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> index 95b4bf50ace..57990331487 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> @@ -26,6 +26,7 @@ SRC_URI =3D "https://www.ffmpeg.org/releases/${BP}.tar.=
xz \
>             file://0001-libavutil-include-assembly-with-full-path-from-so=
urc.patch \
>             file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-fram=
e.patch \
>             file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame=
.patch \
> +           file://0001-avformat-nutdec-Add-check-for-avformat_new_stream=
.patch \
>             "
>
>  SRC_URI[sha256sum] =3D "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3=
fda562c21a93007b"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176153): https://lists.openembedded.org/g/openembedde=
d-core/message/176153
> Mute This Topic: https://lists.openembedded.org/mt/96381863/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--_000_DM4PR11MB5550B4811333589A33C5F63BE4C59DM4PR11MB5550namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Sure, Steve.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,</p>
<p class=3D"MsoNormal">Narpat</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Steve Sakoman &lt;ste=
ve@sakoman.com&gt;<br>
<b>Sent:</b> Thursday, January 19, 2023 11:10:52 PM<br>
<b>To:</b> Mali, Narpat &lt;Narpat.Mali@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; Polampalli, Archana &lt;Archana.Polampalli@windr=
iver.com&gt;; G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;<br>
<b>Subject:</b> Re: [OE-core][kirkstone][PATCH 1/1] ffmpeg: fix for CVE-202=
2-3341</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Thu, Jan 19, 2023 at 7:20 AM Narpat Mali &lt;narpat.mali@windriver.com&g=
t; wrote:<br>
&gt;<br>
&gt; avformat/nutdec: Add check for avformat_new_stream<br>
&gt; Check for failure of avformat_new_stream() and propagate<br>
&gt; the error code.<br>
&gt;<br>
&gt; Signed-off-by: Narpat Mali &lt;narpat.mali@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...ec-Add-check-for-avformat_new_stream.patch | 67 +++++++++++++=
++++++<br>
<br>
In the future please name CVE patches with the CVE number, i.e. CVE-2022-33=
41<br>
<br>
This makes it much easier to see which patches are CVE fixes without<br>
having to open the file.<br>
<br>
Thanks,<br>
<br>
Steve<br>
<br>
&gt;&nbsp; .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 68 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-av=
format-nutdec-Add-check-for-avformat_new_stream.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutde=
c-Add-check-for-avformat_new_stream.patch b/meta/recipes-multimedia/ffmpeg/=
ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..41d5884f880<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-c=
heck-for-avformat_new_stream.patch<br>
&gt; @@ -0,0 +1,67 @@<br>
&gt; +From 9cf652cef49d74afe3d454f27d49eb1a1394951e Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Jiasheng Jiang &lt;jiasheng@iscas.ac.cn&gt;<br>
&gt; +Date: Wed, 23 Feb 2022 10:31:59 +0800<br>
&gt; +Subject: [PATCH] avformat/nutdec: Add check for avformat_new_stream<b=
r>
&gt; +<br>
&gt; +Check for failure of avformat_new_stream() and propagate<br>
&gt; +the error code.<br>
&gt; +<br>
&gt; +Signed-off-by: Michael Niedermayer &lt;michael@niedermayer.cc&gt;<br>
&gt; +<br>
&gt; +CVE: CVE-2022-3341<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/FFmpeg/FFmpe=
g/commit/9cf652cef49d74afe3d454f27d49eb1a1394951e">https://github.com/FFmpe=
g/FFmpeg/commit/9cf652cef49d74afe3d454f27d49eb1a1394951e</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Narpat Mali &lt;narpat.mali@windriver.com&gt;<br>
&gt; +---<br>
&gt; + libavformat/nutdec.c | 16 ++++++++++++----<br>
&gt; + 1 file changed, 12 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/libavformat/nutdec.c b/libavformat/nutdec.c<br>
&gt; +index 0a8a700acf..f9ad2c0af1 100644<br>
&gt; +--- a/libavformat/nutdec.c<br>
&gt; ++++ b/libavformat/nutdec.c<br>
&gt; +@@ -351,8 +351,12 @@ static int decode_main_header(NUTContext *nut)<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D AVERROR(ENOM=
EM);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto fail;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; stream_count; i++)<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; avformat_new_stream(s, NU=
LL);<br>
&gt; ++&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; stream_count; i++) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!avformat_new_stream(=
s, NULL)) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
et =3D AVERROR(ENOMEM);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
oto fail;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; + fail:<br>
&gt; +@@ -800,19 +804,23 @@ static int nut_read_header(AVFormatContext *s)<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; NUTContext *nut =3D s-&gt;priv_data;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; AVIOContext *bc =3D s-&gt;pb;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int64_t pos;<br>
&gt; +-&nbsp;&nbsp;&nbsp; int initialized_stream_count;<br>
&gt; ++&nbsp;&nbsp;&nbsp; int initialized_stream_count, ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; nut-&gt;avf =3D s;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* main header */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; pos =3D 0;<br>
&gt; ++&nbsp;&nbsp;&nbsp; ret =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; do {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret =3D=3D AVERROR(EN=
OMEM))<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn ret;<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pos =3D find_startco=
de(bc, MAIN_STARTCODE, pos) + 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pos &lt; 0 + 1) =
{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; av_log(s, AV_LOG_ERROR, &quot;No main startcode found.\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return AVERROR_INVALIDDATA;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-&nbsp;&nbsp;&nbsp; } while (decode_main_header(nut) &lt; 0);<br>
&gt; ++&nbsp;&nbsp;&nbsp; } while ((ret =3D decode_main_header(nut)) &lt; 0=
);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* stream headers */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; pos =3D 0;<br>
&gt; +--<br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/rec=
ipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb<br>
&gt; index 95b4bf50ace..57990331487 100644<br>
&gt; --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb<br>
&gt; +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb<br>
&gt; @@ -26,6 +26,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://www.ffmpe=
g.org/releases/${BP}.tar.xz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-libavutil-include-assembly-with-full-path-from-sou=
rc.patch">
file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch</a> =
\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame=
.patch">
file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch</a> \<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.=
patch">
file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch</a> \<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch">
file://0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch</a> \<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;ef2efae259ce80a240de48ec85ecb062cec=
ca26e4352ffb3fda562c21a93007b&quot;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#176153): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/176153">
https://lists.openembedded.org/g/openembedded-core/message/176153</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96381863=
/3620601">https://lists.openembedded.org/mt/96381863/3620601</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [steve@sakoman=
.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM4PR11MB5550B4811333589A33C5F63BE4C59DM4PR11MB5550namp_--

