Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D57C36005
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 01:45:34 +0000 (UTC)
Received: from esa12.fujitsucc.c3s2.iphmx.com (esa12.fujitsucc.c3s2.iphmx.com [216.71.156.125])
 by mx.groups.io with SMTP id smtpd.web10.12577.1742953532957675014
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 18:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=e4+GGptN;
 spf=neutral (domain: fujitsu.com, ip: 216.71.156.125, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1742953534; x=1774489534;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Z39+e2kIYt5sIbaQqx2vqZeQLe8ZifvO4lR2VimWhD8=;
  b=e4+GGptNh2ntgS13X3ZghmZX+wRFoh/U7RET0QMHHdfVzkmLC53r3jb0
   BSL8teWmWoo3judJUtITrgZBqH+ChFlRoO0C6ULg06c/NhRlZZOK1EVf0
   mBQCxzLhU4ybmHvC+1nLWl8sOS70gQfg6511jdIm2bcVpa+fiFrYEbaJg
   HZJB5tIMqXtSHXhrr4vvkq+YTQH5/8BszfKz2nEOflMcOqTuYw4V2xXsi
   sIEGW2QmeaQZw/TY9IR5PkrWO1andygryJ8UEL5NVn4sGJrTBBQCynrey
   Y5hAIipkwKGWY4WFJtLEP/S1GRrD1wD/eUzl65R+dmbj2p0Vff/Dv9ey4
   A==;
X-CSE-ConnectionGUID: O+2bSH+aQkKuttlnTDfzfw==
X-CSE-MsgGUID: Z286FgaFSq2f2RLbwYbwLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="150848313"
X-IronPort-AV: E=Sophos;i="6.14,276,1736780400"; 
   d="scan'208";a="150848313"
Received: from mail-japaneastazlp17011028.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.28])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 10:45:31 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wawzDCBXn2rgrb+kJr2sxZA7foJk6TffzUlFDHe/IUJ1nhEkm3vmxjbSeOWu6mJnK9+9KYWrIH396QPUz1Y3KNyI8JNRjB/Ym1aWbviu8zvkqkVsvxwR3tXk3ASj5+LIYZDy9g3iMJzDAvcCUH35v3t8cB1ZyRVAnEZSGkzdCEOX+7tenEGXQUBuKgYGuS//ybWW5iI9VM1qa1lB/grA8k+xuK9S/56bF7Klr/A7tw9OBQKMrNMREJiNbOKYMRlXlmEt5o+UP2YRIHSwwU3816ClNDnNL9fGErU/d9Nm2zJbToW0mWM+jFL0+TP3d15X5T0xhWDhzSfYAB8bMKt64Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z39+e2kIYt5sIbaQqx2vqZeQLe8ZifvO4lR2VimWhD8=;
 b=EmAhpMZ+zVAzEu/xdJbpk+g1aX9sJyFnHbPWz3NOXOfJziU7QhrpJuXaqh+s2djqXyJ1XawSjHNG1KzcR0wVNBZnivI0i9YB8HXI0QqNFnmlCWMduN/93EtANL2+r8SZlpoKc73zUA2Z3VwMHwHpM6rC3/AJFcdxYw/9tPv8Wdqy5Rndx2l7xaQM4tGSgwmt7+6xKRhDJZETShi2NMTeoLF7l+SP41hpejcevsfL2XOv82ruwBt326FLRS44QyoZcciEBHL0f5T5m62dPFNpH0aX4Vj0pkIK6UeOzq0idRujUVmjQlh/69KuU+zzC2LXYq4TSR0Dv12t0WvhPpPYPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TYWPR01MB8607.jpnprd01.prod.outlook.com
 (2603:1096:400:13c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 01:45:27 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%4]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 01:45:27 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH V2] dnf: upgrade 4.22.0 -> 4.23.0
Thread-Topic: [OE-core] [PATCH V2] dnf: upgrade 4.22.0 -> 4.23.0
Thread-Index: AQHbmUSDQCtsiwQYuEyuTDfMbxuJ1rN7qmOAgAkEVbA=
Date: Wed, 26 Mar 2025 01:45:26 +0000
Message-ID: 
 <TYWPR01MB11861D6EC6DC97514BE5AADF9DCA62@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1742439740-18703-1-git-send-email-wangmy@fujitsu.com>
 <D8KXQ6QPGOL6.1VKUBIEENIJYU@bootlin.com>
In-Reply-To: <D8KXQ6QPGOL6.1VKUBIEENIJYU@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9Yzk3ZjcyODgtZDQ5Ny00NzdhLWJhYmMtMjNiM2NjZjI4?=
 =?utf-8?B?ZWRiO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTAzLTI2VDAxOjQ1OjIzWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TYWPR01MB8607:EE_
x-ms-office365-filtering-correlation-id: 31bedc3e-20a8-4c60-6db6-08dd6c07e1ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dGxjYVFReWp6c2d5MmhPWlEzUVpzaWp1ZVgrRGhkc1h4TWhRbW1hRnlmYlBl?=
 =?utf-8?B?UktFM0NhTFNGeDhQRUp1Rzg5Y0ttNVFzaGV3VFJFT1VHdG9BbWFPMzZaeGJ1?=
 =?utf-8?B?WktLMklsbTAyYnAwWmdITTdkNVFjZWs0UWhzaDhpbE9hWUY1VWRYSkVVd0Rp?=
 =?utf-8?B?Vk5oc3dnRjhxcS9ZbWpxbGxUNlFhTWZzdEpSVThGRjJLT092VVRwRkpiNGtr?=
 =?utf-8?B?UFNFQ29VQTJaczlhczZhaUszbXlHajY5UUc0djN0dDBMRWVnZ3hzTXJFWE9E?=
 =?utf-8?B?NllUTlBLMDY1bE9QMHVxYTBLcWpzVmJQSEVIVTJpS21tdHZJVjRkQnRBeUFO?=
 =?utf-8?B?TGpxR2pqRFVtMmVqQTR2K3JmVXpwbk96cGxuR0xQT1NBTzNmdlUxNGt3Vmpt?=
 =?utf-8?B?L1AzaUpyMEtmbVlsdm9pVFB6VEpIUnhkRGJpNDFXZ00zTG5SdFFNKzQ1OHBW?=
 =?utf-8?B?TDdpdDdpM3BvWEpYajZONVp1U2RZRS9abHl2VUhyMUFsUndsTXUvMWJjZlZz?=
 =?utf-8?B?eW5LRkJFaTgyR3pEUStXVVVIdmU5MkthQVl3ODIwTWVpNW5NSmZJYWdKeEFO?=
 =?utf-8?B?dzlTbU9COGtyUzRtT01ZemhObTV4NGVNcXhJR2UzbVI3NkdZSFVKZGZBbzYr?=
 =?utf-8?B?UFpwRTVHSTNQTXZWbzh6ZmsxRjhjWk5lZnErOVVQZEhudmJESlBOcUFIWE45?=
 =?utf-8?B?dWxGVVdIVnRGODIrL2lvM1h3ZThDcjR5ajEzajV5WDMzUlNEdXE3RjNlSlR6?=
 =?utf-8?B?bVVOTVMrMlM0N0prbzdHZzJxME05ZmNUZnE4RkQzdk1ieGRzbFg1ODhiOGxh?=
 =?utf-8?B?c1JjMDNmUFRsaGxGdVpJdEJmL2FCbFBDVFI1WDlYenlta2NSSnNERkQ0N1Ex?=
 =?utf-8?B?SDVXV2pUdlQyYmZ2bnlPMzNja2QxQzQxV2REVzlJTk1YbXF4UitoOWphQTJ6?=
 =?utf-8?B?cDJ2N1NXUkEyeDRuQnc4dXZyK3czR25uSENhWlJMK1dnaCt1cDBpRDZXdWNt?=
 =?utf-8?B?VHQvL2xaUjB2OHBIeUM0QmV2YU5EMWFaRmJrWHo4YktTWmdnbkxRR0JBMGdF?=
 =?utf-8?B?dlE4RlJSc2J3WDdtc2JxR2I2b2xuVTRCRTlXS01zWVQwT0xqNDNsNWoyWWdE?=
 =?utf-8?B?d0d6OUVaM1BDQmZFY0sySUhlUHpaRzZ4Tnkzd25MekovcisvQTBLN05Jb0hD?=
 =?utf-8?B?TmtzQ2J1VGZDSGFhVWU0RmlzUG41Tm1od3ZDSWZjaVNaNkpqdDRkWHA0Qng0?=
 =?utf-8?B?RnhPN0h3R3I5SFhXeW1mK05ieVUwNUNGdkVZWHBMTTRpRG4xSmdZZSszd0JD?=
 =?utf-8?B?dHF1dGEzeXJIYWo3Z0hZcDZoekF0NjhKZzZhV2JqTHdvTkRmN3FVQk5nVWxs?=
 =?utf-8?B?YWxnNzBYdDZNVWNCa28yTjdncjFDWUpDY25xWXhlL1EyQ082cjNiK0lpMCtw?=
 =?utf-8?B?eU9LRXhQNSt0bm1tc1FoNXdlNzhJeER2d3AzL2hQNG83NmNiY0NVNGtzb1gz?=
 =?utf-8?B?bXN1QnJnNEhDblNFbkR4VWlaV2g2ODJjM1lSbHBXR0pJUm9kT3dOSjBTVGY2?=
 =?utf-8?B?N2QrTGFmVFo4eDdkM2FvMkw1MlN5bTdYNGFSM1gzcGFHbEVjMXo2cE9OZGZZ?=
 =?utf-8?B?bitxUGNPd0EyZG9DaTdNWVR3a1hlWjJJbjFoQXRVMlh4UE5LbjNRZW1PaTFv?=
 =?utf-8?B?R25hVmRSRERMWVdVTEs1S1JsTWtPVTZyS25GT0kyc2dmSUFkL3kvaUlBSDc4?=
 =?utf-8?B?aWd2MFkrRHBrOGFSZE1rTXhEM2hjK25RLzBMNXl5MDB5ZjNPNzhnY0Fmc3hN?=
 =?utf-8?B?c3J0OWNHaStlRGFqbDVuMlFqYmttQmIwdG5YdWRDaGdlNEU5QlBDbmptanlW?=
 =?utf-8?B?ang2YkJjVkR0d3haTTlOdkJVOTRRVkNqclNaQ2VHODcxWHc9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MjJkSWxtZUFYaG1qbzRHNXpGQ2hpUE42ano5NmJBWkFIV1FwVHpXakZxSUlM?=
 =?utf-8?B?czdrTDNXcmJVeDA0YmhMNHpjODNhUjNaMVVER244QTNTZEdqMlREUm84UHdo?=
 =?utf-8?B?THdwY0xRZWdESk9jTWU5QzZ0WUtjMGlRRDdpK2h6OC9jYmptOTBweHo5dkF1?=
 =?utf-8?B?dHg0Um5uRG5jdFl1TFJ1T0psVklSL2dmdXBUVHk4RmFTNnhaTzMzK1Q2OUVJ?=
 =?utf-8?B?amNoNWZNeWNqYmdZK0RNZnQxRTJ1eUlhM1o0TTh0TGVid3BZTlRMKzBmNGRX?=
 =?utf-8?B?QUZBOUJ0cUxXNHI4Tlhvcmg1S2xsQlVZRnlWMGlZZTd2YklBdlFmeTFqS2FN?=
 =?utf-8?B?ZEVBMUJhcXFWL3o0TmNRTlVwU3hVUmQ5TE9rWjhQRVJKVW5tTHhvRkdQTUdZ?=
 =?utf-8?B?dW5wT2gyKzl1ZHlmeGpsZDI1S3d5NjQ3Zmo0MjZkNHJ1N3JOMzA2Vk5hYVhM?=
 =?utf-8?B?WlJZTzhWbThiRHFxa1ZQN215TTBKY3NPRmwydFR3MDRlZzNrRHpLZnFjT1dv?=
 =?utf-8?B?UGFUTXlmVHd3YkhDd2xKVTVDdmZ1WXBScldxYTA2SFNmYm51aUZQbXJJV1RN?=
 =?utf-8?B?elA0ZXhmdmNpZnZNSnhkTzQ0dngzQWk5VkJqTEgvalVnL2plVithMDdEenFj?=
 =?utf-8?B?ek1vR3ZFU2lxem1ncHovcWM4L1BtREh2V3Y0ZkN3a3FZT0tjZDRGNnhPdThx?=
 =?utf-8?B?WGM5RjBGVGVJWGp2UkJ4Z05lTnJvdzQ4MlFaZHZnempZRk9DdnFoUVcwWGx5?=
 =?utf-8?B?OXpPS0U1N1hQUThGaTVhTWtKb1JleUdEdndwb1dHZ3kxaTNxWS9WYng4Wlly?=
 =?utf-8?B?YzdrcGdTVFpncm1DMDdaUnJRZ20vOGJuNXlJRGtjcWdMVUdxVFhDVGpLLyt5?=
 =?utf-8?B?RUpHNi9ZeVNGaC96WE9mL3MvbmRhWmp2M2V1U1d4Q2d3MXdiSGovTjBzWERh?=
 =?utf-8?B?N01VUkZldXJKcDRsU3F0UkZ3NjQrSlh6THpOZ3J1dzlDMkxmNW5LQkgzQytZ?=
 =?utf-8?B?L3dSSmxabGZRTDNOa0lmSjkzVU4vVXYxQzBPL01zcEV2bTZPWHh1cFQ4R2ly?=
 =?utf-8?B?Wm9vQWwyN3Zmc2wrNDlPNHd1NjVBRWU0Zm0wR25lQW9PaGI2MVU0T0QwY3My?=
 =?utf-8?B?UVFlZ0JYM2hiSGN4YUR4c2FId0tyWTRWOEFCOVlmQTNaTmljOXJ0V0hjT2N1?=
 =?utf-8?B?M3pzN3lzU0RNcmVkS1hqbHpEdVR1dTM1Z2pWRlIxN0tBYjNIaEE3cVVZRVpi?=
 =?utf-8?B?T3NZSFByQS9FZGtVdkFRUVB1dWxVaVloY0VQMlRaMVBmU3ozczYvMmdMQmpZ?=
 =?utf-8?B?UFFjTGJDanZlOEZ1T2h1UDdxZ0x3bG5GUGJJdzA2TjJGTFRQVUdhbDZhbnBa?=
 =?utf-8?B?SUorMCttTC9ickRwTXEyYjZ0bWdYdmVWYkdQenhuVXpzQWJvRGM2RUNvU0Q4?=
 =?utf-8?B?OVZmc3ZzWTd5RjdEVzBzbTU0eWVIRUU0SDFxVHhaTjNMS3AzeXNCTWZoVzc3?=
 =?utf-8?B?UExCYSs3bkxrMXVVQksrNzR4OWY1bmdPQ1RtVnJRVWo2K2VEWGJ1OWtrZmFn?=
 =?utf-8?B?Y3lzZm5XeHpRNGFOc2xxbjVEa1BNaDVxVzJDaWJ1S1BLaTl3K1VuTlFXYzBL?=
 =?utf-8?B?RkhtS1Y4Slpxem5XL2gyaHJoVnArYTJjNEttVUpXWE85NDlsaEU0b0tYbi9Y?=
 =?utf-8?B?dlREaGZsbFZHazR2SjJab3RKTzBodWtqSkFLMnlLRmI3cWxnbklkQk9FWm9N?=
 =?utf-8?B?Vm44eDZRdVRGUUdCMk5QcEhCVGFqdk9LWFdic1NOc0lnR0Qwc2FMVW1jRVlo?=
 =?utf-8?B?dlU1MDNBZFBuc2F4Um9lb2lrYXp0Mmd6Z3NXLzUveHVZd1FEa2FZSVQrSDc4?=
 =?utf-8?B?UC83N0pFc0MrcWo2ZC9tazZBemg5VFJKTDN1Vi9LUmsrTWd0TEZsenh5aVRJ?=
 =?utf-8?B?UzJXZUp4emJraHNMYkRWS1RvNXBFMDI5Y0xwdjFWTG1ibzJ6S2tiejFwRDRR?=
 =?utf-8?B?am1EazJYVXFFcHpvb1FCZlVRa3hhZDBYeWdrRGMzY25Bbm5IMjBXdzNuQitI?=
 =?utf-8?B?YzBTUi83akNtRWFmNzBhWWhpcGd4aytsaDJOV0ZTa3NHMHRYYzQ5WmUrTG5m?=
 =?utf-8?Q?JL9A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	OoRs/NU0WJOHw4xp5YdxwBZUpBnQYeK9mZnL1gJEdOktCTWFDtu1V5jUPCMv2535Zjshw/lBlqegwMChy46MwL0A/QdIQX+Q8IfBBo70Upn/L5Ok94CXWfyaqMWJvjv4arYZj7xzM399yhqbJNSDf5QerowFyzIpluVC0ydbjI9p6iVtlK6aUhndXmrp+ewBRp7EqBfy5+GWvnmOkxbqAIrTToya/iVve+0UZfwQgi0qDjxfgghRRMx/njCAZzWhp74U9u8Z1sA9oq+b8gkaVzCoL+pYjM63vWo+sMcHJtNLubT/v97vPdNwOAN2ZvLn95zv2wmG/3+PcC/yN66SmqbmEbRrkiMS7tWpRWqzR9KeqzOufUYIySoQclErakSxFtIX/KA5TNhvXmI+gzyr2Sr1KYKH6gpIvVy/YmkziMJdRqR4tlwJfCN0iQ578rJkaW5E6LBbAu8gyWGZSUmR42aPP96H/Iu5TnE7b0Em9LQBnMjP2fl2yxuYPLG6cIttqaR8ZPqopyqRQkV2cZURWU2MTAzsflvuik3jLHX37HsRyiFoP83TQgFvuRZc9yf8E1r9Kj83OAH7yanSJ8DACJRS5wgZ7KTcGBDNGKkZzx2lAajP22kKuxFNy76vai73
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31bedc3e-20a8-4c60-6db6-08dd6c07e1ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 01:45:26.7592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zzSydv87Tjk+rLxDssemXp7Y6SERLIn+iBESWhflABIJU2FXUVeDo3fLV7MYmvDhZ2nxk57MP/l3fnQ8sgJWyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8607
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 01:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213623

QWZ0ZXIgY29tcGlsaW5nIHRoZSBpbWFnZSwgSSBkaWQgbm90IGVuY291bnRlciBzdWNoIGFuIGlz
c3VlLCBzbyBjb3VsZCB5b3UgcGxlYXNlIHRlbGwgbWUgaG93IHRvIHJlcHJvZHVjZSB0aGlzIHBy
b2JsZW0/DQoNCiAgLS0NCkJlc3QgUmVnYXJkcw0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpXYW5nIE1pbmd5dQ0KRlVKSVRTVSBOQU5KSU5HIFNP
RlRXQVJFIFRFQ0hOT0xPR1kgQ08uLCBMVEQuIChGTlNUKQ0KTm8uNiBXZW56aHUgUm9hZCwgTmFu
amluZywgMjEwMDEyLCBDaGluYQ0KVEVM77yaKzg2KzI1LTg2NjMwNTY2LS04NTY4DQpDT0lOUzog
Nzk5ODg1NDgNCkZBWDogKzg2KzI1LTgzMzE3Njg1DQpNQUlMOiB3YW5nbXlAZnVqaXRzdS5jb20N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgTWF0aGlldQ0KPiBEdWJvaXMtQnJpYW5kIHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAyMCwgMjAyNSA0
OjAzIFBNDQo+IFRvOiBXYW5nLCBNaW5neXUv546LIOm4o+eRnCA8d2FuZ215QGZ1aml0c3UuY29t
PjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0
OiBSZTogW09FLWNvcmVdIFtQQVRDSCBWMl0gZG5mOiB1cGdyYWRlIDQuMjIuMCAtPiA0LjIzLjAN
Cj4gDQo+IE9uIFRodSBNYXIgMjAsIDIwMjUgYXQgNDowMiBBTSBDRVQsIHdhbmdteSB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiB3cm90ZToNCj4gPiBGcm9tOiBXYW5nIE1pbmd5dSA8d2Fu
Z215QGZ1aml0c3UuY29tPg0KPiA+DQo+ID4gMDAwMS1Eby1ub3QtaGFyZGNvZGUtZXRjLWFuZC1z
eXN0ZW1kLXVuaXQtZGlyZWN0b3JpZXMucGF0Y2gNCj4gPiAwMDA1LURvLW5vdC1wcmVwZW5kLWlu
c3RhbGxyb290LXRvLWxvZ2Rpci5wYXRjaA0KPiA+IDAwMjktRG8tbm90LXNldC1QWVRIT05fSU5T
VEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2gNCj4gPiByZWZyZXNoZWQgZm9yIDQuMjMu
MA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNv
bT4NCj4gPiAtLS0NCj4gDQo+IEhpLA0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLg0KPiAN
Cj4gSSBiZWxpZXZlIHRoaXMgaXMgcmVzcG9uc2libGUgb2Ygc29tZSBmYWlsdXJlcyB3ZSBzZWUg
b24gdGhlDQo+IGF1dG9idWlsZGVyOg0KPiANCj4gRVJST1I6IGNvcmUtaW1hZ2UtcHRlc3QtdXRp
bC1saW51eC0xLjAtcjAgZG9fcm9vdGZzOiBDb3VsZCBub3QgaW52b2tlIGRuZi4NCj4gQ29tbWFu
ZA0KPiAnL3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FlbXV4ODYtNjQtcHRlc3QvYnVpbGQv
YnVpbGQvdG1wL3dvcmsvcWVtdXg4DQo+IDZfNjQtcG9reS1saW51eC9jb3JlLWltYWdlLXB0ZXN0
LXV0aWwtbGludXgvMS4wL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2QNCj4gbmYgLXYg
LS1ycG12ZXJib3NpdHk9aW5mbyAteSAtYw0KPiAvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIv
cWVtdXg4Ni02NC1wdGVzdC9idWlsZC9idWlsZC90bXAvd29yay9xZW11eDg2DQo+IF82NC1wb2t5
LWxpbnV4L2NvcmUtaW1hZ2UtcHRlc3QtdXRpbC1saW51eC8xLjAvcm9vdGZzL2V0Yy9kbmYvZG5m
LmNvbmYNCj4gLS1zZXRvcHQ9cmVwb3NkaXI9L3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL3Fl
bXV4ODYtNjQtcHRlc3QvYnVpbGQvYnVpbGQvdA0KPiBtcC93b3JrL3FlbXV4ODZfNjQtcG9reS1s
aW51eC9jb3JlLWltYWdlLXB0ZXN0LXV0aWwtbGludXgvMS4wL3Jvb3Rmcy9ldGMveXUNCj4gbS5y
ZXBvcy5kDQo+IC0taW5zdGFsbHJvb3Q9L3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FlbXV4
ODYtNjQtcHRlc3QvYnVpbGQvYnVpbGQvdG1wL3cNCj4gb3JrL3FlbXV4ODZfNjQtcG9reS1saW51
eC9jb3JlLWltYWdlLXB0ZXN0LXV0aWwtbGludXgvMS4wL3Jvb3Rmcw0KPiAtLXNldG9wdD1sb2dk
aXI9L3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FlbXV4ODYtNjQtcHRlc3QvYnVpbGQvYnVp
bGQvdG1wDQo+IC93b3JrL3FlbXV4ODZfNjQtcG9reS1saW51eC9jb3JlLWltYWdlLXB0ZXN0LXV0
aWwtbGludXgvMS4wL3RlbXANCj4gLS1yZXBvZnJvbXBhdGg9b2UtcmVwbywvc3J2L3Bva3lidWls
ZC95b2N0by13b3JrZXIvcWVtdXg4Ni02NC1wdGVzdC9idWlsZC8NCj4gYnVpbGQvdG1wL3dvcmsv
cWVtdXg4Nl82NC1wb2t5LWxpbnV4L2NvcmUtaW1hZ2UtcHRlc3QtdXRpbC1saW51eC8xLjAvb2Ut
cm9vdA0KPiBmcy1yZXBvIG1ha2VjYWNoZSAtLXJlZnJlc2gnIHJldHVybmVkIDE6DQo+IC4uLg0K
PiAgIEZpbGUNCj4gIi9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9xZW11eDg2LTY0LXB0ZXN0
L2J1aWxkL2J1aWxkL3RtcC93b3JrL3FlbXV4OA0KPiA2XzY0LXBva3ktbGludXgvY29yZS1pbWFn
ZS1wdGVzdC11dGlsLWxpbnV4LzEuMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2xpYi9weQ0K
PiB0aG9uMy4xMy9zaXRlLXBhY2thZ2VzL2RuZi9jb25mL3N1YnN0aXR1dGlvbnMucHkiLCBsaW5l
IDU3LCBpbiBfX3NldGl0ZW1fXw0KPiAgICAgcmVsZWFzZXZlcl9tYWpvciwgcmVsZWFzZXZlcl9t
aW5vciA9IENvbmZpZ1BhcnNlci5zcGxpdFJlbGVhc2V2ZXIodmFsdWUpDQo+IA0KPiBeXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eDQo+IEF0dHJpYnV0ZUVycm9yOiB0eXBlIG9iamVjdCAnQ29u
ZmlnUGFyc2VyJyBoYXMgbm8gYXR0cmlidXRlICdzcGxpdFJlbGVhc2V2ZXInDQo+IA0KPiBodHRw
czovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy83My9i
dWlsZHMvMTE1NQ0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3ly
aWUvIy9idWlsZGVycy81MC9idWlsZHMvMTI0Mg0KPiANCj4gQ2FuIHlvdSBoYXZlIGEgbG9vayBh
dCB0aGlzIGlzc3VlIHBsZWFzZT8NCj4gDQo+IC0tDQo+IE1hdGhpZXUgRHVib2lzLUJyaWFuZCwg
Qm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBz
Oi8vYm9vdGxpbi5jb20NCg0K

