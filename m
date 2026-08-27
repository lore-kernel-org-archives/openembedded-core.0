Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA7FC61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 10:51:24 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33806.1787827875621944361
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 03:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=goaBYViO;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12941; q=dns/txt;
  s=iport01; t=1787827875; x=1789037475;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=ne6RHYdbJWDQCeGSLNck/G5sFLHa555qFxSSxWLgPCc=;
  b=goaBYViOdNtU6sVTDFlOnRx1IQ+bq2zxO+q61mNmpMb8DFU626++2smP
   SSmbPEMDuxc0KO9wUCWgQd2afswBoovEr/oJdg5GbiZzGX6pZjgTc2sHc
   fNiAwfoYFqQslyWHsmMjU7TUdd4bqxlp5s69UYJDoi/YSI8I07K6+XY7/
   o5+3djtf7iJhM+OnLJT0qx6h32w9NFdeVrXgtrAY4yJOi0gsx8w93Ai42
   XOQRZbjt/frXOYZL5rjZYcij5iknfcyVt/ww3qzp94NtJc73xXBuHQd7R
   akDyS80rK6ivK/DH4RUxBW5l00YanO1PhEWjX4LvnMkHyDPCNJdSCei39
   w==;
X-CSE-ConnectionGUID: DLA6E2huR7Ci8CZtqO8nvw==
X-CSE-MsgGUID: 3ttzXWlsQdKMzvgumh3mGg==
X-IPAS-Result: =?us-ascii?q?A0BDBABPFZBq/5L/Ja1QCh4BAQsSDGWBIAuBPQEwU4EIA?=
 =?us-ascii?q?oEhSQSIHwOFK4ZYgiEDnhuBdAoPAQEBDQEBLgEbBwQBAYUFAo1uAiY1CA4BA?=
 =?us-ascii?q?gQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAQEBAwFKATILA?=
 =?us-ascii?q?gEIEQQBAQEuJwodCAIEARIIgnuCHRZBAwECDga0cgKKHHiBNIEBgygBPwICQ?=
 =?us-ascii?q?AHcDBWBOIU/gwMbAQEFJUlsgl2BIxgBG4RhJxsbgXKBV4IxOD6BBYFcAgEBA?=
 =?us-ascii?q?ReBGQQrhBOCMASCInoSG4IxJIFUhm4DiDJSciIDJjMsAVUTFwsHBYEjEDMDK?=
 =?us-ascii?q?i8tI0sFLR1wDCcSDx0XFx5YGwYFEiAqQUQjAz6BGUECgXU/Ixk2fIEJXoErK?=
 =?us-ascii?q?WECEBdGLhWCBwKCWoEnXgIBSUMOB0dDC209NwYPGQMEgTUFjgMHWx+BWwlqP?=
 =?us-ascii?q?SQaCQoBKQJPAYEzEBkGCwsvkmOPYIQdikOTZIEzCiiDdowijT6IMheEBIFXi?=
 =?us-ascii?q?z2YLoEmmQgjgjaLMZVghS4CBAIEBQIQAQEGgWoCOIFZcBWCbgEBMgkKDDQZD?=
 =?us-ascii?q?1aPZYFohROBLcVZeQIBCDIBAQcCBw4DC4FokACBfgEB?=
IronPort-PHdr: A9a23:g5uy1RRXOoNBg6E/wA/OL7mGDNpso47LVj580XJvo6hFfqLm+IztI
 wmEo/5sl1TOG47c7qEMh+nXtvX4UHcbqdaasX8EeYBRTRJNl8gMngIhDcLEQU32JfLndWo7S
 exJVURu+DewNk09JQ==
IronPort-Data: A9a23:svkhhqwepziIS6vw+sh6t+dsxyrEfRIJ4+MujC+fZmUNrF6WrkVRm
 zRLWjjTOKuMY2HweYhzOdvi8UwEvJTSyYAyHAdsqlhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaD1MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJG0SFNM1oOZqOz5l9
 KwzGiwUSUCFmf3jldpXSsE07igiBNPgMIVavjRryivUSK53B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPXWjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCwaoOFIYXTH509ckCw/
 X7a7VTGBgojOP+62ySK73es3ergknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVy4PTyVKb5ots8peqSEW6
 2JlVujBXFRHmLaUUnmasLyTqFuP1eI9dAfuuQdsodM53uTe
IronPort-HdrOrdr: A9a23:rb4WBKwZEcyQ11ufKjrfKrPxJegkLtp133Aq2lEZdPULSL36qy
 n+ppQmPEHP6Qr5AEtQ5uxoWJPtfZquz+8K3WBxB8bvYOCIghrSEGgP1/qH/9SkIVyDygc/79
 YuT0EdMqyLMbESt6+Ti2fIcadE/DDEytHUuQ609QYKcegeUdAZ0+4PMHfjLqQZfnggObMJUL
 Cnyo5soT2mdX4LbsK9KEUkcoH4zeHjpdbNWzJDIwQoxjWvoFqThYLSIly1zx0eWzRAzfMY93
 TZkwv236Ons/uq4B7R3W3e4v1t6ZXcI914a/Cku4wwEHHBmwyobINuV/mppzYuutyi714sjZ
 3lvwogF94b0QKQQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINidAfD4UZIhqA+7E
 sL5RPai3NkN2KFoM3P3amOa/isrDvznZMWq59Xs5WYa/pGVFYel/1GwKofKuZwIMuz0vFWLA
 ApNrCc2N9mNXWHcnveom5jhPaoXng1A1O6Z3JqgL3P79CT90oJknfxA6ck7y09HJ5Rceg228
 3Udqtvj71AVckQcOZ0A/oAW9K+DijXTQvLK3/6GyWtKEgrAQOFl3fM2sR82Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmJlG6ArETmmxVSnkjpg23ek1hpTsAL7wdSGTQlEnlMWt5/0ZH83AQv
 62fJZbGeXqI2fiEZtAmwf+R55RI38DV9B9gKdwZ3ue5sbQboH6vO3Sd/jeYLLrDDY/Q2v6Rm
 AOWTDiTf8wmHxDmkWI9yQ5d0mdDnAXp6gAYpQy19JjvbQwCg==
X-Talos-CUID: =?us-ascii?q?9a23=3AxItot2sx0+5g8HFxb1SfPYd56IsJVlSD4S3QPnX?=
 =?us-ascii?q?nImc5Y4+JUHjA/r17xp8=3D?=
X-Talos-MUID: 9a23:r6Qf3QYm0myKQ+BT7CPwlgFdMNxR74eLGl4CjJAG4MyrOnkl
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Aug 2026 10:51:14 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 68BE818000227
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 10:51:14 +0000 (GMT)
X-CSE-ConnectionGUID: 85DiyJQRRa65uxqa3nW+5Q==
X-CSE-MsgGUID: +1qLCWS3RwiHzYfcu3FKkg==
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,246,1779148800"; 
   d="scan'208,217";a="78131241"
Received: from mail-westcentralusazon11013033.outbound.protection.outlook.com (HELO CY3PR05CU001.outbound.protection.outlook.com) ([40.93.201.33])
  by rcdn-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Aug 2026 10:51:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H95tTBLk5jvK4+NLTmvxd4wkC4iJWMS7A7aumwaTdjRJjjg9F7GulNO7BxEmbqsbIFvaHXdybDrNC3GCTA/VnL9OMxnr+UgtOOFNxja8OFVsYBZfNWUQD6tLMWySohpU/fNRUS7mGohSTv34T4Wn/D5w1HfIX7atda+HRGwREkTEgKDQLslaVoL80k2n/ePFESeX+qHE4XCQiyE2iqVb9v9zXqrE/wSK68GTKeRcNlrieDvpeGc5A6Fa7y72JjKk0lmQdg2ILcmVXaMT2OJ3Dm/sfyfDKUqbPelmOUiTGRVXXKe9yzEWfN//8W3vVRZp0tLkN1q9StjbRD2kbTsWrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ne6RHYdbJWDQCeGSLNck/G5sFLHa555qFxSSxWLgPCc=;
 b=hHB8E6pS/Q84KNM3ogmfvl/BiR2z4p3eUC7CMAK3Ueic2PsFNepEDNkYzD010hG5aN/6eHvkrUpw28xzPPXnYpJxgsHJLnU+xr6E7QD2EC8Nxb5w4+BydJdTazBD5wMY7Lo9HR7/vWoX46+DsNqkGsVtbqp7IhfHyFIW0RZofHCbCGQLp2zJpLd7RFvfmNjrv2jIe6pvmMbyvN6vP5tEj2GEw1zgnu5MxuNzi9yYepxXJ+41BiLtOahxrCabYp1oJu8owXsEOYa0Lez/sibrOQB7QGjKGc8xJOPfdAUzYfsbvOpAdaLGvt5Qt9UEX3TDRI5cyf+odVqwI/1OMUF1vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4SPRMB0074.namprd11.prod.outlook.com (2603:10b6:8:1cc::23) by
 CH3PR11MB7324.namprd11.prod.outlook.com (2603:10b6:610:14f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Thu, 27 Aug
 2026 10:51:10 +0000
Received: from DM4SPRMB0074.namprd11.prod.outlook.com
 ([fe80::6a69:dea7:cb45:38c7]) by DM4SPRMB0074.namprd11.prod.outlook.com
 ([fe80::6a69:dea7:cb45:38c7%5]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 10:51:09 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 1/8] curl: fix CVE-2026-8286
Thread-Topic: [OE-core][wrynose][PATCH 1/8] curl: fix CVE-2026-8286
Thread-Index: AQHdNKMFI7aH0E9JJ0WTCvBKYHjJyLawAmRBgAF1zYCAAEJaMQ==
Date: Thu, 27 Aug 2026 10:51:09 +0000
Message-ID: 
 <DM4SPRMB0074221ACE7E0C08819C0E48C4AD2@DM4SPRMB0074.namprd11.prod.outlook.com>
References: <20260805083103.2633995-1-deeratho@cisco.com>
 <20260805083103.2633995-2-deeratho@cisco.com>
 <DKY47YY3L5UE.1DLQ2RS87JLFQ@smile.fr>
 <DM4SPRMB0074234D2F9F4B5F7D54EA6CC4AE2@DM4SPRMB0074.namprd11.prod.outlook.com>
 <DKZJ0ZDGIXW1.2LVIG3CITIMIS@smile.fr>
In-Reply-To: <DKZJ0ZDGIXW1.2LVIG3CITIMIS@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4SPRMB0074:EE_|CH3PR11MB7324:EE_
x-ms-office365-filtering-correlation-id: 0eaf07ec-16cd-4103-3b1d-08df04291ab6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|13003099007|38070700021|10067099003|56012099006|11063799006|4143699003|8096899003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 lHjL9kxuJbzh0WBl3g91Zrn2TUu0XmD9J1hXPV26VXcYAUu660LXGwp41qv4bX79vWjUJbxPeeU4GJeLptsU/z3+z1JDYg1ZJkvnuHN9KNtCV6TEeo60wSxyhZHkWD5a4Ac91jRlNdVFu3o1m+NcXKQDZOXrHHDfKkGxHNB//Re3C95STuDfTdddxhkcpcIEsy6Pd9yZDTn9oYX199+AGKiewNQ2tqwTF85bjYbSSbQyGL1kjc0zS0vZTwVUOvX0sTmT5Nuv9vJ5HUuQfL11nQFbnh7qxIwabs78wi+EvihKBClFKHypTeGJIlZv/m7QDvIk+lbwdHhPdd6em7LApKTHmmJRxftccQfUp7DUdSqUgeEXJm6XP4sKaHKiL/dEIbFPCM1JAFSgw7oqfqru6YLlwDn0/5bdbQ3dkEFz6DFTkJeVFcSuAlNi7hphMk5Z0l2moFr8lsZIxGKL8+2RuhvDSALZmaXdVYfYZADjM/h5WmPcWSKBV+R9bFDVYAdMru+rhU1/mJNRDPRGqtlkXqVPLXcKykGbDjIeWkq9VoJNd1rrj6fZo3wDHkJt8ByxPT4tD142lZSJY1hO7SMhIUJzz6qqoUOu4mKrvhU8MfQDjuBUuZsdYOybCzkGXlIGIqnGAt2WsHoX2s/oECkanTuyEbTlMbHLB1EAwQSWyag=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4SPRMB0074.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(13003099007)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(8096899003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?2Iyp705HNxRh1aaD9/zvv3HvcUkJqEje8b7R/XpkxXqdYVdwOXgxf8lxMRWa?=
 =?us-ascii?Q?jwyqzmNnVY3HcFfqIEK8QQaX+ZJ5TQ0buJYXugj7OGQwOjfOrobQw6FRvX0C?=
 =?us-ascii?Q?2Q9BKfivsyDpFLcqPuDCXjBtcYjxWelW4ecgKVgNxipAWAb3YEmzR9XUWSgo?=
 =?us-ascii?Q?B994Iy4d3k8VeRGuMinydYQzWR7ixBBzI+/wvzwge+3ThWF77vTQOKIrNbLc?=
 =?us-ascii?Q?Vodmy3fSFWzZMfRq1Xj4IBVco66BFFCTGUoBNj8QkV86WkvnXS7RiMwZjsva?=
 =?us-ascii?Q?4AG4Fe5s2D9KQpZaknNf+Y9UKDPCqmJCjP0JGjjF2d5E9xeQEbX12VVAp4EV?=
 =?us-ascii?Q?8AmiskGT2zzd3NGWkmqCSyoZ9g7p5A0IH0OEfyC93JSElg1DKPvNB6lpO+KU?=
 =?us-ascii?Q?6XS2FVUxaR6ktqF4KHWFj8opoES82Fulobo7U81KktljhA1oZT3kVMsOe7lI?=
 =?us-ascii?Q?NDS68id27+eH6mo/fKEYdgNIYx7mMJvEpLR/9qVXaueVSlN+nLOJl5E4K93x?=
 =?us-ascii?Q?byxABHmOCZX/A+I1GbjZlcFoS7qXZNVaHzFlzj+TCAi9dUZqD1g+A6hXA3FK?=
 =?us-ascii?Q?R2+FcTDsZ6oynzqElqRmuwcrnuIR4S/uSJtHXBrAMxrbKdjmXEf1uv3T+fp9?=
 =?us-ascii?Q?SweNf4lTukiHamnAMnKmIpBLgtbLVO6hExV3+E/graEAh9TnyGwbyF/9WwYz?=
 =?us-ascii?Q?YwadfwkFach4mAcJfkR7BlSDT+FIDh9NqwNetDGkgfFktcUbptemoz2Bg4JV?=
 =?us-ascii?Q?sqp8DPd69WRaAQdf+hWEpcmQ8F2pUUefaQKPhcXYap4B1oDCks86B5rwO+7v?=
 =?us-ascii?Q?J6+IS1S/wd+ktRBWHDDBuN+qmppVRFrYRLrIoOjnb0IhFvb+7/L4pbvCt2U1?=
 =?us-ascii?Q?+Gks674ONpY7M2Y/mnfGxRkmYsim4124ikNiM8pvv4OAXFcXLn4P4P9Nf9qD?=
 =?us-ascii?Q?mnxhotOqt4/Sz7zbGiK/wwi0JL9bGAXByFijgqoq7jC0EQKucOwXz4cYekEk?=
 =?us-ascii?Q?mtITgMI+92Nak2iGEaoC24rrAQSljEJQ1/nD+yVwDCs2p8ia3ROKWEV3KaO1?=
 =?us-ascii?Q?cf9s0Hw2SsY62TBb5Qe4dkDR+a2SRQMBRB9+aIB1PTCoWmNKdatYwAO35zVI?=
 =?us-ascii?Q?e/qH85BLLKPW6wwJe+TH2y9TNZX0MoyIlwDYnH+KQxX/YoDDj4IdakaA3S53?=
 =?us-ascii?Q?5fExuR5Iknfb7VYZEbaOaa809i6fTnx92in4qQZQ8zh1ExooERbGyR88rB+Z?=
 =?us-ascii?Q?uPjLzuobQfsKEKWgIsEykNh026e1QI3fxlR3G77NJKDjkGz1iSon/veTNNAk?=
 =?us-ascii?Q?5Z3W9oveCzTmFWVTEXx+vFPNJcOe/nCkBx4XBhNFnJxBZnp9gfXn5jIsdEfJ?=
 =?us-ascii?Q?Q2RPg5O1ZTzuXFp8Rnf7iJggk7qPmjiXK/tlmUUqc6Dq39nxAPViA/L/oz63?=
 =?us-ascii?Q?wKu7ZfPfG7YKYfxQR4Wpe5yFukal76ej/roaGBmRPBVswikRVWjlyI0lTIpJ?=
 =?us-ascii?Q?IchKjR6BhFV5gxTq0PEojL9Gycz9nQNe8tozRNlqWN2Q0XwY2wCrlWA0FPRq?=
 =?us-ascii?Q?IO8himoekjCjwtpasPZLml3RAj6bgPg4l4Hgpt5w6T7qNTSgbsxXrV7XLG8n?=
 =?us-ascii?Q?UCStXgz37gGYS2syYVIMx9ua6foWHtBi8v+zz06F7mKbpWhvuAEjiFxHRU8a?=
 =?us-ascii?Q?65//GRc71RGrv3MU6QlSBhYQwVkCkfd2fsOo9r/mHQXLWwOF?=
Content-Type: multipart/alternative;
	boundary="_000_DM4SPRMB0074221ACE7E0C08819C0E48C4AD2DM4SPRMB0074namprd_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	kKcY06NVSBgUitVMm6SFfNY6ip0QWgNljj1/Qg+RR7yMhcs7vw/q5kBW1tInDyjzsEQNqVpidiyI9puAg3NVtf3yp9PI0kQeUqTCALvD5OaZZN4ojnGtU80tqfYiegyh/MAn3R1aWNffkppzs4e8mYbL0izDJcyOkGmqvGtgDsFKECQdGtAydElJ2k2JtJCq0QC2pFb7uhVD/smI35xABnn9PM0FzuClmWc/7BT58h2+CQKy04idq+R3BarP78Ngarha9VeIZTmUWCjkuNGiRwburjpaN8wRIhTGwpdytKu5LA4c81gI7pOZbZ9WnrfqFShyIyGRS+/ngEysOv6r6w==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4SPRMB0074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eaf07ec-16cd-4103-3b1d-08df04291ab6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 10:51:09.8051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wrZPz26eWro1/O9AYS6EQSrTElzEHVvfVBNUdoeeWDu90piU5eDt19s2XThDFtBtVvrl0E5dEhHsUwipvWBCbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7324
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-3.cisco.com [72.163.7.164];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 10:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244473

--_000_DM4SPRMB0074221ACE7E0C08819C0E48C4AD2DM4SPRMB0074namprd_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks, Yoann, for the update!!

Regards,
Deepak
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Thursday, August 27, 2026 12:23 PM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 1/8] curl: fix CVE-2026-8286

On Wed Aug 26, 2026 at 10:47 AM CEST, Deepak Rathore -X (deeratho - E INFOC=
HIPS PRIVATE LIMITED at Cisco) wrote:
> Hi Yoann,
> Thank you for your review and feedback.
> These patches were originally prepared on top of the curl CVE fix
> series that is currently under review and already present in the
> wrynose/wrynose-nut review branches:
>
>   *
> curl: fix CVE-2026-4873 - openembedded-core-contrib - OpenEmbedded Core u=
ser contribution trees<https://git.openembedded.org/openembedded-core-contr=
ib/commit/?h=3Dstable/wrynose-nut&id=3D7e44b94a57a1b7d9ec043554fb7f1f4c3fbf=
bbaf>
>   *
> [wrynose,v4] curl: fix CVE-2026-4873 - Patchwork<https://patchwork.yoctop=
roject.org/project/oe-core/patch/20260731061427.14543-1-deeratho@cisco.com/=
>
>
> Because the remaining curl CVE patches in this series were developed
> on top of that patch, rebasing everything on the current wrynose
> review branch would require additional rebasing work once
> CVE-2026-4873 is merged. If you apply current curl patches on top of
> this CVE-2026-4873 fix, then there will be no build failure. Could you
> please advise on the preferred approach in this situation?
> I appreciate your guidance.
> Regards,
> Deepak Rathore

Ok, there was a bad interaction with other curl patches in my series but
those are gone now.
So, this series does apply cleanly and I've added it to my review
branch.

Thanks!

> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: Tuesday, August 25, 2026 8:34 PM
> To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <=
deeratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded=
-core@lists.openembedded.org>
> Subject: Re: [OE-core][wrynose][PATCH 1/8] curl: fix CVE-2026-8286
>
> On Wed Aug 5, 2026 at 10:30 AM CEST, Deepak Rathore via lists.openembedde=
d.org wrote:
>> From: Deepak Rathore <deeratho@cisco.com>
>>
>> This patch applies the upstream curl security fix backport for
>> CVE-2026-8286. The upstream fix commit is referenced in [1],
>> and the public curl advisory is referenced in [2]. The backported
>> commit link is also recorded in the embedded patch header.
>>
>> [1] https://github.com/curl/curl/commit/a86efdd7ca5433de9231e650f18247de=
8319ad16
>> [2] https://curl.se/docs/CVE-2026-8286.html
>>
>> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>> ---
>>  .../curl/curl/CVE-2026-8286.patch             | 81 +++++++++++++++++++
>>  meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
>>  2 files changed, 82 insertions(+)
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8286.patch
>
> Hello,
>
> This series does not apply on top of the review branch anymore:
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/wr=
ynose-review
> |ERROR: curl-8.19.0-r0 do_patch: Applying patch '.../wrynose/bitbake-buil=
ds/poky-wrynose/layers/openembedded-core/meta/recipes-support/curl/curl/CVE=
-2026-8927.patch' on target directory '.../wrynose/bitbake-builds/poky-wryn=
ose/build/tmp/work/x86-64-v3-poky-linux/curl/8.19.0/sources/curl-8.19.0'
> |CmdError('quilt --quiltrc .../wrynose/bitbake-builds/poky-wrynose/build/=
tmp/work/x86-64-v3-poky-linux/curl/8.19.0/recipe-sysroot-native/etc/quiltrc=
 push', 0, 'stdout: Applying patch CVE-2026-8927.patch
> |patching file lib/url.c
> |patching file lib/urldata.h
> |patching file tests/data/Makefile.am
> |Hunk #1 FAILED at 218.
> |1 out of 1 hunk FAILED -- rejects in file tests/data/Makefile.am
> |patching file tests/data/test1647
> |patching file tests/libtest/Makefile.inc
> |Hunk #1 FAILED at 100.
> |1 out of 1 hunk FAILED -- rejects in file tests/libtest/Makefile.inc
> |patching file tests/libtest/lib1647.c
> |Patch CVE-2026-8927.patch does not apply (enforce with -f)
> |
> |stderr: ')
> |ERROR: Logfile of failure stored in: .../wrynose/bitbake-builds/poky-wry=
nose/build/tmp/work/x86-64-v3-poky-linux/curl/8.19.0/temp/log.do_patch.4688=
48
> |ERROR: Task (.../wrynose/bitbake-builds/poky-wrynose/layers/openembedded=
-core/meta/recipes-support/curl/curl_8.19.0.bb:do_patch) failed with exit c=
ode '1'
>
> Can you please rebase and send a v2?
>
> Please note that there are other pending curl CVE patches, I'd recommand
> reviewing/testing patches to identify conflict at the earliest.
>
> Thanks!
> --
> Yoann Congal
> Smile ECS


--
Yoann Congal
Smile ECS


--_000_DM4SPRMB0074221ACE7E0C08819C0E48C4AD2DM4SPRMB0074namprd_
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
Thanks, Yoann, for the update!!</div>
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
<b>Sent:</b> Thursday, August 27, 2026 12:23 PM<br>
<b>To:</b> Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cis=
co) &lt;deeratho@cisco.com&gt;; openembedded-core@lists.openembedded.org &l=
t;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH 1/8] curl: fix CVE-2026-8286</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed Aug 26, 2026 at 10:47 AM CEST, Deepak Ratho=
re -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) wrote:<br>
&gt; Hi Yoann,<br>
&gt; Thank you for your review and feedback.<br>
&gt; These patches were originally prepared on top of the curl CVE fix<br>
&gt; series that is currently under review and already present in the<br>
&gt; wrynose/wrynose-nut review branches:<br>
&gt;<br>
&gt;&nbsp;&nbsp; *<br>
&gt; curl: fix CVE-2026-4873 - openembedded-core-contrib - OpenEmbedded Cor=
e user contribution trees&lt;<a href=3D"https://git.openembedded.org/openem=
bedded-core-contrib/commit/?h=3Dstable/wrynose-nut&amp;id=3D7e44b94a57a1b7d=
9ec043554fb7f1f4c3fbfbbaf">https://git.openembedded.org/openembedded-core-c=
ontrib/commit/?h=3Dstable/wrynose-nut&amp;id=3D7e44b94a57a1b7d9ec043554fb7f=
1f4c3fbfbbaf</a>&gt;<br>
&gt;&nbsp;&nbsp; *<br>
&gt; [wrynose,v4] curl: fix CVE-2026-4873 - Patchwork&lt;<a href=3D"https:/=
/patchwork.yoctoproject.org/project/oe-core/patch/20260731061427.14543-1-de=
eratho@cisco.com/">https://patchwork.yoctoproject.org/project/oe-core/patch=
/20260731061427.14543-1-deeratho@cisco.com/</a>&gt;<br>
&gt;<br>
&gt; Because the remaining curl CVE patches in this series were developed<b=
r>
&gt; on top of that patch, rebasing everything on the current wrynose<br>
&gt; review branch would require additional rebasing work once<br>
&gt; CVE-2026-4873 is merged. If you apply current curl patches on top of<b=
r>
&gt; this CVE-2026-4873 fix, then there will be no build failure. Could you=
<br>
&gt; please advise on the preferred approach in this situation?<br>
&gt; I appreciate your guidance.<br>
&gt; Regards,<br>
&gt; Deepak Rathore<br>
<br>
Ok, there was a bad interaction with other curl patches in my series but<br=
>
those are gone now.<br>
So, this series does apply cleanly and I've added it to my review<br>
branch.<br>
<br>
Thanks!<br>
<br>
&gt; ________________________________<br>
&gt; From: Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
&gt; Sent: Tuesday, August 25, 2026 8:34 PM<br>
&gt; To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco=
) &lt;deeratho@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;=
openembedded-core@lists.openembedded.org&gt;<br>
&gt; Subject: Re: [OE-core][wrynose][PATCH 1/8] curl: fix CVE-2026-8286<br>
&gt;<br>
&gt; On Wed Aug 5, 2026 at 10:30 AM CEST, Deepak Rathore via lists.openembe=
dded.org wrote:<br>
&gt;&gt; From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt;&gt;<br>
&gt;&gt; This patch applies the upstream curl security fix backport for<br>
&gt;&gt; CVE-2026-8286. The upstream fix commit is referenced in [1],<br>
&gt;&gt; and the public curl advisory is referenced in [2]. The backported<=
br>
&gt;&gt; commit link is also recorded in the embedded patch header.<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://github.com/curl/curl/commit/a86efdd7ca5433d=
e9231e650f18247de8319ad16">
https://github.com/curl/curl/commit/a86efdd7ca5433de9231e650f18247de8319ad1=
6</a><br>
&gt;&gt; [2] <a href=3D"https://curl.se/docs/CVE-2026-8286.html">https://cu=
rl.se/docs/CVE-2026-8286.html</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp; .../curl/curl/CVE-2026-8286.patch&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 81 +++++++++++++++++++<br>
&gt;&gt;&nbsp; meta/recipes-support/curl/curl_8.19.0.bb&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; |&nbsp; 1 +<br>
&gt;&gt;&nbsp; 2 files changed, 82 insertions(+)<br>
&gt;&gt;&nbsp; create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8=
286.patch<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; This series does not apply on top of the review branch anymore:<br>
&gt; <a href=3D"https://git.openembedded.org/openembedded-core-contrib/log/=
?h=3Dstable/wrynose-review">
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/wryn=
ose-review</a><br>
&gt; |ERROR: curl-8.19.0-r0 do_patch: Applying patch '.../wrynose/bitbake-b=
uilds/poky-wrynose/layers/openembedded-core/meta/recipes-support/curl/curl/=
CVE-2026-8927.patch' on target directory '.../wrynose/bitbake-builds/poky-w=
rynose/build/tmp/work/x86-64-v3-poky-linux/curl/8.19.0/sources/curl-8.19.0'=
<br>
&gt; |CmdError('quilt --quiltrc .../wrynose/bitbake-builds/poky-wrynose/bui=
ld/tmp/work/x86-64-v3-poky-linux/curl/8.19.0/recipe-sysroot-native/etc/quil=
trc push', 0, 'stdout: Applying patch CVE-2026-8927.patch<br>
&gt; |patching file lib/url.c<br>
&gt; |patching file lib/urldata.h<br>
&gt; |patching file tests/data/Makefile.am<br>
&gt; |Hunk #1 FAILED at 218.<br>
&gt; |1 out of 1 hunk FAILED -- rejects in file tests/data/Makefile.am<br>
&gt; |patching file tests/data/test1647<br>
&gt; |patching file tests/libtest/Makefile.inc<br>
&gt; |Hunk #1 FAILED at 100.<br>
&gt; |1 out of 1 hunk FAILED -- rejects in file tests/libtest/Makefile.inc<=
br>
&gt; |patching file tests/libtest/lib1647.c<br>
&gt; |Patch CVE-2026-8927.patch does not apply (enforce with -f)<br>
&gt; |<br>
&gt; |stderr: ')<br>
&gt; |ERROR: Logfile of failure stored in: .../wrynose/bitbake-builds/poky-=
wrynose/build/tmp/work/x86-64-v3-poky-linux/curl/8.19.0/temp/log.do_patch.4=
68848<br>
&gt; |ERROR: Task (.../wrynose/bitbake-builds/poky-wrynose/layers/openembed=
ded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_patch) failed with exi=
t code '1'<br>
&gt;<br>
&gt; Can you please rebase and send a v2?<br>
&gt;<br>
&gt; Please note that there are other pending curl CVE patches, I'd recomma=
nd<br>
&gt; reviewing/testing patches to identify conflict at the earliest.<br>
&gt;<br>
&gt; Thanks!<br>
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

--_000_DM4SPRMB0074221ACE7E0C08819C0E48C4AD2DM4SPRMB0074namprd_--

