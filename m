Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C8BC43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 05:19:19 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2565.1783574353059753445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 22:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EzvPhLKx;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=16562; q=dns/txt;
  s=iport01; t=1783574353; x=1784783953;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=4b7JtQe4ifrIZN+X86Wp+YygbWVCXd/wgrSf8yhMicg=;
  b=EzvPhLKxeHwXrcHgHc2onMxwDmXP0uib9por4zkec+AwJjc57uQCbquW
   zPQzjmFsCAZU7kwrRE9zzRpPi7DVNsNtQbLhU87Oa2+CJ7s4BWdCAMhJ7
   7VNZDq0U7jcLfeuEXYVizALnGw/fwZGVauTQv4qjQmzznC1qQRxoF/mEj
   MIjbOaD+h7g0oRNF6f2gwXn9e8FoqW42YubAIY6HOz+6SOWdJqno6pHoR
   8KGsqR4FXqJt3n/RL/ia2+tUrDpKq8yAvTrVEeTKKbhzQDsShDy+/Er+5
   kXCOwZw5VxAGavfCRfZbHwvZ8IDOnABw3DVO4IsUjiKbJwvMb/WQ3lKpq
   Q==;
X-CSE-ConnectionGUID: LouwoWQWRZCsczssUud2Iw==
X-CSE-MsgGUID: m5OslbeiRW6B5AEtD+07xg==
X-IPAS-Result: =?us-ascii?q?A0CJBABELk9q/4r/Ja1aHgEBCxIMZYEgC4E9ATBTgQgCg?=
 =?us-ascii?q?SFJBIgfA4UrhliCIQOBE5YxhleBfg8BAQENAi4BFQ0EAQGFBQKNTQImNgcOA?=
 =?us-ascii?q?QIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQEBAQIBAREVJ?=
 =?us-ascii?q?AEyCwIBCBEEAQEBLicKHQgCBAESCBqCYYIdFhknAwECDgareQGBPQKKKniBA?=
 =?us-ascii?q?TOBAYMoAUNB3AoUAYE4hT+DABsBAQUlSWyCXYEhGAEbhGEnGxuBcoEVQoEog?=
 =?us-ascii?q?Qk4PoI/BB4BAgEBgSQQGhGEE4IwBIIiehIbgV1QgRsngWGLdVJyIgMmMywBV?=
 =?us-ascii?q?RMXCwcFgSMQMwMqLy0jSwUtHXAMJxIPHRcWHlgbBwUSICpBRSMDHFg/OAtDB?=
 =?us-ascii?q?YFZAoIITiMfAzl/gS91SnktgQECEB4KbEIkghY6AwttPTcGDhsDBIE1BYxQB?=
 =?us-ascii?q?1sXD4FcWwYBgQQKCCICT0xpDzEEL5JGPC10jiCOYJUXCiiDdYp7gSaNPogyF?=
 =?us-ascii?q?4QEgVelEZkII4I2izGVYIUuAgQCBAUCEAEBBoFvAjOBWXAVgm4BATIJCkAZD?=
 =?us-ascii?q?5c2ySd5AgEBOQIHAgcOAwuRaAImgVYBAQ?=
IronPort-PHdr: A9a23:5pAHWRf+AJqrFS2XiSKC3L2glGM/gIqcDmcuAtIPkblCdOGk55v9e
 RaZ7vR2h1iPVoLeuLpIiOvT5rjpQndIoY2Av3YLbIFWWlcbhN8XkQ0tDI/NCUDyIPPwKS1vN
 M9DT1RiuXq8NCBo
IronPort-Data: A9a23:Lhd8JKBtXZ3OfxVW/3Liw5YqxClBgxIJ4kV8jS/XYbTApDx23jYBn
 2QYUWGGP/iOazT2fox0bIng/EgOuJTWn95mOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD9i2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE5/JzE0YJBLIiyM1sCnNV7
 sEFJGoscUXW7w626OrTpuhEnM8vKozveYgYoHwllWifBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGE/BPjDS0Un1lM/AYkmlf2tj2PXeDxDo1XTrq0yi4TW5FEpjuW8boGMILRmQ+1Qw2GDo
 mjL/l7GXDtHHfGD5XndrWKj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KNpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfQ9/vBDj10u7rTQnWYnop4ZxvoUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:Y5Yw7qs/Ts/VUG1HkaEFy9uo7skCf4Aji2hC6mlwRA09TyXGrb
 HMoB1L73/JYWgqOU3IwerwR5VoIUmxyXcH2/huAV7CZnirhILGFvAY0WKP+UyFJ8S6zJ8g6U
 4CSdkwNDSTNykBsS+S2mDReLhQoqjjzEnrv5ai854Hd3ANV0gU1XYANu/tKDwOeOApP+tfKL
 OsouB8i36Lf3MRYs6nBn8DcdTiirTw/q7OUFotPTJizBOBow+JxdfBfiSw71MzQjlPybAt/S
 z/lRDl5qKsive/yhXN/W7e5ZZblbLau5V+7cq35fQ9G3HJsEKFdY5hU7qNsHQeu+e08msnl9
 HKvlMJI9lzw2m5RBD0nTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxri7VY6tt0U6t
 MJ44vZjesUMfrzplW42zH6bWAsqqNymwtlrQcntQ0bbWLZUs4JkWVQxjIMLH5KJlOK1GluKp
 gfMCib3ocWTXqqK1bEo2Jo3NugGl43HhuAXww+n/b96UkMoJi8pHFomfD2WRw7hcgAo5Uo3Z
 W2Do140L5JVcMYdqR7GaMIRta2EHXERVbWPHuVOkmPLtBNB5vhke+/3FwO3pDjRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOthTAWn+0UzjhwtxXo8ERgMyweJP7dSmYDFw+mcqppPsSRsXdRv
 aoIZpTR/vuN3HnF4pF1xD3H5NSNX4dWssIvctTYSPFnuvbbonx8uDLevfaI7TgVT4iR2PkG3
 MGGCP+Ic1Rh3rbLEMQQCKhLE8FVnaPia6YSpKqjdT74LJ9Q7Fxjg==
X-Talos-CUID: =?us-ascii?q?9a23=3A+zpsRWmTz8SgoMHrA1/9uLfCm9vXOVna0WjXHHa?=
 =?us-ascii?q?HM1RCU7aHUkSt5a8+stU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AFsrpKA9xetJ4CzeKz87Xmc6Qf8I1xL+qAk0Mq6p?=
 =?us-ascii?q?YkZStGDBceG/CnDviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Jul 2026 05:19:11 +0000
Received: from rcdn-opgw-2.cisco.com (rcdn-opgw-2.cisco.com [72.163.7.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id D32071800032E
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Jul 2026 05:19:11 +0000 (GMT)
X-CSE-ConnectionGUID: KiTuf/k5R7GfQWhd9gZk6A==
X-CSE-MsgGUID: G+yGnPhvStiY8oR2D4Y1yA==
Authentication-Results: rcdn-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208,217";a="67566210"
Received: from mail-westcentralusazon11013013.outbound.protection.outlook.com (HELO CY3PR05CU001.outbound.protection.outlook.com) ([40.93.201.13])
  by rcdn-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Jul 2026 05:19:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQRzSv3a91TEMqigto07TBqWFSeK23niodbz571iA4CvTRFzPwpDGiTD8OdJ6aIC84phg+gDS3FCdDL0wpQMkHYrMjYDrVv1GL3m7fW9S4MwRwqEoqNbaE7cPV2CGZOxJNQLQddYUNfKdx1C9vUbxzh1OorNRpQv+x3uYzay5e2q1loZLzIBgRDvmsA3fNARX4oZYzcM3q4bkfOABPUCK0HInaCBqK+nPYuUh6K4S3d/NuOtVMErGV/tuo4FAXttrwNFsc83n92v18uPmzmB1Y8zjaVe7h1Qudgd9UKS/st7NnohgWoDGc1GjmeZdi8VBtw6W3Htx5K9+DJx4J3GOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4b7JtQe4ifrIZN+X86Wp+YygbWVCXd/wgrSf8yhMicg=;
 b=KO/W3cBsVI2QAc8z/k8e8ZN1FUCca4GE4Kbw7wNFb+iNAIau+Jox5ALXHb9KbAxm4DIKuCCTI1vEpd7sGlR7WSvowyeLHQXrKqNFRyQM5v69Pu6cGdISYAp9f98uruidZNw5L0NWaa9PHcFBx4+myJFUU4Ekn48zr+szgXN0jjXEk63X3NKQ6gDbSygdE7+QRppxZMBNm+onV5XZvjjXTl63p3LLjfd10ThpdfDBYM+QV675OnxXfdgXWP8IftDxuO+2fKSVKEqRBuoRoscZJo0B9SkhlBjt5AJxwmJaMbjm6FyMTO5kcVstUQN38XKWxLzPTwUmZJNdzhX/RhSPFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19)
 by PH7PR11MB5819.namprd11.prod.outlook.com (2603:10b6:510:13b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 05:19:07 +0000
Received: from PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37]) by PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37%5]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 05:19:06 +0000
From: "Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at
 Cisco)" <asparmar@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH v2] bind: Upgrade 9.18.44 -> 9.18.49
Thread-Topic: [OE-core][scarthgap][PATCH v2] bind: Upgrade 9.18.44 -> 9.18.49
Thread-Index: AQHdCFZOmWslZyu8ak+iKIqEurFLQ7Zh44AAgAAxSvKAABMfgIACi7vu
Date: Thu, 9 Jul 2026 05:19:06 +0000
Message-ID: 
 <PH0PR11MB5902315E3AD01B7CCF6D19FFCFFE2@PH0PR11MB5902.namprd11.prod.outlook.com>
References: <20260630060410.1203985-1-asparmar@cisco.com>
 <DJS9H2DLIVVC.2DDDZVKTEK2TS@smile.fr>
 <PH0PR11MB5902116D97221B6725047B50CFF02@PH0PR11MB5902.namprd11.prod.outlook.com>
 <DJSEOJECWK9X.ANVISE5T9476@smile.fr>
In-Reply-To: <DJSEOJECWK9X.ANVISE5T9476@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5902:EE_|PH7PR11MB5819:EE_
x-ms-office365-filtering-correlation-id: b029e646-0edd-4f1a-64f1-08dedd79997c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|8096899003|13003099007|38070700021|12006099003|4143699003|56012099006|11063799006|16056099006;
x-microsoft-antispam-message-info: 
 u5YpldDmjDKHKVwWnwasU146QiJZ5bD50WH5M0A14ciGGANfaL9Q46s2DVD/dCMBg0vj8xmnjD6PYlmbeaKlc3vZFRphf7uwn5jQiiuY3pfvjpN7bdItotROUT7PJS3lbiLlAMLbG6oCldDwfVhooxIIyDmE1xRAiZvcxKPdtFNNaj9ej3bIEsMwreTNTz2yAymBLJeK8OZwCv6ynMFajduysIP4MygFs4pkHXdmOn/5F2/B/j/4vY5QtFtOy6nYosnSlK1AKDoMAX/O2MwVZu1UMpRAnVy68YgzDJak1J7Uc7Py3tzoy5/Tu5127pm0Q/PC/ZdrOQSZqn9USQq1vyKxqXosHbP40PyIisA/QySfTnGDtOaXADcTuMWNpWJJt4qzwbON4NDh/2o1rXcQ7k8fuJJ5hLwEJvpN4Hj8M4kaDFVoT9OjqxiXYCmqRViHwqxF7m50q/3pO3X5YPcJ5C6YYxzDirZHttk0OzBZEbo3zbf62Jjf4G/zsCSPEUxEsmFkVpfRPEIrvaXxCMO6Oe6wyrxlWilqxWmJIuu7g8FJ2wgI28XKuiQlx5vkLwg2un1q/RdihE0miac1cHyrDs9gYU7Hxi/mcBFigc3Zs4fEEfqwrKruQ4gTrglOfSB1w6Ifq2OZRoP8hBnQC6YGut7sIWDFYR/Lf0BL3GFdrWI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(8096899003)(13003099007)(38070700021)(12006099003)(4143699003)(56012099006)(11063799006)(16056099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?otEO5uPQAG3tks577/uAoz/YCZb8ZnCe+bNu4HjiTN/1EWMCciIB5oqGnvJK?=
 =?us-ascii?Q?uJP4hocpZP/aag6a9RBx04XXOfphRoCceLx/F8YFB1bkcb8JC1w6PARfaolx?=
 =?us-ascii?Q?MHIBIUNquS67DgZu0VVH1CDxO3UzXHevQfvSXyTQzwpI4sd/tzLhpatb/Z6x?=
 =?us-ascii?Q?62CfH1Q+Z+/7poSGuYqSej65dNfatYgUdq30c0fN58k8ibCBeWNjm0QU7rPE?=
 =?us-ascii?Q?f0qdPEuPN1fZh1L+T2r0ctlTns6ItrWL/iVb4A3jw8ubL4a+r60eCntyw6wu?=
 =?us-ascii?Q?007kZOjUaezuzeTca2USraZukZxpQrZfem8f9H4lpkMufHVnqBXpfvYl6ooA?=
 =?us-ascii?Q?H+xoaNJMXeHSIHnTIzR8YOoX1QTUJtpf4qzdehr25qJKyRfFi6Y68HXAdm6S?=
 =?us-ascii?Q?mLVJuP90UFuiL8otfiXWfI3MSB9fp0uLjwH9ODOKVUvJPWwwKPpzlqX0e9vl?=
 =?us-ascii?Q?Z60ryLy80925acaaFzerX8+ZI+KdZNVOonLFmmADxAAunMCOe8CO4zS7CY4l?=
 =?us-ascii?Q?9Ab7ru/g9yKZmndkyaQXMgVgvWkxUn/39aKElbE9my7DNpXmTbOIsFn6inWX?=
 =?us-ascii?Q?0f/eptLF0I/ptApWLihjccXQsPDZIvcfhoCQLKKXaJoScR/FDtJzHy72/Ztn?=
 =?us-ascii?Q?QWbS0Ffsm6i48GYMa91NF8/Il+V0UueGmjmYQEHaTMZE3x4T3EetyF39ZTRL?=
 =?us-ascii?Q?sN57mupbcK4fAWqemsJk7gRAcY9ujhgbi4Fwz6y2dIqQyJsnM9rdt8Cz6HTL?=
 =?us-ascii?Q?65BdEn4cE5eiV6wMW4Kqdn3PPio8VJ3KasONHFMefP9AYpF5vMV7TMIqNRrC?=
 =?us-ascii?Q?9QkbLiijIslJSMwtaE8z40Zc8R1ciu5M3l+7OdgHrWlZPygsyuwelg7JNjAM?=
 =?us-ascii?Q?wiC+gMI4sr70YAJv4GV2jdSWmdS8dOBSruZXvDGNhhqqNGQCchUOxSAVoV4a?=
 =?us-ascii?Q?qG+B6ma/pNlMe/vyJ8nkHI07JNxKEWdurzcbRl3MY0isXyCBlflOBbKzeYTO?=
 =?us-ascii?Q?W5/hAOrPrcUEIKvRHbhd2qQoCfefPQFgfxEjskHS7FA3FsHFU6tVLx0ZpSn/?=
 =?us-ascii?Q?vPZLnl3Bg3RIFiyL0sUZRK5A20CtYCsS/41WNBSbY1evYOgiwxu+3hafL04V?=
 =?us-ascii?Q?WSBZznr7gx5CSyNx55AEEo7kfrUwmzO7afO4DkRZqxU2Y09WESi3GPOIdQtJ?=
 =?us-ascii?Q?j8I9rCis+f0X6xNI/H/sB0bjispiLGLJfHM4Xjqb6zuuXAgT8YScn4Z7eKd0?=
 =?us-ascii?Q?DVtPzqIi5M3MHYPrYOkzjx7jwX6nRVxeGdV9UXt183F0ooLJwPbjfqPY8gDg?=
 =?us-ascii?Q?y7l/PNGCFmPRJuOpXjRKGlqfVkiI3KpqV7fxLq6ptgdri2u/bjPLSY4NYpkE?=
 =?us-ascii?Q?SzzY8HqwkuyrVbFpllZ8lqDid7s182wuIBxvHdNHI5Om6W5Xd9dcSkdXiiZe?=
 =?us-ascii?Q?jGNy1/kKHlKfBNZMKHcUq3GCNxaCgCLCkvX+uUNE5LV2zgJMiojmKZn7YZbJ?=
 =?us-ascii?Q?7dk6LKFEJr+iPys4mqtUbXuKarLjkD7uvioUr1+iY0EOr/RusqBkREQoSlqO?=
 =?us-ascii?Q?QKNhaqBX4etehcvQCOOrhEGifocs3YEGa1QZx9GKsO+q/jgcymuuqTjiGWyk?=
 =?us-ascii?Q?M//irEKto2/eeehRVNlKB8ik6YLMC6nAe5QxwlhynU7CWPsx5C3H+buGGIXJ?=
 =?us-ascii?Q?N+cbQTQYdl1TqmyC5Ex1RLEYsSTQbedKc/U6l5cGGT67N/RU?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB5902315E3AD01B7CCF6D19FFCFFE2PH0PR11MB5902namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	FqqBRsCqTNAZr+0eIlVqxjeH4O8kn/qiGMSjonPpDiTQTHmFFgMbiD0q3Q11DKgodSb82UWTdT8nLfChYeWQQdyOAFlkUMW1DkJFRmaFPIDp+TujL2m2bnOjo2aHAOPQzPovgqTRRr7MygrAdCiGlffsV+nS+5wrifNS3X1aKTsF9xeq0Zmj+HgzOqTAT1b7k8m/EaOt4bKR2QthLKZ49UYQ0j+JK8Q3++fMToaRNswcM4SfO1ZjH3xUKwQ6fmpMIC4Ns5uuv+gGWGf5RDs0V1eQ7LYFotNFGicS70/QEctcnASWGN96r9hOuTx8DhaJqxr2zLcJjNEPl6QTqNHA5g==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b029e646-0edd-4f1a-64f1-08dedd79997c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 05:19:06.8843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nPowlE0GW5z33Dyxl7quCeHw3k951CzzX1eLnILdlGws5YBWyP291VIshtkH6tEo2BIcTEyqdafx5C4EyYlsfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5819
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-2.cisco.com [72.163.7.163];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.163, rcdn-opgw-2.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 05:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240519

--_000_PH0PR11MB5902315E3AD01B7CCF6D19FFCFFE2PH0PR11MB5902namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for the clarification.

I have sent the updated patch for this.
https://patchwork.yoctoproject.org/project/oe-core/patch/20260709050943.673=
109-1-asparmar@cisco.com/

Regards,
Ashish
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: 07 July 2026 19:54
To: Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 <asparmar@cisco.com>; openembedded-core@lists.openembedded.org <openembedd=
ed-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH v2] bind: Upgrade 9.18.44 -> 9.18.4=
9

Hello,

On Tue Jul 7, 2026 at 3:24 PM CEST, Ashishkumar Parmar -X (asparmar - E INF=
OCHIPS PRIVATE LIMITED at Cisco) wrote:
> Thanks, Yoann.
>
> Yes, feature changes are usually not something we should take in stable.
>
> For this BIND work, I first submitted the individual CVE backport patches=
 for scarthgap:
>
> - CVE-2026-1519:
>   https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404=
.2993940-1-asparmar@cisco.com/
> - CVE-2026-5950:
>   https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404=
.2993940-2-asparmar@cisco.com/
> - CVE-2026-3592:
>   https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404=
.2993940-3-asparmar@cisco.com/
> - CVE-2026-3039:
>   https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404=
.2993940-4-asparmar@cisco.com/
> - CVE-2026-5946:
>   https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404=
.2993940-5-asparmar@cisco.com/
>
> During review, the feedback was that BIND is one of the rare projects
> where the upstream stable branch matches OE stable policy, and that
> upgrading along the 9.18 branch would be preferable to carrying a
> large CVE backport patch stack. That is why I superseded the backport
> series and sent the 9.18.44 -> 9.18.49
> upgrade instead:
>
> https://patchwork.yoctoproject.org/project/oe-core/patch/20260630060410.1=
203985-1-asparmar@cisco.com/

Sorry, I totally forgot that I was the one suggesting the upgrade.

> For the specific 9.18.45 changelog item you pointed out, the change is
> limited to ISC's upstream system test suite. It raises the Python
> requirement for running `bin/tests/system` and tracks those test-suite
> Python dependencies in `bin/tests/system/requirements.txt`.
>
> OE-Core's `bind` recipe does not enable or package that upstream
> system test suite and does not inherit `ptest`, so this change is not
> part of the target build, installed packages, runtime dependencies, or
> runtime behavior.
>
> So the reason for the upgrade is that it follows the earlier review
> direction to use the BIND 9.18 stable branch, while this particular
> feature change is test-suite-only and not target-visible in OE-Core.

I agree with proceeding with the upgrade.
Can you put a shorter explanation of the above in your commit message to
help future reviewer?

Thanks!

>
> Regards,
> Ashish
> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: 07 July 2026 15:49
> To: Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisc=
o) <asparmar@cisco.com>; openembedded-core@lists.openembedded.org <openembe=
dded-core@lists.openembedded.org>
> Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
> Subject: Re: [OE-core][scarthgap][PATCH v2] bind: Upgrade 9.18.44 -> 9.18=
.49
>
> On Tue Jun 30, 2026 at 8:04 AM CEST, Ashishkumar Parmar X (asparmar - E I=
NFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>> From: Ashishkumar Parmar <asparmar@cisco.com>
>>
>> This upgrade fixes CVE-2026-1519, CVE-2026-3039, CVE-2026-3592, CVE-2026=
-5946 and CVE-2026-5950.
>>
>> Changelog
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>> https://downloads.isc.org/isc/bind9/9.18.49/doc/arm/html/notes.html
>
> That changelog contains:
> | Notes for BIND 9.18.45
> |   Feature Changes
> |    Update requirements for system test suite.
> |      Python 3.10 or newer is now required for running the system test
> |      suite. The required Python packages and their version requirements
> |      are now tracked in the file bin/tests/system/requirements.txt. [GL
> |      #5690] [GL #5614]
>
> Feature changes are not usually acceptable for stable. Can you justify
> why this is the case here?
>
> Thanks!
>
>>
>> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
>> ---
>>  .../bind/{bind_9.18.44.bb =3D> bind_9.18.49.bb}                   | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta/recipes-connectivity/bind/{bind_9.18.44.bb =3D> bind_9.18.4=
9.bb} (97%)
>>
>> diff --git a/meta/recipes-connectivity/bind/bind_9.18.44.bb b/meta/recip=
es-connectivity/bind/bind_9.18.49.bb
>> similarity index 97%
>> rename from meta/recipes-connectivity/bind/bind_9.18.44.bb
>> rename to meta/recipes-connectivity/bind/bind_9.18.49.bb
>> index d424edcb4e..723a09e739 100644
>> --- a/meta/recipes-connectivity/bind/bind_9.18.44.bb
>> +++ b/meta/recipes-connectivity/bind/bind_9.18.49.bb
>> @@ -20,7 +20,7 @@ SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BPN=
}-${PV}.tar.xz \
>>             file://0001-avoid-start-failure-with-bind-user.patch \
>>             "
>>
>> -SRC_URI[sha256sum] =3D "81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274a=
bf73f5b5389a6f82d"
>> +SRC_URI[sha256sum] =3D "c43ce4548ebed788cd9df63658a7de105ceafba43fcd63f=
a352b1093e525cd24"
>>
>>  UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
>>  # follow the ESV versions divisible by 2
>
>
> --
> Yoann Congal
> Smile ECS


--
Yoann Congal
Smile ECS


--_000_PH0PR11MB5902315E3AD01B7CCF6D19FFCFFE2PH0PR11MB5902namp_
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
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for the clarification.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I have sent the updated patch for this.&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/2026070=
9050943.673109-1-asparmar@cisco.com/">https://patchwork.yoctoproject.org/pr=
oject/oe-core/patch/20260709050943.673109-1-asparmar@cisco.com/</a></div>
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
Ashish</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> 07 July 2026 19:54<br>
<b>To:</b> Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at=
 Cisco) &lt;asparmar@cisco.com&gt;; openembedded-core@lists.openembedded.or=
g &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH v2] bind: Upgrade 9.18.44 -&=
gt; 9.18.49</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hello,<br>
<br>
On Tue Jul 7, 2026 at 3:24 PM CEST, Ashishkumar Parmar -X (asparmar - E INF=
OCHIPS PRIVATE LIMITED at Cisco) wrote:<br>
&gt; Thanks, Yoann.<br>
&gt;<br>
&gt; Yes, feature changes are usually not something we should take in stabl=
e.<br>
&gt;<br>
&gt; For this BIND work, I first submitted the individual CVE backport patc=
hes for scarthgap:<br>
&gt;<br>
&gt; - CVE-2026-1519:<br>
&gt;&nbsp;&nbsp; <a href=3D"https://patchwork.yoctoproject.org/project/oe-c=
ore/patch/20260610100404.2993940-1-asparmar@cisco.com/">
https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404.299=
3940-1-asparmar@cisco.com/</a><br>
&gt; - CVE-2026-5950:<br>
&gt;&nbsp;&nbsp; <a href=3D"https://patchwork.yoctoproject.org/project/oe-c=
ore/patch/20260610100404.2993940-2-asparmar@cisco.com/">
https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404.299=
3940-2-asparmar@cisco.com/</a><br>
&gt; - CVE-2026-3592:<br>
&gt;&nbsp;&nbsp; <a href=3D"https://patchwork.yoctoproject.org/project/oe-c=
ore/patch/20260610100404.2993940-3-asparmar@cisco.com/">
https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404.299=
3940-3-asparmar@cisco.com/</a><br>
&gt; - CVE-2026-3039:<br>
&gt;&nbsp;&nbsp; <a href=3D"https://patchwork.yoctoproject.org/project/oe-c=
ore/patch/20260610100404.2993940-4-asparmar@cisco.com/">
https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404.299=
3940-4-asparmar@cisco.com/</a><br>
&gt; - CVE-2026-5946:<br>
&gt;&nbsp;&nbsp; <a href=3D"https://patchwork.yoctoproject.org/project/oe-c=
ore/patch/20260610100404.2993940-5-asparmar@cisco.com/">
https://patchwork.yoctoproject.org/project/oe-core/patch/20260610100404.299=
3940-5-asparmar@cisco.com/</a><br>
&gt;<br>
&gt; During review, the feedback was that BIND is one of the rare projects<=
br>
&gt; where the upstream stable branch matches OE stable policy, and that<br=
>
&gt; upgrading along the 9.18 branch would be preferable to carrying a<br>
&gt; large CVE backport patch stack. That is why I superseded the backport<=
br>
&gt; series and sent the 9.18.44 -&gt; 9.18.49<br>
&gt; upgrade instead:<br>
&gt;<br>
&gt; <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/20=
260630060410.1203985-1-asparmar@cisco.com/">
https://patchwork.yoctoproject.org/project/oe-core/patch/20260630060410.120=
3985-1-asparmar@cisco.com/</a><br>
<br>
Sorry, I totally forgot that I was the one suggesting the upgrade.<br>
<br>
&gt; For the specific 9.18.45 changelog item you pointed out, the change is=
<br>
&gt; limited to ISC's upstream system test suite. It raises the Python<br>
&gt; requirement for running `bin/tests/system` and tracks those test-suite=
<br>
&gt; Python dependencies in `bin/tests/system/requirements.txt`.<br>
&gt;<br>
&gt; OE-Core's `bind` recipe does not enable or package that upstream<br>
&gt; system test suite and does not inherit `ptest`, so this change is not<=
br>
&gt; part of the target build, installed packages, runtime dependencies, or=
<br>
&gt; runtime behavior.<br>
&gt;<br>
&gt; So the reason for the upgrade is that it follows the earlier review<br=
>
&gt; direction to use the BIND 9.18 stable branch, while this particular<br=
>
&gt; feature change is test-suite-only and not target-visible in OE-Core.<b=
r>
<br>
I agree with proceeding with the upgrade.<br>
Can you put a shorter explanation of the above in your commit message to<br=
>
help future reviewer?<br>
<br>
Thanks!<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Ashish<br>
&gt; ________________________________<br>
&gt; From: Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
&gt; Sent: 07 July 2026 15:49<br>
&gt; To: Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at C=
isco) &lt;asparmar@cisco.com&gt;; openembedded-core@lists.openembedded.org =
&lt;openembedded-core@lists.openembedded.org&gt;<br>
&gt; Cc: xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.com=
&gt;<br>
&gt; Subject: Re: [OE-core][scarthgap][PATCH v2] bind: Upgrade 9.18.44 -&gt=
; 9.18.49<br>
&gt;<br>
&gt; On Tue Jun 30, 2026 at 8:04 AM CEST, Ashishkumar Parmar X (asparmar - =
E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<br>
&gt;&gt; From: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
&gt;&gt;<br>
&gt;&gt; This upgrade fixes CVE-2026-1519, CVE-2026-3039, CVE-2026-3592, CV=
E-2026-5946 and CVE-2026-5950.<br>
&gt;&gt;<br>
&gt;&gt; Changelog<br>
&gt;&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; <a href=3D"https://downloads.isc.org/isc/bind9/9.18.49/doc/arm/htm=
l/notes.html">
https://downloads.isc.org/isc/bind9/9.18.49/doc/arm/html/notes.html</a><br>
&gt;<br>
&gt; That changelog contains:<br>
&gt; | Notes for BIND 9.18.45<br>
&gt; |&nbsp;&nbsp; Feature Changes<br>
&gt; |&nbsp;&nbsp;&nbsp; Update requirements for system test suite.<br>
&gt; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Python 3.10 or newer is now required f=
or running the system test<br>
&gt; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; suite. The required Python packages an=
d their version requirements<br>
&gt; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; are now tracked in the file bin/tests/=
system/requirements.txt. [GL<br>
&gt; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #5690] [GL #5614]<br>
&gt;<br>
&gt; Feature changes are not usually acceptable for stable. Can you justify=
<br>
&gt; why this is the case here?<br>
&gt;<br>
&gt; Thanks!<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp; .../bind/{bind_9.18.44.bb =3D&gt; bind_9.18.49.bb}&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | 2 +-<br>
&gt;&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;&nbsp; rename meta/recipes-connectivity/bind/{bind_9.18.44.bb =3D&g=
t; bind_9.18.49.bb} (97%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-connectivity/bind/bind_9.18.44.bb b/meta=
/recipes-connectivity/bind/bind_9.18.49.bb<br>
&gt;&gt; similarity index 97%<br>
&gt;&gt; rename from meta/recipes-connectivity/bind/bind_9.18.44.bb<br>
&gt;&gt; rename to meta/recipes-connectivity/bind/bind_9.18.49.bb<br>
&gt;&gt; index d424edcb4e..723a09e739 100644<br>
&gt;&gt; --- a/meta/recipes-connectivity/bind/bind_9.18.44.bb<br>
&gt;&gt; +++ b/meta/recipes-connectivity/bind/bind_9.18.49.bb<br>
&gt;&gt; @@ -20,7 +20,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://ftp.i=
sc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; <a href=3D"file://0001-avoid-start-failure-with-bind-user.patch">file=
://0001-avoid-start-failure-with-bind-user.patch</a> \<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRC_URI[sha256sum] =3D &quot;81f5035a25c576af1a93f0061cf70bde6d00=
a0c7bd1274abf73f5b5389a6f82d&quot;<br>
&gt;&gt; +SRC_URI[sha256sum] =3D &quot;c43ce4548ebed788cd9df63658a7de105cea=
fba43fcd63fa352b1093e525cd24&quot;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp; UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://ftp.isc.org/=
isc/bind9/">https://ftp.isc.org/isc/bind9/</a>&quot;<br>
&gt;&gt;&nbsp; # follow the ESV versions divisible by 2<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Yoann Congal<br>
&gt; Smile ECS<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR11MB5902315E3AD01B7CCF6D19FFCFFE2PH0PR11MB5902namp_--

