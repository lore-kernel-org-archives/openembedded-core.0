Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D14EE14D8
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 04:07:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.32594.1694146044470034178
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 21:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hX5Kgqi4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7615bc2663=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3883ZiVm018347
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Sep 2023 21:07:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=1ewzdyz/TZDTLAc5er
	m2AdlrD6OT7FJLfW95BOUk8oo=; b=hX5Kgqi4I4cI2fmAwu3QEJ496bD+eu3b2b
	sLgxNddNLtLZLgKk3JO6tEPLG+MjwpD9i2HBaROurSXkQMoO5pQSpAbL4eoiuWWb
	vebnjo9dCgpVXRzFULlu1zxzjGz9tIeCnEKXTIvR06AbEn9gO1gDpZaPhOAG2Sv6
	in7nbvLPAdpN1c2rEEqLF051y5qcEIxC4ldZp6Sz8TU79UDir1IjWalLICBa2P3G
	XNPC+gOSUfqAZV2zPPVURIBZ7VL/E5FKcDzPf1TH3gJdO/Ur1rhBLUOuNuyEL2HU
	tQxsPhyZVVFW84GADqiHuT/YKoOOCD0AvtRL/zHBWny/zhFWAwtA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv0b054mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 21:07:23 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 38846Cw5011630
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Sep 2023 21:07:23 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv0b054mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 21:07:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkSHBE5f2JDrO25sh/85i6DYsxEJzGYLI+yxKp76vMFZk+jN+wkL3QEyXpN3NMZcW4kmTR3rSu4ANo+L+PglK2YB39VMZQveZ/B3yP2FJSnAec2RZC0q9iOeoLwZXSR/VrXA5ubDWhDFkU550yQeaLR8m2X6zo3oWcf7hgYPs1uF5Q+3gv+pIO4aFhFEL305xTzQcornlIe9JiKd899ZFw/BcN1Bx1g3NB4P5ytU7g18pTcW7MIAgX6qnrZasyWKpCgHtw6qCr6jwZPi5kWbKCD0cOysTIqXPqwRSVRjb6E1uzdhj3ZmbHbLfvdvmFM0Jd6grQhINpRsGfSa74zApw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ewzdyz/TZDTLAc5erm2AdlrD6OT7FJLfW95BOUk8oo=;
 b=VZGiJW2h9DW03cL0Y8iBe5fmanaSqXx8LaLQv3RA6wUhHuIs2EYS3TMa8Fu5MKCUHoMnNL5JyVmtKP47DRgr2k6N6iwcu0K9f5EyKL7uWdFIvS62jCIAV8WXgs9nJadwoxir/vhlChrtVUJM19OoCn/8Ch8JfYnDyr1O/NPuK1vJ1W7cG4CPjA4d3zDNy6LSgDkOhKABX+Wu6oQiQxcLqAxKlDVqWnI8e4d7JDxHpaLL6XH/M00EaXt2kKrTaX8j+9Pt0drr6w3u250QueHy8PVWfJxfyVchtG27jLTfzH/Ews1wCOcSEOqPFG0/kxkodS0ON0PjxiVKWM96/B0g2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by SA2PR11MB4809.namprd11.prod.outlook.com (2603:10b6:806:112::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 04:07:20 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::bf4d:9c24:f4db:31a]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::bf4d:9c24:f4db:31a%4]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 04:07:19 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: Re: [oe-core][master][mickledore][PATCH 1/1] vim: upgrade 9.0.1592 ->
 9.0.1664
Thread-Topic: [oe-core][master][mickledore][PATCH 1/1] vim: upgrade 9.0.1592
 -> 9.0.1664
Thread-Index: AQHZ0ajBYJyuv48Vq0e9uKvUdCfLkLAPNn91gABQEQCAAOm/SA==
Date: Fri, 8 Sep 2023 04:07:19 +0000
Message-ID: 
 <MW4PR11MB582203C9A6F67E72F0CD1F6584EDA@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <177C6ACE09C6DF4F.3047@lists.openembedded.org>
	 <MW4PR11MB58227E52A9722B86C4CDB6D484EEA@MW4PR11MB5822.namprd11.prod.outlook.com>
 <981a68a739148490c64eed116b9594a6f5994f6e.camel@linuxfoundation.org>
In-Reply-To: 
 <981a68a739148490c64eed116b9594a6f5994f6e.camel@linuxfoundation.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|SA2PR11MB4809:EE_
x-ms-office365-filtering-correlation-id: b0602b53-ea74-4605-0266-08dbb02118c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RbkB4dUT8mIyuwL2zKqJdNdXbsRNrhIaQj2SiubqTZBFOBPYUvW1IntUvt+A9DkopZlfr4vmsColh0eGEnAyPg0+9nRcYzPmPL5X/rrKBQjG3GqBIKqAjp5rJSCzYL/bq5c4zWCX0uq3N+htbKv7AhxyKFb50++JITBx3DAAnYmseCK7UaKkK4TXHCT312/duY+ae/KncORGHdx8RpBKwfgxuRseU6IGq3WT4WFBNxxTSyUyrzBKO/E9g3GcKSmV+b4wREUMToWeIj2+1ghhXKhn2vrsyFuJsB6OVIpi9r1DfaqMsxRRvRpVqH7PNXmOHdoPLwqqc/gWpH+qnHDahR3yPnKZ/TNEM4+qnZ/+Bp6RvF0y8JVc1qtnp3g7TESEAYPBqV0h+3XAdfZLGYmDdOtZ7qIz+qH0D7aFEOz0pPD/jaq+tKza7CAp/2Tpju9pbfhGmiv/RzQ0Y5Jbayjw1FAobdLfJBlvZjsBVysdJEk8tUgPNxN8uLXQ+FfDhYzSVN6yhkG9/DGK+ILnx9Nd01x4XPb7+Azhq5cVO5OKjUCdoHK83Rj19YMJnFp9zmnfivcHjpU3nnxumLJc1RlcIZZQ/DBOlIZBj6UimOEr4VfHZHE+3ynGKHR6SgKkZAl1
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(346002)(396003)(366004)(376002)(451199024)(186009)(1800799009)(91956017)(6506007)(7696005)(71200400001)(53546011)(9686003)(478600001)(83380400001)(107886003)(26005)(4744005)(2906002)(66946007)(64756008)(66446008)(316002)(66556008)(66476007)(76116006)(41300700001)(110136005)(52536014)(4326008)(8676002)(8936002)(5660300002)(33656002)(86362001)(55016003)(38070700005)(38100700002)(122000001)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6jJqN/3ALKFmpMGDtK+YIh6mzbE75vngkJlFckiMstWEvjh9Mk+JVCN7BCv1?=
 =?us-ascii?Q?UXMkeamaur2bUQYIqf1TCKygrqgdHkRBg5P/fiHYewT1afJe8DpmXrv+dner?=
 =?us-ascii?Q?4dZkd5O/sJ8psPyjZPyEEJpxCHr+dfMR0qLOmJEVn8E4CHIUBMoSMnXaTQbR?=
 =?us-ascii?Q?Zz30stOTb4im+AmyyREQ1qey9XAxHhecu2l+UsarCrul1vHdMtaw7vLYFlWB?=
 =?us-ascii?Q?FTe/d4BXqBmuzLugtD7WyOzUeul3ccdjIDN7okpLCwB6PCuXyLbdlrwpNduZ?=
 =?us-ascii?Q?BXk7yzLvd0st8PNx3U5dFgZHlgAiCxDeYjGjfGxepIJMgGVBgnEnXnMc898T?=
 =?us-ascii?Q?xec533rX2D6fwkAl03eji1emrExS4oawSeL92stB97weSB3eWkm4LpQqsNNX?=
 =?us-ascii?Q?YkhvLyesQNGwyWkebarRV3fyhoXOqE1iy4d1S6gECOYSAsNBtlShy7Sv6rwQ?=
 =?us-ascii?Q?TVOG4Y61DIf4VAy6QnkWevwNWg8J5ESEknXsLOiXoZ1NW8MeGeIJREJJ0dVA?=
 =?us-ascii?Q?Fvks5PkoNKLNsPt3dcIuFTQyOsSAMfhtUOfdc8NzjzAedlbvGxBT3O7NcpyZ?=
 =?us-ascii?Q?UmHRoQYj332XklJdruECi3ffseJrfWp0XkETjWKomMJ2RCEgEZ2OVC9Ft+x0?=
 =?us-ascii?Q?U8ujsiL/daADMrnwTDO2qAKeQo22v6NpwErudMIaKQtnh/619HsunkJ3H5P8?=
 =?us-ascii?Q?ncDfwFfQw03Fvl5/vgQm2cdBhJh1yPllc9yEf5Pav6229YktFWOI3fU31Jyh?=
 =?us-ascii?Q?SK2FUV8ZVNw0FVcMio0oORqDzdHJYgteLmOub/HWdwliRkAY4nX6yRv3vJMF?=
 =?us-ascii?Q?8iiE0ObYmkZZSHfEjH62P84+sUwi0jpoSbHqGh0G3BTPm7DBKD119EMK+PZt?=
 =?us-ascii?Q?9Ow2z4GBV2vkPsOre/lpXW5X52w4SoxdK2jMeTfHKuQBeXJZhFSZWQMaII8z?=
 =?us-ascii?Q?mS23+rktLfcaYrYbzVZlPjgicAj29JH3d45LZnODP++gE0nvKsRUtE2+TLjz?=
 =?us-ascii?Q?KUCs/bRq6F3//IU2NCvgChMEJykMvpuw01vAqUYxl3S87dmnfrIyMFvUIRn2?=
 =?us-ascii?Q?PTiZfB/pI2wPMNdADsdUyHuxyCVhZh/WnXKeYXhh2urDOyikeBMczAMo2Dhj?=
 =?us-ascii?Q?UW2rKjYIJW1et0aVEyqWZTTsSfvVPMXUHGmbfhAhv51qJaZSqVO/946FHHN4?=
 =?us-ascii?Q?PVzyY3XpQ1azn8rtb3tThWELWN6Gos7W05MO8AhWdX56AqVuC31W5bG8CV4P?=
 =?us-ascii?Q?M9kNBuoAHGnjkmCB7dbAbnI82bPA2MTJJrTs4GUFlbuq+xxSw9TWk8Io38DN?=
 =?us-ascii?Q?wCqcgmqkfn9ga9ro+5xYAm2aYlHXXFHiyvR5izay1UHIy7AdrubaSr/1Q6+m?=
 =?us-ascii?Q?u33GA9rJLasMq5lExc1UmTCIg9PapPZn1jiAlZNH6Cf7CanRLAvYwMQbPQUY?=
 =?us-ascii?Q?PlYmjATa2hKXSvvmXZFm/QduagwsF2utsTljETDOI/x++2G2i1gcvWsPDJ1X?=
 =?us-ascii?Q?G+n8gfaM/11oJMohWT0gv6B2/Yj3JO13PKmnNmn4tK45HjbL9lJ1NvM0/1lp?=
 =?us-ascii?Q?W4mhpIUCsp4TgZppNv0i3bUw8QjNnUcJKSix/3gajlKKYgk/3Zunko67QraA?=
 =?us-ascii?Q?hg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB582203C9A6F67E72F0CD1F6584EDAMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0602b53-ea74-4605-0266-08dbb02118c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2023 04:07:19.9085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M/wbfCvYWcqmMyJWIQXegj7uuK5u5PPqGEFTP+lyzSHO/Sz5UNoKM2lIebYYwlgCCDJalZFUrM51FQABBYKR7j7Gla/TnaD2tSUcSmRepn8y/e/Eu9q3ge8FmjQw7n/R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4809
X-Proofpoint-ORIG-GUID: FBwd750YiwNK3Srlf1BW-uK7Cvg2PT6L
X-Proofpoint-GUID: iqCN0vLxQhGqo_kATzJBcJKIinWkezrn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_15,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=489
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309080037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 04:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187400

--_000_MW4PR11MB582203C9A6F67E72F0CD1F6584EDAMW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you Richard,

It is failed due to "844dd42d1f vim: update obsolete comment".

But I have sent this patch before "vim: update obsolete comment".

Regards,
Archana
________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: 07 September 2023 19:39
To: Polampalli, Archana <Archana.Polampalli@windriver.com>; openembedded-co=
re@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>
Subject: Re: [oe-core][master][mickledore][PATCH 1/1] vim: upgrade 9.0.1592=
 -> 9.0.1664

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Thu, 2023-09-07 at 09:23 +0000, Polampalli, Archana via
lists.openembedded.org wrote:
>
> Reminder,
>

FWIW the reason this patch was delayed is that doesn't apply properly
with fuzz warnings on master. I've forced it to apply in this case.

Cheers,

Richard

--_000_MW4PR11MB582203C9A6F67E72F0CD1F6584EDAMW4PR11MB5822namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thank you Richard,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof ContentPasted0">
It is failed due to &quot;844dd42d1f vim: update obsolete comment&quot;.
<div><br class=3D"ContentPasted0">
</div>
But I have sent this patch before &quot;vim: update obsolete comment&quot;.=
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof ContentPasted0">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof ContentPasted0">
Archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> 07 September 2023 19:39<br>
<b>To:</b> Polampalli, Archana &lt;Archana.Polampalli@windriver.com&gt;; op=
enembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembe=
dded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;<br>
<b>Subject:</b> Re: [oe-core][master][mickledore][PATCH 1/1] vim: upgrade 9=
.0.1592 -&gt; 9.0.1664</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Thu, 2023-09-07 at 09:23 +0000, Polampalli, Archana via<br>
lists.openembedded.org wrote:<br>
&gt;<br>
&gt; Reminder,<br>
&gt;<br>
<br>
FWIW the reason this patch was delayed is that doesn't apply properly<br>
with fuzz warnings on master. I've forced it to apply in this case.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB582203C9A6F67E72F0CD1F6584EDAMW4PR11MB5822namp_--

