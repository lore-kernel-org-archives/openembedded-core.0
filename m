Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241FCC25B78
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 02:01:24 +0000 (UTC)
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com [68.232.159.76])
 by mx.groups.io with SMTP id smtpd.web10.3878.1716948076041639256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 19:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=O4tHEyU6;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.76, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1716948076; x=1748484076;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5YxLe14j329f5+Chdy5F8nNqNfTxYiJdbCcHqH/aUQM=;
  b=O4tHEyU6fo/usj/Muc9pLnPF1oKISJkcTLLBRhuStXkXccOCaqOmgoiL
   9Sf8j4ELHaCxJFEMMSwRmMZCjqPWnA/O2ifLELdScxhmLw117tCQ6x6FX
   OrvGAc92DDZDMze3z5nF259gXTycQ8oMABb8GxIaKNhlw/M6/7LiESUas
   Ol/gES1NsBj5cvUhhcpuW8LsG6qcz4MSPd6NLsIO5w9cd/GdnNdV0js+u
   qBjhDfbuKFVeeL66miaeiagubqkJXzU3GzNuf1d/dOrPsbMzfRs7XUjBC
   kaR1CMn6qTCIBQsjnSAP3o7NvYeUNS9sx1cFln91YLXopA9PEoSsxxJw6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="121061834"
X-IronPort-AV: E=Sophos;i="6.08,197,1712588400"; 
   d="scan'208";a="121061834"
Received: from mail-tycjpn01lp2169.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.169])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 11:01:12 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXAzb3R5PHPTVJIxiQeTWTgJvP24450cEegmZxSnV9kzq/I5um+Hek2rJfTO5s6ikVpOHxANcBp+h27hHYdhaP35B/1wUTaRX7oz7uslwpIAlqQr3vMP3LIghYvKn7APXmhm7JjVkGhYc7FJP+qmVGwHKhk7bzMxTD+D0aNZ6I44Xg7XCkqYt16K8pcZcjN609YOAr7/iEauUsDw/4hZV7TeRLBb9p00l2/+Cb3ysIikbL+U2lCqljzsFuq3iq2Fxyrn9jmNqz7kqgOjJMqYLZf5UgLbBjmzyx68vtjrYkf6BCOZe3ZGKgK1CIYuzgk4UEVoIj4fd/ItDWLe+1z+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YxLe14j329f5+Chdy5F8nNqNfTxYiJdbCcHqH/aUQM=;
 b=RflmzC6dDSDegqbg+ZvxFzXRuIe/VgYLcYiTKeWnL3vcyeFURVyjLj7878rU7bXD0cJWYYqO42Rp+3C/tYVQrP9mKD1doRJiZj6Z0WHwEz3Bc0WKIJz+CMUyqREJ0zdXyqvackgJG6cUOYGWAIYJ41jkjADby5OkX6pQxPRsUJPhl3pcEGdRay/2MZp4WmNnuxwKzB41QE0DpDSOPSWfhSd4kMJ4+ZFwX70y+ONNw9/Bm37lUMFkP8RjsyiRJQneBzaz+JDS6Rcjp0FyWWQFFeyb/IGFu9G4y/rb2fbr3TaSNxCRtXNA6097bHy7VM/eS35UTiMXRLsoBk7Zb5Mugg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by OS3PR01MB8699.jpnprd01.prod.outlook.com
 (2603:1096:604:154::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Wed, 29 May
 2024 02:01:08 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc%6]) with mapi id 15.20.7611.031; Wed, 29 May 2024
 02:01:08 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Alexander Kanavin (alex.kanavin@gmail.com)" <alex.kanavin@gmail.com>
Subject: RE: [OE-core][PATCH v4][PATCH] libbsd: Fix conflict error when enable
 multilib.
Thread-Topic: [OE-core][PATCH v4][PATCH] libbsd: Fix conflict error when
 enable multilib.
Thread-Index: AQHamthAA1WlsJSKE0i8b52cEJCNw7GPumSggAB8LoCABC+IYIAZOzLA
Date: Wed, 29 May 2024 02:01:08 +0000
Message-ID: 
 <TY3PR01MB11056FAE92F3B29F3EA1C55BBA0F22@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <17CB016975A375B8.19032@lists.openembedded.org>
 <TYCPR01MB1105524607983912E618C3F2FA0E72@TYCPR01MB11055.jpnprd01.prod.outlook.com>
 <CANNYZj9wbPVs5=dVVRr=Hz5w7SVpPC-sZQyEa85ct5M3=z9Anw@mail.gmail.com>
 <17CEE5C1836CC254.26216@lists.openembedded.org>
In-Reply-To: <17CEE5C1836CC254.26216@lists.openembedded.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9ZTkxMzM5MzItZDlmMy00NzQ1LWFiMGQtMTQzMzEwMThh?=
 =?utf-8?B?Mjk4O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjQtMDUtMTNUMDA6Mzg6MzhaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|OS3PR01MB8699:EE_
x-ms-office365-filtering-correlation-id: 2091960d-5f60-4e92-1b9f-08dc7f833520
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|376005|366007|1800799015|1580799018|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?eU9EYkZaNUhuQXh6WmVIYWIyZldUYUlOLzVSMDJUU21PNHJySzhudnV2bjVB?=
 =?utf-8?B?V3A2WjkraWZvWkVVV3VtbXRuRis2Z2Ewam9RdjFOSThSLzVIaUNidE5ETzgx?=
 =?utf-8?B?VTNpUVFNTkZwS1hmdFlub2hCUVp1VGtlOWUxaDN2WlFKQzl5Umk1SkF4SFVH?=
 =?utf-8?B?bmVxTXdseC9IeTgzRUxSWkdTS3VqcXdFckdBd2g5TitWV0tMdlNDU3I1MXlx?=
 =?utf-8?B?bzlwM2w4ZHlOWk91UE8yWVljazhmQVQxdmFGNTM4VnhtQXBkZVVqekxMN004?=
 =?utf-8?B?SVlDUHJxZFhycWVMZ3owNGg1Q3B3VkNDMUYzcEdGbmFHK082NVYxQWZzUEkx?=
 =?utf-8?B?ODlLWGlrdEdGek54QWlzejBYSU1Mc0JYUEpuWU4rNjB0WVFIakxDcFNHZzNC?=
 =?utf-8?B?a1dBcFRnRkNiQ2MwdTBjQ3dFM2RSbEkwQmZxRVR5TkxEOEthQWFRNVlsSEMy?=
 =?utf-8?B?MW1GS2Z3L2NpK1dmaVRrbUp1T1JKdEVGTklzeFIzOEczcnMvVDZKR0FPZHh2?=
 =?utf-8?B?NUQ4Z0Vuc0FKUHN6SVlEMGIxWEE2YkZVK2hLb2N1aGMxMG9jMUFTWlArZkdE?=
 =?utf-8?B?VXVOblM3ZHJ2cGVzZnhud0E4bFFJellNOXpReWxKTUtYU3pXYklnQXpoRGZQ?=
 =?utf-8?B?TnFmRFRqU2U1K1hpQUdiU1BhMldvMitPRnFnZlhxbzJweGRCTExqVEgzR09q?=
 =?utf-8?B?R2hJUnF6aHBWZk90WUpNV2JZODdqN0lxaUhjdzFzZktwY1BhaEJnZG5mSmxG?=
 =?utf-8?B?TnUxUHF1SDRZR0MzZ2RSemRiOTM2TkoweGpxY3NFSnd3UnBRSEIyblVBOUxK?=
 =?utf-8?B?bUdtZnVjcjNYdnN2NGQ4WnhXbnk2SXBoamFYQk5GTzBDQXRzMGFibi9LY0Zs?=
 =?utf-8?B?MFpQTUFjV3ZnbUIxQ1BuajV3Nk5leHRJQTI3eWZoaGcvK0lmU1I3NkVUb2kv?=
 =?utf-8?B?NXROd05YYnJHU1ltalZHVG9GSGRxeHRoNHR2L25wWnNwVWV2Y3ErMWJJQXU0?=
 =?utf-8?B?ZnBmQVllK3RBS0IxUjkydU10Wmd5alZVUkFBOTFkRkV0bnUvNzlnWElGVW1z?=
 =?utf-8?B?WjduTFJmVXJsd2ZvNjRDSkZpcWxOUDNUbEJHbDhuWGcvM1AwcmU2SncvaWxl?=
 =?utf-8?B?bGNHZC9HZFo4d0JUYzFrbzN5ajFQblFpNXFTRHFLSXZXQ2srSkIzRTZGTEt0?=
 =?utf-8?B?eDMxa0NrVEhXeXVFZ0pRb0JFODFNejV5M1Z1b3k0Mng0SHBrVExGM2lFcmF1?=
 =?utf-8?B?N3BNK1QrSzNZa29mR1Q3M3d0OXQydzBlWW5yNkZkaVEzc3g3cTFBSFR2Ujk0?=
 =?utf-8?B?L2E4bVdBVFAwL3RuNHg0UW5VYVJac3lQVHpwVTFXZ25zdXdTcmw0N2xyMUx2?=
 =?utf-8?B?QXFZUXY0NVVSUlNzclNmSzZraTA5STk3OXhrbzlMT1kzNnpMWnlaNWVUT0FY?=
 =?utf-8?B?c0gyZk4xblRhU1FzQ1JoNXJLc3dUMHBXVGtGY0RsMUNKTUhLZlVhMVhycFp4?=
 =?utf-8?B?OTNUTkY0OVFvbnlJbm5uV0hBYlV3Z0VXY1VkS2g1TFpkOTd3YTc5OWdEWnN1?=
 =?utf-8?B?amFMV0FnUGFOZlczdkwzSnVLY1pYbkp3TmpOSXlzNTRCU09ISXBwT0hLQWVR?=
 =?utf-8?B?OXJiZXFQYngxTE8vRExzcnc3M1Bua2krVlEyKzJSRzRjNmpMdHB2MU5YdkRl?=
 =?utf-8?B?eFUvalBOK2czcWdXMlZvZkFmeGpKVFhzSG43NHVObkRCWENHUm1wV3dJNHZt?=
 =?utf-8?Q?eMyQAY6fZ0SMQvnuOVjTMUTLFJcedPMoLKQ4SMS?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(1580799018)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YWxESkZqTGlzNFV6K3dzcG5hYStuZERLY2R1ZEpwZlpFelk3SFloLzVlT1Zv?=
 =?utf-8?B?Y2VyY2FEL0FiajhGQlJRVUlEMllWQUxVL1pSbnVNeXl4bUYvYllQUWhSM3du?=
 =?utf-8?B?NHBPVStpUkFYUEs0RnhCVkVsL0dFM3VGWGRLVlRKTTNlSlFvY0VrVmFZQXlU?=
 =?utf-8?B?UVpmM01sY2tkZVlTV3FEK24yZzNpcU9nUzI5YTY0bDQzWURxZlc3dTMzMm0r?=
 =?utf-8?B?ckgrbDBuaDIrZk1LMkhHS0RtUE11NU1zbWpCemZ6M2c3NXZLS014MWZHVDFU?=
 =?utf-8?B?cWNLVXlwMmUybC8xbW5OTXluSGl2Y3RsRVp4bGV5dkdZSTgwQzNEcHBMUEZG?=
 =?utf-8?B?MmsvTGQ3WUdMTGFCZVI0a1ZoTXZwQmkrK3NiQVRvaHkwUy9mcWFTS3dlQy9a?=
 =?utf-8?B?NjdTWWQyMDJXVlFpYXBHcisxWkVLK1dpd2VFdGVTODVCRFZzTWxseVNiUlFH?=
 =?utf-8?B?WmVGQXpydDJmUndHTnRiYzNnU1RldjNtd2hnby91Y0NFaWNnUHl2REtDSmtr?=
 =?utf-8?B?c0d5MHF2OTN4MWUyamxEbFcwUyt1enZKTGZPSXJsNHhsMlFQaGU1TzNDTW02?=
 =?utf-8?B?NERvYlZKTFE3V2dTbUVma1lQMUVvOXMwZStBTjNWcm4rd0VGQTRqZmRNbXc3?=
 =?utf-8?B?S0crZkw0NVRRSHdUMzQ1T1RFUFlIZUJ2MDNabjNDTm0zaWg1aWczT1Q5MzBq?=
 =?utf-8?B?dTRzYXh6L085dHVEM1oyNHo4RE1zZm9hc0VXczBEdTdMYjc0dWUwcEc1Tjg3?=
 =?utf-8?B?N0N1UnpNUWVyenNMaFB4b2hDdmcwQzBMRGFWRFpWZ3pkdlQzUWx3QWtvR242?=
 =?utf-8?B?dXlyeDlPSUlaTWlVUEtNSXoyRnBYWWFzc1A4UWVwdktnamZhcTJFUldHeGdj?=
 =?utf-8?B?MkJjRjhOSzVsclZNcGp0aDBwNjJqUXJJWXlBT0tTL0FscmVMbnlPNmFiSjR5?=
 =?utf-8?B?Vkhud2lETFBGN1laWU9BeityU3BqbHVyQnVzZWFQekxYNFhJQlVTZEIyckdk?=
 =?utf-8?B?alFBczRUM2ZBSlRRY1YybERKWnhPRWJBYWMwR2ovcDJ3YXJrdDhvTjNqUHYy?=
 =?utf-8?B?RVRQdTQwaTZvNTV5cEFVcG41OTBHL3FNZGJEaFBYaldsb3hEbG5rMjdmc0Zh?=
 =?utf-8?B?V1JxajVEcGZPSzlqMWdpU0dHd0p2Rkg0Z3NybldRZnRxbVd2M3BFckF1SkNI?=
 =?utf-8?B?OEtmN01OSzg3aXJ2a01sbUFuc09mUmhPYys5QXgwM3VRQnJpelNuWEswSzRD?=
 =?utf-8?B?Z1FJN0ovSlZyTXdVcjAvZDdHdERyeEdLRnh1M2lkOXBtdGJSLytnazFSQ1E1?=
 =?utf-8?B?MmxwRkgvamNhSmE1dm93OHBwbUJuWWYxajdNYitCNlJHcUFxZkVHTWZDYXpm?=
 =?utf-8?B?T3I4UFZ1ejVIbHljVzhtQ2U2M2tEMmRGOWxVNExIOERwVWlGTTVrOE9XVnRW?=
 =?utf-8?B?REtSMzlBbUlnM2FkUy9PeEJLWEVrWlNKRWFVUi9CbEQzNEhYTTVVMXdXbERU?=
 =?utf-8?B?cjBMYkU0WWlYK2pXR3BJYW50OXI4V0ZRWTMySWcrV1F2U01KZStYenJiZmNw?=
 =?utf-8?B?STU5TVBnaWQydERtQTRKTlBka0QrZ0IvQTlkbjNWN3VzM3F1QWtEZTB1cWZG?=
 =?utf-8?B?Q1QvY0FGUUtXUTl5VG5adXRDOVZsRnJGM25XTXFYVTB5QnVmTmtoLytiUVgv?=
 =?utf-8?B?Qmk2eEk0TkRwQUdWRTlURTNneVYwWkI4d1VBNWJ4Q0tPT0lKRG5jdjNUU3h3?=
 =?utf-8?B?b05iSGdPWTI1bGJWWjRxOFJlYncvRXkzUUpmRFAyZGJBWHkzTU90UkFEQ2VN?=
 =?utf-8?B?c2xzSDd0eHVvOVFHN0dqTG44VTdnWm0xTThveS90cFg3OWtEVXZ5V2NZYS95?=
 =?utf-8?B?V2JOVHJwbUJGU3NiMTJzUHZscDRhKzFsTXJwbm9ndGpJRExibktjUzdhVERP?=
 =?utf-8?B?MjdLeDg3dUV1VU9BRlhVOHNZTjgweWF5aGpCY3oxUDB1c010SU1HSkRvMDE1?=
 =?utf-8?B?N0pyTkVFRVBIT1ZWb05QWEpvQzBpL09CUFg3OGpITk81OUxMMzI0TXdKc0hM?=
 =?utf-8?B?YlJuY2JZcTV0cm1FZVkrb1Ewek1YejNBRUYrSm9NVXBNUzhIZGtER1lRSUUx?=
 =?utf-8?Q?ziiCqntlUDzXUUm8EXLjSGwxj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	7H4eziswh5j7O2cJ30kXCHZ+1qItn2loAY2TILWrxEWJqsajMz9bN8nNlCXycH1++I1pRLlaVHuS9jvx7hGsrSmx6vxiLkXioQiKpIFov5inFbpzwJnAyKhaMm9ox4x218GFf33rfRHgRWxBM8PJr/SF0DMQlIPO4p++ah19KFahlKxNjRObvLtlZj2npsLbtKLU8V4Qu2qOTWWO1rrU+LfUJBhg9HkUX1AEL9GsaofC4ez6p+Rdqqttz30d2v4dMFsMEEFAoGl9U2AQYhukZmAn9auC0KK2F8nWBZ20ejLH+25SJYBSZZQay3YqzenDPWp1GdKJzm1z68+QrV1NamP7BC2NWkmlPEt0zAPYB0FR54L3zbNKQ7GRi2L5skcAeZnomZArDxSi6M57a9ad0qMx7JT9C1gotoJa+f/XTTlUFpIDhmaa65JuUC46pJxSeac2oPdABr64s2nG6pGwrlG385zEiyMz8Jcw4Q/a76Ve8zi5sEbVufg6uQsdWdGVsU+uDcqrJKzdjBjRqGN2+u5tnQfr8xqCqkGd5jxB5PdQjQ4npjExsZFIHxGiBsUASdRs9/idqY2VwFQeOzhnbdT56rmPrzWM8FUGfkGovE49tt6omoDU3H8FIL3T1MHu
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2091960d-5f60-4e92-1b9f-08dc7f833520
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 02:01:08.8421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jR4aj09SFFe+9k5Ly1SsKyhGgUC5aJqCeASH+fnMvUewfGWWJ+MAbqGz0UWZ7XVgkC7ID/OAGttRemMBCQEWww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8699
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 02:01:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199979

SGksIA0KDQpUaGlzIHBhdGNoIGhhcyBub3QgYmVlbiBtZXJnZWQgeWV0IGFuZCBJIGRpZG4ndCBm
aW5kIGl0IGFueSBtb3JlLiBJcyB0aGVyZSBhbnkgaXNzdWUgd2l0aCB0aGlzIHBhdGNoPw0KDQpC
ZXN0IHJlZ2FyZHMNCkxlaQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBsZWltYW9odWkgdmlh
DQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU2VudDogTW9uZGF5LCBNYXkgMTMsIDIwMjQg
ODo0NSBBTQ0KPiBUbzogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+
DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0ggdjRdW1BBVENIXSBsaWJic2Q6IEZpeCBjb25mbGljdCBl
cnJvciB3aGVuDQo+IGVuYWJsZSBtdWx0aWxpYi4NCj4gDQo+IEhpLCBBbGV4DQo+IA0KPiA+IEl0
J3MgaW4gYWJlbGxvbmkvbWFzdGVyLW5leHQgb24gcG9reS1jb250cmliLiBQbGVhc2UgcmVhZCBS
aWNoYXJkJ3MNCj4gPiBzdGF0dXMgZW1haWwgYW5kIHRyeSB0byBwYXkgYXR0ZW50aW9uIHRvIHRo
ZW0gZ29pbmcgZm9yd2FyZDoNCj4gSSBnb3QgaXQuIFRoYW5rIHlvdSBmb3IgeW91ciByZXBseS4N
Cj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBMZWkNCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4NCj4gPiBTZW50OiBGcmlkYXksIE1heSAxMCwgMjAyNCA0OjQzIFBNDQo+ID4gVG86IExlaSwg
TWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+DQo+ID4gQ2M6IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENI
IHY0XVtQQVRDSF0gbGliYnNkOiBGaXggY29uZmxpY3QgZXJyb3INCj4gPiB3aGVuIGVuYWJsZSBt
dWx0aWxpYi4NCj4gPg0KPiA+IEl0J3MgaW4gYWJlbGxvbmkvbWFzdGVyLW5leHQgb24gcG9reS1j
b250cmliLiBQbGVhc2UgcmVhZCBSaWNoYXJkJ3MNCj4gPiBzdGF0dXMgZW1haWwgYW5kIHRyeSB0
byBwYXkgYXR0ZW50aW9uIHRvIHRoZW0gZ29pbmcgZm9yd2FyZDoNCj4gPg0KPiA+DQo+IGh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1hcmNoaXRlY3R1cmUvbWVz
c2FnZS8yMA0KPiA+IDAzDQo+ID4NCj4gPiBBbGV4DQo+ID4NCj4gPiBPbiBGcmksIDEwIE1heSAy
MDI0IGF0IDAzOjE5LCBsZWltYW9odWkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA8
bGVpbWFvaHVpPWZ1aml0c3UuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+
ID4NCj4gPiA+IFBpbmcNCj4gPiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4gPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+ID4gPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBsZWltYW9odWkNCj4gPiA+ID4gdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+ID4gU2VudDogVHVlc2RheSwgQXByaWwgMzAsIDIw
MjQgNDoyNyBQTQ0KPiA+ID4gPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiA+ID4gPiBDYzogTGVpLCBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4N
Cj4gPiA+ID4gU3ViamVjdDogW09FLWNvcmVdW1BBVENIIHY0XVtQQVRDSF0gbGliYnNkOiBGaXgg
Y29uZmxpY3QgZXJyb3INCj4gPiA+ID4gd2hlbiBlbmFibGUgbXVsdGlsaWIuDQo+ID4gPiA+DQo+
ID4gPiA+IEZyb206IExlaSBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4NCj4gPiA+ID4N
Cj4gPiA+ID4gLSBGaXggdGhlIGNvbmZsaWN0IGVycm9yIGJ5IG9lX211bHRpbGliX2hlYWRlci4g
VGhlIGNvbmZsaWN0IGVycm9yDQo+ID4gPiA+IGlzIGFzIHRoZQ0KPiA+ID4gPiBmb2xsb3dpbmc6
DQo+ID4gPiA+IEVycm9yOiBUcmFuc2FjdGlvbiB0ZXN0IGVycm9yOg0KPiA+ID4gPiAgIGZpbGUg
L3Vzci9pbmNsdWRlL2JzZC9zeXMvY2RlZnMuaCBjb25mbGljdHMgYmV0d2VlbiBhdHRlbXB0ZWQN
Cj4gPiA+ID4gaW5zdGFsbHMgb2YNCj4gPiA+ID4gbGliYnNkLWRldi0wLjEyLjEtcjAuY29yZTJf
NjQgYW5kDQo+ID4gPiA+IGxpYjMyLWxpYmJzZC1kZXYtMC4xMi4xLXIwLmNvcmUyXzMyDQo+ID4g
PiA+DQo+ID4gPiA+IFRoZSBkaWZmZXJlbmNlIG9mIGJzZC9zeXMvY2RlZnMuaCBiZXR3ZWVuIGxp
YmJzZC1kZXYgYW5kDQo+ID4gPiA+IGxpYjMyLWxpYmJzZC1kZXYgaXMgYXMgZm9sbG93aW5nOg0K
PiA+ID4gPg0KPiA+ID4gPiAgLyogRGVmaW5lIHRoZSBBQkkgZm9yIHRoZSBjdXJyZW50IHN5c3Rl
bS4gKi8gIC0jZGVmaW5lDQo+ID4gPiA+IExJQkJTRF9TWVNfVElNRV9CSVRTIDY0ICArI2RlZmlu
ZSBMSUJCU0RfU1lTX1RJTUVfQklUUyAzMg0KPiAjZGVmaW5lDQo+ID4gPiA+IExJQkJTRF9TWVNf
SEFTX1RJTUU2NCAxDQo+ID4gPiA+DQo+ID4gPiA+IC0gQWZ0ZXIgb2VfbXVsdGlsaWJfaGVhZGVy
IG9uIGNkZWZzLmgsIHRoZSBwYXRoIG9mIGNkZWZzLTY0LmggYW5kDQo+ID4gPiA+IGNkZWZzLTMy
LmggaW4gY2RlZnMuaCBuZWVkIHRvIGJlIGNvcnJlY3RlZCBmb3Igb3ZlcmxheS1tb2RlLg0KPiA+
ID4gPiBQbGVhc2UgcmVmZXJlbmNlIHRvDQo+ID4gPiA+IGh0dHBzOi8vbWFuLmFyY2hsaW51eC5v
cmcvbWFuL2xpYmJzZC43IGZvciBkZXRhaWxzLg0KPiA+ID4gPiAgIEBAIC0xMiwxOSArMTIsMTkg
QEANCj4gPiA+ID4gICNpZmRlZiBfTUlQU19TSU0NCj4gPiA+ID4NCj4gPiA+ID4gICNpZiBfTUlQ
U19TSU0gPT0gX0FCSU8zMg0KPiA+ID4gPiAtI2luY2x1ZGUgPGJzZC9zeXMvY2RlZnMtMzIuaD4N
Cj4gPiA+ID4gKyNpbmNsdWRlIDxzeXMvY2RlZnMtMzIuaD4NCj4gPiA+ID4gICNlbGlmIF9NSVBT
X1NJTSA9PSBfQUJJTjMyDQo+ID4gPiA+IC0jaW5jbHVkZSA8YnNkL3N5cy9jZGVmcy1uMzIuaD4N
Cj4gPiA+ID4gKyNpbmNsdWRlIDxzeXMvY2RlZnMtbjMyLmg+DQo+ID4gPiA+ICAjZWxzZQ0KPiA+
ID4gPiAgI2Vycm9yICJVbmtub3duIF9NSVBTX1NJTSINCj4gPiA+ID4gICNlbmRpZg0KPiA+ID4g
Pg0KPiA+ID4gPiAgI2Vsc2UgLyogX01JUFNfU0lNIGlzIG5vdCBkZWZpbmVkICovIC0jaW5jbHVk
ZQ0KPiA+ID4gPiA8YnNkL3N5cy9jZGVmcy0zMi5oPg0KPiA+ID4gPiArI2luY2x1ZGUgPHN5cy9j
ZGVmcy0zMi5oPg0KPiA+ID4gPiAgI2VuZGlmDQo+ID4gPiA+DQo+ID4gPiA+ICAjZWxpZiBfX1dP
UkRTSVpFID09IDY0DQo+ID4gPiA+IC0jaW5jbHVkZSA8YnNkL3N5cy9jZGVmcy02NC5oPg0KPiA+
ID4gPiArI2luY2x1ZGUgPHN5cy9jZGVmcy02NC5oPg0KPiA+ID4gPiAgI2Vsc2UNCj4gPiA+ID4g
ICNlcnJvciAiVW5rbm93biBfX1dPUkRTSVpFIGRldGVjdGVkIg0KPiA+ID4gPiAgI2VuZGlmIC8q
IG1hdGNoZXMgI2lmIF9fV09SRFNJWkUgPT0gMzIgKi8NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiA+ID4gPiAtLS0N
Cj4gPiA+ID4gIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmJzZC9saWJic2RfMC4xMi4yLmJiIHwg
MTAgKysrKysrKysrLQ0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGliYnNkL2xpYmJzZF8wLjEyLjIuYmINCj4gPiA+ID4gYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJic2QvbGliYnNkXzAuMTIuMi5iYg0KPiA+ID4gPiBpbmRleCA3ZDVlODhmMjkz
Li4xNzkxZDk3ZGZkIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJic2QvbGliYnNkXzAuMTIuMi5iYg0KPiA+ID4gPiArKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJic2QvbGliYnNkXzAuMTIuMi5iYg0KPiA+ID4gPiBAQCAtNDAsOCArNDAsMTYgQEAgU1JD
X1VSSSA9DQo+ID4gPiA+ICJodHRwczovL2xpYmJzZC5mcmVlZGVza3RvcC5vcmcvcmVsZWFzZXMv
JHtCUE59LSR7UFZ9LnRhci54eiINCj4gPiA+ID4NCj4gPiA+ID4gIFNSQ19VUklbc2hhMjU2c3Vt
XSA9DQo+ID4gPiA+DQo+ID4NCj4gImI4OGNjOTE2M2QwYzY1MmFhZjM5YTk5OTkxZDk3NGRkYmEx
YzNhOTcxMWRiOGYxYjU4MzhhZjJhMTQ3MzEwDQo+ID4gPiA+IDE0Ig0KPiA+ID4gPg0KPiA+ID4g
PiAtaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnDQo+ID4gPiA+ICtpbmhlcml0IGF1dG90b29s
cyBwa2djb25maWcgbXVsdGlsaWJfaGVhZGVyDQo+ID4gPiA+DQo+ID4gPiA+ICBERVBFTkRTICs9
ICJsaWJtZCINCj4gPiA+ID4NCj4gPiA+ID4gK2RvX2luc3RhbGw6YXBwZW5kICgpIHsNCj4gPiA+
ID4gKyAgIG9lX211bHRpbGliX2hlYWRlciBic2Qvc3lzL2NkZWZzLmgNCj4gPiA+ID4gKyAgICMg
SXQgaGFzbid0IGJlZW4gdGVzdGVkIHdoZW4gbGliYnNkIGlzIHVzZWQgaW4gJ25hbWVzcGFjZWQg
aGVhZGVycycNCj4gPiA+ID4gbW9kZSBhY2NvcmRpbmcgdG8NCj4gPiA+ID4gKyAgICMgaHR0cHM6
Ly9tYW4uYXJjaGxpbnV4Lm9yZy9tYW4vbGliYnNkLjcuDQo+ID4gPiA+ICsgICBzZWQgLWkgJ3M6
I2luY2x1ZGUgPGJzZC9zeXMvY2RlZnM6I2luY2x1ZGUgPHN5cy9jZGVmczpnJw0KPiA+ID4gPiAr
JHtEfSR7aW5jbHVkZWRpcn0vYnNkL3N5cy9jZGVmcy5oIH0NCj4gPiA+ID4gKw0KPiA+ID4gPiAr
DQo+ID4gPiA+ICBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiDQo+ID4gPiA+IC0t
DQo+ID4gPiA+IDIuMzQuMQ0KPiA+ID4NCj4gPiA+DQo+ID4gPg0KPiA+ID4NCg==

