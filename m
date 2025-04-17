Return-Path: <maxj.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30775C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 10:35:17 +0000 (UTC)
Received: from esa6.fujitsucc.c3s2.iphmx.com (esa6.fujitsucc.c3s2.iphmx.com [68.232.159.83])
 by mx.groups.io with SMTP id smtpd.web10.5557.1744886110310509388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 03:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=bcHAYJCg;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.83, mailfrom: maxj.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1744886111; x=1776422111;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aVBY7vsqZVIJYtHOYmPqTGx8YW1GuxEWAAhfa82XyLg=;
  b=bcHAYJCg0t34b8CPFXd1ulxnJ6015/874CbAw4ke2Wmca37XXS+JpNNs
   BmPtzXuwbl4s6WKdrY0eqjbP8Pwx/WS+JhheTa91QfrMqNpyCLm7f32mu
   knHP0szVVeyqX9Jffr34L4xahyvreD+a9ZBeJ94gEKCcoqB4nZxCVPI60
   Ko9zQhl4TF8NX/OR//H+XXCI7jSJ6txgcS8652f3kye53grnY8b3QKA43
   nQHlqRXH4tPQwmaAajAjaFBmAYCbctytPp+qQZL+mt75/mbsqG7dfkuzU
   +EQHJUzS/YnHkoajdGqwf4vXD8BIBqI03RYIcFLerJkDGEW6Cn+iyDBuY
   A==;
X-CSE-ConnectionGUID: Aul028fXT9yrx6uwzwttSg==
X-CSE-MsgGUID: Rr+NvsloRi+0DfkL9lbwUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="153029568"
X-IronPort-AV: E=Sophos;i="6.15,218,1739804400"; 
   d="scan'208";a="153029568"
Received: from mail-japaneastazlp17011030.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.30])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 19:35:08 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ib+GJMuy52MAn4EqsjxLmEQayWpIuXoPtDMf+HGKrK3isNg+w/WJ2z7G+8A1KxhNNr/X5KEuPa6h8ndBNRem2heCFvx3AvVIEVNPx3mRV+TvV6l88eQ8Ebj3ECnmV5bu0kdg0UlX4GK/XCTEjFCsENw8LxeaTGhfk67355XIA7WJCSWsZtEdDbV5fCS3OsjOffGb/L/+P6ZtyMNZvUVvp0ju03xLqje8iYIE2twgkMUglQVypwNECoii8RczxD/xY1uploHhRHN2aHwwKrKhuCZpS0CRGsRKA5kpMVTFphiwr/MOCpKdoD90RCpuDsIK/28qIb7q/dHXu7E6QPTJcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVBY7vsqZVIJYtHOYmPqTGx8YW1GuxEWAAhfa82XyLg=;
 b=Pq+zjlS0S/RP8LV1yIZFc82BJunUhXUTV9lRirJ8JushtMwo2EKYaAMC3Zu7qUc/g95UyeNBqnV5z3dlp2wrRCzZFRe21c1enCRppozPq+2/wv4ttb7Oy9V2CdHpCn8rXV167/7LBcVuzyS8VpvvBAiRD1LtO9fH64rNugsmUNYMqWrvzGFfjaP9wcAr4EOOSPZj/N8X1UwAfKTHD78FbcMndB4Qloy7nwdLGKD3OnnoygEqTZhVqt8SlGZ83AU4hAZPFbNIru83pMpk8EkLknFf/ImHcnym4pIEtQ5mqulxDb9zMQpLQKCNbBda4SSKLZYMoJE7ITWg4O3YL5wOEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB12071.jpnprd01.prod.outlook.com
 (2603:1096:400:3cc::12) by TYCPR01MB8680.jpnprd01.prod.outlook.com
 (2603:1096:400:157::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 10:35:00 +0000
Received: from TY3PR01MB12071.jpnprd01.prod.outlook.com
 ([fe80::479:9f00:f244:9b9]) by TY3PR01MB12071.jpnprd01.prod.outlook.com
 ([fe80::479:9f00:f244:9b9%2]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 10:35:00 +0000
From: "Xinjian Ma (Fujitsu)" <maxj.fnst@fujitsu.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>, "Maohui Lei (Fujitsu)"
	<leimaohui@fujitsu.com>
CC: Jose Quaresma <quaresma.jose@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?utf-8?B?5Zue5aSNOiBbT0UtY29yZV0gW1BBVENIIHYyXSBnc3RyZWFtZXIxLjAtZGV2?=
 =?utf-8?Q?:_Fix_install_conflict_when_enable_multilib?=
Thread-Topic: [OE-core] [PATCH v2] gstreamer1.0-dev: Fix install conflict when
 enable multilib
Thread-Index: AQHbr361JyTh9+B4UEisDGsXRj+mArOnopYAgAAGPlA=
Date: Thu, 17 Apr 2025 10:34:59 +0000
Message-ID: 
 <TY3PR01MB1207152E3206CDAA49967024AE8BC2@TY3PR01MB12071.jpnprd01.prod.outlook.com>
References: <20250417095402.762-1-leimaohui@fujitsu.com>
 <B405C158-14A8-4AAD-9F0E-302D53EFB8A9@arm.com>
In-Reply-To: <B405C158-14A8-4AAD-9F0E-302D53EFB8A9@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9YzE0M2FiMjgtOGMxNS00MmNkLWJhZDktMTlhNDJhOGVh?=
 =?utf-8?B?MGE4O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA0LTE3VDEwOjMxOjQ4WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB12071:EE_|TYCPR01MB8680:EE_
x-ms-office365-filtering-correlation-id: 76e19fe0-87fd-4313-8908-08dd7d9b8126
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TnVadjMwaU5YQzFJVkhMR0FTcmUzZHp1aVZPWG1YUmJFVWlsNm1JOGpuVEFi?=
 =?utf-8?B?bFREdTBDWGlyRzJseFJJaEZnejBLSk5wR3VlZkJNZ0xhRDZYOVB0ejlqNHNo?=
 =?utf-8?B?MmY1d0tlVjl1U0lvTjBVMHE0K2lYODBBazhkdmh5eVlPeERUOGJsWUZCMEdL?=
 =?utf-8?B?WU5pV3pZQ2dkdEU4eVZYbkF3TVlZYlR6OXFsRGpCZEptOUNodmpydys5Qzhh?=
 =?utf-8?B?VDZHNXhaYy9tSmJ3NmxuckIxbnFScHZHSnNyYUZGZG90NnlGYWRIeGszaEZW?=
 =?utf-8?B?L1lxZzJrcXh5RjB4UGtENmtWVVRHTkV5TFZjbEpNcVJIMlFWUkw2ckp4Z24x?=
 =?utf-8?B?Q3NDSTZqWVBnRG9oRC9sTHdDMXVyblBGMGJmUTc4enp2bjFwR1VOM3ZTcjIw?=
 =?utf-8?B?RWlWRzJNUGxUSEg3WUl5cnhyMEVTdENKT2NuMzhZdVArblY2dmREUGZQSjAv?=
 =?utf-8?B?eHVVVDdSWTFoUTRiRUhrZzZWSGZzN0xBNytBQTI1VlNRYWVqSjdxUmErZk1Q?=
 =?utf-8?B?RE9YTUc5V1hwUGhscW5HWUIxTW5Obm1kUGdUR0VDL3A5dm45ZnBWNUlabXB6?=
 =?utf-8?B?eHZuSGcrNmw0d3BoYmwvTVpleTBsNXBTcFVYbkZCaDNzN0NsL0R5UjUwb3U0?=
 =?utf-8?B?UFdQTG9tT0xNSE1NL2RKd3pabU8wbTRGR1hPSUhMa0VZZWdOSXh0R0tybklw?=
 =?utf-8?B?TnplZU1FZUc2aDZSaFgramxRcWhSdVpEY2ZnTzlCcWpMME8rL3N6bE1nb2hV?=
 =?utf-8?B?ckU2aExsbWtHdWx5SjFUS2pPcHlUaTJkcXVSMWZKL3dGNlZObnNIa3BTY1o1?=
 =?utf-8?B?OHhCOCtpMzUvTGlVTlp2T2FhZ2xqaWNvZWdUMWwzWjR0R3hSTG9KUnBZeXpF?=
 =?utf-8?B?djdHa25XZlNyUlZsa1p6QUdrc20wNE5LT1RITjNzMW5BN0paS1c1Zm9iNlFy?=
 =?utf-8?B?RWRaYnFaaXVEc3BKb1EySmc1eEZONkpBS1pYaW5ERUoyV0RmUWZUV0RxUTJa?=
 =?utf-8?B?K3ByelNkOWprZklnRnV4QlhXYjZlNnUwSXFDamlNU3FYWk9NR0VnMGlZeU8x?=
 =?utf-8?B?L3dGUmNFRnpYVzEvbVBHaHgySEtGN29URkdqYWR1SFJHcWJUMU5HVnZGaUto?=
 =?utf-8?B?bDdFM3BwVk1ITHpaMjg2aHh2aC9EZldNaVpybWs2Q1hxdDU3dnlDbCtJMk1R?=
 =?utf-8?B?S0w3THRBSXNjTzRQYVBHc1dIdVczYWN1TzlQTURRdlNhTXFVaTJRTkpnQk5Z?=
 =?utf-8?B?TlVyMzBpRlRlcTRaT3RWajUrTnVpMzZnVFRWM2IrSlVtTTBQQWdPM1d0TVRU?=
 =?utf-8?B?bEhPek1xMDMySEFaQW1qWUw3TllHNENSREl5QjJiR3JOZkZlRWVqNUJ1Q1dx?=
 =?utf-8?B?ZUVSUys5UTdiUlV4cStSV3NXUURsUzZUNkE3djQ1MnJYRmczYk13VFUzdjZT?=
 =?utf-8?B?bFZkWHlPOWRaYnZ5TWJXbGNwbXgyenZXYUsyeXlJVzdLdThZZVQwZkVsUnR5?=
 =?utf-8?B?aTFHOG1WYkl5ZUo5cHhBeDJhSzVieHI0WGI0SGYxQW1UUzFWRGkrUlpPZVd5?=
 =?utf-8?B?VFFUcGhYb2lHUXdFQ0Y1RW9idUtWRDJ5UW5oZTdSUjMyK1NlYW92eC8rNGor?=
 =?utf-8?B?K2psdkN5c2NZajhsSnc3dkw5QmQ2T1l6VXM0SytzRTBwcThMQjE1ZUxpRFlW?=
 =?utf-8?B?QWVtbzlFek9OVWNSTHBaTk9JcDdkbG5wUkw1ZFBTQUpTdXpEekR2WXVRYU1Z?=
 =?utf-8?B?c2g1TUdORzVRUCt3UUNhSkM5Zk1ucDFWVWhYRUYzRmN6OHJIRWFWV0JwYy91?=
 =?utf-8?B?VTJjQ3lKYTBaWlQzRkdJRE9PQjZScHNsbGJPQ1p4UC8wSUxDeW1LN2NIUlZG?=
 =?utf-8?B?TGFjVEZaTXVWQk1JRXVQMU5zUDVDdUdPQ3VPamZ1Q281M3N4ZlRxcktRb3Rp?=
 =?utf-8?B?Rm9UZjEycFlmeFBPQmltK2ZSL1diUEVLa3FMTVpid2RzL3h0UDBIakM4aC91?=
 =?utf-8?Q?Yrl7KoopbaFKIR3FehMpQ+SDnHr5Jo=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB12071.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VThLOTFiWnlVZ3lyWE1uQUd2YU02NDd4NDV5alErZzhqTTFGY29nODIwWHg3?=
 =?utf-8?B?RzhOdWpvUnYxcXBPVnlYVmFBNnBCRnpUSE5meG9pQTVZaHpTVU4zcU11UEpI?=
 =?utf-8?B?L3R4QVU1RUtwaFZkRlRYTDJyREw5OEk1WngyY0pVRXVQRVR2cHZmcmw2NElZ?=
 =?utf-8?B?V3dNalJ6d3NFeXh2Q3ZGWnh0WGRRZ2ZpaXFhQU45Z1lZem1VZFRjZnJyZDlP?=
 =?utf-8?B?TmZGK0ttb0ExY0J6ZVluUVpSSjdRZFBCa1R6S2N2cXhSalliOWNMS0NPbmE0?=
 =?utf-8?B?N0hzWlFGM0FJWHpEUzM5L0U5TDgzeGZiaXRSNVlPeWVFNEZ5bjhrbXhnRmZy?=
 =?utf-8?B?TTBGekZ1cUFocHoxMVlXaXIwMSswOFhaTG1VTllIcm00TG95VitLQjZLdG9S?=
 =?utf-8?B?OTZpdmdIRzZWMCt0SUl4WHR1ejFUQlFuNGpGYUlDRlNCZHEwbzlOQVFheEtk?=
 =?utf-8?B?SFg1dS9zbDRBcUpXcWlubGZJVXQreWN2eVpIcGtXVjNrWW9IemYxZm9xL3g2?=
 =?utf-8?B?WG4yT0lKeDBnc0JWM0lSQVd3ekFWUmQrQWVITDVoK2ljOHIzVnZ0OFB6OU5B?=
 =?utf-8?B?YmJMVDlzZmptL1FrWFF2dGRhQ0FHZUh3NFlqbWNzNFlCYnlNclZwc2pPa3NW?=
 =?utf-8?B?eE1RaEtTa21LUnl0NmVqYmpUbHFwS1AvU1NtS24zaEtNMTczdGVTMFg3MlZo?=
 =?utf-8?B?M0VCQ0NZZkJ0WmRNSVEyeWNic0tBOS9JTUxiSmhmMy9JRDhuSkVSYVpsSUxH?=
 =?utf-8?B?ZHRhaHZ1aWErZm9nT0c1b0hna3VTdkVNcjJNTHhKbmtYRENsT2Z3U0d4eEwy?=
 =?utf-8?B?TnBQWnZnZkxlWWZ5WXg2bG5HdHdjZ2VWc1JkUHBHeDQvbG93enBlTXB5a3NU?=
 =?utf-8?B?cmdqNW45WUd5MVZSQ05hUkVYR1RsVGg3dERzSFBvT29uM050WEhhVWxNZnJn?=
 =?utf-8?B?NldwRzZ6dGljSmw1aFZmUy95TExUUVBsaW95aUFsVVRqVTc2TW9qQURyakY2?=
 =?utf-8?B?dHJqWktBZDNLaVA2L0cvWHZRdDFGeHJwZ0haODRCbU8wdzQ4WUN2cGlJVlRv?=
 =?utf-8?B?SVhxTldBN3BzaGpXeDdwUGpld0Nud3JhOEpQNGUra24xTEpHYXpsNDZzZHFq?=
 =?utf-8?B?SEFYS2RvNHFTOTlDSjY1NlVIcUNlWS9ubjJqOGVTRWlVNUp3Y0NXYUFDakwx?=
 =?utf-8?B?TW42WHF6ZTFxYUk1Y2JBYjdJZUludFUwU3NQdzAvQTdQd2cwYXhBOVhSYkNp?=
 =?utf-8?B?MklDM3UxY25zM3dWOHhMSWRoSG9kZlMvQThqU25oWVh2MWdoa1hqT0JIUXV3?=
 =?utf-8?B?cCtqS1UzaHlnakJ1WFJkOXdCWWxNQTZ2TmZCN2E2dWU2ZVhiSjZmVmc3ZVY0?=
 =?utf-8?B?TERhQ243RWsxMG9BNDZPZjJ0NHZhYUsrc2k1ZVR4bkhpZFFWK0MzUlhZdUNN?=
 =?utf-8?B?WHVQc3ZZbXA2REU1SnJsdy8rM05YUENEdEZTTm9VVjMyalBUS01lYUh5amN1?=
 =?utf-8?B?TjBmTGlYZStSck5wdm5mMmtoSmpWc3N5OHNhWjNDeHYvN3RhcHVpMHp2K1pz?=
 =?utf-8?B?VTVaRUFMcXoyYlkvWWdmT09KdnZJMkoweFJkdXlnTUVQM21uZUFEKytoc3dL?=
 =?utf-8?B?dzhiZ3k5UlR3bjIyZXBnSG96c3I0S0pZbWJKdlI1SWloL3pEbjBXZFZVb05J?=
 =?utf-8?B?WVJqcDVHRTArS3gxeDg5MXF0b2dNcEV4Sk9QeHUvRk43UXJ3VE1Na09nRVVD?=
 =?utf-8?B?cDlOWW5JdTdsOUoyMEtSa3k1bStVbHZzKzdtQk53dTFXU2F6OEVSRHlKZmdy?=
 =?utf-8?B?bHkvcEZQa1plaHdza2l3MlVsS0V2VmEreVR5bkc0aEhDRlVRUCtrelplL0l0?=
 =?utf-8?B?eVlxZzFKTFluQW03eDBneFJhUGtKdlYwV2hxcjdjODEyanlsYzJDdnRQeWFu?=
 =?utf-8?B?YURrbi9vMjJpQURwQk1ZUTRKbmlWNGpjemhDUVRaV01ESmdJVStVcjBVZEpW?=
 =?utf-8?B?RDVuTjdnR1JhZWJFbGJBRG9xWFRFazNhVWhMYVZtaldFbWllWHNiaHR2MHhp?=
 =?utf-8?B?T2QzUHR5N3ZSSkJpUHNJOCtMclozb0VLOHViN0w1V3VwSm10TmxvVVUvQjRP?=
 =?utf-8?Q?GSsfGdLszyZvjhXPUbJRppBUO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	aKyFgGP/I/CtJyy7ndLJ8uXuZPf/kRLFm3HrDwUoQ2/ThPfhFxueyP0P+5PNAQO0mta8NjYP/9QHAOlIlOd7WWWm6PXHRQX9ukn3R33Eu3gfwauVPY4B+FlNtMe3Brf5MG4h2G9vOUCFuaCm/Rv/3EpPu/CrfJwTa+XT7A+vUqmYvUp57StrUL7SvFFxmnORFb9KLdPU/9GQTH24JcvKc360Jv6QAbIxoDqGz/xRdFxWcalVnnHl1/4/TZk468/QRbBHIqR/NakohqIW9qfPM1Ofs6+5syV7U/nTfXGNJR1Kswbc4SsIsPG0DeaYtSUKo64cM2ycQUYAbB93gJWmNZPJeuhEgAhsgE2t07a+uTxGsScQAZvFXGryKaNXZnarEg6E78HLB3fb4q4a4RoC7K4UeonQ+jCV1QapQL67ykKxza0vReUXBtnkT5nBdBOYxOXyxZdPGjU4318PDWKkjMB4H/ujmBhdmvRr5sLqKI+GV3oxf8Bls3N6cx3k2SqJXHQ7cqZ4M6Xvxg7pvajKVHOUl2wP1hXl6aSvAfWgzWqWnVUc4Ua1K56bTriLe0zKi+sTElsAFZM28Fk29DzSbAWt1EczAwTqADECPXnghoE8+x6zJDMSR+LKkikmOspt
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB12071.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e19fe0-87fd-4313-8908-08dd7d9b8126
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 10:34:59.6127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d6X2rYIBDJeqD+fkFchA88sGTw1r755MTa+Jdy2WrzAI/60L0nXAFGFjtbY5Cgwf7iZOGPyMzKyyIIGhx2Qzmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8680
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 10:35:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215055

DQoNCj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPiDlj5Hku7bkuro6IG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IOS7o+ihqCBSb3NzIEJ1cnRvbiB2aWENCj4gbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiDlj5HpgIHml7bpl7Q6IDIwMjXlubQ05pyIMTfml6UgMTg6MDkNCj4g5pS25Lu2
5Lq6OiBMZWksIE1hb2h1aS/pm7cg6IyC5oWnIDxsZWltYW9odWlAZnVqaXRzdS5jb20+DQo+IOaK
hOmAgTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+Ow0KPiBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IOS4u+mimDogUmU6IFtPRS1jb3Jl
XSBbUEFUQ0ggdjJdIGdzdHJlYW1lcjEuMC1kZXY6IEZpeCBpbnN0YWxsIGNvbmZsaWN0IHdoZW4N
Cj4gZW5hYmxlIG11bHRpbGliDQo+IA0KPiBPbiAxNyBBcHIgMjAyNSwgYXQgMTA6NTQsIGxlaW1h
b2h1aSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8bGVpbWFvaHVpPWZ1aml0c3UuY29t
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gRXJyb3I6IFRyYW5zYWN0
aW9uIHRlc3QgZXJyb3I6DQo+ID4gIGZpbGUgL3Vzci9zaGFyZS9naXItMS4wL0dzdC0xLjAuZ2ly
IGNvbmZsaWN0cyBiZXR3ZWVuIGF0dGVtcHRlZCBpbnN0YWxscyBvZg0KPiBsaWIzMi1nc3RyZWFt
ZXIxLjAtZGV2LTEuMjYuMC1yMC5jb3JlMl8zMiBhbmQNCj4gZ3N0cmVhbWVyMS4wLWRldi0xLjI2
LjAtcjAuY29yZTJfNjQNCj4gPg0KPiA+IGZpeGVkLXNpemUgZGlmZmVycyBiZXR3ZWVuIDMyIGJp
dCBhbmQgNjQgYml0IHN5c3RlbQ0KPiANCj4gSWYgdGhpcyBmaWxlIGlzIGRpZmZlcmVudCBvbiBh
Y3Jvc3MgYXJjaGl0ZWN0dXJlcyB0aGVuIGl0IHNob3VsZG7igJl0IGJlIGluc3RhbGxlZCBpbnRv
DQo+ICRkYXRhZGlyLCBidXQgJGxpYmRpci4gIEFidXNpbmcgbXVsdGlsaWJfc2NyaXB0cyBsaWtl
IHRoaXMgaXMgbm90IGNvcnJlY3QuDQpCdXQgL3Vzci9zaGFyZS9naXItMS4wL0dzdC0xLjAuZ2ly
IGRvIGRpZmZlcnMgYWNyb3NzIGFyY2hpdGVjdHVyZXMsIGFuZCBpdCBpcyBub3QgaW4gJGxpYmRp
ciBidXQgJGRhdGFkaXIgDQppZiB3ZSBzaG91bGRuJ3QgdXNlIG11bHRpbGliX3NjcmlwdHMsIHRo
ZW4gd2hhdCB3ZSBzaG91bGQgZG8gaW4gdGhpcyBraW5kIG9mIHNpdHVhdGlvbj8NCj4gDQo+IFJv
c3MNCg==

