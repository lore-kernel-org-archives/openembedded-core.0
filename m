Return-Path: <omatiush@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF2FC4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 14:55:44 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.web10.49120.1712933739884237475
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 07:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=WPOubIfl;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: omatiush@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2822; q=dns/txt; s=iport;
  t=1712933739; x=1714143339;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=3T0i7f57DhvCu834lyn8e55/9M7vnyG1tqmfSmfRblg=;
  b=WPOubIflY/orRW5q9UdAwIjvrEtj0Lwi/VBiPh0eSkYXQtatWLuooirg
   cTpfgMUEBoe094Sh+JxcCRYV3BpPGjfLQodm3g7kEY1eVi733QYLIKPVO
   bZ1Lu1RhhVkAIIkcu/QmWS7cNhOhtsl9UULovmB+IRUj2LKTu7DS1YYE9
   c=;
X-CSE-ConnectionGUID: xsSAcspLQE+/WEOEt3os1g==
X-CSE-MsgGUID: /cGq1bwVRga0DQnLqjCcOQ==
X-IPAS-Result: =?us-ascii?q?A0DXAQCzShlmmIcNJK1aHgEBCxIMZYEfC4FBMVJ6gRmFH?=
 =?us-ascii?q?YNMA4UthkqZW4hQDwEBAQ0BAUQEAQGFBgIWiAACJjcGDgECBAEBAQEDAgMBA?=
 =?us-ascii?q?QEBAQEBAQYBAQUBAQECAQcFFAEBAQEBAQEBHhkFEA4nhXqGWgIBAxIRZgIBC?=
 =?us-ascii?q?AQBPQICAi8lAgQBGhqCXoIYDTsDAaURAYFAAoooeoEygQGCFgXdfoFIiC4BJ?=
 =?us-ascii?q?IExAgKIYycbgg2BV4JoPoRFg1k5gi8EmFKJDVR3IgMmMyERAVUTIQk6DwwaA?=
 =?us-ascii?q?hsUDSQjAiw+AwkKEAIWAx0UBDIRCQsmAyoGNgISDAYGBlsgFgkEIwMIBANQA?=
 =?us-ascii?q?yBwEQMEGgQLB3WBfoE9BBNHEIEyBooRDIMzgXkpgRIYgwoLQnGBHwKCf34DR?=
 =?us-ascii?q?B1AAwttPTUGDhsFBB8BgRgFnEIBg3iBH4IbOpZCiymjTwoog2uhYxeqNJhiI?=
 =?us-ascii?q?Kg7AgQCBAUCDwEBBoF6JIFbcBWDI1EZD44sDQmlaYEzAgcBCgEBAwmKaAEB?=
IronPort-PHdr: A9a23:elbpIBV7fsx4VDyGa5mJgkkPzWTV8K02AWYlg6HPw5pHdqClupP6M
 1OaubNmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QS47lf1OHmnSp9nYJHwnncw98J+D7AInX2sOy3vyz5obTSw5JnzG6J7h1K
 Ub+oQDYrMJDmYJ5Me5x0k7Tr3lFcPgeyWJzcFSUmRu9rsvl9594+CMWsPUkn/M=
IronPort-Data: A9a23:PoLA76nMo8+e4dV/K+OSC8fo5gyXJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNCmvVbquMZmT8f9BwaNu2oR4OupWBzdAxGQQ9ryFgHltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaB4E/rav649SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+5K31GONgWYubjpIsvjb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36YWBivkFrt52K2XCukMCdPpETb5LwYW8P49mAcksYJ
 N9l7fRcQi9xVkHAdXh0vxRwS0lD0aN6FLDvMWOEmMeI12n/Xjir/NhJIV1tOpZB9bMiaY1O3
 aRwxDElZxSHgae9x6i2D7MqjcU4J86tN4Qa0p1i5WiGVrB9H9aaGOOTvoIwMDQY3qiiGd7ZY
 sMFaCd0bDzLYgZEPREcD5dWcOKA3CShLm0C8A3LzUYxyy/Y4xUo2qfTCtXcIvCzQ+FMnG2Tg
 VuTqgwVBTlBaYTAkmDamp62vcfIhS79VYcYGbG0+/Ivi1qJy0QXCQYKTh28ufS/h0u0Vt5TJ
 kBS/TAhxZXe72SiSt37Gha/unPB5FgXWsFbFKsx7wTlJrfoDxixFnM/ZzVacPgfmYxxehEN+
 0PSmMiwCmk62FGKck61+rCRpDK0HCEaK24eeCMJJTfpBfG9+OnfaTqRF75e/L6JszHjJd3nL
 9m3QMUWjrEXi4sA0L+2uAqBiDO3rZ+PRQkwjuk2Yo5Hxl0nDGJGT9X0gbQ+0RqmBN3AJrVml
 CNU8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf8JNoAvmkkexc1Yp5sldrVj
 Kn75FM5CHh7YSrCUEOLS9PZ5zkClPG/RYq/Cpg4kPIUOsAvHON4wM2eTRXNhz+2yhdEfVAXM
 paAesHkFmcBFali13K3QexbuYLHNQhgrV4/savTlkz9uZLHPSb9Ye5cYDOmMLtjhIva+1q9z
 jqqH5bQo/mpeLegMnC/HE96BQ1iEEXX8riq95wHKbfbelcO9aNII6a5/I7NsrdNxsx9vuzJ5
 Xq6HERfzTLCabfvcG1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:VgD1I6sBvlrS4WH1mOyptc8+7skCP4Aji2hC6mlwRA09TyXGrb
 HMoB1L73/JYWgqOU3IwerwR5VoIUmxyXcH2/huAV7CZnirhILGFvAY0WKP+UyFJ8S6zJ8g6U
 4CSdkwNDSTNykBsS+S2mDReLhQoqjjzEnrv5ai854Hd3ANV0gU1XYANu/tKDwOeOApP+tfKL
 OsouB8i36Lf3MRYs6nBn8DcdTiirTw/q7OUFotPTJizBOBow+JxdfBfiRw2C1wbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819pqHqW3+4koAwSprjztSJVqWrWEsjxwivqo8kwWnN
 7FpAplF9hv6knWYnq+rXLWqkndOXcVmjzfIG2j8D7eSP/CNXYH4g169MVkmy7imggdVRdHoe
 R2NiyixsNq5Fj77VXADpDzJmFXfwyP0DQfeSp5tQ0FbWPYA4Uh9bD28C5uYeQ9NTO/54Y9HO
 Z0CsbAoP5QbFOBdnjc+nJi2dq2Qx0Ib1y7q2U5y4WoOgJt7ThE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyUwX2MF/xGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhNyJcpgp
 zOXF5RqGZ3cUPzDs+F2oFN73n2MS+AdCWoztsb64lyu7X6SrauOSqfSEo2m8/luPkbCt2zYY
 fEBHuXOY6VEYLDI/c84+SlYeghFZA3arxhhuoG
X-Talos-CUID: =?us-ascii?q?9a23=3Ahv3tGmvUwUXjySAtzYNiFOfq6Is1aUb0x2zIB3a?=
 =?us-ascii?q?VSiFWZZq4VQSX4/prxp8=3D?=
X-Talos-MUID: 9a23:ysXkcgq+ZEravZOZk/4ez3ZpG94x6buQMk8Eybk/ve2dNwd7HA7I2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-2.cisco.com ([173.36.13.135])
  by alln-iport-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 14:55:39 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
	by alln-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 43CEtcgx009326
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 14:55:39 GMT
X-CSE-ConnectionGUID: bldODMscSieZZzGxZyk5AQ==
X-CSE-MsgGUID: ClWdJGI1Q8mKNVkS76Ghrg==
Authentication-Results: alln-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=omatiush@cisco.com; dmarc=pass (p=reject dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.07,196,1708387200"; 
   d="scan'208,217";a="27788355"
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
  by alln-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 14:55:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2NuuGTDVq2XiKXLqVugJCM69OdCUIsOCV6MiEqTngQ6qLw2leM9RuH/qkUaEsYHmKe4L1Uc79iqyvLviyyvykT6V334Kzj0QrKDfJ026u2IkH3EOLtwhzyXJF/AR6d+ytHuTlpLaTV7BynEy7L0TLBNUAzp9WjiaVO9/6Ff2r1V9nyyekLEXx9Y8/js2AYwwxdMHnCugVypmqH7AzPHDOr1XEAdxpNJDWpOQ9+xzfBtPpXg9OTEtuuS+r0O/DQLHkElku9mKTRSYypci4H9uZowPujSI5vxChGEf0L6r/tstlPba3Ok6djckuCJL83NAeBfef5rjWcCafWuuud/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3T0i7f57DhvCu834lyn8e55/9M7vnyG1tqmfSmfRblg=;
 b=ixYKgXT6JXMadlNuaAizJ2xEnxPQLUOUaK5bIHN6pGimWBcioeIx3z2vT8Dxz/0Fy8LujfyP9x28Cia0BLYoauE3F4wF7YzBhuDRQHCidppP3CCXOWwuUoavOGVS3yqaflHCN2uh4NNZs0mt30A9eQHCqdPXghpSN+8YvDa0OgcLSSPxw8aozBjgwRHNtq53UMrcqGHthcAHLn2adz0gszssSBRSwSIXX6vld7AoK9IB4Sf9bydg5MDK5XAZtU0HyAdue+AVPpOtLiQJPtnU+m6N9kbTqteN4S4p1lOV6oMDDNL4cNw4BWbeMpSCAGISUIk7D6DgEUR2iKCjaw0Yow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH7PR11MB5765.namprd11.prod.outlook.com (2603:10b6:510:139::7)
 by PH0PR11MB5189.namprd11.prod.outlook.com (2603:10b6:510:3d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Fri, 12 Apr
 2024 14:55:37 +0000
Received: from PH7PR11MB5765.namprd11.prod.outlook.com
 ([fe80::94ea:a61f:7218:28c7]) by PH7PR11MB5765.namprd11.prod.outlook.com
 ([fe80::94ea:a61f:7218:28c7%5]) with mapi id 15.20.7472.025; Fri, 12 Apr 2024
 14:55:37 +0000
From: "Oleh Matiusha -X (omatiush - GLOBALLOGIC INC at Cisco)"
	<omatiush@cisco.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] nativesdk-gzip: fix reproducibility issues
Thread-Topic: [OE-core] [PATCH] nativesdk-gzip: fix reproducibility issues
Thread-Index: AQHajLzAzB4upqcTAUWoKW7WtrVOZ7FkuEAy
Date: Fri, 12 Apr 2024 14:55:37 +0000
Message-ID: 
 <PH7PR11MB57655E5A76149678A9E7C7BBD0042@PH7PR11MB5765.namprd11.prod.outlook.com>
References: <20240411133255.3217812-1-omatiush@cisco.com>
 <1e750c8c4f47f43d79e6644e531cf0f4fbf84188.camel@linuxfoundation.org>
In-Reply-To: 
 <1e750c8c4f47f43d79e6644e531cf0f4fbf84188.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5765:EE_|PH0PR11MB5189:EE_
x-ms-office365-filtering-correlation-id: 8921abe0-ab5b-4a82-b71b-08dc5b009d3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vP2LWNjQmhzEuyb/Fpd85vGFcuvaXRvdUy4iMutybOa+5Jhs51x/DaxqVdlTfBNGIXZ+mdfHtrEO1mSzBayz74Ggjn/icp/d+9Lk5OLOtVplFo4TepT4BIfmkMyDtvD5ElmnuRkGDQpbXNuJsZoYj3V7WlBP5FwdhTWfhzRmpdZ7zggH7WDiknraQciDXPCEoqD1Wjva+8/92I2+06hXED10eyjNwx9WbM4C7riXJ8x/k9coSrvlm1x9R73/j/p43G0Ge77glxDX1P1WBxKbwHCXni9EwbALFAgpAJcXcxi9imXByj2I8CHdK9aIUJc9adH5z0QZFzzkMxs59kCj0ZJCdMwvlqgOA/7Z+hFa82lgTOfCWSv9uVjVJ+FKl76aJHMu/73+8NGirh6eGFgRLeA+xfCJtEOmXDYQW4wmGwmcHCzCEtXnXaqWUAKZ4KVdmwoPBC1GNPZi06SccAtLYjdAVvPBmDiG3u3hZs5aP9/zzXKqyG/zcGLsELOU6KY734+dyhg7by9fMNGtSMOG4sw3aVvqf/1h84/wq2etb8QcqtgMYxusEV6YV5rgNRWjU3ShsDi7p7j4gJlJ2dehiHTytdgxL4TX9s90R48ARiBbO/XWkmac8KrKYB4jqEx1c1Jf4Oy/cmNyCfCWf5rPdJ3gqabk6NzfFgnHOpIyK4N489b2DhWkiUZBpDIDkXTd377WG6Px1Q7lRbQwt5AgZQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5765.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bXVtTE1PZldKa0pTU2IxUVIraklxcmh6UkNVOUFSUDNOUTBtR1QrSmpUdjBX?=
 =?utf-8?B?UVB6Ykdxc1U1Z2VVbmVxcHlNTXZ3cFBBN3Z6NDA0Wm1INjFKOHVsNVFZSnhP?=
 =?utf-8?B?YmVQMEhrdlA4a20ySGsyV2wzVTF1UjlHMHIrc2Y0RE9vQ2h5YVozeHpaSm8y?=
 =?utf-8?B?R0E5WjkzOVZGU2MrMy83dVJzZmwwUXl4RVo0YlAyU2NIeHlIWVoxVWxidWFX?=
 =?utf-8?B?ZlUySFRpdnNHWEljNDdHUVNVUDg0empWZGR2WllramI4S2FERDFCalpwYWVQ?=
 =?utf-8?B?M05JcW0yNkhvNzZFZldtdk8wejJaRDFSMGJpaWh1OGlYUEV2bEtzb0dUNWpm?=
 =?utf-8?B?YVlDVGlmWk94OG5xbmhoZ1kvdFI3QVgxdDZVMXN2dDVzZ0J4RElpRWt1UGM2?=
 =?utf-8?B?L1ovMTZDUjh1N0grSkRqUENIUTVDTlExUzZWQVgyVHUzei9CVFdYRnM4QmZT?=
 =?utf-8?B?bmIwMkVaQ1J5Umx2S25vUGVSZ1VPeDNHQ0JOVjk5UU0raEhicFlkcFB3VGpp?=
 =?utf-8?B?RUdWRnV2VXZtcHpEeTU1K3l1bFovZHNobEN6U1NWVzJIT1htSDJBSnlrc1lw?=
 =?utf-8?B?cVdyTytWbkhhQ1JTVjY1WmJPK1ROUlllT1d5NndwOUZmVit4TXZMVTBVYjdL?=
 =?utf-8?B?b3o5YjlLQStXakdMWk9uaktMR1lpclJ2S09oMkh3N0hqTDhIY2hqMEduM3Bl?=
 =?utf-8?B?OVlsN3J0UTJDSHVVYXlqV0dRYWY3S21MYVBVZXpiSkVYNW4yVy92bHpuZWhO?=
 =?utf-8?B?NE9obnUvbFRiTFVTUUgvRmNSdTR1eERTRURQMVdJd1lwSUcxK2ZGNWoxeWh3?=
 =?utf-8?B?YzZFT2RDOUp4YXlUNWtyOXVKQkE5SG11bkpkT0pkVjZQS1FjVzFtMGJ5alps?=
 =?utf-8?B?TUNDMEhxMEh4eUd2b0tOcFUrS2ZnZE5STDhsZTRFbDA3QncwQXJKTmRvQ0tr?=
 =?utf-8?B?RmVXenBqRzV5VENMeVJaa2RRQXJqdmltck9ubGV3OE0vWVZ0TndwVlQxWlJo?=
 =?utf-8?B?eHNIeWhBd1d0SlBqU0hlelNQTFRGSWxCYzNRREtsUGFISDh6d2VTdEtQbmV2?=
 =?utf-8?B?aWpIZFRjVTFIT1BZMzVhNU81Q1A0RlBHRmh4SXRYTGRHUDhxRUE0elVBSHVz?=
 =?utf-8?B?eHhHNldOY1pJQUJXZWQvQzIrL01kcXRpbFJxT2RXR0k4UlNzYjJTVHVvWmFn?=
 =?utf-8?B?VjFmTG9LL1RYMStkQU9YMXc3Y1k5SUxMMmtBaVRPaE9icGNYbVp4ZHBuOVha?=
 =?utf-8?B?Mmo1Z1dEL2JiWkJCVmZiM2ZBeFVXNUxvbjhJOVhMMzJHdmF6WFZNeWhpeGhN?=
 =?utf-8?B?anRNSmlPcFk4bjhXT1NvVGMyMHpHTWFmbXVwVzVXQUNDcDVZVUJjbEF5VmVG?=
 =?utf-8?B?c0VuUUIzMkRLSFExOURCL0hDTEgwV1pUa2lsNExEL0NaYWhaNTBhVTdSeXpO?=
 =?utf-8?B?MVhqamxla3JPbzViSHcyWjRBT3J3UTU0YUV4WmxYZHcvZUFlNGJmM0Izdy9M?=
 =?utf-8?B?Z1hoYzQrNW5GM2w2WExERjBDY011QVNOMVB5YWIvYXFYMGFyK2N5dzdQY1BR?=
 =?utf-8?B?N2t6a1FDdkJXb0F1UlV2VG96T0lhZER5eEFVdy96ZGg3aXplR2VvQkNjeTht?=
 =?utf-8?B?TExYdU1WVmhEWTZSYm5ZaEJuZ2xGbWdFa2s3WlRNK3BpYlJBYUk5OXM5Y0Vt?=
 =?utf-8?B?NzFtY1lURHNRM1p1L1lYYzhVWHJtYm15NlBTM0lpaFV6enRiRWYwNjR1SHNH?=
 =?utf-8?B?eGRqZ2FMZnlXMVJDdCtLdzNFSUhYSW96TjA4U3IwV2d6V0lxT1g4emJXTlFz?=
 =?utf-8?B?WFZKWURRV083SitQejFxNjIvUEE2NHN0cllhMWpmS1pSNU9XclI5bnkxWG9j?=
 =?utf-8?B?SFdiY2RzaEdzUjZmZmE1aDUyV0Nhby82Y0RoVEZnOWRrTVpUU1JmTHlzeXRC?=
 =?utf-8?B?QjhJb0ZrNkVxaExZOXVJd2ZUUnF0WU9iVGZWeFdOb2RRaDZ5Z2xUa1ZFN2FS?=
 =?utf-8?B?Y3pYVElSQ3YraFF6UE1uOWlyR0RKZjhxQ3Q4cGJCdmorNUVlVGx0QjBhN3k1?=
 =?utf-8?B?SFR2QklZN0p6eW1weGJ3SjB5eFVyZlRXdU5iczV6Y0lyenZMNXJxaVpFNGhv?=
 =?utf-8?Q?o40w=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB57655E5A76149678A9E7C7BBD0042PH7PR11MB5765namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5765.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8921abe0-ab5b-4a82-b71b-08dc5b009d3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 14:55:37.5462
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fsk7R3K/kpLUxcaGHil2qGuTHD/IXFB2NBdmpCVf/4CSRYFAJtDeBt/smn14bKn4S0+tZD3EM8hRLa7qMZFhTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5189
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: alln-core-2.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 14:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198173

--_000_PH7PR11MB57655E5A76149678A9E7C7BBD0042PH7PR11MB5765namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQrigItIb3cgZmFyIGRpZCB5b3UgZ2V0IGJ1aWxkcyB0byB3b3JrIG9uIFNvbGFyaXMgb3V0IG9m
IGludGVyZXN0Pw0KDQoNClBlcmhhcHMgeW91IGhhdmUgbWlzdW5kZXJzdG9vZCBtZS4gSSBoYXZl
IG5laXRoZXIgdGhlIGRlc2lyZSBub3IgdGhlIGhhcmR3YXJlIHRvIHdvcmsgb24gcHJvdmlkaW5n
IFNvbGFyaXMgc3VwcG9ydCwgYnV0IEkgYXNrZWQgaWYgWW9jdG8gc3VwcG9ydHMgb3IgcGxhbnMg
dG8gc3VwcG9ydCBTb2xhcmlzIHRvIHNlZSBpZiBteSBwYXRjaCBpcyBjb21wYXRpYmxlIHdpdGgg
dGhlIGN1cnJlbnQgdmVyc2lvbi4NCg0KDQo=

--_000_PH7PR11MB57655E5A76149678A9E7C7BBD0042PH7PR11MB5765namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29m
IiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01T
Rm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAx
MXB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHN0
eWxlPSJtYXJnaW4tbGVmdDogMC44ZXg7IHBhZGRpbmctbGVmdDogMWV4OyBib3JkZXItbGVmdDog
M3B4IHNvbGlkIHJnYigyMDAsIDIwMCwgMjAwKTsiPg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJv
b2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3Nf
TVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6
IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCuKAi0hvdyBmYXIgZGlkIHlvdSBnZXQgYnVp
bGRzIHRvIHdvcmsgb24gU29sYXJpcyBvdXQgb2YgaW50ZXJlc3Q/PC9kaXY+DQo8L2Jsb2NrcXVv
dGU+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRv
cywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2
ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTFwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsi
Pg0KPGJyPg0KPC9kaXY+DQo8cCBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJtYXJnaW4t
dG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgZm9udC1mYW1pbHk6IEFwdG9zOyBmb250LXNp
emU6IDExcHQ7Ij4NClBlcmhhcHMgeW91IGhhdmUgbWlzdW5kZXJzdG9vZCBtZS4gSSBoYXZlIG5l
aXRoZXIgdGhlIGRlc2lyZSBub3IgdGhlIGhhcmR3YXJlIHRvIHdvcmsgb24gcHJvdmlkaW5nIFNv
bGFyaXMgc3VwcG9ydCwgYnV0IEkgYXNrZWQgaWYgWW9jdG8gc3VwcG9ydHMgb3IgcGxhbnMgdG8g
c3VwcG9ydCBTb2xhcmlzIHRvIHNlZSBpZiBteSBwYXRjaCBpcyBjb21wYXRpYmxlIHdpdGggdGhl
IGN1cnJlbnQgdmVyc2lvbi48L3A+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9
ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2
aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29s
b3I6IHJnYigwLCAwLCAwKTsiPg0KPGJyPg0KPGJyPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+
DQo=

--_000_PH7PR11MB57655E5A76149678A9E7C7BBD0042PH7PR11MB5765namp_--

