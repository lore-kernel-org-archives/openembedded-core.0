Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 349ADC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 08:24:08 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2542.1787214237984936455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 01:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lbsiwPEP;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12660; q=dns/txt;
  s=iport01; t=1787214238; x=1788423838;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=cvN535sZY3ZcozbGTaMPeVBGOyoehUP6eFH3L1nJurM=;
  b=lbsiwPEPmgPMLJSOS/5TO/7HPS8RG/3xBO9bIPpod1ahMldkI2naW6pm
   E66x7fYWHxbRFFApCWgSJdzNyOHdMbg1yrglkLc1TDAJbulYiJ+hZUd4L
   c8Wb0hVqhXZ7S0/3TaVZgyLM3YF/qz4/ffkpYjr/trML7E7s4dmtynXgf
   nsFDYvdKFhpfOwtcB7MnKPp3yehWZPP+kcbFiuYBabtHLVkWF6Ynd+czs
   Oce82qrXDpBfGH8PBXuGRTluI3FTC+a0znSx0xu6ZX6R07xqQ6lj85317
   5/0qpDudCZEN3HJK4iHtB5cTq3rdyAfxCDStae1JFmMrBkPhoEchQSK8K
   Q==;
X-CSE-ConnectionGUID: V8qvQSvcTpqs2NKGPsP6Zw==
X-CSE-MsgGUID: kwPP2Dz3SuiFEcrX7a3NVw==
X-IPAS-Result: =?us-ascii?q?A0DvAgC5t4Zq/4v/Ja1agS6BK4E9MVMWcgKBIUmIIwOFK?=
 =?us-ascii?q?4ZYgiEDnhuBfg8BAQEOAS4BFQ0EAQGFBQKNawImNQgOAQIEAwIDAQEBAQEBA?=
 =?us-ascii?q?QEBAQELAQEFAQEBAgEHBYEOE4ZPAQyGWgEBAQEDAYEIAgEIEQMBAQEvJwodC?=
 =?us-ascii?q?AIEEwiCe4IdFgcDNwMBAg64LAKJSxo3eIE0gQGDaAJD3AABCxQBgTiFP4MeA?=
 =?us-ascii?q?QEqgTWCXYEjhRUnGxuBcoEVQoJpPoIfQgQBgV8eg3WCMASCInoSG4E/HoEPg?=
 =?us-ascii?q?VSBF41YUnIiAyYzLAFVExcLBwWBI0MDKi8tI0sFLR2BIyEdFxceWBsGBRIgK?=
 =?us-ascii?q?kFEIwM+OIEIQQKBdT8jGTZ8gQlegSsqYgIQF0YuFYIKAoJwgSheAgFJRQ4JF?=
 =?us-ascii?q?wttPTcUGQMEgTUFjWUHWyCCRAYBAXoTASsEHg5QgRQCHBaTCVKPF0eBNaF7C?=
 =?us-ascii?q?iiDdowhjT6IMheFW6URLphaI41nlWeFJwIEAgQFAhABAQaBagM3gVlwFYMiC?=
 =?us-ascii?q?UoZD5IjhRPHBnkCCTICBwIHDgMLk2YBAQ?=
IronPort-PHdr: A9a23:glw8zhNDD21+Q3J2LBUl6nc2WUAX0o4cdiYP4ZYhzrVWfbvmotLpP
 VfU4rNmi1qaFYnY6vcRk+PNqOigQm0P55+drWoPOIJBTR4LiMga3kQgDceJBFe9LavCZC0hF
 8MEX1hgl0w=
IronPort-Data: A9a23:hhCAka8T5S2rvk2W3LjdDrUD23+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WUWWD3SPauPYzGnf4wjbtzlphtV6sDWz9ZjHAtt/npEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYjtFs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kIbZQGw91pCl1W7
 OdCDhMiVgu72dCplefTpulE3qzPLeHxN48Z/3UlxjbDALN+G9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZOEwn1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FbYOEKoDSHJ8F9qqej
 mHZx1yjLgNBD8Ge5xeO6ELzj7TpozyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjJCRT9aY9tgv8gzLdA36
 mK0cxrSLWUHmJWeSGmW8fGfqjbaBMTfBTZqifMsJefd3+TenQ==
IronPort-HdrOrdr: A9a23:ikgf2KEgVVsxx/xypLqF4ZLXdLJyesId70hD6qkvc203TiXIra
 CTdaogtCMc0AxhJ03I+ertBEDyewKjyXcV2/hcAV7MZnichILFFvAH0WKm+UydJ8SczJ8T6U
 4DSdkFNDSYNzET5qiKgnjcLz9j+qj7zEnCv5a5854Zd3ATV0gW1XYBNu/0KDwQeCB2QbACON
 634M1BqzC8eXIRQPiaKxA+NdTrlpngrr6jRQQJKSIGxWC14A+A2frXAhKY1hARX3d1x6s+8W
 /Kqgr95q+ymfC2wB3R2gbontprcd3apedrNYipsIw4Oz/sggGnaMBKQLuZpg04p+mp9RIDjM
 TMiw1IBbUy11rhOkWO5Tf90Qjp1zgjr1X4z0WDvHflqcvlABonFst6g55DeBex0TtigDg86t
 MI44uqjesSMfryplW72zEObWAtqqOAmwtmrQfUtQ0HbWJRUs4IkWVVxjIlLH5JJlOL1GlgKp
 guMOjsoNBLbFidc3fV+kNrwNCqQzAPOy3ueDlYhiRQuAImwUyQCCAjtZYidntszuNPd7BUo+
 vDKahmj7dIU4sfar98Hv4IRY+tBnXKWg+kChPYHb3LLtBPB5v2ke++3JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTcmDxodC/BzBSHi0GW2F8LAS27Fp/rnnALb7OyyKT14j18OmvvUEG8XeH/
 K+IohfDfPvJXbnXYxJwwr9UZ9PLmR2arxehv8rH1aV5s7bIIzjseLWNP7VObr2CD4hHnjyB3
 MSNQKDUvmoLnrbLUMQrCKhL08FIHaPj66YOJKqitQu9A==
X-Talos-CUID: 9a23:ec+Npm3BdKItEkoLF6HxzrxfJJA8bETm0nzsO1ajU0BKZ4WOcQGi5/Yx
X-Talos-MUID: 9a23:KE6F4AbkakS0MeBTtCDUvGtOJpxT/qWAJUsXocoP4O+6Knkl
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 08:23:56 +0000
Received: from rcdn-opgw-5.cisco.com (rcdn-opgw-5.cisco.com [72.163.7.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id C2AF51800023A
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 08:23:56 +0000 (GMT)
X-CSE-ConnectionGUID: q1Ri1bTgRfKYTy9B2Q+ZEw==
X-CSE-MsgGUID: RWR/KZDcSyafa16ozivcrQ==
Authentication-Results: rcdn-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208,217";a="66691677"
Received: from mail-eastus2azon11011061.outbound.protection.outlook.com (HELO BN8PR05CU002.outbound.protection.outlook.com) ([52.101.57.61])
  by rcdn-opgw-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 08:23:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1sRPebXEt6GEZLYfWeyAs3AO2YN71Xj4ywGC9oDGMhPddDrHaTNP+upaO6sY7IQNUQRZCN8+scdyTEpiKu1yqxdG1wL1BgZ2i0XNfJCv+i2VWQxUFZ8DzWzlM7tXY0pnOmVPkMflAHSR1C3o2ahRzawr+LA+yjOm5f4VmklxrKdC6wLFgjKECkbktKg8F42dyysUrUhZ+xmAGTCOoo75cNWThCymHQ7UZBDTJWsVgDvfvdCBKQhObaGqh/GxgY5EL51/uESLOp+YFPs1Dj7ALkYGm7jGmZrTCB8JY1uioA9bkM5lP7qtBpoYmKgtBZXsbBT1/mtY8XHxvRc5aDlQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvN535sZY3ZcozbGTaMPeVBGOyoehUP6eFH3L1nJurM=;
 b=eLR68/dt7StdB5XlNkPwQh3JVERAN30byQLVCOOOkgnOWuuQJ/XLcwDUPz81oRXDT0pNFtqEJnc1T/sSLgQ0c+Tcwj4tFiWLKPln0P7//gF/VqLog0d0QslT9UZxuZHL/gc1NKqryTybNNiY52m7F958YOMbmkP4i5F3G8flg0OZhFoGJfXww0RR/aw8E1FWz0MHrxFlSyKXlM7BmXCoOxL4wSQAM9yrJBLbYevOeI/vSmxKw/V8KonOhBWZzhQdmjUwOoms6wi4iS5NPcwdJR9TjRjnwLRjFkuLteyRpysxyZcN9hD++ZEjBqIUNleu2ynpYxMoT8rBgMonkpNCCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 CH3PR11MB7323.namprd11.prod.outlook.com (2603:10b6:610:152::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.8; Thu, 20 Aug 2026 08:23:54 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 08:23:54 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] qemu: guard RESOLVE_CACHED strace flag
Thread-Topic: [OE-core][wrynose][PATCH] qemu: guard RESOLVE_CACHED strace flag
Thread-Index: AQHdL8yJj1QcDJxnbk+GIK3HjzoxvLammruc
Date: Thu, 20 Aug 2026 08:23:54 +0000
Message-ID: 
 <DM4PR11MB618951C5E61E4EA0F2D3C8F2C4A42@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <18CD30D6FAFE69CC.2965692@lists.openembedded.org>
In-Reply-To: <18CD30D6FAFE69CC.2965692@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|CH3PR11MB7323:EE_
x-ms-office365-filtering-correlation-id: ed429f98-a531-43f5-ee58-08defe945fba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|10067099003|16056099006|6133799003|22082099003|18002099003|12006099003|11063799006|8096899003|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 TXK9vB7AZVc6IXHbjRA0c1hZSmIiqGXSAzFEMObhdhxbmgg/3VGCz10qAFwmUv2o+ge8NZhcM3uUkzqwqy1eldWnVqsqPy8z8narxRVfXCKbaKm9aCoTUPpFi5Hr39tpUmUb1lL2n9MXXb3W4pf/KUg2tkiPYgolu+64TiBfowSqkBTYtctq1dSPHTbU1hS06HVII8fx1RwGtLtC7cXKHAG5b3d8Hmd+YWxDEEW7PQffGS9AW4O9du6yQPCHhd6j6iIW3mAJ7zpz2sdf1OUVdHNBkW1dB9KGDhjolRseilxRZkeTLSGtkcwczD6A8NiCCtrKJGn0noKXjyj7Yy5bWVjdiw0HG5P3vBnQVHJ/66yAeBxWTKyRe9JsZ0BlUBdIObnpds1YHhFqvNazmHTGMGHiTrFJXYY7imyqbi3WbRNeM8swLZKiMMmQddX5vVuB9aptN7mAnvRJvpv4dtt9Z/b5CJTvdEQmZsiIFnlE/SeQQUnzKT4t4NcDCS+if7UMkH6uGCxTGoykWnRwJXv8NOPMdOx1u5NQWMiO6Iai2YzbdkqnrSGNNMmpo/95rTE4Ph/1rXg/N/sv6mCQ+lkUaYiLb3CUlYOyKXdE5G5BTvfoiS2B9dXAY4008tW4bhLaqpJuxMYg0n7jAzxKoZ9OdiB9aTOvk0UiKnU9BNg3JMw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(10067099003)(16056099006)(6133799003)(22082099003)(18002099003)(12006099003)(11063799006)(8096899003)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?1iHN3iGeZX4Rw7/ZvZ2+X+YLjrIvZoG6ZpZqRW6c0XQWAI4QGFnSDuySqx?=
 =?iso-8859-1?Q?bP7qTrH/A7f0XEPYX/hvAGnBX0iZd6Wnl6BJM1JJTi325Sv07oPBWsvGMd?=
 =?iso-8859-1?Q?0nKnuAUDB42Eyv3xPSpeKfkaTSL7fVnRBFExxC3QIYTvZtVLwT9I8WNQru?=
 =?iso-8859-1?Q?rUm/bHm8n+3Lpw8UbTsUAkkgZ/Bgrub/nUzE0IfB2GQ/EJRwvsmSwXk2TV?=
 =?iso-8859-1?Q?X0JcCqHFHtJgV7zdpVSXIN3sy4spvFWekECiEd9IZwePzVv/Mkl2QHxRMs?=
 =?iso-8859-1?Q?qf9EDn/wbJWqY0CI/LhjWRQZVFZEgD4PskSl1HNv+7B1OSmQKZPB4TE+2u?=
 =?iso-8859-1?Q?EFQNLbFWVmJm86pWBjqEYyxu2+zSzmVGmuwJxTqAD7IQbw3bHrAN4ukL5w?=
 =?iso-8859-1?Q?sbfU/FOzV8h3W3aYqrxJPuB0y/XSfAkhapL4s5hWKu3XWj3CsUEPtZfZhO?=
 =?iso-8859-1?Q?RvVTDjl1Ae785nyGtJVRvinHtYrk8ulq4KXMw1IEGTXl8vsa9I2o/WWlIb?=
 =?iso-8859-1?Q?JCdDoq8U/F5aKJfqS0LirrVsgO7d7AmY5zttL97yPNzkJz2SkDBZsNchD6?=
 =?iso-8859-1?Q?PIIbd4RWnVfzL4azvFmKHSLgNX3b8nWZqjs9CcxRvp9knWgKimF8DrEhTr?=
 =?iso-8859-1?Q?GLJokZlnbk6x3Qc2q25v1qiRoOyF39Ao8xLA8cB8UJeXkH80LJISguXnzF?=
 =?iso-8859-1?Q?+Hl4UZc507mC+DRmQURqYpSUCHYaIQoiMKija1oSL9+JS0ETv10y3LrvCJ?=
 =?iso-8859-1?Q?by1eTySLnAssX8GRHCD+UXHJr/W+MTg/sYaPYA1KLEsjA7ijEulxqNHMXU?=
 =?iso-8859-1?Q?aCxghaexGIQP/NGVPOV9amx+FipOwvuvbj+yKrK030zwomrrFp4+FjagLL?=
 =?iso-8859-1?Q?8Q/OcsVo574gepkdHYsEOVRBk0WN/UtqUDEsDa23OAyYeconeddViNSQnQ?=
 =?iso-8859-1?Q?/t0yDVtvpLxyU+p5fH9DwWjcGoN/w1aN7CUGLTUH3lpxN/apl+olDSCLgZ?=
 =?iso-8859-1?Q?FK+dXuGdNZzkSkwDhSEa/ioJAOPLrNH8PjhNTnhNdOnEsyJjjvZ89uhfZ1?=
 =?iso-8859-1?Q?YEVvZYr8Hzflmof7Ip+RuM+Fog10eJpNehB045zaG1XjrwO9PVIUz8+W2V?=
 =?iso-8859-1?Q?QZbIdpRDsipTm0/pu2y8lBeF8ZP8x5nzJmwfdQCoYtoTES6pcVQu82SDWB?=
 =?iso-8859-1?Q?JdJ8u7nEMNejxzU2s7LyEleCIE3DSqGAIWbsxzR0PYmIN9PdU+RR29H2wy?=
 =?iso-8859-1?Q?RbY5OZgREq6t8Jm58T+4SV/U+gOwYAeqtm1KXetr4JkFFfFWOBLOE3g9MY?=
 =?iso-8859-1?Q?HIjaCCHD3f+mfqEYGQ8hi7/Y/OzOjWfp9y1Hi+oVQVk8pOxYCxgV4u5TTF?=
 =?iso-8859-1?Q?QxVd32tTP4IrpptCQAfeGH3mMIabasp1jU8wuuRBWUVnQiSjNAXXN0CSEn?=
 =?iso-8859-1?Q?Px/h2hlet5of+9JzvZRPYC9VPxq3UgzfY/ofaB12tUVhm5QetPX/xrPGay?=
 =?iso-8859-1?Q?/fXsZkdorKxCPbr8HjqL7CtNKOybmxrCGQJauD8Z2rSpzU5ye4ma/Nonf+?=
 =?iso-8859-1?Q?H8jL/lp+GuWXvd2pTAUTmR12rir9rcgBaKMn/F/79D3ZWCYZJ7y1yt/sPw?=
 =?iso-8859-1?Q?Kud1IjLHcU0hPYe/SFKLZWjnGGM8VfwNnCuieVbrvbPqvnA//8Xnz+me5f?=
 =?iso-8859-1?Q?JXPYZgTnCMIVrThbtKufODcLA4zbz4OqrYxXPdiHClFz+VCHbt/yUzNUWY?=
 =?iso-8859-1?Q?7lHKEXwny8wHYXjtewY23ID/cGQL/5atz1GhUyKMHHlpI1?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB618951C5E61E4EA0F2D3C8F2C4A42DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	oXLaU1BMpYY3AuSi87VBPf3iAgjCP/6wxFzPn83u9aS9VaPR7SRcMg0quXlMtKhrXAZiYvBj9fJHL/wcQsYE/8vJAbwGRIt8soA1BKZc2l3m0r50b3PjZ9CKRKmmmI7yWZ3UULNt66Rb/Y1yF+QQS7ApDFyD5Qqwvp37yjRahC7BiiPU+WXDWFNaV5dt8fES7b2Rr+Z3Crrzyt4L4YFyawAUULcxtK82/j4k1cqY0XGAlbuMbKu1IzViqTrOuTgry+nAVwjcR+jxFdrnU92rQmNyJwfPk2XnnijnjCmG7LZ95mVe0C5Ra/VzdXkLGL2e4K+KILl/y7nwY0FRskzTUg==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed429f98-a531-43f5-ee58-08defe945fba
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 08:23:54.7513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YF8tS+e1RP2Hlf3wRMyzotcK2i6R+CfMF3mKaAV5LNwHiriztrj41+Z7C0MkCKppeSys6RuMjNBlBbZvbxkD1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7323
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-5.cisco.com [72.163.7.169];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.169, rcdn-opgw-5.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 08:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243820

--_000_DM4PR11MB618951C5E61E4EA0F2D3C8F2C4A42DM4PR11MB6189namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Team,
Kindly ignore the patch below. I noticed that it was sent with incorrect au=
thor details/sign-off. I will send a revised version with the correct autho=
r's name and Signed-off-by information.
Regards,
Deepak

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Deepak Rathore via lists.openembedded.org <deer=
atho=3Dcisco.com@lists.openembedded.org>
Sent: Wednesday, August 19, 2026 4:48 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [OE-core][wrynose][PATCH] qemu: guard RESOLVE_CACHED strace flag

From: Himanshu Jadon <hjadon@cisco.com>

qemu-native build can fail on build hosts which have an older
linux/openat2.h header. The header is new enough to enable
HAVE_OPENAT2_H, but it does not have RESOLVE_CACHED because that flag
was added later in kernel 5.12.

In that case linux-user/strace.c tries to use RESOLVE_CACHED and build
fails with:

    error: 'RESOLVE_CACHED' undeclared here

This is mainly seen with qemu-native because it is built for the host
and can pick the host kernel UAPI header. The buildtools header may have
RESOLVE_CACHED, but native build still has to be safe with older host
headers also.

Add the upstream QEMU fix which checks RESOLVE_CACHED before using it.
This does not change anything on newer hosts. On older hosts QEMU just
does not print this one strace flag because the local header does not
know about it.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...-if-RESOLVE_CACHED-flag-is-defined-b.patch | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012-linux-user-Check-i=
f-RESOLVE_CACHED-flag-is-defined-b.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index 60a5c62fe9..cc8f2ecdfa 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -41,6 +41,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.x=
z \
            file://CVE-2026-0665.patch \
            file://CVE-2025-14876_p1.patch \
            file://CVE-2025-14876_p2.patch \
+           file://0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-=
b.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qemu-=
project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI =3D "https://www.qemu.org"
diff --git a/meta/recipes-devtools/qemu/qemu/0012-linux-user-Check-if-RESOL=
VE_CACHED-flag-is-defined-b.patch b/meta/recipes-devtools/qemu/qemu/0012-li=
nux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch
new file mode 100644
index 0000000000..fc86d68e7d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0012-linux-user-Check-if-RESOLVE_CACH=
ED-flag-is-defined-b.patch
@@ -0,0 +1,38 @@
+From 09e077b87eed754cc0aac0f54d193d49f978c93f Mon Sep 17 00:00:00 2001
+From: Frank Chang <frank.chang@sifive.com>
+Date: Thu, 12 Feb 2026 17:54:49 +0800
+Subject: [PATCH] linux-user: Check if RESOLVE_CACHED flag is defined befor=
e
+ using it
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/7=
ac4bded6af90a15a9562515743a789236b062d1]
+
+openat2.h was introduced in Linux kernel 5.6. However, RESOLVE_CACHED
+flag was only added in kernel 5.12 and later. Therefore, we need to check
+if RESOLVE_CACHED flag is defined before using it.
+
+Signed-off-by: Frank Chang <frank.chang@sifive.com>
+Reviewed-by: Helge Deller <deller@gmx.de>
+Signed-off-by: Helge Deller <deller@gmx.de>
+(cherry picked from commit 7ac4bded6af90a15a9562515743a789236b062d1)
+Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
+---
+ linux-user/strace.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/linux-user/strace.c b/linux-user/strace.c
+index 758c5d32b6..a903b414fd 100644
+--- a/linux-user/strace.c
++++ b/linux-user/strace.c
+@@ -1125,7 +1125,9 @@ UNUSED static const struct flags openat2_resolve_fla=
gs[] =3D {
+     FLAG_GENERIC(RESOLVE_NO_SYMLINKS),
+     FLAG_GENERIC(RESOLVE_BENEATH),
+     FLAG_GENERIC(RESOLVE_IN_ROOT),
++#ifdef RESOLVE_CACHED
+     FLAG_GENERIC(RESOLVE_CACHED),
++#endif
+ #endif
+     FLAG_END,
+ };
+--
+2.35.6
+
--
2.35.6


--_000_DM4PR11MB618951C5E61E4EA0F2D3C8F2C4A42DM4PR11MB6189namp_
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
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Team,</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
line-height: 20px; background-color: rgb(255, 255, 255); margin: 1em 0px; f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Kindly ignore the patch below. I noticed that it was sent with incorrect au=
thor details/sign-off. I will send a revised version with the correct autho=
r's name and Signed-off-by information.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
line-height: 20px; background-color: rgb(255, 255, 255); margin: 1em 0px; f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,<br>
Deepak</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core=
@lists.openembedded.org&gt; on behalf of Deepak Rathore via lists.openembed=
ded.org &lt;deeratho=3Dcisco.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Wednesday, August 19, 2026 4:48 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [OE-core][wrynose][PATCH] qemu: guard RESOLVE_CACHED strace=
 flag</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">From: Himanshu Jadon &lt;hjadon@cisco.com&g=
t;<br>
<br>
qemu-native build can fail on build hosts which have an older<br>
linux/openat2.h header. The header is new enough to enable<br>
HAVE_OPENAT2_H, but it does not have RESOLVE_CACHED because that flag<br>
was added later in kernel 5.12.<br>
<br>
In that case linux-user/strace.c tries to use RESOLVE_CACHED and build<br>
fails with:<br>
<br>
&nbsp;&nbsp;&nbsp; error: 'RESOLVE_CACHED' undeclared here<br>
<br>
This is mainly seen with qemu-native because it is built for the host<br>
and can pick the host kernel UAPI header. The buildtools header may have<br=
>
RESOLVE_CACHED, but native build still has to be safe with older host<br>
headers also.<br>
<br>
Add the upstream QEMU fix which checks RESOLVE_CACHED before using it.<br>
This does not change anything on newer hosts. On older hosts QEMU just<br>
does not print this one strace flag because the local header does not<br>
know about it.<br>
<br>
Signed-off-by: Himanshu Jadon &lt;hjadon@cisco.com&gt;<br>
---<br>
&nbsp;meta/recipes-devtools/qemu/qemu.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&nbsp;...-if-RESOLVE_CACHED-flag-is-defined-b.patch | 38 ++++++++++++++++++=
+<br>
&nbsp;2 files changed, 39 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-devtools/qemu/qemu/0012-linux-user-Ch=
eck-if-RESOLVE_CACHED-flag-is-defined-b.patch<br>
<br>
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc<br>
index 60a5c62fe9..cc8f2ecdfa 100644<br>
--- a/meta/recipes-devtools/qemu/qemu.inc<br>
+++ b/meta/recipes-devtools/qemu/qemu.inc<br>
@@ -41,6 +41,7 @@ SRC_URI =3D &quot;https://download.qemu.org/${BPN}-${PV}.=
tar.xz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-0665.patch" id=3D"OWA73f99037-38f0-f754-c685-dcb5b12a1b=
c3" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2026-0665.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-14876_p1.patch" id=3D"OWA63e51c36-d0a2-3dee-7f11-bb47ed=
0f340f" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2025-14876_p1.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-14876_p2.patch" id=3D"OWAe8fa4c0f-72a3-4580-94f0-cbf02a=
1e8116" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2025-14876_p2.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch" id=3D=
"OWA6b99f025-4655-dd30-7d75-2b860d664c11" class=3D"OWAAutoLink" data-auth=
=3D"NotApplicable">
file://0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;# file index at download.qemu.org isn't reliable: <a href=3D"https://=
gitlab.com/qemu-project/qemu-web/-/issues/9" id=3D"OWAd01a1fb9-bbfb-756c-e1=
ae-3dee38f53ec4" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://gitlab.com/qemu-project/qemu-web/-/issues/9</a><br>
&nbsp;UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://www.qemu.org" id=3D"O=
WA440fda2c-79ad-4c54-d4d7-58ac15d11fee" class=3D"OWAAutoLink" data-auth=3D"=
NotApplicable">https://www.qemu.org</a>&quot;<br>
diff --git a/meta/recipes-devtools/qemu/qemu/0012-linux-user-Check-if-RESOL=
VE_CACHED-flag-is-defined-b.patch b/meta/recipes-devtools/qemu/qemu/0012-li=
nux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch<br>
new file mode 100644<br>
index 0000000000..fc86d68e7d<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/qemu/qemu/0012-linux-user-Check-if-RESOLVE_CACH=
ED-flag-is-defined-b.patch<br>
@@ -0,0 +1,38 @@<br>
+From 09e077b87eed754cc0aac0f54d193d49f978c93f Mon Sep 17 00:00:00 2001<br>
+From: Frank Chang &lt;frank.chang@sifive.com&gt;<br>
+Date: Thu, 12 Feb 2026 17:54:49 +0800<br>
+Subject: [PATCH] linux-user: Check if RESOLVE_CACHED flag is defined befor=
e<br>
+ using it<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.com/qemu-project/qemu=
/-/commit/7ac4bded6af90a15a9562515743a789236b062d1" id=3D"OWA383768c7-86dc-=
dca8-f2b4-086c994c1f5e" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">h=
ttps://gitlab.com/qemu-project/qemu/-/commit/7ac4bded6af90a15a9562515743a78=
9236b062d1</a>]<br>
+<br>
+openat2.h was introduced in Linux kernel 5.6. However, RESOLVE_CACHED<br>
+flag was only added in kernel 5.12 and later. Therefore, we need to check<=
br>
+if RESOLVE_CACHED flag is defined before using it.<br>
+<br>
+Signed-off-by: Frank Chang &lt;frank.chang@sifive.com&gt;<br>
+Reviewed-by: Helge Deller &lt;deller@gmx.de&gt;<br>
+Signed-off-by: Helge Deller &lt;deller@gmx.de&gt;<br>
+(cherry picked from commit 7ac4bded6af90a15a9562515743a789236b062d1)<br>
+Signed-off-by: Himanshu Jadon &lt;hjadon@cisco.com&gt;<br>
+---<br>
+ linux-user/strace.c | 2 ++<br>
+ 1 file changed, 2 insertions(+)<br>
+<br>
+diff --git a/linux-user/strace.c b/linux-user/strace.c<br>
+index 758c5d32b6..a903b414fd 100644<br>
+--- a/linux-user/strace.c<br>
++++ b/linux-user/strace.c<br>
+@@ -1125,7 +1125,9 @@ UNUSED static const struct flags openat2_resolve_fla=
gs[] =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; FLAG_GENERIC(RESOLVE_NO_SYMLINKS),<br>
+&nbsp;&nbsp;&nbsp;&nbsp; FLAG_GENERIC(RESOLVE_BENEATH),<br>
+&nbsp;&nbsp;&nbsp;&nbsp; FLAG_GENERIC(RESOLVE_IN_ROOT),<br>
++#ifdef RESOLVE_CACHED<br>
+&nbsp;&nbsp;&nbsp;&nbsp; FLAG_GENERIC(RESOLVE_CACHED),<br>
++#endif<br>
+ #endif<br>
+&nbsp;&nbsp;&nbsp;&nbsp; FLAG_END,<br>
+ };<br>
+--<br>
+2.35.6<br>
+<br>
--<br>
2.35.6<br>
<br>
</div>
</body>
</html>

--_000_DM4PR11MB618951C5E61E4EA0F2D3C8F2C4A42DM4PR11MB6189namp_--

