Return-Path: <bevenson@melinkcorp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA576C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 20:35:53 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.100])
 by mx.groups.io with SMTP id smtpd.web10.6073.1677530148400431227
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 12:35:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@melink.onmicrosoft.com header.s=selector1-melink-onmicrosoft-com header.b=NMZP9rGI;
 spf=pass (domain: melinkcorp.com, ip: 40.107.236.100, mailfrom: bevenson@melinkcorp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2mIbQWd/yyz+4UTF0WDSHyp7Q7bkmRHadlJrW+YFIo95melRlYLAaOGpk7TRIniHc05XZ3WUI1F152TwzYpaj5kgFhV+mQtjTgzlpoj3Ce8XndfFaiEapp5HBM6s4ax03Ctc0M/suDZ5T1AqId8jF8pOmC9c2BTWNSa1Itn8HBZLWbROyzr/kER13YYlFU2/WICzpeA689CgME0XlS4oLCYkaGPEWnIXFClkZ7rxX6jUhWebl6Bm382uJ5UQikn4QASIUIbcm9P1towvRvi7wqugxvnjXRazF9QVq/ufKdERDKH9EA19L1/c+h4MN++sOuRSISeuZvpaFDIM8W4lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+bT2V8JA8fiYbK9kgH02Ne3nnrhfe+aZ/K+AAfwrlY=;
 b=B1ZC04uDNOoKcTGwgQZD83mPWIcxCe4Vn5dIEeGtLh9B60N8bSKGsBk6VlRuu1v4k/N21VM8HNNPaPF4rqNXmFN/mmImUyRoc5wXVPbbDvE4etCJVCXu2jOtW7bptfrqzpP5mHg9eDk5BQjxchq15TwikFjVP0tB0j9vxsfq8dPb8NNyNcKFhTzyhKOTuq2/DHpdfq/9pQOyHA/2YxM0F5eO2wxsZIxcgzGiJnf4xVNaTB4UEqhE4wflZFM7/RDc7P/JsYmOB8To+q8XGnOablhs4ShUXH/7kAAyIab5Ye48x4XN3/AmPpLPMNK6RWAdwwfWnt16IWZIwqM6MogdkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=melinkcorp.com; dmarc=pass action=none
 header.from=melinkcorp.com; dkim=pass header.d=melinkcorp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Melink.onmicrosoft.com; s=selector1-Melink-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+bT2V8JA8fiYbK9kgH02Ne3nnrhfe+aZ/K+AAfwrlY=;
 b=NMZP9rGI089Le1HYTFmNt9ArOnzVYSz97+/jKpeYhtxcSKAoc8kHgjUIA6myVZUWs5scHORRiLo/kNrp1VtCkHNQ2O8+E6oFpmt2CyYoNMUpmHxAdwI8xRArXWQ/zjeMcKWioNQi/yfkGspjSx5wz5AnqOzJUYP5xxV3OorMA1IZKgS5/CxVBVJ4aqJwTWKEwVn+1TaniFsu7QFxNapHknVQKFjr3r9BRKDsmMxOxTqy/DytKlNlAO0/mk/JB3oK5JB4831fW0010fHrWvoDcvxsXnYHcQR1M0JmN+WqNkjt/3BaKaovyZxUlHss79f9u+sWp8ejGwdzTtUcR7Q0TA==
Received: from CH0PR20MB4122.namprd20.prod.outlook.com (2603:10b6:610:de::6)
 by SJ2PR20MB6094.namprd20.prod.outlook.com (2603:10b6:a03:4fb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.27; Mon, 27 Feb
 2023 20:35:43 +0000
Received: from CH0PR20MB4122.namprd20.prod.outlook.com
 ([fe80::bad5:7d66:b7c:b59f]) by CH0PR20MB4122.namprd20.prod.outlook.com
 ([fe80::bad5:7d66:b7c:b59f%3]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 20:35:42 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: multiconfig: Build breaks parsing recipes for other config layer
Thread-Topic: multiconfig: Build breaks parsing recipes for other config layer
Thread-Index: AdlK3nSy3ZYIML5WT1W0A3McG3PccQ==
Date: Mon, 27 Feb 2023 20:35:42 +0000
Message-ID: 
 <CH0PR20MB4122DCF26110929D2A178451BBAF9@CH0PR20MB4122.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: 7f18df55-baac-4770-be93-116552f698b7
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=melinkcorp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR20MB4122:EE_|SJ2PR20MB6094:EE_
x-ms-office365-filtering-correlation-id: bb86713b-b41d-4cca-29bf-08db19023256
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IvhUAQJeUT74lRYIhRgmMzkoWrAwba3m3LtS0vnI7PwnTxoWjcjpEuHAHBeI1pl7f4NFvokR2KIisd4PX0CYGguNhIqeEP9D4KAUI42ie0AGHrsH+qX87pUYwXgpOF9WnCLPBGddyfT+9AKRIDdm+GAglAWKxeXFhrJm8X7IBMpfod9pL6Ri/5UfqrEM6cdvZcN2Mf1llql85AZ4AhUmPfN+yl6NsRclW+YsvUISyOUWPKpbyFheF22/JW/nh7Zt9LUPQU9t6uKkzJCHSKpGtk46k0e3Dw8pt8mr8s0JGJIHlYyHL7IDzkFt2q1PihhMLFf0l5NPzk+2fYH6S/k8BwcLMCGRiq7AdmblBLBoEyH3IARoveJLr+bugL07yqt0e+Qv1/cMkbCl714bM0uV+8RJniDXLZsVyjO1DQ10b3/OmXkm6ahnWlSRkFHdqsNS7MyiNai+QQhEkBzX5zMnQBTlVkr+NzD9ErU2mDULrbFpZALVWeDSE2Og4pM+aB465K3gLtqZcrLvn9q77Gvrxv7vchZiru6pAgbaeSZW7UAam96JI6lcna5o8s04Di9II9UrOVuIs+1rymX7BOzO6l7spOIL/WoFfvht8NGUqqOxw371/G4OwItIvAOm+jdlFWbIxAsg0Y11jkSv4zjkuULDNGhC2qxQRtmEk3nBLvtKUYK2+LaG8ozQ7TcxitMA
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR20MB4122.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(396003)(39850400004)(366004)(136003)(451199018)(2906002)(66946007)(478600001)(66446008)(6916009)(8676002)(66556008)(64756008)(76116006)(66476007)(26005)(9686003)(186003)(5660300002)(122000001)(8936002)(52536014)(41300700001)(38100700002)(86362001)(71200400001)(33656002)(7696005)(6506007)(55016003)(316002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?/psVkT6PMIH/s4WOnyfPmzg47j42BpWt6l6FB45Cl1y3o+JEVXEnYpxlKC9y?=
 =?us-ascii?Q?QgCS5fVbcPzKZkxl40XP0e/UOnKM3mA5GSoeHQ2JYd5yBgX90kiMSkhSvJRQ?=
 =?us-ascii?Q?GHujQQax+/8sbc2AF0PjHw0lObZgFZdFET/oBbClIIMoe9z+N3SpiUn7/dPF?=
 =?us-ascii?Q?BIWceIR8uxses2biL95g+hg2CcfLxPICpHRSUI9NQm2yxH779XzzunBJjMBy?=
 =?us-ascii?Q?Ca0+xh1J/cPtpEoUp+hhFuDdbvoSErNqnEwMjesd15zaCl7iucbYwHqorERg?=
 =?us-ascii?Q?yvRk5QGN1oBTG5QNSdqePNw84TrG3TGDsiZmUxnWB4AiWEhKk+AUWh2LZPMO?=
 =?us-ascii?Q?71rWonRQBodSy56weDELhfLHCj2M5NHAxrzSxD2W4YNavY/ua74mMX54Eu0K?=
 =?us-ascii?Q?LVcWkb33RN/V7SDZ1CUtScw0So9sAxK6yAzzhq3YB+izMY4P+SrjV8nuw0rA?=
 =?us-ascii?Q?65qC24HfDnY/XLnb5lneyzgnx9ixZ4QRZy+ddsB4JoW9On2VNSTjlv7mukzk?=
 =?us-ascii?Q?TvQcd0UrzYB88gEMOwda36YEAeU56CKgbal/vf2ft/vuo0mEQtNDMXgkkRTY?=
 =?us-ascii?Q?FquDwnCHp5hOPP9QgSgealnv8cOKL748y8mAus6AeyZCtiN3hcZnmhUcalG3?=
 =?us-ascii?Q?iRYN0QQfSSxksm1cLoh96xXHMejJlv7ZEquXBROH4CpPmDstujJaY8MQqBCB?=
 =?us-ascii?Q?gaiTnkdVAyXT4pO0Ajl6K90pTYagvCgrzYWhL7Ujm5UJcMwevXMu7ZDpa2zN?=
 =?us-ascii?Q?Qtuaxi61vXLfcS+Pbk1ZbK1RBYovH+Txc8edgG9PXvIOGiIOgkDv70W7/QaM?=
 =?us-ascii?Q?Ucs/9S607p9ZX9LZkh1sBk9J2MU/Cjvv4M0UF3BFn+RYeUkWNvh4zZt9Ftxa?=
 =?us-ascii?Q?kc5sGkNZCSaFwuPZ/7yqWSb39epT1o6ml0UwPO0DIv72j9aq2dRSKi3vp3pM?=
 =?us-ascii?Q?blQp3v+ezDWnRQAwIuNPW+YZGiq/p52qUln9QzeOEbJL47LejXySbt4bkgNN?=
 =?us-ascii?Q?JbRbHRPJNB63DlrZ6v1WSbjbIxWqkvJ9PqcPjPliCIX//nDdXmKrFckifqga?=
 =?us-ascii?Q?RixGlMoJcYe0nCYuJ202sYLoZg3FZ6DDZD5RIGKeW3dUdTBVOVc9aB2gYGDF?=
 =?us-ascii?Q?TwIksaUM0rj5W/bz/pdMdXx3VDwOWCIx/t5s0XCkh/dK7TxyLGimYd5HD4Vj?=
 =?us-ascii?Q?6e5Ev9ZMPoGtEQKFjJbcnrDSKGv2zqWeF35sw3FzyBFb5B/Sv1ExVyi0bqAM?=
 =?us-ascii?Q?s34pgcrzhVzY9+pPbjQUuYHAaRAIpsdndGtUl4fZi9KewpnNEotiJvazkPab?=
 =?us-ascii?Q?MKTeccVOJznVcdfkXSFpqRMlg2taFSBTSLQiSQBHNB5nkm7BGBX1l2eNidJ1?=
 =?us-ascii?Q?4/qWoOaFM59X1/CCTkieIAl4qUDZVgM7IEDTxFYOTP1U6GsQu1Wy8RHcGkgo?=
 =?us-ascii?Q?BruYk6mglIg/hIqgeKbObfTjiKznbYQ5g2ANtjtPli52coHF6EsEsIFdLr9Q?=
 =?us-ascii?Q?Wz/DJ7eSq/HkI7mqknpRyFiWovby/VfHWHeQyoC9994E50jmvLRwUqADuHbI?=
 =?us-ascii?Q?opHX+Q2IVrNqciljczrjCBiw4yKiZcnpjqyWjswN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR20MB4122.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb86713b-b41d-4cca-29bf-08db19023256
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 20:35:42.7725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VqxfwBJBXX6YwoqMdDdOnLbC850wdDgUS9gr6QhqHJkrH16pGYkOqPIf7NBebxrgNkK0qZLv2GM70T3/ncWvTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR20MB6094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 20:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177808

I'm testing a new board with a BSP that is setup on the gatesgarth branch. =
 I've been able to build and load the demo images for this board.  I'm now =
trying to use multiconfig to build images for my old board and my new board=
.  So far the build hasn't got past parsing recipes and I'm wondering what =
I'm doing wrong.

For my setup, I have two separate layers for the two different boards.  Eac=
h layer has its own MACHINE and DISTRO definitions.  I setup the multiconfi=
g files as follows:

conf/local.conf:
Added the following line:
BBMULTICONFIG =3D "configA configB"

conf/multiconfig/configA.conf: (config for old board)
MACHINE =3D "machineA"
TMPDIR =3D "${TOPDIR}/tmpConfigA"
DISTRO =3D "distroA"

conf/multiconfig/configB.conf: (config for new board)
MACHINE =3D "machineB"
TMPDIR =3D "${TOPDIR}/tmpConfigB"
DISTRO =3D "distroB"

If I try building the old image by doing:
bitbake mc:configA:image-nameA

I get errors while parsing the files.  It complains about a Network Manager=
 bbappend in layer B that uses variables that depends on MACHINE being set =
to "machineB".  The image for configA does not use Network Manager.  I also=
 tried removing the MACHINE and DISTRO settings from local.conf to make sur=
e the multiconfig settings are used, but then I get an error that MACHINE h=
as not been set.

Does layerB need something added to it so parsing ignores recipes in this l=
ayer when they aren't needed?  Or do the recipes need to change so they bui=
ld for other machines?

Thanks,
Bryan

