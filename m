Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0475DC4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 11:57:27 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.96.90])
 by mx.groups.io with SMTP id smtpd.web11.16073.1707393438881696530
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 03:57:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=CpOiyR0u;
 spf=pass (domain: infinera.com, ip: 40.107.96.90, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWC6krCQSpqc9EpPq8ehaXZzDX7Kc+g5R3JeXQFgK+DNP+qhTTs0wrOS8zN7R2mxNO8VvjAn9Eg5DhvXt55SHVnHsJM8XYlryTNeZdZC7UcPd8pkQFE97QnwZlyFWt7mGWkXMtKYdNf/3wP07TZQhD4yVqahb0ym18BzPvHjetwwiqdW3iJ0d/4SuHIk/WIfTAFQbLDmc98iZd3QXl5K4ipdKZ78pgLsnkDB1bTHdRvuOz22kR92A6jkHF4Iup1WiPfwh+idDAD11VHdUuMHHws20rd66D0MtbZapLjkGvvQ/vXdG5Iiy1Atwp9iQPE5JUPITjs/H5NCdNIrYQaXHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaX7MH9f0ROFcbm6aD8gLu/AYDuwRS6xVZvOTB4Y0QQ=;
 b=dTjkqrfHv6xgg6vBq6czNLcj2YHX1zw+dvqU2eb9BguO6IKK5uX3a2/nRDhw+bKwnu7H6Qulxyx8BoeGKoP5rnw9Hpddbv9hbVdyuq2lenDzqms92ymAxprCYjqa5z1VoGJGcH0PXFWOZM3JXb4g26NJo6XbDcyTl0M7WyFLkhaBT2TY+S1VTpK1Ste12G+tni+frVvVdbm5Xy+hh5AI9wGO94Ki0H1wtzoDzarNGdVdUvj3cEtHNB+v07UgrpxPC3Fhe+SBieZcoueyHf9RncrDrVXBnbMW/8Nh68ZmNLmVSgkOFPIYWUO0/VBsYzP4H4SHxSBGTZ//jX5H8Z4H8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaX7MH9f0ROFcbm6aD8gLu/AYDuwRS6xVZvOTB4Y0QQ=;
 b=CpOiyR0uvLVWCrPVhe3UG7fIn4NSVxvRn7JWTap4DceXgvxRiF9RnOBwYo4w94HVfJGhWgwz09lOXeCfdINe6+uZWTPF4qFQRwa4WQqXZBabE/2DfjQClmI6RjGLs3SaqA7oPXg7mL8q91daC7jHWDCDMQIVryuwAjvRO7ONyIW2mwaD8Ab3FLytWZTHxVXIUpFUtZNz5Yq+v9wyjUMYb5OcVoGLq52oBtjaHgFhI/1WH7oJtxlO14M8o3QBBYW5d586INWebc6D0fxgm4j0/QiO8wzzkRxs2KWkFbhVt1w2AXaC21vlA7XEOuEbi4hcDA9UTrIhKllmg7WBRZpldw==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by IA0PR10MB6746.namprd10.prod.outlook.com (2603:10b6:208:43e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Thu, 8 Feb
 2024 11:57:15 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea%7]) with mapi id 15.20.7249.038; Thu, 8 Feb 2024
 11:57:15 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Denys
 Dmytriyenko <denis@denix.org>
Subject: Re: patch: grpc: point to the native protobuf compiler binary now
 fails
Thread-Topic: patch: grpc: point to the native protobuf compiler binary now
 fails
Thread-Index: AQHaWoPQtsKWVpjrA0q1H/dGQtb02rEAVd8R
Date: Thu, 8 Feb 2024 11:57:15 +0000
Message-ID: 
 <PH0PR10MB4615FC516BFA9CB8AB982F4AF4442@PH0PR10MB4615.namprd10.prod.outlook.com>
References: 
 <PH0PR10MB461540FA7C12FFEA23710637F4442@PH0PR10MB4615.namprd10.prod.outlook.com>
In-Reply-To: 
 <PH0PR10MB461540FA7C12FFEA23710637F4442@PH0PR10MB4615.namprd10.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|IA0PR10MB6746:EE_
x-ms-office365-filtering-correlation-id: 76154f3a-70b1-4119-8d0c-08dc289d17bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OPbxNSRF0xsWcM/Tsq8TEcOgi06TnU7FY+6hj1hDJ/6l713X8HdiJAuZjWH02En6fime+Y/z7PAGiRiN1ImxEgTC5A4qtTdzObcWjMfDZCpUiKgGRfutrps6AAqm2/1B0fqnq+Q+tNkWS8XduGSqEbIRnwjeKu6yUl3oDt4wzHFSPCgGzhcPJD8eG+mYbFBkEnx9w+RusL93yjqrtXHt4UMNTGxa20HGlClkVn+3eQUkSSTTZnXjOjz1nmjcMrXc/OntWFpQOtYKXkIwM/X/tSVDfd6HnkKl9viDDaXC6MAomegbRktkpKsAhnniyuw3HHFgP7F2PtsYORwAB8WbHRnmKOndJLUW4/y6MVPIdb9YzVEMsV8q/dYpJvCUDvizNmmdgw4SLHndS6Y6EdYYuMKh2KaweRyITWsxpEF1U/pOuU2a3tBaLGA1FZ/FSC1R28tTWfOG2wyUW+XaHu8f9WxiJAoMFC+t+NsK0pOXwahfxKdEtBwZIg5cbs/ba0jGbMungyc+PVP4WXudfKIqlixOcCSAYs5z4jbZZU93sB2f12cZMir8CqaDZxyK+0ozcx5n4ZfUwTs9jZv1gH1wO6iM2sukMD94LflDbew6RLaRhCGMsMrJAModgOuLtMw/
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(5660300002)(2906002)(52536014)(55016003)(26005)(122000001)(66946007)(41300700001)(83380400001)(38100700002)(86362001)(66446008)(71200400001)(53546011)(8676002)(110136005)(66476007)(64756008)(66556008)(9686003)(91956017)(6506007)(7696005)(478600001)(33656002)(76116006)(316002)(2940100002)(8936002)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?oq2ZFhD5jqVmIHxcu7m7Sd4MHu1w5tpSt820iZyYevtBfY2OxxHyUSiIiU?=
 =?iso-8859-1?Q?tino3Jm3rnR9011NjBfgyeZha5WHAr0yRe9qcngjnurgaqZq1oja/glEaE?=
 =?iso-8859-1?Q?P11zYDij3WFVIQzyBlpij9Z6qNsJwzmOB/Tf6cvXtIwK3JituaCMCj+sTc?=
 =?iso-8859-1?Q?qmt63u2x7ko9SofSFT/1NEg7OQT/DdQkbOeizve/GXDn5anxezyNCq6Dnx?=
 =?iso-8859-1?Q?OSOpTKwpC3jOVQZo0/VPzh/WUmzS9Er/qWqHzYc8OJ6tJ5cu6rErFpQd5U?=
 =?iso-8859-1?Q?c6wYkTiYyrDdksImGWpUH0aWevwGHaOCZj2a8C0fxd9vBnYkDiDbq+pOkz?=
 =?iso-8859-1?Q?zTK+Mr29ZMRiP7XV9XLa/qCrX6G8RWH9jdGJoaE0qWXQTkG2SaoFJwrOlA?=
 =?iso-8859-1?Q?JUbQp7U+62w0rOSFEA4KG7MOMiRXDv3HFePv592PrqVDpYYqAgj2a0C6pg?=
 =?iso-8859-1?Q?pjQc3lW3DUEX66T45fmOq+NuNsuPJ+2T4a/mVCtojtcwPfBEYHPtwdYnIT?=
 =?iso-8859-1?Q?EvEIUDhSzlh1SEWV6myfdZSyrXippjr7YwHVWOt/zFP7nD4IlLdls6Qfbh?=
 =?iso-8859-1?Q?jsTGZ6grHosdA7I/mRy8qAqYm1T9MX50G72/JFmcozr/xsbvnP6gDLaYGT?=
 =?iso-8859-1?Q?nkGUYHN7I5+GOl28nDuGZGPK3Fm9bxAVrqcTID3Az9jzAHoyy4Yah9owPu?=
 =?iso-8859-1?Q?xq4+udcaXllNY/s7EMCS7J1UBUFQ2rdyY6iw7K25iKHeN0J+LpXed53llf?=
 =?iso-8859-1?Q?hjEM5wPwp5M8uTtFBGH6OVAsnTxOinWhUqBAw3E3if9ApibvYvY3TQ4Jb/?=
 =?iso-8859-1?Q?gieoueURuT7rcfPIK3p5Zk22SRc3lqw45JjMCiFBvGJtGMmA0/0zJBKwIt?=
 =?iso-8859-1?Q?Ic/AapjN14m6T42tg/gqq/xiOPg1Nr7LsnQCdPMBy3TgIqlDCpaZ17lqHd?=
 =?iso-8859-1?Q?UguV02odas1QsGa/RXjKObNbPxSU6V/xa3uyzhtI2KJvOJhxgyN/QLdZvr?=
 =?iso-8859-1?Q?Bjst6Sckhp9j6G1y4cm2IfDZQbmvs9onITb8YEHTJe0Wjx7r629fAEtdMl?=
 =?iso-8859-1?Q?8wCzSK4DFeiBibk9PNIR83SK89DXO3wo1ywFOvVuiB3T8R+hBRsb1tq+H1?=
 =?iso-8859-1?Q?oLR8HdQTSqCRUWaLuty/2jQnrRIHojhXP3Jk/Jg+lPEZLTD7ngX0UkXBl1?=
 =?iso-8859-1?Q?Reac+1q0U7wv2fI0qEvXIDWFdK5f1wVSe9vM89ByxfGj3jz5h+qefezi6J?=
 =?iso-8859-1?Q?FaOuEv1/dPXEQETjcaObx8x3Guwn4R/hAoagaqphQb7LvtRFYM6YU6/LFP?=
 =?iso-8859-1?Q?qyzPsfoFNgnycUPX5wEvssaaGPRrKslUmjLu+YaG/0dYGGG16mCrCuRuRB?=
 =?iso-8859-1?Q?y6B/8gXg8mqmi55Z3E8zrJ1xjtMYZMPWuJpgFqyzm7jZ7sR5x7WnDKoXUX?=
 =?iso-8859-1?Q?arJnYLAkOqneohV6ubmNJeBgVtB+B/OE5/oMCWyb3Fzo9oEAPmSJyHnBpf?=
 =?iso-8859-1?Q?V6fqtjBNsBZVD/4zH7SCA5tN+g1cBymFhUU6oEivxP8xpCxO5fh6mhpxHM?=
 =?iso-8859-1?Q?+HNtGuTtplWWEMzp64Qdmu+MrvBC9Lc4OnI4oxeFCvL54rS6aWmzjoaGu2?=
 =?iso-8859-1?Q?jzYdHCfhaEs1ZnUMPf7cnRQPIDk/3nghsj?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76154f3a-70b1-4119-8d0c-08dc289d17bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2024 11:57:15.3000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hWF2YQbNx1s4oCLWB3NAa9KDZZ0w9kk9x18rEVfNS31N45cFxtOkgGQD+zFwMjLbkaqTMs5reb6b5JfIOfOhxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6746
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 11:57:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195144

oops, built in wrong window. Removing the line does not help=0A=
I get the same error:=0A=
/home/jocke/yocto-xr/build/infn-xr/gmcu/tmp/work/x86_64-nativesdk-xrsdk-lin=
ux/nativesdk-grpc/1.56.2/recipe-sysroot/opt/infn-xr/1.0/sysroots/x86_64-xrs=
dk-linux/usr/bin/protoc-23.4.0 does not exist=0A=
=0A=
Using nanbield =0A=
=0A=
Joakim=0A=
=0A=
________________________________________=0A=
From: Joakim Tjernlund=0A=
Sent: 08 February 2024 12:45=0A=
To: openembedded-core; Denys Dmytriyenko=0A=
Subject: patch: grpc: point to the native protobuf compiler binary now fail=
s=0A=
=0A=
The patch now fail to build sdk for grpc_1.56.2.bb for me.=0A=
Removing this line makes it build.=0A=
Please advise=0A=
=0A=
   Joakim=0A=
=0A=
commit 54885a5af2da26d7c84f8aff6fc845c2681b2890=0A=
Author: Denys Dmytriyenko <denis@denix.org>=0A=
Date:   Fri Jun 9 04:37:15 2023=0A=
=0A=
    grpc: point to the native protobuf compiler binary=0A=
=0A=
    Latest version of grpc fails to build nativesdk variant since it finds=
=0A=
    and tries to execute protoc binary from nativesdk-protobuf instead of=
=0A=
    protobuf-native. Shortcut the detection logic by pointing to the correc=
t=0A=
    version of protoc binary in native sysroot.=0A=
=0A=
    Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>=0A=
    Signed-off-by: Denys Dmytriyenko <denis@denix.org>=0A=
    Signed-off-by: Khem Raj <raj.khem@gmail.com>=0A=

