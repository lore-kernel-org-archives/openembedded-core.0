Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182ABC433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 12:27:48 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.50])
 by mx.groups.io with SMTP id smtpd.web08.9312.1651235258172187381
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 05:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=tFY/HeYN;
 spf=pass (domain: siemens.com, ip: 40.107.2.50,
 mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n3LjY/XoFWGYATFVjN+ISV5l+BHFSLBLR8hxUGNGkxh8djTX/UfsLhucT53uGvgGa3GP0Xkh5rOJSfK+CxIiaSFJ2fXO04Lt7ehXZMKXazeALlXwLUH4CNXtZwnP+x74eovRh42afRBD2szHmxgTaWTjNN3LaYR3f1hw2ZaQPKQwk3WrN5w95xlWPkDFiuLITpm0DU53bh3Cht/Tz7v/jNm/Y4kDXc89cwzHOMvu7/S5+Rv/7JEuGK6fezMsyuvR3tlxVp05XYCbyWXtfNmbXoEAZKD8VDwRwlvQEMrTze6TPFR9hWrtpWYDNV7rSleQQLbcsIzKAmREuFVInizH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tgi8WLVOetQsZTYAgrLMcL2UdZaWi3QfSNR+c9dGfEA=;
 b=lKokRrskoiRQRtfzif76oRWHYLX4Ev5KqJBQ8ePqiqJNhzfbq+THCcBZdy0kKJvlRIJulMvGep8UHctcKrUX/vfnpKhtWpEs/3XwCwP3qd+SjexxO9NF8mW6LXohH6ISyPM29Dr5RgeektDPZjcE8KctVMm9RQrDmze9FdFMl34bJAXbPcbEntwureu57Sl3IA7WY0f/XjtqbNPTZR3+yRi4agosZ2miOuyO61DbxXg9+o1BWweifxQ2eWWiFfalZIGRcwsz/Z9hSF8DZI8FqnvaNv0PPQBCLyHjXbSEwzSn4zr7nS9o85Oo/yo043c+gBDS4wWow0MnprtbjW9ulA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tgi8WLVOetQsZTYAgrLMcL2UdZaWi3QfSNR+c9dGfEA=;
 b=tFY/HeYNDoeJbw2LiGnNgzjoEGvvdo+D8Uh4H7RcMRD+nYlbODMneNkNByc2iLMgQCIhxNhgIs083yPenBY1Sy2H2yWQohhM6IkTNh24PP3szfV2pY+f0mbTOclGbTqf16IotVLsMfgBlPHRt/QnsyTYmmyb0GZVgQ8BsKsj1nyNeTiSzpQYHsBufZ6/5Bt2OJevQaoHAWRZ7A8zH7xXL5z8nLfZXOEi4azSIm5/eUFBxgOV0BCCtHkw8G3NHnzF4jtHY2wRC6UTjLfr+0g8nAcv277Gtt5Oyk1DCvnnW8b6x49z9yGe9hkvNTdLk3AS6mkPpMZuGkyoFkF5FppU+w==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:161::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 29 Apr
 2022 12:27:35 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::18e6:1c49:fa68:19df]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::18e6:1c49:fa68:19df%5]) with mapi id 15.20.5186.021; Fri, 29 Apr 2022
 12:27:35 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] openssl: extract legacy provider module to a
 separate package
Thread-Topic: [OE-core][PATCH] openssl: extract legacy provider module to a
 separate package
Thread-Index: AQHYU9+5D6YspAx7KUWcU2HpRYJyrq0G3+FA
Date: Fri, 29 Apr 2022 12:27:35 +0000
Message-ID: 
 <AS1PR10MB56979EF202CB2921C9EA4C6AFDFC9@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20220419112118.60914-1-peter.marko@siemens.com>
In-Reply-To: <20220419112118.60914-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2022-04-29T12:27:34Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=ce622b74-307a-4d21-bad9-6c828eb1642c;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ad31faf-676c-401d-647c-08da29dba3f2
x-ms-traffictypediagnostic: AM0PR10MB3428:EE_
x-microsoft-antispam-prvs: 
 <AM0PR10MB3428CD559513527E50F2048BFDFC9@AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eLqAZOKP67rBtJfsrC7p3vnFg7xwrJZRyynV3AWvB+jIKBp5PeNFgPUcjrh1vv/gkJ/JD2hFi8fTWuRqIS3x+yqKsn6Wd1rcHVss0m/IgFKx4VB1pV07pyypJwcpEIVLYDrvktMM+GC8XlEgN7oF5yISEgX2SutoKc7XfZNCZRRuM5Lax7n/amXxX6tNKJvhNlphnyakbYiDP5TcRT2Kqc+5/1ddEoYFcFiMlijYKv5qLiqYxbY/h/GqhyyZK11a8An8Cj+opv3TjcNj+t7zSxQrQ/wIH6bw5e9+I6ScZSiJH/BBiliHoIQt7OsHiB4HG/VX8FUT7bpNaTT7cslm/4xrzPV+EhTQnRJAA+YCGjEerituGbRvnZMNxi0fm9dfkC3HjcUNaJ90SGXU91C+l7hivp4p4UtcGOChmenJvL56YvIoh9xJQVIkg6qK+EzAiffpne3SCtutbOmxsCEGhuU4bm44I4zqCFVcjKJmfZ5mYsEYeSI+pAtHydxCN5+C8jXeveY5pIdLf30oiXTQ0B6sFwlMg2hP94lusnzPdmE/FjW+jbYRtGE9EvcTQV8OzGQeF2eYMFakfmbxnq9nzhwppzB4xvIv0SQ2dFZGhDp/1CeuyA36ZR5huK5PBJdCz4KJzZrV4ijCfTNwfWhzHZYhPtMAg4/yM2mrC39ywRbQRfuOJ74zKmynNmOc8tgdL4vf8nd87t9+vMTmy698Fw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(52536014)(8936002)(5660300002)(8676002)(9686003)(508600001)(26005)(76116006)(53546011)(55236004)(33656002)(6916009)(83380400001)(316002)(38100700002)(38070700005)(7696005)(71200400001)(82960400001)(86362001)(55016003)(66476007)(66446008)(66556008)(66946007)(6506007)(186003)(122000001)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?pNNterPBEqe9nbJUoOwZ/vGxkDGKGauUg6XutyYVZcENEhauePjfkTZWOLdB?=
 =?us-ascii?Q?6aHEnKTjYVuKQ9Shj5KBPChqdtQq7kWjEjx2dHPVkyM/5lcbUVW/dck6im1o?=
 =?us-ascii?Q?xiofMTL0cwlIV0Dtkbi2U9Gr9loT1nkd0ewIVcW31TUe56VIl050JSSrEVXN?=
 =?us-ascii?Q?BERtlHAfRsGHjGxWgifFFbSFYWlIR+Z2JDk17izBbfXOCq9r7q3Y7CCYNZLz?=
 =?us-ascii?Q?fb5G5Yq/CWIoxb44eHq77/thzhUd9iQiBxUOat22spJDNT/XPMYOt3pTZrh7?=
 =?us-ascii?Q?nCyq4opQsedAH8NeL9mZEyMf9gVNoePs1GmWtlpC9lcDDdx43Rq75xAnr0M1?=
 =?us-ascii?Q?/7COnERwyXsT0AsOFOx0Joveo4JHXAY8Vg5NhLuJd+XPpx6m1TEcI7RiSwxA?=
 =?us-ascii?Q?7ycEbcjv6mrn1+vYXL3sS8PF9qOyszbNmxhp0ZIaUDV9PcExGLYFC1NGiHt2?=
 =?us-ascii?Q?lO2UjV+S/mxQBTwO0VmUnjhugOlCCHZ6Xb9uqP4HI/iAAh3wqg4rAK6i6DAN?=
 =?us-ascii?Q?Ex+qPu5Wj5wu48ZohLk8RZEQCVtbmiUYWX+shjD7/Ms3h4aRoPUL0i3mLMy3?=
 =?us-ascii?Q?wE88N3lVpHkYXAIWJklSBJn+22DKmo9cSoMiikEUGAGAIn0IWpeI2qgn9DsX?=
 =?us-ascii?Q?pYJ1zA1kx4cCZEvR0HrRpaWG1CtBu6S+7JdZ/ksEH3abJJD1AiZquTVdqpqO?=
 =?us-ascii?Q?aHfVHXOz4vmy24EP8YbMJH1nXhT9pm0SzhdOAZSJqNbPTHOuYYQ9Kn15U7zR?=
 =?us-ascii?Q?49ODjqz/8ayzbkXE4nthdbCluTwaYn7OqJQPaRjX6VG4SzyOinO6xqGTcbD7?=
 =?us-ascii?Q?oYIuYAnPgwXBdtMUrLw5ms0LQAQkKNg2UbFW3/Q7bfCjYBRucWQm/PHq4k/R?=
 =?us-ascii?Q?6PloX/QM67YHfuWRhm2hW3QqaRnFMwY1Al3WoQqvLMsSfQcsNvXqz+1DZjmr?=
 =?us-ascii?Q?7TFVSMztlE2BP/H1DWiyKV2+ZufUItAFn6uvStp1iAtVSKyTwLjlE15mzhtl?=
 =?us-ascii?Q?/NzCygiezxuCYWfKZ2XdplPrR2x5jgP5Rysuh7d1b4V8WYQydEILE0CQlJaT?=
 =?us-ascii?Q?4yttbQiepRxyS5OhG3qz2Z684/IoojEVFURbxXIJ37esfx0E8v5KFSKTGCbG?=
 =?us-ascii?Q?tAxgImBgyaouhkfofTsFRABmQMpoWbXUJI10T5oL0AtNLcFC97nXDDn7kybs?=
 =?us-ascii?Q?CQA/aLyjInojgAnWlATL7lyO2PcF7XKd4dwMeazpBgY8draxEqn1PLDRXevD?=
 =?us-ascii?Q?zwKJocD6ioyXvYd9we8HXKX+/li7eD8orQauj0C6s3xe6xBynzPnqxXNX3ql?=
 =?us-ascii?Q?WXnucXBxzsi/xrfoKwfwgVQezjtVew1hF9+jFqqgmfXFjejo/9f26Q69MSvx?=
 =?us-ascii?Q?dnpS98/yQ2vMWjRRt7RkYdzrZURTO+4NTG1WvqHCqW3RgbZ7x8oCLe6GrygS?=
 =?us-ascii?Q?BaLOkBX5WKwRzJlGasgCzs9YyPovc2kzKqK6iKghPDaf7YqUoN94O3/cTg19?=
 =?us-ascii?Q?SlwAhFqxBQDI72Q74z9+bLu5MSCXtRy8/mayiBqdPdcUImSfS/F/8MAK8amF?=
 =?us-ascii?Q?i8WW1G+RxYsGb9B5bp84q0cZgzSSwLQfrODCja5Yx+BfzXLnVY4k5bbHOb/M?=
 =?us-ascii?Q?B9G2Qvc0Aq04wEAEz3KQIlSjZNJsoBlis+Se9bPnqhAnA6em28pNJ9QlDQBK?=
 =?us-ascii?Q?1bW4+Unbv7dSRHZBT0DzzQevaoAAIxxsy++d1EdhDnZ4YmlxAzrY4gb/IThD?=
 =?us-ascii?Q?tEMHvBTJWm71mfrsM8cIOpQhfgF53JU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0ad31faf-676c-401d-647c-08da29dba3f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 12:27:35.1338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 lLnw3W8BY7t1vmJGClSU7puHGwzIz+S3O6BO+xji3jyhUjUl/XQ9ziC6YfNDk1ON0t0KLPbvvEgR0B2umzgx6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3428
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 12:27:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165009

This is important for seamless migration of applications to openssl3.
In particular poco from meta-oe needs this as packageconfig cannot add rdep=
ends to a sub-package.
Could this be picked to kirkstone or do I need to send it as new patch?

Thanks,
  Peter

> -----Original Message-----
> From: Marko, Peter <Peter.Marko@siemens.com>=20
> Sent: Tuesday, April 19, 2022 13:21
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter <Peter.Marko@siemens.com>
> Subject: [OE-core][PATCH] openssl: extract legacy provider module to a se=
parate package
>
> This module contains legacy cipher suites from libcrypto.
> We should not need to include base package because we want
>   to use this part of libcrypto.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_3.0.2.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.0.2.bb
> index ff2a22c6c3..a809666aa7 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.2.bb
> @@ -224,7 +224,7 @@ do_install_ptest () {  # file to be installed for bot=
h the openssl-bin package and the libcrypto  # package since the openssl-bi=
n package depends on the libcrypto package.
> =20
> -PACKAGES =3D+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc"
> +PACKAGES =3D+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc ${=
PN}-ossl-module-legacy"
> =20
>  FILES:libcrypto =3D "${libdir}/libcrypto${SOLIBS}"
>  FILES:libssl =3D "${libdir}/libssl${SOLIBS}"
> @@ -235,12 +235,13 @@ FILES:${PN}-engines =3D "${libdir}/engines-3"
>  # ${prefix} comes from what we pass into --prefix at configure time (whi=
ch is used for INSTALLTOP)  FILES:${PN}-engines:append:mingw32:class-native=
sdk =3D " ${prefix}${libdir}/engines-3"
>  FILES:${PN}-misc =3D "${libdir}/ssl-3/misc ${bindir}/c_rehash"
> +FILES:${PN}-ossl-module-legacy =3D "${libdir}/ossl-modules/legacy.so"
>  FILES:${PN} =3D+ "${libdir}/ssl-3/* ${libdir}/ossl-modules/"
>  FILES:${PN}:append:class-nativesdk =3D " ${SDKPATHNATIVE}/environment-se=
tup.d/openssl.sh"
> =20
>  CONFFILES:openssl-conf =3D "${sysconfdir}/ssl/openssl.cnf"
> =20
> -RRECOMMENDS:libcrypto +=3D "openssl-conf"
> +RRECOMMENDS:libcrypto +=3D "openssl-conf ${PN}-ossl-module-legacy"
>  RDEPENDS:${PN}-misc =3D "perl"
>  RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modules bash sed"
> =20
> --
> 2.30.2


