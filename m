Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1663BC83013
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 08:38:23 +0000 (UTC)
Received: from esa10.hc324-48.eu.iphmx.com (esa10.hc324-48.eu.iphmx.com [207.54.69.29])
 by mx.groups.io with SMTP id smtpd.web11.18791.1751445501809335422
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 01:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=aAe9bLCt;
 dkim=pass header.i=@bmw.de header.s=selector2 header.b=Tm3rjWKL;
 spf=pass (domain: bmw.de, ip: 207.54.69.29, mailfrom: prvs=27128fcf3=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1751445501; x=1782981501;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=870UfRrQCC/HAjXZtERhy1kIzhnL0Xt1ZExpyFdAR/Q=;
  b=aAe9bLCtN2YtiFBswYONT25MELxm2zjvBBBJihwq60gtqMrltfikVGu/
   lxw9A8H/vfo4FZrOgmXuid6zd5T6KYYg0urMaFtggXvsJGOj6/kKMoY8V
   dvuKLDBeHk1jAkpOTLyGPMQcFZl/knuQoycKyY7YvZQOLQli4hWhbV6Ud
   M=;
X-CSE-ConnectionGUID: W8EYa9FaQbCMVsTw9BKzJA==
X-CSE-MsgGUID: WFdLePsRRSSU+07lBFvHwA==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa10.hc324-48.eu.iphmx.com with ESMTP/TLS; 02 Jul 2025 10:38:19 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw4.muc with ESMTP/TLS;
 02 Jul 2025 10:38:20 +0200
Received: from smucmp17e.bmwgroup.net (HELO smucmp17e.europe.bmw.corp)
 ([10.30.13.155]) by esabb1.muc with ESMTP/TLS; 02 Jul 2025 10:38:20 +0200
Received: from SMUCMP09G.europe.bmw.corp (2a03:1e80:a15:58f::1:2e) by
 smucmp17e.europe.bmw.corp (2a03:1e80:a15:58f::1:155) with Microsoft SMTP
 Server (version=TLS; Wed, 2 Jul 2025 10:38:19 +0200
Received: from smucdzmp03.europe.bmw.corp (192.109.190.48) by
 SMUCMP09G.europe.bmw.corp (10.30.13.81) with Microsoft SMTP Server
 (version=TLS; Wed, 2 Jul 2025 10:38:19 +0200
Received: from PA4PR04CU001.outbound.protection.outlook.com (192.109.190.1) by
 smtpedge.bmwgroup.net (192.109.190.48) with Microsoft SMTP Server
 (version=TLS; Wed, 2 Jul 2025 10:38:19 +0200
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com (2603:10a6:10:43a::13) by
 GV2PR09MB6040.eurprd09.prod.outlook.com (2603:10a6:150:bb::14) with
 Microsoft SMTP Server (version=TLS; Wed, 2 Jul 2025 08:38:12 +0000
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779]) by DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779%6]) with mapi id 15.20.8857.026; Wed, 2 Jul 2025
 08:38:10 +0000
X-CSE-ConnectionGUID: PRF3x4biTm+hV5N0nlYDKQ==
X-CSE-MsgGUID: Ta28hmM2TESXO3UOFedWKA==
X-CSE-ConnectionGUID: HfhD1/Z0TGS8S2HHAmkeiQ==
X-CSE-MsgGUID: 1ySLH+ozRPyqGV3BfKDJMA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbNGr/hgD0D3fhE1pOg4GfwNKAFDjeHwu59zwveNWkTzebKyGXx7HCqmIPqcsh3IdPT5tlRiNGMxQ2EOpxBHV7rfiu3webnYUGRmrY9xlAhhb0U6EJlhP3Whm1ZHUWLnpiJSrACnGLxTCxhA4VcAhtqvtzkTDS0TVvtVPjn25w/ADG5UXqQ3UL0GZncmfN07/c+QEzdj+Fydy2zLqoNtO/gVMWn7weJhOXWGx7fCi1qm/joC1Tm2FLtbdi4iVV3tfrn3k6pUjnEM5YUoCKURrMToiOcXGy3AdXz6jlSHBRKY0MzlzNNwjkASY27JeGG2xymNjSJQvOy4a8id3bBnhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=870UfRrQCC/HAjXZtERhy1kIzhnL0Xt1ZExpyFdAR/Q=;
 b=yHQNSn1vXNn2RK+Q7wnB8J5BR7dEsHo5huBjs3ji7haBzysX6y0ys75qlxPwEIRKffTPZhIDnPccR+ZW4naf0RE0uOZcChOTvYeWe4cSKwnAXkcoxnMgijPKTMwgadn1+WxJAPJd2LVefGpw8e44zrDeYRcg+ANkinstBEGAQz5IqV35ja9cOj5cklZdm+0xxaugW9Kn6/Qmxetld7+2QMmxys/im4g1taffwARPFMYyrHJ7NHfouJCXbFZdEKfQo8/g7wCcW8J5s/r2MRp81nQtBonrPX/lEoCuaCZxrT0Qunbkx5TRrMrhRPosIXWd99R26FyxRiUEQoiJu59kSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmw.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=870UfRrQCC/HAjXZtERhy1kIzhnL0Xt1ZExpyFdAR/Q=;
 b=Tm3rjWKLcWZWDVtoR6RcES9md8C9uncglFM/rfqd4pVe1el3xtRhGoVHNBHYM25HQLgnpk8gpNd49YQ7mkIlrAGqzYZP5wBFnYsXlhNbZP/NC2gk2TePBHFSUvcWTnnaYuG1V/S4MxkDC2q+avxkLHTi7Emvxh8gBEsQVZ7F3y4Y39khhDPByV5szYS1/7ZO0oA1P1nF9fR4+WnYRBMztRu3zxAqk2rMkyHkPQvofWrQ5Doxn2As7EpGRhugfDApZKo7y2+RoDSygBkSqqcZ8cvfcqwMJMy9GsO2qaZDJPmvqT3ntWx2K6f26wJCGRW/EkKZw795U5XEZMiacsWmXQ==
From: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
To: "Marko, Peter" <Peter.Marko@siemens.com>, Antonin Godard
	<antonin.godard@bootlin.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"quentin.schulz@cherry.de" <quentin.schulz@cherry.de>
Subject: Re: [OE-core] [PATCH v2 0/3] cmake: Major version bump to 4.0.3
Thread-Topic: [OE-core] [PATCH v2 0/3] cmake: Major version bump to 4.0.3
Thread-Index: AQHb6auTfwl2d/hnDkW6vnjnl1LkG7Qby0SAgAEMT8qAABLkgIABmr6E
Date: Wed, 2 Jul 2025 08:38:10 +0000
Message-ID: <DB3PR09MB6202728432070E34F70C265BEA40A@DB3PR09MB6202.eurprd09.prod.outlook.com>
References: <20250630104104.4093207-1-Moritz.Haase@bmw.de>
 <DAZYFBTDZ6SU.9Z5XXGYAZXRN@bootlin.com>
 <DB3PR09MB6202B03623EBCB0CFDB4DBE0EA41A@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <AS1PR10MB569732A1DB58CB7DEDE56E5BFD41A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569732A1DB58CB7DEDE56E5BFD41A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=2e50a891-302c-418c-9530-56575f20293d;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-07-01T08:02:48Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR09MB6202:EE_|GV2PR09MB6040:EE_
x-ms-office365-filtering-correlation-id: 4a60fc35-de3d-4231-7825-08ddb943c6e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Ywrnul4gur82/KB9rOlfrssEc1mlS08Tts2kPhkkug2r+ts45lYeOh3BF3?=
 =?iso-8859-1?Q?QYjjat4iDL3Uoa8tnJTF55L5yxR+5kBE5gCx8iO8Hirmz/IU0P9hUVjH45?=
 =?iso-8859-1?Q?aqH9UD0AzO5fre0BfwzBFMs4JkSk2qJosIJ2njl1c/Jh0BcnweDc2B7z0j?=
 =?iso-8859-1?Q?bzVUiK+Ea9Sc7KqP30CNNEkvPawLAaA7pU1HjNevv+ykfWiRlCu1Fn6TAL?=
 =?iso-8859-1?Q?FEBRl4RFK0KCc6v87Qw9AqiwsbfBcGZCJYdzHpSwk2mESNB3RULBqhZxLx?=
 =?iso-8859-1?Q?T9Cm9QsZRFoNQxj8sDX9nAab3vInmAv2oZp3Dquhn6Lnmqh+8ugiMbdxqx?=
 =?iso-8859-1?Q?z1nvqyA7zNyOpLP6FHWMQZkawsmOEQ78ZekXj4D45R1L8zOHMLE2X4Dwus?=
 =?iso-8859-1?Q?n5tlNmLXVF/tWi82/a2LzPf1sx7DDjNOP8rEmqKqC0++n+JKGHHfr+4Ibo?=
 =?iso-8859-1?Q?S8mSF6MasjLwgNZz1ziTMYiaQocFiPO2wDcgik2RzNEkUsxpVCvm93IxUb?=
 =?iso-8859-1?Q?f+mAyedWfkyXYVM/qRxG4Z7h2hrtJxDl35ZAYY0XSyzbApB1bueRw7X4QS?=
 =?iso-8859-1?Q?QQiyzJm2+9f+CYAumafeoby56dAlKjg4f+8Rhym9rnOks1Xq2zPo3gdkEM?=
 =?iso-8859-1?Q?USotJnHRrGwdcbTKY8+YVdq/f8SGJk7lVIoaLspwUC4udcJmpmE4cUfyaB?=
 =?iso-8859-1?Q?0BIRHa79Zq4KFtq9D7Zk0yGcczNJUqLyNyPxiMQu+7kV5OLJn83YCuniKP?=
 =?iso-8859-1?Q?dhZubZs+Jro9yGdysyXejuHraojS6n/TMqF44n1LyjqOq41pxLHzIDEzgV?=
 =?iso-8859-1?Q?p4ze9DmhNq/anwUO2t7CgCFYlb5Sp2DbL9h6euWnWG6DDn2QTKBpncCiwZ?=
 =?iso-8859-1?Q?9pqJv6E4EX0NGYqmQNMUHmWBxhQJCKx/X5SzsLLte0L0RXXu1SCg8fy1IL?=
 =?iso-8859-1?Q?qouyJKsbJGz2Y7jXOwTC9MsSJxkHyU8Kep+FfTpOM//3dGcw18xieg5ReZ?=
 =?iso-8859-1?Q?zlvU9JoqoRSiSRsl3T8rNkprG0xWQ2HpunXedKGZyPzHl4VVE6NJJWzSmN?=
 =?iso-8859-1?Q?/PzBM3ngs3Lf/M8VSsPOPncDcfQNF8Zn1allRaLq1Vnf3+I7JW5lL0ehTB?=
 =?iso-8859-1?Q?M8IlQJUfS4QnGI3aoc/G1oCzcuit8p4xFqswAtlBahDDaT9K8dDl8QJcHt?=
 =?iso-8859-1?Q?h9Bs6hp6Vakke43Pjk/CHm/NEG0f/1EESMd/PTC8MtfufUXTSILtzR1xJ3?=
 =?iso-8859-1?Q?gBSBRITTe8369daFPxqNT8XvWYAG2Mb90y/lPAlu/Y7qS+eKCYTt5uPUUC?=
 =?iso-8859-1?Q?I9saWT0RjqhbjyL6yysGI3Vt7BOPwurjkYbGVueKu5po5DEUfCRHFR3zZk?=
 =?iso-8859-1?Q?QKR3FEABrYf9Knf3SjxIz5/NJ4RJGSK+rZi5nuDfgurvMD9UwiR9KEPpPj?=
 =?iso-8859-1?Q?lE0uM3q4nzZ0+/7kl327Po+qPF+uE4iJRzh3YH2fQQYA148mEc8CKhtv2M?=
 =?iso-8859-1?Q?WsyOEYWU3KhFfRcRlcTlqffw+aPjm0CSasW+7U9oJ/HlXcMTRvwcF5ooT9?=
 =?iso-8859-1?Q?ldvd/Bk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR09MB6202.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FeoE4NpsTtS/sSmmTje9xSOwc+IM8jmlmDbWph6hhs+qIxeVEP1Y8L4oDk?=
 =?iso-8859-1?Q?VujVCwuUtyo2f+I+Nq44hlgBt3LDvycWjG5oHpiykxW2+UyVrXEGTVUNvo?=
 =?iso-8859-1?Q?EjBUy3jBgGrPF6er8mRhSbM1OtDVwR4p/bGy4PCLxeAl6eytGLgq2Gf53M?=
 =?iso-8859-1?Q?QESduNWGoOKwUyDwJADk9TtCuedKRs7Vu/uK/15X5NCk5LNlHE4qizDz05?=
 =?iso-8859-1?Q?GaWf137U2UvvnZ/FSZMjaGbWbtulqjn1GT2Ps5hE0jxsopWu+ba6ArykJ1?=
 =?iso-8859-1?Q?B6rbxfjwmTA2yGDARovZxd1XQRQ8nY+xWIvFiflNd0E8cnS1xClX8GMCuW?=
 =?iso-8859-1?Q?ufO5b3CZrUNzr2Z1atoUP2bLE6FthW5Z0iW/nlikpZybKBw4kIu8gGmc9p?=
 =?iso-8859-1?Q?gnpdlKcwvPGH/F5WH26YghaOTvqf1f24pmBiQlt40Y9L/mRplC6vRKZR9N?=
 =?iso-8859-1?Q?gDfzP/VJdDiC7X8m7NQfuQ2K+9v5xvJbAHjMFU+XIPDOS83N1m/Tj8uJWA?=
 =?iso-8859-1?Q?fCHYfzNQtJlG1YGi5MJ6lA/s194TtPljIlp14wElOwJW7XNjtUnU7w0eoi?=
 =?iso-8859-1?Q?1tutp0UnpkUbIUGez8PX8O1tsdl1QqDGdpREt1bU70YlvYcjnOhWE3Rd93?=
 =?iso-8859-1?Q?9N48MfTOrFycjwVfuxT5YhAjVU0yfS/j+GWiEueEQS9CaRjJ9wA4XMx8oh?=
 =?iso-8859-1?Q?pOGmaI1AMiwDxWQyDkrBynpMVFOyXaeWJObFmf8gcKJeWnal/lQNGMExj5?=
 =?iso-8859-1?Q?bEMvZbhjj1MbFB+syiofSIB0sQvoOehqQtZzlFN96u3evPxwsgV8jj2A89?=
 =?iso-8859-1?Q?Gd4KtECrsMDiqkdxQWy4MMyuUTrM8fL5WxQA1+rxekS89PI+y0KYynHqn3?=
 =?iso-8859-1?Q?hDP0gKfdIGFPXCE+lwYcnpcLwVOMdXBAvpM42d0BwJqgyS/es0FLxW4Iy6?=
 =?iso-8859-1?Q?bNYVYwCBzXwv9pTIEu78J1p4bKhu9lb3Ain/UxZm/vpInpLriCzEDcbiEb?=
 =?iso-8859-1?Q?WGlyQS6bUmw6iwk45480gseJjrd0ju8CMWxHb7xrud34FnB7nFvG/7z4Jx?=
 =?iso-8859-1?Q?sZLRMR0reYoUxGgApDA47iM/3b6wiipx/L6U3fRLWh7GUCFEE4Nywpzt1J?=
 =?iso-8859-1?Q?QnIpWG4L6rzJWx4kEPIpNQ2nwC340BwCGz4P4b+ozxA/VszhcSMXqp2GqZ?=
 =?iso-8859-1?Q?5VWNKvDO7ww5jEYiHvZJgmsiSp+XUGSh0iU0n2qgHFuDb2WRBiL97XXW9U?=
 =?iso-8859-1?Q?0MWi6yLg5M0eiRuE6Fy0okBE3mPojrtY4Dd66TPdv6LckrpIh/R8S814sA?=
 =?iso-8859-1?Q?ZTuFCNX1txR61CWbZcR65nwYhXJrhzXLdheFBerbW9iougdpz5eIHymKv3?=
 =?iso-8859-1?Q?z4NTCiOuOC8f4zgfM/UZcj21EYcMppqpxA2MelwmUBYjiknHrugHLrS6b5?=
 =?iso-8859-1?Q?go6AiA63ye4N/XWwwSq+5+YX+vmFAkJr80u0R7Hwlpvb2IwyTAf3LlL9sO?=
 =?iso-8859-1?Q?ndgKelFb+PbgeDNkwRw47KAWO/ZmFvXJLn5iwxTlkt7mwhPHAV7M15YnAP?=
 =?iso-8859-1?Q?JXyGrY6SjDPnj31BFXK2DNI18pp4UG7pCIr2AC+A6ZzsTHD3ftEohTLCSa?=
 =?iso-8859-1?Q?AUo3MEC+mPAXxymtiXDFpcOBaNNpMuPy7p?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR09MB6202.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a60fc35-de3d-4231-7825-08ddb943c6e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 08:38:10.7107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Ip1rm/W81fKoJKj171Bp0qj8pMRNjBVQ3sLPQz/NOqzwimLHPaHc+hjQHUXxtWvqrYwoQB4BFph29+B4dpRDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR09MB6040
X-OriginatorOrg: bmw.de
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 08:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219809

Hi Peter, hi Antonin,=0A=
=0A=
thanks for your pointers. I managed to reproduce all build errors locally (=
apart=0A=
from the one in meta-virt, which I don't have set up locally) and have upda=
ted=0A=
the patch series with fixes. Hopefully Autobuilder has less to complain abo=
ut=0A=
this time round :)=0A=
=0A=
Moritz=

