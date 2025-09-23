Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17960CAC5AA
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 00:20:17 +0000 (UTC)
Received: from esa4.fujitsucc.c3s2.iphmx.com (esa4.fujitsucc.c3s2.iphmx.com [68.232.151.214])
 by mx.groups.io with SMTP id smtpd.web10.5033.1758586815603812710
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 17:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=dUINcZZC;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=qzTnJ17n;
 spf=pass (domain: fujitsu.com, ip: 68.232.151.214, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1758586815; x=1790122815;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=abw0SMLNKZ1NDJqRJWpilR8p16mSsT/5kgkTiU0CgiU=;
  b=dUINcZZC/rEB8D2c1KxwxQPJP81foC3SWobUVPzCCDfTBQ94Lx9BfCog
   LjUc1syR5VnjH7PP8VbabjVfgkVWyHjmI+RzBNl+rbB5kZ6LwuTLz4UAA
   DaQWYoukd7t0qaHVkvTPrLgO82o+LW3dVLNcr3Xq6Apo8tKA9EhmBeDWu
   DH/99SYoLSz3oAzk8eUKDG3po9XNtHyU3j8t+65XjPFKNj2cKoHV8+/sq
   UPhUUSmEyKIDJt7CsHSZWCwUX1t0c9bl9P3j27OrFavXRt0pRhsjrU7WJ
   qiNQo4+34LGN4A/Vx0Zsh7blzNsDSuso+u6Esx5DDpzChUy8erLbWwKSo
   w==;
X-CSE-ConnectionGUID: KfDpEzxvQDyjx0QKzDOz4w==
X-CSE-MsgGUID: 0OEEoJglThiF9/t2bt1q5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="81576454"
X-IronPort-AV: E=Sophos;i="6.18,286,1751209200"; 
   d="scan'208";a="81576454"
Received: from mail-japaneastazon11010070.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([52.101.229.70])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 09:20:12 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPp0YrIqgKiF823LJ1dSuw/h9tgIJBzcYJXJBY59j90Z5hniM+FrHXMfNt199E7ouM5nNTaGrUQsHieO2XjrQyKXj7Ij4anyXxTRCJG1sUj5LSaWmMVcb89wfETG0vuhrkFXUCPevVSDd8ldM6MLxGSBB7ZAocaUgvEbfClUGGJQ2i5jR1WdCNWuTPm5GG+5EzU/xqZyMiiUOO4XgRdVwUrdEME0sglGvOk1RG7mCbEtrI7CyIJ3qcPtyO3YYfHsya80Fd6N+8OgC7oQJoZ7eTq9Kub/k8HeePBc40TQR+OXN+UDOejp10D99rcbZLyXrO3/yjWf1VbiYvXWNdCkDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abw0SMLNKZ1NDJqRJWpilR8p16mSsT/5kgkTiU0CgiU=;
 b=iAGgjqdUXYa3og0FkTpAg2afwAUtJUEs4ED6nA2c/YjQJIbNhNs60CVEsTowCoJb5unxI4FTIS7y7a4RwRWEg9UWfRybuJQ6UAe47RWlbb+nRwg7wVGLnLz7vgFKxGCLevM+IDcoBuG1GiNj1P5CvcnJsJqyMF2suu96UsJWL7fdgbQFmBw0aJC3+RuvkPWPs6dzwt+m+zltWppmyZR27T0VsuFMpjUYI3WkQ6qFw3cprWSb2m71t+UawyieIfQX8f7t9030iMpOFdsXxGXUfOfJsRG0LIfpIou7lvoVa5bmx/gJ0qWhCuYYEZgYA6TRoUgXquvjC5MXHxxlNGEjEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abw0SMLNKZ1NDJqRJWpilR8p16mSsT/5kgkTiU0CgiU=;
 b=qzTnJ17nphSvRgyGWNj5+gGIhyRcqJkejSbw0XaNn8oPlQfIomucxCwMY14vb6Z5DRk3JUAbGLXgr3X/ECAWf6l1vRsz2ll4TLVbg1/7IqH2aG/ZvK/OFq0N9YxMEoHsv6opwhJZ932cnbS4l/8BJiT1+otdT/0sApm8R0xnbtdFPM8qlMAeMTvHRNgoj7wY7OTctZ7OD3Y8MSjwFHQLbQ5cBW5ZiikqwWSGpIEg1QBm3pdhIePJHfNy55dkdze61X5yZrqsvOUvJN9Y9Rpn+NEh6GhIk+TXl8jhMfG723wPpKvyC5Kwkc9ckBJ73giaq7T2vcVMLYtG2YflY7IBsQ==
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by TY7PR01MB17178.jpnprd01.prod.outlook.com
 (2603:1096:405:32b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 00:20:09 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc%5]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 00:20:09 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Why nativesdk-pkgconfig isn't installed into sdk?
Thread-Topic: [OE-core] Why nativesdk-pkgconfig isn't installed into sdk?
Thread-Index: AQHcK2E1CjJUNHz/B0y+ZeKdZ92XebSfPESAgACrG7E=
Date: Tue, 23 Sep 2025 00:20:09 +0000
Message-ID: 
 <TY3PR01MB1105650B42EC42B06A822B9B3A01DA@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: 
 <TYCPR01MB11055F8440AAD67D3CFEC64F3A012A@TYCPR01MB11055.jpnprd01.prod.outlook.com>
 <23153FF5-4E2B-4868-AE5F-C83822DCB14C@arm.com>
In-Reply-To: <23153FF5-4E2B-4868-AE5F-C83822DCB14C@arm.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-09-23T00:20:09.090Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|TY7PR01MB17178:EE_
x-ms-office365-filtering-correlation-id: 8eb834ae-aacf-4fdf-bac5-08ddfa36f49c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|1580799027|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?iso-2022-jp?B?dWtmSmY2OElBNm9ZWnd3UlNEWWhEVURaODdqZjZkT1ppaHNhR0dCcW5P?=
 =?iso-2022-jp?B?MzdBa2FWaUhSRDdqa1VORkRhdm42cURuckZyVEVoY0wrTjB3UVBYdk0w?=
 =?iso-2022-jp?B?Q242d1hGZWVlWXVNdFZaUk11MGdEOFBISWM0a2hTRDVOVXBkT1BERGI3?=
 =?iso-2022-jp?B?amxLY2EwNHlLUFI2RjhlRzZia2lYN2JZWUo4Qm12b05IWkJHcHA2K1Qy?=
 =?iso-2022-jp?B?bktRS3FQUHRPQTduSk9pNjcvNmNqR1BiYWJVQkg5Q0xDbGJxSGtvMjdC?=
 =?iso-2022-jp?B?MkNKbHB2bXBlZkNXZVQ5UXk4eC9rNlRJa0pqMkZrczFqMGl5dEJnK3Nv?=
 =?iso-2022-jp?B?dGwwcmpIeHhPSEl6dnh1SGdlOTE5Z2JiSE1VVEpHNFdHV3NuRHFvODFy?=
 =?iso-2022-jp?B?aWJ4YXkzVjg2cVNjNU9sbUgrdnYvWDk3b2lyamVuaGNRelkrZXJUSjVm?=
 =?iso-2022-jp?B?eW9rQ0tKdWdaWEJQK1hNWjVJRmpud1FrbVlvVHcyMkR6dnAzTld1a1hM?=
 =?iso-2022-jp?B?V2xqVlMwSHpYUTNHSzQ1cm9nS0NKUjRTOW83OEtqcGMwK0pkRWlGdU1h?=
 =?iso-2022-jp?B?QVN4MXM5Ti9vNVdUbEtnVTJSTWJnSFFPY0N3VFNXVTNZK3hyQ24yYVNG?=
 =?iso-2022-jp?B?dWVEeWdKa0htQWxzLzN5NlNiT0xyWkZIVThROVhFTXFQUTA3SmpXS0Vh?=
 =?iso-2022-jp?B?cHRXNnA5UGtkaStsOGNZbFhGRVlkbWFIbEgxdHhPdTlncDVHS0hhTy9B?=
 =?iso-2022-jp?B?bFZBb3ZKNjlobW1IZGlxbGpLejAxN3YzZnYrRys2RWd3bVdOc3E3eXho?=
 =?iso-2022-jp?B?K0VPNGZ3L1BPYjRkbkVYM2h5amNvRE53T3FmYzBsQmNHL3ZpS09qVUhs?=
 =?iso-2022-jp?B?V1loUHpxYnMyYUJqRzhaK21nZjlVdlBBL1VqL2tFTUJsLyt3SVB3RnNi?=
 =?iso-2022-jp?B?UWt2SS8rRUl5cWFiNHhSUm9kUStrcmVuKy9UenlTeDJOSmJUOUFaRUFO?=
 =?iso-2022-jp?B?b3ZsY3ZGclRZU1NKZHVpYytZV012Sm5RM3pvUWJiUThmYnVUdkFOYS9o?=
 =?iso-2022-jp?B?RmZZYlA3dUxYdnQ0RTE5alpqNjJUZ0ZVMzhwb0w4dTE2NlI3eTNJeEkw?=
 =?iso-2022-jp?B?RjRnVW5qUnRiNDhxZjlxOG55WjlrRzkxbHgzODhsa3VCQVlZdW1EVUJy?=
 =?iso-2022-jp?B?SDZ3aW9Vamd2Q1VFY1pLQnBLY3NuVVFLb1g5Um5LZy83K3lXV25hUzU0?=
 =?iso-2022-jp?B?b2RvbllMTDcwUElMVUVNMUpScnZ2L1JnbFhMRTFEQ1lPakdIbUlOaFY3?=
 =?iso-2022-jp?B?V3UySUpBQVlCSUZrdXMrZUxKWHBYOVVucytnRTBUSVF6QU9hblNTL0RQ?=
 =?iso-2022-jp?B?emxNeDFXSGZ3aXpnNmtEU1ViZ2dtNWhwWDFld1lsMDZHa3J3UEhFY0Na?=
 =?iso-2022-jp?B?QkovK0cvRUkxbnlGcXRLMHh0TXZZbmZRRTMxMHJWbGQrbklhbFM0VzFx?=
 =?iso-2022-jp?B?K1RQam1rcnl6MzBHYmFUT1lVS2NmT1pBNDNhUUtaUUd1NVFrREZSLzlv?=
 =?iso-2022-jp?B?N2xHR0dnZ0VEUHRNazU1NFM5R3FnRGZkVG1Fdno5UGg3SW9TeS8xSGJv?=
 =?iso-2022-jp?B?NHZZWHF0enlkeTdXUE80ZHhvaW9CbE5HcWwvT1NYeFlHWklFb0p5bktV?=
 =?iso-2022-jp?B?N1o1OW9iaFV6TTFPcDlTQ2d4NXM4OHFITFl1UGdZb2ZWRFdMSkRSNkI2?=
 =?iso-2022-jp?B?QWsrZGNFTmwxL0tsWjg5NGJ6bmlKcmZweW56R3pkNkM4VHh3SjRqMUZN?=
 =?iso-2022-jp?B?djUvdEl2bklsazFNWUdKZkh0S1VubHF1Y2g2em1jUG5FUUhQOHZleGRR?=
 =?iso-2022-jp?B?aWRhamJheXBqTWNZV1VIZ1EvOE00TTluSGYyV2s1YkR6djhIWmIwbk52?=
 =?iso-2022-jp?B?RzlMQktxS25EYld3U3pxUFhnc3hqN3NwejMzVDhBbkpnOTZqSkFyZDVp?=
 =?iso-2022-jp?B?c1RGV29tdUlnbkN6VkRDQkcyYWtXbktidndWZHEwL3A2STB2ZVdkRXRq?=
 =?iso-2022-jp?B?dExWVW10aUptOHVKaVdhaWFMU3NsazJlSSs5eGJkemt4bUJwVm1SSEhx?=
 =?iso-2022-jp?B?K01zV0pWcWRQd1FxTzVqZUZaVW9mQVJHeVU2YXRzSVNMU21WQ0JSWStH?=
 =?iso-2022-jp?B?YmxGNm8wT1FlV0RraWRDSFJYTUdTZzI2?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(1580799027)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?bUhpQmE2N1Q2dVo1MCszN1lxMEdrdlVRUmVnR29SM3pjN3J4ajkwOEJV?=
 =?iso-2022-jp?B?Z2ptVlYyNkZ4bGRkTjB0OThkczZ4L0NtdW1rVEdwejFaS2VsWkxOMzl2?=
 =?iso-2022-jp?B?WWY5anI0Y3M3ZklOcFRVNllvRGdiQUdsMmxDcE1iY1hOKzVuNzgxdGdF?=
 =?iso-2022-jp?B?aEpUN2FtV0NhQlRVb3NJS0NiRmIwWWpMcGRpb2xBcFpEY3Nwc3BnL3Bt?=
 =?iso-2022-jp?B?YzFGVWNkdmR6NGExZ3RHb1lvRU9OcitQcGRzdTVHRjdEaWxuaFFLSEIv?=
 =?iso-2022-jp?B?eGxjbUFnMzJRNE1tL2FkU0lORmdrL1NHTkFnOHZQc2pyOWQySEl6K3BJ?=
 =?iso-2022-jp?B?eG1Hdk4vRHRrWm8vczFHT0M5WUFqYitlKzJ6aVBzcnN3TEdnY0duVG1Y?=
 =?iso-2022-jp?B?MmgvNFcyeFduU1pDbmJ6VUFIUmdKQ3o5eUxtZlZoSWZTWUhkSkZDK1VY?=
 =?iso-2022-jp?B?MTNRQUF3VmM2azFUMUdWSXdLa0NFZ25NYVdBL1ljVDJKL2M0OVJicjly?=
 =?iso-2022-jp?B?SUtMdlY4QmQxYXFXbkptdXpJVTEyY2tpZDdBTkRuOVFOQlh5SW5jdUdH?=
 =?iso-2022-jp?B?QitzVVlmbU1sTGczMFByNGpIeHBqRDZnOU9VdXNpMkNSczlFL1VSWVA5?=
 =?iso-2022-jp?B?cVN4ajcvTGNjS2wxVEVJcTlibU5tREYyQW9jS1ZsSlJvUVRBZHVDMHBR?=
 =?iso-2022-jp?B?RlRkb2E2WG1kZ2hUU3MvbFRhOWp4QmNoeFlhZmZIcHUycWFHRUNGYm5O?=
 =?iso-2022-jp?B?N2k5d2JrK01UWExINXBGeGd1Q1c0c1ZzMUlmK0hGSGpZYmQ0WWtqSDJR?=
 =?iso-2022-jp?B?QURBbTRRVTZOVnE1a2xQc1dobmVKVHA2Z0lZQ21hMzBGYTJhUGVMazVE?=
 =?iso-2022-jp?B?OVM5UjdHczhzcDR2dGh5anRWTmNpdXZXcnlxcnpHcnZZZ0NKVFVtcWgx?=
 =?iso-2022-jp?B?ZFArZDhzN3AwaXIvZW43RzNYdU1Cb1EwWlNYRDhHMW5RWnNib2poS2w0?=
 =?iso-2022-jp?B?OGQrSFVuazk1Q1FwaUlTd1dnUnlENjdOaXlpRkdsaVRyblAxdGRYY2Zk?=
 =?iso-2022-jp?B?VTBkbjZtQmdGSFFzb0UrT0MrcmFPWWhJd3htNDROSzRISTJtVitHaEhP?=
 =?iso-2022-jp?B?N1hDSTlXMnJDTGZtVllqQ3NNdzVPOEMwTksrVlA3WDJ3TmhXMC9Wemdl?=
 =?iso-2022-jp?B?eGNPSTBjUTQvNmJsMDdBekszSzIzTHY5SFpkUGVLTlFXeTVheGRmNVY0?=
 =?iso-2022-jp?B?M3FvZEpiN0JuM25Da3N1Wkt1U1FCaXBCcnRPckFOdFpEZzNTQ09FRW1E?=
 =?iso-2022-jp?B?L1Z5N1lKaklsZTJzM2FwRkxPbEhSTGQxQldFS1d3Njk5VlNIekJhOENZ?=
 =?iso-2022-jp?B?VVgrKzQveGVNV1V3VmhicHpObmI0YzQ5YVpramVOelVNWHdOWXQvNWFQ?=
 =?iso-2022-jp?B?ZmhqZ1J0aElZQWJuMWdNSVZyUk4xcVpQcW92eVN6MEp3dk1Qa0xmRWlq?=
 =?iso-2022-jp?B?enQvR2pGRzJ0OXNGU1RFQjJydTFiRkNjMUx0YWU1M0lGV3VxZ0dvYUtS?=
 =?iso-2022-jp?B?VVFheitoc1o4Mk9Xam1oZUlBVzVYWlJRR3ZvU0JTRnhMUks1RjdxM2Nq?=
 =?iso-2022-jp?B?UFJUY05OSXlJeFBQVDdsYXV0aWQ5VVRleFYrOWVURHdnR0R3bnJWU2hx?=
 =?iso-2022-jp?B?Q2lGUFpXMWlRcWlCUVgzRlE5aHBLWUNQSFA1K0kwQmhhUTdqaWNXOWxv?=
 =?iso-2022-jp?B?YmFMeTdadE5iRVh4ZEt1ampVWkk3cmoxUGlmdElmR0o1aERNTUNWZXpy?=
 =?iso-2022-jp?B?eW55d1grSm5ibE5pYmVXUDkzVEFlU0tIYzNybVRLZGNUMFdQS21tZHpt?=
 =?iso-2022-jp?B?L2xieDVoRnN0SGFDOHNEb3pCSWg5RmV0Sld6MEZKREVWSU4xZndQRHRX?=
 =?iso-2022-jp?B?aVIrZFo3cVV3ZmttbzB1bGpxTmtKdWlFT3lLZ2tpVXJqZU9qUzF3T0pR?=
 =?iso-2022-jp?B?VzJxK2lkYnpwTUhKc2xZb0xTcGlaSTh6VDM1ZDM0MzRVaTJJVXVqK09x?=
 =?iso-2022-jp?B?TXZlN2pWRHpFVURhOHcrYUd4YXdBbEhIVzBnZStYVkNwWnFCZERoMUpH?=
 =?iso-2022-jp?B?SE1UUElxSWRqdTVESjVTZWFrSzZIOFgzY3daeHRZTFJ0VTFhdDYxdXZ5?=
 =?iso-2022-jp?B?UkluNTUvMms5Y2YwbDBubWdMcC9NdUNOQWZyam03MVpWbDVHTHdmSGJH?=
 =?iso-2022-jp?B?eFBjQnBMa2dNalhGbWhFNG5acGU0ZTZXQmUvV0RyMlR0a2pNRXp0SGVD?=
 =?iso-2022-jp?B?Q2JJaA==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	LupTs4ed66+we8H3hYAXVyCMPpYc5WXDToKNBkdTTOBEquLDi/Y5yPmXH51q+rQb4Vu1wamYJVNbA86x+IE8RyrXQcTEIbIKeXMXiMgKhl0gi+i5QnZ47IZ7UUKikfr7dd3aFWA3kKY9wlQGW5X1TGl1GTGbXh0x0mnMofksI61FsFXttirhDqgqpyG8bv2a4mNSX3Nwej+G89e0pnXjzmH4B1VyvMoHB44JXG18KGIS2N4kf3F9qLCtOC1nSM8KyfVxoG2TV383+hABTezxG9Gsx3bIVUIybl7bvHChwETigdev73H05iVwSy0/ocGPRGexwPkUR2wA6Z0xa2f4xteM9+CL8jwMpd8aseu/IaS07hg86auCdnyWRQFalUKmOG3VERXK9G14Zd16dhGBhfw5wSnQhsqHHCMTkBD36z39V1v1/6mZS6+NLHvwIxRzNaP33JXexiCiILJfzyfOW9+MZEMqO5o9Je21see0EgxQ4ka6bE6Q/6N7p7wwi3nk8zYk3wn1ifB6kOfWuE/vn0hGGF44z8BOSU1QXdCtfur0vTbyMdE7rj0CzutrWxczIT8p9SXeRxlPoaTHiYUq1peIIcsBj08bboyt92SJtjTqenqRQgUYiop20duT8k8B
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb834ae-aacf-4fdf-bac5-08ddfa36f49c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 00:20:09.4955
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JlEHGeLhnpcxlk2qAUCactu2L2GRnq+p/0csoLded1/zWV7HfQzPxfFc2lAOizte7pQueccuhb0WFzK7k5uv0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17178
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 00:20:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223863

Hi, Ross=0A=
=0A=
Thank you for your reply.=0A=
=0A=
> But there were concerns this would break something else so we=1B$B!G=1B(B=
ve not yet merged it.=0A=
I read the patch. Do you mean this patch might cause issues for Darwin, whi=
ch is why it hasn't been merged? If it's for Linux, would applying this pat=
ch cause no problems?=0A=
=0A=
Lei=0A=
=0A=
=0A=
________________________________________=0A=
From: Ross Burton <Ross.Burton@arm.com>=0A=
Sent: Monday, September 22, 2025 22:02=0A=
To: Lei, Maohui <leimaohui@fujitsu.com>=0A=
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>=0A=
Subject: Re: [OE-core] Why nativesdk-pkgconfig isn't installed into sdk?=0A=
=0A=
=0A=
On 22 Sep 2025, at 08:32, leimaohui via lists.openembedded.org <leimaohui=
=3Dfujitsu.com@lists.openembedded.org> wrote:=0A=
> Recently, when I created an SDK using the latest Poky by "bitbake meta-to=
olchain". I noticed that nativesdk-pkgconfig was not installed into the SDK=
 any more. However, I checked the RDEPENDS of nativesdk-packagegroup-sdk-ho=
st.bb and it did includes nativesdk-pkgconfig, so I understood that it shou=
ld be installed into the SDK. Is this a bug?=0A=
=0A=
Yes, and I started to fix this:=0A=
=0A=
https://lore.kernel.org/openembedded-core/20250903164459.2758128-1-ross.bur=
ton@arm.com/=0A=
=0A=
But there were concerns this would break something else so we=1B$B!G=1B(Bve=
 not yet merged it.=0A=
=0A=
Ross=0A=
=0A=

