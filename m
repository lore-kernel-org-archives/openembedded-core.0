Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50E9C433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 22:17:27 +0000 (UTC)
Received: from mx0a-00010702.pphosted.com (mx0a-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web12.67.1652739443922011255
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 15:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=eCTHHt/h;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=2135cd5606=charlie.johnston@ni.com)
Received: from pps.filterd (m0239462.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24GFuKJ7000634
	for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 17:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS11062020;
 bh=zfaNEFnqi5qWDPCFNd6bXJughhZpqZaa+xBJxE5mmm8=;
 b=eCTHHt/he9Cxd1yKYWuTCY4V4Y0Q9T3qw92swi/+aPVfYE9tNOrmxrxWH24ssRp8W4k1
 oTbZoa/wv8vOuUvanGGzFkKH3IQ7CGNxEh/NzvIY68xp1VSncUJKa6STPpWFoqKkjFiM
 FrlI6I5yiXDV03bpr+fBfi+/8ZRwJFiDn1JsbCGypct6BK+NVTS9a7Y50p0W8J3sIe/a
 7vfvYnOesRVR5NaW7RY0fCojzlhgl3SZYE08NRtRSqZ13OigqQa4FqQErHCbdPrf2SqX
 cb+iTeLwovM6BNxfHL9VYfwCVD3IwMeLTdWqwt6kVVm1yi8CaqHIRleQ123lR5vb2+zI JQ==
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2174.outbound.protection.outlook.com [104.47.73.174])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3g28gdw13h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 17:17:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gogg+3RfcU7J/Mbq/DKMJyeeXySjgoto6cePMYvfZD4vjgXGYq4R7Zx5YLa8owNtY5aOLmpTIqDCd2wnQ9VR81Zy37zwdJxMD32lNuyDouLuIi6IIDIuDB9JR3YSqivZ2ztORJSX8OAgM4opl7nUBr4ojIwFr/noNlGAd6kBMHEcBHMosAbtVNX9WBHdDB0XTEznGkchBR8o+legbKZJoEhTT/ErkMi+YfympTo6Q7VZoYFlmULmv7jFfoDYcL9OydSF3L4/HsC38mSki8wue2Yj37WUVlOmEYFLnACOBgI1LqmRdtl/zmcwG4fIyv7TZvUWS9RK9Z1jMGYn5BFVyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfaNEFnqi5qWDPCFNd6bXJughhZpqZaa+xBJxE5mmm8=;
 b=cft33c4pfzCm2HRyf1jqnC87I6tbVWMBPecdYw8farHNn4wSAap9AUq+54TRj6wR2u/Pver0XHHj/dTSTnU/KmJ4D5eEUBO+vvV978IgK8hLHIAbU4ksNSPgengMn6DJXsKt/Yw3E8wjErEZn+E9f0f7MJ5n3VYXt+UXxD5Bsmx1uN1ZSaRHu5vwYAfe0seUQg+FKp032eCpTj3KQEJZwNLg6pUk9n2ddQH//o8jpnrfMq/QqoHoBydnmMIswEk5BnZqjMN2nTG05eOp7wmNKJm/drSXdN1+XaMjlOuOmshyHCMTVaOVazC6Mq97H2wAnX8WwJzMM7ugtgvsfw/inQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfaNEFnqi5qWDPCFNd6bXJughhZpqZaa+xBJxE5mmm8=;
 b=lyy6H9lXiHOAH+/6YavZHr/spcfpHEBy7F/Y+vv21UxusZ1TGP5xZVVEfQxY1s3K5JZj5l8T2BGKklLoU1LId3kl7bTGHhApoLOBcnYvMCa/jnZ3Eg+OD1WBQdcrGTulx6XHpaax0uFHqK+lT3UQ4zy3vjaTfwQWBFMG7G0YcrA=
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by PH0PR04MB7640.namprd04.prod.outlook.com (2603:10b6:510:5b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 22:17:21 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::e948:d3c:a17a:cb3]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::e948:d3c:a17a:cb3%4]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 22:17:21 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Installing locale.alias from glibc
Thread-Topic: Installing locale.alias from glibc
Thread-Index: Adhpcq9NoQJ+c6UMR96KUBN3+HuJFA==
Date: Mon, 16 May 2022 22:17:21 +0000
Message-ID: 
 <SN6PR04MB4879D776C450804C874FBA60E1CF9@SN6PR04MB4879.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_ActionId=7d09dc4d-303a-43a4-8d4e-992298ba012a;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_ContentBits=0;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Enabled=true;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Method=Standard;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Name=Internal;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SetDate=2022-05-16T22:09:35Z;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SiteId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 779dfe20-5fdd-494a-5796-08da3789d91f
x-ms-traffictypediagnostic: PH0PR04MB7640:EE_
x-microsoft-antispam-prvs: 
 <PH0PR04MB764010750B117805F0FE9673E1CF9@PH0PR04MB7640.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rE/xAntk15/3qOp/satacqfmomGCVNFcKgLKGHol4oXrzFVYK0HSA1PW7/Wfb5mxNgK+6Trb+YLJxucb+pYy5grR/c/5mShoJHwNK5AHu3adnHBGdt4Bj84BhlTIVhQU+W8Lu7LwT2gtkl5L7O9luu1apJCyokfMIu4Jn4/7LLJoIATrLbZmpkV7ETUAa1r4XKU66IxtejJIQR58Hhi5rtUhBHK+TN2O0LKgggotLb+fZh/JzW704pbBFExtUnmK+5yR37KkRfDjJ3c4XIk4vpu63W034nk7V7sQt4WiqiQGDYSZUGaNz+avlC3F0CEVyYeP9xK4kOlWXTRPZRqHti3meXxnJ0UDiOdRICTYsIwtruL7F+Q+GRmB4psxBU1K7n8uywXWLOZpXX9RI1XQU54Ybp37NavnqkhezvIEEwWpZZjyVzR8jbwTAmQInS4KC3gVXul/xB3Sz4x6VRN744sCYcgCE0kPTAS4Mym1LwEqhj5UhXLeHOMXllf0aKcanc3qXSMfpw2V360JH0MQWbaXRqQAt5IpWuapnvOwmdlzk3HiBsfAxqC3fhy6Eb7FULIJA+ATbIuRwVy4NKM61+JHJ6HpZuj7D4CNz7eOYD4INxYup0cPWtDk2uRNIkkLaYHHh5oy6mztymw7Lo77uIgprXDDP45zHShhZKBrFAyIWkMBw/xsMfjtltpH/ULemasZzGpmgMjs0nQX5lYf8Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(122000001)(38100700002)(38070700005)(7696005)(2906002)(316002)(6916009)(9686003)(86362001)(71200400001)(508600001)(5660300002)(66946007)(76116006)(52536014)(44832011)(64756008)(66446008)(66476007)(66556008)(8676002)(4744005)(8936002)(6506007)(3480700007)(55016003)(33656002)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?KJ1ha1zFBQ6QpLzZiccfzmQ31V1Rq1EqUfEUWN4QaUP1XjS9QTkh3hBhAA0K?=
 =?us-ascii?Q?HXzMDip3RhS9je4ZT3Wkf380eGHUy3MIKiu1npbxJNHRxwyBp6Q/ITXmAUt8?=
 =?us-ascii?Q?7L4DGCK2x743wXKfZl576BFyHzP/eUV9o3yGdwXGq8qN18qV824D8PU3t+kU?=
 =?us-ascii?Q?EmzXmojD4nKF1HXSGmJz6TSWVF19/tu5VWRIyTKJXSUjSJJUwkwlQhlVwKUS?=
 =?us-ascii?Q?2rdOdjjKNHghAOlSfEKM+7tCb0qNodUFKdPf80K78eejGXWtpMGCS8XpJMcU?=
 =?us-ascii?Q?DKLNSfS2AM9CVnKhRLFCUxXOGobCD+SNeSzJsPM4QLDVdIMY8Ng8ODhgxAAN?=
 =?us-ascii?Q?IJU/ObNTBn2Yq/IxgynaIxODSO64vqp2QHWV37BSKBg2gkhbOGwyXZ9/69j6?=
 =?us-ascii?Q?gEja5FU6r0NyLmVAfQMOT92zMre5WKbneRtEL0J9nopGj9OExu1Z6ePhkCZ6?=
 =?us-ascii?Q?ez4FRlf0Q3hyKuQH9wrLiEng3/ddXNbjKw1hcZFZ2KDamWKfAKJoFmPdUC8u?=
 =?us-ascii?Q?HZqi2bC6dWpSrPlN5NV5d9+/aGVREPWTOf80OeI62geu0kdECLTdbr6KabCq?=
 =?us-ascii?Q?U+cZi4U7X45S4usAvkbbr++6YCNShjolQViSLVAP+SNespF3HH4ZLy8ppq6U?=
 =?us-ascii?Q?tE4avOuUT5tpz1De7K0Ko86/dALrhUMlfciIPip89MQlKK4c6PaSDa0bdVOT?=
 =?us-ascii?Q?QsVIRKsmucq3qxfaj/zxXPkUNJY00Y+Tg6CVKKm8I2B/DRwE8nLHWT1hV1Cb?=
 =?us-ascii?Q?l6H92h4qSRCwyC4S/AhnXUetUh4Cu9aIHTtl0758RhhU+KFdX1Taps/SVDdi?=
 =?us-ascii?Q?QjCQJeIO+tbGRw9sP8h2+yDDC1a5EBH3zQo4/RLj0VogXemcKNrFDowsoXjQ?=
 =?us-ascii?Q?fE+aXMTYlFNufPmTYzLpr072s69w7DZhOC/hhlLPZAi75cvMtXOIqJ4Z3OYL?=
 =?us-ascii?Q?seBA7uFhDQXTAeK5glFO8srsMErUcjxgEKr9kr5TE2Mx3/vxyqaPaFtftKWf?=
 =?us-ascii?Q?ZyBWfuJfpJhs+HYwPZjLuf0Ziaxv5SS+M6kfO5M/Lye3kt4/8OCHtv7d1qSp?=
 =?us-ascii?Q?vFgKylBIf4n1Y909vPANe8HgYZLiWvIx9Xz4ufhT1QpMYMjiMzXbDf4xS4bg?=
 =?us-ascii?Q?FUpblBbtO/4w8gl3pjX2ohqDHGVtPdYdGg8rq9by66xxV6yKyOZcokF6Fekz?=
 =?us-ascii?Q?upI9MFOjTJR5mwb/dcjkHEQe079r9l+61D1DySfiKqrQNlH5u4ulAfIEfAZF?=
 =?us-ascii?Q?bJFWlUeEWmVAJsYVPVvkiiDz8u8n3b5OSnJXfsnHLmU4ctl9xrcTG/0nhVas?=
 =?us-ascii?Q?MyToY89Z94Cov8qvZPwtr3V/9gIQiqGhfkK/KgToxeKF+wQxHNolyGJ8Fz79?=
 =?us-ascii?Q?Wi+xgJJhidnG6CgxNnmBfIArbrhDqtVZeVfClya/ZEUSolaFA2wMaxl+lC2b?=
 =?us-ascii?Q?2AbzW4cLHy3ocx4/uPWqhET6FBIMDVLCiJJ+FX97rRf47LykWSZID0oeUIqo?=
 =?us-ascii?Q?Vns0UMkieuNjqdYq13Fz9elWXWHg5vE9Pc8cujzjHq3OZNZeOAU15OFRbcAO?=
 =?us-ascii?Q?Y6ON1ItCiDOIBwocUR8UUalWEesQNEkOC+h09mIc4RSRdh94OlDQjI4RPV+M?=
 =?us-ascii?Q?yZ50CNH3tinpsLsXs86IcEnh5DsmFEGqzsYUb98RJ4uvduynL7LubC8Um9ix?=
 =?us-ascii?Q?jy/TGoESXsbxVZxGdDuqJN46/R1AUdEitY6E7xDXWn5afn6zDd0JIOJ4F1dM?=
 =?us-ascii?Q?S0meHx4PByCLkD5t3eGZxu6GQF6wTpj/FCrgBW8nNe3v7wS5w9rJPp9xZaLA?=
x-ms-exchange-antispam-messagedata-1: 8tBK1RZ+9VFytg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 779dfe20-5fdd-494a-5796-08da3789d91f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 22:17:21.8947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 6txiyK1MbbHSbM20+tC5Kc1vHPwP7KnbofGFE/eK9yKn0s/eKqKByDdfD3lqRTniKXhAjeEeqs1fYM0Co0jWOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7640
X-Proofpoint-ORIG-GUID: d4TcFB7G2hTPuhrjNWUP75JyP1v6GHVf
X-Proofpoint-GUID: d4TcFB7G2hTPuhrjNWUP75JyP1v6GHVf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-16_15,2022-05-16_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 clxscore=1011
 impostorscore=0 bulkscore=0 mlxlogscore=471 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205160124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 22:17:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165698

Hi,

What's the proper way to install the "/usr/share/locale/locale.alias" file =
from glibc? I'm trying to use it to work around some legacy locale problems=
. I can see it's included in "glibc-locale-locale.alias" when I look at bui=
lt feeds but that package isn't provided/rprovided by a recipe anywhere tha=
t I can find.

Regards,
Charlie Johnston
Senior Software Engineer
Platform Hardware and Drivers
ni.com

INTERNAL - NI CONFIDENTIAL

