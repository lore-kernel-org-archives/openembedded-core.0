Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F49CE80AB1
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 14:24:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18466.1695824664047641791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 07:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NnwZ+Ybe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7634e6bfc0=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38RBXcs9008604
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 07:24:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=N09pkKdPzbgdUuFN3J
	/CIe2HdVGID9mWhw8h+OwsPXo=; b=NnwZ+YbeKOhq76ws2/UyrRQMlcJ3DC+Vx8
	3Uol4ksBD844T5zgpvRwtHVhLglXvqAuLfVJjRHJ4KlDl1duocBlSvIhdO2GJOoM
	UR9HbByaOssiQ4SACbEz5F1815cyMytvlWdEXc8/JZa9MIijAFAskOwj2E9dMymM
	jHGLICWau873bL+hBmx9ZCAAYIjHgq+CFoQqysENLrpLkkgBzscH4zs1lucoMGJZ
	oQ1sCXZ+p3WT41M/uzNND+/G0xs/O9DIN5LLaULrPKb2ExXrjIsvGLcJ3UViZlIO
	aBNjTR6WOck9owyfBi0Gtto+ODO1vCNmUxYQ5c8+XSvA9pDp/c2A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9ua0kurx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 07:24:23 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 38REO8Pv025533
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 07:24:23 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9ua0kurw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 07:24:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3UKXEidY9DHYdI4LUBhkz3UOmWgJ8kPYY9WKKjDKSBgiC7X9px7kONXRYFtnPUOksevzvD7FddUvLOFCmM5wZcyif3wpDfg0VezkTcHQiYBfGirxXSczUkw4CgvfDbJQ7iILgM7PW1+xTYtdJbUJuKsjpzrYcINfxT+W9VB98uPZ286AkymNtgT/PStxZNUXGqGyaVBkmIfDCa4Ke08oV69jmPpluGxmCcXg7paGT/D4HyBRauBE0DYHEYgB0vGcqdVw+O52vq9ijzH3lB/UvK7MtAJAn2SgTIZsthViykhbwkN4lTGREXuHauAyk2ZMSOyaYFWXfRZmZimbiZ30g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N09pkKdPzbgdUuFN3J/CIe2HdVGID9mWhw8h+OwsPXo=;
 b=ALF/kttiXYXeyheIC2A9XgVuuJVz3dS+yiJQ3SvmwpOCxEGwz5P/dgY4XiICeOgvf94IEPtbeECXkfg9HQvhteSOIzRe3wvM43FqTIxNJ+RZF1jk/TSwDW5dxL4XKrdmzok10ZdFXv4bp77sVOvz3lJ4q5ft+/eubhzM1FC/mqRMKRoYfhhKUh6MisZceiZBWSLVjgGRmZlFDmFsITTCdno69cmhMH6m1zgWza2lhBmVCtGBWZ+X54y/aZG6RasrzUNSYJluliR1hwIZV9iuFdLBVGhXg60N8fLv+BFpURTxmZfEjdrEMw1M18Af0+rG57vHd3I1QMAHJYw226dLZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3397.namprd11.prod.outlook.com (2603:10b6:a03:1b::29)
 by MW5PR11MB5812.namprd11.prod.outlook.com (2603:10b6:303:193::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 27 Sep
 2023 14:24:20 +0000
Received: from BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::5ab9:4452:a5a:534]) by BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::5ab9:4452:a5a:534%4]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 14:24:20 +0000
From: "Sambu, Soumya" <Soumya.Sambu@windriver.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] glibc: Update to latest on stable
 2.35 branch
Thread-Topic: [OE-core][kirkstone][PATCH 1/1] glibc: Update to latest on
 stable 2.35 branch
Thread-Index: AQHZ8RanJrqC79PrMEm5w8gIkz2gYrAuuONwgAABXt8=
Date: Wed, 27 Sep 2023 14:24:20 +0000
Message-ID: 
 <BYAPR11MB3397359DDB859311507B924981C2A@BYAPR11MB3397.namprd11.prod.outlook.com>
References: <20230927074534.1274994-1-soumya.sambu@windriver.com>
 <AS1PR10MB5697950F9D7CE003C7EE2A31FDC2A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697950F9D7CE003C7EE2A31FDC2A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-09-27T14:18:48.0000000Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3397:EE_|MW5PR11MB5812:EE_
x-ms-office365-filtering-correlation-id: 3799de9a-d4f4-44f2-7f4c-08dbbf65707b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 y7jUQSUkX8uifEfd4DQvhhayWYDFnK4gybPbjSrYNmcwxTzcDoXPpgvQBj4vu3NrfRFa29we6VCfLdB2wEiKcEF/63i+l/234LsFRjbvePgR5MbfJAnfopXk5/JMnlVNyEyiGYLuHmPx2ws2aMnwLHWrNL+lxC/mtMDoIbbQichPyWbktb0CE31EQPtJGWkLnRzlvRYsjRihC1v6nH1hoe2pIRKl6lG+c4fdrsBBPMIqCgC6ShDb3TcNmfHSDGXSacIlHrLgm/Lq8niHX5QOduc/xuOMSTVioebA3kEkTcvULHu5BM8Kfw/5rB1UVvuFKRvcXO98MoPFoOdOxmtUEJZyi++qQLJtwzdYyui+yM1P5B3SsVDnXmyvNeYrDilgStZuVvC5ptZ8ibm5aV9nTTXsrRYgJh4XEMVsKGM/YvZZrIX8sdXJ0lJXck5fn34n19HnLZeq1Lc1dPPbP8YykIC8OgChEPZzaz+G8RJSQPHZpMfBt0fArPc0ccBiG2TeEWtlxV9HQQFDZ5YUL/JxB1aYIhHNstd/2MCvkjxwiSdfLD/4UEohvjs35n/VAKB6fD+aTu8iNmZpJwd3dRzw5NvzhuGyUZXZW93oI66Zu1i/D6NJ9MdcYfx9Dwx5kSIv
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(376002)(396003)(366004)(346002)(230922051799003)(1800799009)(451199024)(186009)(86362001)(55016003)(2906002)(33656002)(5660300002)(15650500001)(8676002)(8936002)(4326008)(52536014)(38070700005)(9686003)(83380400001)(38100700002)(316002)(122000001)(6506007)(7696005)(53546011)(71200400001)(76116006)(66446008)(6916009)(478600001)(66946007)(66556008)(66476007)(64756008)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?nQmqVrFyArNaQIBSYTbMqru3Jh7bpLohPhVKUYDnzSk10+Lv9XwxFQVDPjwj?=
 =?us-ascii?Q?mhM94GOLywsD+NsSMDfzYhZtfOf1ROiHz17/JMwJotj7xHeefMPYnxxGEQSx?=
 =?us-ascii?Q?Q2sWo14TZ4nkeeTQdlL8qTVdOpgnvNXrJ3f0qmwthj1+RQ+KT0eD2h5rv8ll?=
 =?us-ascii?Q?/jVk3cxw9aof1gfpmH62xChLbcHdynKJJEy2IE9339cD+AW0Cv8TjVp+lk54?=
 =?us-ascii?Q?mZ+bUCKN0JRcOv59K7nD09bTPB++YVKYyFaDnAtcwCJvvcudI4Sp2vv+7nFk?=
 =?us-ascii?Q?zPmG1euZNM4gHeA8RswoaxYv+K7bsTG+1FaObjBQWJQ+M5qVnPnXMjkvYTo1?=
 =?us-ascii?Q?jR0cpyrlfB6ENjPUkKCKjNY9teEd+OZDPeUxGKkOd8laQo8+2k1yXPxVqChv?=
 =?us-ascii?Q?EBI+2Qe+oWjBTKThUM9vbU9b1dRHjKU6uVkoXMPK5XSNZ74FF0EeAcC3JeIz?=
 =?us-ascii?Q?6fkAhNiq7a60QmALywSIrnz3fv0Z6DDmFWVwnrWLvW4nW8Y09QBRzCQxKBgR?=
 =?us-ascii?Q?2BtlSOiYwhsz3L3IZYfSGBSUymwnOcbHdCw9Ju7nwJoDG5IeY5QM+ymp1We8?=
 =?us-ascii?Q?Z/1BD5/f7hDlnaQG8jW1lgmzZDhzAWRXCNgvu1P3fvStWbRMuABVV7Ek03+U?=
 =?us-ascii?Q?TI3birWmyI1s3wQE5UsquqHX9vNzYhRtpRx6Fyj7sQ1IAUmFMGWxDvpau+zN?=
 =?us-ascii?Q?SXf1JlTj7fnlRWpb9p7gb6MnLnH7j5SsnF1fE7y7+w4xWECnK2g1aoIGWtIj?=
 =?us-ascii?Q?aelFfpJe+UO0bO7NOmsD64xLqg9l4krwR9qUXmKNQC2F23mT9INDcWO5XxMB?=
 =?us-ascii?Q?OD05ZChbayrk0a62tVk8kUlJyWaxLK186Y0zb92t+J9GyHhsNsfTPrDs0NlS?=
 =?us-ascii?Q?mKWpfVW2WVqIEVBMiSdsasYxfr1ZKwgrvqBdffFxUoHM2c53cNFpc9lydTi5?=
 =?us-ascii?Q?FneHwRSWmu6407tb71CuMLRDDH5mXi4pc8XxA5i8hJgCk4hOccV3WDmLlOgw?=
 =?us-ascii?Q?z74fbBbUD4TSFufEW+ehOwlPq7cz0oTwJru/BpvaXjrwSt529v8PLfLLrl2O?=
 =?us-ascii?Q?a06nRgskw9zO/EoW8D3t7/LI9M38Jdu1AKME2obkPE5ILbDC9DwSWqxJqgyP?=
 =?us-ascii?Q?uI/FJhzOMTM0TaV7ivfcGgbWrQwXJLA+I66qaEEQu31n3scJ/Nia0uC5s/ZM?=
 =?us-ascii?Q?hDnEf8vN2MD2fruU1HbHz6T2ay9osAZMy3YdJuQa0KVGxdt9AVRBE77NcuSC?=
 =?us-ascii?Q?Pe+oDOlJ2m2dz3k+nz5oK+ETLvKuXzM7r8yn4vM5BMQ5hNrR6ayaJQvuyA8B?=
 =?us-ascii?Q?YVvDMIoJCRxo2TcmT6bcOTZg/loulzukNU/YAYw0MWzX2nA9I5ANXz7wDrxq?=
 =?us-ascii?Q?rI0HCy9WaPFJ0mSJ3cuJmAKTzU6VKV7CU9buYevaieZ6YBfkFuKbkhbtbE/f?=
 =?us-ascii?Q?oYBATTqQFf8h2K2OfKRQ4pNjWMx37YvBHzuOCAIRs+sV1RSBZlU32IXQTO+7?=
 =?us-ascii?Q?M5bjvKhpWD89lRVUD8wXUDnogDrQagPO6jSMsJjyis4vR1QXu6/9bxZesk8x?=
 =?us-ascii?Q?TmJNGV9+mnNQu70PkNtQxXzcc9vB0gnqGiY94pML9LGdFbsUc6rbXxCoZFhx?=
 =?us-ascii?Q?zPQH2aahffDpDEeH1JJ89RRytsMXdavVUs2DYpKy+ErQou+mFhanBJofIWTJ?=
 =?us-ascii?Q?FdzWCy/0CVAutil5g/zJzYFtEFA=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BYAPR11MB3397359DDB859311507B924981C2ABYAPR11MB3397namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3799de9a-d4f4-44f2-7f4c-08dbbf65707b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 14:24:20.2584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NkMyKq+dQkOconPivzI4V3AvqdpkfGhATgpuUCk/yA4ZXp4MOd6bTBQCdicHT+3vFrM6EeNHJPpooQc83tEcnQhRM9PhfnkZ5OVQCrAt2CM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5812
X-Proofpoint-GUID: 7d5qXP9HlRsqMeqJlHgH7zqjOfKmQ-d-
X-Proofpoint-ORIG-GUID: Zi0ZCgAJUxs6XDPZASOcgS2CpsbBywNO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_09,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 adultscore=0 mlxscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309270123
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 14:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188327

--_000_BYAPR11MB3397359DDB859311507B924981C2ABYAPR11MB3397namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sure, will send v2.

Regards,
Soumya

________________________________
From: Marko, Peter <Peter.Marko@siemens.com>
Sent: Wednesday, September 27, 2023 7:50 PM
To: Sambu, Soumya <Soumya.Sambu@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: RE: [OE-core][kirkstone][PATCH 1/1] glibc: Update to latest on sta=
ble 2.35 branch

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Soumya via lists.openembedded.org
Sent: Wednesday, September 27, 2023 9:46
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH 1/1] glibc: Update to latest on stable =
2.35 branch

> From: Soumya Sambu <soumya.sambu@windriver.com>
>
> Adresses CVE-2023-4813, CVE-2023-4806

Could you also add these to CVE_CHECK_IGNORE?
Otherwise they will stay in cve-check reports since the recipe version did =
not change.

Thanks,
Peter

--_000_BYAPR11MB3397359DDB859311507B924981C2ABYAPR11MB3397namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"ltr">
<div></div>
<div>
<div>Sure, will send v2.</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">Regards<span>,<br>
</span></div>
<div dir=3D"ltr"><span>Soumya</span></div>
<div dir=3D"ltr"><span><br>
</span></div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif"><b=
>From:</b> Marko, Peter &lt;Peter.Marko@siemens.com&gt;<br>
<b>Sent:</b> Wednesday, September 27, 2023 7:50 PM<br>
<b>To:</b> Sambu, Soumya &lt;Soumya.Sambu@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> RE: [OE-core][kirkstone][PATCH 1/1] glibc: Update to latest=
 on stable 2.35 branch
<div>&nbsp;</div>
</font></div>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
-----Original Message-----<br>
From: openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.=
openembedded.org&gt; On Behalf Of Soumya via lists.openembedded.org<br>
Sent: Wednesday, September 27, 2023 9:46<br>
To: openembedded-core@lists.openembedded.org<br>
Subject: [OE-core][kirkstone][PATCH 1/1] glibc: Update to latest on stable =
2.35 branch<br>
<br>
&gt; From: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt;<br>
&gt; Adresses CVE-2023-4813, CVE-2023-4806<br>
<br>
Could you also add these to CVE_CHECK_IGNORE?<br>
Otherwise they will stay in cve-check reports since the recipe version did =
not change.<br>
<br>
Thanks,<br>
Peter<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_BYAPR11MB3397359DDB859311507B924981C2ABYAPR11MB3397namp_--

