Return-Path: <ohnatiuk@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1B4C3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 07:40:19 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.web10.10091.1721288411641124895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 00:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=g3724o/m;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: ohnatiuk@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7511; q=dns/txt; s=iport;
  t=1721288411; x=1722498011;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=0LjTYVFurjTfrKr7PwfYkEYIFQsu/8QDSa5Vt16eZZ4=;
  b=g3724o/mzarwy10l/F8X4RdToBXBDIVbr6DKNRTGqBqJMBTCw6ftry1c
   4XstrAQ8beftefZkMaueC4ihBQVYXdOzPvU+sx/sqeQPQ6NeUne1YMyVb
   qq0YMscyfehkKRuBQH2AT1Hn6vbFSrmmRyq+hdCKL2hzrrCk5ZTe7WaH/
   I=;
X-CSE-ConnectionGUID: zYh8SJ+HTQSLRXrJvPEs1A==
X-CSE-MsgGUID: LnMP7pmrRleUtx4+CoGy6w==
X-IPAS-Result: =?us-ascii?q?A0AUAAD/xZhmmJldJa1aHAEBAQEBAQcBARIBAQQEAQFAJ?=
 =?us-ascii?q?YEYBQEBCwGBQDFSeoEeSIghA4UtiG4DlzqGVIElA1YPAQEBDQEBLgEVBAEBh?=
 =?us-ascii?q?QYCiSwCJjYHDgECBAEBAQEDAgMBAQEBAQEBAQEFAQEFAQEBAgEHBRQBAQEBA?=
 =?us-ascii?q?QEBATcFDjuGAoZdAQEBAQMBEVQTEAIBCA4DBAEBJAsnCh0IAgQBDQUIGoJeg?=
 =?us-ascii?q?h0NOwMBohUBgUACiih4gTSBAYIYBd4AgUgBiDEBJIExiGcnG4INgRVCgmg+h?=
 =?us-ascii?q?EWEE4IvBI4dgQWHeIIjDiaCIIhBfSYLgR2MOFR1IgMmMyECEQFVExcLPh0CF?=
 =?us-ascii?q?gMbFAQwDwkLJikGOQISDAYGBlkyCQQjAwgEA0IDIHERAwQaBAsHd4FxgTQEE?=
 =?us-ascii?q?0eBN4FSiA8KgXqBLSmBSyaBDIMNgTWDfoFrDGGHe2KBD4E+gWEBSYJ/S4Ntg?=
 =?us-ascii?q?UdHHUADC209NRQbBQSBNQWoagSFMwkKAUs9PjYsAQV0klGPKEeBM4IcnH+CQ?=
 =?us-ascii?q?goog2yZQogoF6o8mGsgqEMCBAIEBQIPAQEGgW4FLoFbcBWDIlIZD446H88Ie?=
 =?us-ascii?q?DsCBwsBAQMJimoBAQ?=
IronPort-PHdr: A9a23:mlgd1RWYLc2ao4bRQ8rM86rjr6fV8K02AWYlg6HPw5pUeailupP6M
 1OaubNmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QS47lf1OHmnSp9nYJHwnncw98J+D7AInX2sO30emu+oDQSw5JnzG6J7h1K
 Ub+oQDYrMJDmYJ5Me5x0k7Tr3lFcPgeyWJzcFSUmRu9rsvl9594+CMWsPUkn/M=
IronPort-Data: A9a23:0RD/IK4XEERNrKU54+m6XAxRtBTHchMFZxGqfqrLsTDasY5as4F+v
 mcXDD2Db/6JNjCgftwkYN/jpBtS65+EytdqHVA/rCw8Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyKa+1H0dOC88BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wq8qUzBHf/g2Qoaj1Nu/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eL7wYqt1VQkFyz
 Mc8EgAXTA67qvnv6efuIgVsrpxLwMjDJogTvDRryivUSKxgSpHYSKKM7thdtNsyrpkRRrCFO
 IxIMnw2MU+ojx5nYj/7DLo5nOGhmnjicBVTqUmeouw85G27IAlZiuO0a4OPKo3QLSlTtmKeg
 1qZ52HjOBUXCcCPlXmu9V292PCayEsXX6pJSeXnraQ16LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj6HT+QvcXC4PTyVKb5ots8peqSEWO
 kGhjeLpVQdN852pcEm5zIeOjy2KFDNMBDpXDcMbdjct797mqYA1qxvASNd/DaK45uEZ/xmum
 FhmSwBg3N0uYd436kmtwbzQb9uRSnXhVAU54EDcWXioq1k/b4++bIvu4l/ehRqhEGp7Zgfd1
 JTns5HChAzrMX1rvHfXKAnqNOryj8tpyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaM41sPvMUPZibxM/cfj2eN5yICkPaI+TPNC6+8UzaySsEgHON61Hg0PBfLjjqFfLYEyvFhZ
 cvznTmQ4YYyUvk/k2HsGI/xIJcgxzs1wivIVIvnwhG8mbuYbzj9dFv2GAXmUwzN14vd+F+92
 48Gb6OikkwDOMWgOXO/2dBIcjg3wY0TWMqeRzp/LLDTe2KL2QgJVpfs/F/WU9U9z/ULzbiVo
 CDVt40x4AOXuEAr4D6iMxhLQLjuRp1463k8OEQR0ZyAghDPva7HAH8jSqYK
IronPort-HdrOrdr: A9a23:IN3MbawoFZN+LFT0813LKrPxbOgkLtp133Aq2lEZdPULSL36qy
 n+ppQmPEHP6Qr5AEtQ5+xoWJPtfZvdnaQFh7X5To3SLTUO2VHYY72KgrGSuQEIdxeOktK1kJ
 0QDJSWa+eAQ2SS7/yKnTVQeuxIqLLogcLY4Ns2jU0dMT2CAJsQljuRfzzraXGeMzM2fabReq
 DsgfZvln6LQ1hSRMK9AXUOQujEoPP2tL+OW3Q7Li9iwjOjyRez5pDHMzXw5HojujV0rosKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMotJ9EEStti+YIKBaH5GStjE8p++irHwwls
 PXnhsmN8Nvr1vMY2COpwf30QWI6kds15ai8y7bvZLQm728eNsIMbsHuWufSGqe16MUhqA47E
 uM5RPBi3MYN2KZoM233am5a/gjrDvGnZNlq59Ts5SaOrFuMoO4auckjRho+JtsJlOJ1Kk3VO
 ZpF83S//BQbBeTaG3YpHBmxJi2Um00BQrueDlJhiW56UkfoJlC9TpS+OUP2nMbsJ4tQZhN4O
 rJdqxuibFVV8cTKaZwHv0IT8e7AnHEBUukChPfHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33J
 DMSklRu2I+c1/nTceOwJpI+BbQR3jVZ0Wh9uhOo5xi/rHsTrviNiOODFgojsu7uv0aRtbWXv
 6iUagmSsML7VGeb7qh8zeOLKW6c0NuJfH9kuxLL26zng==
X-Talos-CUID: 9a23:1/82Rm9yef2mVXGOpR2Vv1wlGpAeUD798E7rB3WIE0R3cJCOEHbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AIrgCtQ7UMWyzS1isezU7ze3jxoxM5YGWV1gIi68?=
 =?us-ascii?q?CtvSYJXAzEDCynWqoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 07:40:10 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 46I7eAfN030913
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 07:40:10 GMT
X-CSE-ConnectionGUID: ZrefuimYQK2EQxCqUJPcIA==
X-CSE-MsgGUID: 9+YApzxiT9Wiid9+3N0sRA==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=ohnatiuk@cisco.com; dmarc=pass (p=reject dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.09,217,1716249600"; 
   d="scan'208,217";a="38712964"
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 07:40:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WsXCOjz924Ku1VneECYw39x3TTChN5WeG2VLfhCQhTOYKm9nLywZZUGyo+LWxP7/6dDpKoN1xI6vOpqwmd+vLN6XcFBWXFyzwVqWQzJ+43piHoajty3UtnHNdrZTShFPWpfFkZmhVEIXiv/Ejky8LXdQWGR+DC0no1wPazrIiUA1/uDveRmkUAYIxR0shJ/4V0hnnR8QtI5i4DQAb6kpV4ApcL7D5jP/ZAaL4ylAml9V/9JaSaRYp9753HcLIAb45Ls3ncJ/iDSJIVqatMxhFv9G4teAGDIey4Ithu5GnKtImMtKTAgO/P+7KzXG/6UX7V5iRemRGWNOkJaGEMoXlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LjTYVFurjTfrKr7PwfYkEYIFQsu/8QDSa5Vt16eZZ4=;
 b=MNvqr3bDb+hAY9v6ac5dvJQeKJvD9IwBmJq7mI9DcEF0XHd9UxLrX9T0yefj1AzDcmpVBWqwWpvTsximD1ceYWMNfyTBAqefaIhZtLCYlBdhBqXSCtmlvT57bbs50rMwUgdg3HuvyWKH/16g8ZzXaOGKtRG4u0+iHPWZNZf2UJ7JkyFXx3h/D8daAg1K+LCOJzxBUQ4S6sBjeKs9BAL5En+mNUVmmtgY3K/Rg3wcOS7sinpYimz7A09j+CYkTNsF2XF049eYvl0nDbwykFnwpWh55wcg3F940PUqlsIY7nZ+loWr3di0SLBB1mi0fvHe6IZv2uX/+oCOMmYeTcfrng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SA1PR11MB5828.namprd11.prod.outlook.com (2603:10b6:806:237::12)
 by DM4PR11MB5311.namprd11.prod.outlook.com (2603:10b6:5:392::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 07:40:08 +0000
Received: from SA1PR11MB5828.namprd11.prod.outlook.com
 ([fe80::677d:da83:5ac2:33a2]) by SA1PR11MB5828.namprd11.prod.outlook.com
 ([fe80::677d:da83:5ac2:33a2%6]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 07:40:08 +0000
From: "Oleksandr Hnatiuk -X (ohnatiuk - GLOBALLOGIC INC at Cisco)"
	<ohnatiuk@cisco.com>
To: Denys Dmytriyenko <denis@denix.org>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] gcc: remove paths to sysroot from
 configargs.h and checksum-options for gcc-cross-canadian
Thread-Topic: [OE-core] [PATCH v2] gcc: remove paths to sysroot from
 configargs.h and checksum-options for gcc-cross-canadian
Thread-Index: AQHa2Kh+iQC3yj/b0UC0N6KpGiTYMbH8F3vn
Date: Thu, 18 Jul 2024 07:40:08 +0000
Message-ID: 
 <SA1PR11MB582845C51666A74D1410542DCBAC2@SA1PR11MB5828.namprd11.prod.outlook.com>
References: 
 <CANNYZj8AxXZ2Cpk6DiCo0V8sk7pROD-Rp-WXkUHU5mGmHcK2Qg@mail.gmail.com>
 <20240717095606.3572072-1-ohnatiuk@cisco.com>
 <20240718002131.GK17572@denix.org>
In-Reply-To: <20240718002131.GK17572@denix.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB5828:EE_|DM4PR11MB5311:EE_
x-ms-office365-filtering-correlation-id: 305acc15-e747-49e3-b7bb-08dca6fcd91d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?Vnt/KM3VWWsOVV25Lk05hy/XLlbvc7/yNc5x4Xzj7YLD2QfEsMhDM1Ojx2?=
 =?iso-8859-1?Q?QwRIgLMzrxxP+IfoF0IKG+ajYJlJGLU6dVC0DIrFstIQ69GR3qdO96mCeS?=
 =?iso-8859-1?Q?IpNOorWLPhocfExFtaNRxfqAHFLjKLjOJi1Oj+ilJXplhu+dXuKeq5FseU?=
 =?iso-8859-1?Q?YI2MO0igXpHh/SRyuOtuVoTfQ3puXC1D6TtpfZMvSjsAXWP++QSwjMNajk?=
 =?iso-8859-1?Q?0QaOeu3yfxiPkRIqeE9l75V1p5AdGKh9Wu+0ysHikmJAbp0T+ut08bSORy?=
 =?iso-8859-1?Q?5pINoqSXGNKy0uul0KAFnow/28z2JKATvW8DotW9EwJNRZbx9dZZ7Dhw6R?=
 =?iso-8859-1?Q?BiFxrVGtpabhdUx5shBgsYiBX68eMbDVpfkdRYBgs+2sbppwe98fGhxIVj?=
 =?iso-8859-1?Q?ze9eAaqfK3GSptKfrnSVYF12LXQD0Werjz3fz2R03YjTYfKPcIh4TQfSsK?=
 =?iso-8859-1?Q?4pYXb5LidOcsL5M3UGmMHZKBdqe3OEcFJ/z5Xh6u42pzdXJSyLQju8RMh2?=
 =?iso-8859-1?Q?H205BnZoULOrZxifFGNF7QBA+64NTA7LTrVIUZPyySmFvPKyxnbA+y9o2S?=
 =?iso-8859-1?Q?Inm+6YMWuwUiscTHAyPibGsqFVctGFX7ZbJAOrbhibdm195CyD73PDrc9/?=
 =?iso-8859-1?Q?XMltTct2SW7D5iW+rNN+gthJ7P50qK3O8IvCv5PsegEd5s/jsh35sMKFhZ?=
 =?iso-8859-1?Q?X9qF9VTohSp+CQ18YEA6iN1fmE01Ze45olib3ndrDXhB/pC1v8R2WvSCk6?=
 =?iso-8859-1?Q?elCCOhEDvO5MWmZIr52fq6Va5XpgPom/rKrl3bCAMwornrtFv6Y6RgTLrQ?=
 =?iso-8859-1?Q?ACGMazXc5BkrjXAMGNAr4hjNu6PI9TFZxyv3/RpwIZUMccZi5g71NV0Jef?=
 =?iso-8859-1?Q?Sp8mPPn35ltjQJilCMlTtXqM59afMm1ndl5LUkxGVxbicNRg+EmPir4svi?=
 =?iso-8859-1?Q?UGRehOBCob8/GcfRVEIYPPrdwIZJ4tG0yubKPN+nB/HCpH+8EhLAKHqMok?=
 =?iso-8859-1?Q?wE0FNXcXc4W17/LL9W7o/Tov9JEvVNL2P+A5zjjCZ/omKjBszeNkKdfATB?=
 =?iso-8859-1?Q?VeOcIihWHa++Whak5aioIq1fWG+QHBbRjMoZsNMsWD28u6BWWv1lsca0J6?=
 =?iso-8859-1?Q?qMjiUzhPuhG1pdCE79yYIKYiJs/vaUjbZm+URT7nwxQJtH54mRQ1wpURWM?=
 =?iso-8859-1?Q?D9agjvel5XAvMJNlxQe+46HEE7LzfHLyyNwE5G6gJVskmL56OFDhCg6YUj?=
 =?iso-8859-1?Q?wzoT7d2X+gB2XMT1RZghS/UVp/FqaW/x600v4Rr1vhkycr/QLDOFnyeoTA?=
 =?iso-8859-1?Q?HvlHPA8CwZdceaI3fR9apfZc6PUxplie/Q3PCNF7sCVNyNZGj12ffawwNd?=
 =?iso-8859-1?Q?2gQeKIFOIOvQ89SbFgBVPMmyBTUA0appjF+JnfeLDiJKIoO61f+nRj8tpt?=
 =?iso-8859-1?Q?WDBuBx8wpJ7YV1r2SyFsaq1rB4zI/84bnk6eaw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5828.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ynff2eNrMj+RVThC0/Xt7IhcR5MDwRKC9zCvKt7JaNIRGlOrzyPQnDEXTe?=
 =?iso-8859-1?Q?JyQdWTuSdfWiO8zy2XPHcGQ0GAMNPiqQeWYDV0/4L0YxdoDrArK51V58IZ?=
 =?iso-8859-1?Q?XEXhwehlDoPMCbivBqc5AXodvVD6oeDzsPfReuyRkY/ConwFFedFVIYpzg?=
 =?iso-8859-1?Q?Vnm2nXUmWUx9ut6iU2CsUwCFa7ouX7ZEvds+E95J0A0hL0ZWl3FO1/TIOn?=
 =?iso-8859-1?Q?JA5sRj9jLFgKJei01S9JtowVdjZa8zZAVt2NtlCuwdMpvNJNsOAM+Euk82?=
 =?iso-8859-1?Q?0LK1q/rosSV3hnu+Qt+RG7++BDjcHuevllMMeQiB3SMWJeaW8OKclc+CkX?=
 =?iso-8859-1?Q?foo1HLgyTs5J/sk4PghE4o2EjKNkYj/UVluCm8L5uj+d/nLw7GU1Vf8mP8?=
 =?iso-8859-1?Q?BBVb0DnSLUr8twEDOWnks1fZAOh8j5qGlgLtFDPpwdI63ij+EkmGyLH9sv?=
 =?iso-8859-1?Q?WOWWfRWI32+KCNgLAHMRLtAqFa+PQci2KUeGyRn2ibqgNHsd6FCW/Mp0c8?=
 =?iso-8859-1?Q?yXRdQ88lj8bNBqrOxf6qlc6EdT3OR3NbLzeNNTUuqkVpWaL4RZb3Jb+4/r?=
 =?iso-8859-1?Q?eF4XY6JaOyrg9ZzE2trEmj3ygvS8fKfgTO9I/E79cMc35TmYAfIrKigogm?=
 =?iso-8859-1?Q?wZgcVg7Vxz3xFaqvOnqj2OPvqdmkyQOl/Zt2+zpLyoJcBP93PARu8s6mKE?=
 =?iso-8859-1?Q?qICL6z+lJDPMuXW3adAjQZvl13KXr/+KKYatlx5KTt4p4satg1n5dRSwIj?=
 =?iso-8859-1?Q?bPjHI87QCfpr6DMMeYl4CrHdBuhpFjr397wRM8dfmemHn45DnyvXoKz51G?=
 =?iso-8859-1?Q?2Zeaz77fPKBjbrakLRe9QpWCIkJLYiKTJXgEBxukkfDgYYRewunTQ+fIrS?=
 =?iso-8859-1?Q?b8LWt7sYFDyXafNAkiDtZHvYnUGh0aCVcMeAVohYVr8eh3QCu/AQZ4lnVI?=
 =?iso-8859-1?Q?1c2RSXHNAd4IEKAQNQshDlbFA0jfsRDfedpIaSV6KLxPfoztXdOHhdEHez?=
 =?iso-8859-1?Q?nhQsuU1i2TiB6dKuyBYGTn3XLos5goVtjSIwnaU+SAn9w0ebQLNlWIF/Tg?=
 =?iso-8859-1?Q?GzrBp1va2IcuRGM+4p9yki7kfYDHhgVBsjsNg5+BXMLh19Do7rOKnuK7da?=
 =?iso-8859-1?Q?WAMpfaJuElwSUnenTUgpsSEveUUIBTRNs7xL3/7VmfV5Z0hxZz9s4CwgUU?=
 =?iso-8859-1?Q?pHVDaCm/CUXa36KyYV2HmqWpT/znpXz2rfV3rXZb20RzIdfIyjW6MKC9m6?=
 =?iso-8859-1?Q?69k0zvwu/viwbIPTXTbbR693S8y4v1t6+08OnuBQJLLnZnQyxasqt5Yasb?=
 =?iso-8859-1?Q?Tzm5Z9r3jY8Uuv9KxcwlLbYB61X9fGyyjLzYa9dTyoxVacea9n4Uqu7s2v?=
 =?iso-8859-1?Q?7wat0ng0yvp1t8YrQuXcfZIz4JgukllFgGf1vXbx99xpWlWCm47yRGpMBk?=
 =?iso-8859-1?Q?ug4lvB/GJPqVG6wdwSX8dZhq/7npUYOqluLaqoEIF7PUnJJU+gxbTzjwvY?=
 =?iso-8859-1?Q?+wv43hRSlVNn3I1N/ku9mTJ7gpDDnsX4kMF74/WXBHh9Jx0zBs5jH5KXAh?=
 =?iso-8859-1?Q?KdqZsFZ8nkTHvH3jjyZa30kMG4qcIx+ahBKc4biGWQb0VdKOxc7R0By92V?=
 =?iso-8859-1?Q?gyjGozGuWX3Ps=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SA1PR11MB582845C51666A74D1410542DCBAC2SA1PR11MB5828namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 305acc15-e747-49e3-b7bb-08dca6fcd91d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2024 07:40:08.3912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NBKrEDwXiSEHSqndcg7wXxyXplajkYfxE8lxMZPRR34hBlIj9O5tLHCwZWZlLNSdMEUIwUakgVXuXZQxbEYSNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5311
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 07:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202190

--_000_SA1PR11MB582845C51666A74D1410542DCBAC2SA1PR11MB5828namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

I am aware of this issue. As stated in my commit, it is designed to improve=
 reproducibility of gcc-cross-canadian as opposed to fully fixing it.

I have another patch I was going to submit which fully fixes this package b=
y modifying the code of gcc's fixincludes program to not include full sourc=
e directory, only source file name. However, removing these files entirely =
as you suggest will also work.

Of course, it would be best to fix this in code and submit the same patch t=
o gcc upstream to fix this issue for everyone. However, this would take mor=
e time and require us to maintain another patch in openembedded-core. Not s=
ure which approach is preferred in OE.

Regards,
Oleksandr

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Denys Dmytriyenko <denis@denix.org>
Sent: Thursday, July 18, 2024 3:21 AM
To: Oleksandr Hnatiuk -X (ohnatiuk - GLOBALLOGIC INC at Cisco) <ohnatiuk@ci=
sco.com>; Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] [PATCH v2] gcc: remove paths to sysroot from configa=
rgs.h and checksum-options for gcc-cross-canadian

FWIW, I'm testing master-next now with your patch applied and I'm also seei=
ng
the same buildpaths QA error in .../include-fixed/pthread.h

ERROR: gcc-cross-canadian-aarch64-14.1.0-r0 do_package_qa: QA Issue: File /=
usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/=
aarch64-poky-linux/gcc/aarch64-poky-linux/14.1.0/include-fixed/pthread.h in=
 package gcc-cross-canadian-aarch64 contains reference to TMPDIR [buildpath=
s]
ERROR: gcc-cross-canadian-aarch64-14.1.0-r0 do_package_qa: Fatal QA errors =
were found, failing task.
ERROR: Logfile of failure stored in: /OE/poky-master/build/tmp/work/x86_64-=
nativesdk-pokysdk-linux/gcc-cross-canadian-aarch64/14.1.0/temp/log.do_packa=
ge_qa.820539
ERROR: Task (/OE/poky-master/meta/recipes-devtools/gcc/gcc-cross-canadian_1=
4.1.bb:do_package_qa) failed with exit code '1'

--_000_SA1PR11MB582845C51666A74D1410542DCBAC2SA1PR11MB5828namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Denys,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I am aware of this issue. As stated in my commit, it is designed to improve=
 reproducibility of gcc-cross-canadian as opposed to fully fixing it.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I have another patch I was going to submit which fully fixes this package b=
y modifying the code of gcc's fixincludes program to not include full sourc=
e directory, only source file name. However, removing these files entirely =
as you suggest will also work.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Of course, it would be best to fix this in code and submit the same patch t=
o gcc upstream to fix this issue for everyone. However, this would take mor=
e time and require us to maintain another patch in openembedded-core. Not s=
ure which approach is preferred
 in OE.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Oleksandr</div>
<div id=3D"appendonsend" style=3D"color: inherit;"></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr" style=3D"color: inherit;"><span style=
=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
"><b>From:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedd=
ed-core@lists.openembedded.org&gt; on behalf of Denys
 Dmytriyenko &lt;denis@denix.org&gt;<br>
<b>Sent:</b>&nbsp;Thursday, July 18, 2024 3:21 AM<br>
<b>To:</b>&nbsp;Oleksandr Hnatiuk -X (ohnatiuk - GLOBALLOGIC INC at Cisco) =
&lt;ohnatiuk@cisco.com&gt;; Richard Purdie &lt;richard.purdie@linuxfoundati=
on.org&gt;<br>
<b>Cc:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [PATCH v2] gcc: remove paths to sysroot =
from configargs.h and checksum-options for gcc-cross-canadian</span>
<div>&nbsp;</div>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">FWIW, I'm testing =
master-next now with your patch applied and I'm also seeing<br>
the same buildpaths QA error in .../include-fixed/pthread.h<br>
<br>
ERROR: gcc-cross-canadian-aarch64-14.1.0-r0 do_package_qa: QA Issue: File /=
usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/=
aarch64-poky-linux/gcc/aarch64-poky-linux/14.1.0/include-fixed/pthread.h in=
 package gcc-cross-canadian-aarch64
 contains reference to TMPDIR [buildpaths]<br>
ERROR: gcc-cross-canadian-aarch64-14.1.0-r0 do_package_qa: Fatal QA errors =
were found, failing task.<br>
ERROR: Logfile of failure stored in: /OE/poky-master/build/tmp/work/x86_64-=
nativesdk-pokysdk-linux/gcc-cross-canadian-aarch64/14.1.0/temp/log.do_packa=
ge_qa.820539<br>
ERROR: Task (/OE/poky-master/meta/recipes-devtools/gcc/gcc-cross-canadian_1=
4.1.bb:do_package_qa) failed with exit code '1'</div>
</body>
</html>

--_000_SA1PR11MB582845C51666A74D1410542DCBAC2SA1PR11MB5828namp_--

