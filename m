Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97E4C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 14:22:57 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.web10.16850.1739370169797062586
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 06:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=AjbyN7lz;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=22335; q=dns/txt;
  s=iport; t=1739370169; x=1740579769;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=AJmVGLBsz8Blyfd09p2um8qFxxxqoUZwJmVIjTO7bHg=;
  b=AjbyN7lzq2iyKBu53D1L1kRsct2owo7gBZEPGa91+js7pQUksHTAz0ra
   MN4/aILNHLpC50yju5ne1rE8AHRhlUYi1GsNyfyZm0tsTJX1LNd5nzNmz
   6RqDztiDFbxCk4fclHLAQjkJipsye2h8xCP2oeTFMz3lln1SdR7iaNr8q
   0=;
X-CSE-ConnectionGUID: damEd/h5Ry+9Nksyu8t62g==
X-CSE-MsgGUID: 4fWjIO9vRI+Ak0Rh89qhcw==
X-IPAS-Result: =?us-ascii?q?A0AFAACMraxn/5AQJK1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQCWBGgUBAQEBCwGBQDFSB3QCgRxIiCEDhE5fiHQDi2OSMRSBE?=
 =?us-ascii?q?QNWDwEBAQ0CLgEGDwQBAYITgnQCiwgCJjQJDgECBAEBAQEDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQsBAQUBAQECAQcFgQ4ThXsNhloBAQEBAwERYgUMBAIBCA4DBAEBAS4gB?=
 =?us-ascii?q?wodCAIEDgUIGoJhghwNBwMxAwGjFQGBQAKKK3iBNIEB3TsNglqBSAGIMB4BK?=
 =?us-ascii?q?oEyggaHACcbgg2BV4IwOD6CH0IEAYFDHAU3g1eCLwSCGBeBbgGCWGeWDoRFi?=
 =?us-ascii?q?gJSdSIDJjMsAVUTFwsHBYEpSAOBESOBIwU0QTkBgg1pSToCDQI1gh58giuCH?=
 =?us-ascii?q?oI7hEOETYVYghKBYwMDFhGDIXgchSMdQAMLbT03FBsFBIE1BZ03BwMQWwE8g?=
 =?us-ascii?q?y9sBjIaQwEwgRMDaDgCkzMgjxCienEKKINzjBiNOIF/hi0XhVqkeJh8kgqWe?=
 =?us-ascii?q?gIEAgQFAg8BAQaBZzyBWXAVgyIJSRkPji0WiGvBLngCOgIHCwEBAwmSCAEB?=
IronPort-PHdr: A9a23:3DjCxRQWQiLxi7wn7s746WJIddpso47LVj580XJvo7tKdqLm+IztI
 wmDo/5sl1TOG47c7qEMh+nXtvX4UHcbqdaasX8EeYBRTRJNl8gMngIhDcLEQU32JfLndWo7S
 exJVURu+DewNk09JQ==
IronPort-Data: A9a23:TEbVRqpluk+4ocp7YzCO9+5pIrheBmJAZBIvgKrLsJaIsI4StFCzt
 garIBnTaf+CZzDwLdkkPN/koEgEupTVzN8xSldr/C1nEShDo+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9T8kiPngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYQTNNwJcaDpOtvrZ8Uk355wehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0up+BExCs
 vxFEiFOPzaAnPOrkK7lEOY506zPLOGzVG8eknhkyTecCbMtRorOBv2Vo9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtLYH49tL/Aan3XdDpSqU6SubEf6GnIxws327/oWDbQUofTGpoNzx7H9
 woq+UylDC4YFfvO1wCksVuv3tXPzXLiWIkNQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwAiJzqyR50OSAXIJC2YeLtcnr8QxAzct0
 zdlgu/UONCmi5XMIVq1/baPpjT0Mi8QRVLurwdeJefZy7EPeL0Osy8=
IronPort-HdrOrdr: A9a23:5mzlW6lIi2LdSoVswtGTC0Y8IL/pDfNsiWdD5ihNYBxZY6Wkfp
 +V7ZcmPE7P6Ar5BktApTnZAtj/fZq9z/JICYl4B8bFYOCUghrYEGgC1/qs/9SOIVyFygcw79
 YFT0E6MqyOMbEYt7e13ODbKadc/DDvysnB7omurQYJcegpUdAd0+4TMHfjLqQCfng8OXNPLu
 vl2iMonUvGRV0nKu6AKj0uWe/Fq9fXlJTgTyInKnccgjWmvHeD0pK/NwKX8Cs/flp0rIvK91
 KrryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTFkG+TFcRccozHmApwjPCk6V4snt
 WJiQwnJd5P53TYeXzwiQfx2jPnzC0l5xbZuBylaDrY0I7ErQABeo58bLFiA1zkAo0bzZdBOZ
 dwriekXlxsfEr9dWrGloD1vlpR5zqJSDIZ4J0uZjpkIMojgHs7l/1EwKuTe61wRx4T5O0cYZ
 tTJdCZ6/BMfVyAaXfF+mFp3dy3R3w2WgyLW04Yp6WuonJrdV1CvgMlLfYk7zw93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXeD3cZe06EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdsWIpYUrhBcCHwZUO+BHQR2e2Wyjr16hlltVEk6y5QKCuPTyISVgoncflq/IDAtfDU/
 L2I55SC++LFxqmJW+I5XyJZ3B/EwhobCROgKdPZ7unmLO+FrHX
X-Talos-CUID: 9a23:xEaiI2yGvm+niIwlMLEWBgUYE8UIfjrdkU3BYB6eCn14Ve2JFwWfrfY=
X-Talos-MUID: 9a23:2QoXTghM6fvon46H9czHvMMpaMlX4YWJWV43sNYvuJG+NXwhIjeWk2Hi
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Feb 2025 14:22:48 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 9BA9E180001D6
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 14:22:48 +0000 (GMT)
X-CSE-ConnectionGUID: jeLqA+vzT+aEci+8thCMQg==
X-CSE-MsgGUID: dhTQi+uZRPyOUCBZsYZTiA==
Authentication-Results: alln-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.13,280,1732579200"; 
   d="scan'208,217";a="43308108"
Received: from mail-mw2nam04lp2168.outbound.protection.outlook.com (HELO NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.168])
  by alln-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Feb 2025 14:22:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dy6RnXfXtKI8GatdqhfydciubBReOleU7lD5eVJ3pEmlm2L+YASA7zen2gwrn7XpWKOQJwqqM2nn7snzYqHDnmWRGWlCxYLWrpTpGnMuJq2AWIvEmyuyaEY0CPm8kqIE7i8vSjR+OH6rbM/o6j3ioNRjZ1jGWhmD/Ba26mMQvYcqgc0AUr7fut/rs07ZAlkK7L3HlSZFSEjcyY14cW6YG2rBUiLg0DVw06rDlTlMCa7zfknEuJP2qE2COgbOg6KE6hBf5qIPoV9vwPaeiFGgI32hV5YNVOgRYZW35zh5fkcRWCxV0tXZRWdtjHgmg0r5PzmHz+BGTJINFBWokU90fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJmVGLBsz8Blyfd09p2um8qFxxxqoUZwJmVIjTO7bHg=;
 b=BW8VmNGsP6u0s6tPKEtMGiR+NSl6g3q86U5nYnfs/AoUfIQyabVyV/XTb6+f/EokZzYiBfzk8k6iQ9w3k+aGIeZEOi4onjwUtqjJMYh1G1XBQj47DOvF47Reqk8uSWE44NijRIu5QDukzxxGTnMHYnp1KxsfRPIKWMCYaKWZjVmfZdvtB0Dp0s1K+fw1rMUOk3Cp4fSQ1ekzOH+TBRc1tO6+20KgXqreTtaXhYUS7J0ipzI9uirFIdchpBqLAZUapelhWyefD00mw8echhD+Vflsj1HwttFMG2za2baWGNl/GKKEC2cGdP59dG/dnKv0+tFPZp2L+jekNq3aycUIWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5)
 by DS7PR11MB8853.namprd11.prod.outlook.com (2603:10b6:8:255::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 14:22:45 +0000
Received: from PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::3a7a:496b:1b5a:362b]) by PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::3a7a:496b:1b5a:362b%4]) with mapi id 15.20.8445.013; Wed, 12 Feb 2025
 14:22:45 +0000
From: "Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)"
	<oobitots@cisco.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Ross Burton
	<Ross.Burton@arm.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Ruslan Bilovol (rbilovol)"
	<rbilovol@cisco.com>
Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate
 subpackage
Thread-Topic: [OE-core] [PATCH] systemd: move systemctl utility to separate
 subpackage
Thread-Index: 
 AQHbeKZRchNZZrPMpUmlkztBmF+albNAcbkAgAABw6+AAALQAIAATwuggAAJYQCAAD7mAIABXkcFgAAJMACAAN47NYAAKbwAgAA/iEY=
Date: Wed, 12 Feb 2025 14:22:45 +0000
Message-ID: 
 <PH0PR11MB49026C46CD70272E73A7C688D7FC2@PH0PR11MB4902.namprd11.prod.outlook.com>
References: <20250206144907.1924993-1-oobitots@cisco.com>
 <E631A283-5721-4E5C-A65B-5A8CC986A600@arm.com>
 <PH0PR11MB4902635E1BEC8DB84E6D6C88D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj8rSuhpT6eoWA5eudSkKZFkqcfcSWgL6YogcX1f1qjLFQ@mail.gmail.com>
 <PH0PR11MB49027CBF82294C3F722688C0D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj_BoKLY1dgiAW72Tuc+EF6BFCSfKozN2X8ibdCGqbgifw@mail.gmail.com>
 <DB5PR02MB102130601D165773C901753C1EFF22@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <PH0PR11MB4902EB32CF27A37CD32A2938D7FD2@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj8kdZ1Stvu-OqakXhShp4easJXsYbaW0hg=T-ALGQj6zA@mail.gmail.com>
 <SA2PR11MB49064A61A32F35C2E519AA36D7FC2@SA2PR11MB4906.namprd11.prod.outlook.com>
 <CANNYZj8khhZ0EEeJ7W=epDWNKC6tTHPfd7Xk__G1M6T=ij6oOQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8khhZ0EEeJ7W=epDWNKC6tTHPfd7Xk__G1M6T=ij6oOQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4902:EE_|DS7PR11MB8853:EE_
x-ms-office365-filtering-correlation-id: 8f6b886a-5d78-4a74-75c0-08dd4b70b83e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|8096899003|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?F4BS55VuDoCP4adC7COo4uUzO0cO5EiU9+fE8o0bXTzkOKu5Gh6vM3UM?=
 =?Windows-1252?Q?wq1DXR0M1LzT2bU3whPiOu+cCiWPfXYxPGwMwvWM6bYX1gzOEDqBiRV+?=
 =?Windows-1252?Q?8EyTFlpM5n2UPc1jSAtgZrWvYPDYiTLsVtWBGxIfUg8YujlZfSuHg0yt?=
 =?Windows-1252?Q?b7w+2RjiaQeo4UhlReKHDO+xL2SPdyYpRmXxKySePnoCgVI0fJgO0hlJ?=
 =?Windows-1252?Q?F0MJ+vkn9VRKTYyyGVVwmrmGrjvnZc3Dq3lb00phoQLWnLFBl7uGRwnR?=
 =?Windows-1252?Q?nq9zLELa3gyDPCA5EUVJYpIr5ARGX7MKdizMOxM89xcukZeTThabMUuv?=
 =?Windows-1252?Q?faxTtEo3oKhBHKYOAgouGuAd5e8yhMoM2LsFJwPkNBIkXUc3urcgJBQk?=
 =?Windows-1252?Q?fVTOZ5vjnbtlrgOq+3lFxvTUXBZboqTZZtZeIg4rOrmKK2/VLo4T7G7X?=
 =?Windows-1252?Q?JQRU8JXi3WWXQdrBcqn8DmrXRuFqvi58cpp6WzZOMCXgNHONivdW5A3c?=
 =?Windows-1252?Q?oA1ZG6zBNdkIZjKS3+Qfw/UmQxTLboMLBtjPmOQwhjRu02zbSDqNMgli?=
 =?Windows-1252?Q?0xMX5nDkBYIkryb5vooJzzMlinEIdVr5w74vkywbb4BvKhHpoMT7V6Ia?=
 =?Windows-1252?Q?YpdnU2mSELi04/jRKxotQs6f5u+Ydr1+U1dNP5qi1r6GahquxupPVSvi?=
 =?Windows-1252?Q?HtC42q+DmhXkc9ONpHG+c1Bb48iMBetiOUgFnTBRLDplB1iE9WjMldKU?=
 =?Windows-1252?Q?EIFdac9VV6V3MQbUrok1pRiSCbV2HzW8bcqLKNoecITmCgUPmIrHPkHB?=
 =?Windows-1252?Q?qnfspxuFnXk7TDIm3Rkjz4uCrRYDyCSVXRDeZLCT3F0HJrz8XAWzIZlV?=
 =?Windows-1252?Q?eXWxATt6hWmtnLEaU8rM3swAc0QgdbzD5xTzamuAgxMV5PK/FMFvd9/b?=
 =?Windows-1252?Q?/fnBZkRkKgoa1bts1tWJtOtretQDCTUTg93TUS0DS8SakrIJCeNAZDdv?=
 =?Windows-1252?Q?p4090ltGHgWyGQTeIwUP9WDOPdV9hHRLl3f2pIbMojsKyNQ/fvS4tcw8?=
 =?Windows-1252?Q?PwuZDTEtzpq7M4viJGguPp+/K5YBz1E5T2AIlO4Ja/l7cWZV9REB3Ke9?=
 =?Windows-1252?Q?5DSJK+JWBr7DA94ujtJJtHZzgLuiC+LAg3w+Iisxir99lwqD1huPlJw6?=
 =?Windows-1252?Q?L0Ecl8fl7s7JiJkgajKlVlDwJ/V97NN2aVdFobOuF3q8XQFA9HdlcQMb?=
 =?Windows-1252?Q?CG6BYDgxMUwk/E4/0MjAKnjAKoeegBNnW9MY7IgE+mfNgpoHGWb30PlS?=
 =?Windows-1252?Q?9QJ4IYZn42U2EbMCdMQuW9KH3BcM93n0VogWKuu5j2ttyWSbvUe1w+EL?=
 =?Windows-1252?Q?IGvZevdhG5VuKc9I9ypwQrqKdKL91irFYxeN02pcRkqeSz4lJWjTbXo3?=
 =?Windows-1252?Q?1cjEg9WWPgLb1Yyj6gzs+o2csOmfm5U1mWdCVJYEeqqY9wezpl3Zey4b?=
 =?Windows-1252?Q?HJ5ZuFA30xDDImqSPsXCeZ7gTxR7Cc4NCABwa6pAmch5kxb/P6h79JvB?=
 =?Windows-1252?Q?znc0bnhrrx8/vDun?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(8096899003)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?EbEkxlVEdhbSWxqWJXAUHyH+WgxWELmDUI3ns0+pu1SCNcgNxzBLh4Wm?=
 =?Windows-1252?Q?X797z3msHguWI0OmZflu/PAOuaLE6FqZeLWF0lvzbCnunZO6PYHjRJp2?=
 =?Windows-1252?Q?KkzkNb+HU24nUVUE4TytfwAay6JM0TLB0EoLh2XKXfCdTmdqk/hACRTs?=
 =?Windows-1252?Q?nR1ms/6Du0zNMx4e+6y/Av+EAfdrYeDiayWdAlumCw7FJHjMEzSb8/87?=
 =?Windows-1252?Q?xOiRyg0ar77K+gxE+KbUS4aEVs8H8TLBtZ8bR/BO5jyTIPHTNW8RKxzP?=
 =?Windows-1252?Q?NeLGWFe6SSmFWF0QMDsxJFPXFzmPE1Xm8ESL4j3tAhPn/JDlsCTQORlf?=
 =?Windows-1252?Q?Z4XSEkhfkyAsBlv1QjoGEdCMt23uFMQPBbnpQbEN09yQ9m2H45i/U616?=
 =?Windows-1252?Q?2YM2MZxFFdqlpS6kpMjoSUpNz1nO5AwT+oCBAf+6ZwKvcB7cvfMk+HPn?=
 =?Windows-1252?Q?gMAe1sgSY1KbcDh/Nx02sd7/TN5hrvZ+zfMp2xN8LYXquwTwX09ctyFn?=
 =?Windows-1252?Q?/ztJio6FvLJuh54WFvstrfCvQb/LL63T4jvFe0+/fryXe2t2jpfdTaya?=
 =?Windows-1252?Q?+gBVUKMNhJLhARN2XO4gaMd5jPsDyi2ao/pEdpSx6pLt3NqtnoSZV7nI?=
 =?Windows-1252?Q?QPTuyNkzDWxmJePqawKq8XSBuJkS69Pl9cKLGn733Q1qUrEyeSUMzNJP?=
 =?Windows-1252?Q?GEpUs9+mlLDB3zWRW6352WTlxQTWT/iNqbpyCRk8bcYgzMsobmEEsqFZ?=
 =?Windows-1252?Q?VFAmfNB4KVqVUkdVIB+Fo46fa7wbHzkhvDYVplU+70iDyqoxxlwbk1OD?=
 =?Windows-1252?Q?MHb43V0Gk5nZgAXCXoKv9qJwhK/BkU1QjaOvUdkEEhQ8enWtP4El57y3?=
 =?Windows-1252?Q?fe/+CwwsPg7GwmWygZY7+LBXk2DSRIsKMkRF4aYOHtf6Eg8tb1ba2ig9?=
 =?Windows-1252?Q?lgvDLOP4hTNvdKzs6knCgHp4idbEpOcIqYVQATnyAcRYwXHX0muLRQxO?=
 =?Windows-1252?Q?YTXve0yDfDS9lorvChF2x9vvBubhDFmBF0rQyb3BfFAwIrOOIP8tjUAu?=
 =?Windows-1252?Q?OBOKGTjEC4Ikn3SXRimgU+lxCPigOx+QO9r2q1EsHmq2mzR9LX76fTCv?=
 =?Windows-1252?Q?Do5WN5PC5syPT44xfDLOIO2xAtFg5BCBuZ8ICliDr8XT5pNLCuiZw9fD?=
 =?Windows-1252?Q?YPCSGlHMd3CM5EiZvtOZUlLughv4KCrB1d5quzA4NUf0GMHYVzroDfPn?=
 =?Windows-1252?Q?HuAjn0Qzj3AsoK7kaUIxRajLe1Kmy08kK5akMGscIVUgWVxeaghsZUhK?=
 =?Windows-1252?Q?hwbPEGE3kJsgPh0M1vSbQfgInlmy0GBSbQIgV4j/WbhiI7MghrrNpfda?=
 =?Windows-1252?Q?7dvO9B4endcT6N+BOKCyxYf8MDezPu9ssyThmcxr2sLLDvWTIKLChQZ8?=
 =?Windows-1252?Q?kzLIsfHDmZUFBjW5ZuSE+e2Akx7q23FXvp5qtYl4DSXyClo3n+xXHrZ0?=
 =?Windows-1252?Q?jvKuROV46vrIhXTedU5NaItrpDICazfjFIL8in5m190pBLJAiDLUiBRS?=
 =?Windows-1252?Q?UgtuCANRKlR/7HSOIlV5AQWIkFeiwrtNKWP1SWmtsNb9J4xmexCl5lgb?=
 =?Windows-1252?Q?CTGXGX4NNKDqUovWXiDk6hkggvfjDp16NNi5DM7VpCSOA83kf5V5zBbP?=
 =?Windows-1252?Q?Yfjb8DTENgPedgOgrMJ4ZM3lHOdJXaZJvzrZ2BP3k2WDe5voCbS1Rg?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB49026C46CD70272E73A7C688D7FC2PH0PR11MB4902namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6b886a-5d78-4a74-75c0-08dd4b70b83e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 14:22:45.5960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UPHDRtO8Tb3zs5Z1jsNCFi59GhKLSxIIgFpB0vpGqpGOir5xks44lVduCOmopIfhRpWQWYMDtUW6n9QUZtSIhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8853
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 14:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211242

--_000_PH0PR11MB49026C46CD70272E73A7C688D7FC2PH0PR11MB4902namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

In practice getting rid of systemd and leaving only systemctl binary gives =
me approx. 20Mb disk space

3.0M    libsystemd-shared
960K    libsystemd
9.4M    systemd
424K    libnss-systemd

~5 Mb could be extra dependency libraries removed after systemd removal.

Regarding runtime dependencies - components will be merged on target and al=
l dependencies will be resolved. All necessary libraries will be taken from=
 one "base" component that will deliver whatever we need, like glibc, syste=
md, etc. We have only one "base" component (or more - it depends how many d=
ifferent libraries/versions we need to support).

Regards,
Oleksiy
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Wednesday, February 12, 2025 11:16
To: Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco) <oobitots@c=
isco.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Ross Burton <Ross.Bur=
ton@arm.com>; openembedded-core@lists.openembedded.org <openembedded-core@l=
ists.openembedded.org>; Ruslan Bilovol (rbilovol) <rbilovol@cisco.com>
Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate =
subpackage

But systemctl does depend on libsystemd-shared, so a copy of that will
still be in every component. And libsystemd-shared itself pulls in a
lot of stuff, and those libraries no doubt depend on further
libraries:

    linux-vdso.so.1 (0x00007ffe9e9d0000)
    libacl.so.1 =3D> /lib/x86_64-linux-gnu/libacl.so.1 (0x00007fbc40540000)
    libblkid.so.1 =3D> /lib/x86_64-linux-gnu/libblkid.so.1 (0x00007fbc404e9=
000)
    libcap.so.2 =3D> /lib/x86_64-linux-gnu/libcap.so.2 (0x00007fbc404dd000)
    libcrypt.so.2 =3D> not found
    libmount.so.1 =3D> /lib/x86_64-linux-gnu/libmount.so.1 (0x00007fbc4047a=
000)
    libpam.so.0 =3D> /lib/x86_64-linux-gnu/libpam.so.0 (0x00007fbc40466000)
    libseccomp.so.2 =3D> /lib/x86_64-linux-gnu/libseccomp.so.2
(0x00007fbc40446000)
    libm.so.6 =3D> /lib/x86_64-linux-gnu/libm.so.6 (0x00007fbc3ff21000)
    libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007fbc3fd40000)
    /lib64/ld-linux-x86-64.so.2 (0x00007fbc40557000)
    libselinux.so.1 =3D> /lib/x86_64-linux-gnu/libselinux.so.1
(0x00007fbc40418000)
    libaudit.so.1 =3D> /lib/x86_64-linux-gnu/libaudit.so.1 (0x00007fbc403e5=
000)
    libpcre2-8.so.0 =3D> /lib/x86_64-linux-gnu/libpcre2-8.so.0
(0x00007fbc3fca6000)
    libcap-ng.so.0 =3D> /lib/x86_64-linux-gnu/libcap-ng.so.0 (0x00007fbc403=
dd000)

Put it another way, what is the difference in a 'component' before and
after this change, in size and amount of files?

I'm just struggling to justify this; it looks like a very niche need,
driven by a custom, proprietary mechanism to install additional
software into products. The change won't be useful to anyone else,
while complicating systemd packaging further.

Alex

On Wed, 12 Feb 2025 at 08:56, Oleksiy Obitotskyy -X (oobitots -
GLOBALLOGIC INC at Cisco) <oobitots@cisco.com> wrote:
>
> Component deliver something and it's content consist of:
>
> binaries/libraries/scripts, etc. that delivered by this component (servic=
e) itself
> binaries/libraries, etc. on which component depends on
>
> Technically content is per component subdirectory. Every component has it=
s own isolated content.
>
> If we have N components each require only systemd-systemctl it mean every=
 component will store (on disk) whole systemd/libsystemd package files inst=
ead of systemctl binary.
>
> Regards,
> Oleksiy
>
> ________________________________
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Tuesday, February 11, 2025 19:31
> To: Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco) <oobitots=
@cisco.com>
> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Ross Burton <Ross.B=
urton@arm.com>; openembedded-core@lists.openembedded.org <openembedded-core=
@lists.openembedded.org>; Ruslan Bilovol (rbilovol) <rbilovol@cisco.com>
> Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separat=
e subpackage
>
> This still doesn=92t make sense. Any target file is contained in one and =
only one package. Where is the duplication?
>
> Alex
>
> On Tue 11. Feb 2025 at 19.04, Oleksiy Obitotskyy -X (oobitots - GLOBALLOG=
IC INC at Cisco) <oobitots@cisco.com> wrote:
>
> I'm sorry, I confused you mentioned term sysroot. It's not about yocto - =
we just use the same term because it's very similar
> to how it works into yocto.
> We got packages as a result of  yocto build and use these artefacts (pack=
ages) on next stage to populate
> software components content. For some reason we can't use the same approa=
ch with hardlink to deduplicate
> components content.
>
> Regards,
> Oleksiy
>
> ________________________________
> From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Sent: Monday, February 10, 2025 22:05
> To: alex.kanavin@gmail.com <alex.kanavin@gmail.com>; Oleksiy Obitotskyy -=
X (oobitots - GLOBALLOGIC INC at Cisco) <oobitots@cisco.com>
> Cc: Ross Burton <Ross.Burton@arm.com>; openembedded-core@lists.openembedd=
ed.org <openembedded-core@lists.openembedded.org>; Ruslan Bilovol (rbilovol=
) <rbilovol@cisco.com>
> Subject: RE: [OE-core] [PATCH] systemd: move systemctl utility to separat=
e subpackage
>
> Additionally, changing the packaging does not affect what is added to
> the sysroot.
>
> //Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Alexander Kanavin via
> > lists.openembedded.org
> > Sent: den 10 februari 2025 18:20
> > To: oobitots@cisco.com
> > Cc: Ross Burton <Ross.Burton@arm.com>; openembedded-
> > core@lists.openembedded.org; Ruslan Bilovol (rbilovol)
> > <rbilovol@cisco.com>
> > Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separ=
ate
> > subpackage
> >
> > They're not actually copied. They're hard-linked from
> > sysroots-components/. This is a cheap operation and it doesn't waste
> > disk space.
> >
> > Alex
> >
> > On Mon, 10 Feb 2025 at 18:05, Oleksiy Obitotskyy via
> > lists.openembedded.org <oobitots=3Dcisco.com@lists.openembedded.org>
> > wrote:
> > >
> > > Hi Alexander,
> > >
> > > By 'deploying whole systemd' I mean next:
> > >
> > > Every component copy and installs packages with libraries, utilities =
and
> > config files in component local sysroot, i.e. directory used to create
> > final component image:
> > >
> > > libsystemd0_255.4
> > > libsystemd-shared_255.4
> > > systemd_255.4
> > >
> > > So, on disk we have duplication of files for every component that dep=
end
> > on the systemctl.
> > > In case of separate subpackage we have one root component depend on t=
he
> > systemd and all other components will contain only systemd-systemctl
> > package content.
> > >
> > > Of course, I understand it's quite a specific scenario.
> > >
> > > Regards,
> > > Oleksiy
> > >
> > > ________________________________
> > > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > Sent: Monday, February 10, 2025 13:03
> > > To: Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)
> > <oobitots@cisco.com>
> > > Cc: Ross Burton <Ross.Burton@arm.com>; openembedded-
> > core@lists.openembedded.org <openembedded-core@lists.openembedded.org>;
> > Ruslan Bilovol (rbilovol) <rbilovol@cisco.com>
> > > Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to
> > separate subpackage
> > >
> > > On Mon, 10 Feb 2025 at 13:01, Oleksiy Obitotskyy via
> > > lists.openembedded.org <oobitots=3Dcisco.com@lists.openembedded.org>
> > > wrote:
> > > > We have next situation:
> > > > - a lot of software components that depend on packages and deploy a=
ll
> > packages they depend on locally inside component.
> > > > - some components directly depend on systemctl only (e.g. this bina=
ry
> > used in scripts), so for every component we have to deploy whole system=
d
> > locally.
> > > > - finally, all/some of those components will be merged in some way =
and
> > will use systemd/libsystemd, but until then it will be nice to get rid =
of
> > such duplication.
> > >
> > > I'm sorry, but this does not quite make sense. You need to more
> > > specifically describe what 'deploying whole systemd' means, and why i=
s
> > > that problematic.
> > >
> > > Alex
> > >
> > >
> > >

--_000_PH0PR11MB49026C46CD70272E73A7C688D7FC2PH0PR11MB4902namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
In practice getting rid of systemd and leaving only systemctl binary gives =
me approx. 20Mb disk space</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
3.0M &nbsp; &nbsp;libsystemd-shared</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
960K &nbsp; &nbsp;libsystemd</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
9.4M &nbsp; &nbsp;systemd</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
424K &nbsp; &nbsp;libnss-systemd</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
~5 Mb could be extra dependency libraries&nbsp;removed after systemd remova=
l.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regarding runtime dependencies - components will be merged on target and al=
l dependencies will be resolved. All necessary libraries will be taken from=
 one &quot;base&quot; component that will deliver whatever we need, like gl=
ibc, systemd, etc. We have only one &quot;base&quot;
 component (or more - it depends how many different libraries/versions we n=
eed to support).</div>
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
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr" style=3D"color: inherit;"><span style=
=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
"><b>From:</b>&nbsp;Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, February 12, 2025 11:16<br>
<b>To:</b>&nbsp;Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)=
 &lt;oobitots@cisco.com&gt;<br>
<b>Cc:</b>&nbsp;Peter Kjellerstedt &lt;peter.kjellerstedt@axis.com&gt;; Ros=
s Burton &lt;Ross.Burton@arm.com&gt;; openembedded-core@lists.openembedded.=
org &lt;openembedded-core@lists.openembedded.org&gt;; Ruslan Bilovol (rbilo=
vol) &lt;rbilovol@cisco.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [PATCH] systemd: move systemctl utility =
to separate subpackage</span>
<div>&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">But systemctl does depend on libsystemd-sha=
red, so a copy of that will<br>
still be in every component. And libsystemd-shared itself pulls in a<br>
lot of stuff, and those libraries no doubt depend on further<br>
libraries:<br>
<br>
&nbsp;&nbsp;&nbsp; linux-vdso.so.1 (0x00007ffe9e9d0000)<br>
&nbsp;&nbsp;&nbsp; libacl.so.1 =3D&gt; /lib/x86_64-linux-gnu/libacl.so.1 (0=
x00007fbc40540000)<br>
&nbsp;&nbsp;&nbsp; libblkid.so.1 =3D&gt; /lib/x86_64-linux-gnu/libblkid.so.=
1 (0x00007fbc404e9000)<br>
&nbsp;&nbsp;&nbsp; libcap.so.2 =3D&gt; /lib/x86_64-linux-gnu/libcap.so.2 (0=
x00007fbc404dd000)<br>
&nbsp;&nbsp;&nbsp; libcrypt.so.2 =3D&gt; not found<br>
&nbsp;&nbsp;&nbsp; libmount.so.1 =3D&gt; /lib/x86_64-linux-gnu/libmount.so.=
1 (0x00007fbc4047a000)<br>
&nbsp;&nbsp;&nbsp; libpam.so.0 =3D&gt; /lib/x86_64-linux-gnu/libpam.so.0 (0=
x00007fbc40466000)<br>
&nbsp;&nbsp;&nbsp; libseccomp.so.2 =3D&gt; /lib/x86_64-linux-gnu/libseccomp=
.so.2<br>
(0x00007fbc40446000)<br>
&nbsp;&nbsp;&nbsp; libm.so.6 =3D&gt; /lib/x86_64-linux-gnu/libm.so.6 (0x000=
07fbc3ff21000)<br>
&nbsp;&nbsp;&nbsp; libc.so.6 =3D&gt; /lib/x86_64-linux-gnu/libc.so.6 (0x000=
07fbc3fd40000)<br>
&nbsp;&nbsp;&nbsp; /lib64/ld-linux-x86-64.so.2 (0x00007fbc40557000)<br>
&nbsp;&nbsp;&nbsp; libselinux.so.1 =3D&gt; /lib/x86_64-linux-gnu/libselinux=
.so.1<br>
(0x00007fbc40418000)<br>
&nbsp;&nbsp;&nbsp; libaudit.so.1 =3D&gt; /lib/x86_64-linux-gnu/libaudit.so.=
1 (0x00007fbc403e5000)<br>
&nbsp;&nbsp;&nbsp; libpcre2-8.so.0 =3D&gt; /lib/x86_64-linux-gnu/libpcre2-8=
.so.0<br>
(0x00007fbc3fca6000)<br>
&nbsp;&nbsp;&nbsp; libcap-ng.so.0 =3D&gt; /lib/x86_64-linux-gnu/libcap-ng.s=
o.0 (0x00007fbc403dd000)<br>
<br>
Put it another way, what is the difference in a 'component' before and<br>
after this change, in size and amount of files?<br>
<br>
I'm just struggling to justify this; it looks like a very niche need,<br>
driven by a custom, proprietary mechanism to install additional<br>
software into products. The change won't be useful to anyone else,<br>
while complicating systemd packaging further.<br>
<br>
Alex<br>
<br>
On Wed, 12 Feb 2025 at 08:56, Oleksiy Obitotskyy -X (oobitots -<br>
GLOBALLOGIC INC at Cisco) &lt;oobitots@cisco.com&gt; wrote:<br>
&gt;<br>
&gt; Component deliver something and it's content consist of:<br>
&gt;<br>
&gt; binaries/libraries/scripts, etc. that delivered by this component (ser=
vice) itself<br>
&gt; binaries/libraries, etc. on which component depends on<br>
&gt;<br>
&gt; Technically content is per component subdirectory. Every component has=
 its own isolated content.<br>
&gt;<br>
&gt; If we have N components each require only systemd-systemctl it mean ev=
ery component will store (on disk) whole systemd/libsystemd package files i=
nstead of systemctl binary.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Oleksiy<br>
&gt;<br>
&gt; ________________________________<br>
&gt; From: Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
&gt; Sent: Tuesday, February 11, 2025 19:31<br>
&gt; To: Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco) &lt;oo=
bitots@cisco.com&gt;<br>
&gt; Cc: Peter Kjellerstedt &lt;peter.kjellerstedt@axis.com&gt;; Ross Burto=
n &lt;Ross.Burton@arm.com&gt;; openembedded-core@lists.openembedded.org &lt=
;openembedded-core@lists.openembedded.org&gt;; Ruslan Bilovol (rbilovol) &l=
t;rbilovol@cisco.com&gt;<br>
&gt; Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to sepa=
rate subpackage<br>
&gt;<br>
&gt; This still doesn=92t make sense. Any target file is contained in one a=
nd only one package. Where is the duplication?<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Tue 11. Feb 2025 at 19.04, Oleksiy Obitotskyy -X (oobitots - GLOBAL=
LOGIC INC at Cisco) &lt;oobitots@cisco.com&gt; wrote:<br>
&gt;<br>
&gt; I'm sorry, I confused you mentioned term sysroot. It's not about yocto=
 - we just use the same term because it's very similar<br>
&gt; to how it works into yocto.<br>
&gt; We got packages as a result of&nbsp; yocto build and use these artefac=
ts (packages) on next stage to populate<br>
&gt; software components content. For some reason we can't use the same app=
roach with hardlink to deduplicate<br>
&gt; components content.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Oleksiy<br>
&gt;<br>
&gt; ________________________________<br>
&gt; From: Peter Kjellerstedt &lt;peter.kjellerstedt@axis.com&gt;<br>
&gt; Sent: Monday, February 10, 2025 22:05<br>
&gt; To: alex.kanavin@gmail.com &lt;alex.kanavin@gmail.com&gt;; Oleksiy Obi=
totskyy -X (oobitots - GLOBALLOGIC INC at Cisco) &lt;oobitots@cisco.com&gt;=
<br>
&gt; Cc: Ross Burton &lt;Ross.Burton@arm.com&gt;; openembedded-core@lists.o=
penembedded.org &lt;openembedded-core@lists.openembedded.org&gt;; Ruslan Bi=
lovol (rbilovol) &lt;rbilovol@cisco.com&gt;<br>
&gt; Subject: RE: [OE-core] [PATCH] systemd: move systemctl utility to sepa=
rate subpackage<br>
&gt;<br>
&gt; Additionally, changing the packaging does not affect what is added to<=
br>
&gt; the sysroot.<br>
&gt;<br>
&gt; //Peter<br>
&gt;<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: openembedded-core@lists.openembedded.org &lt;openembedded-<=
br>
&gt; &gt; core@lists.openembedded.org&gt; On Behalf Of Alexander Kanavin vi=
a<br>
&gt; &gt; lists.openembedded.org<br>
&gt; &gt; Sent: den 10 februari 2025 18:20<br>
&gt; &gt; To: oobitots@cisco.com<br>
&gt; &gt; Cc: Ross Burton &lt;Ross.Burton@arm.com&gt;; openembedded-<br>
&gt; &gt; core@lists.openembedded.org; Ruslan Bilovol (rbilovol)<br>
&gt; &gt; &lt;rbilovol@cisco.com&gt;<br>
&gt; &gt; Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to=
 separate<br>
&gt; &gt; subpackage<br>
&gt; &gt;<br>
&gt; &gt; They're not actually copied. They're hard-linked from<br>
&gt; &gt; sysroots-components/. This is a cheap operation and it doesn't wa=
ste<br>
&gt; &gt; disk space.<br>
&gt; &gt;<br>
&gt; &gt; Alex<br>
&gt; &gt;<br>
&gt; &gt; On Mon, 10 Feb 2025 at 18:05, Oleksiy Obitotskyy via<br>
&gt; &gt; lists.openembedded.org &lt;oobitots=3Dcisco.com@lists.openembedde=
d.org&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi Alexander,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; By 'deploying whole systemd' I mean next:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Every component copy and installs packages with libraries, u=
tilities and<br>
&gt; &gt; config files in component local sysroot, i.e. directory used to c=
reate<br>
&gt; &gt; final component image:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; libsystemd0_255.4<br>
&gt; &gt; &gt; libsystemd-shared_255.4<br>
&gt; &gt; &gt; systemd_255.4<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; So, on disk we have duplication of files for every component=
 that depend<br>
&gt; &gt; on the systemctl.<br>
&gt; &gt; &gt; In case of separate subpackage we have one root component de=
pend on the<br>
&gt; &gt; systemd and all other components will contain only systemd-system=
ctl<br>
&gt; &gt; package content.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Of course, I understand it's quite a specific scenario.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; Oleksiy<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; ________________________________<br>
&gt; &gt; &gt; From: Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
&gt; &gt; &gt; Sent: Monday, February 10, 2025 13:03<br>
&gt; &gt; &gt; To: Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cis=
co)<br>
&gt; &gt; &lt;oobitots@cisco.com&gt;<br>
&gt; &gt; &gt; Cc: Ross Burton &lt;Ross.Burton@arm.com&gt;; openembedded-<b=
r>
&gt; &gt; core@lists.openembedded.org &lt;openembedded-core@lists.openembed=
ded.org&gt;;<br>
&gt; &gt; Ruslan Bilovol (rbilovol) &lt;rbilovol@cisco.com&gt;<br>
&gt; &gt; &gt; Subject: Re: [OE-core] [PATCH] systemd: move systemctl utili=
ty to<br>
&gt; &gt; separate subpackage<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, 10 Feb 2025 at 13:01, Oleksiy Obitotskyy via<br>
&gt; &gt; &gt; lists.openembedded.org &lt;oobitots=3Dcisco.com@lists.openem=
bedded.org&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; We have next situation:<br>
&gt; &gt; &gt; &gt; - a lot of software components that depend on packages =
and deploy all<br>
&gt; &gt; packages they depend on locally inside component.<br>
&gt; &gt; &gt; &gt; - some components directly depend on systemctl only (e.=
g. this binary<br>
&gt; &gt; used in scripts), so for every component we have to deploy whole =
systemd<br>
&gt; &gt; locally.<br>
&gt; &gt; &gt; &gt; - finally, all/some of those components will be merged =
in some way and<br>
&gt; &gt; will use systemd/libsystemd, but until then it will be nice to ge=
t rid of<br>
&gt; &gt; such duplication.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I'm sorry, but this does not quite make sense. You need to m=
ore<br>
&gt; &gt; &gt; specifically describe what 'deploying whole systemd' means, =
and why is<br>
&gt; &gt; &gt; that problematic.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Alex<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;</div>
</body>
</html>

--_000_PH0PR11MB49026C46CD70272E73A7C688D7FC2PH0PR11MB4902namp_--

