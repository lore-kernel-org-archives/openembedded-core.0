Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7090CA0FE1
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 09:48:37 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.81])
 by mx.groups.io with SMTP id smtpd.web11.2833.1693561708615529233
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 02:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Bmei81Qf;
 spf=pass (domain: siemens.com, ip: 40.107.6.81, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hg2Riuz+1/LgVJ8GXUipecZrDzpF6HBMQQfL2Zbg1haK8cU5BQK0I1vBSADe2YPRwOaNk5G79qjy3OMmV1/uwMWujWlWteSwCdLtF2mFYOKQh/x9GZgX8vFBSSnaOeg1FToj+vmtxcnTkRKDc8KLWVCKK9wbebSs/0201h4G+6xrv3pIXfCAvbakthoUTinjpxmOm9kO5Eoyb1LjD0o7kA9Cxcml9dypSPUU7VoJISnshNM151d0uRNMNayX9tw3vjLjtcK8g2gzAPorMfo6Sq8iENlPMnVTCLYFv7X29IyQCIc0uEsBxq3tKDrOQqej5xp5SgkjPMFmjRSYaDu6rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMiIuvWFQQTWrl/Hbgd4T2GmGNdQ2fOtZqwUdcCDe3w=;
 b=Bvak0y74tHkyh3xN1tRcz5R8I0q7s34boJ2i1Bvlkba5URO6f1vhIRV91oEDGJ2id0CzI66JFl7vbc5LJe3FWSrMvF79Ogc+JMO2G6SXcWJflSLYT2VeKY/mo1bGWDOlmregR0ynw07D2tza62r22jhMdjMerpfB3QwdCj/pt/nKkBppVrVMFxlWbLEtZXKckl1Tt8doAmvZCxpiFTzC2R5of999zaiYrA8lhRWQ1gAg8u/w+VtkpgGfBXYCp0X2+BGVEtbGfkwJHCfE6PnLVBFawot2ZJx6eeD6X9Vf9s6IUd/eHqwlUpQN2Dcg0bm8axPGTMvrVDqD57FWrbR6vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMiIuvWFQQTWrl/Hbgd4T2GmGNdQ2fOtZqwUdcCDe3w=;
 b=Bmei81QfhIkA/Uo2SQaXXxqaujRCNWqkhNFJDFxGbyvE7UkBw+qA1DwtZosgA2CrKMEK0Kq4OgQOjHKUyNX6lILBQ29t9Ph6M60Dfkq9nRXlmqk0fmdQXscbuisPJLq5ZbyK4XhETpemUMB3YNa5vjDzFP+t0x/n+c5hp2ltDtAMrd75Fk+SF/ieRxmK1Z1nUM47I3/TVJc1SQMZdb8fbkFoOTiZsB+/KaQxYzSLPNij9WGpcKCrZJUDTleMFyEanNDc2ry1+NYlOQW9m8mnWwmvtpwzWHXCjwySdgWtX+9KKlfx4mRl7dKW1DYgPwdATsrqeYJVgUJJ0IC09IdgCA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB3PR10MB6812.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:438::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Fri, 1 Sep
 2023 09:48:25 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374%3]) with mapi id 15.20.6745.021; Fri, 1 Sep 2023
 09:48:25 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "dnagodra@cisco.com" <dnagodra@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>,
	"xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Subject: RE: [OE-core] [dunfell] [PATCH] flex: Exclude CVE-2015-1773 from
 cve-check.
Thread-Topic: [OE-core] [dunfell] [PATCH] flex: Exclude CVE-2015-1773 from
 cve-check.
Thread-Index: AQHZ3LeeOzIHdnHeCU2VO3nzHhSGa7AFuENQ
Date: Fri, 1 Sep 2023 09:48:25 +0000
Message-ID: 
 <AS1PR10MB56974F83FAC4D21C5265E3E8FDE4A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230901040819.725503-1-dnagodra@cisco.com>
In-Reply-To: <20230901040819.725503-1-dnagodra@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=41f22643-3d7e-4a98-b778-da6f1e76331b;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-09-01T09:44:06Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB3PR10MB6812:EE_
x-ms-office365-filtering-correlation-id: 4675dc1f-456a-4bb7-40a7-08dbaad09676
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 w7QDdDPkydO1ypQN9wgoq5LCmWG16QK8MODJrt5j5A1nJHIds5j8i7nU+lHv+fu0WTGzxqTbApeGXzrkUYwSppYo4rVLA/VtSHxFtBZmJZeIwM7Qe/c8hDsYPB99eYs6d5wGMkqxW236i94HV4aL1K2HHbwWK/BZqZmcoTKccHbVj8QnqeIzDG1NN4ym+g/STrkDtPOoPXUAcxMDv0zgTyoAWB/GWUqNdBUG7DYx7Tjf8Oud1m20xHNKgiBUtZlo/W3uw0TM0ft7nSvymgIRec3r+fK6+H8OM+6WDlEYR6s4KJw/nLGEBDfuxH1YZsGogbvwi/DPqkdoTCJ6gWac3gtmdXoXaGe8pUxpDSepnqfNguEgmh+/+jj5GasVnErA/G5z7c4042Gf11nGt38Kc9ktWrhtJhIhwLJpFMhMeH7vAzEmpqedvr0BbsOV24l63/J+IAmZ1wFysOT0zSSWd31CgPzjW9Xs+VK2Dws0esfgiUCSYxpA8zdiJDz7g+SSh81+chBFsxh/4hZVZu2W/w+dsepmmLC7ZsZsi4LPrKim52mGJBn4StJuW+SkpYVlkJtBM/jFyoLTFL+Bi0sEHw5vg/4jGu6QyKEnQP5AJViZPtBPpDyiG1VEGdf/GcU3
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(39860400002)(396003)(346002)(1800799009)(186009)(451199024)(33656002)(66556008)(2906002)(64756008)(66446008)(54906003)(110136005)(76116006)(66946007)(316002)(66476007)(55016003)(41300700001)(53546011)(9686003)(55236004)(7696005)(5660300002)(6506007)(52536014)(71200400001)(26005)(86362001)(122000001)(38070700005)(38100700002)(8936002)(4326008)(478600001)(83380400001)(82960400001)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?aOGclFeLBruGvwPbEXGFojPwMOipbTj27mjiZnZBY1p4oVjl4P5VjoIIMJOo?=
 =?us-ascii?Q?KNdOFP9SRnDwnmLca+agZEekgnSmwS6rHRZAondLNcdW+munfZskkTA4Oaq1?=
 =?us-ascii?Q?gEmXvfR5+xU9gSskjS1L3VIZsdqSoYRGfiucssiy9DkS0cmxQqGSI0M2FuAM?=
 =?us-ascii?Q?Lt8Dl0DQmh/D4IhF6UQ520OAlJB6EXMv5+KI/mGfBMiBvjQ2Pa/1GduIycPr?=
 =?us-ascii?Q?S5b4As68vOgjpB/BQvpe8c2sXYUqLqALLi9FH54p5xf4NkI5PsKld/gPFvBT?=
 =?us-ascii?Q?/VFUB16EIaDIS66iw+ztPaySGmQtmDtQIdbiA7SwkqmEjFeEF0bgitg4TNoS?=
 =?us-ascii?Q?kVry9053AXBJD7DtFvpN6wbKLvvudvromPpKAexnrDMxuh2QpJmiJlpjL0yE?=
 =?us-ascii?Q?meYFB42nW0mDfP6qm2fbv2ikHU6kWvu2YjjawfE5FtJWkCCHCvP/dPBmVDdj?=
 =?us-ascii?Q?XgzpiowmJRgrmgKvYbBvsXbOv2PtKt/9cXu8hGYf9bpBS30d+1RvwWGmtEgH?=
 =?us-ascii?Q?hkkZ0xnWWiFrn+0ygdFtrsqCT2cK2ybJWQ4sxLNL2tT9HbKbGLf75KmGxRMN?=
 =?us-ascii?Q?gDrYsrCM5//wkuUH2o18ZKoUFbW9q93nCObBe8f5+hfjWBgaX3uT3Z2tU2Wp?=
 =?us-ascii?Q?DIp1W0LjMWXjLn+3HaxlidtRbdVoe2QDkIlAMrXQBK8RHSA7IBRv7CcXCd+l?=
 =?us-ascii?Q?u7s8630DBXdMZPjgm220hM1sSb2ZlbmZcr89QhBwMiQZZlSMXnyBQe0AkVXl?=
 =?us-ascii?Q?XzR4LCPkspETs9G8SKstuKl9TM68+TE7j8d38vWjv9Kzr7mEbww/1/AyU5oZ?=
 =?us-ascii?Q?ODbi5AMJEFjV1n17RMdyd7TlGWUS0Tvobn5z/pxUlrHzoYvJx+XDRH4Xy/sS?=
 =?us-ascii?Q?fa+yjtCK+otiVASZmfglhCCUqLvzcQ9Kb47Ic7DRYjtmn/Qko2Yp6LPGTfEC?=
 =?us-ascii?Q?nz1niU9X6oaCZoik9e0NBMJUF+K5o6YIJjkrUX8Y2Lzc2PhWIg9pmrOV8vsQ?=
 =?us-ascii?Q?jyomkIXKPtw6/86NoySQtp3Ecy0v57ygXYjXwQJdYvAFmg1+UzxklOm9ZYU4?=
 =?us-ascii?Q?UEGYaK5ZkHiawyYCB0fveu/yOc95ELxSvXvOZXS03m4lYX2lhPvuX+abuoRH?=
 =?us-ascii?Q?VAUx3915Qo0ujsE5bzdRA8BTyZGDZoOPIDz93g/+3D3IOIScxpPeVueecmml?=
 =?us-ascii?Q?o+/V8D0liYIoTcs80+1GREiV1k4XV3mRqZAUxCVMhdh3aqPm8Q8YIDvQ66WL?=
 =?us-ascii?Q?iBitXRrYMSGq6eKDA6Nd3plr3anxSqgG++gvOGvm9X6p5QftBgo/Hw7QknPJ?=
 =?us-ascii?Q?F64oAJVzaieEkiFJDmWTHNouZ1cj+JokPl6h2b4oZmy1ey0EOn7LtC+NC701?=
 =?us-ascii?Q?AYpBSJpFQU0O3DxxJL6DjHiZ+QxSJqpUvaddQZ6TNx7xxBcv8QqZgwpj8YHh?=
 =?us-ascii?Q?PpB869YoOnl5bnaNx18EOExTNaQLrFVmbubParHkJq8y87AytnBTIOhLIVzq?=
 =?us-ascii?Q?+1jJG1xURdQU1Ko/VqjXQI9U57x8esGo8K9xVY35PJz/7MQGIWRkvL6yzB9E?=
 =?us-ascii?Q?Uq0MsU7ImZVPxCkU9lbqrM2RGpQ27JeGrUHQUFeb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4675dc1f-456a-4bb7-40a7-08dbaad09676
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 09:48:25.6800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R65ymprooJ+zT4GQWB8jryWgvU2tgTUPc/bsegIfTNv43TmZzu5SUAIk1CUezmOj1jkr0Pq8mGOCxm1P6gS6lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR10MB6812
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 09:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186998

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Dhairya Nagodra via lists.openembedded.org
Sent: Friday, September 1, 2023 6:08
To: openembedded-core@lists.openembedded.org
Cc: Qi.Chen@windriver.com; xe-linux-external@cisco.com; Dhairya Nagodra <dn=
agodra@cisco.com>
Subject: [OE-core] [dunfell] [PATCH] flex: Exclude CVE-2015-1773 from cve-c=
heck.

> Issue only affects Apache.
>
> Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
> ---
>  meta/recipes-devtools/flex/flex_2.6.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devt=
ools/flex/flex_2.6.4.bb
> index 1ac88d65ef..5be7351f4c 100644
> --- a/meta/recipes-devtools/flex/flex_2.6.4.bb
> +++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
> @@ -31,6 +31,8 @@ CVE_STATUS[CVE-2019-6293] =3D "upstream-wontfix: \  the=
re is stack exhaustion but no bug and it is building the \  parser, not run=
ning it, effectively similar to a compiler ICE. Upstream no plans to addres=
s this."
> =20
> +CVE_STATUS[CVE-2015-1773] =3D "not-applicable-platform: Issue only affec=
ts Apache."

dunfell does not support CVE_STATUS flags, you need to use CVE_CHECK_WHITEL=
IST

Additionally, this CVE is not reported for current dunfell version as CVE_P=
RODUCT is set correctly.

> +
>  inherit autotools gettext texinfo ptest github-releases
> =20
>  M4 =3D "${bindir}/m4"
> --
> 2.35.6


