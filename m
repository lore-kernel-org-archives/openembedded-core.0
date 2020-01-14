Return-Path: <alban.bedel@aerq.com>
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
	(mail-am6eur05on2114.outbound.protection.outlook.com [40.107.22.114])
	by mail.openembedded.org (Postfix) with ESMTP id 7E07A6B8BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 09:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dQo2vjiabuVZK9eZVdIw04D0n8FSBqD/bLEWhqSWgKY=;
	b=c+zTAQFDlucczwEEFTwEuFXfB8rUtnrpQ72KtLY03FifP2mH6cCSN0UE1XROTJRcXkQqYbzwiBQTHuftVqGk5owEQiLbNyoHIGhvtB+T/5/vJ5WcKAB5Fa98KTvwJLdgf4qnsyrLGrkAkmPHOxngocMBkbE1yqYxlXQAeXMZrIU=
Received: from AM0PR10CA0001.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::11)
	by DB6PR1001MB1046.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:5f::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18;
	Tue, 14 Jan 2020 09:26:30 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
	(2a01:111:f400:7e09::204) by AM0PR10CA0001.outlook.office365.com
	(2603:10a6:208:17c::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18 via
	Frontend Transport; Tue, 14 Jan 2020 09:26:30 +0000
Authentication-Results: spf=fail (sender IP is 104.40.229.156)
	smtp.mailfrom=aerq.com; lists.openembedded.org; dkim=pass (signature was
	verified) header.d=l2task.onmicrosoft.com; lists.openembedded.org;
	dmarc=none action=none header.from=aerq.com;
Received-SPF: Fail (protection.outlook.com: domain of aerq.com does not
	designate 104.40.229.156 as permitted sender)
	receiver=protection.outlook.com; client-ip=104.40.229.156;
	helo=eu1.smtp.exclaimer.net;
Received: from eu1.smtp.exclaimer.net (104.40.229.156) by
	VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.2602.11 via Frontend Transport; Tue, 14 Jan 2020 09:26:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.59)
	by eu1.smtp.exclaimer.net (104.40.229.156) with Exclaimer Signature
	Manager ESMTP Proxy eu1.smtp.exclaimer.net (tlsversion=TLS12,
	tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Tue, 14 Jan 2020 09:26:29 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 7557188
X-ExclaimerImprintLatency: 1421543
X-ExclaimerImprintAction: 3424a4b0d0044309a5823b048e05c3f5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=EB8lsMLpf7Zgl9OvPOvI/PfqDMv5G7GoaKqUTFmJIraMQMAySo1GmCdOgNYk3utsaNhOVBS/gUn6TFumTkTaOus7ZzyZcM1rzSSFfcJ5VnbSCsa0CpTFgQSTqMV+eUVplh+ZB/WR1aPKAUiksOKITd2kWQ5/O+YxLQl2TOBJM0zXRJRytCUVdOTiBhgyWmz61mPphXZAQ54iOZPt1wiBWVR36qX5xCtIP+8263Q8JVzyCdPLoq7/AEdHpuD2MvTj3Iot9jfcIvIkS1rmXzQSMfpfQgylo9FDgXKyk78doX9YftdzbZ6pPlvwgIQhxkR0kMwIC6VcxvnIZGLlp+HSOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dQo2vjiabuVZK9eZVdIw04D0n8FSBqD/bLEWhqSWgKY=;
	b=ZKtahoSNVomeHQUZxEfKnePHZtt4Qr9v5vNqYHzkt93wX6t7Sl4RG3BQ2Wq8RzHOkf/8Vu6A2Dwo08S2WgF0p5TQbtU8VpL46aeOrTtPFakLGngOUsWHPwXrfS4cRzbm7sYstVvgaM4V6S+CVJipze8XmgiLMYlhVDO3CEANpb4hG/UD9JAIdU8/W2eb1f+MH7gT3IpFqPsgN83lnAkjsHNqp+juIKTRRqd0DXPo+ujy+uuM6UnoRxKTbf2PXt8JVkrZ2TCRmWuo3r6chN0Oh0Bb/MxO9luqW3+ODKNnP1leMZLX3CKfq894dgnI6nWz0EhCfBAgrzOZIo4K4TVzQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
	dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dQo2vjiabuVZK9eZVdIw04D0n8FSBqD/bLEWhqSWgKY=;
	b=c+zTAQFDlucczwEEFTwEuFXfB8rUtnrpQ72KtLY03FifP2mH6cCSN0UE1XROTJRcXkQqYbzwiBQTHuftVqGk5owEQiLbNyoHIGhvtB+T/5/vJ5WcKAB5Fa98KTvwJLdgf4qnsyrLGrkAkmPHOxngocMBkbE1yqYxlXQAeXMZrIU=
Received: from AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM (10.255.30.155) by
	AM0PR10MB3332.EURPRD10.PROD.OUTLOOK.COM (52.132.212.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.18; Tue, 14 Jan 2020 09:26:28 +0000
Received: from AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM
	([fe80::2137:b512:903f:8528]) by
	AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM
	([fe80::2137:b512:903f:8528%7]) with mapi id 15.20.2623.017;
	Tue, 14 Jan 2020 09:26:28 +0000
From: "Bedel, Alban" <alban.bedel@aerq.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/2] libubootenv: do not use hardcoded lib
Thread-Index: AQHVyp93VeZuaywiIke/yhmcQzAa3afp5COA
Date: Tue, 14 Jan 2020 09:26:27 +0000
Message-ID: <d4d9b293cb3e406aec809672dc1bf0b9e59d3061.camel@aerq.com>
References: <20200114055609.4115-1-Qi.Chen@windriver.com>
	<20200114055609.4115-2-Qi.Chen@windriver.com>
In-Reply-To: <20200114055609.4115-2-Qi.Chen@windriver.com>
Accept-Language: en-DE, de-DE, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
	smtp.mailfrom=alban.bedel@aerq.com; 
x-originating-ip: [2a02:8108:4840:8f74:fdc9:b81d:c47a:abc6]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b98bfb6e-ae0c-480f-e37c-08d798d3d664
X-MS-TrafficTypeDiagnostic: AM0PR10MB3332:|DB6PR1001MB1046:
X-Microsoft-Antispam-PRVS: <DB6PR1001MB104681D2CB4BECC3F0A064B096340@DB6PR1001MB1046.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4502;OLM:5797;
x-forefront-prvs: 028256169F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(10019020)(366004)(376002)(346002)(396003)(39840400004)(136003)(189003)(199004)(508600001)(2906002)(4744005)(36756003)(2616005)(8936002)(186003)(6486002)(6512007)(81166006)(5660300002)(81156014)(6916009)(8676002)(86362001)(6506007)(316002)(66476007)(64756008)(66556008)(76116006)(66946007)(66616009)(66446008)(71200400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR10MB3332;
	H:AM0PR10MB3428.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: aerq.com does not designate
	permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ju+afEq9U7SnaLsm3LkkZhA4FAj96S68AAdDHEDnPlPKuLI+byaWFbvT/JsvxQKV1PAuHPmqpU7NTNKpCUHvptotBKe7552DV+ZsUHlCx1hafEzuS57vpqApwmtjGC9DCB4w25dVAovioBwNGZaR8F8ec6JAuad5jaoccgnUSURF//t401K+8dwLRb3yG5zkel11Bx7JH2fq2XqgBbcibuxp3scKaOIHjIFEdPZFhrXGvYDY5Qb/bHdYcoC4j1oQWm/6SgduxVV7W8xcHOIpdfea7LG1jAeUvqoygeGcKgZS/qJI0lpNTMcmInzhowTHMBqyUe0nn41MTpfm9KrgAtlp36pwxguKchObg5ioIoZbvJE6DgZcEMsG5fvD5rOCwKYunOEZvDnuHh4LcjA0ant84nv8vAwsWTMwg4XizCYECJPUYCzFnYNdac6WuuN1
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3332
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:104.40.229.156; IPV:CAL; SCL:-1; CTRY:NL;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(136003)(396003)(39840400004)(346002)(376002)(1110001)(339900001)(189003)(199004)(356004)(508600001)(6916009)(26826003)(5660300002)(7636002)(7596002)(8676002)(246002)(8936002)(186003)(336012)(70206006)(33964004)(26005)(6512007)(70586007)(6486002)(2616005)(86362001)(316002)(21480400003)(6506007)(36756003)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR1001MB1046;
	H:eu1.smtp.exclaimer.net; FPR:; SPF:Fail; LANG:en;
	PTR:eu1.smtp.exclaimer.net; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 914ec6b9-59f7-4a9d-2409-08d798d3d549
X-Forefront-PRVS: 028256169F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +z51MAZlCELP6TxcNqyg2l3ZW8jyPscS3g8NGNt0zt1jaYKYW0m4176Y8VST56EJ3HwMpqAhUjkyYANxxaHGDbG5r2WAiKQ9Ktc0W+43zobosLgkj8vRM3t/pdm3Up8osdu97Kzt4i0cJtrngiIcG65eQWC98WTf5V3seMcHS4B9Ms9p/5zuUBHIHPeP/8ZhhI+LZfjyciiSf0InHIFU5+QlYFWKDhmJmuAYE1xAL7025ntpC4HjBsmfil5LMA0f329nHJDUUvLD/oapuKLzHxjnkvg+S3odIHA4FeLBfPC6pTP2KZrUoCZ8QozjakWbng5vFEqTu38NnKhnzfTwhd404s7aWoZ9iZ6Q65iJX63NmXh6zAW6SAzmZZRyrdLoKYVJ9UCmOl9gXkAAknZhGXHrlqAF3bSD2VsbpBWqHnYF8QJP/9SIdhHQ5xAPcnnT
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2020 09:26:29.6149 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b98bfb6e-ae0c-480f-e37c-08d798d3d664
X-MS-Exchange-CrossTenant-Id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bf24ff3e-ad0a-4c79-a44a-df7092489e22;
	Ip=[104.40.229.156]; Helo=[eu1.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1046
Subject: Re: [PATCH 2/2] libubootenv: do not use hardcoded lib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jan 2020 09:26:31 -0000
X-Groupsio-MsgNum: 133501
Content-Language: en-US
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-FZzt1AsfZP6JjIvHiKF6"

--=-FZzt1AsfZP6JjIvHiKF6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-01-14 at 13:56 +0800, Chen Qi wrote:
>=20
> +-install (TARGETS ubootenv DESTINATION lib)
> ++install (TARGETS ubootenv DESTINATION ${CMAKE_INSTALL_LIBDIR})
> + install (FILES libuboot.h DESTINATION include)
> + install (TARGETS fw_printenv DESTINATION bin)
> + install (TARGETS fw_setenv DESTINATION bin)

It seems odd to me to not fix all the hard coded install paths at once.
Either fix all of them or add a comment that explain why these should
be hard coded.

Alban

--=-FZzt1AsfZP6JjIvHiKF6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE0W61GceYqNjiMSkodJSaS524LbwFAl4diUEACgkQdJSaS524
LbwLyBAA2vbfbg0+uNbXCaEjqeMJzCa1fbaHZQi8Efyp78WAKNNrykImbVq1rsta
vYmkT45Oy/u/eguernZotiRbIhG1KvUt3nIm25tcdd4VnpEMb28UolDYa0LaLktQ
5A8l0qwh47NDhLQY2cu11b4OX1UoffOtWJTw8xVNdkpjKP9q0e0B9nlQGESgwhWf
9HIAWdKYYmzTNE0YPMCTGk6+WKxT9ubHGG32R5PEgW9AjwtkUzTYogyY+GcNakav
5mFWUOcJKNSkeMDBU27ebmDNIA4EwmiI8jjWiJ+HQCY8AdslgkmqLUMGSE+ykK9n
HFqlXUO54js3VR2PP3s1X+KVOS/6RkDbgsZ0OXWy915brONihZGUt8yeownbaphw
RlOGL1iw6mT3SNxooP/gKYJe3hl9YYCH2jtIfA7PMS/CYxgxfEhzMS/254U6Lzg5
9GwlMCQpmsc9qXNu0PH2getNfMe5Mg+a6wMlIPDEDVtwuySqHtfWqBj0rhbLkrTV
+GfI5QQy2zgacccoieXj59Plx/eV4AMcDN84ypXTsBvCq/59Vr/6IazhT5ER965/
tReEzniTbUfIEkl4ZNoLxpdqGTCmS5Ue+XSGjEodC/P3vWMds/+syo5LXVeeXO/r
8ywR4bdTaHZ7CpSFf9CPy4XMyOcvLBrD4LQZVHbaeWNet8uelag=
=7bLY
-----END PGP SIGNATURE-----

--=-FZzt1AsfZP6JjIvHiKF6--
