Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF97E7716A
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 01:55:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by mx.groups.io with SMTP id smtpd.web11.47823.1734314097640992766
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 17:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Hm3HwSyc;
 spf=pass (domain: intel.com, ip: 198.175.65.11, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734314097; x=1765850097;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=QKGUlRmKx0r9iltr92G63XjTyaGBFa9N/NCMQ5dIy+k=;
  b=Hm3HwSyc1okbzxxo+V6dVrUfvo5LsNDgNuzrBj5c40k+xLSYzaCKpaiY
   7SzINXbPfLf4xYYmQvk+Obo8lgL1Uclql3Uf/Orkdi2yUPHGDPyZRVufP
   FrmH4QqeB6qeCQsHCxdHOsdc76Gx7DU/2ZJw8g6V/K3f25p84P7R013lS
   9sYMQYN8spq+ITCbCbUGG6h3cVw6rxcvEfsTcaXsdXEDKsjHwUlVT9N99
   U2JyiVU/rpwZ7lUKJvxoiPd40zNKlZ6X5QgvzjNOKn/2cu6WnYPiTBPcP
   kPK3CVDK8GvvNIxb5QUwF8AqlidrLzlZKXnucoQ8VegxDKEGBkZmLtTvE
   w==;
X-CSE-ConnectionGUID: xeiN+ti+QI+YnOq2kOubng==
X-CSE-MsgGUID: DtbECr9ZQ+KCyYPlZUhFZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45171626"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45171626"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 17:54:56 -0800
X-CSE-ConnectionGUID: 1Fd8rVRERpenJ5hEy7MXHw==
X-CSE-MsgGUID: pqRfgeb3T6Wg7GzM5tn8rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97481952"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Dec 2024 17:54:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 15 Dec 2024 17:54:56 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 15 Dec 2024 17:54:56 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 15 Dec 2024 17:54:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJEdznO6iPAwfOABaynGbvdq7YZ8mYREXaq93qKCrALyY2xuKdxisD07MlYwFhmrmcMGUADbrk8XpXe7Snvb/Pe7+Nw2YbDj2cAoPfxZVEtr4ft1Su96fWcwB+F66oFWj0vYuZ5x7fE8YeWdZ/HL/DSFTXrlDT3HHE9HmEGoO36t3B9Od+rk4jlW0ZQDcgkKdhBQAdKvwM2y20bD8VRKoBJPMjJNH2+bucPieR4V/sOTizFpU4dSyJ2uYm4lhjxU4zc7BjHmTPKuIfOseOR9GDyFKzAdUYLuTMRVYZF+Osu25zW7l0o8Wx3fsucUroCKhrwsuiilkbqZrPQa0aEk0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKGUlRmKx0r9iltr92G63XjTyaGBFa9N/NCMQ5dIy+k=;
 b=Y3SSUjKjISPHpe0zZkyQVw89qzBF9JLM0v4CY7W0wbqrwx32ji8FUFldq0K5mV58ooxVqurMlYuJB6ef5lTH6RhOBMzVsJXi3TBgWSR6s9i93Coq+f/2KiGPb1nNsvJQgyS0l9EEMPclzUX/KD8ga3/3dN5YfshO8BaqZ4kTbmluyRBfXk5u0kdTZ81MmEdebu+93E8hNIyMiPp204JdVOs5WR7PKtVvEbU3TAUdOKmhAwSZU/FFvEyQIUHfkzu1dQPj5YJzPVLa1HFwnEsBAda0yCy9tHxQ+cKpQrsTqM+GYtnuUJtstgoW1/XiZmt3JwTBTzqD5R/kiUJfW1V5AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by IA1PR11MB7754.namprd11.prod.outlook.com (2603:10b6:208:421::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Mon, 16 Dec
 2024 01:54:54 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%5]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 01:54:54 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>, "Pokybuild
 User" <pokybuild@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.6.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.6.rc1)
Thread-Index: AQHbTYeweFbKqynR8EeqbgIxtv62zrLoH0hQ
Date: Mon, 16 Dec 2024 01:54:54 +0000
Message-ID: <DM4PR11MB77609414BF463D5BB912944BA13B2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <CAGDS+nkB+EyEg8FOQUbjt+aeAs5DBLEtsMojDjyarvLM=ikT4g@mail.gmail.com>
In-Reply-To: <CAGDS+nkB+EyEg8FOQUbjt+aeAs5DBLEtsMojDjyarvLM=ikT4g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|IA1PR11MB7754:EE_
x-ms-office365-filtering-correlation-id: 2fd62e8d-1194-4529-b0f7-08dd1d74a307
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|7053199007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YjhXU0labVRPL1FYcWlnYUlyc2xJbW4zOU83cDREOGI3Y0g2anU0TkJIQ3ZS?=
 =?utf-8?B?bUFHOHh4b1dEdE1YYU5NcmtJS3AwTHRLMXN1ZlRGUmlwQklYcTM1SVFWZU8z?=
 =?utf-8?B?eXlsZ25UeVI0VnJFeUZvNUxRK1N5V0NaNllyazJ3MFBXS1c3OURlb1ZCYXpE?=
 =?utf-8?B?TTJLdDlaQUhtYU1vRlFNVjBkbndNemlyVFpDM0crVkl3OEpUWGpBTU1xZTBl?=
 =?utf-8?B?Q1dEWmZZLzl4ZXVmZlVodVA5QnI2eUpKSzQybkVKNGlIYU9xYkU2NlRuUzVE?=
 =?utf-8?B?L1g0Qy9SN3RWU1JncUt3UFViYkhrOHM4eUVLNkxjd2RDOThXOFhGZGZXS1l2?=
 =?utf-8?B?QmhPVnJpMVppOU95cStyQy93eTRxeHRoc3lUbXpQeldpeWhkWjk0WlhpK1lm?=
 =?utf-8?B?TC9idW1BREJWLzQzdlVXUno5M3BwZkJOUnlpWHFxaDFnSmo4YVVWeWk3WmVS?=
 =?utf-8?B?V3JWM0tlSCtMVzZjSnpzV0lPbHA1UlExNHVoWlNDZUk4S1czSC9kTFJJTllE?=
 =?utf-8?B?cmRXeXp1UHl2Vms2K0JON3NFdFR3d2hwRC82OVRRSDVXWWNKQzNEczc1b0Ns?=
 =?utf-8?B?ZEZiV3RhckhIa0N2dS9kK1B3OG42eUVJNzdTanFybGtjVjdsR3ZXWFB5NExN?=
 =?utf-8?B?YWx1c0NENzNvWUNTMkhBRnFTeHRmM1JMc1paTXMzdTZkVmhEVkJhbGh0N0pQ?=
 =?utf-8?B?MGRaQVI4Z0xReDVQQ09oMFBzZWFwZUZ6YVNSckwxbitOOEFabmdtL1dGd285?=
 =?utf-8?B?QkNwOHc4VWIveW9oUnRyWStWZzlGRTBPTG9uYWp3N096QmEyekt1WTB4RHM1?=
 =?utf-8?B?UU5GM1NtY21KajcvL1hCK2UrdVVpeDBZUjJMTW5OcVRlanBLNDRoaTJKSWFo?=
 =?utf-8?B?ME4yeXltZUlVdTJDQ25DVk5NMTRwNjRDZHlsSVpWK1dnZFRyK2dUQ3AzdDVr?=
 =?utf-8?B?eVlkTGFYNTlUMjZQTTFvK1FBQTNOOUhHM0U3eEg2d1U3YmJmcHg2dDNEa2dL?=
 =?utf-8?B?ckpGdFc5eTJqb0pMaWxZYTFNM01WQXlmUys0b242TXovWjUvWitaNzRXWFRK?=
 =?utf-8?B?VXIwRVZjRmNDbldYQ3JrVWZqemxuT0lpdzRkcXZoUG1nMFhJR2Y2K09xSm01?=
 =?utf-8?B?SXpnSVZvN0JpSW9jQk1XM2lrWWpxWDRQdVk0MERkdHN2dldVL3dFcU1DaWYv?=
 =?utf-8?B?Kzg1V1JNMlRxQS8zSUlXRnJtZmxUekgxem96V3duVTJlMVpRMFNEbmxoSDQr?=
 =?utf-8?B?VHZyV2w0N2V4TnQ5NStEU2JGekVUSm9KYnNrYUJtaEhyRmJXOGNvSGw1NVd5?=
 =?utf-8?B?RWpNNCtmczlaQ3RqR2pGL1lFUnhCVmp6SVpRSmpoMmFUZkhlWjZCZ2t0bFE3?=
 =?utf-8?B?S3krMlZJWGxPemFMUm9ndHhWMU56TGZhZHkwVDJQWHdobXFVY05BUW9yajNW?=
 =?utf-8?B?dGxIcHJvKzg4YkVqUHMvUGlvV0ZEcXVTcGNFMXBlRU94VWR5dlAxUkp3Yjd5?=
 =?utf-8?B?WXAzTGRRU0duNWRvS2FHbFRHZkc5SzQrWWhqSnZSRzNqTTdDbWJOZ3ZMdlhS?=
 =?utf-8?B?ek1oZmVOeU1pVENIaVJkRVFvd2piWEsxYmVyLzF2MXgycmJPeWp1eEVhL2Uw?=
 =?utf-8?B?dThPL3VuNXZxUllxQU44Q2VtWGZzQUJyVFllYlBoeG9oekw3eFdnamF5VXI2?=
 =?utf-8?B?RExxODdsVjh6SlkzUExaaUZiNmFvY09WN1hKM0ZJTmJiWW9rSXV2Y3duT01C?=
 =?utf-8?B?OWZDaC9SM3Z3eWZMcEl3LzNiemNkTmg2OG9oZWZpbmczYkZtSjIxem16eTBr?=
 =?utf-8?B?NUwxWXBtYXp3blpTSmJidFl1R0tKSEtjNGlFZlpEcmZ6bkdGTUgyT20rWlR4?=
 =?utf-8?B?UEd3aFFUTHZoVTVPSHY5dTc5a2xMeTlrNFczMkNsUjlYWmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MitJb3BTMllIMWppcU50ZjM2NTcvYkJ5YnJyMjJPRU5TVi9zc2V3bVc4Zmtq?=
 =?utf-8?B?Yi9NeUF5d0pYZmFBdmR1aTcyZWdnSW1sRUtkUFd5ZjV0eXZsMFl2cUdHYmkv?=
 =?utf-8?B?N24yc3c5cGc2dEx5ZHg2QmszdmIxOWRiRFdzU2pQZklUYndoRU1oNmdJbEhJ?=
 =?utf-8?B?VVFLTjl2L1ZTRUh0UklOb1dEN2p5TFJ1emdxTmFhMlM1bkNvemx5dCtsU2pZ?=
 =?utf-8?B?azc0VXhHVS84NGtNSEVjd05aS2NnaFB3OEFaODVwWVhoOTB2SDUvaVRUUnU4?=
 =?utf-8?B?VGtqaVF1bnhmSFVzRkpUTlBkVlBrNWh6V0JsQmV4TG1DbkxxTG1HTVpLSW1U?=
 =?utf-8?B?WFY3c0tkUUJLbVFyRDJtUEhQOENRSGJsM1ZiamdDUExGaDlGS29oakE1aUR2?=
 =?utf-8?B?ZGZRSHJDU1R3QUw3azVmNGFTNmxIeE1xUDduY3lXcmEwbWExemZQNXdOcXVK?=
 =?utf-8?B?cGJCSkdFZXlZankwVExMZDl4aFY4SlpmNFJTVjZySm5ZZ0JDZ2trSHFmTkVG?=
 =?utf-8?B?ZnhZRkVDblp4Z25sRHF0b1pxUDNpM2Y2OW9rRW9Vc3BCZGg1VjhNQllxTEVx?=
 =?utf-8?B?VE83VDRPSCtoRkE1RUdnZXU2SHVPVG5kMFg0bWtqQVFvTDdXazBtZi9kUVVG?=
 =?utf-8?B?dlVsVHZZUUJYVXNTY3lMMHQvRXU2ZFBrRkYramEwWFJKYmYvWVc2SktYa1J6?=
 =?utf-8?B?VUpmMmtYdWNlSG1PelpvSGZQRWNEcDFmTjlxZG9DMDRYYjN2c0Q3UnZWM2JE?=
 =?utf-8?B?UTJQK3lFSVViYkJEcFdZSHBsOW1OK3BuV25KUVdsRmV1cWlRSjZyb3RRa2k4?=
 =?utf-8?B?YkY3ZlU2ME1rZ3ljTTJVajNVM0YzOHJ2Yk1ka25lWUorbGRUQU5DVzRyWHJO?=
 =?utf-8?B?UVdNWnMyVXpMTVdwdHcwTzJ1TmpxbzBvMkQ1cGtXTHJSb2lGUEg3Mjg0MXNP?=
 =?utf-8?B?bE1rRE4wVW9uTXp2RE9URjhIdVZZYUcvcWxEM2k0aFBoa2NOVHk5ZjdHTm1O?=
 =?utf-8?B?M1o2dTVaM0x5TGxLNnBEZDIrandTQnR1MTVyZzdhZVNBejR5aENSYzNYQ2dN?=
 =?utf-8?B?MWp2TkFtN3cybCtmbVdSMjV1VTUyZWZSdlo0a24xT3pXY3BFV3M4SWF6WndJ?=
 =?utf-8?B?WUsyNUpVQXVOS21UaktKVmlwbU9McW03TFJLYU1FeFQ2dmpnTDY0aTBCNU1Y?=
 =?utf-8?B?QjJISEdya3E4Y1lrNjNOTjJJWkhOMHkxd0o5dzhBLy84cW5rV1VSRUY5Rm1P?=
 =?utf-8?B?SVFGWWF1c01nRjJ2MVdNdGkzTWpsaEhhakFXUVVhL2tnYXdPRTZuTENBMmJG?=
 =?utf-8?B?TXNQTTRnZDVPdDVrOFRvdElrZlZVZ2JLMGtoVkk1dlNIUW9ZNXI2b0JSaGFv?=
 =?utf-8?B?VGhEdmRuNEhWajFEcE9yNndEYjRHN0dENVRDWFhodWIweTBIbSs2cW9KQ2lV?=
 =?utf-8?B?ZDJncWh6Tk9VeThSZHA0YlhGYThwL29ySlVsa2V0SUhDMnBMaFltcG13c0tm?=
 =?utf-8?B?c3BQbkt0eVk4VGR0N0J6SzRDWHA1a3Bpdkw5c0hoY202NWIxenlTWDQvcGlS?=
 =?utf-8?B?bTBjVG5YNmJuVFJXbFg5VlNtVENmRXlVRTV3WHFlRzVSTlMvNnpveXpITVNz?=
 =?utf-8?B?ZWE5R1VXdnpaMmg2bm13NzI1Q0RaVHcwMjZsb3ZoS1JRczlzL1h1dXp6bEhm?=
 =?utf-8?B?cU9xdVVLcVhCREtxQ2JrRWlZUFZwQTBGQ3ZsRlpkSEh6VUM3MzNRVEw3Z2JZ?=
 =?utf-8?B?OGhaUEhnTVBQVzNabkdsYjIwdGwvZjdUaXJsRm5YclhmRFd2c2pxUkEyazlS?=
 =?utf-8?B?cmExMW96ajFmWGlaTStnWm5QZ3g2VFlBZkdxVzR0VkF5dHVGVWhuSGowcTg3?=
 =?utf-8?B?QWM2YlBFMUVkUU4rZElxUlVBL25NS3JOOS9qOGNtcWtYVkpsM1BoRktxd0tS?=
 =?utf-8?B?cEswdzZDZEd6SitnSlJYWjk5VU5kbEZHNnVndlBEQWdha09RVzg1VXdkK2tI?=
 =?utf-8?B?c3ZQSE0ySmUyVVFudXNRaEdDc0c0K1Yxajg5UFZURnNhMEptbVA1TStibU1U?=
 =?utf-8?B?RGp4bWlNRkpvY2Z1ek5qZ3lRdFBMWGl2UUJjbEo3VGtkYUN2bTJDZm16TVdh?=
 =?utf-8?Q?fM+CQeY9S0qMFUR8ihELF8aWs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd62e8d-1194-4529-b0f7-08dd1d74a307
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2024 01:54:54.5015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 65Q/5a5vHxBbHT7yQyKpc88A8m92+S7p8Bc32VxjILO+tpT+XGQBxZgAmscKS956ALbxMqEYXtDY4LyAZLlB/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7754
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 01:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208756

SGkgYWxsLA0KIA0KSW50ZWwgYW5kIFdSIFlQIFFBIGlzIHBsYW5uaW5nIGZvciBRQSBleGVjdXRp
b24gZm9yIFlQIGJ1aWxkIHlvY3RvLTUuMC42LnJjMS4gV2UgYXJlIHBsYW5uaW5nIHRvIGV4ZWN1
dGUgZm9sbG93aW5nIHRlc3RzIGZvciB0aGlzIGN5Y2xlOg0KIA0KT0VRQS1tYW51YWwgdGVzdHMg
Zm9yIGZvbGxvd2luZyBtb2R1bGU6DQoxLiBPRS1Db3JlDQoyLiBCU1AtaHcNCiANClJ1bnRpbWUg
YXV0byB0ZXN0IGZvciBmb2xsb3dpbmcgcGxhdGZvcm1zOg0KCTEuIE1pbm5vd0JvYXJkIFR1cmJv
dCAtIDMyYml0DQoJMi4gQWxkZXIgTGFrZS1TICgxMnRoIEdlbmVyYXRpb24gSW50ZWwocikgQ29y
ZSh0bSkgUHJvY2Vzc29ycykNCgkzLiBSYXB0b3IgTGFrZS1QICgxM3RoIEdlbmVyYXRpb24gSW50
ZWwocikgQ29yZSh0bSkgUHJvY2Vzc29ycykNCgk0LiBNZXRlb3IgTGFrZS1QICgxNHRoIEdlbmVy
YXRpb24gSW50ZWwocikgQ29yZSh0bSkgUHJvY2Vzc29ycykNCgk1LiBCZWFnbGVib25lDQogDQog
DQpFVEEgZm9yIGNvbXBsZXRpb246IFRodXJzZGF5LCAxOSBEZWMgMjAyNC4NCiANCkJlc3QgcmVn
YXJkcywNCkppbmcgSHVpDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cWEtYnVpbGQt
DQo+IG5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgU3Rl
dmUgU2Frb21hbiB2aWENCj4gbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTZW50OiBTYXR1cmRh
eSwgRGVjZW1iZXIgMTQsIDIwMjQgMTo1MSBBTQ0KPiBUbzogPHlvY3RvQGxpc3RzLnlvY3RvcHJv
amVjdC5vcmc+IDx5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPg0KPiBDYzogcWEtYnVpbGQt
bm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gU3ViamVjdDogW3FhLWJ1aWxk
LW5vdGlmaWNhdGlvbl0gUUEgbm90aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0b2J1aWxkZXIN
Cj4gYnVpbGQgKHlvY3RvLTUuMC42LnJjMSkNCj4gDQo+IEEgYnVpbGQgZmxhZ2dlZCBmb3IgUUEg
KHlvY3RvLTUuMC42LnJjMSkgd2FzIGNvbXBsZXRlZCBvbiB0aGUgYXV0b2J1aWxkZXINCj4gYW5k
IGlzIGF2YWlsYWJsZSBhdDoNCj4gDQo+ICAgICBodHRwczovL3ZhbGt5cmllLnlvY3RvLmlvL3B1
Yi9yZWxlYXNlcy95b2N0by01LjAuNi5yYzENCj4gDQo+IEJ1aWxkIFVSTDogaHR0cHM6Ly92YWxr
eXJpZS55b2N0b3Byb2plY3Qub3JnLyMvYnVpbGRlcnMvMjkvYnVpbGRzLzYzOQ0KPiANCj4gQnVp
bGQgaGFzaCBpbmZvcm1hdGlvbjoNCj4gDQo+IGJpdGJha2U6IGY0MGEzYTQ3N2Q1MjQxYjY5N2Jm
MmZiMDMwZGQ4MDRjMWZmNTgzOWYNCj4gbWV0YS1hZ2w6IDJlMDYwNzMyNjkxZWQ4ZmNlZTY3MjVj
ZjhlYmM5MmU4ODdiZmQxODgNCj4gbWV0YS1hcm06IDcwODgyNzljMGFiMDBjN2RhYmVmZGQ0NTQ0
OTUxYjQ3NDZiNDg0NzYNCj4gbWV0YS1hd3M6IGVlNWJiNTU2OTc3MjNjY2Y2OTI1OTJlMGIzN2Fk
MjY4ODY5ZTFjMGMNCj4gbWV0YS1jbGFuZzogOWZiZmE5ZGIzMzEzMWFiZGYzODcwYTk0ZjAwMTk5
ZWI1M2UyNzZlNQ0KPiBtZXRhLWludGVsOiBiNjFkNTMxMGZjYjRlNTA3N2JiNGIxZGUwMjI4ZGM0
NWJhNjk1MTBmDQo+IG1ldGEtbWluZ3c6IGFjYmJhNDc3ODkzZWY4NzM4OGVmZmM0Njc5YjdmNDBl
ZTQ5ZmM4NTINCj4gbWV0YS1vcGVuZW1iZWRkZWQ6IGI4ZDFhMTRmN2YzYjc2NDU3YzM2NzUyMjAy
ZWE3YWU1ODgxYjY2NTQNCj4gbWV0YS12aXJ0dWFsaXphdGlvbjogNDUwOTQxYTFiNmRmOTYyODU2
OTFlOGMyM2Q0ZjMzMmQzYzg4YTk5NA0KPiBvZWNvcmU6IDMzNmVlYzY4MDg3MTBmMjYwYTUzMzZj
YThjYTk4MTM5YTgwY2NiMTQNCj4gcG9reTogMjU0MWE4MTcxZjkxODEyYTRiMTZlN2RjNGRhMGQ3
N2QyMzE4YTI1Ng0KPiANCj4gDQo+IA0KPiBUaGlzIGlzIGFuIGF1dG9tYXRlZCBtZXNzYWdlIGZy
b20gdGhlIFlvY3RvIFByb2plY3QgQXV0b2J1aWxkZXINCj4gR2l0OiBnaXQ6Ly9naXQueW9jdG9w
cm9qZWN0Lm9yZy95b2N0by1hdXRvYnVpbGRlcjINCj4gRW1haWw6IHJpY2hhcmQucHVyZGllQGxp
bnV4Zm91bmRhdGlvbi5vcmcNCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBM
aW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmll
dy9SZXBseSBPbmxpbmUgKCM0ODYpOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9x
YS1idWlsZC0NCj4gbm90aWZpY2F0aW9uL21lc3NhZ2UvNDg2DQo+IE11dGUgVGhpcyBUb3BpYzog
aHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL210LzExMDEwMTgzNS82NDI0MDQ0DQo+IEdy
b3VwIE93bmVyOiBxYS1idWlsZC1ub3RpZmljYXRpb24rb3duZXJAbGlzdHMueW9jdG9wcm9qZWN0
Lm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvcWEt
YnVpbGQtDQo+IG5vdGlmaWNhdGlvbi9sZWF2ZS8xMzU4MTgwMi82NDI0MDQ0LzE3NDY4MTM4OTcv
eHl6enkNCj4gW2ppbmcuaHVpLnRoYW1AaW50ZWwuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0t
PS09LQ0KPiANCg0K

