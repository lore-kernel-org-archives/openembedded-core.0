Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CB3C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 18:04:20 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.web10.206.1739297050365721712
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 10:04:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=LaL17Hct;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11341; q=dns/txt;
  s=iport; t=1739297050; x=1740506650;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=uaqRhW3TUbnecdzS79Sj7XlnaVZM/Gsx6/Jmjj9L1DI=;
  b=LaL17HctkS+NK/he9Pac+9kmmMzwCb9XRsEpE6RV7bn/qFkxNss6voZQ
   dVf0q5Sj+mTLonVPXHfNVyk1riAX+yyPsD8msaSq1tjhlnKNBdrHdp1dY
   CkY4cVunIfDl019LE2es87ycNCToj2llpASDCrl5WY27U9NUZ0JLFOaim
   E=;
X-CSE-ConnectionGUID: nuH8xobXRKK04Od+ZweNBg==
X-CSE-MsgGUID: x33vzVfURgaqX7sAhkanbw==
X-IPAS-Result: =?us-ascii?q?A0AIAADLkKtn/5P/Ja1aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQFAJYEcAgEBAQEBCwGBQDFSB3QCgQoSSIghA4UtiHeLY?=
 =?us-ascii?q?4tchlWBJQNWDwEBAQ0CLgEGDwQBAYITgnQCiwgCJjYHDgECBAEBAQEDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQsBAQUBAQECAQcFgQ4ThXsNhloBAQEBAwERYgUMBAIBCBEEA?=
 =?us-ascii?q?QEBLiAHCh0IAgQBDQUIGoJhghwNBwMxAwGkPAGBQAKKK3iBNIEB3TsNglqBS?=
 =?us-ascii?q?AGIMB4BKoEyggaHACcbgg2BV4JoPoIfQgQBgV8FN4NXgi8Egi+BbgGCWGeWD?=
 =?us-ascii?q?YRGiU9SdSIDJjMsAVUTFwsHBYEpEDgDKjYxI4EjBTRBOQGCDWlJOgINAjWCH?=
 =?us-ascii?q?iRYgiuCIII5hEOES4JFUYJEghJ0bwMDFhODIXgchHUdQAMLbT03Bg4bBQSBN?=
 =?us-ascii?q?QWdHAcDEFsBPIQYOF4wgRMDpAWBe4xflCBxCiiDc4wYjTiBf4YtF4VapHiYf?=
 =?us-ascii?q?CKRaJZ6AgQCBAUCDwEBBoFuBDGBWXAVgyIJSRkPji0WiGvAd3gCOgIHCwEBA?=
 =?us-ascii?q?wmSGgEB?=
IronPort-PHdr: A9a23:+04baRXO7iaaCVy1x+xzMxu/hYjV8K3PAWYlg6HPw5pHdqClupP6M
 1OauLNmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QcPs=
IronPort-Data: A9a23:W6V5PaKThfmOKDOpFE+RipQlxSXFcZb7ZxGr2PjKsXjdYENS32MEn
 TQfXTyCPPrYZmP1LtwnaNmypkwOvsOBmtE1GwMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCea/kr1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVrW0
 T/Oi5eHYgL9gWctaj58B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1oEWFmLYoSytxUIjkS0
 vBbGi8ASDqM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAVbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEuojx5nYj/7DLo5m+2pmn7jaBVTqUmeouw85G27IAlZjOK8bISLIoDaLSlTtlbD/
 XzUwWrEOB4TLezA0hOF8XuqjPCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRul7fDWkfRTkHY9sj3CMreQEXO
 payt4qBLRRksaaeTjSW8bL8kN94EXF9wbMqDcPccTY43g==
IronPort-HdrOrdr: A9a23:ut2daq6JwzmTf1FRHgPXwYiCI+orL9Y04lQ7vn2ZFiYlEfBwxv
 rPoB1E737JYW4qKQ8dcLC7VJVpQRvnhPhICPoqTMaftWjdySSVxe5ZnPHfKlHbaknDH6tmpN
 hdmstFeZPN5DpB/LvHCWCDer5KrqjkgcWVbKXlvgtQpGpRGthdBnJCe32m+zpNNXF77PQCZf
 2hz/sCjQCNPV4QacO2DGQEWe/sm/3n/aiNXTc2QzQcxE2rlz2H1J7WeiL04v4ZaVxy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBeSX4/JlagnEu0KNXsBMSreCtDc6rKWE81Axiu
 TBpB8mIoBa927RRGeouhHgsjOQkwrGqkWSi2Nws0GT5fARdwhKTPapQrgpNCcx3nBQ+e2UFp
 g7hl5x+aAnVS8o1x6Nl+QgHysa5XZc50BS0NL6SxdkINEjgHg7l/1FwKtYfa1wbh7S+cQpFv
 JjA9rb4+sTeVSGb2rBtm0q29C0WG8vdy32CHTql/blmwS+pkoJhHcw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAiiVKCi8fF66MBDiDuUKKnjNo5n47PE84/yrYoUByN83lI
 7aWF1VuGYucwblCNGI3pdM7hfRKV/NEAjF24Vb/dx0q7f8TL3kPWmKT00vidKpp7EFDsjSS5
 +ISdtr6j/YXB3T8KpyrnrDssNpWAwjueUuy6IGZ24=
X-Talos-CUID: 9a23:56OQ/W7FjW30igtN/tss8lM0StAieE3n71SIf2i0SlR2RZu/RgrF
X-Talos-MUID: 9a23:LWEihAQMWb2mUX9lRXT832p8Jvlm3p6hAVk9zo4vu8qNMyZvbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Feb 2025 18:04:09 +0000
Received: from alln-opgw-5.cisco.com (alln-opgw-5.cisco.com [173.37.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 5FB7B1800026B
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 18:04:09 +0000 (GMT)
X-CSE-ConnectionGUID: wK/RxVBPQ2e+wGe32R5dow==
X-CSE-MsgGUID: fJWskPB8TtG/SvV7vs6W5A==
Authentication-Results: alln-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.13,278,1732579200"; 
   d="scan'208,217";a="22669073"
Received: from mail-sn1nam02lp2040.outbound.protection.outlook.com (HELO NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.40])
  by alln-opgw-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 18:04:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oj1W+7GOqiKPhioO515PjnCyIhUuubnmOHLU5ftYfCZDu6QmnVRgRhxmPKQm/3T5P1mrsmUqHHE3bxySOB6l6KKfwvReZUCcLJd1A4Fyr6++HlL8/qqSwnT1DLMJxcO+WdX8dz16OGW2gzkJuvogL9tIT6qlpqzPjMTbylUGj6+d0YFDheGt90xw+rKeU/WZxR2JvJlue6+B+afuIwOZpSVsOV41lMRnFUibN9gT33wJxHIl69LmmxXdI4lGf6aY3dhITlTSeuwhC25aH5pkoT9XqakpWGEAoIDTdT6FsRO8AjvE6FTtFFoLky9dj6lvM7Gj5nt7zyCQWrQCs2EUTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaqRhW3TUbnecdzS79Sj7XlnaVZM/Gsx6/Jmjj9L1DI=;
 b=pIk4u28XdgTtsaVFpQvQaIJwX+0pNSBiryuRp1l9IiwiRs6iYcpSkPkYjGhOdzUNL/jVT+nwBCiN7ccnxDtSWVymBDNW/5LfH75evhoSURi9YEnqroCFWIwYZ+hKVGZi79BQ/jEFVZkQov/uRt0KlTzkYgsjVke7P0tM6TGjOpjqQv+F3xW8u4hIzB/WmQtVMXr41gW3le13KVVDY3jfjAzBvEHpV3mOfgbvUKE0l/vc/HwQ7YgU1iWAP/PAzpjQKiNX60L65JTwgnAPJM4FLvIO8v5JNuJe5y1Z8ErrLA7v/2vgIOj/PxefMiuKVPvOege1MkNhuiKh+1bxp2NNiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5)
 by CO1PR11MB4866.namprd11.prod.outlook.com (2603:10b6:303:91::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Tue, 11 Feb
 2025 18:04:07 +0000
Received: from PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::3a7a:496b:1b5a:362b]) by PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::3a7a:496b:1b5a:362b%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 18:04:07 +0000
From: "Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)"
	<oobitots@cisco.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
CC: Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Ruslan Bilovol (rbilovol)"
	<rbilovol@cisco.com>
Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate
 subpackage
Thread-Topic: [OE-core] [PATCH] systemd: move systemctl utility to separate
 subpackage
Thread-Index: 
 AQHbeKZRchNZZrPMpUmlkztBmF+albNAcbkAgAABw6+AAALQAIAATwuggAAJYQCAAD7mAIABXkcF
Date: Tue, 11 Feb 2025 18:04:07 +0000
Message-ID: 
 <PH0PR11MB4902EB32CF27A37CD32A2938D7FD2@PH0PR11MB4902.namprd11.prod.outlook.com>
References: <20250206144907.1924993-1-oobitots@cisco.com>
 <E631A283-5721-4E5C-A65B-5A8CC986A600@arm.com>
 <PH0PR11MB4902635E1BEC8DB84E6D6C88D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj8rSuhpT6eoWA5eudSkKZFkqcfcSWgL6YogcX1f1qjLFQ@mail.gmail.com>
 <PH0PR11MB49027CBF82294C3F722688C0D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj_BoKLY1dgiAW72Tuc+EF6BFCSfKozN2X8ibdCGqbgifw@mail.gmail.com>
 <DB5PR02MB102130601D165773C901753C1EFF22@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: 
 <DB5PR02MB102130601D165773C901753C1EFF22@DB5PR02MB10213.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4902:EE_|CO1PR11MB4866:EE_
x-ms-office365-filtering-correlation-id: 1aa84b22-e511-4c1f-9322-08dd4ac67a74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|8096899003|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?1O/bmPFJTaN/nbfpobmIwgywrN7LvX7Yz1bSB3JwbwNx4xklEnq6VoDZdf?=
 =?iso-8859-1?Q?SM9wPmceBEznFWBLYGYKM8cLit4HvkVdJghh4e+gj/Q3XuATClygz+E8Qk?=
 =?iso-8859-1?Q?SJkPgXHWnqdP4udYEN263YFSLfjN6JzQ970xbaiQqPoJ8e3Ij+2oeuu7AU?=
 =?iso-8859-1?Q?QjmXuXWtMlBYLqqXH+XBqeJr9rl1hUVnHWzpyy0HdokyrkjdKh2jvNrLoz?=
 =?iso-8859-1?Q?0tz/fIuk5TeBvtRY585+cu5bSaVC62j9gbtGKJDVfgkBW3IRD2YPrOGcas?=
 =?iso-8859-1?Q?YeBCoPG+m08guUVt5JbAB4iX4KBEjf5pYgn/O937cwn7EW8yM7WTmY3q5B?=
 =?iso-8859-1?Q?pHgzU8Gn9/5kBMEPGwL97Wnc6KFXzNduEg6Mu25IL7RJwjVKhjDf1edL/f?=
 =?iso-8859-1?Q?mngnEWc5N/G8kgm+snEdPLVSLnK+bneZRYCPcVUzglLeGUCEiXbgdxM6ro?=
 =?iso-8859-1?Q?PkPMXDCgjEsGTlFY7MEm4f/xYPkaLKnv4rllpvbEIPzWpUjNsO/R8NPO1f?=
 =?iso-8859-1?Q?TXYSNX7+iJmQ/CLYYqlkPsotNEX6Lox95cxty80/gizNVvw3cmdBxxLsy8?=
 =?iso-8859-1?Q?VX5YM2j6JY+ynubHS17HkK3DNh68jWD571VAzvXTGVemjZ6c6WDSyDcCHK?=
 =?iso-8859-1?Q?T07vnWwmVZB0B65N4XnnMuT6sB7nlytbD5hnrWP2NA2418UQMaoFX24N+7?=
 =?iso-8859-1?Q?oFeZXLkGDtJJ4oGJSnyOT6puw8n3ddGqxZPVIDtHwx+20Hz7rfK8r7vXN7?=
 =?iso-8859-1?Q?BJUPiu1eDFzWCKAAg7u7Ap5RkiS9/XxQQJfUwNSmxc9YIphlS4Wb+S9NiU?=
 =?iso-8859-1?Q?HNmoWcP6isYmZBjz4daKVBPCkvs5gT9qCXPRjzCWRoEsPYVojUzC2hlCdi?=
 =?iso-8859-1?Q?EiiwCT8RrDuDJdqWzWFpueHDLoPBtOo0xF2F5hHZXrmfeGum3KgoU4i8Vu?=
 =?iso-8859-1?Q?e5E38vrb/k88IAv8pNjFGbGVBWxI6d4LncgdTYBu7Cgn0+lvjpl+SPElHt?=
 =?iso-8859-1?Q?QFtIJHKJHXFXefNjhjqjiU1p38ruwxKf8b2Um6lt/M4X5+KQKiGqns/G8I?=
 =?iso-8859-1?Q?NFsdWgt6RZ0RfRVQrQm/01Rt8i+XS/53RnWz6zTQ9RaNUGVlclhfu2cV0A?=
 =?iso-8859-1?Q?/Pi9z5Gz8NyKtr+bHH+WcPhK28HGPBQbHO3i6kHo+mPTw6hjpmQz8PGmGo?=
 =?iso-8859-1?Q?xYw/DVUIXThIcQT1Psz03wUYjPoRbZGWgIvWMRGKGU8X+x87H8kBR1R5x1?=
 =?iso-8859-1?Q?y1tuQj3iHo8JZ3DiWuuPvh+5Xm3lAWhoCPpdVLiQyeeTEcYSpwx00372xW?=
 =?iso-8859-1?Q?XFAedlsWdsvwwIxPwwbovAp3YkI/yncOhDwOYG3e2V3FIFJCoQURfu2kuD?=
 =?iso-8859-1?Q?YqVJjq/bKViHgAzfKXPatPhqAISiwIdtb65vS6ZVp74fENYHvFyBfHHSXh?=
 =?iso-8859-1?Q?RsGMRP9aO5CcWwjOBXUUyDFMdOgsDsBHvgqfX47tLOB7x263yNl9QxJett?=
 =?iso-8859-1?Q?FbwzIJQV/9/QDaStNBoVJt?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(8096899003)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?KYLHAxpX3aun5OL737rhXXIzJnW5pjBYiUZGivJ12tB+Tr2o36s4OeT4GB?=
 =?iso-8859-1?Q?hxMC4N5xX4XM2ruxs6AxWwyuqIh+4cQXh2lF5F5KIH++oE8o2XwLRr5GRP?=
 =?iso-8859-1?Q?i6PTaO7JhyiOp1Bjq8UgjBZbCVz1zHCVA2bBga3eWE260eao6+E8ctS6Ec?=
 =?iso-8859-1?Q?QoP1f2UYwmEh4UnymNekF1y3bbWrZsxZmKFs6OLaXZffysKX49TYv6DVFL?=
 =?iso-8859-1?Q?tEM4lP+zpComI8lcbfzNgvBv/alpkXyANOFAIRjjfsiKZi+3ilXpRS934r?=
 =?iso-8859-1?Q?kyBbUdFb9GAynJR7b/OLvWf/RKTmOdnJL5l1sCv9r6X8j6QBRS/3Q6Ympm?=
 =?iso-8859-1?Q?mogCwtjlEbGC8UJA4xEn4u7Qi1j9dwgTbL8FRxmcwDG6EvhLO/DYOf3SmY?=
 =?iso-8859-1?Q?Bs3vbPcpkQnBx94lGvtN2kl/NOBsF8uuN6G3ButXuZc1bJ4U6lN5kcx7rz?=
 =?iso-8859-1?Q?E11R7UQennACWnDe8+dRveVmwYUuegiAvlpvKPGYvtSUPmhQwXQVu2VTF+?=
 =?iso-8859-1?Q?y/TAA4SN7DUFHywqqHpzr/zDdVEB8cpHAnpRCG8FI+U86YwWjIpdUIf+OG?=
 =?iso-8859-1?Q?WVc3jrvAWt5DujkzbPeC+jyNYkaDy5uJUUsMiM0DTrjvna0zWfy+2ZfORQ?=
 =?iso-8859-1?Q?z9vr7XMBP0mM121KhTQ+D1AfY/3TUyuaTczX1TwIjxMcnP5ujDMWFz5KIb?=
 =?iso-8859-1?Q?Wn74cKozduzG5TBHubIHbNX/ryJH8MZzjtpkJCTP5G/0s4IZKncKjhq8Ia?=
 =?iso-8859-1?Q?zPV5cVdt7uVju+3x3jvqEMwVw3JcOUvY92c+1ttPr9i42gULWXK58CymaD?=
 =?iso-8859-1?Q?mm8edOvBdQwW1F/wGsDwqF3QXdiGkMyYswbTzcN3IGjj7H1hxln+nVFQ+s?=
 =?iso-8859-1?Q?Py0LIperzhSLDeHqqvAbEuDBWBIHfHNfgDVS8/nxESvKs+EqsuwkZo6rUt?=
 =?iso-8859-1?Q?i3rf8v7JF4jsldr3I+aksORrR8sZhdFq+P3caGCENa8+s6SsleuQ8TzCTn?=
 =?iso-8859-1?Q?/pT8c9sOCd5leNdWRUiePtIDnmGLMgmXHme0I9V+XRgcsvEodbpQiaAO3C?=
 =?iso-8859-1?Q?8lY35yvpWn5Kaw6dmkF84vTtwpgsOPcN+ZJ+UqS2/DXZDHPUtzc8joNU7u?=
 =?iso-8859-1?Q?Glp4EL4E3uEWUn7KEgccsvqJhC6WPttjw6dcWYM60ONu5xeEpWPdHeQHjU?=
 =?iso-8859-1?Q?DYpAjGUFAffMNAUNb9Ad+CCyw7psMzYyjsrMv9SEHkUgB3ZuQF32qXtzO/?=
 =?iso-8859-1?Q?+gaJn6EQaDNAwUlmRyfYXnogPvob79X7SiLoNO8uPLsJzY9IJK3dG/MXpV?=
 =?iso-8859-1?Q?E1iR9kEmSW23/ugEDuvyHW1W7M82kItbIkYcB+jLhrv6tcmdTrfW4pnpjC?=
 =?iso-8859-1?Q?Va6MJSaZ47yWn5za13c14mG+bk9u8YiE5+Xlx5unU1m/2uiRKT3GxxM56d?=
 =?iso-8859-1?Q?LKsg1lMCj47h8dRHdMfbIf6/rbplcIg5JkAqMEVuRguVGmL4+MYli+1yBo?=
 =?iso-8859-1?Q?DlTV5mEGFHqp4F6/wo974tZtTSzb6T3slZ6PogMpFTJpKroscD/KZALVLX?=
 =?iso-8859-1?Q?eWusSvz7EEM1SmrwTE6YEDdseNnVbZYJzNhAN96Nz7yIEKm7v7k6ZCSw6T?=
 =?iso-8859-1?Q?+H4+n36Zqqougit/8FTUom8Q8MpkR1XDGkWtzsxAjSnIUnFkmUmBOCI8y2?=
 =?iso-8859-1?Q?IuDbGUjrpVawjFmk6BfHbPoOimC8oXKeNvxWQCLV?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB4902EB32CF27A37CD32A2938D7FD2PH0PR11MB4902namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa84b22-e511-4c1f-9322-08dd4ac67a74
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 18:04:07.4747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0b6F7JvyacAv+m+ok/BXzdUzBi2EQUbcudcs4/w/aHYdG+HMEHJRD6j/iWYrBfyOuAoQBwH4yewz0rW9/n1e8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4866
X-Outbound-SMTP-Client: 173.37.147.253, alln-opgw-5.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 18:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211160

--_000_PH0PR11MB4902EB32CF27A37CD32A2938D7FD2PH0PR11MB4902namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I'm sorry, I confused you mentioned term sysroot. It's not about yocto - we=
 just use the same term because it's very similar
to how it works into yocto.
We got packages as a result of  yocto build and use these artefacts (packag=
es) on next stage to populate
software components content. For some reason we can't use the same approach=
 with hardlink to deduplicate
components content.

Regards,
Oleksiy

________________________________
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Sent: Monday, February 10, 2025 22:05
To: alex.kanavin@gmail.com <alex.kanavin@gmail.com>; Oleksiy Obitotskyy -X =
(oobitots - GLOBALLOGIC INC at Cisco) <oobitots@cisco.com>
Cc: Ross Burton <Ross.Burton@arm.com>; openembedded-core@lists.openembedded=
.org <openembedded-core@lists.openembedded.org>; Ruslan Bilovol (rbilovol) =
<rbilovol@cisco.com>
Subject: RE: [OE-core] [PATCH] systemd: move systemctl utility to separate =
subpackage

Additionally, changing the packaging does not affect what is added to
the sysroot.

//Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Alexander Kanavin via
> lists.openembedded.org
> Sent: den 10 februari 2025 18:20
> To: oobitots@cisco.com
> Cc: Ross Burton <Ross.Burton@arm.com>; openembedded-
> core@lists.openembedded.org; Ruslan Bilovol (rbilovol)
> <rbilovol@cisco.com>
> Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separat=
e
> subpackage
>
> They're not actually copied. They're hard-linked from
> sysroots-components/. This is a cheap operation and it doesn't waste
> disk space.
>
> Alex
>
> On Mon, 10 Feb 2025 at 18:05, Oleksiy Obitotskyy via
> lists.openembedded.org <oobitots=3Dcisco.com@lists.openembedded.org>
> wrote:
> >
> > Hi Alexander,
> >
> > By 'deploying whole systemd' I mean next:
> >
> > Every component copy and installs packages with libraries, utilities an=
d
> config files in component local sysroot, i.e. directory used to create
> final component image:
> >
> > libsystemd0_255.4
> > libsystemd-shared_255.4
> > systemd_255.4
> >
> > So, on disk we have duplication of files for every component that depen=
d
> on the systemctl.
> > In case of separate subpackage we have one root component depend on the
> systemd and all other components will contain only systemd-systemctl
> package content.
> >
> > Of course, I understand it's quite a specific scenario.
> >
> > Regards,
> > Oleksiy
> >
> > ________________________________
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Monday, February 10, 2025 13:03
> > To: Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)
> <oobitots@cisco.com>
> > Cc: Ross Burton <Ross.Burton@arm.com>; openembedded-
> core@lists.openembedded.org <openembedded-core@lists.openembedded.org>;
> Ruslan Bilovol (rbilovol) <rbilovol@cisco.com>
> > Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to
> separate subpackage
> >
> > On Mon, 10 Feb 2025 at 13:01, Oleksiy Obitotskyy via
> > lists.openembedded.org <oobitots=3Dcisco.com@lists.openembedded.org>
> > wrote:
> > > We have next situation:
> > > - a lot of software components that depend on packages and deploy all
> packages they depend on locally inside component.
> > > - some components directly depend on systemctl only (e.g. this binary
> used in scripts), so for every component we have to deploy whole systemd
> locally.
> > > - finally, all/some of those components will be merged in some way an=
d
> will use systemd/libsystemd, but until then it will be nice to get rid of
> such duplication.
> >
> > I'm sorry, but this does not quite make sense. You need to more
> > specifically describe what 'deploying whole systemd' means, and why is
> > that problematic.
> >
> > Alex
> >
> >
> >

--_000_PH0PR11MB4902EB32CF27A37CD32A2938D7FD2PH0PR11MB4902namp_
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
I'm sorry, I confused you mentioned term sysroot. It's not about yocto - we=
 just use the same term because it's very similar</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
to how it works into yocto.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
We got packages as a result of&nbsp; yocto build and use these artefacts (p=
ackages) on next stage to populate</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
software components content. For some reason we can't use the same approach=
 with hardlink to deduplicate</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
components content.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Oleksiy</div>
<div id=3D"appendonsend" style=3D"color: inherit;"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div dir=3D"ltr" id=3D"divRplyFwdMsg" style=3D"color: inherit;"><span style=
=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
"><b>From:</b>&nbsp;Peter Kjellerstedt &lt;peter.kjellerstedt@axis.com&gt;<=
br>
<b>Sent:</b>&nbsp;Monday, February 10, 2025 22:05<br>
<b>To:</b>&nbsp;alex.kanavin@gmail.com &lt;alex.kanavin@gmail.com&gt;; Olek=
siy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco) &lt;oobitots@cisco.=
com&gt;<br>
<b>Cc:</b>&nbsp;Ross Burton &lt;Ross.Burton@arm.com&gt;; openembedded-core@=
lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;; Ru=
slan Bilovol (rbilovol) &lt;rbilovol@cisco.com&gt;<br>
<b>Subject:</b>&nbsp;RE: [OE-core] [PATCH] systemd: move systemctl utility =
to separate subpackage</span>
<div>&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">Additionally, changing the packaging does n=
ot affect what is added to<br>
the sysroot.<br>
<br>
//Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: openembedded-core@lists.openembedded.org &lt;openembedded-<br>
&gt; core@lists.openembedded.org&gt; On Behalf Of Alexander Kanavin via<br>
&gt; lists.openembedded.org<br>
&gt; Sent: den 10 februari 2025 18:20<br>
&gt; To: oobitots@cisco.com<br>
&gt; Cc: Ross Burton &lt;Ross.Burton@arm.com&gt;; openembedded-<br>
&gt; core@lists.openembedded.org; Ruslan Bilovol (rbilovol)<br>
&gt; &lt;rbilovol@cisco.com&gt;<br>
&gt; Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to sepa=
rate<br>
&gt; subpackage<br>
&gt;<br>
&gt; They're not actually copied. They're hard-linked from<br>
&gt; sysroots-components/. This is a cheap operation and it doesn't waste<b=
r>
&gt; disk space.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Mon, 10 Feb 2025 at 18:05, Oleksiy Obitotskyy via<br>
&gt; lists.openembedded.org &lt;oobitots=3Dcisco.com@lists.openembedded.org=
&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Alexander,<br>
&gt; &gt;<br>
&gt; &gt; By 'deploying whole systemd' I mean next:<br>
&gt; &gt;<br>
&gt; &gt; Every component copy and installs packages with libraries, utilit=
ies and<br>
&gt; config files in component local sysroot, i.e. directory used to create=
<br>
&gt; final component image:<br>
&gt; &gt;<br>
&gt; &gt; libsystemd0_255.4<br>
&gt; &gt; libsystemd-shared_255.4<br>
&gt; &gt; systemd_255.4<br>
&gt; &gt;<br>
&gt; &gt; So, on disk we have duplication of files for every component that=
 depend<br>
&gt; on the systemctl.<br>
&gt; &gt; In case of separate subpackage we have one root component depend =
on the<br>
&gt; systemd and all other components will contain only systemd-systemctl<b=
r>
&gt; package content.<br>
&gt; &gt;<br>
&gt; &gt; Of course, I understand it's quite a specific scenario.<br>
&gt; &gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt; Oleksiy<br>
&gt; &gt;<br>
&gt; &gt; ________________________________<br>
&gt; &gt; From: Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
&gt; &gt; Sent: Monday, February 10, 2025 13:03<br>
&gt; &gt; To: Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)<b=
r>
&gt; &lt;oobitots@cisco.com&gt;<br>
&gt; &gt; Cc: Ross Burton &lt;Ross.Burton@arm.com&gt;; openembedded-<br>
&gt; core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.o=
rg&gt;;<br>
&gt; Ruslan Bilovol (rbilovol) &lt;rbilovol@cisco.com&gt;<br>
&gt; &gt; Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to=
<br>
&gt; separate subpackage<br>
&gt; &gt;<br>
&gt; &gt; On Mon, 10 Feb 2025 at 13:01, Oleksiy Obitotskyy via<br>
&gt; &gt; lists.openembedded.org &lt;oobitots=3Dcisco.com@lists.openembedde=
d.org&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; We have next situation:<br>
&gt; &gt; &gt; - a lot of software components that depend on packages and d=
eploy all<br>
&gt; packages they depend on locally inside component.<br>
&gt; &gt; &gt; - some components directly depend on systemctl only (e.g. th=
is binary<br>
&gt; used in scripts), so for every component we have to deploy whole syste=
md<br>
&gt; locally.<br>
&gt; &gt; &gt; - finally, all/some of those components will be merged in so=
me way and<br>
&gt; will use systemd/libsystemd, but until then it will be nice to get rid=
 of<br>
&gt; such duplication.<br>
&gt; &gt;<br>
&gt; &gt; I'm sorry, but this does not quite make sense. You need to more<b=
r>
&gt; &gt; specifically describe what 'deploying whole systemd' means, and w=
hy is<br>
&gt; &gt; that problematic.<br>
&gt; &gt;<br>
&gt; &gt; Alex<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;</div>
</body>
</html>

--_000_PH0PR11MB4902EB32CF27A37CD32A2938D7FD2PH0PR11MB4902namp_--

