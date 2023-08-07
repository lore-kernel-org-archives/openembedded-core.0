Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D98EB64DD
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 08:22:11 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.54])
 by mx.groups.io with SMTP id smtpd.web10.29740.1691396523183262679
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 01:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=HuAbgTdr;
 spf=pass (domain: siemens.com, ip: 40.107.104.54, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TE8Zr+w+qf1rwcQMUY05hE0mlhyBkCrECK0AfLP+1Bi7wPFnQUZA4sNK/yYQ/xLDCPHY43eRq4zhYJwS0B4/IynrOKaruZ1DgW3IjGNkrdXaTKjvHIQ5UOvzFXf6eGuvYgzaU1jK9wRfkT0qe69rBN8eJwmB6aNYy5KM6oidzrzoiduzlmR6AgRKb877PzNRMmG+CD8Si4dBpVkjCtd/uOM6NxGH01sVfeZ3daKiBCNFg9s7CAaUfKORhWXTF1S6ULkvlbf9cJ9BArpZyh6LSS67j2l0kGFRUIMIQzNzqgTIAdVfEy4OY6ywOj2xtYFtSNrdMPXrMPe65UnNoEVudg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIQwpNZjrsHTvDXOMuMQrmFDcXgQQLtsrNMdfFc1eJg=;
 b=LMsUz/sntgf+CONmEaHD8WP1PsxTuJci+ges92J7QC9y7eu0aTG8bpETqmAJJICLvWwWKx+O2/N0KPHZpL2qngLOdlxwQ3h7NmqYXsAm3xEjyZVwglYdFhBeJwvcCZ2Vsytq9pSsewuuuT1/aTxYXl7JVD+E2JK7710o5ovt8hwgOZa0mQpl2XLO/4hl1gdiAqwFuZuZghZP2rVFY5N+V/kznDywtwlNwcE1ryIafg8em0CcVdrLzTauSI5uTpsCsSuXf/ARBlkrLe7nrutzFlc/I8Ta9rwWLKGnKHvW8XKW/JNTDAnZunzedDjKQ7rolE+/9MlY/fNdEBwLUrVDGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIQwpNZjrsHTvDXOMuMQrmFDcXgQQLtsrNMdfFc1eJg=;
 b=HuAbgTdrjDw+49x0vORgJpnz841YBBnc2Z9EaAtblv72TAq3xHLhPvqOuvDWKDSTZ0al0p0wish1II0lLXleFA6WIaFr0vGT24cORDf/p6Nk8mrmyBwfg72LU3TSCTjScPd+nf5Rgz/Cjcd+3WlOvrw+FS++nsEM7W06BAD9xijyzBdMiTwDZlb9mtZcwXoZG3u4XxWHFhdLfLvfxqWUFy61g1uNcKS5Ppz5LTuYPRnYnxbFLr8vkZ0es0MX160F4xw3jPw1Kxv9RTga336AvLTEuTgLupHrqnNQkKYNU17TvdFr6cT/wpZgjJl6CaWP3SJKr3R1BiOanbH7PuB6Bg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM7PR10MB3334.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:10b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 08:22:00 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374%3]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 08:22:00 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ppjadhav456@gmail.com" <ppjadhav456@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "poonam.jadhav@kpit.com"
	<poonam.jadhav@kpit.com>
CC: "ranjitsinh.rathod@kpit.com" <ranjitsinh.rathod@kpit.com>
Subject: RE: [OE-core][kirkstone][PATCH] openssl: Upgrade 3.0.9 -> 3.0.10
Thread-Topic: [OE-core][kirkstone][PATCH] openssl: Upgrade 3.0.9 -> 3.0.10
Thread-Index: AQHZyQfHmxF3i/dX+kWkCaEDXO4ng6/efgdQ
Date: Mon, 7 Aug 2023 08:22:00 +0000
Message-ID: 
 <AS1PR10MB56977FC6C5DC413FEEBD6855FD0CA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230807081823.47348-1-ppjadhav456@gmail.com>
In-Reply-To: <20230807081823.47348-1-ppjadhav456@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c132bd74-c7ee-42fd-aa8e-599afca36066;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-08-07T08:20:37Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM7PR10MB3334:EE_
x-ms-office365-filtering-correlation-id: 26e1a920-0c3d-4dc6-2b49-08db971f5f63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EQ/60AjckW/NJ7reHX/9pXjn0YWvmJw+DP2cNYxFPP22IXqmKWdWUSZ83M8yH5N3rY4iBMt+lEsszo4NyzAldPNyTUobzXJm/EZR6x2jeLTnHpmpEFIAbsExbytCgiwrVDAPZZ9j5iMeiDFcVe8HkMXZ1QIkPAzPcnwkGMbO8Zs1SJQqAFVDedH/YMYbGEz4ApjRORWNqBICeFlSNJAcjSMCQOBHgRhh284f+qcydarh18KF9BiT8cKN8PAIP5jRwN1WUUY60fSMqxXfgltcB6Ha5gF7uSwM3LfNbha//lR+yyYY0uGtMYYhU+W1iZtpjVq8wi4LSieX2LEoSTq84MRBPiyvKm4pivVIzUsJ3t9B5aGxIxSfKWiFYwZPxKFaKyk0stV2bbNKxLbCb840nz7G5Dy9Plsj98YcQb9La0YXC65A/FKxkD5eU/GmHkZlhHxIEI2zaoknrZmBN3rs84bBiWbNVlpnB/SbTP3ieNFedCLM/s+FXDkmgcepncgSpXw8gRHrqRrdiY8L5qMU0UmVhHYIcX8zSXEfa7xm7h+5H0iNYlZvp0Smj4FP3Lm07QKhuUAtoSpczd+5Zu9REBJVYPZjMWlPmLxZunWzVBk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199021)(1800799003)(186006)(9686003)(966005)(26005)(55016003)(6506007)(53546011)(55236004)(110136005)(38100700002)(5660300002)(38070700005)(52536014)(86362001)(4744005)(4326008)(2906002)(66946007)(64756008)(66556008)(76116006)(66476007)(33656002)(41300700001)(66446008)(8936002)(8676002)(316002)(71200400001)(7696005)(122000001)(478600001)(82960400001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?iRCkLmMaZ0HYCXAG6HsR5pczPaAnTCoZbz2OqcPS+zNutyMEMV+yx5/Kg1qA?=
 =?us-ascii?Q?HK4OXWiJgaKx3HNbftEJp+0Q4mW/gWADuJtttraVqfX70mXJCXJjnbKhSdcj?=
 =?us-ascii?Q?B5i/F05DlwfmODr3SZBALQ+YLnb8ygJ2CW/AhUkhSO80fSpZGgvLeGtNq1Ev?=
 =?us-ascii?Q?EuiBrW2zqOwRHndve1JQm+9DkI47QDrwFWiFP+VRgx0FrUyfG+BzOf8I+wKR?=
 =?us-ascii?Q?mLabkX2cXaBmnaQZLjxopvsxEIs6hjOe4bsZKusUf9s4wqMOfno+FDaDPCi/?=
 =?us-ascii?Q?EhwSWmZoTUDE+92/tVnBQ3Z/WAJbpCN0PNQ5k0FP7g7kfQDC4tDOmjIyHQ0P?=
 =?us-ascii?Q?J8eB2wQ/zLeYVfhToSTWOxGgEhaO7xvY+IC+Fj4OE61MKricrrlHMETtc2Ym?=
 =?us-ascii?Q?wftMMjwNAFtmyCyd0M9FM6FEjaZGvuRibWg4BzdhyAQFWMm4ZH6ybGR8iXSR?=
 =?us-ascii?Q?oqGtLy44gDNJ5Z4eLqPqxf6IA5o3g9sRLMvfmYsc2TGoXqWVk/VQrOD+wh+Q?=
 =?us-ascii?Q?X7jwkfZQShiTT6fFK2Ci48hHp9NLAyq8pRdVSF6a33T6bR2yNWVrKsUvuIQA?=
 =?us-ascii?Q?TBV4ZDjqrzoGmjVGVjd38/t8GaPCJ3T6LesfwFti2aebMD7vhp57xSjI/7uv?=
 =?us-ascii?Q?EeOkaFaVfrUvamNCs97E0bAFYRLUkTiyWmaAdAjViZw7QenIVTrye1dzWjfY?=
 =?us-ascii?Q?GBh+odoJH9beTj2NUmXvrZidnyY0StMDEYcriLQGCH85h9fxrD044z2ZdoMR?=
 =?us-ascii?Q?OXn7gPFJAzSFbn6zqx+kXhMpdw5Z+QAKhkvNyP4H0meTnTwCspCX6+jM4nED?=
 =?us-ascii?Q?txxpjGk7ti+nXxqnx78aSI3QjdQaZryQL69szPG74Q8XYf6fVtmIYmXaGESa?=
 =?us-ascii?Q?3FflAWuNZQ3ViCY11PWhFuWWU2MzNATDaxjv3DOVQCW/pULRTq7Pw3NdC0Ze?=
 =?us-ascii?Q?YhrwHyB0m1h6+PwUUT7FHigoEXQ/28E8/C+HnD5iZYnKkMO+A4kz7YJ5HW6o?=
 =?us-ascii?Q?SfwlcEu3XYXoTwrgbOWEa01nYfFuo+DFk+LXjxORVJ9LDXWw50LAnurZrbYz?=
 =?us-ascii?Q?PC0NhT4hbOwg7J8yHZFHivhQfYPsknHEbGC9C5VaZHKYIOI4jx3q46W1NqRr?=
 =?us-ascii?Q?SDk6D6DKgvXSrK5NcZVHEhlMipzhE6ijIUJL84iSeA2CdsJ87Xk5wvjM2rOv?=
 =?us-ascii?Q?UVUfrjS50DzVStw7ro9wbL27fpUYSATSDYhvNI4N8YgRLYcJwzuPyOj3TyO9?=
 =?us-ascii?Q?UQ1r72IWNZAUrTrwI0y0w9gj9pwaGXo/tGe5k30OzKFP88owmdNTAuaTpcAu?=
 =?us-ascii?Q?OOCh1h7RJRvKv59sTwnF3RS6+WCqUw8CzsS7f1vjZrL7Dru0qoHmKp66Mrim?=
 =?us-ascii?Q?lWOjSjDRCizFdW7U30BwB/FpyXy5M2lEYjBK6EaTw66Rbx+Zh6UW3L5Aro0I?=
 =?us-ascii?Q?H4xRKlUPfZhJ19afjPWRj0L9nGKFssEJJPRf60mHnyYc1jLuGjDrfGxUVVi0?=
 =?us-ascii?Q?vlxb7WeI5B0Ua4oN7nMSl1aWzaYDAE0GdlJrH/n/Pv53OrgDBUt7WfXCv9AH?=
 =?us-ascii?Q?O598gTxwlwfACHF5HrK4hSTDhIHTeeBa9vuLG01y?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e1a920-0c3d-4dc6-2b49-08db971f5f63
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2023 08:22:00.3014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9x1vnWmXzqgIG5D/GbDMtCiikrKbg1Gks8/mUaHIJwh5BvbO8/0HAGf5U67hKxu1VJrBotf9Mq6keea/cnbNKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3334
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 08:22:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185589

This is already in kirkstone nut
* https://lists.openembedded.org/g/openembedded-core/message/185255
* https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable=
/kirkstone-nut&id=3D94ce10791ce10aa30d3a3bdef53f9b2f3c1b331a

Peter

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Poonam Jadhav via lists.openembedded.org
Sent: Monday, August 7, 2023 10:18
To: openembedded-core@lists.openembedded.org; poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH] openssl: Upgrade 3.0.9 -> 3.0.10

