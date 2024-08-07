Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572FDC3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 10:17:38 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.web10.30089.1723025849491621284
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 03:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=NDYmn1c9;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3526; q=dns/txt; s=iport;
  t=1723025849; x=1724235449;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eQPRzdkndHsmrRKigXozEX0IzebGeB+Ws2fCe3453I4=;
  b=NDYmn1c9vQ2AUxynr7k+j8yRZqOdD/4y0w1msO4+ZS+T57EQC7azZ01x
   IFLXuJo+WA3CbKhdYg0mt2Slw5bDJDZKh6ZiZiIQM2PmM9NGFOacmq10x
   En9RyG3p+xBDR8y/YMYJthnTXLrI+6RyX+4suBme7BjyZ6CLDYG4rIsHZ
   E=;
X-CSE-ConnectionGUID: BFANLP2ERVK6n5uRFST9cA==
X-CSE-MsgGUID: D+OnxR20RAWELJIeKWa8MQ==
X-IPAS-Result: =?us-ascii?q?A0ABAABjSbNmmIMNJK1aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQFAJYEXAwEBAQEBCwGBcVJ7AoEcSIghA4UtiHIDnhGBJ?=
 =?us-ascii?q?QNWDwEBAQ0BAS4HDwQBAYUGAolMAiY1CA4BAgQBAQEBAwIDAQEBAQEBAQEBB?=
 =?us-ascii?q?QEBBQEBAQIBBwUUAQEBAQEBAQE3BQ47hXUNhl0BAQEBAwERKD8MBAIBCBEEA?=
 =?us-ascii?q?QEfECcKFwEFCAIEAQ0FCBqCXgGCZAMBoDwBgUACiih4gTSBAeAdGIEwAYhJA?=
 =?us-ascii?q?YVKVIQ7JxuCDYFXeW1KOD6CYQWBXwWEDoIvBIERgiKIcoRwaQQFBw6EKVcPg?=
 =?us-ascii?q?lyBVoI5Joh6PYdCUnscA1khAhEBVRMXCwkFiUkKgXmBKimBSyaBCxWCd4E1g?=
 =?us-ascii?q?RwCglqBaQxhh3JigQ6BPoFeAUmCdkokC16BTIEFOoFFgQGCWXk3HUADC209N?=
 =?us-ascii?q?QYOGwUEgTUFo1uEDAENL1EoHQc6NwcDMjBNHsVvCiiDbYwUjTKIKReFW6Rlm?=
 =?us-ascii?q?HAioyiFIgIEAgQFAg8BAQaBaAE4gVtwFTuCZwlJGQ9YjWIfiFbFMHg7AgcLA?=
 =?us-ascii?q?QEDCYZIhyUBAQ?=
IronPort-PHdr: A9a23:lMrxphdhyiHz+Snuqzo1CDQDlGM/gIqcDmcuAtIPkblCdOGk55v9e
 ReZ7vR2h1iPVoLeuLpIiOvT5rjpQndIoY2Av3YLbIFWWlcbhN8XkQ0tDI/NCUDyIPPwKS1vN
 M9DT1RiuXq8NCBo
IronPort-Data: A9a23:zUxMH6lGIdy0r80mrs3n1ZPo5gyuJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOX2+CPPaJM2PzKt1wYYu1oU0G7JaAmNQ1GQdk/y8xF1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaB4Erra/658CQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+5y31GONgWYubjpEs/3b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fac208BTOTtjz
 8I7djZQcyqtvN7ny5vuH4GAhux7RCXqFIobvnclxjbDALN/B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGEpNU+ZC/FMEg9/5JYWkOGhiX7zaTRwo1OOrq1x6G/WpOB0+OK2YIKJI4DTFK25mG605
 UXA716jWiszC/G76xuI0U2l1sr2yHaTtIU6T+DgqaUw3zV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/f5ByUQzFCRT9aY9tgv8gzLdA36
 rOXt/nHLBpLiOe4c0y+qLHJsAmcAhREJkZXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJ9dfYn
 W3iQM8W2el7sCIb65hX62wrlN5Fm3QkZgcx4gOSVWW/40YgIoWkfIevr1Pc6J6szbp1rHHf4
 hDoeODHsIji6K1hcgTWHo3h+5nyu5643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK5lkLtcAPYCb7MPYuC25UNyjM5fW+fTgCfq2LBueinrArLWdrAQk3PxfJhDG3+KTSufpvY
 cfGGSpTMZrqIf86lGXtHbh1PU4DzSElzmSbXoHg0xmiyvKfYnXTIYrpw3PQBt3VGJis+V2Pm
 /4GbpPi40wGDIXWPHKNmaZNdg9iEJTOLc2swyChXrTdclMO9aBII6K5/I7NjKQ8wvgIxreYp
 yDgMqKaoXKm7UD6xcyxQikLQJvkXI10qjQwOilEALpi8yF6CWpzxM/zr6cKQIQ=
IronPort-HdrOrdr: A9a23:mECPkKHiGAakqC4ZpLqFlJLXdLJyesId70hD6qkvc203TiXIra
 CTdaogtCMc0AxhJk3I+ertBEGBKUmsk6KdkrNhTItKOzOW+VdATbsSo7cKrAeQYREWmtQtsZ
 uINpIOd+EYbmIKzfoSgjPIburIqePvmMvH9IWuqkuFDzsaF52IhD0JczpzZ3cGPzWucqBJbK
 Z0iPA3wAZIUE5nHfiTNz0uZcSGjdvNk57tfB4BADAayCTmt1mVwY+/OSK1mjMFXR1y4ZpKyw
 X4egrCiZmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoTJ4JYczBgBkF5MWUrHo6mt
 jFpBkte+5p7WnKQ22zqRzxnyH9zTcV7WP4w1PwuwqnnSW5fkN/NyNyv/MeTvLr0Tt4gDi66t
 MS44utjesRMfoHplWn2zGHbWAxqqP+mwtTrQdatQ0sbWJZUs4TkWTal3klTKvp20nBmd0a+O
 UCNrCo2N9GNVyddHzXpW9p3ZilWWkyBA6PRgwYttWSyCU+pgE186I0/r1Vop47zuN2d7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUPhvAQODl7fnpLEuoO26cp0By5U/3J
 zHTVNDrGY3P0bjE9eH0pFH+g3EBG+9QTPuwMdD4IURgMyxeJP7dSmYDFw+mcqppPsSRsXdRv
 aoIZpTR+TuKGP/cLw5lzEWm6MiYEX2fPdlzOrTAWj+1v4jAreawdDmTA==
X-Talos-CUID: 9a23:wwoP322UUx3/qBrcv/cCG7xfMO4MVFnlllrqHWzmDzt0cpOudQ6b0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3AHWugvQycaQHweoFRXzQt/DA1g7CaqIjtL0Ydq89?=
 =?us-ascii?q?egeC7GAhSGjq+sz3nZ7Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-1.cisco.com ([173.36.13.131])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 10:17:27 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 477AHREV011211
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Aug 2024 10:17:27 GMT
X-CSE-ConnectionGUID: 6DaPJAeLRye1cxhyvqt75g==
X-CSE-MsgGUID: ERVLn6J/SRCf8M6qzs92fg==
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.09,269,1716249600"; 
   d="scan'208";a="24885070"
Received: from mail-mw2nam04lp2173.outbound.protection.outlook.com (HELO NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.173])
  by rcdn-opgw-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 10:17:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfroGT+pDCKQKKjpFOHyObRE9vjl06zlIUMY2PzkA5coadMP6FoCtjfcsfbu/47vNk8CAPa36exk8y5/LCmI2l4QNiPQ2TF5xhrJ1pt9JRdAR97dKVeA+QLzkI8iazw+JWkHLgBKZGi770FgPJWyf6Erl+BXjZOGk7mCEXZfSe61jr4Zv0VmQCmxWfJuim0jnKew3ZOdJYkJipZc4yigmBjGMzOOkwNr8LEAXo7X3qgAoF3i/xSWJ1qVsb1L6CbqCYPiknxEYWLdU4k6Ea+xgkVEV7dhnuYX+G1xAS+XLmJC9RKnIMcXK5GZkAPwczaORjX4cm9qbISwmTzEwx4lIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQPRzdkndHsmrRKigXozEX0IzebGeB+Ws2fCe3453I4=;
 b=e+4YInOy5iOGYRp6JAPh80lZCrtxu47rXVtNIcKr5ORcxfBD0OfDOw4i+ysnak3+t3hnS3HkjsHsI3D/nwD12iYSCefW3alRyCzx7gExYHnhGi8ZqZXp5nHp7eKM84gmUwXYm29CO1qqCumW1VV2hgL063PwPt4G0kzs5xl+dkx/X5fdVp240IYu60zrD3u/bumwqUoIKCMZFxbdNdmuTzDADhIalGAdfOi8ie3XuYaamCrJ/zLUY8yezcY9Ag/PjzRs0LDzO5M1PfAAs5EDDFLp8XyXnYjrOD+8tsNkTLP3zFb1F48HoAtZUPn9/t0MKzXz0T0lRVyNaUYgLU2dfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SN7PR11MB6971.namprd11.prod.outlook.com (2603:10b6:806:2ab::21)
 by PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 7 Aug
 2024 10:17:24 +0000
Received: from SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::bfd2:64e6:d85f:4896]) by SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::bfd2:64e6:d85f:4896%3]) with mapi id 15.20.7807.026; Wed, 7 Aug 2024
 10:17:24 +0000
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
Thread-Index: AQHa3YRHiRZeDkJzN0OXxSVyh6EHW7IFa/cAgBYzP8A=
Date: Wed, 7 Aug 2024 10:17:24 +0000
Message-ID: 
 <SN7PR11MB69717099C98AD23A85C9E66DD4B82@SN7PR11MB6971.namprd11.prod.outlook.com>
References: <20240724044505.3345411-1-dnagodra@cisco.com>
 <AS1PR10MB56974EC49B3D514BA1AB549CFDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB56974EC49B3D514BA1AB549CFDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7752e62c-f1d5-4219-bb5f-b6b6692dea0c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-07-24T06:25:03Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6971:EE_|PH7PR11MB7145:EE_
x-ms-office365-filtering-correlation-id: c936cac7-19d2-4f3d-f1aa-08dcb6ca2176
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?q0fRZdgOWh3/XCKZglbeJm/reIyClZJy6Val9DdRWeJjSZ4Kaid0VMwMgPbl?=
 =?us-ascii?Q?12ovKbVaffAnZaVX6FAUH5Rd/KZyzwhV8ZYsSayJJZcr75g5Q6XVka1iLVEL?=
 =?us-ascii?Q?rnk3XnD9bzEsEKyrhdt1jokan6WmuJCFg1Xtq4zLIu1djUVdjqaKLH/nkm5r?=
 =?us-ascii?Q?gr2yjEvyZlh05uVUYlSNcYkcc4eRd9k0Vc7IPDy9qD+cohv4fZT2vlaS+CN6?=
 =?us-ascii?Q?FXqh7tanPkBQUJFE5rDJo7jnXxpxQqshxajL7e1BDaUM8qmoIYlttLWyInUC?=
 =?us-ascii?Q?gv/ujkTstMqoqs2BM4YtNSl+RFRobFcIZWhVLssvulqFPHoiCicTlxIF+phH?=
 =?us-ascii?Q?Hmh+2+r6mB+3KRJTeW9z2OAD1zXBi6EGmz9Cx2Hy2vybqhwU77rIg/nddxZz?=
 =?us-ascii?Q?wuFaMPxyEhGcU9OyxfiQujZurFo7np0PS7JEyZd8uoSQ8EHPgeKkvm436eqU?=
 =?us-ascii?Q?u3Ex0Tm06leGaLuxTOBPLpeEmLjFUKVeu9kaWi7SfWaHESrOqQEysEnKitof?=
 =?us-ascii?Q?Rp1xCc8EQve2VSJYhUROwLrkZvt/LQg6qHohYj8+D7f+5sUqRzk0d4Lteruv?=
 =?us-ascii?Q?EyHYd8ejDeoyuUbejAc/hJLvq6163W+hlN2iRXkf9viI8XntJThU5IEf5qcA?=
 =?us-ascii?Q?TtwXMOmgqQc6SN+dRCDfehn/EHxbYgY5hd0oZxwovR1Txj8NUVUffYDeBq1F?=
 =?us-ascii?Q?GkO1WnfkWbsm77EphZd3HdvdMuZqLV9QxIdo7IreqZcQBPd6s052sv3LL871?=
 =?us-ascii?Q?pkV1PTnfcR4de4fib5bpNezVrXPgmy9UqWy6vBpICv1xc1T8AJDUGUbD7+9O?=
 =?us-ascii?Q?t+jHJIpeDXhCyuAVL49RFUrap3GRfOLl7xN/DMrz8WxR68SaADhNgQzq1I/q?=
 =?us-ascii?Q?fY8++zubKb/EtIV5nBYnKFqBrRATb/ZlXUIhJInHfNwppcG3yLhAh8V0eOLe?=
 =?us-ascii?Q?2bGnBPT/6JNnaLX01Z3wATw9JQ5aeYo74SVnV8Z9czdqHG+SeV/NxODOgKwA?=
 =?us-ascii?Q?9XyJKnab3yTOoO/QhZ+Myjxz/pJY1zHWPKhZHQc/I34yEro2e4jmA0ggd7eu?=
 =?us-ascii?Q?C89VAghOE9s2MjBm8lxoaiUeG7J/sc6D9tTTC4bS7UDa+d9hptTsORVlSDh6?=
 =?us-ascii?Q?lICGg+q1fwAT+hWUIul/T6TbexZcikKfSLHB9mE39o7zXdRmbLTfMlPw/ygC?=
 =?us-ascii?Q?WwlaS/gYD8u+WWFkPf8tQLmQT4CbpjUR/d51M4jXV3XA28cdeT+Q7vNLIO/h?=
 =?us-ascii?Q?NTGoZ58nGqMcE32qQV4fTaYbv2FfDeJUeXM2aiM5KI9wWNOSAcAOL5XZ/TXs?=
 =?us-ascii?Q?RkW8zZCm6RA0XFHH342IG4Pmp4l71XeAEiiQR6QkBGhKn9CdpnbuKX3zaPvg?=
 =?us-ascii?Q?wJOBGeD7yy4FzvseKOF7jJui69ViLqibwgC1pF93VuUyqouixg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6971.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?sHlDDiBL5CPcw5WTUPyTtMlq9Yk+tiyR5fRP/b7fI5S93cAZ2Cf0373onuiR?=
 =?us-ascii?Q?XVI+5c8E69/STSWY/F/NHVn2bsyaCGgq8009NB1aAjJNr9+FTy/SpjiPI6fW?=
 =?us-ascii?Q?dDEehMQ3pxRliK8b1JfMq5gPXbYfrEVvJLpqpHLfrSrKipolpsjsZEgyczzv?=
 =?us-ascii?Q?SidZ9J+F5s3WuFRUBh1bZvNT0rR9lDg57Dcw9jAzuIz/vRWE7VzmUdVraLl7?=
 =?us-ascii?Q?Fu8iwZPnNdEIupSv7oqCiGXx2txEje6jqWR2X3VoL+SWIAZZ5w0G89vP9vQ4?=
 =?us-ascii?Q?K+Jja3JPBhA4CQbz3Vzaydoci+k1K5f1UD9TR18pZJUTdAeTciCUZn1n7P5R?=
 =?us-ascii?Q?4+M8lXmaJ4HGvpuzVxgw11LL3s84P9Unymgd+ZVH5muhACseD1Yxi+i06W0r?=
 =?us-ascii?Q?EkusRmhFfC4AjXpWtWSIFQ0ZwXGW2gYGqNW8UO9V3SJ3YYm6ue8ipaiD8eNG?=
 =?us-ascii?Q?Kg+57T2lY8PbYgzP48gXB74IWJ4q7klVh88QBacl1hRhNebp13Xpv3KQnxxn?=
 =?us-ascii?Q?NHu50ZMCBGQEQfqWeQ5Rh1fNRejx+v+aE3baCu0qWulm6ThtRXXwFB9Kw25G?=
 =?us-ascii?Q?njcbHr38dfUC01fR9OW2TbdQ+hLIdv9WbwhIMYPn1eD0QoiPdOeyaywcR9q9?=
 =?us-ascii?Q?rQebhyCYkDgbQEfRBjvsoi6gAl+YDgBsNzcrlY1UBv9Nx+ybqCdLT7GQ6T1u?=
 =?us-ascii?Q?qVpmHghlL4aOAI1mwC4KoQVjCF0+pRA8+gwql56HekQGeWhAACUbYXICPJjV?=
 =?us-ascii?Q?iPe7nsSWw11HWUWnx69XaOsht1PgspLs4X1NnFTUCGRUYOcxAG/aRH+dL9fF?=
 =?us-ascii?Q?RHz2ND8vTCRut9wyxERnUdkM84t4rPT/jDBPxMDIFoPrqH8gn7fcT+naUxjJ?=
 =?us-ascii?Q?v1aHOlrZr2Stwkgkig+8QBqAqY7TnUXGfvy0Nf4q8bLls0SevZDqny/nSeC4?=
 =?us-ascii?Q?QBuEfELgLADeKHVt8F4bLPVzERJ+RR16HEu6ZHn96y3kr5nCgodzrQMX+65D?=
 =?us-ascii?Q?M2bcTR2s2pDEU4K5xMDvwRwPSnYtCn4a3S3bVE8cntKTseHSkJP+OOqJNGmE?=
 =?us-ascii?Q?Q9yNVo66O9la4ybsZ7I8VkvyXoNrLpTZUsSJnkCV89oojUiA7fE3/Xkxdv0C?=
 =?us-ascii?Q?FxlvY2mSmj/3Xm5pt9kztoEZYPmzzZi0IEpW5nCXnyR7iXlfkGpiyhLEMm22?=
 =?us-ascii?Q?P13IJ1QUTvZRCRhTIhGRGTI1MRz79oEl+UO541R9Jrhb/A6pgA20EDvPYMxR?=
 =?us-ascii?Q?GPjbYtDvelsbF6VJQRt/Oxvw3vEHeq+A/O0qpbKsI51Eg9pJ7GfmbJj/lsZU?=
 =?us-ascii?Q?cYgy4XiISftM5/v3IFxNqihJ9M0LFwZPeo5rgt8sUh+5peeo5WQwQziy9agJ?=
 =?us-ascii?Q?3K22J+9B+mnlPHS/YK/ean0itowAta25Lwd6OJgHOUa1QvZRclf9cnwgiLc4?=
 =?us-ascii?Q?ZCgPukCwB0XAtzRIAg60AgEQkVq/nBg6NCzOHJcFgzEUU412XXmwpZgOSIti?=
 =?us-ascii?Q?H6aa9zUT2mxjoLn/5A0FYHm36k8PcuSg/gdUoXiSlmJTwTPiSdBcc2Ccj7nE?=
 =?us-ascii?Q?83Le/Q+jM4mosE/NL7cn6QEqMFUbF1lISigcr8p8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c936cac7-19d2-4f3d-f1aa-08dcb6ca2176
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2024 10:17:24.0272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xcDAS+sOuDdSGKUwZEAAjB/miL2e2TWoFGkLuNosfv34qsBXvsIIGWy4QuyGF2yUbDIwj7M86QreXgVZjq6IqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7145
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: alln-core-1.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 10:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203063



>-----Original Message-----
>From: Marko, Peter <Peter.Marko@siemens.com>
>Sent: Wednesday, July 24, 2024 12:04 PM
>To: Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)
><dnagodra@cisco.com>; openembedded-core@lists.openembedded.org
>Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>
>Subject: RE: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
>"Unpatched" status
>
>-----Original Message-----
>From: openembedded-core@lists.openembedded.org <openembedded-
>core@lists.openembedded.org> On Behalf Of Dhairya Nagodra via
>lists.openembedded.org
>Sent: Wednesday, July 24, 2024 6:45
>To: openembedded-core@lists.openembedded.org
>Cc: xe-linux-external@cisco.com; Dhairya Nagodra <dnagodra@cisco.com>
>Subject: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
>"Unpatched" status
>
>> - The 'upstream-wontfix' is to be used when the CVE is accepted by the
>>   upstream, but they are not planning to fix it.
>> - If the version used in Yocto is vulnerable, it should not have
>>   "Ignored" status. The package is still exploitable by the CVE.
>> - Also, when the status is exported out of the SDK, it would be
>>   incorrect to put it under Ignored catgory.
>
>The purpose of this entry is to remove meaningless CVEs from reports so th=
at
>users don't spend countless hours over and over again on analyzing "open"
>CVEs if they were already closed upstream.
>If you look at comments of entries using this category (7 in oe-core scart=
hgap)
>these CVEs are more or less irrelevant.
>
>So this patch is from my point of view step in the wrong direction.
>If you really need to show these due to your CVE handling process, you can
>easily override this variable assignment in your own layer.
>


I tried this in my layer, created a .conf and included in my distro.conf fi=
le.
The issue is, it gets overwritten by cve-check-map.conf (as it is included =
later).

Would it be okay to make assignments soft in the cve-check-map.conf file?
This would be similar to CVE_PRODUCT and CVE_VERSION.
If everyone agrees, I can share the patch for it.
Is there a better way to do this?

Best Regards,
Dhairya


>>
>> Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
>> ---
>>  meta/conf/cve-check-map.conf | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/conf/cve-check-map.conf
>> b/meta/conf/cve-check-map.conf index b9df41a6f3..7ff53f5601 100644
>> --- a/meta/conf/cve-check-map.conf
>> +++ b/meta/conf/cve-check-map.conf
>> @@ -15,6 +15,8 @@ CVE_CHECK_STATUSMAP[unpatched] =3D "Unpatched"
>>  CVE_CHECK_STATUSMAP[vulnerable-investigating] =3D "Unpatched"
>>  # use when CVE fix is not compatible to the current version and cannot =
be
>backported.
>>  CVE_CHECK_STATUSMAP[cannot-backport] =3D "Unpatched"
>> +# use when upstream acknowledged the vulnerability but does not plan
>> +to fix it CVE_CHECK_STATUSMAP[upstream-wontfix] =3D "Unpatched"
>>
>>  # used for migration from old concept, do not use for new
>> vulnerabilities  CVE_CHECK_STATUSMAP[ignored] =3D "Ignored"
>> @@ -26,5 +28,3 @@ CVE_CHECK_STATUSMAP[disputed] =3D "Ignored"
>>  CVE_CHECK_STATUSMAP[not-applicable-config] =3D "Ignored"
>>  # use when vulnerability affects other platform (e.g. Windows or
>> Debian)  CVE_CHECK_STATUSMAP[not-applicable-platform] =3D "Ignored"
>> -# use when upstream acknowledged the vulnerability but does not plan
>> to fix it -CVE_CHECK_STATUSMAP[upstream-wontfix] =3D "Ignored"

