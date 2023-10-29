Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0FA5C4332F
	for <webhook@archiver.kernel.org>; Sun, 29 Oct 2023 09:49:43 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.44])
 by mx.groups.io with SMTP id smtpd.web11.69874.1698572973108720219
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 02:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=q3b2jEPb;
 spf=pass (domain: siemens.com, ip: 40.107.21.44, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGH063dZhbVAGP5O00IbIdeOi7caG3JnhDVrHNtD5pkJutEMt4nU5VRhPX5hAlC4bVBSIm1WLLHaCPxqb0idIjrzj96m8ozOr7+f6X1+ukvUMeQ9/SxOfLrx3wzYBMsdC1wDfy2ViqsWob6aPlTKkxTJ6zt/QhM2WozlgFNAMSMwa2e09sU3QYSrI+61U7HPg25AxkZCQyWW6DcoEOVpVJec3row0si7LUpE3mrF1BEcj9n4SlsBFKy6w91VLmSQruwptlVNmOVKjmRrmlBBviSjXb9iz8xYbASZ5lPjBxpWYfFM0noDOYSeZzr548mmdupP0NZhlnfWDGVLDnO0gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79i7i+8yE68WZGc/2UXzYtr5QRxEVDyYTU7CeFFoUfc=;
 b=ak2AFoUR8F3hyX+0+UGWXBqVMwCLHC1od3qQo+MKS0xxHhS5D5I3ao93tV2CNQ4PW5WTv5fPEZdq9sBl4mwN8zDhAw6TG9k5A4W5OgpJBIuf/fp+TOkJx67VVB1rp8wkQRYUgXSjx/77rRZQlZmzm5goZB6SnancJ/A/cBLr+Y4LWpZjN10gZJKbhVgW9DG3m8rtHurWlcpwxHP3a/KAO5/hCy4cq0oePNp2zqCGzYz3bzDn8fd1u6xZlRLoKE5XLHWokifj3zPcPaGxa6EocPWwD3512YEDlxYTHqbf9dfTjfGDHkqRBohqc2BlAXBhBN5qyds0OPtYO5TlAHJmzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79i7i+8yE68WZGc/2UXzYtr5QRxEVDyYTU7CeFFoUfc=;
 b=q3b2jEPbyHXpD3YOsxyuNFWXu7TM52whonB+bhFcGkS3MzhsTR9HgW7zK6Tn2hrSAwkSMOLDt23VUKlchyy1hWW+Ti5FSeALl7zA9Q/ZI+0tpDLf/lYtlJSWzmISQ39Q8vorw7/cRQHaKMt+5LK1OKBhHxgOStABTtnpNIXobpCFjAeU4O+WB5djgW79ZSu6FtxOCco3foWZl6A64qnEFW8P7z0Suj7BEIMdAp2+AQawYVMLsaqKwe+DeSJ06/9MqTAXfRk4tpt23dV5brB5taX34bvGDR7fvMQ62voRenIKDHtYlpc3ftvsLdtSTGL8GUwXWfPN3x6jXywaiV1b9Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB8168.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.23; Sun, 29 Oct
 2023 09:49:29 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7f7b:12bd:48e4:8bb0]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7f7b:12bd:48e4:8bb0%7]) with mapi id 15.20.6933.024; Sun, 29 Oct 2023
 09:49:28 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "archana.polampalli@windriver.com" <archana.polampalli@windriver.com>
Subject: RE: [oe-core][kirkstone][PATCH 1/2] curl: fix CVE-2023-38545
Thread-Topic: [oe-core][kirkstone][PATCH 1/2] curl: fix CVE-2023-38545
Thread-Index: AQHZ/bamgoyIq4smUk2i5GXMJKzl9rBgmvpg
Date: Sun, 29 Oct 2023 09:49:27 +0000
Message-ID: 
 <AS1PR10MB56979D57215F72A83C7C7234FDA2A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20231013092056.3841151-1-archana.polampalli@windriver.com>
In-Reply-To: <20231013092056.3841151-1-archana.polampalli@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b6b18526-f4ef-4fff-8e6f-4189a8bf9397;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-10-29T09:35:06Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB8168:EE_
x-ms-office365-filtering-correlation-id: 69da6739-181f-4b69-806c-08dbd8645764
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 e7mBAo0vi055fgfTUOuKk2jMTAam2CpbOzIqg8QnFBG1I7agAGlMRuGUlvqi0xEZN52bLikntOLaJgG0cavHnGjacGTYToblhItw7MmzC5L1wRhqZBp88D+CJQ/LdV2R/eF2WStpQFzb/6jdSYJ4r02PFL0DV2WXOed2BbnIDcxvoxUuemda7LbuqFZMpu/VshkPu789v8+oq44mFeK7z/0o1TlkZr2MUO2ds52zIBPFydAWem2oWaRJ+i0LLlVaOry94r1SCFUOGx8jv/lCkroXDn6yD7YeBe5uEFbO9esEm2/8YoXCqN1730W2iFT+QhdEVIpQFhi9YEwcpW+F6d92MgWsX5E7lJNhNDQPid/NPCi/P9kpo2KchL3+KUt/RlvMrBr1sKDs8V7Yvz+TA+ZOvsoBgEqAND9mtcjU+iigs+oIod/RPfn9wENMnHjfhKvg4O9tdzaLpSLJqWkRo4wpcHKlLD8I3IrosCiyVG8jfDO2rOPv4rGFznXOi7vKAYnG/PKciJY+GSwybs2MZ2JIaGzS58/eE6oEPX9iMMHixyZCHuCx26psblFPYKD5rjC9SLRlx7XwmlYYomjx/wTmURJeESamIs3jNQAAiM2m8VGzf20rexgiIbbphN/b
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(55016003)(478600001)(71200400001)(86362001)(7696005)(8676002)(5660300002)(8936002)(9686003)(41300700001)(38100700002)(558084003)(4326008)(26005)(52536014)(33656002)(66476007)(66446008)(6506007)(122000001)(316002)(6916009)(82960400001)(64756008)(2906002)(38070700009)(76116006)(66946007)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6fyWW6iqHonAI1fWqu0kTQEfxxoW6CYnCMQwWolR9gGlWTJA48QOv6IOTi6Y?=
 =?us-ascii?Q?/uCg84sC92aZ7IIyFp/mrVMA/dgmmZc2SYmhoWZuR/MJy/NtdWINdYGcuY7a?=
 =?us-ascii?Q?zBez/DBidvPU52w1JHOw1YM3mmOgHEhpE/l7Exn+hwFHgrar3con+NWu+Sbp?=
 =?us-ascii?Q?pSNCWtLBIy0cnQHUEJMMmAwT/2VThYJKQQsgZmn7jbNgzfzzC9DhV8ARO9/5?=
 =?us-ascii?Q?sZKhry94i9zuEs5pvqWkSiZSHFKmUYXtJuEQQtAq++H0vehzgO38ovasr1Cw?=
 =?us-ascii?Q?7HIQl1J6OszjmWVDCLRByExjsyie7P9pHRizbONG0Omhdtb+LHRzsYp5wYwK?=
 =?us-ascii?Q?lyxOcqPwA3HnU+pKJXorQ397+6KiXR7Dwx/G4f9H3wJPjOmfU6ToiqaOnvY3?=
 =?us-ascii?Q?AFSyT4+NXsm3Cs8PrsV91sVkdCBldXBSLylZ9PMdaHAKR6EODdPeY/cYFBfq?=
 =?us-ascii?Q?x4LUnYPryVIJXjTOXAUXyn9gl83s1xMz65xN4sC+Rk/VWbD9PRqMwcSFSL4H?=
 =?us-ascii?Q?M/xGgtJIowsmAmZt11squo1A2/rJlkUczJUT+Lxi0x2SKv/FfLWHlhe8ENTs?=
 =?us-ascii?Q?iBW844HTT7nq8Yfzwjtst6JhE7FOkqZCjvawKxAfNUnVdUJs7LWtRI81g3n3?=
 =?us-ascii?Q?On4uX/rnELw3gR+3C406N8KiToptS/Q1V4Q3OzYGcByrfbob9G70GbT1y3rl?=
 =?us-ascii?Q?SJvXgGc5rSlu1GSHzE+poam7CvmotU82DBTfNNHUR+w6Y/yyg5po4bkO6EA9?=
 =?us-ascii?Q?U42hVVO44tXJ0fI32WEV5A5YKjDzduw6PqSFdAtXlbzQtA7V2pNoUzwOynDG?=
 =?us-ascii?Q?H+kux6dUI1hy92UeUiE0EvfGHWDBWOWrDYn1qEZ8PgkjHZOEOb8cnpoYVTIH?=
 =?us-ascii?Q?vMC/tKOZo1R63cfObOIYJtszNtHUV1lr6PmnPj/Jf1MTuzhKUV1aOKWU+kCJ?=
 =?us-ascii?Q?Fal2+lOOXe+kRcXkwFS+u+fcgU3v8OgBjkRAmYewPFzvXObahcFxCDlc/+lj?=
 =?us-ascii?Q?nCb+Lx7SCbSdJrj52VvI6GPLNtEPvIAonNEjaHM8RNjvC/fb92tXMyxgz7r9?=
 =?us-ascii?Q?uc1XBT3FkC0PQt9PzXvFRp/xmk+czemgWzxc+3Ld9trHMhTSHiniXY8GOyTb?=
 =?us-ascii?Q?y/ruOc6tcmFu9K7xgexKCOPvly4m5E0OkeY2lngMmdKGTC1lV1Ko1SyGKZBg?=
 =?us-ascii?Q?He3/tmQSA37R4WivowETpUoiSwmg6cOciwi+RC9EdvNG8H7CBAH1fnjMny96?=
 =?us-ascii?Q?YU+uZa5OAGJMYtTkmNK5o9leNKFC7LM9Cznd0EMvSWlwRAKLV9jYltROQR91?=
 =?us-ascii?Q?1OCLnqOZ1ai9Wll3m0+VBxXwwI63HK6dbV0jTlcYjs9kkBFST1aCpom74vq1?=
 =?us-ascii?Q?iyS4MtSs674NT/xIkrPQrRTllgnCgj+QhZaLkqCUENLdnvC1pdIFZCrtlo0p?=
 =?us-ascii?Q?pQUsHVQrmH5cMZ6nqgS3sxxr/sBq8x/OBit10MPpKbuJeY6o7j0N75IiiGgY?=
 =?us-ascii?Q?IlCwtARiY1ArJIgG/ZopWAsYcZOyvfDgcr8U9DUfwEWe+SiyLnSk4EXoPELV?=
 =?us-ascii?Q?fxNw3qpOsuC1rZi6EcCXtvUqzXMQ27WAxTNPRTzt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 69da6739-181f-4b69-806c-08dbd8645764
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2023 09:49:27.7457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: POcsl07quFshT44R0feq5LV3FOw5z6VuG4L1gVfdKcG9clAlnOO+3ZnASG2/45o8x746RyXxQC9tVI7k/hMtmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8168
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 09:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189769

Gentle ping.
It would be great to have this in next kirkstone release which will be buil=
t in a week.

