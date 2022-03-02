Return-Path: <bill.pittman@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40493C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 18:15:53 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web08.1042.1646244952456972208
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 10:15:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=32XZzwnv;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=006073fd4a=bill.pittman@ni.com)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2229Wl0j010525
	for <openembedded-core@lists.openembedded.org>;
 Wed, 2 Mar 2022 12:15:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS11062020;
 bh=nT5DosPuc+rfGFSfgCxUbqlbuXHSM/maQvyR4B4POJs=;
 b=32XZzwnvmkuKXDY+sIx44Nk68F8nBAx80vw7TPJTLUHo6Cou16o4Ie0YuJZPFbFjM717
 gRgD9aTTS5YOJMUntMI5sM3JviC3dsC+V/egdyMmqwHOZh8yvWPFK8oroJzI2LlYuese
 H3qJdPDeaF8G7YPAFG4hYtDofi0+3DG6rJhZxJhwulJboqK6Bx7WQZWO3k5GsZ3Vvq3H
 btOILow/zYcVI6bcfG7gYZswqp21NVTovQRemDIfyyjA06QOeJuVFGa73nL/7KuMtqrb
 ynJIXJx1L4v4ujo1leQPPx8ptNMUOd2M317qlSc297PE15kS03rGT5nfufDjTNNGBSDc 3g==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2049.outbound.protection.outlook.com [104.47.56.49])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3eh3935ctr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 12:15:51 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzTQkEXMuFByY5HhJUtqleOwsdah/N8jQmTqoCRTmLnGmIAgY+D5lGRFuEQYcBQqP/DDE4ckgK8jiRnuJqgOFzLCTYEh0kyRcgYG9Ghxy2Ql9BCq5KDwy2oyjYGCtyN+pzE1n7rApQpEnLTNePjsXPR/Og4HRrReKJEeHWQH28sgt7010PSluFMM7TglqFHtYwasNXHwVuh1iyn/yTmL6Dr0HlIqhx4Xv5IM90MC6Q3D/vdlGgHzs4xWBN9Jt9t+oHnvvCracEZ6D59NFwILPl0qey0qVb4ZNUA35ljs4PZ1W80mAFtViKORAfw90WZAZJ3GldgIyy8DsEng/lvKYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nT5DosPuc+rfGFSfgCxUbqlbuXHSM/maQvyR4B4POJs=;
 b=juFTcukXpwuid48upBGBhovtfNdSjOX+KlxmFX4qCPgrgwoDShjJtBMYodfblwl3YKnyulDaQxB6TFehJWZfIZOXWRQamaz/M4bbb6gBr8sS6T9y1Z3tF6oKFifMmizIKITfov/22ANW84ueO5krfaJaRiZC4veueLJZJOnHdGVNuWtS7kwLXLd/4YBW/u0rXv+MO7qLCQbT8wQ8ErwLNA25xKBIzhlnJi/oFF/c3bb6iKRnNIgWjppkizvL+OqN+Ve+5X+BcVner+0WwE7VvAnQ/V6AfcT0+7Mj28obG/lG+4UBMsoQxO4/Gx4i/bAama0N80/tUFuMWUnnJ1A7iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nT5DosPuc+rfGFSfgCxUbqlbuXHSM/maQvyR4B4POJs=;
 b=NqlaK3gqEk/teFX7d4Gjh4HgKwXzWUhTr9WaDCJldl7976Cxk4TMdAagoAqphC0xWJVbs8aHf2LhmIvKWVO2BDT8NE1Y/FupkAsh4obbd7GecKw7ii67VJ9byTXJc/fAvuqnGz/uaB0q9o/5okk8i20R68ryLYKxtq5WG88fUS4=
Received: from SN6PR04MB4909.namprd04.prod.outlook.com (2603:10b6:805:95::25)
 by DM6PR04MB6940.namprd04.prod.outlook.com (2603:10b6:5:241::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Wed, 2 Mar
 2022 18:15:50 +0000
Received: from SN6PR04MB4909.namprd04.prod.outlook.com
 ([fe80::d939:c66:be10:4323]) by SN6PR04MB4909.namprd04.prod.outlook.com
 ([fe80::d939:c66:be10:4323%5]) with mapi id 15.20.5017.027; Wed, 2 Mar 2022
 18:15:50 +0000
From: Bill Pittman <bill.pittman@ni.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Use custom kernel path if provided
Thread-Topic: [PATCH] wic: Use custom kernel path if provided
Thread-Index: AQHYIoyKZItvPDvdikOaby+Cm61bLaysfOLj
Date: Wed, 2 Mar 2022 18:15:50 +0000
Message-ID: 
 <SN6PR04MB4909FC89DEEEC1268D75DCA2EC039@SN6PR04MB4909.namprd04.prod.outlook.com>
References: 
 <SN6PR04MB49095E1D789819C9E3CEC881EC349@SN6PR04MB4909.namprd04.prod.outlook.com>
In-Reply-To: 
 <SN6PR04MB49095E1D789819C9E3CEC881EC349@SN6PR04MB4909.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Enabled=True;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SiteId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SetDate=2022-03-02T18:15:49.497Z;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Name=Internal;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_ContentBits=0;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Method=Standard;
suggested_attachment_session_id: 3418f1e3-a75d-9e64-3181-a2719b10ceaf
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c48d545c-986b-45ea-6f31-08d9fc78ae5e
x-ms-traffictypediagnostic: DM6PR04MB6940:EE_
x-microsoft-antispam-prvs: 
 <DM6PR04MB6940038B572432CF824FC296EC039@DM6PR04MB6940.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 R/c5kt5BZmR6gLY7PEW+iSaxt/PLtfr4jFPPgD+ZQWoiu73mmqg4KZGaDcZ9gfp7le6MCMiADSLdHctewNKq9AmyHM3mvVVaTI2A8xvm/mDK4Wc8eXgSHAmuMP26gU/Fkgo8ScoK694EWqHSi9/tamqLEdSxN5wTqCOZOgyODyh1AA0jQH1iuAJmkyyRB4MWqFwo8ytPKhGFpVzxV0AjXv8FBHCLSZSSHXOpbPf4cBu8a3DmuFIpeDJOHaggeZ+UrohP9G1QE3TdTCR+l/zogakRxqp+YPkdTdmpk2eMqPHFRKssWSxsq93w5MAmuGUPQtv6v89w2VqCuPLp7zUnvGedt5aZbiXnwxkg0tohCycPro4mK5CGvATuOCGHIsUXl3uV9Jne+hAASGve3vozbCeBlIzSGfUgvStfGUAk6tgKhE9xk+uiabC7Br8+qn+zIO4qa9DKFzfjaGnOLPxQIkrxiSBYtxFGyjNrUvBDPGcQL4a8xnZ/370UuJMykJ9B3AgJCiUCBWWlB0au1+ChkC8qM+kkz8JHbLUTaYJZVocXxUoGLOXqyFjVeAUtjFRASG7ThOoRLj9ef67mPlQInJ/XtzHa16Fxt/gllVvESERnUTFfVw7NJ3Fxn3UvLeNo0k4ilb+zkxqu0vdU5UtlSMuBQGQUb3YPvXNu8JIaR7zfGPQn1h36cDuWohjNsictAb0cv8T/A879LdcRdA07KQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4909.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(316002)(8936002)(5660300002)(38070700005)(7696005)(52536014)(44832011)(66946007)(66556008)(66446008)(64756008)(76116006)(66476007)(8676002)(2906002)(4744005)(186003)(33656002)(26005)(53546011)(6506007)(38100700002)(19627405001)(71200400001)(122000001)(55016003)(508600001)(6916009)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?wFT44gLS1DN/ObHY28E/BbbHIi6Nqe70UemRLSClj14buWgfo5pTllXOR7?=
 =?iso-8859-1?Q?Az8JUbP3X6PrIx0Bmq5BGf33vizTlclYjzsmjeW3P0eZW55jxtXRgzdOBk?=
 =?iso-8859-1?Q?1EPq944rtarE2rNqYAbbe2Hate74bO1AjtTRHWp4KgeMwEMQq+97734dMV?=
 =?iso-8859-1?Q?7/b0r1qTgBYK3H485JBTD2L+42psv8fmlzIWSZNofjGcrjkFxEoGmPirex?=
 =?iso-8859-1?Q?XJ1DuvrQO4PAqMZFkdn9CDwgSzW/PchwR/+eRNXmBYUv4KkqPTM7N6PEkx?=
 =?iso-8859-1?Q?vDcPkI9Bl2BHm6D0Wz3q+5KCwTYndtM1ky//JAClk2XG9trxbpKxDiVtYU?=
 =?iso-8859-1?Q?3akCTnmlhuekm+SWt565H0PxW9b9UjZGuvoMRC/NA+9de7HKyoEWOhq5MV?=
 =?iso-8859-1?Q?DSqzC7udI2rK0ZkJTWE0fgefHJCBFpTmHdOjaXzm8ns4H/EedQbRLiFTyy?=
 =?iso-8859-1?Q?1lxqvYbZAYdrawErTHKomvQx/hGOyX3lZ2/25mNy4r6D8G/u4XPSnTaSip?=
 =?iso-8859-1?Q?hNl0Ft22ObBdR55Zssj54CfeZzBE9p4NlZxYE5Q+xEg72ayBhKbMPhhFD8?=
 =?iso-8859-1?Q?myP4oEh3PiAUytwYukSHr1hVigGD8BDOfs3w3dV3gR7SSR9EoWoggdnYOq?=
 =?iso-8859-1?Q?DhhSZieQop8mJ6DbJmXl0Zbh1xY0kSsSukVRaPFsuvF12tJi/EpTNwepv/?=
 =?iso-8859-1?Q?Rxh7HFFCMZqHMuDSSB2WFOrt9pFXuJeFE6UhWotHSWm/xIjciwYTCJMA+w?=
 =?iso-8859-1?Q?eVbCOLDp9B7awMRedccswjz2gievOEnkfXR7RLIOTB+woyUY8q7Teqn9Py?=
 =?iso-8859-1?Q?PgfseNZBE2QHk6FiAxk5RBUUYaGItTJIDhO2ajbfKANVZyZhwssFlLnMa1?=
 =?iso-8859-1?Q?CHx1AmiE7WzQTGMP2BJ7xozuBTYjQqcQeVjwiHzftxXQIHkj0IgaeiWp4H?=
 =?iso-8859-1?Q?zB0bMYijTrhsOpk7jGyvvn60uLtWHF/6ncEYqTZzHHk+OOBcoquN32WyU1?=
 =?iso-8859-1?Q?AQsOlUZciSnNW1ebfl9Aq04S3DqMEluViEbWnWfobWimoNIImFBk5ifpfs?=
 =?iso-8859-1?Q?VxUMPm/+M1plLyXHJVAwtDgeI2lkD04oItNOEGHUu0eTVuQ+C1F9X5vBts?=
 =?iso-8859-1?Q?ybI1hmkqMLQTym/WiUWsoAUENAMxfR3U1MZmsPbUC10mP2WZ9zbqLFcHca?=
 =?iso-8859-1?Q?4E8+lHEJdmSIyoFHVSz6fqMTuV5xMT7AU85NwPZACCHdWq2SxydA3JvC/I?=
 =?iso-8859-1?Q?zvJFKYdcGJTbAFghAbRrZATBZk2pUAbtIZZMHn9stH3z4FtIrmYy8kAX2C?=
 =?iso-8859-1?Q?JnMUznvZ2bqbD9kWimvUwBtMnWhlZU0eBvzbBMLZ9aCWBLGClH3uFBHb+3?=
 =?iso-8859-1?Q?vvr2e5vriohYxKM2kssonRuk5V2I9Ky8+jL63UrR6Ud2VSBUjzJT+IkZkL?=
 =?iso-8859-1?Q?GCZuQQhtT5hyHVdBkFMrUq8W7rzFUYuDxRcr69KsiOwbtEWMXfjLMjGBKT?=
 =?iso-8859-1?Q?tU+PYIByIuJyhq0MdwJFzbCeuGD+TJF1Hx/a4xqtmaVwoZbcguCPYj7T/P?=
 =?iso-8859-1?Q?f4ZJfJsBmi/82ny7p+xaje6/OwmAHUjE/7DHVkKG3vCCSqjWifflHe/LDB?=
 =?iso-8859-1?Q?DJJzKJ5/kZKyM0Bq9Nka9tv2luJjFCI2bVRprjbL43y9Juct9ZZ4EJwQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SN6PR04MB4909FC89DEEEC1268D75DCA2EC039SN6PR04MB4909namp_"
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4909.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c48d545c-986b-45ea-6f31-08d9fc78ae5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 18:15:50.0397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Fts05p6eWRilJY66Rhbc4IBlRIxBnmwxays7H4VFZEG37gq/bAqSfUCFf/vE8DB5x4UmU76dRwZ/tw8K229epg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6940
X-Proofpoint-GUID: NqSi7HUZJEcCXifEfnn_IjZ65ItQwu3a
X-Proofpoint-ORIG-GUID: NqSi7HUZJEcCXifEfnn_IjZ65ItQwu3a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_12,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=529 priorityscore=1501 clxscore=1015
 spamscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 18:15:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162618

--_000_SN6PR04MB4909FC89DEEEC1268D75DCA2EC039SN6PR04MB4909namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hey all,

Gentle ping on this patch, any comments?

Thanks,
Bill

________________________________
From: Bill Pittman
Sent: Tuesday, February 15, 2022 10:54 AM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [PATCH] wic: Use custom kernel path if provided

If the custom kernel path is provided in options, then
use that path instead of the default path.



INTERNAL - NI CONFIDENTIAL

--_000_SN6PR04MB4909FC89DEEEC1268D75DCA2EC039SN6PR04MB4909namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hey all,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Gentle ping on this patch, any comments?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Bill<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Bill Pittman<br>
<b>Sent:</b> Tuesday, February 15, 2022 10:54 AM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [PATCH] wic: Use custom kernel path if provided</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
If the custom kernel path is provided in options, then
<div>use that path instead of the default path.</div>
<div><br>
</div>
</div>
</div>
<br>
<p style=3D"font-family:Calibri;font-size:10pt;color:#000000;margin:5pt;" a=
lign=3D"Right">
INTERNAL - NI CONFIDENTIAL<br>
</p>
</body>
</html>

--_000_SN6PR04MB4909FC89DEEEC1268D75DCA2EC039SN6PR04MB4909namp_--

