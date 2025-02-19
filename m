Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AD9C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 02:06:19 +0000 (UTC)
Received: from esa4.fujitsucc.c3s2.iphmx.com (esa4.fujitsucc.c3s2.iphmx.com [68.232.151.214])
 by mx.groups.io with SMTP id smtpd.web11.13260.1739930771873324523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 18:06:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=Lp4j4ZSa;
 spf=pass (domain: fujitsu.com, ip: 68.232.151.214, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1739930772; x=1771466772;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=vDyus1M8U9kmpDMkcJt51SmOpQR/ANPfARKMNseFqoE=;
  b=Lp4j4ZSaZrHc/s5Ojwlnn3+hxE07epO13QrW7kgDlQNONJR5H/zv1bqJ
   HGKE0+aNWl1fyypMofjFbyS3CIUjTaOmNfSV0EazZHh3xJHTE3z49gRxz
   QedFvUFQO/JGwkBrWeqKjG9KA8zFf0jAU2ezVK9TsMhgaVNaP4j8IJRup
   +tBos/a+oL0vXZ7juFeCQYhgKPR2gnnp13jWWXCq+ggEPK9Vq2UqN0C6a
   x4LmWtWN2BSOSCSqcNNn21cmc3Xs56ErstXsRrfO9k+knSeLf0TavT4y6
   uzCu6Jq3IwbULtwuR4INLesankrn781+KQixM/6aGU+8Rjr0mvg2HEr14
   Q==;
X-CSE-ConnectionGUID: REckIGBATnC3d5qppI7UZw==
X-CSE-MsgGUID: RdBTh42+Q7KSx8xJ2fGSBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="59815019"
X-IronPort-AV: E=Sophos;i="6.13,296,1732546800"; 
   d="scan'208";a="59815019"
Received: from mail-japanwestazlp17010001.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.1])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 11:06:08 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwOTMa521HT44UbiYBlx3mwGVlEOrKuSRNCmvdbX7WRj16YgXE7fAps3Yf0rr0hZxz5ZXCQsD96Te1y4dgK27f4sdN3gTgt/yvSt3uCe8L9RcvrZBa7k1OwIW1vv5HKLvgKiFp42lNF/hVTHQOyFCJvyeV2fyngG+WECBM7LALN6pcZRaUaruus9JDKIAmJ/5SqUGgX9611GjUxF3weIil291kz7d4T/9vHw9p8JM1MlZWd7MX1u1vc2CkpWvH4Wi6C5uyLyMvs3k29lltgI/kzJ736w6Qbbs07oFcF5Qe2NQtHVEteQtGEmOv/NIOEccNqK6CQQNeJvOcx208wLSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDyus1M8U9kmpDMkcJt51SmOpQR/ANPfARKMNseFqoE=;
 b=GbPu9wUKvyw1k0ET9f4SbXRkB6NKMZ9L80/VsSh8BRBjCPpwqOm7diM579DDSzyb0sfQ3/97pD4iLA84Sl6Y344EDgZyevUKQkgjR6MNU7O54gq9ipZOzAseeOnNeCyh9Du0/jY9YjIKz5I7Cpr3hHRHVCuDIj32xMEFy3RrkN5cHeKGkzkwEpRa0PLnyk+iw3jT9T3siFcxgVzHSIeEeC/LhiKEulB0A120iY/kdkvXQPILBJqqJjDolToexwz11IJBHuDYdFV4OGA2EikxHBOynyUGStiJEMs+KMe/MbxUtOH9pmYe8JQTfrQEZL7cPSvH5ZsCKBPDbTB4Q+EpPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by OSCPR01MB12602.jpnprd01.prod.outlook.com
 (2603:1096:604:33e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 02:06:06 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%4]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 02:06:06 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 15/32] pango: upgrade 1.55.5 -> 1.56.1
Thread-Topic: [OE-core] [PATCH 15/32] pango: upgrade 1.55.5 -> 1.56.1
Thread-Index: AQHbgdiF3mh2JvB9k0iLWq5OBrzyrLNNTdOAgACTYVA=
Date: Wed, 19 Feb 2025 02:06:06 +0000
Message-ID: 
 <TYWPR01MB11861340480955F17E5309959DCC52@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
 <1739864375-21394-15-git-send-email-wangmy@fujitsu.com>
 <D7VQPBSVP6PJ.2CIYIN5Y67FR0@bootlin.com>
In-Reply-To: <D7VQPBSVP6PJ.2CIYIN5Y67FR0@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9MGEwNGY2ZDAtZTYzMi00ZGMyLTg1MzgtNjEyZjk1MmRm?=
 =?utf-8?B?MWZkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTAyLTE5VDAyOjAzOjIzWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|OSCPR01MB12602:EE_
x-ms-office365-filtering-correlation-id: e61a4572-4953-4758-927c-08dd5089f86b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NGY2VE8zT3BGTkpqQWwzMzIvK2M3UUxwSWpYUHZkbTRrbjQwYlNuZHVHM0ZV?=
 =?utf-8?B?bEdRc2xVb3VuZXhwVFVZa0lTVzJqbDl0UFpFYVQycURCc2JHekQwbTc3d1lB?=
 =?utf-8?B?d1JRekNXS2JDU0Fta0JyYzRqMU9KYW82TDBqekZXTmsxVndsUnVqSWVhcGlL?=
 =?utf-8?B?TW1yT3pGN3FSekphMEFGc0NxZ3JtR09sUkNYT29hcmlaZWtrYkV6Uk5lN2pq?=
 =?utf-8?B?eDV3SkszVWMvNzRwcnNzV0o2b1A2MUdpcGFaVnhsWlJrSFo5RGdoeWlFSzNQ?=
 =?utf-8?B?d2ZRMzc5dVQwT25OaHl0aG0zTkJGUFZKZGpITFk2Y0w5SkZsd3V3dnNCVDhu?=
 =?utf-8?B?ZEtPRVdmbXNNdGpRRzVad2JaTGJNVnRMNmk5eDBVMk1uOWdaMHlTSkNGN09X?=
 =?utf-8?B?a1JJdFQyei9pYmhhZWdQbkMzQ29memxtTENVWlVvSEdxdGpaSitDa0ZHVzd5?=
 =?utf-8?B?TUw4K2dRMWcvWDlLWHBPdE5FeEV1QmJFdjlqV3FWclpTSzd6d05SdndFMzVQ?=
 =?utf-8?B?VzRXQjlPdmg5RjV3b2J3dzRxc3BFeUo3VlJCVU45aE96MURsVFVKb2JyV01u?=
 =?utf-8?B?LzVmajVKQTh3WGNHYmNMUTNWV0Mray9xcDRYQmVkb2c4NkFPMktYa3BWT1dM?=
 =?utf-8?B?Y2pqbHhFRkh2Ti9mOGZDd0dJK3kzY2oyMmZGN3orSEh1MWNNM0VyeDNtdm05?=
 =?utf-8?B?azVrTHBjWGluS21qbW96RWFuYTJpWmE5WXJITzlhSHdUYWp6ZlR4ZnkrNSth?=
 =?utf-8?B?WElQVGNGQjlaNUU0a0JuWTg2ckV3dVc1Q3lWNHFpOEd4SjZzSlJjcUs4dG5w?=
 =?utf-8?B?R25LTlJTNmtqdUd5cncrUzJ3WDFXMU8vWUtERHQ4bHpWWEJSOGxCcWdwTHVK?=
 =?utf-8?B?QXpmM0JDT2VPVERWeURSV1hpcWh3UlFCRHNnUURDWVVZVXZuQVFucms0VGRT?=
 =?utf-8?B?VU1mY01NMEdaa05hb0FlYXdUTTNKTllWczNnOWdPYlFIcG9MZEkrekg4c1Jm?=
 =?utf-8?B?SzFrYVlnYVFUVnd1cVUrRHBvUXYrcUF5Nkt4ajFweE1MTDZBVHJ5QjQxY0d3?=
 =?utf-8?B?WVNhNnZNclQ1Z3dkZjdvMmsvd2pGSjRqTVhJaHpULzQ1WVB2ZXVJOVNyQXRW?=
 =?utf-8?B?LzdQbG8xUEtUOWFkSFZBaUQ0Tk1hamJwYzRZWUZlR0tGanZ0Vi8yUFJmVlBa?=
 =?utf-8?B?dGJlSUZ5TXVnV3doNVdzdkxOS0RhdEpRaUZqejJEWXozNEc3a21UeFVnRWtM?=
 =?utf-8?B?c2cxeHM4SGorVVpuWGQwSnNVWHRGaTMvYmhwVmxFakRtL1dyNnVBQVpPV2Vs?=
 =?utf-8?B?TmNNdXAydTNSQUZVdUl6cVZ6QnpJMWNDZFZZSlFrcTdUOC9oU09OTFhPZURX?=
 =?utf-8?B?NXdhRG41NVVQeUtCK2hNMEFBeDFyZE1EMXVNR2xSUmFRY2d1Qk8vVGg3RkRy?=
 =?utf-8?B?cUVmWVJjS1RkMjRNbCsyUEN1OUE1dTRORkxpRkdKZzRoSVNON2tkZVVuWXN3?=
 =?utf-8?B?ZzE3a2JQdHFPSzQ3c1ZtdHJKeDlPWnNUUU01RldZTm1GUTB5R1BtWHcxeWMz?=
 =?utf-8?B?cVNWWGVZOTZkT1FJRStDNlBNMk5mL1NMSWtxa0I4S2tlaVFHMFpZbTJ1bDI2?=
 =?utf-8?B?V05mWkk2bndPSStkQUN5OEVrRzVPVk1ndTZFOWtxaitlMXVzMHMvZlkzcGZv?=
 =?utf-8?B?amE2NnQrbnVwZjZ0NHJORStLQkwyK0hMMGVkRTMwVG8xNzliNWp6b2RhWm81?=
 =?utf-8?B?eTJzcTdIcHRyT2V5dUhjd3hPOWxGZks3QVRrUzR5enNTNGxHVDBqczMvRGRw?=
 =?utf-8?B?RnM0OW9kQVQwRkYySVp5OVRaOU96cXJjQnV0Rk0zOWpsUkhXQzN1QjllVmh4?=
 =?utf-8?B?N3ZiOW1PM0tNRjNMR1ZCeTVFOHA2WTBwU0VKUjRPN1BiSHc9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MTlIalJXQmZGTHJpaWNLR3ZUOHoweWFRYUF4N2V1RU9tTUd0MFJKbHYvRml2?=
 =?utf-8?B?ZnI4NzZId08rVXg2dm45SXZKaTV1MEpqQ3pMTnJwS1pjSDgzdjRKaUF0ZUtP?=
 =?utf-8?B?WC9JaGIvTlJZRVFna09RRmZtU3h2bER5REcxSWZUSEVXVFVuR3FkRG5MZUN1?=
 =?utf-8?B?QnhKRHNVdVV3ckZ5YTRaMm5ZSmdaaWtENVB4RHg4cE5zUWhLaGE2OXZTcEZD?=
 =?utf-8?B?M2ZudmVvVm1Pd3IySjRTbyswOGZ6UzJ4dW9wMS9XbjlRV2txK0E0RFJFcVNa?=
 =?utf-8?B?UTVtb2F2L2hOc2NQQURCa0dVQndrUVo4V05SZTFORndWMkZCSURUQWhtWjB1?=
 =?utf-8?B?SEtXeUJKcmFEaUhLQkxabmJjZEp6ZUQ3YTNudC9weDJtNVlhRFpmc3U0ZjE4?=
 =?utf-8?B?NUFWQnVXN0RHdGlFYUYzOERiY1lTTUlIM3BWNCtmc2x1V2UzYlJuU3NJeG1S?=
 =?utf-8?B?RFZlVWdOTlBRYXNteVB0K0hYSzVjSy9JK0QremFWZnNKdExFWlUxdlpleFB5?=
 =?utf-8?B?ek55TUg0Q3NOWjhPdnZuemdYR1dZRjVmN1pxcHR6clVEcHJDOEMzUHkxUkhL?=
 =?utf-8?B?Ynp3NEs2WHdVZDdOMzdpS1lVbEF3NTkwcm1wc1FpWVR5aDBZQnhKWWc5VnZw?=
 =?utf-8?B?OHNLRzluM1h4bEZMSjk1bHFrM2hlV3owdTNUeU9yQm1aUVM0bnNyMlFCbnUr?=
 =?utf-8?B?VTVMSGlsOTc1R25JVVZ6bWJDem1OcTdzYm1mcGt3dGo4SmRXUDdSNXNBYjhJ?=
 =?utf-8?B?aGljUUdJSnFTc05UVno2M0FtSys3dkxEWUZLTHpHZnJhRlJmL2ltdk16WHhC?=
 =?utf-8?B?RmFtNkwvUnNWQmhlWStvNGxQcVFEb05oMk1lRVNyRmtmY093QlhaalFxQXRJ?=
 =?utf-8?B?ajE4aUhzWm5HWkZWVU9jZnB2TmNPQ01NcVBlQkc2V1NxcndhSUJ5ZkR2aCto?=
 =?utf-8?B?Z3o3Q0c1d2JLRGo0WnVTbnhMZzRTT0xNUWpOZ25NTHdYZGlESVZRY3N0d1R5?=
 =?utf-8?B?WmtQUmZVOXJ0YVBjRy9RU2RZL3ZlS3FnQzBqSTNHMVd5dmcxdzZ6ZDNTTDB0?=
 =?utf-8?B?di9ydC9sTUNhUXgrSE5nN0FCVUl6MEw4bDI2SEt0YVVUdHg1SzFXaTZHS0ZI?=
 =?utf-8?B?ZzY1WklVby9nbGU2dzF3THRLbTlQNGJWWUNSeCsxREJwckovNXRDZStCelRi?=
 =?utf-8?B?QjBJNE1oYmZPcjNVaFY3bWJyeXcxY1JRNWRtVC9yVk91L0EyaFZGYU84bVhY?=
 =?utf-8?B?eEYwWjdaeGFuNVpOa0hLa0RmMERsUi93NmVLcWRRVktHWk9lb2hkWkdFNm1O?=
 =?utf-8?B?ZXU5ZDEvcVRnZHF3bXo0MGQwY3BHZldUZEVWQ0FXdGVTdml1Wi9yaHRlOVEy?=
 =?utf-8?B?L3VFQmUxVVd2amFPU0tkZkQxNDlsYWtCRUpXOGhQOUppSkpqRlFSNkxSam5S?=
 =?utf-8?B?d3RKK2NZZUZNVEdzU04yVk1ib2hYY3JTTDc4QU0rbWxpcnZpUWRuNzdKNlBE?=
 =?utf-8?B?YmtTNDRWRXJyL1FiNUx6WEFSSUZkc2lUN09hYzdtcVJuTllSandMQTZyb2JD?=
 =?utf-8?B?bGdsWnQwRXBFTzJyRGQvaXpwV1VvL2Z1c2pybktjYm5tVFRpZlpQMXpWSmxa?=
 =?utf-8?B?enZpTnZZVFJmK3ZqVVo1bHdySXJtMzRUc0xRUnpPcGp3MTdiRWcxMG5zcHJp?=
 =?utf-8?B?OG9jcVMwOXF2a2pLODBGV2hzdGlObXFHK2ZEalNKRC9DUjFESnk3Sndxd2Zo?=
 =?utf-8?B?ZUNMeHhoK2lFM0h1UUN2SDlmaHptRVMxQnhPdHZieTY2aXZNcCswc2tua1M0?=
 =?utf-8?B?eTQxZHY0RFFRQkViOU5Wdnl3cWlDZndnZTNIWjQ1M1p3M0l3bmJscnZ4R3dU?=
 =?utf-8?B?Y0FGWlJOT1pFcS9hck9WdXMyOWY4eVdLU1NNQklYVnJoemI1VjlnejdzRUFz?=
 =?utf-8?B?SkJvQnlHbDZ2aC9NOUsrSHhPNitGMm5XaGtlS2JJb1k5UHVFdWxFcEJpY09Z?=
 =?utf-8?B?K0J5aFlMdklZNUJaRi9pa1JucHNqckprMGxGT2ZZNGtiOVRKeG16eUdpZEQ2?=
 =?utf-8?B?RHJDUnVXTkRRdkN0RFRsdEE0MVlmQTI1R1BSUzBMSXlzZUxkTFIxTXBlSElP?=
 =?utf-8?Q?vHfw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	rl01bPBuBHDpxrHMOcvj/WPkNQE/jB6hID6jWaIlqdWwg4t3n/XIPLZ9toGIrvHXupk4Y+yL/zpbdahuQl9ugr+qhD5KkhAtZM0QCh5LABR7mvb/M1o9oOgCJ0Y31A8zHSLdxg+V6nVzefAyGT+7bfRmT3SD6rLz4CyBd/unSloZGZQ0PmqmUrY0ilUFMjw5WBqCwwX6nd8/wizJo6GnY6zqO8UGWkdfk7KHxR9TLV3+/IeCQnTED5W+xxJCREwwXClc2LdVuplaBInwwgZnUwawXpEdBqMBL1dxldFx2FiBgnISk6icWCKGsVsY+XXQ79CnddCt1Fag3TDjxzFyuOhH0aKhfT1tSYtmPmjAEMXN5CH77ngji7OpELgajiz+zOtdmkge8nIP6QvBaBtRN0MysjHoU7bnJVo377eWINvJeJ9h/jmjTrQkxqE56QhpPUlAs5QOoaMA0eyhiWr9wt4LRaQGqO+bSJYTwa+s2o06PDfAkaVjuDyN1VjkeEIEwLM3b1rSkpQTchW5TV2BkM0fVN2r5LaDMwaqCZ0Dmx6su2em2zLtyh+CrO06KwWHxKLhOkJIDCsOPCO83Sqcgdn4pu7d49FlDXW8Xf/HxsF5h3UBVL/SbY08+ahgv24T
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e61a4572-4953-4758-927c-08dd5089f86b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 02:06:06.4487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wB7PT9i++DVtG/KtQATWWipNTnMts/vfDJMrrDd5aPisatQbpy611jZ/+d1ack15RCUkdywKk02HIL1j1eqI+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12602
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 02:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211660

Q291bGQgeW91IHBsZWFzZSBsZXQgbWUga25vdyB0aGUgYnVpbGQgb3B0aW9ucz8gSSBoYXZlIHNl
bGVjdGVkIG1hY2hpbmUgeDg2LTY0IGFuZCBiaXRiYWtlIHBhbmdnbywgYnV0IHRoaXMgaXNzdWUg
ZGlkIG5vdCBvY2N1ci4NCg0KICAtLQ0KQmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCldhbmcgTWluZ3l1DQpGVUpJVFNVIE5B
TkpJTkcgU09GVFdBUkUgVEVDSE5PTE9HWSBDTy4sIExURC4gKEZOU1QpDQpOby42IFdlbnpodSBS
b2FkLCBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQpURUzvvJorODYrMjUtODY2MzA1NjYtLTg1NjgN
CkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWpp
dHN1LmNvbQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hdGhpZXUg
RHVib2lzLUJyaWFuZCA8bWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPg0KPiBTZW50
OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDE5LCAyMDI1IDE6MTYgQU0NCj4gVG86IFdhbmcsIE1pbmd5
dS/njosg6bij55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDE1
LzMyXSBwYW5nbzogdXBncmFkZSAxLjU1LjUgLT4gMS41Ni4xDQo+IA0KPiBPbiBUdWUgRmViIDE4
LCAyMDI1IGF0IDg6MzkgQU0gQ0VULCB3YW5nbXkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gd3JvdGU6DQo+ID4gRnJvbTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4g
Pg0KPiA+IENoYW5nZWxvZzoNCj4gPiA9PT09PT09PT09DQo+ID4gLSBBdm9pZCBjcml0aWNhbHMg
d2hlbiB0aGVyZSBhcmUgbm8gZm9udHMNCj4gPiAtIGZvbnRjb25maWc6IEhhbmRsZSBsYWNrIG9m
IEZDX0ZPTlRfV1JBUFBFUiBpbiBmb250IGNhY2hlDQo+ID4gLSBmb250Y29uZmlnOiBQcmVmZXIg
YXBwbGljYXRpb24gZm9udHMgZXZlbiBpZiB0aGV5IGFyZSBvbGRlcg0KPiA+IC0gU3VwcG9ydCBz
ZXR0aW5nIGZvbnQgZmVhdHVyZXMgaW4gZm9udCBkZXNjcmlwdGlvbnMNCj4gPiAtIHNlcmlhbGl6
YXRpb246IERvY3VtZW50IHRoZSB0YWIgYXJyYXkgZm9ybWF0DQo+ID4gLSBzZXJpYWxpemF0aW9u
OiBBY2NlcHQgYXR0cmlidXRlcyB3aXRob3V0IHJhbmdlDQo+ID4gLSB3aW4zMjogSW1wcm92ZSB0
aGUgcGFuZ29fZm9udF9tYXBfcmVsb2FkX2ltcGxlbWVudGF0aW9uDQo+ID4gLSB3aW4zMjogVGFr
ZSB2YXJpYXRpb25zIGludG8gYWNjb3VudCBmb3IgY2FjaGluZw0KPiA+IC0gbGF5b3V0OiBGaXgg
bWVhc3VyaW5nIGVsbGlwc2lzIHJ1bnMgd2l0aCBzaGFwZXMNCj4gPiAtIGJ1aWxkOiBSZXF1aXJl
IEMxMQ0KPiA+IC0gYnVpbGQ6IFJlcXVpcmUgR0xpYiAyLjgwDQo+ID4gLSBidWlsZDogUmVxdWly
ZSBjYWlybyAxLjE4DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215
QGZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiANCj4gSGksDQo+IA0KPiBUaGlzIGRvZXMgZmFpbCBv
biBxZW11eDg2LXdvcmxkLWFsdDoNCj4gDQo+IEVSUk9SOiBwYW5nby0xLjU2LjEtcjAgZG9fY29u
ZmlndXJlOiBFeGVjdXRpb24gb2YNCj4gJy9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9xZW11
eDg2LXdvcmxkLWFsdC9idWlsZC9idWlsZC90bXAvd29yay9jb3JlMi02DQo+IDQtcG9reS1saW51
eC9wYW5nby8xLjU2LjEvdGVtcC9ydW4uZG9fY29uZmlndXJlLjE2NzY4MzQnIGZhaWxlZCB3aXRo
IGV4aXQNCj4gY29kZSAxIC4uLg0KPiB8IFByb2dyYW0gcnN0Mm1hbiByc3QybWFuLnB5IGZvdW5k
OiBOTw0KPiB8IFByb2dyYW0gcnN0Mmh0bWw1IHJzdDJodG1sNS5weSBmb3VuZDogTk8NCj4gfA0K
PiB8IC4uL3BhbmdvLTEuNTYuMS9kb2NzL21lc29uLmJ1aWxkOjIyMjoxMjogRVJST1I6IFByb2dy
YW0gJ3JzdDJodG1sNQ0KPiB8IHJzdDJodG1sNS5weScgbm90IGZvdW5kIG9yIG5vdCBleGVjdXRh
YmxlDQo+IHwNCj4gfCBBIGZ1bGwgbG9nIGNhbiBiZSBmb3VuZCBhdA0KPiB8IC9zcnYvcG9reWJ1
aWxkL3lvY3RvLXdvcmtlci9xZW11eDg2LXdvcmxkLWFsdC9idWlsZC9idWlsZC90bXAvd29yay9j
b3INCj4gfCBlMi02NC1wb2t5LWxpbnV4L3BhbmdvLzEuNTYuMS9idWlsZC9tZXNvbi1sb2dzL21l
c29uLWxvZy50eHQNCj4gfCBFUlJPUjogbWVzb24gZmFpbGVkDQo+IHwgV0FSTklORzogZXhpdCBj
b2RlIDEgZnJvbSBhIHNoZWxsIGNvbW1hbmQNCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9j
dG9wcm9qZWN0Lm9yZy92YWxreXJpZS8/Iy9idWlsZGVycy8xNy9idWlsZHMvOTU1L3N0ZXBzLzEN
Cj4gMS9sb2dzL3N0ZGlvDQo+IA0KPiBDYW4geW91IGhhdmUgYSBsb29rIGF0IHRoaXMgZmFpbHVy
ZSBwbGVhc2U/DQo+IA0KPiANCj4gLS0NCj4gTWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290bGlu
DQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290
bGluLmNvbQ0KDQo=

