Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44317C4332F
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 14:08:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11906.1669817282309151095
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 06:08:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Z4yzck/R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9333236abb=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AUCeEfx030282
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 14:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=+hUhuMX27mG8L4AsM+w5EJ1qd74ujMPct24NTW+0DtA=;
 b=Z4yzck/R63ZCpXN/sX2YTVH7mMOI5ckzfqxgjrTk3X9HxU023Am5iUJozuRou/WqT4fu
 RPYXHNb9u6ulRsZyjy25n7TmHBLNBCGQ7j1nSbxXSLfF8BoviU6zP+DXtnAMfSjYp38N
 0O3ORfssdfkLxnMqqJlNLHBswpPT7WROvLGVNiZD4uCWGHgs8Y3kuW8u+H5iJ5YG0aBE
 yGRGvbgY9sHuQgxGlffqaV6kQP6u975wDZogSWT9mesb94Tr57qLJ/1mJGwQinbF7W3R
 0fZB5Ht54KOdV/pNyKOHvvPqMHaupnSyF+mSc9xf/eSMdbxmMN++8/TXkJ6Wq7cPV6N5 qw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m39sbuckr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 14:08:01 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AUE80CS026379
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 14:08:00 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2177.outbound.protection.outlook.com [104.47.73.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m39sbuckp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Nov 2022 14:08:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmhfE4sCztxNsuocs0LXKnP4SaI7uNJHOYgLQzdCLPqF4H/n+CMzrpLtzAw1rhX9Z6+KSni2CmZ1n/E0rKUIoeloCn7aRrwZFsi8UxdunePDKOs0iDi5c91H3v5Vaeb4SJqWHZF+P407FyiVbXQfhIBhrMBaECgFIaP9lKKjwSK9KmpgXFRRm8bjdMJ1duszeY0wxId4yzAnhGR/1bKpnMONbfAW23xCwhrWiEI+ETafcg6EBgAu4GCulcUrrnG4LI8f2L4GTE0YZgwhB1zbY+s6IaanNm3D/MxG19wDR6oGN6FVLnpi5M/c9ZhvV3djGGIxMo8GQReVmfCOzoQ0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hUhuMX27mG8L4AsM+w5EJ1qd74ujMPct24NTW+0DtA=;
 b=UIOsKew+zD1YTnqFQZsvIbFPfB2m2BCWlOSsXHoPrKasDY7woH8dENEuvS8u0JOXkTuRBUWYksF6Gxw/uVqHPAh0CyfBEQvlZLub40zV7hGdy91PyCf9pJAs3bD1CHrjIzdcgyHJJOWhfz5ej2kZREcnZjuWHN3MSY6urOrz8nz5lRxDynruvs3Lf2Er4rV0/jf6o7LIZjJ21UWGn770NPuoXksvSrPw/wxaSoI8lgagrwx5ibIMX7BgoDqMK4t38qcwgI9nWj/+at1OMpm4BnaJ5EQOS3Rp4m4Js0b/i+5Hmd79/5IPBJExyr8d8XK2pPuFbGHCReQwk1JPAiQqfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by CY8PR11MB6842.namprd11.prod.outlook.com (2603:10b6:930:61::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 14:07:58 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::7d38:cbb6:a886:3b70]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::7d38:cbb6:a886:3b70%6]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 14:07:58 +0000
From: "Mali, Narpat" <Narpat.Mali@windriver.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>,
        "G Pillai, Hari"
	<Hari.GPillai@windriver.com>
Subject: RE: [OE-core][PATCH 1/2] ffmpeg: fix for CVE-2022-3964
Thread-Topic: [OE-core][PATCH 1/2] ffmpeg: fix for CVE-2022-3964
Thread-Index: AQHY/0bCD9b24jJoxEGRlqFmsbwm5a5UoLeAgADuF0iAAGOKAIABmPud
Date: Wed, 30 Nov 2022 14:07:58 +0000
Message-ID: 
 <DM4PR11MB5550543CF3E9ACEE722391C7E4159@DM4PR11MB5550.namprd11.prod.outlook.com>
References: <20221123142022.136114-1-narpat.mali@windriver.com>
 <9B7572D4-F1B3-4A23-B280-FB7A99808E84@arm.com>
 <DM4PR11MB5550E919066CC47698276611E4129@DM4PR11MB5550.namprd11.prod.outlook.com>
 <A08B60F3-4D6A-47EC-9B50-C498375B1CBD@arm.com>
In-Reply-To: <A08B60F3-4D6A-47EC-9B50-C498375B1CBD@arm.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5550:EE_|CY8PR11MB6842:EE_
x-ms-office365-filtering-correlation-id: 9c7fd4c3-132a-42b1-6e7b-08dad2dc48f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Nnmpaxl9hofcZTcyMZBUCbAlCETY3bhh27W8HJGXQvWXnA3IoR1+1QT8v6tVFEIaPjul1gdtvE9IKJACcyVSh/XuMm9ok/nOCjOqMWwgGOLikkKbQN3ina7k+VPNBB/MKEmIwP6Uew+yKxDPFsIG8930ibWNzattDazrGssffiud908jtqjtHvx1HJIA86cur2RCM1nVKdYTHLF2Y0k6hq47jB+wvGqzyzXq4/5kyip8usaLPCSpadvDCkmuN8QQQZc/JRfeJoUhVa9KthkZg5nRqcvn/E1zwXaX0QyT3nVzn7s6TGBaF+6Xxhp7g3hfkATHyGXJNBOdMwRd7SedzqRPoCxEi2X+Mw1CNITi33u8SbnLtxi7SdWr1FOZln9Dmg/Qqi+NTPxQH4JTN6glCgtPDWlPG32BU5hVNXzPxpVldq8wA/sOXn1ixd+sJaUCt81O1z4WVBZx+kLhxMilpPfw5HIqDJZxU2R+RHzi1rYY2wl34V3rP60kkXrLbpz+J8GWK+iPa107zkjt0Y3apsQoTbCrXt5V+L8Dm+ZXtbjvKqz7HpP0SjiZdg5EqbygVbHu+ROKjHJrJBosFSz0RFM7b2eL3YkG5bxOdbI7CcXi8bASoa1zcqQMkUAqKe29q+FVDaJTtmlcMm3CnZlChtGw8U+ZPBhuDwuGlWjcCy67+0iWhZELQ5E9kB/E6/8uqx8TQQ2gWmsPKWtNin5y9Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(346002)(376002)(39850400004)(451199015)(52536014)(6506007)(33656002)(38070700005)(55016003)(86362001)(64756008)(9686003)(66946007)(107886003)(91956017)(8936002)(66446008)(9326002)(41300700001)(53546011)(76116006)(26005)(8676002)(71200400001)(66476007)(478600001)(7696005)(316002)(4326008)(6916009)(122000001)(38100700002)(83380400001)(4744005)(54906003)(2906002)(5660300002)(66556008)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?b7mqJYSm1wqmODd4urNACotokjUtff5B3pcgQxDTsBSA4mgBjm0C/YfbgnC7?=
 =?us-ascii?Q?kxPP5JLQN2OWOKdI6GrdjKksYE0r4zvT+15aT9BmcAKXPC8DoIS1ll7K3PoJ?=
 =?us-ascii?Q?bgx2hwzYCaIWMJ3PqvwQdyHmVpuL8f5THmXxIguwdS05DBtYsEx3JWCXbDhh?=
 =?us-ascii?Q?bEBSZ8Te3KT1ZmebAlWqdSHRBQ6Wmzdo4nHDhu7JLLJHl/VXaDIslrKkocV5?=
 =?us-ascii?Q?+y8kddj88Dganh7wd3gzleFVD8dviRc6oGipV1K959zoJRAQO0nMuQ9IrjAg?=
 =?us-ascii?Q?vwVLEJcRn1gVAFKrlIXAD5GZTRWTwbpVLQmci/P/NYX3EDD/jcboXv8wUyOH?=
 =?us-ascii?Q?Kc133dnc4NPb++8Ilpadu9HWOeki1kboJmRWBMI3mXxsdyfQBszH3hsmEZKh?=
 =?us-ascii?Q?ZTkIoa8LqoggP8eirJP46D8C9kzQwpCtD7gy9+tE7IDfFDbdhSvU7C/cmfY8?=
 =?us-ascii?Q?1WnV30F3lvSIP2qPuR/wNp2itFfnj2z4cIoMrqprxOwaVF01iuV0oqH+jFrw?=
 =?us-ascii?Q?FOeYhA2gtckFlbANeC0QFvZu8oJz7JeSf956heTKO4Z6l52LL+WOMfnNOkuo?=
 =?us-ascii?Q?wXkmAMEH1HAlYiwg71/XdwhNgHvJ1YX8KgUJYhfzG2W53n7NglG6g4R9RFCj?=
 =?us-ascii?Q?DvkImrnW0mtabbUmSycUoQNXMybXTCu3cNLNi+D6zCFOWyO13f64QN0TXxVN?=
 =?us-ascii?Q?88LyQO8Voo83Wb92uo0gpCCDcGTiwOPA0cmtMTbQo8BjG6/9ZjTjnqonWJbi?=
 =?us-ascii?Q?uBntwlAgQR6sVNICyrKe++Pb7IeKIThfhpL0k60y+I6ObRg/d5yTmGQau255?=
 =?us-ascii?Q?W4hmnJZtI4VzLNXwzSN9pGlRc+hONF6tAAhsrzM4epBdu4JW/g67sGzGZUtk?=
 =?us-ascii?Q?86OHW9v2O9hqpSevHL1dvEVVe92LIZEgw0m2k1SBcWfDzlePusjjMZuhGoCT?=
 =?us-ascii?Q?zIfiRQwcM4dHMO+I4xN7D0gwDHMHaOHRqFCe5TkddMyLSBOGkBo+2S8Ow0ub?=
 =?us-ascii?Q?Vb2vhcQCGmFSfLYLpXF2ThwiWzZ36KvWCnrr1oCh5OU31KfvhsnXz1cDzFl1?=
 =?us-ascii?Q?PFkjhVp6OvPhbexY/u3C4iGZ0nStSC8fR7nbiklz/lUStWIv3rBKke/Dtit3?=
 =?us-ascii?Q?IaFP0NhS9waU0/3I2BEdE2zg467GVyrpUTk4BA8bTYoLXGk1orRmUcZFNhT1?=
 =?us-ascii?Q?/eUnD+JHqWDdC1m23diMw+JKN4BnNY5hV389fQQi4GahW0QUtWlVp43IfOl8?=
 =?us-ascii?Q?93zjtquUhzOIABM7CRB69PpgL+BPrnV4ktgFgIVDr2YBQadV31kJgq5ydU0U?=
 =?us-ascii?Q?vOgNSbeXm4m1het5NJysyHtaazZ9P1l8Leb1tJ94u1ckbK8TJxR6OOWOZHqn?=
 =?us-ascii?Q?khpSN3QShy1zpdfD3c5HJbrM01VOtAw44RlQJQbW7zMOtV8rwLHUSlECoep4?=
 =?us-ascii?Q?haF1yuQK6d0XXEWhvSbokc2RJF7j+87QyLkqMHTOm/L4DvHwL+QHsxBJ3zCJ?=
 =?us-ascii?Q?uuEPaopBO3CXDYVyjZzSJE9mHevKKJSuwuZgeeOdub5wQznIDQ3aLr8Xh6oT?=
 =?us-ascii?Q?ZSzC32kIjBfJlZ903+q7IFM2LFrvAUNIwM9xnQQZbvEYJHQdARhgmqIqnNil?=
 =?us-ascii?Q?8/ki/rKItTzQGDHKtrCmwVU=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB5550543CF3E9ACEE722391C7E4159DM4PR11MB5550namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7fd4c3-132a-42b1-6e7b-08dad2dc48f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 14:07:58.4938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NpekC1M4AQ1mqzOytkccwUOUtueM4x/+6c0XeeUamc1Lw6FtItfawOOMEU6tE4s1Cehf+lpVGtfc69xLqJbDPI+TE69TTofbKl6psXT/btU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6842
X-Proofpoint-GUID: pFzWitiWYkcWUul3nEKUlnPQGFe-eN3J
X-Proofpoint-ORIG-GUID: lUwsozQhP3AfSgVqwLwAW_EXibf3ZD5a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-30_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 suspectscore=0 mlxlogscore=928 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211300099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 14:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174010

--_000_DM4PR11MB5550543CF3E9ACEE722391C7E4159DM4PR11MB5550namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

As suggested, have sent both the patches again with CVE tag in patch header=
.

Best Regards,
Narpat

From: Ross Burton<mailto:Ross.Burton@arm.com>
Sent: 29 November 2022 19:12
To: Mali, Narpat<mailto:Narpat.Mali@windriver.com>
Cc: openembedded-core@lists.openembedded.org<mailto:openembedded-core@lists=
.openembedded.org>; Polampalli, Archana<mailto:Archana.Polampalli@windriver=
.com>; G Pillai, Hari<mailto:Hari.GPillai@windriver.com>
Subject: Re: [OE-core][PATCH 1/2] ffmpeg: fix for CVE-2022-3964

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Yes, please.


> On 29 Nov 2022, at 07:49, Mali, Narpat <Narpat.Mali@windriver.com> wrote:
>
> Sure Ross, will make sure to add CVE tag in the patch header.
>  Do I need to send again this patch with CVE tag ?



--_000_DM4PR11MB5550543CF3E9ACEE722391C7E4159DM4PR11MB5550namp_
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
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
<p class=3D"MsoNormal">Hi Ross,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As suggested, have sent both the patches again with =
CVE tag in patch header.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,</p>
<p class=3D"MsoNormal">Narpat</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>From: </b><a hr=
ef=3D"mailto:Ross.Burton@arm.com">Ross Burton</a><br>
<b>Sent: </b>29 November 2022 19:12<br>
<b>To: </b><a href=3D"mailto:Narpat.Mali@windriver.com">Mali, Narpat</a><br=
>
<b>Cc: </b><a href=3D"mailto:openembedded-core@lists.openembedded.org">open=
embedded-core@lists.openembedded.org</a>;
<a href=3D"mailto:Archana.Polampalli@windriver.com">Polampalli, Archana</a>=
; <a href=3D"mailto:Hari.GPillai@windriver.com">
G Pillai, Hari</a><br>
<b>Subject: </b>Re: [OE-core][PATCH 1/2] ffmpeg: fix for CVE-2022-3964</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">CAUTION: This email c=
omes from a non Wind River email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Yes, please.<br>
<br>
<br>
&gt; On 29 Nov 2022, at 07:49, Mali, Narpat &lt;Narpat.Mali@windriver.com&g=
t; wrote:<br>
&gt;<br>
&gt; Sure Ross, will make sure to add CVE tag in the patch header.<br>
&gt;&nbsp; Do I need to send again this patch with CVE tag ?<br>
<br>
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM4PR11MB5550543CF3E9ACEE722391C7E4159DM4PR11MB5550namp_--

