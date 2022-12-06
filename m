Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D637CC352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 22:07:23 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.44])
 by mx.groups.io with SMTP id smtpd.web10.1621.1670364435824246026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 14:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=gI/jaC3m;
 spf=pass (domain: siemens.com, ip: 40.107.20.44, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/9aJ2cxIRyerVkjH38bchcURbqb2Ej1uNvVmzYC5hwqAxYZFaALrEPifoGHiZ91Y5sEMCa38WlGo3EzTgJSiIzkiscmZ5wyir4EHWHnl5/XuHYckWIpy0MnKoFtD6KgcbdCU/77bw3ZxDQ0k/DEJgBM7uUuwrs0p7AT0gK73fA11IGXJLtQLr0oKxQseOe4Hs2dX1zr+QX9wk7SxVTG1+CUeJuZ7nrf7gFHsUb/y5+KVJQlwOZ6iRKDyz77Tufcxzks5agL3U3RtGsKOYJwQVQCTZARM5wJW0dIEmew2CJ4zRMA+q+rVxJgxmg4QnT7BXYXdXZwO4NkNgygi2qsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osG9dGne1zgJcWxYFBbVRLaDAgn8Frod/Nspj5bD4KQ=;
 b=a8qqOKSikbYeqp33oZ/6BJVb8gRsaxDy1/NE5+HLFcYOJ1WLdq3sPX2luOtkqCFiaPR6GpGz4YI3YXlTErKnmpUgf+9bXAjObVgTDzxgaa6yXNz9VJFxUZ0o1RKSqBAAl/21kkM6kQzqRMr5aCIQSNWnn8ugXcBnm5JWmrP3kryPRagTGJoORv9hxduorBIFaK7x03hJrRpGdK7x2ttjzzHyXa6u4vQjBi2uxLU169slohyRIVn6GQzf1Ov3hkk7d/Zxz5BK6XLRLkEUtS1FLl6U2nYsXMWL6epg7Y6iuITl7J79kyqZn8Bnel9CD1vhnWowobJ8gaFB3fUACTelhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osG9dGne1zgJcWxYFBbVRLaDAgn8Frod/Nspj5bD4KQ=;
 b=gI/jaC3mcI/C9K68S2GuL4UcN3k+0JHBDUsAlgW4h0+qYIysRaNjt91psZNNVYpI5VpXCqDjkiq6Wj+cvOjNa3zZYKA5162fCWLcc0nvxgmd4R4UtiepSUCU69fRMIpsWdRDVBys0c3Yd7NKp5gB7qbhS7z/JsmwklTQ3u9PR5RyHLUPxwd+LHr1U4oYlzEJguaLtxYicqUj1MI1Azs0xsJAQyoajSoTF09/M80R2ntXhWZuTXkw7hQc86KCPHPr2ElfNb7YDMMlbKPonaoWxMJ3r9nmofpqwscYt7BSW4LmOO+Ft4FKNCzN5vRv1KVMOdhfyIihbrdhLk55k20K5A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB5210.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:324::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 22:07:13 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4f14:3c2e:f13a:963a]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4f14:3c2e:f13a:963a%5]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 22:07:13 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] oeqa/selftest/externalsrc: add test for
 srctree_hash_files
Thread-Topic: [OE-core][PATCH] oeqa/selftest/externalsrc: add test for
 srctree_hash_files
Thread-Index: AQHZCPIDLdpl27W16EiTRZg7DSvaYa5hR4oAgAAjqOA=
Date: Tue, 6 Dec 2022 22:07:13 +0000
Message-ID: 
 <AS1PR10MB56978A28C5EB19FD9C927635FD1B9@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20221205213815.460409-1-peter.marko@siemens.com>
 <Y4+ePE1/BGRK5j1D@mail.local>
In-Reply-To: <Y4+ePE1/BGRK5j1D@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2022-12-06T22:07:11Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=9fd444e9-3f9c-473f-af95-bfb012c8a748;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB5210:EE_
x-ms-office365-filtering-correlation-id: 75d80f14-3577-4ea7-3603-08dad7d63a98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LRa9TJ+hh8OtssY2cfZwDsomjZbQzMl03iEv2S8qQFVbaxtrg87r+v3MpbO61XzAG44kU64/nmyfyoDNCeEE60cVhH0IkWZS2I0QLdDy9MDHEXLfdaBX1w+GWgA08Il0J3ba4giSEvxpk654NAkMR9WKFAlwb+PhKtbjZ07aSpcNBaAybqzX/w2vmSYIrdLq/hmkGHxeuILdtWGRYH/FLasX5sqt/KXXcpqVMdD6ivIkfnYlW2pXgXeFaq8Uir1+jSL7en+unEAz0n7HyfSo5NmC3SnqG9/mt9LSm4xLV9NRJE2/0zujJWLMjmRtjnI/+VIuYtNF8QoQuizt/58UBGuD3Aw+DFG6A6On90iimszSMvtXaaAxixCoo7w8VdId6im7rbYnJm/YoncGNHzj7czr+G/zJfMYX9D44K17snuzfuKYsZk3jyG2odwC2+7Ergy8JHB6TM+jrito0NUa5w03JawfoNZOmE+Uo2Tr2g+u0my8G/orX7cSqbVTbbxQ5qRFPMDWyMgG5NKy+nTHGrSOgT//vMtQUiu1ISzKG8cyc5jXYPTWmhZ9sDDaIDDOMd5uUysWzey5KmV4GLmkJw3UMdXMCMx9sZioUFymOv8AqrolvntLDV1c7+63p8JzGuZBMFn6Lui7cBAkTx2fg4B7HKPGH/lgGxZQctlEsyzEndU0+AduWndcH2MmkYkoqKjPoGSHU1XOgZ+aKmCtFv6Kjwjxq5RbeyfXx0apPWJB2OQ4Qt8De9q2wKB7Dlh8L0SA+YbOUf3rGEzfqbfukA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(451199015)(82960400001)(55016003)(38070700005)(33656002)(86362001)(316002)(71200400001)(478600001)(6916009)(4744005)(2906002)(5660300002)(66476007)(8936002)(66946007)(76116006)(66446008)(52536014)(41300700001)(66556008)(64756008)(4326008)(8676002)(122000001)(83380400001)(38100700002)(55236004)(966005)(9686003)(7696005)(6506007)(26005)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?YDPTvKBckiBcsG2vfhI1SZtyMXOR75bCTEx7DySmbq6nY1m7UYPauIQsGZQl?=
 =?us-ascii?Q?5yV/GaWShuan/LNXTnRmSHu+SK31kp5M7rmKlHHc9qFE9FYXjhycYv4MaJJF?=
 =?us-ascii?Q?cLoqJA867AgECCFtKYSzpygoG5JQxMCpg7EaKmzI7kgTefaX80aXv1r7K6la?=
 =?us-ascii?Q?3CYt8QDWkqvMrGjO9NBV57Ob6YYnVPwl03746jynLXq/kp2wix4LBsnALHrb?=
 =?us-ascii?Q?CR5vuENPxpjH+6WVFveZKCZIMiLcKaV1mJL5N0qGCwyQXnGGzE/4z/Lytlph?=
 =?us-ascii?Q?0ExWsGDZZIuywYHbyAF+IRY6EI5OvvMuRtYaO6rjqInSaT8/lrQJh4PdRYN8?=
 =?us-ascii?Q?nRfpcrZlYRi9mWZzGDZ4VmdwOI7tJecPht/rP/KhPiwP5wG0mfCFMjssKiGO?=
 =?us-ascii?Q?lY1tAjgFpR9NDcZaE8xJegCcCwwF5gAHTIRVCOY1cdA59gquzbt7DNgNMBW2?=
 =?us-ascii?Q?B1xOoxwJTD4ozhXyRLbXuFhsMBuCvzw8ike4o0uO3ueyo+75+8SIQGRUFi9x?=
 =?us-ascii?Q?gndMqQFIjzzdUKkcEIsBPxHPJ27uDVh6GFwsLsFUfQce8HXLlYP5YXkyYO0I?=
 =?us-ascii?Q?Ggc4ZHOl+OpBTSOQhLdQXQb2F8JEgQTwpQQvBq6y0iB80bQ3OtY8wi8a0M2I?=
 =?us-ascii?Q?sO5OtYUivISdKZiSQr3dTCFuofBjupXGW5rA5yVNvnX1bvuDZsWgNsc8S7Xk?=
 =?us-ascii?Q?Ja4bt+oBDiaRtG4XOVv+ztSJdjwQXVR+JeM4XnCPt57uglaXvhTxpwO4ge//?=
 =?us-ascii?Q?cQ8QxBic61SBVF4K4QGZj+aHPDGcHhkvDVXTvHRkqg+ji7/mDuDH5GihQlmF?=
 =?us-ascii?Q?NsLU2KSY8tkpMOyA8Oimo1W/acB/Oz7JsF2A2MsPTvycbbr9ugsJx+xxTl6v?=
 =?us-ascii?Q?OOFUKQ+43KWWqWsuQxREAgL+5scek+QtD7hxIcmn9M4n8eOHzfTbGyGUG7Ob?=
 =?us-ascii?Q?hxIuC7YegTSE7t53iRvBLANkP0LA+7TSDE4NzBABdBIjYX7AlAFfpwC6wyUF?=
 =?us-ascii?Q?9+J9wHwDsqcM9ermFvJpzbw6AbZoocVmdLOXwMT/9s29U2Jc4XYVfUzU3UNe?=
 =?us-ascii?Q?0cT+MW10CjM96NylhCzmGHHMxVWTPFlm7A1BS6MaeAmju37OQzXaGHQsfhGs?=
 =?us-ascii?Q?0Ggkx407VRIhnp111bJScWPwpUAyKUzE/uwMLJWQU1jq7cfie0E/ABThy2pT?=
 =?us-ascii?Q?JyrljRrjKLZIath1P3uEPO5Xm5iOr+3MazdMb5KKdPIMxylRnFPPrna0vOF+?=
 =?us-ascii?Q?XQ6QC0tf3IPVoHgzjWwofFI4z2w37xYQt+zvcDdWKI+3kzKbwjCg2u7BNgqf?=
 =?us-ascii?Q?MhkQI3L2CgwM7BeVoQfhPmaI852hJlpZ+b3ajuxhnS0MaaP3tqBXpr/F2qED?=
 =?us-ascii?Q?r9Nf8u8Y/3fNNfakxRh1Z9uOGoe278KVvvHDERjeyUeEKeZbIxKpJziBCEkX?=
 =?us-ascii?Q?1OZCq3WstRLWXINZnFIRdmvY5kVL+wB0djECtURk7kxJ6AndGXoi6fyewe3j?=
 =?us-ascii?Q?WSmFpCsHiRpkfJHXJemTg4Df8PB+CgUnkdUTRiyKtj6oE+tNpmULCUg1dqLm?=
 =?us-ascii?Q?jLRVwOWq4Z+NGdrLtTnJfIPJ9RJSAhlljCrKMxSI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d80f14-3577-4ea7-3603-08dad7d63a98
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 22:07:13.2218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0f76bbNFV8iC59v6fBmSjd/mDftG3EDCjfVRubCDPdjhoiGqwPdMB9yAdzowk7WhLU62gOyxJa81a1mLYX75tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5210
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 22:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174332

> Hello,
> The submodule test fails on the autobuilders:

Sure, that's the point of a test - fail if issue is not fixed and pass when=
 the issue is fixed.
Queue this together with https://lists.openembedded.org/g/openembedded-core=
/message/174061.
Ross asked me to provide a test for it - https://lists.openembedded.org/g/o=
penembedded-core/message/174286
Should I resend as a series of will you try these together?

Regards,
  Peter



