Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CE9C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 01:53:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.74091.1701914026059230356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 17:53:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=g7v/k4CZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0705ba5b9c=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B71pXg7026204
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Dec 2023 01:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=dt6+XvYMLuUgzvzWZ+
	Srhl/jIgk8COVMhIndJl8eIlI=; b=g7v/k4CZWyx99FSJINV2nKCmrAToxcdLy5
	PS9QRbGtHRU80zVx9LvfokzCOzzYrtUsc/jRmekkjD2MgTr9trDF0yI4qx/ruhN9
	N9OpmnlW2yLNXxgMAI11gktcb+gCOXnAa/kx7vPVYrIa7WXY7a+i/pWAvgBlCNmL
	vs41TYG9EpRTIc20X3NMl2XZ8azeoo7qXgNgM+/UyNvFW1yRWR+ej3oIywmcekxq
	8saXngJ10+5agCeNnvgh+WnuM2ciaa4nPVc4j+odtPPTdlxHLt5NKs7OedW37yU3
	mieMvt3korVZUUj7m6DqLVhEv+KHHaUTt/cBxEv2/UjX0QWUwvOQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd53h7c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 01:53:44 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3B71rief028140;
	Thu, 7 Dec 2023 01:53:44 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd53h7c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Dec 2023 01:53:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grdwOWn5k0GRX5LwZcC4ZId4DUcWJyrwa3odcmjqit73uastolIZ3/gk1vfqOBJq7Yd3sz2VvA95oOuP98gazzU/ZImCXg1CmStIL+3U+cINyx01+6NwdW3AU4w3DzVLVuAn71LByq0a3v7uLv61KHOGNjwkeI/FeHBMH8rLVdi/eawaPOn5RvY4p89GwxJJRM1OhXZ3NdAf510vQkriWgMJ19+WBioBhgRqkw1iWm3O4kIVHiqcy/sDv8opL8cZS6io8esqIJ6cfoUNPi41yY6sHwjZizHhmi0cl3rAwtAn6uUaLPr5DIXA+q8e86g0OoesfkQgDtpC6BPKLpjzsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dt6+XvYMLuUgzvzWZ+Srhl/jIgk8COVMhIndJl8eIlI=;
 b=hjQ5JRHbeRyuhJWKSROYUsqkMqZgHdISDrs01uw17ncmRpH7xinsWsxmrq/1wpM6KexDy5kHetvNgEkZ6IBbZEBSxSAzIXehqR/Kva0EUEwVqtO+90aJSRuadohZ/9gm4gDRnWKv1cGck6/7IMZDBrAbDqdGZ3oBcoki+I883ZNz8SZ2S6itFIOffnULmfbU2qB+2+0demYyRcLdZVixDuwGoqTK/m3U/oQUsd5Nlt5K2j52uf2FttZeYBea8KHK4IjCoVtOox0TniF82pnVQwmerUxx/CjsvBEQ6+k+wl4FXvPjMRDJQn56dpyFbzJtcerAZrIYI4XYqVRtt1IxFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SA3PR11MB7655.namprd11.prod.outlook.com (2603:10b6:806:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 01:53:41 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::9289:cc3:164c:b6cc]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::9289:cc3:164c:b6cc%5]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 01:53:40 +0000
From: "Yu, Mingli" <Mingli.Yu@windriver.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] openssh: Add PACKAGECONFIG option to
 customize sshd mode
Thread-Topic: [OE-core] [PATCH v2] openssh: Add PACKAGECONFIG option to
 customize sshd mode
Thread-Index: AQHaKJRVO2O2LUYvYEiVOBJOwmABrLCdDvZK
Date: Thu, 7 Dec 2023 01:53:40 +0000
Message-ID: 
 <CO1PR11MB500913950BCDB02B20867D6EF18BA@CO1PR11MB5009.namprd11.prod.outlook.com>
References: <ef31fe38-2390-ecb8-405a-570895ef1ab9@windriver.com>
 <20231205055201.1738005-1-mingli.yu@windriver.com>
 <DB5PR02MB102131007FD5B5098EB7D4D6CEF84A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: 
 <DB5PR02MB102131007FD5B5098EB7D4D6CEF84A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Accept-Language: en-US, en-AS, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5009:EE_|SA3PR11MB7655:EE_
x-ms-office365-filtering-correlation-id: 7eb35aa5-af12-4ef8-10ee-08dbf6c75623
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +jmM2vgWbeY/fYezy53s1Fxk0r/7ZcHTR8yFouZ3bxWKPRfJDD9IfUAalVSeHpfEAeNbWgTSVPdSYOUahpFh7o+vM3UWJtw0yyZ1H+dBowgEZrOW9a2zEBKeODwZwLqEOaopYFCZ12JazGLWmun1Dy5DCb4K7xm5I4Hcm36Bxyzyyv5XSpY85FpxAay7qXDrQwCpK3wZVum7iCAert1ApGtH1Enpi+VYmDvh6Zxp++U8U53U0zihaCBB8ZTnYl90/mkgTnW9RXMFz/I3Fp4Rv5SpcEVkYcZSpBxfmMXYgRF4qSutqt5qCA3Sypf9VvNPBRkt9Mvws16u9xLsqumlhR0uDGIFVpiCYb6ZvROArdZMpLcbaWYrnoMeiLBUqp1a03yn+CChcLTvdcb77a5L5+UZRjOBxPdSPqKRLziRKJ+J1EM+ViXeLpLDJdmA69tyTnuF/H3fT83zK8sTbnxzSfXPcysAlHHHt6tL5/tCApmZ/n6ZsaGtraPqqo6jPNa69TPy8KmEjkyAlwAr+VC8TQ3wVhnwB7W5RPx8gJC0B9KyU27GVH9P6vj6YSL0aBj/IHcvbrI8DN5sQFpBwCtct9fZVMmXQAR0aPZ/yqtyO4F/w+L8h9ZNMKEFbylltzrOEwza/TJ1khB9I6tP89n54lXZj7RfDloOiQaorkmeIB4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230173577357003)(230922051799003)(230273577357003)(186009)(64100799003)(451199024)(1800799012)(38100700002)(122000001)(91956017)(66946007)(76116006)(19627405001)(110136005)(83380400001)(26005)(9686003)(53546011)(7696005)(6506007)(71200400001)(478600001)(66476007)(86362001)(66556008)(316002)(64756008)(66446008)(55016003)(52536014)(8676002)(8936002)(5660300002)(2906002)(33656002)(38070700009)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?NsWKccGumbLubhXLMZ1AGZQgUXa3kkRUUL9nk98gakHewzQQScLkDNHFTBnG?=
 =?us-ascii?Q?6MP+DyMpEPQOlFH12kI3jx2eOcyuJvC6V1rHLxmjyCw5Q4QwbJjHNHSyvuN+?=
 =?us-ascii?Q?0n0xcHCX6Ki9jzr8PoyFFKyQthx3AoPTNKlrc+3UV3kHMnxHiYhX3Y77aHGl?=
 =?us-ascii?Q?NxRl663xJuvxWqPVRhYbCmA7knssva0f2d0WioTmaRUeHK0/G1PjlHHG7Ksr?=
 =?us-ascii?Q?IfbXDw2UfIZFKGV2rtuKzcdID/Vg9tCyPM7/F2R+1DsguXCp6lpY8akMlqk0?=
 =?us-ascii?Q?lAHWefa3BV1w/Wy+Lrci8PcUN70JILXBX2GVVw329RsN/Ny3KUJ4Aw9Sbbue?=
 =?us-ascii?Q?G60dyOaUpjtzvUU5d2TyOpJ/07dpwvFuEDfu6T9pBGW3fpoe0cY4uNOqT7cc?=
 =?us-ascii?Q?Pih/stk2au0vpu4qXIpvkpuSRl/IzBs6fU7qaH7P34i1CrKuZenOiCH2XqJw?=
 =?us-ascii?Q?+lg7b4x0OUYj6XFW5o7/gXPjYOZiMe2FqaTNlSLszCjTMX5KtC7Mt4GlPuqG?=
 =?us-ascii?Q?GclP6QMOdVzG6n9Q6QHGJAPFQjeqQcxr83y2YJsM3VKcqi3zS8lCIZmr8f2J?=
 =?us-ascii?Q?we97IeEVFVe5+ui8mFBFvxUD+O10SuxbmGdwt8Yr0x2wVJL5cyhMrcFksrt5?=
 =?us-ascii?Q?JnRSg/mNbm4VEE0hj1eEmKDkbE5egWaS0FqitJ18lLBWwgKNsZNxFMyaR8jd?=
 =?us-ascii?Q?cEoalHKkMWUcsEdxc6S/K0XD5FHk3ah3zXuTbbuc7EIv1tdgTOjvbZRv/u5V?=
 =?us-ascii?Q?Ls5Zz1G9nSdySipjfbORj7mB2PYstrVabf2V4dpeoOOr6QxY205uBZBS+gOT?=
 =?us-ascii?Q?okRWryhFC49kT9+2NvQ5uTCwQ/g9rKmVktlZxdwUT5f7leE2vbDYAidrySt1?=
 =?us-ascii?Q?+x7pZm1i5XknFhGEP73lU1XMo0WYWLxEqcjE0ahpYIWNPx7x8SlkWkirCv+b?=
 =?us-ascii?Q?mVuMlIeF0E8PhbmqW//QJhCWKqm/fyiiy+U+Pb7etXIQ6+MdxmL8llBBPpMp?=
 =?us-ascii?Q?nmCbqvYxUf7ZaqR6VzxkriIYf7NL/OYFAw0OrxnDFMiqoE/nkj0wumwv2ng+?=
 =?us-ascii?Q?qWv3r+yp8Yl7pRu10/TUaezq8pkbmPlFjvOkt5dNTyNvqNSUsxP2D6si+XKY?=
 =?us-ascii?Q?G5CC5oB0l7QWN0Fe+0NXJRyEuYJfXnodbmE0DX4bzqbvVHvmea+Y5kmOnkrn?=
 =?us-ascii?Q?aPBSM0SVQu4VlXX5Lpra3La702Z5iltAynF3Ajo63kWFrRvArftVvDIBccGb?=
 =?us-ascii?Q?vYarFsS/vXmw2OhF31aJR4GXw/I8Vnd1Ioo40It7Oopq/OvMxH7Y+L8Sgadw?=
 =?us-ascii?Q?xrTb6aRmzodD31HJxkc0QHviGKxDPx2rAUrSQmLdiO+cX7q1fX14KnAEimG/?=
 =?us-ascii?Q?1YJa9jHspT1TLVgfcbZXRX9BU/rVz9aAgUWQJhJ+yzlXFzHrfP050q8IgkhX?=
 =?us-ascii?Q?E+UFBz5EHkAqjRwFAZn52ymH74H08QKOP+fXF2CwDceU5n4ePFczGpZgxR2U?=
 =?us-ascii?Q?LC3LnqHmN8sDEBHjTyR0XF8Ed964L4FOyecpneOAPH3jYoxTWvSlByRXlFLh?=
 =?us-ascii?Q?RGSSj7Ju4sIuGIbJs1aYKqMXXioFdTQVwkazL7fC?=
Content-Type: multipart/alternative;
	boundary="_000_CO1PR11MB500913950BCDB02B20867D6EF18BACO1PR11MB5009namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb35aa5-af12-4ef8-10ee-08dbf6c75623
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 01:53:40.6631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4jOFIIPuhjYMnKSr4PeDFbQkE5YNbKnF7W+MikZ1eqVdkUaVrowYzMihwzWspBh2EhYqbruAAuzeLqmIUxTtNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7655
X-Proofpoint-ORIG-GUID: pMVALLYaCr8E10JL-yQlvO-zz3Gawi6T
X-Proofpoint-GUID: 6TH6-uxzEfN-c8fzNKMpLox1aItdajLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312070013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 01:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191940

--_000_CO1PR11MB500913950BCDB02B20867D6EF18BACO1PR11MB5009namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Thanks very much for your comments!

Please use v4([OE-core] [PATCH v4] openssh: Add PACKAGECONFIG option to cus=
tomize sshd mode) to track the series.

Thanks,
________________________________
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Sent: Thursday, December 7, 2023 06:34
To: Yu, Mingli <Mingli.Yu@windriver.com>; openembedded-core@lists.openembed=
ded.org <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] openssh: Add PACKAGECONFIG option to cust=
omize sshd mode

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Yu, Mingli
> Sent: den 5 december 2023 06:52
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v2] openssh: Add PACKAGECONFIG option to custom=
ize sshd mode
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Add systemd-sshd-socket-mode PACKAGECONFIG option to choose sshd.socket
> and systemd-sshd-service-mode PACKAGECONFIG option to choose installing
> sshd.service.
>
> The systemd-sshd-socket-mode PACKAGECONFIG option is enabled by default
> and user can customize the above two PACKAGECONFIG option to choose the
> sshd mode.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../openssh/openssh_9.5p1.bb                  | 24 ++++++++++++++-----
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_9.5p1.bb
> index bbb8fb091a..a10f5c5a61 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> @@ -50,16 +50,20 @@ INITSCRIPT_NAME:${PN}-sshd =3D "sshd"
>  INITSCRIPT_PARAMS:${PN}-sshd =3D "defaults 9"
>
>  SYSTEMD_PACKAGES =3D "${PN}-sshd"
> -SYSTEMD_SERVICE:${PN}-sshd =3D "sshd.socket sshd.service"
> +SYSTEMD_SERVICE:${PN}-sshd =3D "${@bb.utils.contains('PACKAGECONFIG','sy=
stemd-sshd-socket-mode','sshd.socket', '', d)} ${@bb.utils.contains('PACKAG=
ECONFIG','systemd-sshd-service-mode','sshd.service', '', d)}"
>
>  inherit autotools-brokensep ptest pkgconfig
>  DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'system=
d', '', d)}"
>
> -PACKAGECONFIG ??=3D ""
> +# systemd-sshd-socket-mode means sshd.socket and systemd-sshd-service-mo=
de
> +# corresponding to sshd.service
> +PACKAGECONFIG ??=3D " systemd-sshd-socket-mode"

Unnecessary leading space after the first quote.

>  PACKAGECONFIG[kerberos] =3D "--with-kerberos5,--without-kerberos5,krb5"
>  PACKAGECONFIG[ldns] =3D "--with-ldns,--without-ldns,ldns"
>  PACKAGECONFIG[libedit] =3D "--with-libedit,--without-libedit,libedit"
>  PACKAGECONFIG[manpages] =3D "--with-mantype=3Dman,--with-mantype=3Dcat"
> +PACKAGECONFIG[systemd-sshd-socket-mode] =3D ""
> +PACKAGECONFIG[systemd-sshd-service-mode] =3D ""
>
>  EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
>
> @@ -125,15 +129,23 @@ do_install:append () {
>       echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdi=
r}/ssh/sshd_config_readonly
>
>       install -d ${D}${systemd_system_unitdir}
> -     install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_system_unit=
dir}
> -     install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_system_uni=
tdir}
> -     install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_system_un=
itdir}
> +     if ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode',=
'true','false',d)}; then
> +         install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_system_=
unitdir}
> +         install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_syste=
m_unitdir}
> +         sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
> +                 -e 's,@SBINDIR@,${sbindir},g' \
> +                 -e 's,@BINDIR@,${bindir},g' \
> +                 -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> +            ${D}${systemd_system_unitdir}/sshd.socket

There is no need to duplicate the sed command here. The original
command below would take care of all the files that are actually
installed.

> +     elif ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-service-mod=
e','true','false',d)}; then

Are the PACKAGECONFIGs mutually exclusive? The `elif` indicates
that this is the case. If so, they should be marked as mutually
exclusive by changing them to:

PACKAGECONFIG[systemd-sshd-socket-mode] =3D ",,,,, systemd-sshd-service-mod=
e"
PACKAGECONFIG[systemd-sshd-service-mode] =3D ",,,,, systemd-sshd-socket-mod=
e"

Alternatively, if it is useful to be able to install both the
sshd.socket file and the sshd.service file at the same time, then
the `elif` should be changed to a `fi` and an `if`.

> +         install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_system=
_unitdir}
> +     fi
>       install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_sys=
tem_unitdir}
>       sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
>               -e 's,@SBINDIR@,${sbindir},g' \
>               -e 's,@BINDIR@,${bindir},g' \
>               -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> -             ${D}${systemd_system_unitdir}/sshd.socket ${D}${systemd_sys=
tem_unitdir}/*.service
> +             ${D}${systemd_system_unitdir}/*.service

Keep it as it was.

>
>       sed -i -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
>               ${D}${sysconfdir}/init.d/sshd
> --
> 2.25.1

//Peter


--_000_CO1PR11MB500913950BCDB02B20867D6EF18BACO1PR11MB5009namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Peter,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks very much for your comments!</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">Please use v4([OE-core] [PATCH v4]
</span><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontS=
ervice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black; back=
ground-color: rgb(255, 241, 0);">openssh</span><span style=3D"font-family: =
Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">:
 Add PACKAGECONFIG option to customize sshd mode) to track the series.</spa=
n></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Peter Kjellerstedt &l=
t;peter.kjellerstedt@axis.com&gt;<br>
<b>Sent:</b> Thursday, December 7, 2023 06:34<br>
<b>To:</b> Yu, Mingli &lt;Mingli.Yu@windriver.com&gt;; openembedded-core@li=
sts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> RE: [OE-core] [PATCH v2] openssh: Add PACKAGECONFIG option =
to customize sshd mode</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt; On Behalf Of Yu, Mingli<br>
&gt; Sent: den 5 december 2023 06:52<br>
&gt; To: openembedded-core@lists.openembedded.org<br>
&gt; Subject: [OE-core] [PATCH v2] openssh: Add PACKAGECONFIG option to cus=
tomize sshd mode<br>
&gt;<br>
&gt; From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt;<br>
&gt; Add systemd-sshd-socket-mode PACKAGECONFIG option to choose sshd.socke=
t<br>
&gt; and systemd-sshd-service-mode PACKAGECONFIG option to choose installin=
g<br>
&gt; sshd.service.<br>
&gt;<br>
&gt; The systemd-sshd-socket-mode PACKAGECONFIG option is enabled by defaul=
t<br>
&gt; and user can customize the above two PACKAGECONFIG option to choose th=
e<br>
&gt; sshd mode.<br>
&gt;<br>
&gt; Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../openssh/openssh_9.5p1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 24 +++=
+++++++++++-----<br>
&gt;&nbsp; 1 file changed, 18 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta=
/recipes-connectivity/openssh/openssh_9.5p1.bb<br>
&gt; index bbb8fb091a..a10f5c5a61 100644<br>
&gt; --- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb<br>
&gt; @@ -50,16 +50,20 @@ INITSCRIPT_NAME:${PN}-sshd =3D &quot;sshd&quot;<br=
>
&gt;&nbsp; INITSCRIPT_PARAMS:${PN}-sshd =3D &quot;defaults 9&quot;<br>
&gt;<br>
&gt;&nbsp; SYSTEMD_PACKAGES =3D &quot;${PN}-sshd&quot;<br>
&gt; -SYSTEMD_SERVICE:${PN}-sshd =3D &quot;sshd.socket sshd.service&quot;<b=
r>
&gt; +SYSTEMD_SERVICE:${PN}-sshd =3D &quot;${@bb.utils.contains('PACKAGECON=
FIG','systemd-sshd-socket-mode','sshd.socket', '', d)} ${@bb.utils.contains=
('PACKAGECONFIG','systemd-sshd-service-mode','sshd.service', '', d)}&quot;<=
br>
&gt;<br>
&gt;&nbsp; inherit autotools-brokensep ptest pkgconfig<br>
&gt;&nbsp; DEPENDS +=3D &quot;${@bb.utils.contains('DISTRO_FEATURES', 'syst=
emd', 'systemd', '', d)}&quot;<br>
&gt;<br>
&gt; -PACKAGECONFIG ??=3D &quot;&quot;<br>
&gt; +# systemd-sshd-socket-mode means sshd.socket and systemd-sshd-service=
-mode<br>
&gt; +# corresponding to sshd.service<br>
&gt; +PACKAGECONFIG ??=3D &quot; systemd-sshd-socket-mode&quot;<br>
<br>
Unnecessary leading space after the first quote.<br>
<br>
&gt;&nbsp; PACKAGECONFIG[kerberos] =3D &quot;--with-kerberos5,--without-ker=
beros5,krb5&quot;<br>
&gt;&nbsp; PACKAGECONFIG[ldns] =3D &quot;--with-ldns,--without-ldns,ldns&qu=
ot;<br>
&gt;&nbsp; PACKAGECONFIG[libedit] =3D &quot;--with-libedit,--without-libedi=
t,libedit&quot;<br>
&gt;&nbsp; PACKAGECONFIG[manpages] =3D &quot;--with-mantype=3Dman,--with-ma=
ntype=3Dcat&quot;<br>
&gt; +PACKAGECONFIG[systemd-sshd-socket-mode] =3D &quot;&quot;<br>
&gt; +PACKAGECONFIG[systemd-sshd-service-mode] =3D &quot;&quot;<br>
&gt;<br>
&gt;&nbsp; EXTRA_AUTORECONF +=3D &quot;--exclude=3Daclocal&quot;<br>
&gt;<br>
&gt; @@ -125,15 +129,23 @@ do_install:append () {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &quot;HostKey /var/run/ssh/ss=
h_host_ed25519_key&quot; &gt;&gt; ${D}${sysconfdir}/ssh/sshd_config_readonl=
y<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${systemd_system_un=
itdir}<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; install -c -m 0644 ${WORKDIR}/sshd.socket ${=
D}${systemd_system_unitdir}<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; install -c -m 0644 ${WORKDIR}/sshd.service $=
{D}${systemd_system_unitdir}<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; install -c -m 0644 ${WORKDIR}/sshd@.service =
${D}${systemd_system_unitdir}<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if ${@bb.utils.contains('PACKAGECONFIG','sys=
temd-sshd-socket-mode','true','false',d)}; then<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -c -m 0644 $=
{WORKDIR}/sshd.socket ${D}${systemd_system_unitdir}<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -c -m 0644 $=
{WORKDIR}/sshd@.service ${D}${systemd_system_unitdir}<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i -e 's,@BASE_B=
INDIR@,${base_bindir},g' \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; -e 's,@SBINDIR@,${sbindir},g' \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; -e 's,@BINDIR@,${bindir},g' \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${=
D}${systemd_system_unitdir}/sshd.socket<br>
<br>
There is no need to duplicate the sed command here. The original<br>
command below would take care of all the files that are actually<br>
installed.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; elif ${@bb.utils.contains('PACKAGECONFIG','s=
ystemd-sshd-service-mode','true','false',d)}; then<br>
<br>
Are the PACKAGECONFIGs mutually exclusive? The `elif` indicates<br>
that this is the case. If so, they should be marked as mutually<br>
exclusive by changing them to:<br>
<br>
PACKAGECONFIG[systemd-sshd-socket-mode] =3D &quot;,,,,, systemd-sshd-servic=
e-mode&quot;<br>
PACKAGECONFIG[systemd-sshd-service-mode] =3D &quot;,,,,, systemd-sshd-socke=
t-mode&quot;<br>
<br>
Alternatively, if it is useful to be able to install both the<br>
sshd.socket file and the sshd.service file at the same time, then<br>
the `elif` should be changed to a `fi` and an `if`.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -c -m 0644 $=
{WORKDIR}/sshd.service ${D}${systemd_system_unitdir}<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -c -m 0644 ${WORKDIR}/sshd=
genkeys.service ${D}${systemd_system_unitdir}<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i -e 's,@BASE_BINDIR@,${base_=
bindir},g' \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; -e 's,@SBINDIR@,${sbindir},g' \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; -e 's,@BINDIR@,${bindir},g' \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ${D}${systemd_system_unitdir}/sshd.socket ${D}${systemd_system_unitdir}=
/*.service<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ${D}${systemd_system_unitdir}/*.service<br>
<br>
Keep it as it was.<br>
<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i -e 's,@LIBEXECDIR@,${libexe=
cdir}/${BPN},g' \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; ${D}${sysconfdir}/init.d/sshd<br>
&gt; --<br>
&gt; 2.25.1<br>
<br>
//Peter<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR11MB500913950BCDB02B20867D6EF18BACO1PR11MB5009namp_--

