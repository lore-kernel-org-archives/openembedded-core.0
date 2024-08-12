Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E7AC3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 10:09:03 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.web11.42978.1723457340279029062
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 03:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=X6UHUa/C;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6563; q=dns/txt; s=iport;
  t=1723457340; x=1724666940;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iWa47jgLQ2b7W2OvrOD7sLJbpLqTIge177dFl43H7Ns=;
  b=X6UHUa/CP26pD8fh7f4DOb7D4tcvutCkZ2oklWuPhhbisdey2NO2fEsB
   WLgZHPiIougwM8mY9j5GC9fIHoXcEpdRdV5v5rzft5iGqSQTo+QcJUMdG
   q+creSKKlqQ26bY/zSHSerRmftC8VsVZOacFf3GTMOnYDtLgpb+xxl5IV
   4=;
X-CSE-ConnectionGUID: dslqpf7iSo2/YpV5mEH8vw==
X-CSE-MsgGUID: //Rpn4XdThur2+KHWj/SlQ==
X-IPAS-Result: =?us-ascii?q?A0AAAACE3rlmmJpdJa1aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQFAJYEWBAEBAQEBCwGBcVJ7AoEcSIghA4ROX4hzA4tik?=
 =?us-ascii?q?jCBJQNWDwEBAQ0BAS4HDwQBAYUGAoliAiY0CQ4BAgQBAQEBAwIDAQEBAQEBA?=
 =?us-ascii?q?QEBBQEBBQEBAQIBBwUUAQEBAQEBAQE3BQ47hXUNhlkBAQEBAgEBESg/DAQCA?=
 =?us-ascii?q?QgRBAEBHxAgBwoXAQUIAgQBDQUIGoJeAYIwAw4jAwGhbwGBQAKKKHiBNIEB3?=
 =?us-ascii?q?TgNglgYgTABiCweAYVMVIQ7JxuCDYFXeW1KOD6CH0IFgTQrBYQOgi8EgRGCI?=
 =?us-ascii?q?oIkhk6CJIJOaQQFB4Q1Vw+CXA6BRoI5JohMLHdwh19SexwDWSECEQFVExcLC?=
 =?us-ascii?q?QWJSQqBeYEqKYFLJoELFoJ3gTWBHQKCWoFnDGGHcmKBDYE+gV4BSYJ4SyQLX?=
 =?us-ascii?q?oFMgQU6gUUFfoJZdFVEAg0CN4ESHUADC209NQYOGwUEgTUFpQGBXAGCOwENL?=
 =?us-ascii?q?1EBJx0HLws3BwMyME0exH9xCiiDbIwUjTKBfoYrF4VbpGaYbyKRXJFNhSMCB?=
 =?us-ascii?q?AIEBQIPAQEGgWc6gVtwFTuCZwlJGQ9YjWIfiFbIAng7AgcLAQEDCYZIhDqBf?=
 =?us-ascii?q?QEB?=
IronPort-PHdr: A9a23:qrCM7BDUIiSyiXzvB+cuUyQVXRdPi9zP1kY9454jjfdJaqu8us2kN
 03E7vIrh1jMDs3X6PNB3vLfqLuoGXcB7pCIrG0YfdRSWgUEh8Qbk01oAMOMBUDhav+/Ryc7B
 89FElRi+hmG
IronPort-Data: A9a23:cf3M+KlNx5orMQMJv6KC+cbo5gytJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdXGiPOviKZDGjKo9+Ydjk/E0H68DcnIRhGws5/ywxF1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaB4Erra/658CQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+5y31GONgWYubjpEsvvb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYED/v9vDz5Pz
 vtCbwEVUE2GqsLm3q3uH4GAhux7RCXqFJkUtnclxjbDALN9B5vCWK7No9Rf2V/chOgXQq2YP
 JVfOGEpNUmcC/FMEg9/5JYWkOGhiX7zaTRwo1OOrq1x6G/WpOB0+OO2aIuEI4DVFK25mG7f4
 Vje+TjJDi0aKcbFihmlzXDrvev2yHaTtIU6T+DgqaUw3zV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/f5ByUQzNCRT9aY9tgv8gzLdA36
 rOXt9/yASV3vuKUcnXHsYaMk263FAhFM3BXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJ9dfYn
 WziQM8W2el7sCIb65hX62wrlN5Fm3QkZhQ+6gOSVWW/40YiIoWkfIevr1Pc6J6szbp1rHHf4
 xDoeODHsIji6K1hcgTWG43h+5nyvJ643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK5lkKv8UOZiL2N/AnC25UNyjM5fW7fTgCfq2LBueinrArLWdrAQk3PxfJhDG3+KTSufpgZ
 cnKGSpTMZrqIf86lGXtHbh1PU4DzSElzmSbXoHg0xmiyvKfYnXTIYrpw3PQBt3VGJis+V2Pm
 /4GbpPi40wGDIXWPHKNmaZNdg9iEJTOLc2swyChXrTdclMO9aBII6K5/I7NjKQ+xf4Ey7iQr
 yDmMqKaoXKm7UD6xcyxQikLQJvkXI10qjQwOilEALpi8yFLjVqHhEvHS6YKQA==
IronPort-HdrOrdr: A9a23:m+o0JqrPOiWXaARKsO8ge/gaV5tXLNV00zEX/kB9WHVpm5Oj5q
 OTdaUgtSMc1gxxZJh5o6H/BEDhex/hHZ4c2/h2AV7QZniWhILOFvAi0WKC+UyvJ8SQzJ8m6U
 4NSdkbNDS0NykEsS+Y2nj5Lz9D+qj7zEnAv463pBkdL3AOV0gj1XYENu/xKDwOeOAyP+tDKH
 Pq3Ls+m9PPQwVxUi2TPAh3Y8Hz4/fwuNbNZxkACxQ76A+Iow+JxdfBeSSw71M1aR8K5a0t31
 TkvmXCi5lLtcvV9jbsk0voq7hGktrozdVOQOaWjNIOFznqggG0IKx8RryrplkO0aOSwWdvtO
 OJjwYrPsx15X+UVHqyuwHR1w7p1ytrw2P+yGWfnWDoraXCNXcH4ot69MZkmynimgwdVeJHof
 t2NqWixsJq5Cb77WPADh7zJkpXfwSP0CAfeKUo/gxiuMMlGc1sRMokjQBo+FNqJlOn1Gjhe9
 MeUf016JttACanRmGcsW91zNO2WHMvWh+AX0gZo8SQlyNbhXZj0iIjtYEid1o7hdkAoqN/lq
 75G7UtkKsLQt4dbKp7CutEScyrCnbVSRaJNG6JO1zoGKwOJnqI8vfMkfoIzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnL2JFQ6BjCTGi0QDyowMBD4JpyvKH6WdPQQGG+YUFrl9Hlr+QUA8XdVf
 r2MJVKA+X7JW+rAopN1x2WYegbFZDfarxdhj8WYSP5niuQEPyfigXySoelGIbQ
X-Talos-CUID: =?us-ascii?q?9a23=3AmsGL32llEGToRdiJBc7owJUiaXHXOXHGyG7ILRC?=
 =?us-ascii?q?5MmEzD4yNdwKV1YM0jdU7zg=3D=3D?=
X-Talos-MUID: 9a23:Delu2goOhYyQyz8as8wez3YlDt9uv5SiNEAQi89FmOm7N2tLPw7I2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
  by alln-iport-2.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 10:08:59 +0000
Received: from alln-opgw-1.cisco.com (alln-opgw-1.cisco.com [173.37.147.229])
	by rcdn-core-3.cisco.com (8.15.2/8.15.2) with ESMTPS id 47CA8xSo002460
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 10:08:59 GMT
X-CSE-ConnectionGUID: KNBFLeGeS2+bqGxkdepdkA==
X-CSE-MsgGUID: vjDTYsGjQK6OLGgr1Pv4Aw==
Authentication-Results: alln-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.09,282,1716249600"; 
   d="scan'208";a="35844936"
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
  by alln-opgw-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 10:08:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+zZGG/+kY14qI10Z7aTie+MvaZgaRfns9XqAJBvLLRVp4k8r+UQof9eihhqP8XYU0a0mg88KS8l6ta513XrpHRkHvC1dmyeaGI53m/1pbK4AsN5+3kGgfF4+EcxNa7QS5zSA/gI28D04Bs6IuzBfwnoq3NJMAV9CmAYKk3zdXNO/TT52OIZSEXwJ4RbZQrPvBxc0rHZ0pqLv8kgjpgom347i3WeTfN6Rd18dDnEbf7B+7alIj2n3mbUQ1+XEt18HW/y+2iUaRVjyTGK5s5LTDxq90wvzMLs/LEF3vjiZ87sUnLOoX3GXB88UEvH1Pz5YaSAkazg9QtsNnUiLZlZog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWa47jgLQ2b7W2OvrOD7sLJbpLqTIge177dFl43H7Ns=;
 b=lNKUjZEIS4dqoqwF58D5BWREgNsHh0qRI/mJXSIrQrL3zgGGrTeBrf/ENO0lkDNctRge/b9AJhJJ/QVbMgblw4T5WQyYHyEfwWqEDh+8lndwe1xccEWKS9m6UVMs8JLEn0yt/kZ1ao1ptCZyE/2v8wIl9XtG0EmZkZ5dl08mRKeb/i3YrZByIUXrcDMtemTHx52rt0ZW3xVtB8jrkZxg6IqRIvI57AHPhHAdZK0EKHwN43IbyuFZ0oc+vJu0VGoXLXF07gghYgZeNEBimpiOuLrS85LcDtr+IgL7FvEt7Enc1HcCA98eiKtl2dIwIbWmYg1bWhHY+gIGvXKriUT/ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SN7PR11MB6971.namprd11.prod.outlook.com (2603:10b6:806:2ab::21)
 by PH0PR11MB7588.namprd11.prod.outlook.com (2603:10b6:510:28b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 12 Aug
 2024 10:08:56 +0000
Received: from SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::bfd2:64e6:d85f:4896]) by SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::bfd2:64e6:d85f:4896%4]) with mapi id 15.20.7828.030; Mon, 12 Aug 2024
 10:08:56 +0000
From: "Dhairya Nagodra -X (dnagodra - E INFOCHIPS LIMITED at Cisco)"
	<dnagodra@cisco.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        Marta Rybczynska
	<rybczynska@gmail.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: RE: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
 "Unpatched" status
Thread-Topic: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
 "Unpatched" status
Thread-Index: AQHa3YRHiRZeDkJzN0OXxSVyh6EHW7IFa/cAgBYzP8CAABBAgIAH0/ow
Date: Mon, 12 Aug 2024 10:08:55 +0000
Message-ID: 
 <SN7PR11MB69712420AA4D5D916BB5AB3DD4852@SN7PR11MB6971.namprd11.prod.outlook.com>
References: <20240724044505.3345411-1-dnagodra@cisco.com>
 <AS1PR10MB56974EC49B3D514BA1AB549CFDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <SN7PR11MB69717099C98AD23A85C9E66DD4B82@SN7PR11MB6971.namprd11.prod.outlook.com>
 <AS1PR10MB5697AE3874C9EECA6BF35D8BFDB82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697AE3874C9EECA6BF35D8BFDB82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7752e62c-f1d5-4219-bb5f-b6b6692dea0c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-07-24T06:25:03Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6971:EE_|PH0PR11MB7588:EE_
x-ms-office365-filtering-correlation-id: 80d868c7-395f-42f0-3044-08dcbab6c6b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?zgxB7vMlfIv3erxgzn4j0bPawnJep2TVLupsK5Ib8X/VizYRBQjgomcRkiS0?=
 =?us-ascii?Q?TOl2+EpcFI+ERcuBattndtgzlD27ZLq6jiicFfGyX71QgocfeJuZh3BI36mw?=
 =?us-ascii?Q?2EfayUDgI9mRMzWB6fjkaUFQpY/1x38BY5dee0jsVyM+YPuw7AsxUrE7CZ25?=
 =?us-ascii?Q?Fg7vgUlvI5F0hucqj9WJwcaiCTEpgsqipMJmZp55ukPH9cj20oKLdMOn8LR8?=
 =?us-ascii?Q?Mhql4xBa2QF3GOJSzSbG3GPXzASO2JAKu9YBys+v+nrhYMBZAe9BajZAelPm?=
 =?us-ascii?Q?lGrQ2sgKEZBh0VoorPL8TuAUC5Juc1p16O9bg2GzeW2gO5Fs9pCciDj2udBf?=
 =?us-ascii?Q?wbtTPpx+NdUbmYK9h0dnaZ5199FAtYRKx1pVZcFWrum8DtUuMQ1oMXpKlW+f?=
 =?us-ascii?Q?X8EeudigPkMrB+bFyHyxv5kaSzgdZ8NupA9n7NmNEaIeZaZVYfiN/gOQomp8?=
 =?us-ascii?Q?xdY3krtygNPYev2Jrq0aWE9GhYq7wbRK8OX+lJJvCBGo66UKLahZKPchyoEb?=
 =?us-ascii?Q?ZzmHirCWgEoLdopjUmQRBXzr3mvi09QI3QFBdWJJIybPTSqirCNfJf0P7bml?=
 =?us-ascii?Q?abas2Gv2F9+xFIXnOLc0Fg8kMDJAgkXPMvyzVJLWP03j6hKjZDcOQ5aH79k4?=
 =?us-ascii?Q?lRGvBhz5AWR9yuARY0PIFiTUSSoShS74W9FMU9lg1ynlUCh03Wmi05k4Nu17?=
 =?us-ascii?Q?2vxAh8dZou6vd8zAg6CziayIo0oHo1EUuj1R2+7n0FuByZKnHk8PgSp3zg0p?=
 =?us-ascii?Q?2R5KTPVRe09CmvnrYHi9QOwMbd6P/upQgxDx0CNtnDEYIYIpDoccDni/mEZ+?=
 =?us-ascii?Q?boaxW1NGHcNhwFy2RsnPRmZ1ZaRTSv6MplCJajiaL/2+yc0diYwhcY71BNxZ?=
 =?us-ascii?Q?MCNURXSW7YQLXs4QdjfSuzUn2iPvxuIMVYQJBcLRs51Sbfu9JkC4VbyzztI8?=
 =?us-ascii?Q?nEpaH6Yxy7uohCyRWPHeqqw4VCMDOOR0vAYZ4gCRdiKxe1qmpxwL104K2ce/?=
 =?us-ascii?Q?12ggXfZgK3lGwens9rBRXKRyVMywyl5M2rUWYVtoVf40rmTs52LlLadgXH6m?=
 =?us-ascii?Q?TcmbrShYDFsA1mVlRtU8EKGM5RcuIbUqofrmi24FgCRpj95M1q9wea3/bqTE?=
 =?us-ascii?Q?tJ8iWz79uqMqERzFJ118NqpxngaatfkyiZyBjruw3FRhjAHSx/d05xxkYMNN?=
 =?us-ascii?Q?D0GMbtf3+4aMtuRykoJ8yJb7HSc9cihDhVdZS5Jgs+0xyy2B0fQjTWDSZ8h0?=
 =?us-ascii?Q?PA0J7tJu1NIC8C8R5rsa7T7R1jhA6BIB2HN+LTRNmshVJl42l3X4/G2iMRTY?=
 =?us-ascii?Q?29eHwtCW4qPX6mVXsnf1icZdheyONLUIsbm3Y+zdmBH0/7SEOQPsN2QtmzhM?=
 =?us-ascii?Q?MUyOkXptwsC0gIg+u41qVOoP4oKsbkKqCszJQG+z9yh762d1sA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6971.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?0NeS/NnIAQKgULE1lyFFzrqupOQXziC1E5MhCMaBMOkXAo2OIFvXKvgq512I?=
 =?us-ascii?Q?HPOojm1oylTyXd6dJZIhP6eIZJmZS6JzqhOnm5e9V9YNkWKIVL88KVDIFa+h?=
 =?us-ascii?Q?ZTvSEwvbi73nrgi826ZjSwArwnV7ga/2GEgfkK8/d9SovLiCIt5A0eTVnScA?=
 =?us-ascii?Q?coWg9QnZ8cyKy4jQMZriHpCt3rB9VzmHHEyTP3S2FXkrr5fOmog/PmGmClzo?=
 =?us-ascii?Q?ocbEQsLjX6iPg6+6tw1QzMjJmsCr2Nj0r0sb1rkYGq8KePxWVNJj40HOd+aV?=
 =?us-ascii?Q?dYf7DhhkDhIJsADHKuNNI+rwOAYGHdnBmL0K0a+RKFT+9Z1BC7eEtMIj5Dne?=
 =?us-ascii?Q?zVP9a9ZcxiX89vhdpNoGmLqgeYSEZLlcyktng5oLS3Nc/Dl6RpH7lFfszeKk?=
 =?us-ascii?Q?kUM4gF/+15CxNT3Uqm8xCT+KCZtqHh8nYP8n8rOV2t585ZU26WVDh9CeCjSz?=
 =?us-ascii?Q?teutQ1qXS1OBpBRJcXr1+dy/CpuEa1ZmOe8leaVGwnp1hQpg18p4gaTyvKul?=
 =?us-ascii?Q?c7Fib2u50QE0OLN768wOE9KdqbIHfl85yIoIEKFJViL/szpn+ZEy3mRQycsi?=
 =?us-ascii?Q?bxwUltigfZCG4z21nNyy9c6FcpObfF8KKkGgu51MUa8Ijw2iSkm34uFRQq27?=
 =?us-ascii?Q?9YEt46Uy9WQ2M0SBy0pAxwMf/r0Ceurr4LjzVsgjcNv42VGfwoCWrzE+DmVM?=
 =?us-ascii?Q?cn5O4e27+nvq8yYCWj1jqt7h8ONnluZ1YL81/L7ZMb68codjRDW9rYaxXiM/?=
 =?us-ascii?Q?uQyVo1rr4ZX2sJONS0sm0Qi9i58nqgm0yMBV8afoH/zwskeMp1SdTDIU/dl7?=
 =?us-ascii?Q?8bgKn9IQcSAByuEz5c0/WoxgGiLF/Fz41NrzQihXZcEwxJTnCHY7Rdj9tXhZ?=
 =?us-ascii?Q?oOUWIXIkuUK2LCdM7IPbffcrlsEsoTKKD7Y9r1gHtW342LclZnBGVz45F0Jm?=
 =?us-ascii?Q?ZE808hRvr7uJRwqXSHacA0AGM83JPQVkKmbGoZu3PVFwFUrWj1gTxQ7qOewO?=
 =?us-ascii?Q?L48tzNk3IUp61Okst5g+zqnXNPBWvkH31YRikqVDIr93c7DSL3Bz/zE3iRMY?=
 =?us-ascii?Q?+EHt6LC2nPa968nXwL2R+LqRDLJOp/IibRVaMQAql5Pmo86TumSSxeJGRZW4?=
 =?us-ascii?Q?AFBn1Nz2GYyiMg8YV6Uu1eHx+L7BJlqYRlYpyK/BPfFooNFM2SDZyEpcTOZO?=
 =?us-ascii?Q?1PABhnLsMTkyYLHeGxNT796F/h9+L2fyIRuOp/QHhOkUal3MVfxVmfwuTlhv?=
 =?us-ascii?Q?iLBlbdHGmhX80dQXFeX7sBAhwu8LafLY0HitkRb/2fcy61/m4I4PyyL7hUIP?=
 =?us-ascii?Q?4x1xFeqi4Pq8NHahiBi4/3lUqT0ElJpRTPIFdJBals8bYjcVRez7UKDIJ8W1?=
 =?us-ascii?Q?s7GXCZVi3SjIcqQGO5sYtP79oFmU6GMKI8WEw3lC8NonXJtWdLM+KL4P5MT9?=
 =?us-ascii?Q?1qWIs/7H50NMysC5YXQtHKA7H17tu1Qjc6XthqRYZ8ZVMuUK8uuTzgp/pSkB?=
 =?us-ascii?Q?8HoU76MSIK+rOI87WiPE7NtbK+IRoaZ4zR9sPeXbqGdYPB8cf2g9nyARIt+j?=
 =?us-ascii?Q?ud7YtUSA/H/ckMdTdyw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d868c7-395f-42f0-3044-08dcbab6c6b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 10:08:56.0011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wChQ/0tgLa8MWdgrky/UmrV1ysLyFMXE4I6J1AnU08zUimlT9bxO9e8e3V8D8DbSLK4FkYSCRmIYaH7dFOPrCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7588
X-Outbound-SMTP-Client: 173.37.147.229, alln-opgw-1.cisco.com
X-Outbound-Node: rcdn-core-3.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 10:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203215



>-----Original Message-----
>From: Marko, Peter <Peter.Marko@siemens.com>
>Sent: Wednesday, August 7, 2024 4:04 PM
>To: Dhairya Nagodra -X (dnagodra - E INFOCHIPS LIMITED at Cisco)
><dnagodra@cisco.com>; Richard Purdie <richard.purdie@linuxfoundation.org>;
>Marta Rybczynska <rybczynska@gmail.com>; openembedded-
>core@lists.openembedded.org
>Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>
>Subject: RE: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
>"Unpatched" status
>
>
>
>> -----Original Message-----
>> From: Dhairya Nagodra -X (dnagodra - E INFOCHIPS LIMITED at Cisco)
>> <dnagodra@cisco.com>
>> Sent: Wednesday, August 7, 2024 12:17
>> To: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>; Richard
>> Purdie <richard.purdie@linuxfoundation.org>; Marta Rybczynska
>> <rybczynska@gmail.com>; openembedded-core@lists.openembedded.org
>> Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>
>> Subject: RE: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix'
>> to "Unpatched" status
>>
>>
>>
>> >-----Original Message-----
>> >From: Marko, Peter <Peter.Marko@siemens.com>
>> >Sent: Wednesday, July 24, 2024 12:04 PM
>> >To: Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)
>> ><dnagodra@cisco.com>; openembedded-core@lists.openembedded.org
>> >Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>
>> >Subject: RE: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix'
>> >to "Unpatched" status
>> >
>> >-----Original Message-----
>> >From: openembedded-core@lists.openembedded.org <openembedded-
>> >core@lists.openembedded.org> On Behalf Of Dhairya Nagodra via
>> >lists.openembedded.org
>> >Sent: Wednesday, July 24, 2024 6:45
>> >To: openembedded-core@lists.openembedded.org
>> >Cc: xe-linux-external@cisco.com; Dhairya Nagodra <dnagodra@cisco.com>
>> >Subject: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
>> >"Unpatched" status
>> >
>> >> - The 'upstream-wontfix' is to be used when the CVE is accepted by th=
e
>> >>   upstream, but they are not planning to fix it.
>> >> - If the version used in Yocto is vulnerable, it should not have
>> >>   "Ignored" status. The package is still exploitable by the CVE.
>> >> - Also, when the status is exported out of the SDK, it would be
>> >>   incorrect to put it under Ignored catgory.
>> >
>> >The purpose of this entry is to remove meaningless CVEs from reports
>> >so that users don't spend countless hours over and over again on analyz=
ing
>"open"
>> >CVEs if they were already closed upstream.
>> >If you look at comments of entries using this category (7 in oe-core
>> scarthgap)
>> >these CVEs are more or less irrelevant.
>> >
>> >So this patch is from my point of view step in the wrong direction.
>> >If you really need to show these due to your CVE handling process,
>> >you can easily override this variable assignment in your own layer.
>> >
>>
>>
>> I tried this in my layer, created a .conf and included in my distro.conf=
 file.
>> The issue is, it gets overwritten by cve-check-map.conf (as it is includ=
ed
>later).
>
>If you create meta-<your-layer>/conf/cve-check-map.conf it will be include=
d
>instead of the one from oe-core/poky.
>

I tried this approach, it included both of the files, and my config was ove=
r written.

#     <path>/distro/openembedded-core/../my-layer/conf/distro/my-cve-check-=
map.conf
#   <path>/distro/openembedded-core/../openembedded-core/meta/conf/distro/d=
efaultsetup.conf includes:
#     <path>/distro/openembedded-core/../openembedded-core/meta/conf/distro=
/include/default-providers.inc
#     <path>/distro/openembedded-core/../openembedded-core/meta/conf/distro=
/include/default-versions.inc
#     <path>/distro/openembedded-core/../openembedded-core/meta/conf/distro=
/include/default-distrovars.inc
#     <path>/distro/openembedded-core/../openembedded-core/meta/conf/distro=
/include/maintainers.inc
#     <path>/distro/openembedded-core/../openembedded-core/meta/conf/distro=
/include/tcmode-default.inc
#     <path>/distro/openembedded-core/../openembedded-core/meta/conf/distro=
/include/tclibc-glibc.inc
#     <path>/distro/openembedded-core/../openembedded-core/meta/conf/distro=
/include/uninative-flags.inc
#     <path>/distro/openembedded-core/../openembedded-core/meta/conf/distro=
/include/init-manager-none.inc
#   <path>/distro/openembedded-core/../openembedded-core/meta/conf/document=
ation.conf
#   <path>/distro/openembedded-core/../openembedded-core/meta/conf/licenses=
.conf
#   <path>/distro/openembedded-core/../openembedded-core/meta/conf/sanity.c=
onf
#   <path>/distro/openembedded-core/../openembedded-core/meta/conf/cve-chec=
k-map.conf

>>
>> Would it be okay to make assignments soft in the cve-check-map.conf file=
?
>> This would be similar to CVE_PRODUCT and CVE_VERSION.


This seems to be the only way, I'll share the patch soon.


>> If everyone agrees, I can share the patch for it.
>> Is there a better way to do this?
>
>This is also an option; I'm not opinionated on this one...
>
>>
>> Best Regards,
>> Dhairya
>>
>>
>> >>
>> >> Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
>> >> ---
>> >>  meta/conf/cve-check-map.conf | 4 ++--
>> >>  1 file changed, 2 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git a/meta/conf/cve-check-map.conf
>> >> b/meta/conf/cve-check-map.conf index b9df41a6f3..7ff53f5601 100644
>> >> --- a/meta/conf/cve-check-map.conf
>> >> +++ b/meta/conf/cve-check-map.conf
>> >> @@ -15,6 +15,8 @@ CVE_CHECK_STATUSMAP[unpatched] =3D
>"Unpatched"
>> >>  CVE_CHECK_STATUSMAP[vulnerable-investigating] =3D "Unpatched"
>> >>  # use when CVE fix is not compatible to the current version and
>> >> cannot be
>> >backported.
>> >>  CVE_CHECK_STATUSMAP[cannot-backport] =3D "Unpatched"
>> >> +# use when upstream acknowledged the vulnerability but does not
>> >> +plan to fix it CVE_CHECK_STATUSMAP[upstream-wontfix] =3D "Unpatched"
>> >>
>> >>  # used for migration from old concept, do not use for new
>> >> vulnerabilities  CVE_CHECK_STATUSMAP[ignored] =3D "Ignored"
>> >> @@ -26,5 +28,3 @@ CVE_CHECK_STATUSMAP[disputed] =3D "Ignored"
>> >>  CVE_CHECK_STATUSMAP[not-applicable-config] =3D "Ignored"
>> >>  # use when vulnerability affects other platform (e.g. Windows or
>> >> Debian)  CVE_CHECK_STATUSMAP[not-applicable-platform] =3D "Ignored"
>> >> -# use when upstream acknowledged the vulnerability but does not
>> >> plan to fix it -CVE_CHECK_STATUSMAP[upstream-wontfix] =3D "Ignored"

