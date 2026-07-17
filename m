Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86418C44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:40:47 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7463.1784266844121607277
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=av0mAUEB;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=27147; q=dns/txt;
  s=iport01; t=1784266844; x=1785476444;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=qIgiJG2VexmUQyki9U4dxEjyTfCOYddgfB88DL1PeJI=;
  b=av0mAUEBQWVjr61pV4+gX7vvKRQU0YJgl6DnbUq0Cx34kz7DaLV+GkVa
   jN+ukhUYsxtfb9ws+MeZqptlwsAS2JUG85vF80oAB/v7MtdOIo1Qpb1JL
   V6iutWCCQk4DXzxfqo/uC89FqQN4HN1UZHQE6KRjD8WvOKMYLyJmo29eK
   DuKC93OvjrplyWzZx2YJn+pz0OPL0P+HQ3hLgpDslh9Pm6MwArYa7G+3M
   kx8FcFJTI/i4SWLi77RxyVYnfLJmZqAcVwwgrolwPBmZZqpTwsD+AUNgq
   IkMrxCDvZJ9xG2rD9l63WhW0bveobq+cXZJTQlXoS9KhGsQPhl5YuMem1
   w==;
X-CSE-ConnectionGUID: +TOXKlMqSIOgHsaE0A038Q==
X-CSE-MsgGUID: gQCkyGaqRJWlBKjCH34n2A==
X-IPAS-Result: =?us-ascii?q?A0AcAAByt1lq/47/Ja1aHAEBAQEBAQcBARIBAQQEAQFlg?=
 =?us-ascii?q?RcHAQELAYE8ATBTFnICgSFJA4ggA4RMX4ZYgiEDnhsUgWoPAQEBDQIuARUNB?=
 =?us-ascii?q?AEBhQUCjVICJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGT?=
 =?us-ascii?q?wEMhloBAQEBAwEROQE9AgEIEQMBAQEhDicKHQgCBAoJCBqCYYIdFkEDAQIOs?=
 =?us-ascii?q?WEBgT0CiVkaN3iBNIEBgygBPwJD234BCxQBgTgBhT6DHAEBKoE1gl2BIhgBR?=
 =?us-ascii?q?IQ4JxsbgXKBFUJ5L4FBPoEFgVwCA4EgFCseg3WCMASCInoSG4E/HjKBSn1ig?=
 =?us-ascii?q?RiLDlJyIgMmMywBVRMXCwcFgSNDAyovLSNLBS0dgSMhHRcWHlgbBwUSICpBR?=
 =?us-ascii?q?SMDTz04C0MFgVYCgghOIx8DOX+BL3VKdy1qAhAXaUEkghSBPgMLbT03FBsDB?=
 =?us-ascii?q?IE1BYxcB1sjgU9pBwF6EwErBEIJMDUdGxwXDQYWHhGSVwwbJ36OIEeDVopDl?=
 =?us-ascii?q?RcKKIN1jCGNPoIEhi4XhASNFIcDklELmH0jjWeVNIVaAgQCBAUCEAEBBoFoP?=
 =?us-ascii?q?CuBLnAVO4JnCUoZD44oBRaDYIUTySV5AgkDLwEBBwIHDgMLgWiQAIF+AQE?=
IronPort-PHdr: A9a23:uTwEOxN72fy/n5qcYbUl6nc2WUAX0o4cdiYP4ZYhzrVWfbvmo9LpP
 VfU4rNmi1qaFYnY6vcRk+PNqOigQm0P55+drWoPOIJBTR4LiMga3kQgDceJBFe9LavCZC0hF
 8MEX1hgl0w=
IronPort-Data: A9a23:CdLZO6ru5lHE7kEruDay8UNiQ1xeBmJDZBIvgKrLsJaIsI4StFCzt
 garIBmGPaqPazb1f4snb9jgpkgOvJeAz9NrSwBpqSExFC9EpePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8U035pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0qVLJlFt8
 dkBExEqYTCYjs/u6ergGtA506zPLOGzVG8ekmtrwTecCbMtRorOBv2Xo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUvrSn8/w7pX7WzRDsFuPoKMty2PS1wd2lrPqNbI5f/TXHJ0OxBbD+
 jiuE2LRDSgxN82wwCO/0E2orMzNtgOgBIRIPejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZNZottdQ9Qnoh0
 Vrhc87VOAGDeYa9EBq13ryVtji1fyMSKAc/ieUsFGPpP/GLTFkPsy/y
IronPort-HdrOrdr: A9a23:8Plqqan0gfXce7/NF7gd+BLe997pDfMliWdD5ihNYBxZY6Wkfp
 +V7ZcmPE7P6Ar5BktApTnZAtj+fZq9z/JICPoqTMmftWjdySeVxe5ZnPDfKlHbaknDH6tmpN
 tdmstFeZLN5DpB/LzHCWCDer5KrqjkgcWVbKXlvgpQpGpRGsddBnJCe36m+zpNNXB77PQCZf
 2hz/sCjQCNPV4QacO2DGQEWe/sm/3n/aiNXTc2QzQcxE2rlz2H1J7WeiL04j4uFx9fy7Yr9m
 bI1zf++riitP+DzBrd3X/47phdmtfto+EzSvBkjPJ7FhzcziKTIKhxUbyLuz445Mu17kwxrd
 XKqxA8e+xu9nL4ZAiO0FvQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6nAnoMp33M
 twriGkXttsfFH9dRbGlpz1viJR5w2JSL0Z4KguZklkIM4jgXlq3NUiFQ1uYc899WnBmfEa+a
 FVfbHhDbBtABKnRkGcmHVzy9qxWXl2NBKHTk8e/vGx6VFt7StEJ49y/r1Dop/Gn6hNEaWt64
 n/Q9dVvaALQckMYa1nAuAdBcOxF2zWWBrJdHmfOFL9Ccg8SjnwQrPMkfwIDduRCdQ15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIRGmmRzzixsxX+pA849THNffWGDzGTEprn9qrov0ZDMGeU/
 GvOIhOC/umKWf1A45G0wD3RpEXI3gDV88evMo9Rju104j2A5yvsvaefOfYJbLrHzphUmTjAm
 EbVDy2P8lE5lDDYA6PvPEQYQKbRqXSx+MFLEGBxZlg9GEkDPw4jjQo
X-Talos-CUID: 9a23:5cJLcGMi35No7O5DGxVAxG0QP9keU1rS7GzZDheRUT05cejA
X-Talos-MUID: =?us-ascii?q?9a23=3A5ubFNA7asaiGjiAnwinzDE6Sxoxn2o+tGW8EiK8?=
 =?us-ascii?q?khM2uFi5bG2zBim6eF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:40:42 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id B5E1118000221
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:40:42 +0000 (GMT)
X-CSE-ConnectionGUID: V72SbqnTQtaYZ/JaXY86KA==
X-CSE-MsgGUID: vE0zM/wRQ1CatUolCKGVEw==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208,217";a="88415023"
Received: from mail-westcentralusazon11010023.outbound.protection.outlook.com (HELO CY7PR03CU001.outbound.protection.outlook.com) ([40.93.198.23])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:40:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgD/k5oaK4hM4VeJwsv/OiJo4hn/eogBpod8TeVHfcClYl8hINr909zoDt8KObbA13BDcPwgAzt3Le4Py86UfelFNZS0GDkDZc5vKBCcfcFK2vh0Oso9zR0eotvNawbPFyX46M1Ga+xMZp0E+t8qKPRCbc/2x9dsuBFlUCeD5lGdzA+ogGqU2fxz0mMJAq81LfK0Lau138WeLDRabhsd2jbKyCe3kPbXRjGR7mMgNkRtllLcr8+zRvG9Brx3rTzMYBqG5qMKZL1otwxcliVQVK0KYChhtINVrC4cXvGAS2mU/Z6jwykHwwiEXi9WdxJJQQsoJUjotlWHHWXahrfPwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIgiJG2VexmUQyki9U4dxEjyTfCOYddgfB88DL1PeJI=;
 b=mTVWg3pjvGuF64+s/1oQkBUxSIlSpJqahJSvXmWbQ3Nuo1ugoQkC5tJkEHf+HpXacpdHT48JJ5pMFZDLmN2B1jt+14MYWxMNYDzdITFnok3Mc1eCwFU6enUwKLnym03BfldsuEID69xI5DQyUaErc/8kUd3T+x2XCzh9lQ3NNDxD91Jy6u/U7VYyA/OdWoXJnCSmdE4BxZG6X+NbJJPiKKLOVfYkeCQ3RnHKIrc/pARADMWPrYpDkon/i3siUxPBCvjQFQHw6XMYLzBYKamHltbdIR2VdRGSJkNYt2MlpQ0zapYMYa8oE3XECdAtOTtu0Wehl+e0eCel1WyqnroH1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19)
 by MN2PR11MB4744.namprd11.prod.outlook.com (2603:10b6:208:263::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:40:40 +0000
Received: from PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37]) by PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37%4]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 05:40:40 +0000
From: "Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at
 Cisco)" <asparmar@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wrynose][PATCH v2 5/6] rsync: Fix CVE-2026-43617
Thread-Topic: [wrynose][PATCH v2 5/6] rsync: Fix CVE-2026-43617
Thread-Index: AQHdFawTZKU7JqWCo0m0bkLxJSyP/LZxMjt0
Date: Fri, 17 Jul 2026 05:40:40 +0000
Message-ID: 
 <PH0PR11MB59023E69BE443516978B3F84CFC62@PH0PR11MB5902.namprd11.prod.outlook.com>
References: <20260717052059.773645-1-asparmar@cisco.com>
 <20260717052059.773645-6-asparmar@cisco.com>
In-Reply-To: <20260717052059.773645-6-asparmar@cisco.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5902:EE_|MN2PR11MB4744:EE_
x-ms-office365-filtering-correlation-id: 7afbc4ad-e7e2-4be9-3fa1-08dee3c5eff1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|12006099003|16056099006|13003099007|22082099003|38070700021|18002099003|8096899003|56012099006|11063799006|10067099003|3023799007|4143699003|6133799003;
x-microsoft-antispam-message-info: 
 Cftoyk4B5/6YgwVirjAzLV2QURlgWXU67fzKdOfg+Ae73ekIqpAExgOKMOs+Py65SyeXoWQLsIw7/XbeoG3pMJk9M91AqVxu81ofLt19AGqvRa5bf4g/8GdNFIffNAlOpPPdjM+3Eg7dvyaRJuhsMcyAaMys9q42zREWMzQV5o5ezu9llLM5zMciYdlGLCjYn39pyuiyxfkXs9hlaFGNNYE9mpO5uC4Lr7+HvQtRgC1YgozUGRdZjHWHEfhazt1JA1xGplwSn495tLuZ0XsKY2Tu032ns4l/+IQuvynYjhAMT+vlw6fsL3pZCz41EeKdQ0tB9pcy4IOCkBVL9k9gszBLZdwLtZA8s9FUBNLy37hBt2M7H673j1yOs5JVYCW3Ty33YTTiRDooWWVtKbgPMssPI1TAUKMmVD1kUaeLHv+XL+0XQR4FwvU2nfb9S/HO8XPYprdh+cobN5flY9eqIzdZT3HQ7VZEqJ2KGelBVtgn0WGlQ0YWTWBgkDHSrXvI0m3xZ4bfL0zKOhHNF8Z1bds1YHaE+fM7Q+krSMaEK1BoYbEFUP/q5oOIe1uidUcJ/yMpovO1P+ID1bM4HSzreS9ih12Hvpg1cUExM2ijpiPCQdoTL5c3U8iK1s5b8ZBAgCA7iYLe+Lte3LpGv95bmBbNcZ3Q9ejtKhgR7slhFaE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(12006099003)(16056099006)(13003099007)(22082099003)(38070700021)(18002099003)(8096899003)(56012099006)(11063799006)(10067099003)(3023799007)(4143699003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?IxY4tSaO25Ku4hWBCjGOVi+MYczngdeSrG/CHwYwMdelLhWkZq/MpbpQAGJv?=
 =?us-ascii?Q?/QNusX3iNPcKmEcVMJpsveUL//xlVWfA1IR3cb+lMdQ2Gea+TU0l3Za+9L5p?=
 =?us-ascii?Q?4p+WwTTtO5XKi7RnlgYKjV6Zvh3LkuSVP+lq1GNJivOAxmhJ5ttw+oJkoUq8?=
 =?us-ascii?Q?uHl7NvMz35jJxtlpwx6pvILzDPtR6//xClCh6Uzc4HgVnT7QPN+DGOBYbMGT?=
 =?us-ascii?Q?Bk2je2SY7gZ26i6EopWLe+UcaknQodueov5WCLFHiakiT2lMJmRnNg3btGZd?=
 =?us-ascii?Q?ivqPm8mxuCgZwbVFQ3wL6XRsT0TIg9at0uqjZ43e4QjVfIRCvC5nLjZW7ac0?=
 =?us-ascii?Q?neNxIKewvyGZ6ueec2czPG5cVcDqszqQRaN91dOrSZP6a06QF9hmrwZTfFmm?=
 =?us-ascii?Q?0mCx91uLN8qoHSFyddd9SCgdgdFWI5PCUyRokOACAObBPw9wckcsm3+FmvG9?=
 =?us-ascii?Q?LaauECH8HsD84V9OU1gZ+dkmw2V08PLVqsXW6RHbQQxdhh+p+/xbsmETc/+m?=
 =?us-ascii?Q?SBnlsj4ZR0KIEPsg6onFMjZMHIXfhphQbkyQZofYRU8qO20mHpyYOeMgYxt9?=
 =?us-ascii?Q?wx3w6Lj3vNeT2tc6L8ZBItURgq2oK2So0ITI/buMxL1RJTLsXVpJB8Vv8fqy?=
 =?us-ascii?Q?nzcHrvW914bdQJbzds1/p2/MasNAandl+uvQ5GsP8hj9xF3aVREZwJam22GC?=
 =?us-ascii?Q?4+dW0KAk3l7cUqxuZytDBpVA0iGU6wGlsDISaNUtCezaVzToiQu/5N1885XH?=
 =?us-ascii?Q?ejmVbNBh8BDMbKoGufu+n1d214FeAn4TXRyG1nzWBHx0ifCaRvjItyD24HHJ?=
 =?us-ascii?Q?CdrqFJ2LW/5Psg0KOxhmNvxDSdJWFr7ww1tDwbEaGp5ZjX53q/4Y2c0GyPSY?=
 =?us-ascii?Q?+QqP3HWOjqAPonkM35evgpCVCrKk4mCZyvy8J1ykhkfX1IPZajRr0UJtd+b+?=
 =?us-ascii?Q?FGTc22xiZLC+IyNexWKbJm9mPQGpktSKLt+JOTMooWMf7kGK/qTF7JhmRTzE?=
 =?us-ascii?Q?o8y24f4qUOC8mPlmzUTtyBdLvQdY01Vav+VEPyhEnMJFZ8SF0Iuf13hwHxRA?=
 =?us-ascii?Q?ErRQ6cKOeOdVbRk14iqlC7fRefV4io6GTdLPyp14yXZhgbg89cPkOmfi9b2R?=
 =?us-ascii?Q?oNjuLweLtBz3kVk/+OEgZQ0KBagTjoaSDWFpkG2knH7V4ueQvL0yG4qaAGbA?=
 =?us-ascii?Q?hcgR4R+5uu/dlWTiPbeA9HwzbRXayTElpQy9ZQvBKfzZNybAhQHFb1Ihnxha?=
 =?us-ascii?Q?AukaufU78YppCu2STjwDI6U4r6Mij7mTGHn8Fz4kWFpYf1D7nC2Jz8YUhr+b?=
 =?us-ascii?Q?D77CJSOCKBb/y73BW0++AHhvn3jK+MEYsjg9p3LZ7WNDqS2vlawS5AYMrgJu?=
 =?us-ascii?Q?yWAn1y3XLMdqPoyTAlv6VXgSJKMjVqZ9YLMTPkm8ISoRAHLnbuVO5RjCzm5N?=
 =?us-ascii?Q?yb/HWMWHtSlAuqFs1PUEELp/b5yh7VKduv4vWF12z6PfoOppjMXCGpscjHeE?=
 =?us-ascii?Q?fsGaPlBVO6qI8WnVtRLvwmJRDjZv0A6Su9RKnFcRlCVjD1yU45ZEVlrwP07A?=
 =?us-ascii?Q?ITKX+1W0dv//Eql8FoKl3twA04r97mFBJARpzf8FwCeKjlPkmYmECDYYU4xG?=
 =?us-ascii?Q?nD32xEA7OGOeQ+2TIS5gPRa5pZCrMz2B+qReFI+ZRUzTGBEnG0wIrd0St+vG?=
 =?us-ascii?Q?KlbJmcaUJky4WBAFp9f/qUrAmr92nxMdQrJ8lp5z9l2rF8AT?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB59023E69BE443516978B3F84CFC62PH0PR11MB5902namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	CLcEddSz0e5oBeyIZRoIRCI5Mkvc57d5jrp+eh64JpQJSvLnn8VZhPgPHY1dSufDogB0I6yuXvpgw9I4t5ARBDyFot0pbeIxnhjTmB6URcNROBO01OoX+EUl58TMeDt49CjQ4gdTyHTGFZtTiUd1ZE3bYRhWRCvUwb//Q23nLntLo/Jv/BJwp9dKmrvuTaupabpwcY2WcO14Cy+FgQtTYQ6NiZwodKZpcyQ6tNPX88I+1QJdN4BPK8VJEd4DOIIO7nnYtuGwmczBvlzomDNYD84voza5D32VfOeIFyetqEpbvdmahFeiei/QVsi6MaLw9bbPCXtZ4ybr7aDqE/gjsQ==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7afbc4ad-e7e2-4be9-3fa1-08dee3c5eff1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 05:40:40.6576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zQLoVSr/9p9l1BePMqxJ9cPnNgYbHVS1U9Beavhd9rnC58NkncyZ0bH7mmbr2dF4JtigcljMKMbt9hzW7RVV7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4744
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-4.cisco.com [72.163.7.165];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241131

--_000_PH0PR11MB59023E69BE443516978B3F84CFC62PH0PR11MB5902namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Please ignore this patch series. I will send corrected patches again.

Regards,
Ashish.

________________________________
From: Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco=
) <asparmar@cisco.com>
Sent: 17 July 2026 10:50
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 <asparmar@cisco.com>
Subject: [wrynose][PATCH v2 5/6] rsync: Fix CVE-2026-43617

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v3.4.3 backport for
CVE-2026-43617. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/RsyncProject/rsync/commit/c38f20c5ffabacd0c0c483786a=
b224a36e14bf43
[2] https://github.com/RsyncProject/rsync/security/advisories/GHSA-rjfm-3w2=
m-jf4f

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../rsync/files/CVE-2026-43617.patch          | 201 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   1 +
 2 files changed, 202 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43617.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43617.patch b/meta/=
recipes-devtools/rsync/files/CVE-2026-43617.patch
new file mode 100644
index 0000000000..5b3190224e
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43617.patch
@@ -0,0 +1,201 @@
+From d811094dc63486a8b6acf23963daccc23e9dbf43 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Wed, 31 Dec 2025 13:50:35 +1100
+Subject: [PATCH] clientserver: fix hostname ACL bypass when using daemon
+ chroot
+
+On an rsync daemon configured with "daemon chroot", the reverse-DNS
+lookup of the connecting client was performed *after* the chroot
+had been entered. If the chroot did not contain the files glibc
+needs for resolution (/etc/resolv.conf, /etc/nsswitch.conf,
+/etc/hosts, NSS service modules), the lookup failed and
+client_name() returned "UNKNOWN". Hostname-based deny rules
+("hosts deny =3D *.evil.example") therefore could not match, and
+an attacker controlling their PTR record could connect from a
+hostname the administrator had intended to deny. IP-based ACLs
+were unaffected.
+
+Do the reverse DNS lookup before chroot/setuid; client_name()
+caches its result, so the post-chroot call uses the cached value
+and hostname-based ACLs work even when DNS is unavailable
+post-chroot.
+
+Adds testsuite/daemon-chroot-acl.test as end-to-end regression
+coverage. The test sets up an empty chroot directory, configures
+"hosts deny =3D <localhost-resolved-name>" with daemon chroot, and
+asserts the connection is refused with @ERROR access denied.
+Uses unshare --user --map-root-user for non-root CAP_SYS_CHROOT;
+skips cleanly on non-Linux or when user namespaces aren't
+available.
+
+Reporter: Joshua Rogers (MegaManSec).
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-43617
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/c3=
8f20c5ffabacd0c0c483786ab224a36e14bf43]
+
+Backport Changes:
+- Omitted upstream .github/workflows/macos-build.yml because the
+  Yocto recipe does not carry upstream CI workflow files. That
+  upstream hunk only adds daemon-chroot-acl to the macOS
+  RSYNC_EXPECT_SKIPPED list and has no rsync source/runtime effect.
+
+(cherry picked from commit c38f20c5ffabacd0c0c483786ab224a36e14bf43)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ clientserver.c                   |  22 ++++++
+ testsuite/daemon-chroot-acl.test | 111 +++++++++++++++++++++++++++++++
+ 2 files changed, 133 insertions(+)
+ create mode 100644 testsuite/daemon-chroot-acl.test
+
+diff --git a/clientserver.c b/clientserver.c
+index b6eba098..3333aa96 100644
+--- a/clientserver.c
++++ b/clientserver.c
+@@ -1310,6 +1310,28 @@ int start_daemon(int f_in, int f_out)
+        if (lp_proxy_protocol() && !read_proxy_protocol_header(f_in))
+                return -1;
+
++      /* Do reverse DNS lookup before chroot/setuid. The result is cached=
,
++       * so the later client_name() call will use this cached value. This
++       * ensures hostname-based ACLs work even when DNS is unavailable
++       * after chroot.
++       *
++       * "reverse lookup" can be set globally OR per-module, so we also
++       * scan each module: a deployment with "reverse lookup =3D no" in t=
he
++       * global section but "reverse lookup =3D yes" in a specific module
++       * still triggers a post-chroot lookup at access-check time
++       * (rsync_module() in this file), which would also fail in the
++       * chroot and turn hostname-based deny rules into silent bypasses. =
*/
++      {
++              int need_reverse =3D lp_reverse_lookup(-1);
++              int j, num_modules =3D lp_num_modules();
++              for (j =3D 0; !need_reverse && j < num_modules; j++) {
++                      if (lp_reverse_lookup(j))
++                              need_reverse =3D 1;
++              }
++              if (need_reverse)
++                      (void)client_name(client_addr(f_in));
++      }
++
+        p =3D lp_daemon_chroot();
+        if (*p) {
+                log_init(0); /* Make use we've initialized syslog before c=
hrooting. */
+diff --git a/testsuite/daemon-chroot-acl.test b/testsuite/daemon-chroot-ac=
l.test
+new file mode 100644
+index 00000000..9d1c1b63
+--- /dev/null
++++ b/testsuite/daemon-chroot-acl.test
+@@ -0,0 +1,111 @@
++#!/bin/sh
++
++# Copyright (C) 2026 by Andrew Tridgell
++
++# This program is distributable under the terms of the GNU GPL (see
++# COPYING).
++
++# Regression test for GHSA-rjfm-3w2m-jf4f: a hostname-based "hosts deny"
++# rule must still match when the daemon performs a 'daemon chroot' and
++# the chroot does not contain the NSS files glibc needs for reverse DNS.
++#
++# Pre-fix, reverse DNS happened *after* the daemon chroot. With an empty
++# chroot the NSS lookup failed, client_name() returned "UNKNOWN", and a
++# deny rule referring to the connecting hostname silently failed to
++# match.
++#
++# Two scenarios are exercised so we can distinguish the case the fix
++# definitely covers from the per-module path that may still be
++# vulnerable:
++#   A. global  "reverse lookup =3D yes"           (covered by b6abdb4c)
++#   B. only module "reverse lookup =3D yes"       (gap to verify)
++
++. "$suitedir/rsync.fns"
++
++case `uname -s` in
++Linux*) ;;
++*) test_skipped "test is Linux-specific (uses chroot+unshare)" ;;
++esac
++
++# We need CAP_SYS_CHROOT. Re-exec under a user namespace if not root.
++if ! chroot / /bin/true 2>/dev/null; then
++    if [ -z "$RSYNC_UNSHARED" ] && unshare --user --map-root-user true 2>=
/dev/null; then
++      echo "Re-running under unshare --user --map-root-user..."
++      RSYNC_UNSHARED=3D1 exec unshare --user --map-root-user "$SHELL_PATH=
" $RUNSHFLAGS "$0"
++    fi
++    test_skipped "need CAP_SYS_CHROOT (root or unshare --user --map-root-=
user)"
++fi
++
++# We need 127.0.0.1 to reverse-resolve to a real hostname while NSS is
++# still working (i.e. before the daemon's chroot). The daemon will
++# look that name up itself as part of its hostname-based ACL check;
++# we then deny that name and assert the connection is rejected.
++client_hostname=3D`getent hosts 127.0.0.1 2>/dev/null | awk 'NR=3D=3D1 {p=
rint $2}'`
++if [ -z "$client_hostname" ] || [ "$client_hostname" =3D "127.0.0.1" ]; t=
hen
++    test_skipped "no reverse DNS for 127.0.0.1"
++fi
++
++chrootdir=3D"$scratchdir/chroot"
++rm -rf "$chrootdir"
++mkdir -p "$chrootdir/modroot"
++echo "from chroot" > "$chrootdir/modroot/file1"
++
++conf=3D"$scratchdir/test-rsyncd.conf"
++logfile=3D"$scratchdir/rsyncd.log"
++
++write_conf() {
++    cat >"$conf" <<EOF
++use chroot =3D no
++log file =3D $logfile
++daemon chroot =3D $chrootdir
++reverse lookup =3D $1
++hosts deny =3D $client_hostname
++max verbosity =3D 4
++
++[chrootmod]
++    path =3D /modroot
++    read only =3D yes
++    reverse lookup =3D $2
++EOF
++}
++
++# Run a transfer and return 0 if the daemon refused with @ERROR access
++# denied (the expected outcome when the deny rule matches).
++run_check() {
++    label=3D"$1"
++
++    rm -f "$logfile"
++    rm -rf "$todir"
++    mkdir -p "$todir"
++
++    out=3D"$scratchdir/run.out"
++
++    RSYNC_CONNECT_PROG=3D"$RSYNC --config=3D$conf --daemon" \
++      $RSYNC -av localhost::chrootmod/ "$todir/" >"$out" 2>&1
++    rc=3D$?
++
++    echo "----- $label (rsync exit $rc):"
++    cat "$out"
++    echo "----- daemon log:"
++    [ -f "$logfile" ] && cat "$logfile"
++    echo "-----"
++
++    grep -q '@ERROR.*access denied' "$out"
++}
++
++# Scenario A: global reverse lookup. Covered by b6abdb4c.
++write_conf yes yes
++if ! run_check "Scenario A (global reverse lookup =3D yes)"; then
++    test_fail "Scenario A: hostname deny rule was bypassed"
++fi
++
++# Scenario B: only the per-module reverse-lookup setting is enabled.
++# The b6abdb4c fix only pre-warms client_name()'s cache when the
++# global setting is on, so the post-chroot lookup in this path may
++# still produce "UNKNOWN" and bypass the deny rule.
++write_conf no yes
++if ! run_check "Scenario B (per-module reverse lookup only)"; then
++    test_fail "Scenario B: hostname deny rule was bypassed (per-module re=
verse lookup with daemon chroot still has the bypass)"
++fi
++
++exit 0
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devt=
ools/rsync/rsync_3.4.1.bb
index 2145d4ce7e..d0d57defe8 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -28,6 +28,7 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/src/${=
BP}.tar.gz \
            file://CVE-2026-43619_p6.patch \
            file://CVE-2026-43618.patch \
            file://CVE-2026-43620.patch \
+           file://CVE-2026-43617.patch \
            "
 SRC_URI[sha256sum] =3D "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf6=
9850d65fd88c52"

--
2.35.6

--_000_PH0PR11MB59023E69BE443516978B3F84CFC62PH0PR11MB5902namp_
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
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please ignore this patch series. I will send corrected patches again.</div>
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
Ashish.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ashishkumar Parmar X =
(asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt;asparmar@cisco.com&gt=
;<br>
<b>Sent:</b> 17 July 2026 10:50<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at=
 Cisco) &lt;asparmar@cisco.com&gt;<br>
<b>Subject:</b> [wrynose][PATCH v2 5/6] rsync: Fix CVE-2026-43617</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Ashishkumar Parmar &lt;asparmar@cisco.com&gt=
;<br>
<br>
This patch applies the upstream v3.4.3 backport for<br>
CVE-2026-43617. The upstream fix commit is referenced in [1],<br>
and the public CVE advisory is referenced in [2].<br>
<br>
[1] <a href=3D"https://github.com/RsyncProject/rsync/commit/c38f20c5ffabacd=
0c0c483786ab224a36e14bf43">
https://github.com/RsyncProject/rsync/commit/c38f20c5ffabacd0c0c483786ab224=
a36e14bf43</a><br>
[2] <a href=3D"https://github.com/RsyncProject/rsync/security/advisories/GH=
SA-rjfm-3w2m-jf4f">
https://github.com/RsyncProject/rsync/security/advisories/GHSA-rjfm-3w2m-jf=
4f</a><br>
<br>
Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
---<br>
&nbsp;.../rsync/files/CVE-2026-43617.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 201 ++++++++++++++++++<br>
&nbsp;meta/recipes-devtools/rsync/rsync_3.4.1.bb&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 1 +<br>
&nbsp;2 files changed, 202 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43617.p=
atch<br>
<br>
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43617.patch b/meta/=
recipes-devtools/rsync/files/CVE-2026-43617.patch<br>
new file mode 100644<br>
index 0000000000..5b3190224e<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43617.patch<br>
@@ -0,0 +1,201 @@<br>
+From d811094dc63486a8b6acf23963daccc23e9dbf43 Mon Sep 17 00:00:00 2001<br>
+From: Andrew Tridgell &lt;andrew@tridgell.net&gt;<br>
+Date: Wed, 31 Dec 2025 13:50:35 +1100<br>
+Subject: [PATCH] clientserver: fix hostname ACL bypass when using daemon<b=
r>
+ chroot<br>
+<br>
+On an rsync daemon configured with &quot;daemon chroot&quot;, the reverse-=
DNS<br>
+lookup of the connecting client was performed *after* the chroot<br>
+had been entered. If the chroot did not contain the files glibc<br>
+needs for resolution (/etc/resolv.conf, /etc/nsswitch.conf,<br>
+/etc/hosts, NSS service modules), the lookup failed and<br>
+client_name() returned &quot;UNKNOWN&quot;. Hostname-based deny rules<br>
+(&quot;hosts deny =3D *.evil.example&quot;) therefore could not match, and=
<br>
+an attacker controlling their PTR record could connect from a<br>
+hostname the administrator had intended to deny. IP-based ACLs<br>
+were unaffected.<br>
+<br>
+Do the reverse DNS lookup before chroot/setuid; client_name()<br>
+caches its result, so the post-chroot call uses the cached value<br>
+and hostname-based ACLs work even when DNS is unavailable<br>
+post-chroot.<br>
+<br>
+Adds testsuite/daemon-chroot-acl.test as end-to-end regression<br>
+coverage. The test sets up an empty chroot directory, configures<br>
+&quot;hosts deny =3D &lt;localhost-resolved-name&gt;&quot; with daemon chr=
oot, and<br>
+asserts the connection is refused with @ERROR access denied.<br>
+Uses unshare --user --map-root-user for non-root CAP_SYS_CHROOT;<br>
+skips cleanly on non-Linux or when user namespaces aren't<br>
+available.<br>
+<br>
+Reporter: Joshua Rogers (MegaManSec).<br>
+<br>
+Co-Authored-By: Claude Opus 4.7 (1M context) &lt;noreply@anthropic.com&gt;=
<br>
+<br>
+CVE: CVE-2026-43617<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/RsyncProject/rsyn=
c/commit/c38f20c5ffabacd0c0c483786ab224a36e14bf43">https://github.com/Rsync=
Project/rsync/commit/c38f20c5ffabacd0c0c483786ab224a36e14bf43</a>]<br>
+<br>
+Backport Changes:<br>
+- Omitted upstream .github/workflows/macos-build.yml because the<br>
+&nbsp; Yocto recipe does not carry upstream CI workflow files. That<br>
+&nbsp; upstream hunk only adds daemon-chroot-acl to the macOS<br>
+&nbsp; RSYNC_EXPECT_SKIPPED list and has no rsync source/runtime effect.<b=
r>
+<br>
+(cherry picked from commit c38f20c5ffabacd0c0c483786ab224a36e14bf43)<br>
+Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
+---<br>
+ clientserver.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 22 ++++++<br>
+ testsuite/daemon-chroot-acl.test | 111 +++++++++++++++++++++++++++++++<br=
>
+ 2 files changed, 133 insertions(+)<br>
+ create mode 100644 testsuite/daemon-chroot-acl.test<br>
+<br>
+diff --git a/clientserver.c b/clientserver.c<br>
+index b6eba098..3333aa96 100644<br>
+--- a/clientserver.c<br>
++++ b/clientserver.c<br>
+@@ -1310,6 +1310,28 @@ int start_daemon(int f_in, int f_out)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lp_proxy_protocol() &amp;&a=
mp; !read_proxy_protocol_header(f_in))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return -1;<br>
+ <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Do reverse DNS lookup before chroot/set=
uid. The result is cached,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * so the later client_name() call wi=
ll use this cached value. This<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * ensures hostname-based ACLs work e=
ven when DNS is unavailable<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * after chroot.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * &quot;reverse lookup&quot; can be =
set globally OR per-module, so we also<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * scan each module: a deployment wit=
h &quot;reverse lookup =3D no&quot; in the<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * global section but &quot;reverse l=
ookup =3D yes&quot; in a specific module<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * still triggers a post-chroot looku=
p at access-check time<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (rsync_module() in this file), whi=
ch would also fail in the<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * chroot and turn hostname-based den=
y rules into silent bypasses. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; int need_reverse =3D lp_reverse_lookup(-1);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; int j, num_modules =3D lp_num_modules();<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; for (j =3D 0; !need_reverse &amp;&amp; j &lt; num_modules; j++) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lp_reverse_lookup=
(j))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; need_reverse =3D 1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (need_reverse)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (void)client_name(cli=
ent_addr(f_in));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p =3D lp_daemon_chroot();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*p) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; log_init(0); /* Make use we've initialized syslog before c=
hrooting. */<br>
+diff --git a/testsuite/daemon-chroot-acl.test b/testsuite/daemon-chroot-ac=
l.test<br>
+new file mode 100644<br>
+index 00000000..9d1c1b63<br>
+--- /dev/null<br>
++++ b/testsuite/daemon-chroot-acl.test<br>
+@@ -0,0 +1,111 @@<br>
++#!/bin/sh<br>
++<br>
++# Copyright (C) 2026 by Andrew Tridgell<br>
++<br>
++# This program is distributable under the terms of the GNU GPL (see<br>
++# COPYING).<br>
++<br>
++# Regression test for GHSA-rjfm-3w2m-jf4f: a hostname-based &quot;hosts d=
eny&quot;<br>
++# rule must still match when the daemon performs a 'daemon chroot' and<br=
>
++# the chroot does not contain the NSS files glibc needs for reverse DNS.<=
br>
++#<br>
++# Pre-fix, reverse DNS happened *after* the daemon chroot. With an empty<=
br>
++# chroot the NSS lookup failed, client_name() returned &quot;UNKNOWN&quot=
;, and a<br>
++# deny rule referring to the connecting hostname silently failed to<br>
++# match.<br>
++#<br>
++# Two scenarios are exercised so we can distinguish the case the fix<br>
++# definitely covers from the per-module path that may still be<br>
++# vulnerable:<br>
++#&nbsp;&nbsp; A. global&nbsp; &quot;reverse lookup =3D yes&quot;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (covered by b6abdb4c)<b=
r>
++#&nbsp;&nbsp; B. only module &quot;reverse lookup =3D yes&quot;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; (gap to verify)<br>
++<br>
++. &quot;$suitedir/rsync.fns&quot;<br>
++<br>
++case `uname -s` in<br>
++Linux*) ;;<br>
++*) test_skipped &quot;test is Linux-specific (uses chroot+unshare)&quot; =
;;<br>
++esac<br>
++<br>
++# We need CAP_SYS_CHROOT. Re-exec under a user namespace if not root.<br>
++if ! chroot / /bin/true 2&gt;/dev/null; then<br>
++&nbsp;&nbsp;&nbsp; if [ -z &quot;$RSYNC_UNSHARED&quot; ] &amp;&amp; unsha=
re --user --map-root-user true 2&gt;/dev/null; then<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &quot;Re-running under unshare --user=
 --map-root-user...&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RSYNC_UNSHARED=3D1 exec unshare --user --m=
ap-root-user &quot;$SHELL_PATH&quot; $RUNSHFLAGS &quot;$0&quot;<br>
++&nbsp;&nbsp;&nbsp; fi<br>
++&nbsp;&nbsp;&nbsp; test_skipped &quot;need CAP_SYS_CHROOT (root or unshar=
e --user --map-root-user)&quot;<br>
++fi<br>
++<br>
++# We need 127.0.0.1 to reverse-resolve to a real hostname while NSS is<br=
>
++# still working (i.e. before the daemon's chroot). The daemon will<br>
++# look that name up itself as part of its hostname-based ACL check;<br>
++# we then deny that name and assert the connection is rejected.<br>
++client_hostname=3D`getent hosts 127.0.0.1 2&gt;/dev/null | awk 'NR=3D=3D1=
 {print $2}'`<br>
++if [ -z &quot;$client_hostname&quot; ] || [ &quot;$client_hostname&quot; =
=3D &quot;127.0.0.1&quot; ]; then<br>
++&nbsp;&nbsp;&nbsp; test_skipped &quot;no reverse DNS for 127.0.0.1&quot;<=
br>
++fi<br>
++<br>
++chrootdir=3D&quot;$scratchdir/chroot&quot;<br>
++rm -rf &quot;$chrootdir&quot;<br>
++mkdir -p &quot;$chrootdir/modroot&quot;<br>
++echo &quot;from chroot&quot; &gt; &quot;$chrootdir/modroot/file1&quot;<br=
>
++<br>
++conf=3D&quot;$scratchdir/test-rsyncd.conf&quot;<br>
++logfile=3D&quot;$scratchdir/rsyncd.log&quot;<br>
++<br>
++write_conf() {<br>
++&nbsp;&nbsp;&nbsp; cat &gt;&quot;$conf&quot; &lt;&lt;EOF<br>
++use chroot =3D no<br>
++log file =3D $logfile<br>
++daemon chroot =3D $chrootdir<br>
++reverse lookup =3D $1<br>
++hosts deny =3D $client_hostname<br>
++max verbosity =3D 4<br>
++<br>
++[chrootmod]<br>
++&nbsp;&nbsp;&nbsp; path =3D /modroot<br>
++&nbsp;&nbsp;&nbsp; read only =3D yes<br>
++&nbsp;&nbsp;&nbsp; reverse lookup =3D $2<br>
++EOF<br>
++}<br>
++<br>
++# Run a transfer and return 0 if the daemon refused with @ERROR access<br=
>
++# denied (the expected outcome when the deny rule matches).<br>
++run_check() {<br>
++&nbsp;&nbsp;&nbsp; label=3D&quot;$1&quot;<br>
++<br>
++&nbsp;&nbsp;&nbsp; rm -f &quot;$logfile&quot;<br>
++&nbsp;&nbsp;&nbsp; rm -rf &quot;$todir&quot;<br>
++&nbsp;&nbsp;&nbsp; mkdir -p &quot;$todir&quot;<br>
++<br>
++&nbsp;&nbsp;&nbsp; out=3D&quot;$scratchdir/run.out&quot;<br>
++<br>
++&nbsp;&nbsp;&nbsp; RSYNC_CONNECT_PROG=3D&quot;$RSYNC --config=3D$conf --d=
aemon&quot; \<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $RSYNC -av localhost::chrootmod/ &quot;$to=
dir/&quot; &gt;&quot;$out&quot; 2&gt;&amp;1<br>
++&nbsp;&nbsp;&nbsp; rc=3D$?<br>
++<br>
++&nbsp;&nbsp;&nbsp; echo &quot;----- $label (rsync exit $rc):&quot;<br>
++&nbsp;&nbsp;&nbsp; cat &quot;$out&quot;<br>
++&nbsp;&nbsp;&nbsp; echo &quot;----- daemon log:&quot;<br>
++&nbsp;&nbsp;&nbsp; [ -f &quot;$logfile&quot; ] &amp;&amp; cat &quot;$logf=
ile&quot;<br>
++&nbsp;&nbsp;&nbsp; echo &quot;-----&quot;<br>
++<br>
++&nbsp;&nbsp;&nbsp; grep -q '@ERROR.*access denied' &quot;$out&quot;<br>
++}<br>
++<br>
++# Scenario A: global reverse lookup. Covered by b6abdb4c.<br>
++write_conf yes yes<br>
++if ! run_check &quot;Scenario A (global reverse lookup =3D yes)&quot;; th=
en<br>
++&nbsp;&nbsp;&nbsp; test_fail &quot;Scenario A: hostname deny rule was byp=
assed&quot;<br>
++fi<br>
++<br>
++# Scenario B: only the per-module reverse-lookup setting is enabled.<br>
++# The b6abdb4c fix only pre-warms client_name()'s cache when the<br>
++# global setting is on, so the post-chroot lookup in this path may<br>
++# still produce &quot;UNKNOWN&quot; and bypass the deny rule.<br>
++write_conf no yes<br>
++if ! run_check &quot;Scenario B (per-module reverse lookup only)&quot;; t=
hen<br>
++&nbsp;&nbsp;&nbsp; test_fail &quot;Scenario B: hostname deny rule was byp=
assed (per-module reverse lookup with daemon chroot still has the bypass)&q=
uot;<br>
++fi<br>
++<br>
++exit 0<br>
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devt=
ools/rsync/rsync_3.4.1.bb<br>
index 2145d4ce7e..d0d57defe8 100644<br>
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb<br>
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb<br>
@@ -28,6 +28,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://download.samba=
.org/pub/${BPN}/src/${BP}.tar.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-43619_p6.patch">file://CVE-2026-43619_p6.patch</a> \<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-43618.patch">file://CVE-2026-43618.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-43620.patch">file://CVE-2026-43620.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-43617.patch">file://CVE-2026-43617.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI[sha256sum] =3D &quot;2924bcb3a1ed8b551fc101f740b9f0fe0a202b11=
5027647cf69850d65fd88c52&quot;<br>
&nbsp;<br>
-- <br>
2.35.6<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR11MB59023E69BE443516978B3F84CFC62PH0PR11MB5902namp_--

