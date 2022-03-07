Return-Path: <bill.pittman@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A2FC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 16:37:49 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web11.42.1646671068122944089
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 08:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=z2aWKr1L;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=0065ecdf95=bill.pittman@ni.com)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 227AIhno022224
	for <openembedded-core@lists.openembedded.org>;
 Mon, 7 Mar 2022 10:37:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS11062020;
 bh=zqXufMRop35ve/fgjf4mx72djU7QhrXGr389IvWifc8=;
 b=z2aWKr1Ly7hs5AZ1uo7fPCd6hYRcIArodRqJXuBiM2Y3kFqQT0rP4SuDib7ZO3tJJunx
 i39Oh4veX02HEqi6zSDdnr0FO+WOIaRzEcml1SYxWXWrujobI7xxMzOu9tmfBhyoFbIy
 a86tCX3y5OKlBARM+npmIDPswt+S7vmyFaziPX6CizCsfk0w6aiTq1DGdvAB/+Sghkda
 FBDe8waf5plYVVLT7WOzYp2Hu180iSJyj7nY+PWElRdFWLsHrFY06ChAf1v59Myoy4L4
 DRTvPkb/EGxj9uyXd5I0wkJtO4YCL9ws0Cl8Xt4fidwM9RjM8uW7hbpTA0guF3lAiQV4 kw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3em4s2ku99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 10:37:47 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pmj1eyxyuLQrx2bgJXjxeVafEwAeTFNFeOqZA2bj+tvBZXMKaiKX0HsMeIDwyIGbJrwDjSxYufIPOWYyo/vlTf3KzEZMf98j0tllC7pPVIitoE/szeXqc8M/pb8spojZVA9Nx9GvQjejnW/d5TCm9Hic3NTmqApz6uX7jXoy3BIpJxDCNsSBk9P+c9B696eVk9OXthEUrnZT6vgM5XHbsgZhOaJJIeZayrMeDFyGfGh2/5gLePv++jGnGomGcXepIA4MPWrw9gzQ6teOthkaNl0bzHUdKIn4R+V42pe01/CSiB17NhIbj+MQfZ/R09NWUY2vrzk+c5uoPUwuYS9dTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqXufMRop35ve/fgjf4mx72djU7QhrXGr389IvWifc8=;
 b=Cwbs6QvDKbHY+ISfrZeKVy2vBIYYd5uVBS7iKqpxpZD+7VxqtYEmfGsOWzN0G8w/5HALIKHOohrpsSF1w1kiEdEugvsXsVW+JA330FHEbqqYaIwc94F2IvjcriMQ+b60c771Vdvpo13u0PNkH5trZS0tlCKxGcVXXXeeHZiLvmBr+zsL0vyaswM5D1hM2/+9vS1b3jJspso8kIkDz1cHfoEGSFRJ5MzXC3GQxaICugQc5QRCJsK7fuI703mXwfeIeFwtK191LTsrNkuh7ZDKlcRPuiUHvH+T/tDeeyf1xcN4SHS8gXDTcePGZMMdPizPIybm1BUi1T8FPI1tMZl7ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqXufMRop35ve/fgjf4mx72djU7QhrXGr389IvWifc8=;
 b=VziTfkUzkcnuMJJY5moCkzS20PJOvlZwdaMcG9Hm6cXsUTEL1MKOdSF10XSOuO8npYngipmXPtcOi/HT82F/jRRps5t/tH5JmhQolKS6mWk+bWwygxu2PMtg0rJMtvuAruJY30JNkdNVyzhb/XrCUDekMaSV7BOrxT6otT/+iwg=
Received: from SN6PR04MB4909.namprd04.prod.outlook.com (2603:10b6:805:95::25)
 by CO6PR04MB7811.namprd04.prod.outlook.com (2603:10b6:5:35e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 16:37:43 +0000
Received: from SN6PR04MB4909.namprd04.prod.outlook.com
 ([fe80::d939:c66:be10:4323]) by SN6PR04MB4909.namprd04.prod.outlook.com
 ([fe80::d939:c66:be10:4323%5]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 16:37:43 +0000
From: Bill Pittman <bill.pittman@ni.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] wic: Use custom kernel path if provided
Thread-Topic: [PATCH] wic: Use custom kernel path if provided
Thread-Index: AQHYMkGr69VQBj6An0a0h9HfM5RKgQ==
Date: Mon, 7 Mar 2022 16:37:43 +0000
Message-ID: 
 <SN6PR04MB49095AAF3038D9A9D2A9E413EC089@SN6PR04MB4909.namprd04.prod.outlook.com>
References: 
 <SN6PR04MB49095E1D789819C9E3CEC881EC349@SN6PR04MB4909.namprd04.prod.outlook.com>
 <50482c34-35af-4e12-8ce6-db2f1b7c1914@gherzan.com>
 <SN6PR04MB49098B84F7D5490D734B7EB1EC089@SN6PR04MB4909.namprd04.prod.outlook.com>
In-Reply-To: 
 <SN6PR04MB49098B84F7D5490D734B7EB1EC089@SN6PR04MB4909.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Enabled=True;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SiteId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SetDate=2022-03-07T16:37:42.622Z;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Name=Internal;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_ContentBits=0;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Method=Standard;
suggested_attachment_session_id: f86cdef5-2663-b59b-a26f-65d7b39e0ad0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a42b949-6929-494d-b942-08da0058cd93
x-ms-traffictypediagnostic: CO6PR04MB7811:EE_
x-microsoft-antispam-prvs: 
 <CO6PR04MB7811C0851A1684BAE25D3782EC089@CO6PR04MB7811.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YgEX5lBnK8brTs6gUfiMr43aFn2IrWgwsaQmbOS4E8iN4CYfFpGREFewqff/SRlPxuqbMQDAYC6YlaHRZx/5G03+zGeKL+Fj4OBby6DeRJSgRVNNHghy7DIrTYYVrNC4ZSPHd7daR4U7UN4YcMOCJWbZBpGHvn5OdzfKK3Hox84TC3bNK7cTT7yJ/ITytFxmPbUOjFZ5eAYBcRIPi0H8HpQ22Ot+H/hFWAv4Wq9YB0/SEiB9RLzB8RKFindnJMLdeQmzKPlveppZl3iL+OOzm8JwHPtERZBXeX3YwcQE0NNWRvZ+yEwvIK6BU+mlRqmEqUFf4bqhYS0oI6xYjuUpujmHxiMTikY74ykysv0ONGezxYygDN8ZiZUcYft+4Upk2+qVWZXsSwR31SYEL+qURh6tOahbfrHEZBGbKeA+2ZF62+Bc/K1Ik6jhr7v04GGD4hncSpqeN6xdYDeq26KcHtNTMB9dNk1yXEOD7G8Vj/4sXz1UFthVzByTvcbIL+s6PrZHfwumdoTRwMz0BuCppgb4iWVYFMABJUT6bdQ3hPKEnm7uwRNiflIymByjL00Q3aZ2feZLn+yPHp0b1Y1G9M26Fto1cuHFU/7eZKwk2huEjKb7wvcTA4e5obCn4boRCJO/fytuGoeOZUfrMqULJC2F3eWG2GL8GrIPT18U5IjlbtP/pYVuAqhINaZPdtv5b+RvQTlWEE6KVP4Lrxr5Qg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4909.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(71200400001)(6916009)(2906002)(5660300002)(44832011)(8936002)(52536014)(33656002)(19627405001)(8676002)(66476007)(186003)(64756008)(66446008)(66946007)(26005)(66556008)(76116006)(122000001)(83380400001)(38100700002)(7696005)(53546011)(6506007)(2940100002)(316002)(9686003)(38070700005)(86362001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?puTe5x2VCrGY0TWc+hUVQ8X7CViMT/dJ2xQXYLFycj+7Ea0+sDIdi+2tF2?=
 =?iso-8859-1?Q?GUIes25fywU5JCBdWZg9h/EcZM5G88Osj0h6eJhgJH6Y8PldXwu5lp+qg/?=
 =?iso-8859-1?Q?VX59pUWZklj7UuXrPYmLFdO9RHoolqAsS2Z2de9UE0uxM0W6Ks0ksTQs+Y?=
 =?iso-8859-1?Q?xKm0EHmep+2H0A5rBUHokwEHeW9SSKJk4MmU90S2sBtGjwl8/YhjFB+8N1?=
 =?iso-8859-1?Q?OYlRqXMMxcnX0/pnGxfTTm1Mjiw2EmFgET6V7tQWSgh6QMmRaE4WJUa11M?=
 =?iso-8859-1?Q?7/dvx94PFtWK6453aocvl3iYarktWQxoXnBJQ4X7Ng4O0onvu0uqCpGx9m?=
 =?iso-8859-1?Q?SU/2BPRbpvWZ+s2hQNtWUwXwF1QqA4e9vMAMf9B1Y0XVkb9gEIluXX5oIX?=
 =?iso-8859-1?Q?pGYBcT5oEzbDwNuTCzc5aaz8SXpCzdopo4fOjnQlH5KbyB4Ko33Ly5E6/5?=
 =?iso-8859-1?Q?NIvj4DOTWChjJwKABmIEel/iyAz4QY1AhbSMwMxmGjGE9fggEVvLlmLhyF?=
 =?iso-8859-1?Q?p7oqMAy3SCeLJc8NIXRI5psf5969ARFi1fVswsvKjZbRPTyhNmkrA8XyPX?=
 =?iso-8859-1?Q?SDknmw5dZyj99QKETcPZ2B0O0iuMFOq0G90Gc3bqDMDnuQL4ChLuxowtPH?=
 =?iso-8859-1?Q?DV0o4g37iUt7fQ/Hr1H68Gj/vyUE2ywSsHzcCRiYjLlcgV13IkNQwy5hlE?=
 =?iso-8859-1?Q?+p0/HV9/tUTounITy5B37IX1TwCPqh9CXW1YueJYe4dOYsR8vEv4DgA1Z3?=
 =?iso-8859-1?Q?BCNZ0f9ivT3/eE++zc9II+1WYattlzmI3co0jrV6fwHdduQ757aDOhHWkE?=
 =?iso-8859-1?Q?rW7gpOVKPvWZHocOcsUMlDeow5sMj3U8vr0zCWTwH0VP09uJf4Uky7SI+x?=
 =?iso-8859-1?Q?DCT2lM6C2Mp9wNEqpiE6mUc7fj71vsWKMIZkBZk5iWRbzAHd6XSQzdZSU+?=
 =?iso-8859-1?Q?YrQ89HDRPfTux2p0u+9NIwPHo/msFX4BunV4cZIMp808LfA43C9WU+uLpx?=
 =?iso-8859-1?Q?rt3GxaOTLjSEyck8efzuKzVxvBVI7W0vWwjQF7m2rGlv2/SzzO5yAMKuLs?=
 =?iso-8859-1?Q?rliWf4B7m7ey5M4o/albZ1LIDL0ztEHUNJ6YARjoeelGzmKaznGn2Amt5n?=
 =?iso-8859-1?Q?aEbbANGe/MKvglvPgyR21p9EXmyBs8SPEFOGqs/uEsVVm75dzk8QTdt3sR?=
 =?iso-8859-1?Q?ZFuKN9BWl7Rwcri878IHvD6J3QHjDCaL47BDFa+ed9gm2CJoNOxnKkFEFA?=
 =?iso-8859-1?Q?RivEp/gLaqt1DRBfrr7etuzSboNnxvM6dQxN1N5OMRmahTeG6OPkwIdzLL?=
 =?iso-8859-1?Q?ojdSv4NvV87hPpUtydF8Mp0yk7dqzTwIJuN1LK18aq3pwtRZEJxd05HPXC?=
 =?iso-8859-1?Q?X9V3mrmc0KjPZMPH1LTv2mDp5TAViYRj36SUkAQR0gx6WYMOQ7/OFumd6c?=
 =?iso-8859-1?Q?bBfZfZs5GsWjCJCN1VmuLlQ96BRuziU50lS9Q+szwiBMkuCTJm/uzoZBJ6?=
 =?iso-8859-1?Q?6Zwou9xsbjYNbI6w1IeqNJ+l7RgM4n+fJPcZtY6AsxPGjLdsqI8t7IMr8V?=
 =?iso-8859-1?Q?nDZ/brH10yhl5Gh+veNpNPEes1tJLYc7ePrqQ0PmTCHRKU2eLSMaqGAMT/?=
 =?iso-8859-1?Q?LvHcFzCPoYRhg8RwP/QoLMCLk/hy+Vq3Hsz9ODDQLw84I09ytnd624Lw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SN6PR04MB49095AAF3038D9A9D2A9E413EC089SN6PR04MB4909namp_"
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4909.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2a42b949-6929-494d-b942-08da0058cd93
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 16:37:43.1541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 LiNfivHJQIfZYSBks2HFbWOMnLwIiUA+Dk/nfWomcdXbL25RXg9k8rhizJt5zNjcBkZSxzx48fmeE4l3C0ICYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7811
X-Proofpoint-GUID: iYS8bSdPTiQ8O961VrobWUTdfU_0aUx4
X-Proofpoint-ORIG-GUID: iYS8bSdPTiQ8O961VrobWUTdfU_0aUx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-07_08,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 phishscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=938 priorityscore=1501 suspectscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 16:37:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162854

--_000_SN6PR04MB49095AAF3038D9A9D2A9E413EC089SN6PR04MB4909namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Andrei,

In our build, we use a two stage build, the first stage builds the IPKs and=
 packages files, the second stage builds the various images from the feeds =
created in the first stage.  We've run into a corner case when the kernel r=
epo gets an update that bumps the version, if that happens, the kernel will=
 rebuild during the second stage build (the kernel recipe is on AUTOREV).  =
Unfortunately, that now creates a new kernel with a newer version that the =
one in the pre-built feed.  The image recipe is then assembled using the pr=
ebuilt feed (and the older kernel), however the wic script picks up the new=
 kernel.  Then when the wic image is booted, the new kernel in the boot por=
tion of the wic image is unable to find the right version of modules and it=
 panics.

This is only an issue during development while the kernel recipe is on auto=
rev, but its causing other teams (and us) some grief and this change allows=
 the wic script to always use a custom kernel path.  In this case it allows=
 the wic script to use the path to the kernel installed in the image recipe=
.

The patch I'm proposing allows options.kernel_dir to always be used if its =
provided.  The current code in wic_create_subcommand has a code path where =
it is presently ignored.

Cheers,
Bill

________________________________
From: Andrei Gherzan <andrei@gherzan.com>
Sent: Wednesday, March 2, 2022 4:06 PM
To: Bill Pittman <bill.pittman@ni.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [EXTERNAL] Re: [OE-core] [PATCH] wic: Use custom kernel path if pr=
ovided


Feb 15, 2022 16:54:28 Bill Pittman <bill.pittman@ni.com>:

> If the custom kernel path is provided in options, then
> use that path instead of the default path.

Just to understand this a bit, what is your usecase here?
--
Andrei Gherzan
gpg: rsa4096/D4D94F67AD0E9640


INTERNAL - NI CONFIDENTIAL

--_000_SN6PR04MB49095AAF3038D9A9D2A9E413EC089SN6PR04MB4909namp_
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
<div>Andrei,</div>
<div>&nbsp;<br>
</div>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
In our build, we use a two stage build, the first stage builds the IPKs and=
 packages files, the second stage builds the various images from the feeds =
created in the first stage.&nbsp; We've run into a corner case when the ker=
nel repo gets an update that bumps the
 version, if that happens, the kernel will rebuild during the second stage =
build (the kernel recipe is on AUTOREV).&nbsp; Unfortunately, that now crea=
tes a new kernel with a newer version that the one in the pre-built feed.&n=
bsp; The image recipe is then assembled using
 the prebuilt feed (and the older kernel), however the wic script picks up =
the new kernel.&nbsp; Then when the wic image is booted, the new kernel in =
the boot portion of the wic image is unable to find the right version of mo=
dules and it panics.<br>
</div>
<br>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
This is only an issue during development while the kernel recipe is on auto=
rev, but its causing other teams (and us) some grief and this change allows=
 the wic script to always use a custom kernel path.&nbsp; In this case it a=
llows the wic script to use the path
 to the kernel installed in the image recipe.<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
The patch I'm proposing allows options.kernel_dir to always be used if its =
provided.&nbsp; The current code in wic_create_subcommand has a code path w=
here it is presently ignored.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Cheers,<br>
Bill</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Andrei Gherzan &lt;=
andrei@gherzan.com&gt;<br>
<b>Sent:</b> Wednesday, March 2, 2022 4:06 PM<br>
<b>To:</b> Bill Pittman &lt;bill.pittman@ni.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [EXTERNAL] Re: [OE-core] [PATCH] wic: Use custom kernel pat=
h if provided</font>
<div>&nbsp;</div>
</div>
<div><br>
<span dir=3D"ltr" style=3D"font-family:sans-serif; margin-top:0; margin-bot=
tom:0">Feb 15, 2022 16:54:28 Bill Pittman &lt;bill.pittman@ni.com&gt;:</spa=
n>
<br>
<br>
<span dir=3D"ltr" style=3D"font-family:sans-serif; margin-top:0; margin-bot=
tom:0">&gt; If the custom kernel path is provided in options, then</span>
<br>
<span dir=3D"ltr" style=3D"font-family:sans-serif; margin-top:0; margin-bot=
tom:0">&gt; use that path instead of the default path.</span>
<br>
<br>
<span dir=3D"ltr" style=3D"font-family:sans-serif; margin-top:0; margin-bot=
tom:0">Just to understand this a bit, what is your usecase here?</span>
<br>
<div><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0">--</span> <b=
r>
<span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0">Andrei Gherzan</s=
pan> <br>
<span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0">gpg: rsa4096/D4D9=
4F67AD0E9640</span>
<br>
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

--_000_SN6PR04MB49095AAF3038D9A9D2A9E413EC089SN6PR04MB4909namp_--

