Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E42AC79F8C
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 05:59:56 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5349.1788933590688466508
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 22:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kX1Vv3vi;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6881; q=dns/txt;
  s=iport01; t=1788933590; x=1790143190;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=V9ibnempu2gQAUfH9VVMwRA3E7l06pZ9b8kD8HvTDIE=;
  b=kX1Vv3vi6S0xsLcgL3ZBogqAgbfaUuntoCgXlxYJ7SxX94jAin0DzrHl
   hTvxnQ66qtXCE/04XXg+xXqP+2P7DIcJT0OK/67BovpNaxv3nm3MIjf3J
   4Hq1psMhP5FTulCTb3dpJJ/KT3FWhYhTeJjCxo81VsmjtCLeORMBVABkb
   1ZSIUzv0fkTJVsJC/BNPq/FFGI+Ill9RtJbDqx1bgrbug9sE1bv3KEbTP
   G9fw1j3eDimo04H1CRmuP6bKIZ/GrlDOIQtiVXcM7V7Wru9yMDHmZAPKa
   691xErc0NPHP8AuAVvrPLvQnWs8PRdhqWRE+Ytn82VKDg/BnuiNWRKOv9
   g==;
X-CSE-ConnectionGUID: D+XZXSTeQmazyShjPJTvAQ==
X-CSE-MsgGUID: J7/KKf48Rd2w35RnwfXxnA==
X-IPAS-Result: =?us-ascii?q?A0CxAwDR9KBq/5D/Ja1aHgEBCxIMZYEgC4E9ATBTgQgCg?=
 =?us-ascii?q?RESSYgjA4UrhliCIQOeG4F0Cg8BAQENAQEuAQgaBAEBhQUCjgQCJjQJDgECB?=
 =?us-ascii?q?AMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBwBAQEBAgEBSgE9A?=
 =?us-ascii?q?gEIEQQBAQEuJwodCAIEARIIgnuCHRYaJwMBArcuAooceIE0gQGDKAHdERWBO?=
 =?us-ascii?q?IU/gwMbAQEFJUlsgl2BIxmEfCcbG4FygVeCaT6CYQWBNCuEE4IwBIIiehIbg?=
 =?us-ascii?q?jEagSWQH1JyIgMmMywBVRMXCwcFgSMQMwMqLy0jSwUtHXAMJxIPHRcRHlgbB?=
 =?us-ascii?q?gUSICpBQyMDPoEPAoFvPyMZNnqBCV6BKylhAhAXRkGCCAKCVIEjXgIBSUMOB?=
 =?us-ascii?q?0VTCSdBAwcSUyYLbT03Bg8ZAwSBNQWONQdaH4JYATAoIhN7gUQfk0ePQY5gk?=
 =?us-ascii?q?2SBMwoog3aKfIEmjT6IMheFW6USmQgjo0eFLgIEAgQFAhABAQaBaDyBWXAVg?=
 =?us-ascii?q?yIJShkPji4WHIhXxwZ5AjsCBwIHDgMLkWiBfgEB?=
IronPort-PHdr: A9a23:0uPSLxQbZqEIDeDWVLblEU85Btpso47LVj580XJvo6hFfqLm+IztI
 wmDo/5sl1TOG47c7qEMh+nXtvX4UHcbqdaasX8EeYBRTRJNl8gMngIhDcLEQU32JfLndWo7S
 exJVURu+DewNk09JQ==
IronPort-Data: A9a23:2UZk5a0WMREMNNYWdvbD5Yhwkn2cJEfYwER7XKvMYLTBsI5bp2QAm
 zFMCziHb/eCZWDxfNglbojgox8AsJWGztFlTVQ/3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g28sYzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGIAIGD70jxutOBGhc5
 McYKggvUg6qvrfjqF67YrEEasULNsLnOsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUicC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+OW3aoWOI4bRGq25mG66+
 SXl3GqlUisWbsPElACD7XyclunmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuwbRRHu7yOQnXb/bCRxQ5e8wBMRYPeTUfolTc43uQ=
IronPort-HdrOrdr: A9a23:KXDYsqP9PdOre8BcT8j255DYdb4zR+YMi2TDiHoBKiC9I/b5qy
 nxppUmPEfP+UkssREb9exoS5PwP080lKQFrbX5Uo3SJzUO1FHYSL2KqLGSvwEIeBeOudK1t5
 0QCZSWYeeYZTMV/KSKhTVQUexQveVvm5rY49s2uk0dNT2CHJsQljuRZDzrdXFedU1tP7Z8Pp
 ya4cZMujqnfloqTunTPBM4dtmGjefm0Lb9bzA7JzNP0mSzpALtxK/xEhCe0BtbaDVS3Lck/1
 HClgzy9o+jv/u4xhK07R6c031RorTc4+oGIPbJptkeKz3qhArtTp9mQae+sDc8p/zqwEo2kf
 HXyi1Qf/hb2jf0RCWYsBHt0w7v3HIF8Hn502KVhnPlvIjQWC86McxcnohUGyGpqHbI/esMkp
 6j7Vjp86a/Pimw2xgVIOK4ES2Co3DE5EbKV9Rj1kC3H7FuMIO55rZvjX+9WK1wbB4SrrpXUd
 VGPYX7+Otcd0+cYjTyu2lix8HpY1EIdy32GXTrfqeuomVrdLcT9TpD+CQS801wh64VWt1K4f
 /JPb9vk6wLRsgKbbhlDONEWsevDHfRKCi8e156DG6XXZ3vAUi946Lf8fEw/qWnaZYIxJw9lN
 DIV05Zr3c7fwbrBdeV1JNG/xjRSCHlNA6dh/129tx8oPnxVbDrOSqMRBQnlNahuewWBoneV+
 yoMJxbDvf/JS/lGJpP3Qf5R55OQENuGvE9q5I+QRaDs8jLIorluqjSd+vSPqPkFXI+Vmb2Eh
 I4LU7OzQV7nzeWs1PD8WzssinWCz7CFLpLYd3nw9Q=
X-Talos-CUID: =?us-ascii?q?9a23=3AXtGsvmhivAzuI3JVhJ10sRroNzJuXj7t/kfrH0K?=
 =?us-ascii?q?BDG97WYaVS2eyxL1Nqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AXmI2hgzWOmfB/X5o7TdQ5aTdb0SaqIbxT2Mun8l?=
 =?us-ascii?q?WgcXeKnctATGCggSnRKZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Sep 2026 05:59:49 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 8591018000228
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Sep 2026 05:59:49 +0000 (GMT)
X-CSE-ConnectionGUID: UedX2RFITwSrn1WPAo90UA==
X-CSE-MsgGUID: /hbut6LdSOSxJsJ8HmI44w==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,270,1779148800"; 
   d="scan'208,217";a="93350213"
Received: from mail-westusazon11010055.outbound.protection.outlook.com (HELO BYAPR05CU005.outbound.protection.outlook.com) ([52.101.85.55])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Sep 2026 05:59:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKlavA3t5QujeUu6/qfsw5Lgs5m9iTX5uY+eInO3T7JuVxqFd8bOSNaBnDXrCgxROEspqKJ1WQEhgQvcL86of7l08yK1MwqGYGRspOPJ3yrd6WMe+ocGiiBKXDNqhecl80dAFPLbN7fBRc8RYAw5Bxk7+Pex11GQBMnsRkFksK2rbHqoCwzV6u1JTXWagNz5A+AzvuMFrCtdFdM5c5UViJDW/ACxeZyMNr2QYL+ZSr3ZdnaYyygVlS5ZW8SPhA8geIt3IgIr9DJMv9SwVO0xDJMn2kShfqn8HawO+ITz5XZzEYLyUPp0FSzN6g+ybCMmQ67lUhYu0IAAqhqbOME/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9ibnempu2gQAUfH9VVMwRA3E7l06pZ9b8kD8HvTDIE=;
 b=tjaMm0LB87lef7ZdLcFzjtgrhDWdOwTPRbfADiXdk9WX92oetkC+W2BnWe0lwQ5INNur9Iq0n2BgL3AahnNJdkz/KRsyRKDxf7A0D6gDg+yq17KZScc60iglWI+Qt0feCQhZEtqSkTndufKUibxQ7Qc3XzwbwSKbbF+eZ7qQ7e07JGYjvlRr8xgVHtPeuIjE4+Hw6q8Ks2Oz7Fo6JToPtTDJzIUl3A+gMyhT1I053rpiayd8Gx/kBlr9XFpTCQ/V4X7pQglFQx001f86qxz5+lh3Krwb9YYsc3yYt0uvhuRn+3ef9OJ26RRPYk2l49WNmVDyGojV3IoR8qtl/XxIxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4SPRMB0074.namprd11.prod.outlook.com (2603:10b6:8:1cc::23) by
 MW4PR11MB5936.namprd11.prod.outlook.com (2603:10b6:303:16b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 05:59:45 +0000
Received: from DM4SPRMB0074.namprd11.prod.outlook.com
 ([fe80::6a69:dea7:cb45:38c7]) by DM4SPRMB0074.namprd11.prod.outlook.com
 ([fe80::6a69:dea7:cb45:38c7%5]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 05:59:45 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] cmake-native: use bundled nghttp2 with
 bundled curl
Thread-Topic: [OE-core][wrynose][PATCH] cmake-native: use bundled nghttp2 with
 bundled curl
Thread-Index: AQHdP53yjf81S6NspUOGInwbBKv3hbbFwV6G
Date: Wed, 9 Sep 2026 05:59:45 +0000
Message-ID: 
 <DM4SPRMB0074DC4B1793C496D1C03271C4B02@DM4SPRMB0074.namprd11.prod.outlook.com>
References: <20260827062638.2141533-1-deeratho@cisco.com>
 <DLA05T4FXBZA.XQMLIGWXGB2D@smile.fr>
In-Reply-To: <DLA05T4FXBZA.XQMLIGWXGB2D@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4SPRMB0074:EE_|MW4PR11MB5936:EE_
x-ms-office365-filtering-correlation-id: a7c14241-7839-4a99-e58a-08df0e378c58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|10070799003|23010399003|376014|1800799024|366016|4143699003|11063799006|56012099006|38070700021|8096899003|10067099003|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 L8DFgzqTcd1uLaKgZ5FaV7KisWhD7qUBfhUQ0ht4WDeICtcLCjEoz66GVPXV9mCXefBfFetIWvqyu/fTibcIO1slh7NnejFKTeSmVmuMKu9bX8q3fzy0sUrlKPzwhb4uLHKAVBUkzjH82GP/aT3BZcV52LDO2K5AsqMq+SbwfHcYj76eoCdOsFhEApWNljzqCyHZtWZ03uYlPX2xZd1ErXc7TPGbGfAIJqEM+P/5Ax/5AzUj1aX8yUgCTQxjecB+VEK5vBIRsXsbOR8QR0HuabTrhxpIV7bjRYy1O7JSLpaoMrnattZwHxrQFSixiRKNvap0AmnWYWdmZ7ZMzd99aZIRSQtaAvkNsqwz5jZLMi4PPixCHkZZO41iE6HxneLISnXWMhOtyMae54yfoJuUOfxlkhm3xUTJulVSONlWrNBTK4uL+Ch+imnrZTLow1AU1YzRBc16Ft6JnIDjcemnH2gpqSiHBLIJ3pZ3S3UXUJ7vnX32oP79NfXPphf++S3FGnp44NNLlRa5iMDoB3IJfxXESxXUBwhs/E2IpLapyKzjfKqFuDMU6YWWjwhLda5xerG9yzD4SCgwa31Zg07FuMwpNN9QkFXiuYjB55ZFHOT2yINatM//SemgnwAvu4QP2w/5pIDzLnNkHw1OgXTy6nxOCkwQ2MWRr+/dlQW0SRZer4mxFJAU6x6e2K8w0iSbx2hrfkPEni8YIOsC+3wC4Eb+It1RsWYefljEwo+ugXo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4SPRMB0074.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(38070700021)(8096899003)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?uu7HZTO2VGovAYOwIq6ij/lMJrXOe/AyW8Z3/BjgQNbKgbKXkSVZbz9DBbtf?=
 =?us-ascii?Q?kwMWwHpq6cHsceTuHGskczi0D1UjLAdAGTGpDpEzSyv7nx8/ezORX1xy5Jsz?=
 =?us-ascii?Q?/V6z8sQRC6ilDI30KWcaukF613bPGgYEjSb4SgoaGW1oAK5B9kJICRS1UMeB?=
 =?us-ascii?Q?6I3fH07R71ltVEqPIm+T24tb1gsg4Lzg3uWNc7YLIocNqyqc4d3wCf/yW59g?=
 =?us-ascii?Q?GPP1H4gTgIkjBicAf9Y2ygzMXj89UGc9ET4cxdBo3m21pAFi34YVEUJ5nTw1?=
 =?us-ascii?Q?kVTN5xI36ZxRrhUOp5uq4kBKparL0XO7VBiLZH3G9M71Wb1j2l/3X26w5uHb?=
 =?us-ascii?Q?BjdbBQdyOdNjYMWZ+5EuWCLcDitz5M56aGLndLrDy0YOlBmgqYr+fXAi34P2?=
 =?us-ascii?Q?nBcjA4XtQkvoPfF0GDCx3kj04yiRoKL9mopZT5XTFwzhkV6gWJYfRRJ44bkp?=
 =?us-ascii?Q?FIohXNbM4Qes5eiiqxrOXQM5U6Lb7tQYjWpQJBxdFNevfVpR0l8oBTAEb6Ic?=
 =?us-ascii?Q?EqI34dPLC6P7njH4VTjEHWUIOGtHlfnrCk7t+0NTLxprWFi+DpPEluRdje4G?=
 =?us-ascii?Q?B9RXE03BLED+6BaAVDkVcK75FhlPRlE7mxEk6Sy1rOEHR2roGNfFx5J2PKEu?=
 =?us-ascii?Q?F99cT5dItsYgcm6ncKGlFmXIXY9+HpWXWjdn7pNVeieZvA0tooftMa4Jw2qO?=
 =?us-ascii?Q?GAQu5DOixPCbA78bbF3UQPibynGuO6AIcroe/HYwME/vGS9rsUZUG3ndPh7+?=
 =?us-ascii?Q?bH/LfteXOy/LDtNvarX6XpEGPtfDnufKhrWYF7+4iK1iFt7WrovpzYqJsnDL?=
 =?us-ascii?Q?/atRet9dzBz/rC0+q7Bb7equhCgbzed+TFA0kgXvcwumLI+jrueYjYprt4BW?=
 =?us-ascii?Q?YiIjMXncWrMi0qJPyD5r5zABNSU69ALA0e9EjjLMjMDoyscze3sbh3lwojAr?=
 =?us-ascii?Q?a/EKRIA1rdF77Y2FNpbC46mWRPIDCXxQgwduoAchCuFZvv3uGHRE4WB1S50Q?=
 =?us-ascii?Q?8599jRkS1wILcc5vh9OU1XPozsZTpFxisioWo7dSNOAc4J/OHJNOjoV6g5UO?=
 =?us-ascii?Q?AwgkI9I+Z3u+eXlcKBPl4uiLxSOfF+jWEnvG3tf3RZQSFzMgt/xP2F8wfb/0?=
 =?us-ascii?Q?28WsOmYUhag3ATCBPf7TMakigMfbaKdArqxTXNLdZ1FaCKxKqCOVdcBXPFE7?=
 =?us-ascii?Q?NC6dJW8HSklYhlhp1e8RYrkmLdiCk717MJiUnJ/ICMdHlO7MXxdwXZ7FFCzW?=
 =?us-ascii?Q?W+jl+o3EhOypVWbTZC1g5KdAboS9l1I/xL8rfo96clhJXyOTsJDFBXWyeUwm?=
 =?us-ascii?Q?XiD8SQ0t2P6tqVD+ihivVBczs4emU+FTkWYG1feXeWOvve0qmL5tuszbA538?=
 =?us-ascii?Q?lcR3WuIO4PbFDrTkApF3uEYNyha3fr7M9PRLnfCOkLhKvWzp1ySFEYN56iU9?=
 =?us-ascii?Q?2cmtkvLht2EKMoB7dwsi8JTIM1Vu3vpjqCkbRLem2oncl/MTGlbrf7brWEvj?=
 =?us-ascii?Q?Uk2Qy6edoZ+5vAU5oHLvXOAxUIwA7yebMsoXqGNKCQDPSQERflo96fGBww28?=
 =?us-ascii?Q?s0Gc1yCz11P4g/ZhXAO97jOvn/PCOtB+Tg0y1xzX4wk0Smxud3iBm1MUrUVw?=
 =?us-ascii?Q?S/FnT5M202qo9xsPLbtt8EBs4wYEgDL+Y1W2K8X4YWOOLq+yLFMaGxKwrKyx?=
 =?us-ascii?Q?OG6JE22MTiV7sVzZMh+MWz86bLOa2X6c0uhSA7bS1iORv9YhWAz+P3QI5sPZ?=
 =?us-ascii?Q?Ufmk9SsT2T42KdZvlMcS2wbpbnFDMQFO9DHxzR0vXXaFLWGPqpwn?=
Content-Type: multipart/alternative;
	boundary="_000_DM4SPRMB0074DC4B1793C496D1C03271C4B02DM4SPRMB0074namprd_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	IsM02J+fqAgdYG+lvY829njyydskwn9n8JtS2w8J08x/13uqtQjwbUZOkkA3dhu6rKQmMfLZdS0B89/RQUU4Srd/0LBGz1ZkRT9BKJ6XyeWRb+5QRaVpwnfMjHERc6H3TqS+vbR869WTBqsMogOCckCNykYB6kpePWBgl0PY5qmeLMg31HgUwCkJGlydsNqrhmlD/76UHtB24k6OT6cDGW8sUpUXIqS78v5nyZcc2V5Dy6CZ2O18hKGPAz7nWm2XsBp0Lc1a1m4YQtAJqydc83a294FKlsUI7SMv/+H1GRadqIpa8YmTorjT/+JyPNSCPgZr4iOf16xYovl40nS9gw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4SPRMB0074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c14241-7839-4a99-e58a-08df0e378c58
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 05:59:45.0346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z5Cl5Ty8jDWTBW6h7w7XY325LStaa1/ilqIuADOgUAcrwWXrIhPS8kBp3dygjpi9jccaV6d+VMm8V4TKAM7OzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5936
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-4.cisco.com [72.163.7.165];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 05:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245403

--_000_DM4SPRMB0074DC4B1793C496D1C03271C4B02DM4SPRMB0074namprd_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for your review.

Let me check your comment and send the v2 patch.

Regards,
Deepak
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Tuesday, September 8, 2026 7:55 PM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] cmake-native: use bundled nghttp2 wi=
th bundled curl

On Thu Aug 27, 2026 at 8:26 AM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Himanshu Jadon <hjadon@cisco.com>
>
> cmake.inc enables system library lookup through
> CMAKE_USE_SYSTEM_LIBRARIES=3D1. cmake-native already keeps curl bundled,
> but it did not also disable system nghttp2 lookup. With CMake 4.4.x,
> the bundled cmcurl configure can enable nghttp2 when headers are found
> on the host. The later compile uses only the OE native sysroot, so the
> build can fail with:
>
>   fatal error: nghttp2/nghttp2.h: No such file or directory

Hello,

Wrynose is in 4.3.1, not 4.4.x. Do we still need this patch? If so, can
you add a backport note (below the "cherry picked" line) explaining why,
in a v2?

Thanks!

>
> Disable system nghttp2 lookup for cmake-native also. This keeps it
> consistent with the existing bundled curl setting instead of adding a
> new native dependency because the host happened to expose nghttp2
> during configure.
>
> Add the bundled cmnghttp2 license checksum because the native build now
> uses that copy explicitly.
>
> Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 0b20ba549d6f17af40b9877eb9ab0c52ca62a18c)
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  meta/recipes-devtools/cmake/cmake-native_4.3.1.bb | 2 ++
>  1 file changed, 2 insertions(+)

Regards,
--
Yoann Congal
Smile ECS


--_000_DM4SPRMB0074DC4B1793C496D1C03271C4B02DM4SPRMB0074namprd_
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
Thanks for your review.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Let me check your comment and send the v2 patch.</div>
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
Deepak</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Tuesday, September 8, 2026 7:55 PM<br>
<b>To:</b> Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cis=
co) &lt;deeratho@cisco.com&gt;; openembedded-core@lists.openembedded.org &l=
t;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH] cmake-native: use bundled ngh=
ttp2 with bundled curl</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu Aug 27, 2026 at 8:26 AM CEST, Deepak Rathor=
e via lists.openembedded.org wrote:<br>
&gt; From: Himanshu Jadon &lt;hjadon@cisco.com&gt;<br>
&gt;<br>
&gt; cmake.inc enables system library lookup through<br>
&gt; CMAKE_USE_SYSTEM_LIBRARIES=3D1. cmake-native already keeps curl bundle=
d,<br>
&gt; but it did not also disable system nghttp2 lookup. With CMake 4.4.x,<b=
r>
&gt; the bundled cmcurl configure can enable nghttp2 when headers are found=
<br>
&gt; on the host. The later compile uses only the OE native sysroot, so the=
<br>
&gt; build can fail with:<br>
&gt;<br>
&gt;&nbsp;&nbsp; fatal error: nghttp2/nghttp2.h: No such file or directory<=
br>
<br>
Hello,<br>
<br>
Wrynose is in 4.3.1, not 4.4.x. Do we still need this patch? If so, can<br>
you add a backport note (below the &quot;cherry picked&quot; line) explaini=
ng why,<br>
in a v2?<br>
<br>
Thanks!<br>
<br>
&gt;<br>
&gt; Disable system nghttp2 lookup for cmake-native also. This keeps it<br>
&gt; consistent with the existing bundled curl setting instead of adding a<=
br>
&gt; new native dependency because the host happened to expose nghttp2<br>
&gt; during configure.<br>
&gt;<br>
&gt; Add the bundled cmnghttp2 license checksum because the native build no=
w<br>
&gt; uses that copy explicitly.<br>
&gt;<br>
&gt; Signed-off-by: Himanshu Jadon &lt;hjadon@cisco.com&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;richard.purdie@linuxfoundation.org&g=
t;<br>
&gt; (cherry picked from commit 0b20ba549d6f17af40b9877eb9ab0c52ca62a18c)<b=
r>
&gt; Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-devtools/cmake/cmake-native_4.3.1.bb | 2 ++<br>
&gt;&nbsp; 1 file changed, 2 insertions(+)<br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM4SPRMB0074DC4B1793C496D1C03271C4B02DM4SPRMB0074namprd_--

