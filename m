Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9D2E77188
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 01:04:45 +0000 (UTC)
Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com [68.232.159.87])
 by mx.groups.io with SMTP id smtpd.web11.10801.1736903082256215490
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 17:04:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=pZzFy9ve;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.87, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1736903083; x=1768439083;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZQVR8ULYhbpqBLKXUolZKyCgjwykxDUf1gzPBZchbwI=;
  b=pZzFy9veuTWEKLNUFYgrjyLOodLB6TXIkdO4IBBFtBn+heoDK7ngnTq6
   gNOFKRJMgW8MvfC/qwjZR6iBYk2LTEbWiS4QIYeVS75fNWekx4bk8ZN/H
   yBL89lKzuC4Zk8KhHj6NCPdOpZ8NmwejxEAN0h4//rAbG5dE8rRiLEXsA
   N/uvoH5Fk0B+RBwPCkFagi0wsewhji+kdONUSFMCOyJJKTH+Asks662p9
   7ILKo51VjkWyNWVPoCpYQDG/ln0EJ9mt4eK0ovZJ4UKqB3KXQieTkC1gi
   tQ5XJi3QF/0Kby64ZzrIq/yWsL+nnccgs+UEt0VXd8Fu3rgLCAhUmseE6
   g==;
X-CSE-ConnectionGUID: NjdstKSwS/2gInWbP9lKLA==
X-CSE-MsgGUID: a7LALh8GS9e+rJRtCW7eCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="142803452"
X-IronPort-AV: E=Sophos;i="6.12,315,1728918000"; 
   d="scan'208";a="142803452"
Received: from mail-japaneastazlp17011030.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.30])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 10:04:40 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3K0EgB+nQ8EbYyR5ZxNsAC9WpAjhf06rh7BpBvBZYsEO/3mmYI5C4EWICbOCC9ognuphuGVfk8hAUKobh3WEfjWnJpwwY4eN0gC1b0k8p/8i51E6ccSDR6P56fcHkYOYu6iqHzyqicXOvbaUjjEPqIirFHfuOE98XaHH61wRrNUycKJg3FztuiKcB6kbMBEkGUGMgpfMCP/GmJJYya6iMn8jRDOvhSJuUCmkJ/XsFIOhtHQ3aYFjPtUHIOfAhPt2LM7npDtmqXsQA1bBn87MjACdOfhVui7P58hTK6oIE/RnMetyWeSMNs9ixz1NfCIBo1H2YVxTrDmOed1ppSqxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQVR8ULYhbpqBLKXUolZKyCgjwykxDUf1gzPBZchbwI=;
 b=WcJbqCImoixus7311p8kl3c4BknCkMir9E4VZ3gj/h8/6eVP9kIFFUHzb/DzsoV43Bo77R/k0rZYDMjBZdZ98q06xavceS7yWF+KIi2AFqSVsRbcWEMrfdv3RiozZTMO8nyaMtOG6oYiEhpE4pyFPStf9Zk55j3HSw+D6uuU6qWBzYlQczXDB0t1bL3fQ5Al1NpKC2RXfGP4QBXqP0WJRmCajSpiKkqUQMI7iD+sWNMUcdA/lpB2Rm4mse9rm1JHDPQB1y9IX3NTw61HHBeJBl6NadVNIxrdgHsJLaXJDa/KUmdY9uMIwjSRcUbC2SuH81i2rm4dGAaXSzjqTOeglA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TYXPR01MB15225.jpnprd01.prod.outlook.com
 (2603:1096:405:279::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 01:04:37 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%6]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 01:04:37 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Maohui Lei (Fujitsu)"
	<leimaohui@fujitsu.com>
Subject: RE: [PATCH] [OE-core] [PATCH v2] ncurses: Fix install conflict when
 enable multilib.
Thread-Topic: [PATCH] [OE-core] [PATCH v2] ncurses: Fix install conflict when
 enable multilib.
Thread-Index: AQHbZl5O/+Gs1UzEP0unmeQlgga2orMWGioAgADo0BA=
Date: Wed, 15 Jan 2025 01:04:37 +0000
Message-ID: 
 <TYWPR01MB1186111770D515F743B8A403BDC192@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1736843308-4094-1-git-send-email-wangmy@fujitsu.com>
 <CANNYZj_=sCFxY83eCUzSVu5e7HXwB-pk1r4RS26LovYT=i6q8A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_=sCFxY83eCUzSVu5e7HXwB-pk1r4RS26LovYT=i6q8A@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9YTJlZDE1ZjktM2MzYi00Njg5LWFjMWUtMWNlZDQ4YzUz?=
 =?utf-8?B?YWYwO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTAxLTE1VDAwOjUzOjE5WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TYXPR01MB15225:EE_
x-ms-office365-filtering-correlation-id: 70d8214e-4188-4342-81db-08dd350094e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NkEraWliMVRad2IvYldNOFhCUXdVOEJHcitJODVueXY5ME8yaEJLa0RNN01u?=
 =?utf-8?B?Lzlrc3hNWkRTbzZCZ3dINDJsc081WE90YU9XU1JFeExOUm1sbXRUVXJQeXZ5?=
 =?utf-8?B?ejhMWWR5ZzhiVW5rVFRsL1FzS2dIc1Arak1lMWpiRndab3c3OG94RDVTU085?=
 =?utf-8?B?ZFhlRFlKWmhsVkg4dWpFM3o0OTJJdkthZTAvTzNjbFYvUnAreG5aWGQrTUNq?=
 =?utf-8?B?WERDWk1MR1p6YUNwOU45cHJiMzA2MWF0ZlBIRnN5NGZoZ3VWaDJqZy9hai9Y?=
 =?utf-8?B?Vmt3Ukd1TTRnOG41Y1FXNVJwL09aWGszSk9XWVNiWUhOdkJDa0J1Y2RkeFNy?=
 =?utf-8?B?VmlSS2NNdjRMUGRLZGxkYTJaV2pEMnh5U2E1SWhOeHV2cmw3K3d3QW1XMGZE?=
 =?utf-8?B?UEVKN091RndtZ0FEZTJCTjBmTysxaWtWdmRiVzN6dnBVMjlrN2xwb0s1Wms3?=
 =?utf-8?B?UTdsTHdRWS9jZ0ZydTY0RC91aGxBMmhJaXZjWlArekppam5MSDZua0dQempt?=
 =?utf-8?B?Y2NTc2QyRml2US9TOVRVajNZQk9RQzJCU2QxNUVhQ3BXMmMyQ0tOSXRHeWhJ?=
 =?utf-8?B?SUdSYkYrREtLVGF5K2V1Y0JpczhuV3V2ajlGaWt4Z3BrRS8zZ0hIdk1iK2Zs?=
 =?utf-8?B?dnRaR3JQNHlhM2t4Ymo3TGtjYWRYSlUyYTNyZ0lFRWFHUExGYzFJT3g1R0VY?=
 =?utf-8?B?WFpaUFZwSXJYU1BGMGl2bHJYbHlFYXFUMms0RVpaUkpVQXc3bDZ0R3lmU050?=
 =?utf-8?B?M3hOSzZIdjg5NVE3WVlQWmwyMVl2a0tyVHVhb3RIblpFUERGZkdrWHl0Wkdz?=
 =?utf-8?B?bjFWcHl0Q0NzL3orOS9EOWVDMHNIS1lmd2trNU1SRWtjZFMrZStYbUNTbXhK?=
 =?utf-8?B?OHNQbzFvVGZhYWZoaWJUWThNbGxDR2VjcXV2czR3QjdTQU5TcmNMOXR4aWwz?=
 =?utf-8?B?cnNZUmczQ0duTGhNWjArclovMkZHZWluT3E4WGFJUW5jL1k4WlFpbXJTVWVW?=
 =?utf-8?B?U09CMlZTZ0h2Tk05SnU1K0lRTlVUNDRPanhIaDRnVFFrU3dSSXd2LzVmNGIy?=
 =?utf-8?B?WGpLUjVISnFzNnJ0TWlvSm1lblNCWTkrdHJjTUs1TnRhUWxMMi9RUTlUQUxl?=
 =?utf-8?B?Y1NyMVl3WHhTaTJ2dXJKRVYxM3QyUGZSQWRaQlNTUXVRSHdZelFTOXhHa1oy?=
 =?utf-8?B?Sjd6aCtXalNKeXVBZE41Y1F2dGlOWm1Za3I0TDluK0NPTUVPQ0VLRDZaNitG?=
 =?utf-8?B?emhETFJ5c2ZTSU9SamhZUTRrNkVZVGlPT2U3MTlTOE94ZW8wUVAyRXB0bjRI?=
 =?utf-8?B?emQ5SnpBNTBzSGdhWXpEd1czcUIrNjJ4OU8wbzM3VGVVZFRQeC9LVmVWcXky?=
 =?utf-8?B?NWVuUTdzaHhuUmY2UnJna1lRckE3bkx4MDN6c0M3MHZhbXhqb1dCcE1WSDM3?=
 =?utf-8?B?ak05azJVNVBnRVJRRjg4UGlZcGJMZlhDK2lvYm9rSzdadW5nMmw3SlRjUkN6?=
 =?utf-8?B?SzVXU3BpMlp6QktGSmVNUzRjdFF5YWN0ampGa29NMGNCdEFKcnpHNTFkV3ZR?=
 =?utf-8?B?L09yUytpMjUvd0VRVDFhSXRlVnlObU1BSWQ1YTJOb2xrdFE2djVvYVhXUDlx?=
 =?utf-8?B?UjhmdUg1TzF1akozNlo2Umx3N0VDSUROaHdnNVVOSWRtbWRxYzl2U0RCU1M3?=
 =?utf-8?B?RzJoSk5KbE9YMjg5NDljUURUZlVLbEpFV2F6NFR5RjNVLzEvNlpDNGlBZ0cr?=
 =?utf-8?B?TFR4V29ZaXgrdms0NjNuUWVIN0xQYlVDcGxaUEw2ckRJTStuSlJpbklhNCtv?=
 =?utf-8?B?ZGNpQ0wrTWxJTWQrV1h5bUt0UjgxNGN6Z3R6cmVtVTlXTlNVTzlCbHlRN0RJ?=
 =?utf-8?B?dUJwa1I5amp6TXFxSGtTeGpPeEprRjBKckRVdmYrWXhzblBiL2VaU2FhVTZ1?=
 =?utf-8?Q?k8OCVR9Q50c=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?c3FONDBxNlBSeExUeU40VC92d1NUSnlQd2RoMUxaZVFaeVd3OWxjVzBCeE90?=
 =?utf-8?B?R0VnbTJURWdIakxtOWRLWGVGcFVITHE1dVJ5aDZscXo4Y2ZxT2dydWNpcGhD?=
 =?utf-8?B?YXA5ZDdYNW9rZGd2TXMydHJhU3JLTVppM3RuUmF4ZTl0QWJTUkhMZ2Jtakps?=
 =?utf-8?B?VUFiWk1pYU83ZkpUOFJaUmlhNHF5TlNjU3NuM2ZUbkd0MHo0YUVIMWg2YnNh?=
 =?utf-8?B?R3ZuV1Q5N09YbjJVa3oxSTdUMWdoaUNuZ2hpTDdyblZqMlU1Y20yL3J5Y3Rh?=
 =?utf-8?B?MGdTQnJqRy9iSmpCSithcDUyS01vcmkxajh6K0VBeU1JWTJJUlA2N2VzYTdR?=
 =?utf-8?B?dS9hUDgrbHRuWkF6ZmlZalZhSDJjNDRKcWdnRlNQVDFFZi8wL282a0NoY2ZV?=
 =?utf-8?B?a0kwd3greUVQcGw4cng0RVRyOTFod2FPRmErTGU3bWhmbDVoUTRsWUFQYW1L?=
 =?utf-8?B?dVZTaU1FTDY2UUVtbkNMa3FmZTRZaTMvWW1acTR4SVRoVHNOUHBLckVXeWx6?=
 =?utf-8?B?cjJ4TDlHTThzanlTZ2R0ZzRJQlFOR1grSC9PQ2VKajdxWWExSWd0R21kZGFo?=
 =?utf-8?B?eHpVTnlCb0tBYVRwMXNmMFBzNG02N0gxczBUVUI2ZWZvOXEvUjZ0akVkeUVQ?=
 =?utf-8?B?dUQvTEMvNTRHQkxpYkgvdDdwZjh0em1xcmtGTTJxR3NKTjJ1b1VmdEpyOHNa?=
 =?utf-8?B?d21rTE1hTWFmdE9hS1Q1bHdkWDVianVLN3ZmRHY0cFdKaW5LYjAzcEwxS0o4?=
 =?utf-8?B?TDRhUUxEOW52Wk5wS2MvY25LYVJZN0I1b25zOStORUtIRnRWMXI4dEJzS1J1?=
 =?utf-8?B?MEtSeDNFOCtJblF2VXNYT0VJSWR1UUFPQ0ZENzNqSHpIbHlHRGZYdGFHVzF6?=
 =?utf-8?B?TnJPQ2djU29Sa0hyb2NRVHN3bEVtN0dtNnUrUFJyQk90Tkh4Mi82OGYxQWFv?=
 =?utf-8?B?S05OczI3Q2w4ajVYUE43Zy9rdnBxSUhLM1VnTVN2djBVZG53cmUwb3J4U1Vt?=
 =?utf-8?B?VHEwa2NGMG91ckYyc2grMU91TDhHOTd0Tkcwa1pQMmNYZFQ0b09nbkZlNld2?=
 =?utf-8?B?dEYyQXhhdm1raENmdzBGMWNRc0NGMjlLUVZvRTE2OGtHQUk1VmpyZGl6eHN2?=
 =?utf-8?B?a2doNG53dk5sZUhpMVViRFBUOEg5bWNWSmlsVXFONkZEdjJRUDIwZzY5dytO?=
 =?utf-8?B?cnV0cHJ1VVc4ZGZwR2RDeTdsbjdZM0YreXZZbGxoWUJORm1HTk5FTGh6NC9C?=
 =?utf-8?B?akt5c0JXM3ZsRnErWTYvTzBGbFBMcyt6Z3BrRnp5SnFjcjZjV3FCaWVNM0du?=
 =?utf-8?B?YlRnWU5IeEVtbWd1WS9xQ2kvdjJlUHFvVzB1QktWcmhNTlg2RmY2dXJWR0lo?=
 =?utf-8?B?ZUYybXYzWkFYY1RGUzdSMGVURmlQOWdUSE9xUFRQZnRmN3p2TXFqR2ZDZFY1?=
 =?utf-8?B?ZmQvekM4d3gxN3Q0WEs2N2JCNEZLdW9nS0tNb0VsVStRbFhHUHhWR09Wb2Vm?=
 =?utf-8?B?MkpZUlY5SVlqaEhoOFlud2I4NDROMXF4a1dCNFJsTk1GZSt1WXNxSWQ2UVdj?=
 =?utf-8?B?ZUwzZHYxK081Qi9MaEdremJmYmE1UEtZUEQ5VG5FNzJ6QmhlUVp2bTRUQ2JU?=
 =?utf-8?B?ZmsxcnlWNjhoc3liKzZEenZ1WXBBU3M1Z2wzQ01XbjFKY3BwaVpFbEt5Q1RF?=
 =?utf-8?B?dm9Rb2h6eEt6K3FYaHViLzV4U1JBa0pkNGhIS3FuSzZMdldYMUpLYzJtQkZt?=
 =?utf-8?B?anFVU0ptSzUyMkZEMllLRjFxeWw4L2N2WGcwd0IyWHk0cU5UV2lxNWFybGl0?=
 =?utf-8?B?U0lKZjZlTEt0Yzg0NDNqSlVDUTF5d1ZiWi9rR3N6WVpsZWhIVzk5V25Xb2NK?=
 =?utf-8?B?NW4vdzZ6ZFlFdm9GeDRZRzMzdFc0YzRoSStpSDFmS3dRSVFmbmdWWEd3QUUz?=
 =?utf-8?B?TlBQV2RiS3d5VlJVRjJtVWREZWxwTTA0MVdhZUVoelg3LzZLSjdDTU53QnY1?=
 =?utf-8?B?V2ZWZUJpUSsvOHBEdm15VGlSM1kxYU9hYmN1c3FmQzJUS2JDTXRBdkNFNU9O?=
 =?utf-8?B?dHJmcWlnQkh1SCtUSU1BVW85b3d0M2VMMmRiT2h0TXRrVTdTbGdsWm5aTDYr?=
 =?utf-8?Q?KKFj4jWFMZXc0cLpUlyBl09Lg?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	z08xGKomy4Sqfs5OufAgaKFGpfDms+4u6rWaoBIvEX64N+Mc9VxdAQBQgvKZSIlrQZc81D2BKZ8bzJ8CjdNjEw9munrZKx1dcM7Yjhcy2hDqetaZGaRJLgRZaqzSjb4taI9druzBgFeVg6nlG4GrfOc27lae0jozXe/qeCgtuFXNG20chSkuncJvy4BKdn+adVZQl7zjU6Tl7dVO0UNsBKRovPtysH638/2/kzUxFdRs2+QBtZNY7jQpwK8xnCXa1C1q28NAdhm53ml1S5l2D7XfAiwDb3L90u7tonUj59is0KkC1/J/swtf17Qnpy1V9grSftAJdQX7SHrQe4NocwhrLY9kp8qUqQvc8dV5yvc8RtDt/x2xbR1jrVG+6qAkFeaj8iZsb0oogFY/JLsf/EyffU6QcQ1sAHpkNH1djt2ePsgksv648/XzwEoYcrkflNhZBjCnj0wKUTWxKN2esoj0F7r1e0SM316yJzpKRb8BDPwl/ZwqXzGyV4fwH9App8tetBGHTtvZNurzNoOBr5xyVCETQC4ZEvhB4I/Mt/xpoIwKfymJdWBBEYn0d6mg+pCdFX6P66/x72TLD3UCu5UaT+CEO0d0RUiTTJpovDYVhaqx5wTtzA7RgrIFZUlP
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d8214e-4188-4342-81db-08dd350094e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 01:04:37.0613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wy8/vjpLZrrfdZukvzn8Q0GjFhBvyus49c0/ldqGzs93WcASPNBGgFfzNd7O/V6lVtxBHPHPSckeM9ky6lPNVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB15225
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 01:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209813

PiBjYXNlICRob3N0X29zIGluDQo+ICgqbGludXgtZ251fCpjeWd3aW58Km1pbmd3MzJ8Km1zeXMp
DQo+ICAgICB3YW50X3h0ZXJtX2ticz1ERUwNCj4gICAgIDs7DQo+ICgqKQ0KPiAgICAgd2FudF94
dGVybV9rYnM9QlMNCj4gICAgIDs7DQo+IGVzYWMNCg0KV2UgY2hlY2sgdGhlIG91dHB1dCBvZiBo
b3N0X29zIHdoZW4gZW5hYmxlIG11bHRpbGliOg0KJGhvc3Rfb3Mgb2YgYWFyY2g2NCA6IGxpbnV4
LWdudQ0KJGhvc3Rfb3Mgb2YgYWFyY2gzMjogbGludXgtZ251ZWFiaQ0KDQpXZSB0aGluayBhYm91
dCB0d28gc29sdXRpb25zOg0KMS4gVXNlIHRoZSB2MiBwYXRjaCB0byBzcGVjaWZ5IC0td2l0aC14
dGVybS1rYnM9ZGVsDQoyLiBUZW1wb3JhcmlseSBtb2RpZnkgdGhlIGZvbGxvd2luZyBjb2RlIGlu
IFlvY3RvLiBBbmQgc3VibWl0IHBhdGNoZXMgdG8gdXBzdHJlYW06DQotLS0gYS9jb25maWd1cmUN
CisrKyBiL2NvbmZpZ3VyZQ0KQEAgLTk0NzAsNyArOTQ3MCw3IEBAIGVjaG8gIiR7RUNIT19UfSR3
aXRoX3h0ZXJtX25ldyIgPiY2DQogV0hJQ0hfWFRFUk09JHdpdGhfeHRlcm1fbmV3DQogDQogY2Fz
ZSAkaG9zdF9vcyBpbg0KLSgqbGludXgtZ251fCpjeWd3aW58Km1pbmd3MzJ8Km1zeXMpDQorKCps
aW51eC1nbnUqfCpjeWd3aW58Km1pbmd3MzJ8Km1zeXMpDQogICAgICAgIHdhbnRfeHRlcm1fa2Jz
PURFTA0KICAgICAgICA7Ow0KICgqKQ0KDQpXaGljaCBwbGFuIGRvIHlvdSB0aGluayBpcyBiZXR0
ZXI/DQoNCiAgLS0NCkJlc3QgUmVnYXJkcw0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpXYW5nIE1pbmd5dQ0KRlVKSVRTVSBOQU5KSU5HIFNPRlRX
QVJFIFRFQ0hOT0xPR1kgQ08uLCBMVEQuIChGTlNUKQ0KTm8uNiBXZW56aHUgUm9hZCwgTmFuamlu
ZywgMjEwMDEyLCBDaGluYQ0KVEVM77yaKzg2KzI1LTg2NjMwNTY2LS04NTY4DQpDT0lOUzogNzk5
ODg1NDgNCkZBWDogKzg2KzI1LTgzMzE3Njg1DQpNQUlMOiB3YW5nbXlAZnVqaXRzdS5jb20NCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgQWxleGFuZGVyDQo+IEthbmF2aW4gdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAxNCwgMjAyNSA3OjAwIFBN
DQo+IFRvOiBXYW5nLCBNaW5neXUv546LIOm4o+eRnCA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiBD
Yzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgTGVpLCBNYW9odWkv
6Zu3IOiMguaFpw0KPiA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIXSBbT0UtY29yZV0gW1BBVENIIHYyXSBuY3Vyc2VzOiBGaXggaW5zdGFsbCBjb25mbGljdCB3
aGVuDQo+IGVuYWJsZSBtdWx0aWxpYi4NCj4gDQo+IE9uIFR1ZSwgMTQgSmFuIDIwMjUgYXQgMDk6
MjgsIHdhbmdteSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8d2FuZ215PWZ1aml0c3Uu
Y29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+IEFmdGVyIGNvbnN1bHRpbmcg
d2l0aCB0aGUgdXBzdHJlYW0gb2YgbmN1cnNlcywgaXQgaXMgcG9zc2libGUgdG8gc3BlY2lmeSBr
YnMgYnkNCj4gc2V0dGluZyAtLXdpdGgteHRlcm0ta2JzPVhYWC4NCj4gPiBCYXNlZCBvbiB0aGUg
aW5zdHJ1Y3Rpb25zIGluDQo+ID4gaHR0cHM6Ly9naXRodWIuY29tL1Rob21hc0RpY2tleS9uY3Vy
c2VzLXNuYXBzaG90cy9ibG9iL21hc3Rlci9jb25maWd1cg0KPiA+IGUjTDk4MTAsIGl0IGlzIGFw
cHJvcHJpYXRlIHRvIGFkZCAtLXdpdGgteHRlcm0ta2JzPWRlbC4NCj4gDQo+IEknZCBsaWtlIHRv
IGRpZyBhIGxpdHRsZSBiaXQgZGVlcGVyIGludG8gdGhpcywgYmVjYXVzZSBJJ20gbm90IHN1cmUg
aG93IHRoZSBtaXNtYXRjaA0KPiBjb3VsZCBoYXBwZW4uIFRoZSBjb25maWd1cmUgc2NyaXB0IGRv
ZXMgdGhpcw0KPiBhdXRvZGV0ZWN0aW9uOg0KPiANCj4gY2FzZSAkaG9zdF9vcyBpbg0KPiAoKmxp
bnV4LWdudXwqY3lnd2lufCptaW5ndzMyfCptc3lzKQ0KPiAgICAgd2FudF94dGVybV9rYnM9REVM
DQo+ICAgICA7Ow0KPiAoKikNCj4gICAgIHdhbnRfeHRlcm1fa2JzPUJTDQo+ICAgICA7Ow0KPiBl
c2FjDQo+IA0KPiBQcmVzdW1hYmx5IGl0IGNob29zZXMgQlMgb3B0aW9uIGluIG9uZSBvZiB5b3Vy
IG11bHRpbGliIGNvbmZpZ3VyYXRpb25zLCBidXQgSSBkbw0KPiBub3QgdW5kZXJzdGFuZCB3aHkg
d291bGQgdGhhdCBiZS4gQ2FuIHlvdSBzaGFyZSBsb2cuZG9fY29uZmlndXJlIGZvciBib3RoIG9m
DQo+IHRoZW0sIHBhcnRpY3VsYXJseSBpbnRlcmVzdGluZyB3b3VsZCBiZSB0aGUgcGFydCB3aGVy
ZSBpdCBzZXRzIGhvc3Rfb3M6DQo+IA0KPiBjaGVja2luZyBidWlsZCBzeXN0ZW0gdHlwZS4uLiB4
ODZfNjQtcGMtbGludXgtZ251IGNoZWNraW5nIGhvc3Qgc3lzdGVtIHR5cGUuLi4NCj4geDg2XzY0
LXBva3ktbGludXgtZ251IGNoZWNraW5nIHRhcmdldCBzeXN0ZW0gdHlwZS4uLiB4ODZfNjQtcG9r
eS1saW51eC1nbnUNCj4gQ29uZmlndXJpbmcgZm9yIGxpbnV4LWdudQ0KPiANCj4gVGhhbmtzLA0K
PiBBbGV4DQo=

