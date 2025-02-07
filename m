Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD93C02194
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 02:03:49 +0000 (UTC)
Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com [68.232.159.247])
 by mx.groups.io with SMTP id smtpd.web11.59855.1738893822176371621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 18:03:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=pIJs7RrQ;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.247, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1738893822; x=1770429822;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=/Oo4ouu0mp/BtKxGPTO+9WLpDWSYlH5g/2877macOQA=;
  b=pIJs7RrQdl4LN6/x/l3Oyi/nF5fLmZPKG7F2Uj2Kc5PiEIoo++9fF78Q
   lToNZzKEk9hIHz5Wumz1rAk7PcXc6SpCbBXu1x7cKJ3HtO6GdPb5N7FW0
   5yypF9hoRHpUWAYojr1fsj0oCGbZ2qmiKBtr4iNlLzsfQAokapbaB8GSW
   sK1hdYALk7D65E5jCP+AeAPfg8+ZtOuzIXcs/Lz5l1qOp7qOmZPR1p56D
   BVcG/QH/OL9hr+f7Rweww+RbmJI/fEE7WdJJUKJS+lA/olf6SBOOfHAhN
   cO5DmNldMzv2LLMgTeBz5nA9lAqk91Np6+cBjfLkQNuwfUjdKFGTadJ9s
   g==;
X-CSE-ConnectionGUID: B5WFYzo6QjOz54tPHoji4Q==
X-CSE-MsgGUID: f1m2JJR+QRaxXdLubsijdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="145749302"
X-IronPort-AV: E=Sophos;i="6.13,265,1732546800"; 
   d="scan'208,217";a="145749302"
Received: from mail-japanwestazlp17011030.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.93.130.30])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 11:03:38 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTLvMC0HAb2gTSwxJMenX125JUHsgopihaUj+rMMaXdjymxtQDy6tSvSqVjxirDdp/PZGUY0BS6bKmbI6nB8Dw1r8wYYBuKafxXftskeyip6pAGryQ0+Yd3dapWRqkdnAEZyA4yvlqraqQss6+3/G6aFPO6QRIahSGbLhuzUjOjqBT5bFuIzrrHO2EwFPMoa/jocZdGxLkDmzCA2vN0WZZUayVK/oWO7F4LqtzAmDlK6F9mBptm+w6Ek+1Z8F9zkjhs2VGE0NtLDXvZMhYba+KDMx97OW5esIAGfaYvvmvMjhwrHUK6yEF79HleW3DeEdKm0q9M8RJAMCeWDjwJPtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XFeFbA0kRWcGykpt1zCBZdkJ11bchf2KwWhAhgXO48=;
 b=FbB3EOsCkgnuCu6/kJhx1MeJSKsCPQkZj8IHbi0gDpQvKhobeQ72uBy1DllbKvaBiBze0t83ZWLfPzjpR7/TcrW1B0KiXVIaY/YIG7nQVpGOqTXGYb3R7yNkq18we2f6Pr5i5JQzk6gQLnXGr2QCD0M++11l5T6smygap+BB1M8zYEtyZ/LL/c15P8ZBZ9CkvXLEMXa/iX6p7TasGorso5GGxro1QUhJly0mC9d3yN4TODyE0EetN7ee86p0bOYPRrhROyvpRUo97lH2Fbzab+pBziWzynItbkcLfQIz30znGihDkJ7GFUB6XrGULsqMb405FH7ZcpSb9+lnQ2H5Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TYRPR01MB13234.jpnprd01.prod.outlook.com
 (2603:1096:405:112::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 02:03:35 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%4]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 02:03:35 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Maohui Lei (Fujitsu)"
	<leimaohui@fujitsu.com>
Subject: RE: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install conflict when
 enable multilib.
Thread-Topic: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install conflict when
 enable multilib.
Thread-Index: AQHbZ6xZzTsZ6qT/3Ey33XrVQ0r3ubMhY4gAgAACcwCAAJBAcIAAia8AgBi5NyA=
Date: Fri, 7 Feb 2025 02:03:35 +0000
Message-ID: 
 <TYWPR01MB1186150CCA7356A0F8E211977DCF12@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1736986779-18213-1-git-send-email-wangmy@fujitsu.com>
 <B0D54F55-821C-42B5-8EF6-285E7055A9D8@arm.com>
 <CANNYZj8Lbz7s6JeQzrXu=MCbyQ5bC6RZcyLYLMc6MyHvcXLc6g@mail.gmail.com>
 <TYWPR01MB118610AE7185CEB27A28AFD98DCE12@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <CANNYZj_zmLZnyPPKoRs5GdUe4sS_Uw7dtgET39=r7g12-3UF8A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_zmLZnyPPKoRs5GdUe4sS_Uw7dtgET39=r7g12-3UF8A@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ActionId=2b3ecdf5-1172-449b-8a26-ab468dcd7111;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ContentBits=0;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Enabled=true;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Method=Privileged;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Name=FUJITSU-PUBLIC?;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SetDate=2025-02-07T02:01:50Z;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TYRPR01MB13234:EE_
x-ms-office365-filtering-correlation-id: 3f3688f9-5cc4-4f6f-4856-08dd471ba15c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|1580799027|8096899003|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?gb2312?B?WTY0WVZZMUxZL1ZIYURxSEFESWJtZjZPL1BTNnpURWkydVJ0Tm5TVGRWYTBN?=
 =?gb2312?B?YWRZUnFybVlTM2MvaThibjBseVB5djJNZFgyU0VUOFhlZUJLOTUzdTVaQ214?=
 =?gb2312?B?NTRxWndPYVE2WFIyMjh4cjRpMDNUNjFPRm5pK0ttTEtKUFlVQ0ZXTUk1Q2dB?=
 =?gb2312?B?aU55aG1tWDdPRVdydGdLa2tPM1pNeDlpZzNFUlZHc0NUcldXSnJHMVZpWXkw?=
 =?gb2312?B?QkNBUVBKWmpRbTZLTlByYk9UajBOeHoyMXhuZk5rVEZEcHpXMFN4ZUd0em1a?=
 =?gb2312?B?Q2tYa21EUVhpa2h0eFdJZEVXdkpScTZZc2huc3FVSkFJVmQ5Tjl3NWxiVDIx?=
 =?gb2312?B?Tm03Mm0vMlpaUDVyM3prREdhbFR2WUVKUlUwK092REhxam10Nkd6TlJubnNx?=
 =?gb2312?B?azhQbzBSb1JWeXoyU1pCR0FMb1FvdkJRYVFDSTh3WlUyb1VtVHJLQzJrcnpH?=
 =?gb2312?B?d29tMXg3QXFYR1k0QVdxVmJxMnBhck0xMkhpdGh2TUVJVjhiaXBOdXpIVEIx?=
 =?gb2312?B?dWVBVGZqRG1rbkF3OE56M2hBdWh5QllyYU5FSHBXbzdTWUxEWjlGYWtGRUNu?=
 =?gb2312?B?bnJrdUoxNkxMU0prSVAwZVVRZjMvb085TUhUMk81RThWZkY2NWl3R3RpQ3Mv?=
 =?gb2312?B?RlFlTE9hQUYzSkU0VDRubUpDT3VIbUUwV20vMklBLzVyRjE5eUtaVU0xeWlm?=
 =?gb2312?B?cEJnUkNKTnFRRWdVQTJad3Uwb0JZaXhCRGVFY1ltRDhqUWJFdmR0SEhlY0JS?=
 =?gb2312?B?bmdQeENwc2xHWFcvNnY0ZGh1MzErYU5ROWdsQzRMWTE2RjAwMEEyR0lObDlp?=
 =?gb2312?B?ak5OcjZZY0RFZ2NGY2d6dU1HVkZSUkwvbWpuYVBIQm1Jc1dScDkrem4zSGJt?=
 =?gb2312?B?T3RuSk96VGxwY3l0Ymlwd0NsYUVYZDNhYmxNUW9RejBWL2M3M0podVRkWFpa?=
 =?gb2312?B?N0REWjJaNGU1ZVlpQVEzTkpsaEJOeFM5VlAyTUpXbmxMbjQwTXdWUkRoQjJ5?=
 =?gb2312?B?cWVpNi91eVFVUVJPRFRxL2MwODI3K2NWNURMMFZJcjB4aUdodk5DR3pyNFJO?=
 =?gb2312?B?Vk03VTFtS3NmOXBZWUNYblB4S2ZXQkNsYWV0MTNQM0FOYm51bDFmVzNSTVlE?=
 =?gb2312?B?TldTMXdKQnd6MWtHZlBybUtYR1ZoTzdrT1UzZXVFNmMySGdURmw5NWlJYVc1?=
 =?gb2312?B?RWdob3dhL2hTSHhGd1NtcGFlaCtaY0dCaVY3Y01HL1BneXJhazFIMElXWUZx?=
 =?gb2312?B?bWVhVTZPOTJESU1JV1BtdWZmazJHczRzenpiLzUyYzBqZzd4Q3BiaWllTTJs?=
 =?gb2312?B?QmdpQkZiZkNuemtqL1VCdWk4TFhyVzc3b0dycmlkV2dFTHZqRjc4d3BYaXdF?=
 =?gb2312?B?RVdqQXRBYjZLaE1CNDFWQVpNTWJvc0VsZ0xqenR4Y0R3THNaOTZuQzFqV3lY?=
 =?gb2312?B?ZFBOdkxWVlNwUi9DRktrckg1OFIwZVM1UDFaSjV4bG1pMzNyaHFOMW9sYkVW?=
 =?gb2312?B?MVJvbjdtcnNEYTdveHJtdVRBSDNQZjliSUJqMWxrZFVnZENiVXhJMUZhb28y?=
 =?gb2312?B?V0MvcU1aSHhjSHNEL2RnUDltQU1UaE5IaGlybjFXZHpjSUNDUnFvNUIvSjJE?=
 =?gb2312?B?N2J0Z25Fc29qZEVQdTIrZEdNMGw5NWdYVEs2MkgrUE81a1lMcytLSitJS2Zw?=
 =?gb2312?B?WjQvd1FUMExEY1JpQTlmWHZ6c3FDQUtHYUtZYmxjK3lmWGdvcDlkSVREK0xG?=
 =?gb2312?B?NkUwSitjaURkckh1dXgrZnZIcEQzU24zUDgvSTFyYVZWbURwN2Q3c1ZrVmFF?=
 =?gb2312?B?QlR3aWxxQXEyKzRMZzJhRDE3ZEUxblJYOHNQbXdSZzY2MVprcWpKem9PektI?=
 =?gb2312?B?UlFLV3MycnhnL0NxY2lHVXVvVGxiRDl5bnEzd0FZTVRNZ0Q3V3pwQzdYUDk5?=
 =?gb2312?Q?vJmrw8/KrXo=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(1580799027)(8096899003)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?UTBjcDZ5K0ZxblFoR0hWaklBYWl3NHpQMGtnNWpCR3BhNnlvSXQxakNmeG11?=
 =?gb2312?B?eFlTOWFTS0ZKUkkwL1VEZmlmVXVVejVhaDFaRG1OUlg2TVhCbm1XQ2F0U043?=
 =?gb2312?B?VmZZNmZzRk1MU210RVpLM3llWG1qM2JuVWNwUHdNS0NjYWx1dS9HZjU3UXJB?=
 =?gb2312?B?aXhUL1Z2UWZkRU5QVnBZd29lUDBZWndtYmdOVmUzaWVqSHN6VVFDZVBKd3F2?=
 =?gb2312?B?QXhlT2c0OG52OU90UGxVSGxKb09Wc1FaRGsvRDlkbWtFbXFKOVRRREQxNEJV?=
 =?gb2312?B?VTdyZmtHc29kK280SC9PdjN3M240R3dnVGgyWklQZDZyc04yWENRRlc1dTN0?=
 =?gb2312?B?QWxOQXFacm1RNXVYc21UWDYyWW9WUGtSZ081dW84dFp5OXR1MUw3dndiU29F?=
 =?gb2312?B?MzBOQnM1ZkhIUStBcmQ2TG1VS3JTYWg1YXY0bENIN0MrZTZzWFhwcTVnUERB?=
 =?gb2312?B?NXBDd283eE5neFBxZWQ1MXZyV3ZVc2M1b2Fad1pCQSs5WXM0MVVjRmRwckpq?=
 =?gb2312?B?ejQ2R0lGYStTRU5uWERzSmhXaWZ4VGlrZjJFTFFmUjhSTEVKQnhqTVRmcENP?=
 =?gb2312?B?cWh3cGlWZXpqMFdwSllkRHRxbkdXaXlGcmNRZ3Z1NnQ4RmhXNG9oUTI1aVhY?=
 =?gb2312?B?Q2RENUdRRUFSUFNubGFYdjA3amhMRG1KQllKWjlPOFZ5NWwrdEIvTFoxeHQ5?=
 =?gb2312?B?Y0swdTYvMkxEOXliSmM4REVZanV4UHJ5WWNzZlJnQUl2ekRxYzlPRTFKMTk4?=
 =?gb2312?B?SnpVZTZqTW1pOHhYMi8yYVpqa240YTJzYmFaWWh4TFdGN2xTL2pTL1F0bkIw?=
 =?gb2312?B?eWRFREFuYk5yZTNURjNQZkJ2S1h6SzM5RlUyWC96bCt4YlNPQWI5WHR3M2V4?=
 =?gb2312?B?L0JUbVl2TE5lbVQyekFFSk1CS0xObXk4TmJKcDFzU21zV0pHTGtsZU1WZDFF?=
 =?gb2312?B?b1ZSTUZrK01KeDFFd3NNdmk3Q3hYbVJyUjEraHhERVIvODJ2OHY3TjJoYXhT?=
 =?gb2312?B?VEpabG1NSXVhVExmdU13a29paDBCUDVrSWE3NHZjSzF4ZTlaYmFGUXlHWEo5?=
 =?gb2312?B?TlJDejJ2TU5oRFY2ZGl4OWNJZXlzMUxTZUpzNzFMWFFDdXhQNUY2M2lrZi81?=
 =?gb2312?B?MjdjdGcwK1k4eXhEdmozTlBkbUZCVUhPNm5xbDRoV2lzdWVtVVBTOXRHR3Av?=
 =?gb2312?B?Y1lZZERjUlFYdURReS8rWmQ2QXdCZWpwWlFlT3VyWFlRb09RbzdxZ3FQMG9I?=
 =?gb2312?B?YVd3bUc3OVpEZzFCNFNRVTF3d1Jtb3J3cnFSTTl0b09Cb0ZvZUc0bmJYeTZO?=
 =?gb2312?B?c1hCSjRPdUhpK0dxMWxoeFZRMHVabHplOXNvd1JHQ0ZPekZhUEFEcVphOTRW?=
 =?gb2312?B?SWRzenlmVzJZc0NDVmJVSWg4d3FlRDdlR0s1UDBZYWljNGhpUTFwbHFOTzNw?=
 =?gb2312?B?ZlRNdy9aU2RvNjhuL2RQQ2xvb0JoaHMweW9FVFhrcmtIRzhuenJtUkIxWnYx?=
 =?gb2312?B?aWdzbFpXeXhDZTBOdTN5UFZkS3Job01ybElRQ2J5TFZDOE9pZGFvRS9SY1VE?=
 =?gb2312?B?RFRQblFLODdxaFBQdlBSRlVDa0EyckszUmIrNEVQL3dRU0hNRVJwUjh2dVVs?=
 =?gb2312?B?ckxES0xPRXE2ekhWWHlpV1dSQmNNeko4bEpGTWJPK29lbFRtMXRpcWtCTENE?=
 =?gb2312?B?REhFMTdYd08zeU9CYUlwR0ZSeSsyTHdvK0lXSkpybDNoWGUrRmwwVm0xM0Jn?=
 =?gb2312?B?TmdvUnUzaVZGTTlpSmpRdGcvcGdGd1J1WDVONE8xdGc0dDMrUithUUVvN2lW?=
 =?gb2312?B?dzRHaG90ZGc5NHRvY3A5WGI3WUltZlByK09ueVI2YzB3b0EwV1R5SHV2Unky?=
 =?gb2312?B?VmEwSkk0OG5XWWlLS2ExVUZWOE5sd1VHejhka1dhMFFCQ0lrQm1JOW9jNUdJ?=
 =?gb2312?B?Z2MyU29xcElpZHFKTmwzeXovOHFhTjhCNDk4S2FvNmZJcDZWRnNVdEpHVkRP?=
 =?gb2312?B?Wk1NU0NjVXNjTzdMOEF1QjdjSXl2ZlJKYWhxNUo1YS91dzkrcDczVENtK21B?=
 =?gb2312?B?WWpEWGhZbFpONERiS01hbk1wNHlkY3NLNHNaTG0vKzdMaE1LODlZeXRHRzdz?=
 =?gb2312?Q?btUCuU/30q1O5GBGcEWCa/J3f?=
Content-Type: multipart/alternative;
	boundary="_000_TYWPR01MB1186150CCA7356A0F8E211977DCF12TYWPR01MB11861jp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	pWthep7LNMOm5ZuN47fE4iKTqAfVclDZB1f7xdWxFiKXJQaql2A+UcX4wL2FrrIaY1w5KK0ZsZ31eoOkZfzzXYvfCDtQi/YEKYIXiTsFrVx545+UU0ThH/mHJtQZi9wJdw0S74CIFo0RFQyEEywArW2jMsws31/MD7giwekjFkGFnl5W6ouVnEsrjvlSJwBQvWoA7LXgxSNDkEhNtxfgflDKoN7JsCnHc96CitVxD3kFD1Ol6HYHPn7vnXZ8wp0B24b3teaqaPtZ5I9cjNqaKMbx2cpAimnlSElvUmQ00HMtKDvtRWg4V3GnlJy+w+2R1+kDirx9S3o8nZL4tAQMO5XSWOZtFhxSAu2qfAtQ9Bvwj0mcduf9KQlVBBc7r2PvQTryjoN5n9MbjMFR8C7LQ8tPBKRjZ6mHrgeNGrMaQRLATqtmT6v8cA/blE4JfUITPGfLo+0z9zw1gDVWf/QiWOzqTwmoWUfTE14X3eMQVgBDl1zwCAA55Bg1NWzxUC4zxfOG16KxuM7Aeq8g5R+5WAksSwcAPggXkAymhhbHy4LeUDnk9ybAGhUb1YWFb9rqn04jWMD0K4V1zfa5sWIjVX6q1B3nPPNMy2W5jPsWSl0LyxnTYvhGq9vjYfm6vw2i
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3688f9-5cc4-4f6f-4856-08dd471ba15c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 02:03:35.3053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G04o4MSQkYHxXrFkhpsi3x0BtgexdHgDB4I4ODNAbv1jOFE/PDU/x7i0GzGz3H5BmV8/MLvFnUHb+lN7pbPo8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13234
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 02:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210967

--_000_TYWPR01MB1186150CCA7356A0F8E211977DCF12TYWPR01MB11861jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SSBkaXNjdXNzZWQgdGhpcyBpc3N1ZSBkaXJlY3RseSB3aXRoIHRoZSBtYWludGFpbmVyIHRocm91
Z2ggZW1haWwsIHNvIGhlIG9ubHkgbWVudGlvbmVkIGl0IGluIHRoZSBjaGFuZ2Vsb2cgYW5kIGRp
ZCBub3QgbGVhdmUgYSByZWNvcmQgb2YgdGhlIGRpc2N1c3Npb24gb24gdGhlIHdlYi4NCg0KSWYg
bmVjZXNzYXJ5LCBJIGNhbiBmb3J3YXJkIHRoaXMgZGlzY3Vzc2lvbiB0byBtYWlsIGxpc3QgdG8g
cmVjb3JkIHRoZSBkZXRhaWwuDQoNCg0KLS0NCkJlc3QgUmVnYXJkcw0KLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpXYW5nIE1pbmd5dQ0KRlVKSVRT
VSBOQU5KSU5HIFNPRlRXQVJFIFRFQ0hOT0xPR1kgQ08uLCBMVEQuIChGTlNUKQ0KTm8uNiBXZW56
aHUgUm9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KVEVMo7orODYrMjUtODY2MzA1NjYtLTg1
NjgNCkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBm
dWppdHN1LmNvbTxtYWlsdG86d2FuZ215QGZ1aml0c3UuY29tPg0KDQpGcm9tOiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NClNlbnQ6IFdlZG5lc2RheSwgSmFudWFy
eSAyMiwgMjAyNSA0OjI5IFBNDQpUbzogV2FuZywgTWluZ3l1L831IMP56KQgPHdhbmdteUBmdWpp
dHN1LmNvbT4NCkNjOiByb3NzLmJ1cnRvbkBhcm0uY29tOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnOyBMZWksIE1hb2h1aS/A1yDDr7vbIDxsZWltYW9odWlAZnVqaXRz
dS5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIXSBbT0UtY29yZV0gW1BBVENIIHYzXSBuY3Vyc2Vz
OiBGaXggaW5zdGFsbCBjb25mbGljdCB3aGVuIGVuYWJsZSBtdWx0aWxpYi4NCg0KUGxlYXNlIHJl
bWVtYmVyIHRvIGluY2x1ZGUgdGhlIGxpbmtzIHRvIHVwc3RyZWFtIGRpc2N1c3Npb25zIGludG8g
Y29tbWl0IG1lc3NhZ2VzLiBUaGlzIGFsd2F5cyBoZWxwcyB3aGVuIGF0IHNvbWUgcG9pbnQgaW4g
dGhlIGZ1dHVyZSBzb21lb25lIHdvdWxkIG5lZWQgdG8gdW5kZXJzdGFuZCB0aGUgaXNzdWUsIGRv
IGFkZGl0aW9uYWwgZml4aW5nIG9yIG90aGVyIGZvbGxvdyB1cCB3b3JrLg0KDQpJZiBpdKGvcyBv
biB0aGUgbWFpbGluZyBsaXN0LCB0aG9zZSB0eXBpY2FsbHkgaGF2ZSB3ZWIgYmFzZWQgYXJjaGl2
ZXMgd2l0aCBzdGFibGUgbGlua3MgdG8gaW5kaXZpZHVhbCBtZXNzYWdlcy4NCg0KQWxleA0KDQpP
biBXZWQgMjIuIEphbiAyMDI1IGF0IDEuMTcsIE1pbmd5dSBXYW5nIChGdWppdHN1KSA8d2FuZ215
QGZ1aml0c3UuY29tPG1haWx0bzp3YW5nbXlAZnVqaXRzdS5jb20+PiB3cm90ZToNClRoaXMgaXNz
dWUgaGFzIGJlZW4gcmFpc2VkIHRvIHRoZSB1cHN0cmVhbSwgd2hvIHN0YXRlZCB0aGF0IGluIGFk
ZGl0aW9uIHRvIGxpbnV4LWdudWVhYmksIHRoZXJlIGFyZSBtYW55IG90aGVyIHR5cGVzIHRoYXQg
bmVlZCB0byBiZSBtYXRjaGVkLCBzbyB0aGV5IGhhdmUgaW5jbHVkZWQgdGhlIG1vZGlmaWNhdGlv
bnMgaW4gdGhlIHRvLWRvIGxpc3QuDQoNCiAgLS0NCkJlc3QgUmVnYXJkcw0KLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpXYW5nIE1pbmd5dQ0KRlVK
SVRTVSBOQU5KSU5HIFNPRlRXQVJFIFRFQ0hOT0xPR1kgQ08uLCBMVEQuIChGTlNUKQ0KTm8uNiBX
ZW56aHUgUm9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KVEVMo7orODYrMjUtODY2MzA1NjYt
LTg1NjgNCkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdt
eUBmdWppdHN1LmNvbTxtYWlsdG86d2FuZ215QGZ1aml0c3UuY29tPg0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPG1haWx0bzphbGV4LmthbmF2aW5AZ21haWwuY29tPj4NCj4gU2VudDogVHVlc2Rh
eSwgSmFudWFyeSAyMSwgMjAyNSAxMTo0MCBQTQ0KPiBUbzogcm9zcy5idXJ0b25AYXJtLmNvbTxt
YWlsdG86cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4gQ2M6IFdhbmcsIE1pbmd5dS/N9SDD+eikIDx3
YW5nbXlAZnVqaXRzdS5jb208bWFpbHRvOndhbmdteUBmdWppdHN1LmNvbT4+Ow0KPiBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPG1haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPjsgTGVpLCBNYW9odWkvwNcgw6+72w0KPiA8bGVpbWFv
aHVpQGZ1aml0c3UuY29tPG1haWx0bzpsZWltYW9odWlAZnVqaXRzdS5jb20+Pg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIXSBbT0UtY29yZV0gW1BBVENIIHYzXSBuY3Vyc2VzOiBGaXggaW5zdGFsbCBj
b25mbGljdCB3aGVuDQo+IGVuYWJsZSBtdWx0aWxpYi4NCj4NCj4gT24gVHVlLCAyMSBKYW4gMjAy
NSBhdCAxNjozMSwgUm9zcyBCdXJ0b24gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc8aHR0cDov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IDxyb3NzLmJ1cnRvbj1hcm0uY29tQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc8bWFpbHRvOmFybS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4+IHdy
b3RlOg0KPiA+ID4gVGhlIGhvc3Rfb3Mgd2hlbiBlbmFibGUgbXVsdGlsaWIgaXMgYXMgZm9sbG9p
bmc6DQo+ID4gPiBob3N0X29zIG9mIGFhcmNoNjQgOiBsaW51eC1nbnUNCj4gPiA+IGhvc3Rfb3Mg
b2YgYWFyY2gzMiA6IGxpbnV4LWdudWVhYmkNCj4gPg0KPiA+IFNlZW1zIGxpa2UgdGhlIHByb3Bl
ciBmaXggd291bGQgYmUgdG8gY2hhbmdlIHRoZSBnbG9iIHRvICpsaW51eC1nbnUqIChhbmQgc2Vu
dA0KPiB0aGF0IHVwc3RyZWFtIGZpcnN0LCBvYnZpb3VzbHkpPw0KPg0KPiBUaGlzIGlzIGFuIG91
dGNvbWUgb2YgbXkgcmV2aWV3OyBpbiB0aGUgZW5kIG9mIGl0IEkgaGFkIGFza2VkIHRvIHNlbmQg
dGhhdCBwcm9wZXINCj4gZml4IHVwc3RyZWFtLCBidXQgcHJvdmlkZSB0aGUgb2UtY29yZSBmaXgg
YXMgYSB0d2VhayB0byBjb25maWd1cmUgZmxhZ3MuIEJhc2ljYWxseQ0KPiBiZWNhdXNlIHdlIGRv
bid0IGtub3cgaWYgdXBzdHJlYW0gd2lsbCB0YWtlIHRoZSBwcm9wZXIgZml4Lg0KPg0KPiBXaGF0
IHdvdWxkIGhlbHAgaXMgdG8gaW5jbHVkZSB0aGUgbGluayB0byB0aGF0IHVwc3RyZWFtIHN1Ym1p
c3Npb24gaW50byB0aGlzDQo+IGNvbW1pdCBtZXNzYWdlLg0KPg0KPiBBbGV4DQo=

--_000_TYWPR01MB1186150CCA7356A0F8E211977DCF12TYWPR01MB11861jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"MS Mincho";
	panose-1:2 2 6 9 4 2 5 8 3 4;}
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=B5=C8=CF=DF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=B5=C8=CF=DF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@MS Mincho";
	panose-1:2 2 6 9 4 2 5 8 3 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:=CB=CE=CC=E5;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"=B4=BF=CE=C4=B1=BE =D7=D6=B7=FB";
	margin:0cm;
	font-size:10.5pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:=B5=C8=CF=DF;
	color:windowtext;}
span.a
	{mso-style-name:"=B4=BF=CE=C4=B1=BE =D7=D6=B7=FB";
	mso-style-priority:99;
	mso-style-link:=B4=BF=CE=C4=B1=BE;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.5pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF">I discussed this issue directly with the maintainer th=
rough email, so he only mentioned it in the changelog and did not leave a r=
ecord of the discussion on the web.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">If necessary, I can forward =
this discussion to mail list to record the detail.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">--<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">Best Regards<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">-----------------------------=
----------------------<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">Wang Mingyu<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">FUJITSU NANJING SOFTWARE TECH=
NOLOGY CO., LTD. (FNST)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">No.6 Wenzhu Road, Nanjing, 21=
0012, China<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">TEL</span><span style=3D"font=
-size:10.5pt;font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontex=
tual">=A3=BA<span lang=3D"EN-US">+86+25-86630566--8568<o:p></o:p></span></s=
pan></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">COINS: 79988548<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">FAX: +86+25-83317685<o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">MAIL:
</span><span lang=3D"EN-US"><a href=3D"mailto:wangmy@fujitsu.com"><span sty=
le=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;color:#0563C1;mso-=
ligatures:standardcontextual">wangmy@fujitsu.com</span></a></span><span lan=
g=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;mso=
-ligatures:standardcontextual"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;
<br>
<b>Sent:</b> Wednesday, January 22, 2025 4:29 PM<br>
<b>To:</b> Wang, Mingyu/</span><span style=3D"font-size:11.0pt">=CD=F5</spa=
n><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-seri=
f">
</span><span style=3D"font-size:11.0pt">=C3=F9=E8=A4</span><span lang=3D"EN=
-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">=
 &lt;wangmy@fujitsu.com&gt;<br>
<b>Cc:</b> ross.burton@arm.com; openembedded-core@lists.openembedded.org; L=
ei, Maohui/</span><span style=3D"font-size:11.0pt">=C0=D7</span><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">
</span><span style=3D"font-size:11.0pt">=C3=AF=BB=DB</span><span lang=3D"EN=
-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">=
 &lt;leimaohui@fujitsu.com&gt;<br>
<b>Subject:</b> Re: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install confl=
ict when enable multilib.<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Please remember to include the =
links to upstream discussions into commit messages. This always helps when =
at some point in the future someone would need to understand the issue, do =
additional fixing or other follow up
 work.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">If it</span>=A1=AF<span lang=3D=
"EN-US">s on the mailing list, those typically have web based archives with=
 stable links to individual messages.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Alex&nbsp;<o:p></o:p></span></p=
>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Wed 22. Jan 2025 at 1.17, Mi=
ngyu Wang (Fujitsu) &lt;<a href=3D"mailto:wangmy@fujitsu.com">wangmy@fujits=
u.com</a>&gt; wrote:<o:p></o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-=
bottom:5.0pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US">This issue has been raised to t=
he upstream, who stated that in addition to linux-gnueabi, there are many o=
ther types that need to be matched, so they have included the modifications=
 in the to-do list.<br>
<br>
&nbsp; --<br>
Best Regards<br>
---------------------------------------------------<br>
Wang Mingyu<br>
FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)<br>
No.6 Wenzhu Road, Nanjing, 210012, China<br>
TEL</span>=A3=BA<span lang=3D"EN-US">+86+25-86630566--8568<br>
COINS: 79988548<br>
FAX: +86+25-83317685<br>
MAIL: <a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujits=
u.com</a><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; Sent: Tuesday, January 21, 2025 11:40 PM<br>
&gt; To: <a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burt=
on@arm.com</a><br>
&gt; Cc: Wang, Mingyu/</span>=CD=F5 =C3=F9=E8=A4<span lang=3D"EN-US"> &lt;<=
a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</=
a>&gt;;<br>
&gt; <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"=
_blank">openembedded-core@lists.openembedded.org</a>; Lei, Maohui/</span>=
=C0=D7 =C3=AF=BB=DB<span lang=3D"EN-US"><br>
&gt; &lt;<a href=3D"mailto:leimaohui@fujitsu.com" target=3D"_blank">leimaoh=
ui@fujitsu.com</a>&gt;<br>
&gt; Subject: Re: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install conflic=
t when<br>
&gt; enable multilib.<br>
&gt; <br>
&gt; On Tue, 21 Jan 2025 at 16:31, Ross Burton via <a href=3D"http://lists.=
openembedded.org" target=3D"_blank">
lists.openembedded.org</a><br>
&gt; &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org" ta=
rget=3D"_blank">arm.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; &gt; The host_os when enable multilib is as folloing:<br>
&gt; &gt; &gt; host_os of aarch64 : linux-gnu<br>
&gt; &gt; &gt; host_os of aarch32 : linux-gnueabi<br>
&gt; &gt;<br>
&gt; &gt; Seems like the proper fix would be to change the glob to *linux-g=
nu* (and sent<br>
&gt; that upstream first, obviously)?<br>
&gt; <br>
&gt; This is an outcome of my review; in the end of it I had asked to send =
that proper<br>
&gt; fix upstream, but provide the oe-core fix as a tweak to configure flag=
s. Basically<br>
&gt; because we don't know if upstream will take the proper fix.<br>
&gt; <br>
&gt; What would help is to include the link to that upstream submission int=
o this<br>
&gt; commit message.<br>
&gt; <br>
&gt; Alex<o:p></o:p></span></p>
</blockquote>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_TYWPR01MB1186150CCA7356A0F8E211977DCF12TYWPR01MB11861jp_--

