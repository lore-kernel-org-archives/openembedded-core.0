Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC30C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 18:20:53 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14977.1783534845597967005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 11:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gO+Rb/30;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6617; q=dns/txt;
  s=iport01; t=1783534845; x=1784744445;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=dGhuEJuXMg7ufi4Ujy+aH4nqx3hUrey9NL9heLdBGKw=;
  b=gO+Rb/304fVoHWnnxURI6l7DHgT7dJRMKELtint5rjMZOvcFVgsJE32I
   RxRLqAqox9gBTddl9k2TkOCM5JjStnpSqpar7hNlLbwhqAwa/rPkT10Ac
   Btgc7Ej/ajO5KneLI54kae5pvl2nY9I9godT5jMKtk9fTIp4IXX5CdGGW
   n7iffIPmuRj8dyZAphKnM6ub6vcBpBxQRLYrBMQyLhJ+zFDdyycFeuzJ8
   ugxP4ney8Xlc0aqJE+m1HheDOBt2inaiKwHAV8xmHssvLKdMvM+7YhqS7
   7pcB7YP6R/guA1K9VHjIjqYjXjp+/18dlQKG0YExCdHfyhTPMkq7UUgmM
   g==;
X-CSE-ConnectionGUID: VKhZwvUWTYqntcgwy5qNAA==
X-CSE-MsgGUID: 7hDCvdftRJGtKX7kol0xlQ==
X-IPAS-Result: =?us-ascii?q?A0CEBADhk05q/5AQJK1aHgEBCxIMZYEgC4E9MVOBCAKBI?=
 =?us-ascii?q?UkDiCADhSuIfJdEhleBdAoPAQEBDQEBLgEbBwQBAYUFAo1NAiY2Bw4BAgQDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAQEBAwERZxACAQgRB?=
 =?us-ascii?q?AEBAS4nCh0IAgQBDQUIGoJhgh0WQAMBAg6vMQGBPQKKKniBNIEBg1oFCQJD3?=
 =?us-ascii?q?AoVgTiFP4MAGwEBKklsgl2BIRgBhHwnGxuBcoFXgmk+gQWBXAQBF4EdKzyDV?=
 =?us-ascii?q?4IwBIIigQyECoFhi2xSciIDJjMsAVUTFwsHBYEjEDMDKi8tI0sFLR1wDCcSD?=
 =?us-ascii?q?x0XFh5YGwcFEiAqQUUjAxxYPzgLQwWBWQKCCE4jHwM5f4EvdUp5LYEAAQIQH?=
 =?us-ascii?q?gpsQiSCFjEDC209NwYOGwMEgTUFjEoHWxcPgj6BDytPgV0GC6J9gXyhewoog?=
 =?us-ascii?q?3WMIY0+iDIXhASBV4s9mVSZCCONZ5VghS4CBAIEBQIQAQEGgW4BNYFZcBWDI?=
 =?us-ascii?q?glKGQ+XNskneQIJAy8BAQcCBw4DC4FokACBfgEB?=
IronPort-PHdr: A9a23:0pqRXRGcLEAu0EiEAO8lQJ1GfhMY04WdBeZdwpMjj7QLdbys4NG5e
 kfe/v5qylTOWNaT5/FFjr/Ourv7ESwb4JmHuWwfapEESRIfiMsXkgBhSM6IAEH2NrjrOgQxH
 d9JUxlu+HTTDA==
IronPort-Data: A9a23:/kNYoKoI3H5KOTOzWZycZsBncwFeBmJAZBIvgKrLsJaIsI4StFCzt
 garIBnQPa2NZ2P2eIh+PNi2/UxXu8PTxoVrSgpkrH0yFyhE8OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8Ew35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0thUAVNR6
 8EnFAEUaAyIiP2nnaudY8A506zPLOGzVG8eknhkyTecCbMtRorOBv2Vo9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtLYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoPVGJgFwhfE9
 woq+UymAj0xKtCR1QCn3W6PtrDMmiejSIYrQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwAiJzqyR50OSAXIJC2YeLtcnr8QxAzct0
 zdlgu/UONCmi5XMIVq1/baPpjT0Mi8QRVLurwddJefZy7EPeL0Osy8=
IronPort-HdrOrdr: A9a23:9To45KiBFZ4dMgR5lAmGLuxAFnBQX9p23DAbv31ZSRFFG/FwyP
 re/8jzhCWVtN9OYhAdcIi7Sde9qBPnmaKc4eEqTNGftXrdyRqVxeBZnMTfKlLbalfDH4JmpM
 Ndmu1FeaLN5DtB/IjHCWuDYqsdKbC8mcjC65a9vhJQpENRGt1dBmxCe3+m+zhNNXJ77O0CZe
 KhD6R81l2dUEVSRP6WQlMCWO/OrcDKkpXJXT4qbiRM1CC+yRmTxPrfCRa34jcyOgkj/Z4StU
 TVmQ3w4auu98q81gLd0GHr6ZFXksvKy9dIBsCA4/JlawkEjDzGWK1RH5m5+BwlquCm71gn1P
 PWpQ07Ash143TNOkmovBrEwWDboXUTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Z
 hMw3mSu/NsfFH9dWXGlp31viNR5w2JSEkZ4KguZrtkINIjgYpq3MgiFYVuYc899WzBmdsa+a
 JVfbHhDb5tACCnhjbizylS6e3peGgvFRGbRUVHkMmU3z9K2E1d9SIjtZYidrNqzuNgd3GCjN
 60b5iBmNx1P70rRLM4C+EbTcStDGvRBRrKLWKJOFziULoKInTXtvfMkf8IDcyRCdQ1JaEJ6d
 /8eUIdsXR3d1PlCMWI0pEO+hfRQH+lVTCozs1F/ZB2trD1WbKuaES4ORwTutrlp+9aDtzQWv
 61Np4TC/j/LXH2EYIM2wHlQZFdJXQXTcVQsNcmXFCFpN7NN+TRx6HmWeeWIKCoHScvW2v5DH
 dGVD/vJN9Y5kTuQXP8iAi5YQKlRqU+x+MHLEH3xZll9GFWDPw4juE8syXM2v22
X-Talos-CUID: 9a23:YAoOom+arf/moHLkhv2Vv3A3GvI6bEDi8EbJJVOzBnl4FaSzYHbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3Ao3D/Sg3470NCNP9HWU5D4z5IfDUjvKSCI14Bn4k?=
 =?us-ascii?q?8meaYFhwvODCZ1CSze9py?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 08 Jul 2026 18:20:44 +0000
Received: from alln-opgw-3.cisco.com (alln-opgw-3.cisco.com [173.37.147.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 80816180001DE
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 18:20:44 +0000 (GMT)
X-CSE-ConnectionGUID: 5PvnAT1pTk2kkO+JFo3HPQ==
X-CSE-MsgGUID: Epl1HUmNTfGNiA9KHumxNQ==
Authentication-Results: alln-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,153,1779148800"; 
   d="scan'208,217";a="58784550"
Received: from mail-westus3azon11011014.outbound.protection.outlook.com (HELO PH0PR06CU001.outbound.protection.outlook.com) ([40.107.208.14])
  by alln-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 08 Jul 2026 18:20:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFIzKANQzU3QUlaE5uvVUnfjqktws2gpxK5vDH+MmnX0CmbJphb5+cK7L4jeCrqwGI+esEfWfTImZx9MhfJrmaYiv1VRE/66eItmvzBBeISMEGdeS29nsuNcbE3XuB5J0RyFXIDx59O6VmAoD0mL/ibxOc+KX8T3iD0mQtQN+9PMrVawLS9I/bwLfZHcB1k+IiOmpn9/gFWhhtTJ2KnfmRDRSvAhnwMaepIR24vRKYx/NEGRKrn1DCJGUiRjdnLur3yrAYVYreVzY4Ket7lR+LW7xmCsZ41rV/+ZjpgLHigGIXZeTc/vT3bt2tSabQxq+EsUcLzmJmse76P7LimMLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGhuEJuXMg7ufi4Ujy+aH4nqx3hUrey9NL9heLdBGKw=;
 b=Q4rgLva5Rp3I6BcFdxWhThT2CEQA2byPsGXzzpAMcZos4rosJGHahi2MDl4EZvRg4277DgIZdb5i/YSwMECUxld2uzpeSW6jRTnH5Fd+wuyQ1v+yGTgcK/CpiEkfuQDVv6hCfTR3Z2rh/9ZHpeOGHBIBtNejSPvwajUrDc2BxgYpygHHS66wOXCu2Soz8r74EwIxmcZy2J8fdZxgs1vzi1ZcSI7Rr8IqnK7jV5dNqcFnDncTtUMwxc3/ZTcU7zi9AtnyLQ/gTF5QkxvfpTqJCtebe9bsCF13y9uidHTYDdiQOUgkJiSHKCrr0stvmLjM2qgZeY0pJ6bjocqDZTcMPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 PH3PPFD6B8A798D.namprd11.prod.outlook.com (2603:10b6:518:1::d51) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 18:20:41 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 18:20:41 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>, "jeremy.rosen@smile.fr"
	<jeremy.rosen@smile.fr>, "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE
 LIMITED at Cisco)" <adongare@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026-4878
Thread-Topic: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026-4878
Thread-Index: AQHc8cyWTSFqexjfWkW3t8A0nR8uKrY0xweAgCwi3YCAAnM9Cg==
Date: Wed, 8 Jul 2026 18:20:41 +0000
Message-ID: 
 <DM4PR11MB6189FF1EEAD34B988F834A8DC4FF2@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <20260601134257.47867-1-adongare@cisco.com>
 <DJ3QY884Q2R3.3DTBWW97HDVD8@smile.fr> <DJRN1II8LYOQ.1UZ61N9NS4OI8@smile.fr>
In-Reply-To: <DJRN1II8LYOQ.1UZ61N9NS4OI8@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|PH3PPFD6B8A798D:EE_
x-ms-office365-filtering-correlation-id: 0dbb7b58-f64d-444e-f5dd-08dedd1d9e45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|4143699003|11063799006|56012099006|18002099003|22082099003|8096899003|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 XgIi+HivgfVTYjn2KJJBg70gNz5zvKgpzgCDsxrM3dRbemv3Bv+chs0UBNRe/qTBnnDZBR8/Xlc4XOMcTKAqMacTbKIJl4fF24xdieNZI2nV5isv3+bzri7EuK8Maigm+jaEsMcjTnwlFP35GURJ3bMbxrTDVqcDceYGMAMhKaVfkAkxsaVnHi5VM+6dpc+mqfzzgTpzgxZgvDBH/KVwd7j965q+q2TyjkvpNAZiP2HHPoCAbBxXZpiOK/bm7lTvO+HJrGilNMhQ7l6TdiC5MUbjH6TfhHT3pKXZ+0cWxWMFxCbNdjKxPXWlutjgzYpv8dtV1ojK9SKdpbgQbS/gR9v6JO7erZWsIsFVFYqrsegvaRFCs86UOjpBbx7gCoE/pCj/oQZYErzd3qIZqzyx7ZZh6lrWKfo/hK3eFNF0FeLyCjtS5hISMMWPrG0v5GQ/QwH+9vKSuZWdPydce8mkYnd6Q73cNcc/2uHQqn1LF9JeCI3v+r14QdaRhMZrg2Z9nbUqHc0I2skdLzvcDV93fCte752uvr0nqeMnceUn6bWbqARgIDyyL8twrmICPHIpdrHuOz9ieNWAqEOVDwn8mndSDlHa9W729VCcQzpxzQZCoaaqGCNWsUREJk0xGHs+ukGRrDOjQmOGgGH552xZRXeB7hJb6N5mRbjfiXjQi1m3qKPz31i1L8A1Rfwna3XyyKQcM4h6BzvkrigjTnxT31rR9CcAhQwgtqcs9JQDmGI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(8096899003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?p4LUnAL0dTL7xkuW5i/NNN0XtDHsdETekoxybBDf3Yjkq3aTThmo8CVJKi?=
 =?iso-8859-1?Q?lzaGR+OKPurGGIXBY/RYXX2Cw+Nzd4G5F68M+22cK7f8oeGiKmrr71t3vh?=
 =?iso-8859-1?Q?LwEWPVcbiz1mO0bBbW4e6BDYiw+9SNR8xwRGZ+kKZ9mFziteu7FGawecd+?=
 =?iso-8859-1?Q?hDYSYROH4g1U8/h1HmNsq9+PLTiT/fi9jSpg/nBeoF87n6VL0BXnslNnlP?=
 =?iso-8859-1?Q?YGxREzHy5SbhtE9MSDlXzXIbHwnSw/wpdNkxSZoG9hdJ0bLw26y3tQHfjL?=
 =?iso-8859-1?Q?MxWqdwy6J80yFq2gD50tpxH0qEkc1c+JaQBkcyNa5TNo4wP6eONS1dfHxL?=
 =?iso-8859-1?Q?YKOj/Yadb5yGeVoV2SdP+A+YSFulFNn9rjeO9h9aK/Z2SvDDj+tAWNGDh5?=
 =?iso-8859-1?Q?9l4lMc+lr2NCUdwYfsOXB1N1h7bJgb9bU+d/J9F9Ql03pok+/NKLAIg5hK?=
 =?iso-8859-1?Q?EEaXdl1tHW5Qp75ItFSnyG0vGQq1giM7nywWyzsxmXHXSjOCGWeumCq9SD?=
 =?iso-8859-1?Q?IhIzsEGnRMglEL8f53DS5tZjcOlj8dVD+KZqXqTDXU31NcIv7IG79EpiqJ?=
 =?iso-8859-1?Q?Rg82ykQX9KIqbYopbFkXWWlUyJ27YoHG7Tjm7gDP4YegyIaa06EfMq7M6q?=
 =?iso-8859-1?Q?hSuhw+0szU3rwuYE4dwjzGSSXA4d9ad900wH9u3NdGDxyuiLsgLbxWi44l?=
 =?iso-8859-1?Q?75oNUI2ysfAQPMtfyWkWD/xAQifdTKI0qLVHFNcQok9UxiOZl5bGeC4JQc?=
 =?iso-8859-1?Q?JF1ESfjaFCml5gE90RKtgH7X6AfHsstIW38OnWLRFJW49WnmDgnjVK4CYs?=
 =?iso-8859-1?Q?x2fDA6qanVAHgw3Y7Wb9d0q8MxbWEeoBJgEwQm00mV9ukx0MDBX9U1pRxq?=
 =?iso-8859-1?Q?x5x8XJPvl31P6j1l7axCliG6MPgSryVsdyiUCfr3K+pJ2nEnPCZh2jznRc?=
 =?iso-8859-1?Q?Cb27x+NlTWqAffMHXm2jC4If5Qyrt22GPsZnDDvCEJJHej0DE9C+MH5QuJ?=
 =?iso-8859-1?Q?EoIBtNnRTA7iBKpq3ojlQJ5WAOiRT6guP6RN3VM/f65/UI+u8KIW8PVVar?=
 =?iso-8859-1?Q?Lp4GHRRqEUGA9jxRtGoZ0avLV6Fs0Ayn/SIb1UqdrWlZ89t3erzNyR1rPY?=
 =?iso-8859-1?Q?R61Fw4J7Pv3INldPh0XHTVevM3dwB/18naOp4h0CezMn4UpV3Y4xcatnpt?=
 =?iso-8859-1?Q?fE0tKZPiTnoR6hWp7wZFQT/8lzfLFpeiskxGSZDVTvoxzOKJF/NlvukqNw?=
 =?iso-8859-1?Q?VkObgaDnUm8TDKU5zFM/cdiDci1viqE1nh5jujuvdgwEP3mtjvMZkkJLP9?=
 =?iso-8859-1?Q?3EAXsJK9QojnrnpHObtF32KcelWaiOA/Nh+S29dFzD0FQd0JhdXtFFZ179?=
 =?iso-8859-1?Q?5Hm7kXjAm/htbrOOPUuWqQuAyTJz8TmqDo1MaNvX0kOm7IPTqjM+iZu7Ao?=
 =?iso-8859-1?Q?/KnarQmkVnethL6/2dSEqu1X8A4ZxzmmXm34CC72BAWXnM7cZzLEfFx4li?=
 =?iso-8859-1?Q?CW8rhrct3tUpPPH4li1gkfsXMYtAerYhQw/jxPd15BvnRE13uBMLXVIQ+Y?=
 =?iso-8859-1?Q?ynmGfckgi7+g0t/QcfaqTzK+2qOVXnCS8BFPp6+pRqDsAowixaTWiD+DNy?=
 =?iso-8859-1?Q?bAoDuEl8RqnKGAqa/x8cPg0hwE0HPUPn5JfN9oXyMhVvMiIqUgF9LTxnPh?=
 =?iso-8859-1?Q?3zriY03NvtXe4Fo1pXf22cF88mNYUoBBXh9Yq5QEibMquDMLeETX7o9HOw?=
 =?iso-8859-1?Q?ILJfLzKa4hKVIyDdqmF8m5hfYEp6Xj/AcBEafKpJ4AQAxE?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB6189FF1EEAD34B988F834A8DC4FF2DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	Ow8jxK/eEfxq9dj5xAa+eTosx2jD7ArfukSkt5v84Ei9uJOnkErg7GhVo5fKFRt6cDMrUdK6YZfiU2TbdTPeNO/dQWMEaeiIOiiI2UM0PMriyopi9XT8HR9KhAYM5+jaK29C1KufP1rHqkiD9fpQC1O9vYEPEGudXNlLuyKNEoVUyLWdWr0SH7At5t/o9gJkn29r6r4t9d8VReJb442fyxsF+0qHJsFs7APaXqKXVGnOFTnidjW+X27H3UEDKJjBqUV43pohJ2VaNS/TDF2aVGLZPbM6itkF9D9Ed7tZrxYvpbjYM9PWLVwfWY1chhdXh9Rfa9JF1W1oDh/oPnNl/A==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbb7b58-f64d-444e-f5dd-08dedd1d9e45
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 18:20:41.2228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xm2h5SMEaJxwTZCXf0Q/mLgWMCTrFFW7tPKHzN97lmWDnXiU9FrPOHGisvVUusv3AN+7ZvRNswdwEDsemkpp/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD6B8A798D
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-3.cisco.com [173.37.147.251];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.251, alln-opgw-3.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 18:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240505

--_000_DM4PR11MB6189FF1EEAD34B988F834A8DC4FF2DM4PR11MB6189namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Anil is on medical leave. I am working on this and will submit the patch fo=
r wrynose by tomorrow 9th July.

Thanks & Regards,
Deepak
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Monday, July 6, 2026 10:14 PM
To: jeremy.rosen@smile.fr <jeremy.rosen@smile.fr>; Anil Dongare -X (adongar=
e - E INFOCHIPS PRIVATE LIMITED at Cisco) <adongare@cisco.com>; openembedde=
d-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>; to@ci=
sco.com <to@cisco.com>
Subject: Re: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026-4878

On Mon Jun 8, 2026 at 4:44 PM CEST, J?r?my Rosen via lists.openembedded.org=
 wrote:
> Hello Anil
>
> from what I can tell, this CVE was fixed in master but not in wrynose
> please submit a patch for wrynose then ping this thread so we can apply
> to scarthgap

Hello Anil,

Gentle ping for this patch, do you plan to send the needed patch for
wrynose?

Thanks!
>
>
> thanks a lot
> Jeremy
>
>
> On Mon Jun 1, 2026 at 3:42 PM CEST, Anil Dongare -X (adongare - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>> From: Anil Dongare <adongare@cisco.com>
>>
>> Pick the upstream patch [1] as mentioned in [2].
>>
>> [1] https://git.kernel.org/pub/scm/libs/libcap/libcap.git/patch/?id=3D28=
6ace1259992bd0c5d9016715833f2e148ac596
>> [2] https://security-tracker.debian.org/tracker/CVE-2026-4878
>>
>> Signed-off-by: Anil Dongare <adongare@cisco.com>
>> ---
>>  .../libcap/files/CVE-2026-4878.patch          | 162 ++++++++++++++++++
>>  meta/recipes-support/libcap/libcap_2.69.bb    |   1 +
>>  2 files changed, 163 insertions(+)
>>  create mode 100644 meta/recipes-support/libcap/files/CVE-2026-4878.patc=
h

--
Yoann Congal

--_000_DM4PR11MB6189FF1EEAD34B988F834A8DC4FF2DM4PR11MB6189namp_
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
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Anil is on medical leave. I am working on this and will submit the patch fo=
r wrynose by tomorrow 9<sup>th</sup>&nbsp;July.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks &amp; Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Deepak</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b>&nbsp;Monday, July 6, 2026 10:14 PM<br>
<b>To:</b>&nbsp;jeremy.rosen@smile.fr &lt;jeremy.rosen@smile.fr&gt;; Anil D=
ongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt;adongare@ci=
sco.com&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core=
@lists.openembedded.org&gt;<br>
<b>Cc:</b>&nbsp;xe-linux-external (Internal Group) &lt;xe-linux-external@ci=
sco.com&gt;; to@cisco.com &lt;to@cisco.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026=
-4878</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Mon Jun 8, 2026 at 4:44 PM CEST, J?r?my =
Rosen via lists.openembedded.org wrote:<br>
&gt; Hello Anil<br>
&gt;<br>
&gt; from what I can tell, this CVE was fixed in master but not in wrynose<=
br>
&gt; please submit a patch for wrynose then ping this thread so we can appl=
y<br>
&gt; to scarthgap<br>
<br>
Hello Anil,<br>
<br>
Gentle ping for this patch, do you plan to send the needed patch for<br>
wrynose?<br>
<br>
Thanks!<br>
&gt;<br>
&gt;<br>
&gt; thanks a lot<br>
&gt; Jeremy<br>
&gt;<br>
&gt;<br>
&gt; On Mon Jun 1, 2026 at 3:42 PM CEST, Anil Dongare -X (adongare - E INFO=
CHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<br>
&gt;&gt; From: Anil Dongare &lt;adongare@cisco.com&gt;<br>
&gt;&gt;<br>
&gt;&gt; Pick the upstream patch [1] as mentioned in [2].<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://git.kernel.org/pub/scm/libs/libcap/libcap.g=
it/patch/?id=3D286ace1259992bd0c5d9016715833f2e148ac596" id=3D"OWAab15c2cb-=
d1db-d9e1-5354-e480738f58cf" class=3D"OWAAutoLink" data-auth=3D"NotApplicab=
le">
https://git.kernel.org/pub/scm/libs/libcap/libcap.git/patch/?id=3D286ace125=
9992bd0c5d9016715833f2e148ac596</a><br>
&gt;&gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-202=
6-4878" id=3D"OWA18fde1a5-1ea6-7d0a-8da4-89ea60181982" class=3D"OWAAutoLink=
" data-auth=3D"NotApplicable">
https://security-tracker.debian.org/tracker/CVE-2026-4878</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Anil Dongare &lt;adongare@cisco.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp; .../libcap/files/CVE-2026-4878.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 162 ++++++++++++++++++<br>
&gt;&gt;&nbsp; meta/recipes-support/libcap/libcap_2.69.bb&nbsp;&nbsp;&nbsp;=
 |&nbsp;&nbsp; 1 +<br>
&gt;&gt;&nbsp; 2 files changed, 163 insertions(+)<br>
&gt;&gt;&nbsp; create mode 100644 meta/recipes-support/libcap/files/CVE-202=
6-4878.patch<br>
<br>
--<br>
Yoann Congal</div>
</body>
</html>

--_000_DM4PR11MB6189FF1EEAD34B988F834A8DC4FF2DM4PR11MB6189namp_--

