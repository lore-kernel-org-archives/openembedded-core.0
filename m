Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178B5C64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 08:20:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14532.1678436442355036406
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 00:20:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mJMBUX5y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2433bf0d7b=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32A7wEmk023761
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 08:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=T+mjvwCu9xbvFZGjeN2SRfNUYBTIyjldBn9o3jq0vvk=;
 b=mJMBUX5ysN3Bs/BDitXtfWTEAf3IfFV9CZCH1w3AGwB9nFElkqFCXZL66avWM0G6GTb+
 FFA7OS1EsXZwXED60DW97hZyUG/b21sRErwrO5IXq/4ZAF9NKWp48/K0Akq6zUnHgfzq
 9FtOYWTDFU8vPFFIX1xGFLO/tYccGaB9Tf+s6O5Ibgr4moO43cm4tvmsdjfAC/4ceDA2
 f95CC8bM/Bu/ab6MDCneUIX4Wxkaf7PxuCFYnyW197+8NEVCIjRo/w7EjDeq3NMOMwda
 KVn4g8Kivm++Z20/RjJu/rySlsD+cAvqdPmg3AZUe36vAQ4bCeZIWZZUKG3thMDBFkzw HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6fg6jm9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 08:20:41 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32A8KDdm001808
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 08:20:40 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6fg6jm9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Mar 2023 08:20:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYqtVScyN9fXJlfkditLXAmul4LAM4TPAFUL9dGuSG0wF/iJSadev9ySeBpxAhePBGGe6pwJz+yEf9yt6jvtCXogaaw/0gyHng71qjr7BcHKeyUcAZdzrMF9S9h9VEYWbrvkuS0tUJ50YRSsEKAkguYvIuo7IGc5IyYhjgeBC4kYnj+ZvBM8Pyo6/ga0SGS97YHoJm4ntetgMkSUVXq+p8Mcyi10mfck8r2uGkb6aCxKXLgcASOLUrtqCjm82hlrDLrM5On+cSigxcUvgW5d4R1FoL9lvVW8+me8humElOIbeKB4Hkes1Pmhw0sX8738qL0H8y2YsZfpV4JR/OIQMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+mjvwCu9xbvFZGjeN2SRfNUYBTIyjldBn9o3jq0vvk=;
 b=d51mEMsU1iJtjtTH1uB9LQEI2WGERahTQkrwQVqTTcvEV+qecXnTTICVBBIjrV68/iR4aCBwCRvutX8/ZGqCSFEB9ZMzC8d+kMQlbF2eqFjOsIHKDpTUaCBI54rxuNSPL+9q2UbtaQUa7vMaRMb7f4iQwMMveRJeeBWTMdG934aoC0vhiBk/fYN4IbMIj90xmGPMIwJF9hMgVCHfplrXtqI5W6FwO92GhquZrwF4wgE5oNwyJVh6qK2Nt2j7XT8irH6I/YJ0V6TUT0NcrhHBi2ttLvuASn3KoUqH2Sxs9O7WlI4tyiYcraxEuSFh2QdPbWVi6DdDewPvgu2Sw/pF0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by SJ0PR11MB8272.namprd11.prod.outlook.com (2603:10b6:a03:47d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 08:20:38 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::ad33:1272:f376:e19b]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::ad33:1272:f376:e19b%3]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 08:20:38 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "davidcorbe@outlook.com"
	<davidcorbe@outlook.com>
Subject: Re: [OE-core] [kirkstone][dunfell] CVE-2023-25193 fix request
Thread-Topic: [OE-core] [kirkstone][dunfell] CVE-2023-25193 fix request
Thread-Index: AQHZUyIgv/Ivq70W9UiDM5yvIl3nYq7zq9d3
Date: Fri, 10 Mar 2023 08:20:38 +0000
Message-ID: 
 <MW4PR11MB5822423F9CD9B967831CFB1684BA9@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <xthe.1678433377646255789.WG7C@lists.openembedded.org>
In-Reply-To: <xthe.1678433377646255789.WG7C@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|SJ0PR11MB8272:EE_
x-ms-office365-filtering-correlation-id: d34da881-6083-40c1-71b9-08db21405475
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LS7Vy+O8Ujp82b6UzaQvCobVyoGU4ZrDeVSS476mUgBDLIppVoi7fgnHXDQJh/gjU/tY9wt1gQWGdXqU7RD6xkIerjLtszGRvzsnZC3fCPUYL61QTvrBDIdGVzestMVFvRM6fXSV6ua3MOAPtVrfkzZvtN6UMweaXFO2MkLSGs3Gxknk2jUh7wia341MthXnrTqRnsv+a5eXwSdCKvMTab4Xl72BpBGXvumD+hbCghCA0YZlJePW2wKXGRaxm+d2peMnobrUb7jjFeQ/mn6U3uvw1QYQ4q1MWGJUv4n6GIP2sALGOWEaTtQRakJfhQGm7hwRbLbg7+Ba5zo7y7LO9vJwZ6eY4GxwKncZBL0WV/fHLs1SQQSyAjbSd5Z2FY63MJdhxQDqfMaUih7Uc7VCGjivQOQXHZwRi4RH586yQEQXKB6Nux0azDvjUP/zYLzAiDAf7PizfINaUFgVmwvDck3erNZLNfWlxaX7on9eHtfwDncKTSkQq+XDczWajRwSDV1PPIva6XOiwsM5h9kE/luijNey6Bgg6BLRs1/mYxqsqr2hL4XSEelMjHJGZD2N62hleVv0tFB9Du7KSKCvsoqCWigXCEEhFG6j6qJkijoXHlFCKh5jjY++ObwBCXUwS40QSsTfjIHxtkE2qb557TCXAN5+vennpjwtjtC47oz/8blmKp2zVqnmrpt37bvFZbOf0W2s9tyXg/VU8hkG5A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(366004)(396003)(39850400004)(346002)(451199018)(33656002)(71200400001)(186003)(7696005)(52536014)(9686003)(26005)(83380400001)(41300700001)(6506007)(76116006)(8676002)(8936002)(66556008)(66476007)(66446008)(66946007)(64756008)(2906002)(5660300002)(91956017)(122000001)(478600001)(110136005)(86362001)(38100700002)(55016003)(316002)(45080400002)(38070700005)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?VlZTnoR2QxLzHOibvZyaAM666HjHJPbEc9+9RjC1hIOny30wkX94sEAJevwi?=
 =?us-ascii?Q?GgkxW9ASain+gyzzZvO8l/u1JUlkmZTDB+DD4zZgRP45Q2HxcAVUQDy+GPB/?=
 =?us-ascii?Q?jjrDt+IXCtBfBZcsG2QQMxlX6lCcgdm5jdRLlWkDL1tU1c09Srvt0pNQi/5+?=
 =?us-ascii?Q?OK4nhXFdxCzenF5T8j/VBk/cpKdBcYdJYTT16B/yiIJMIaq+iyS7P+AWHQrl?=
 =?us-ascii?Q?cN4OHjLFgK20/YFB9uX/evC6bxQ0XEqd0spCCvXn8Gh4fPTVxv3YUmNlv3bT?=
 =?us-ascii?Q?7IyLdh3xn+GQxnqII91xefHiFNkhu5/28npya51uYosvq3ah2ClZR9vTEeWb?=
 =?us-ascii?Q?Elq0+jQOrn3YfEdIa54d5VgbQ1mrx+gobI6BInDbwKyufNV1Rb7PTQJLXWs7?=
 =?us-ascii?Q?1D1v3Nh6OxwgkqQRTK8tnRMa/aWpJ9zsSgIwutV+W69ZiewveYKIJKD2NQDo?=
 =?us-ascii?Q?2joMJHWb+guBLtncTNIiydIYYW6ivCg1N05e1jcRFadEeIUYt4/dUQNFShHA?=
 =?us-ascii?Q?E8WiftnrdRqGadzgMWmtRAMEerUZqDQkUXawf1bPuU/f1yle0v1IlpbDtQr9?=
 =?us-ascii?Q?aMkx8uvSm8lNUjAyGhYAJQthKiNEFKHIEIXuHnpNQzMHWZBuuy1Rt/tHe0DF?=
 =?us-ascii?Q?3FEcHwmKScIYRA4xmqHpsv4XD8vRS0pqztC51yinBbYArn4kkg/9MRBAkKdP?=
 =?us-ascii?Q?caCUvNGyzJ68mF56elNQDN19EwuGRGK8G1uHvhBguNbKCzsBvBF+MSU/xgfp?=
 =?us-ascii?Q?c2ohPk+x/VnE8SdO4q+9xp2efTXreaQgzvl6uwVnOsmUl0hztiDeq7xeVh9S?=
 =?us-ascii?Q?XFucUs4Sa00hsZcxHt5JfKHQtLQsjlIj0HdNCu1JhgoBt+vjUAmuIY7KOGrT?=
 =?us-ascii?Q?MdRIJETsFHjIrhqFLPQpk+kJydSZqUWuwXEX2yXGB4QMKXEzfFmAQcaAsBxq?=
 =?us-ascii?Q?l4pJjONYx0IGOMtqZ9+rfSdb70V41OMe/FcYPqgDcOfXm/9sjIjDoPM97/Bj?=
 =?us-ascii?Q?KWIGLmy8r4DZpgga6yhMZwOk7tBerZcvuoi2uptJvzcdlcoiS/ZCv+BDOgDk?=
 =?us-ascii?Q?Svpr6FCQwRZgsk8ZtbWYadEr3FO9CBAKo5fvNSJFKv/fc/bqMjbaQtxxTEck?=
 =?us-ascii?Q?kDHTIb6tkqSoyhbEGSHoGiUaiZLoV6hTasLrLIUyrm4noI9tii+8CoNX27NY?=
 =?us-ascii?Q?4kr6Utncg/h3Iow2MzeJKFqFFzYIgGvt0gCWbmSkWc7GZzk3DICZ7t2KD2Zq?=
 =?us-ascii?Q?favSOfZQkRIqMj0vwyYLxiu6BJcA0YXy7P6/yG4sYXEwjcOInfIOaXbKoCrJ?=
 =?us-ascii?Q?EEztP3dfVQWwst1IS6IMdceemswkPEbqwJWjbrQS5qEXRVGWZtS+stKiweCr?=
 =?us-ascii?Q?U2jYRoWxtmx358U+GJCxgT7QytCZiTJ3dA5TLH2cLXogECKVfFncVRl1ZVOB?=
 =?us-ascii?Q?/9sXQubfan4P1UhOlTzyxeogXY59hASNZtM2RtiRClNvGgQMzSJtPRBySu/A?=
 =?us-ascii?Q?B0F5Y1gcRElS+a51uOBKs3ry9NHNNMlX8m7FiVHUyEa4xiPB3lzAeRbdcrwC?=
 =?us-ascii?Q?tFbeXdNs7Tfk+WBzKOjy92mOdWZr/yEGo6kXPeTD/Ec0PwVrLWJvs0rHaC0B?=
 =?us-ascii?Q?zQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB5822423F9CD9B967831CFB1684BA9MW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d34da881-6083-40c1-71b9-08db21405475
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 08:20:38.1507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: to5fAwXKKnoQQBs1zx+It9WPwaa+VtscElEg6j6cIKUCvUbsnkBQCUv0bEsWRvO/wZ2e97O0INLiRBDNqNwtjyuV3SegQIhQch6wafjPSUfab7aMgOQUeDhXjH76bzky
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8272
X-Proofpoint-ORIG-GUID: Ej6Hvpd1s-kHE2suWCacQR-XxWMWErdT
X-Proofpoint-GUID: jssOSikQpmZdn6GrTDrfABIZ5sAP0W66
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_02,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1011 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303100061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 08:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178309

--_000_MW4PR11MB5822423F9CD9B967831CFB1684BA9MW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

One of my team member has worked on it and she will submit patch to upstrea=
m kirkstone in one or two days.

Regards,
Archana
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of DC via lists.openembedded.org <davidcorbe=3Dout=
look.com@lists.openembedded.org>
Sent: Friday, March 10, 2023 12:59 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [OE-core] [kirkstone][dunfell] CVE-2023-25193 fix request

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Hi Team,

We are working on CVE-2023-25193 for kirkstone and dunfell branch as it is =
causing errors in our applications.
There have been previous threads pointing to the issues that backporting is=
 difficult due to code changes and new files being added and there are no s=
econd thoughts for the same.


Could you please suggest how can we proceed to fix it ? Version updates is =
out of scope due to various internal reasons. If anyone can help, it would =
be great help.


Thanks,

DC

--_000_MW4PR11MB5822423F9CD9B967831CFB1684BA9MW4PR11MB5822namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
One of my team member has worked on it and she will submit patch to upstrea=
m kirkstone in one or two days.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of DC via lists.openembedded.org &lt;davidcorbe=3Doutlook.com@lists.ope=
nembedded.org&gt;<br>
<b>Sent:</b> Friday, March 10, 2023 12:59 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [OE-core] [kirkstone][dunfell] CVE-2023-25193 fix request</=
font>
<div>&nbsp;</div>
</div>
<div><strong>
<div style=3D"border:solid #9c6500 1pt; padding:2pt; background:#fcfc03"><s=
pan style=3D"font-size:11pt; color:#000">CAUTION: This email comes from a n=
on Wind River email account!</span></strong><br>
<span style=3D"font-size:10pt; color:#000">Do not click links or open attac=
hments unless you recognize the sender and know the content is safe.</span>=
<br>
</div>
<div>
<p>Hi Team,<br>
<br>
We are working on CVE-2023-25193 for kirkstone and dunfell branch as it is =
causing errors in our applications.<br>
There have been previous threads pointing to the issues that backporting is=
 difficult due to code changes and new files being added and there are no s=
econd thoughts for the same.<br>
<br>
</p>
<p>Could you please suggest how can we proceed to fix it ? Version updates =
is out of scope due to various internal reasons. If anyone can help, it wou=
ld be great help.<br>
<br>
</p>
<p>Thanks,</p>
<p>DC</p>
</div>
</div>
</body>
</html>

--_000_MW4PR11MB5822423F9CD9B967831CFB1684BA9MW4PR11MB5822namp_--

