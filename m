Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4C0C87FCE
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 06:39:03 +0000 (UTC)
Received: from esa17.fujitsucc.c3s2.iphmx.com (esa17.fujitsucc.c3s2.iphmx.com [216.71.158.34])
 by mx.groups.io with SMTP id smtpd.web11.13796.1753425541761844595
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 23:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=AQnvCRmB;
 spf=pass (domain: fujitsu.com, ip: 216.71.158.34, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1753425542; x=1784961542;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=7MDq4GmLD/sWNc4w9vgWhQdQquEWuo7mpgOwp34DBo4=;
  b=AQnvCRmBCuNR8gZSrKNGSh226FDbfZJofzUsGGMSu1TGbTp/zHCMOiuV
   7Xr9SiCAQQ9Htuiq8QntNKkNMtSEhIXsiypBOTa7/kf1+MD3LptJnpF73
   a6IhBOEqosr12GLRAXaPaJCtyruoJWeUEknCzfYTTrXPr6ec/YsAaPPWQ
   53uDEsfdQ7rIJuTylQeG6Xr7g5ts2pkC572E5smPQLjbfnAdv0/Thg4AH
   gemxnIRlKzGU2IqXoHeXHZD+j+OUxf/B6KBzmd24Xsw+0PDBftv4+lf/s
   qoCIabOdoEnChNvmaj2yKyOm49VKMuf6vo/NxK2wgHDJBCld6ufqeU3H5
   Q==;
X-CSE-ConnectionGUID: Ib5byhl9QoK70AM2gifPEw==
X-CSE-MsgGUID: m838ZXbkTq6ermQnASVqMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="162531034"
X-IronPort-AV: E=Sophos;i="6.16,338,1744038000"; 
   d="scan'208";a="162531034"
Received: from mail-japaneastazon11011068.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([52.101.125.68])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 15:38:59 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ev+VdkEnEGaortkqyrPtuWZBdfpZt6zoJhttEEMMXC/Gwl0sDRj9YnQIljuMujkm1zfHd4biu6YIfNV+00TGaVRN1kG0iYSjo8XMaeIN3reCuyqK74/Pxrtve/r7gA8M+k3ae8dWvkBwQRtfG+dFXDXTprKajg9vUb3kkR5Rs9vyNVVW79nJYA2PMstJwdoCSj3CEPdWGfAcrIhbHRsZl302SsDCfELx8q/vbuKY4lU+7GkMriID3f6VrLstTvbPnt4J0JfHfs/H3Pl8aHj+uZKWvoH10ndsnnFYhm0072kU6i6VjjUgGc0LCqmIl2+GTkIXAdyDsUUsNqtFeIz+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MDq4GmLD/sWNc4w9vgWhQdQquEWuo7mpgOwp34DBo4=;
 b=IVleTW7w7JjHLRcTGYNe5An6G7CtDhRo2xS5Wwe+TyeK7teyvjO3Sde7DfB9W7+4lUVhm6gZI1rzG9UjhwfnAzkNCZSCCCLVJiRQ28x9Be6PeI5R3L1y3qWwiFMNlaCFU3nT4igUJLzg3KtTxWevCewLhHrbzsCCfox0hKkEssh1usnLfCxGFCabCKA3NvL/HByhTGK9Rzbt+pQJ/Hx0PfaSR0LQRVcH+tW8UTfgTdk22ki5IfZF/upfaeMlNS0XU1Q7ANvE6rzGEdPEckkMRnv1qWB2lUHFK199rimt03lWdSgi7Ee+lqNbcJvgrIdhbH54H+MYJWosGACSKbmVUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYCPR01MB11590.jpnprd01.prod.outlook.com (2603:1096:400:3b9::8)
 by OS3PR01MB5624.jpnprd01.prod.outlook.com (2603:1096:604:c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 06:38:56 +0000
Received: from TYCPR01MB11590.jpnprd01.prod.outlook.com
 ([fe80::8618:6488:35f4:5f24]) by TYCPR01MB11590.jpnprd01.prod.outlook.com
 ([fe80::8618:6488:35f4:5f24%3]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 06:38:55 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?utf-8?B?5Zue5aSNOiBbT0UtY29yZV0gW1BBVENIIDA3LzEyXSBsdHA6IHVwZ3JhZGUg?=
 =?utf-8?Q?20250130_->_20250530?=
Thread-Topic: [OE-core] [PATCH 07/12] ltp: upgrade 20250130 -> 20250530
Thread-Index: AQHb+24YWpMAbwp9dky6RwPCr3v5jbQ/c+yAgALyfvA=
Date: Fri, 25 Jul 2025 06:38:55 +0000
Message-ID: 
 <TYCPR01MB115906739A3DE3638C6308F499B59A@TYCPR01MB11590.jpnprd01.prod.outlook.com>
References: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
 <20250723010614.926-7-liuyd.fnst@fujitsu.com>
 <DBJC0QX4FJ0A.EVEZKMCNWFYQ@bootlin.com>
In-Reply-To: <DBJC0QX4FJ0A.EVEZKMCNWFYQ@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9YTEyOWY5ZWItMmIzZC00YmM5LThmZDUtNGMyYjE0MjJl?=
 =?utf-8?B?ODMzO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA3LTI1VDA2OjM3OjUzWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11590:EE_|OS3PR01MB5624:EE_
x-ms-office365-filtering-correlation-id: 37eab9f7-5060-41a3-4e2c-08ddcb45edbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Qjh4K21zT3JLZzBuL0l4WmNHcEtQQktkRGdBbFhnZUxlMDRMakttUWZlNnBs?=
 =?utf-8?B?eWlYWEZBRDJWSGNhZTZ6cGtPZkMyd3dpcFJmbFdhUlNVYmtkOFhQYUZpZE5l?=
 =?utf-8?B?NjlmeHk2aGVhdStMMzZEV1ZGYlFLcjE5K0cvRTRIN3BRNkcrQTZIbEp1MTFa?=
 =?utf-8?B?c1l4S0t3U0dDV1dMNklTa1BUT2t3R0VnbGhSZkNNZitGVHJ6SGpuTytmSmRr?=
 =?utf-8?B?SDd0bXJPK0t1R3hUaVhCcUMxWlRtaXBTWlAzL1NCVWg4ckZIbWxkN3hncmlo?=
 =?utf-8?B?MTczU05DZm1RcFBBUHQ5cHM2anZBcWJ6dmx5NGp6cTRJQitndlB5S0Y2UU9V?=
 =?utf-8?B?TVlEY3dMNlFnRGxmdzkxRXU4MFVTWnRwTDk4Tm1uU25oOVp4OFU1ZHpOdGV3?=
 =?utf-8?B?N2JIbWduSmZCVDByUkpZS2hxMkdVcjhjeUNVZXl4dE02N0szcW13LzJvbEhn?=
 =?utf-8?B?b2MzSm9kU0NKM3YvSWhpcWdydm9BQlo5Undtc3d5M0Y4UTZJVUhmbDl5Zm9u?=
 =?utf-8?B?VFFGa0FjS1lIZElUVTJCS3lVM1hzR2hCcVBYZDFvTWN3RGtWY1prSlEzb3ZK?=
 =?utf-8?B?Q0tra0ZnNFVtWEF4aW1OUlA0b2hMS2c4Q0h3SFpGR3VFOTlDajQxblYzbWRF?=
 =?utf-8?B?N3BrYnBOTDhQL3RrY0d4UkN3cUd4NUIrTXY5S3M3MXBNNk5kRlV4MitUaHEr?=
 =?utf-8?B?dzJ6cDl5ZjU1U09OaTdwY0ZjQks2OTJoQ0hORTBtT0NUVUR3VzBrcEZkTldt?=
 =?utf-8?B?b0hYQkJHcUFXUGJLbitJTW5DajJCaEhaZTVBNnQ4ejlUTW1QdlJvek8yTjNI?=
 =?utf-8?B?S3phSHNjRUx3Ri9sNldiSndjNGRWUitvaUdITkZBc2gxUXR1Z3p6UkNMWDJI?=
 =?utf-8?B?dTVReHRoU01vUkdhSzJIYTFDajEwUE1ybEtoMFZlaWEyVVZHdE1jYXVtOEpl?=
 =?utf-8?B?UW96SmhvRkN3UGx3TDlhN043RHZoSGFvK1JIdDZWNE5QbC80S05xWmRpTlF0?=
 =?utf-8?B?ZHd2c1VnZ1F2WFduSkliNGx4Wks1MWpabWNMb2VSZEVXTTRGYmxGalA2SCtE?=
 =?utf-8?B?Tm1LeHR1U2Y4aTFNK2pYVkFXQWhKL2FkZUlRTkczYjFuVXVuUkxTM2hTN2xJ?=
 =?utf-8?B?WktRVE4rOFBXNkVtaWRoR2ZNZTRsREtFY0kvL0R1SERxczBDUnZ3NVFGYk1Y?=
 =?utf-8?B?eGZlZWtLeU83TWQ1bmFKNlUweC80dVErVjE5NDFITVVoQy9uTHJxRmJVdlh0?=
 =?utf-8?B?K1VQQUUzcFdEMzdFaytsdHRMblVvOElQWStJSUU0S3JxZ2QwS3JaMk5teVRn?=
 =?utf-8?B?ak5SVkdFd2U1Qk5aZUNJQlljM2NpLzhQMUhQUU5wdHRrdGRIcGw0Z1BhUTBZ?=
 =?utf-8?B?ZEM5RUFpbkZrMllIMnR5S3BNZktvbkdOMHhHNHJsVWZiOTFUcWFydlMra0Y1?=
 =?utf-8?B?aFlwak90TVZGVWVLNzNTMFJHclowV3NxbHZRcmdDQ0Juc3RHM3liU1NlakVW?=
 =?utf-8?B?ekxKYjFZa1diTGVMcHVJWCswTnNaaWpvZUFBQjRQRThneDRGb0hQRFdqdXVh?=
 =?utf-8?B?ZFlJSXhLSWp5c20yZUxqVXpTQXB5NmVidlBKcU1PQUNGelZLNkFHRUFzNEpz?=
 =?utf-8?B?RVhvM2U5a0xxZllySGhUc0JKb3BjWnVYU0l1RFBWYmF1WDdNV005MGJxNGVi?=
 =?utf-8?B?NUI3RVJNWDNFRmZHNGFCSVArMlJ2RHNybzJYS0hUeW56T002NTgxZzVQcklw?=
 =?utf-8?B?bnpBK3EvdU4ydXN3NGJTZWhySmQwYmptQ2VQb2RueklxSmgvTGU4akl2dFYw?=
 =?utf-8?B?WHErbS82YUZxWDBlanRlMXNGNzA4bXd5c1A3VUN1T2lucGJXQzNKV2NpcS90?=
 =?utf-8?B?VVh2c3EvNmJ5dWo4d2VVNUVWMUN2NXh5TEJ2dEdtYThqN213YjZ6d1FrNCt6?=
 =?utf-8?Q?+x+vQnWill65i2G5IcASJaH4pXiEcBN0?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11590.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?LzdNbFo3dDh0NXAybkQxRHpQYnFkUEpGRWVOYVhlN2pGUVJoYzNKaFkzUHlU?=
 =?utf-8?B?eFA5SXRKR1ZLNFZhNUtQdVJoajRGT3RCVzMwdThIUVpaQnRmMDJQUDgrWWgw?=
 =?utf-8?B?QkE5RFhSeHZjRk1OQ0xMWkhyR2NRWFhSTVBwNFlHVTk2eXAxZ3huMGNjenVw?=
 =?utf-8?B?eGV2VHgwL2pjSDZSVzNLNVlxNExZalQrM2lCbTRtRXF3eG1OSXNBaWdKY1VM?=
 =?utf-8?B?SmQxc3dUYXZUWlRweExqQkpUVTZJZmlzTkRiQmhVOXZCNSs1eFRoU2g4Z1A5?=
 =?utf-8?B?bUZVcVFjOHUvcktZNmlEcXdGUUFFWHA4cHAwLy84YStGcHFtd0NFVUVJRDBC?=
 =?utf-8?B?QUIwQjZXUkl4NFBNWmh5VnBTMWV3NS8wNkRMOUxvMzBuVVltT25FdzFnTHgr?=
 =?utf-8?B?N0hRWE9jbjNaczUraWtYbFdacHh1alpGdXpkdVg5QytSWGEwdndHRDgyZnNh?=
 =?utf-8?B?MmhoS2tPekp3YWhjUHVYazJEQXJqVHdjbUVFaGsvek85U3V6bXBncyswaFZt?=
 =?utf-8?B?c3ZwU2pOck5VR2pacTIySkVYMEwwR29sWmtzMk5YTWZuQXVJa1NlbEJjN1BN?=
 =?utf-8?B?WTZEQ2tOMjY2eVQ4NzVXU0FUYTVwalpVaUFXMldkK0pzTnN2czdFRXhadk0y?=
 =?utf-8?B?VFA3eG9ZcGlQbGNlbzd5OWsxbThlbmYvSzJhY0hkTk9OQ2FNeEJHeXBqOGZJ?=
 =?utf-8?B?VzdQK1BqZzc5WllUdkl5VktObzZoa2QvdktxOUlsdWZGSk0reGpDZjVGMkpW?=
 =?utf-8?B?TnY4REowWlVSUU5jL2lDNm5tWEZ6bk1KT2owelNwOWZCRS9UcE0rVElqaXlp?=
 =?utf-8?B?a0hEQUdoc3d0R3k3YlpORzVLbmtnL01zNkhVQ0k0VnNCbXIrRFdNVXVkY2RC?=
 =?utf-8?B?MTRweVZybnhwc01MQityQis1eGxteDJpODlwU1NxaUY3RVhOSnVQTjk3VzQr?=
 =?utf-8?B?NVFobDBzTlIxUW9FY2FoTDdhbXpWbWRURFNyWVBjOWhZYjFOZjFBT01wRW1Z?=
 =?utf-8?B?OE9HNjJtalRPK1JmSjR4Z01md0JhRFdxVk41RVJhN2JaZmU4WVVZV2hIVjN2?=
 =?utf-8?B?OVg2UWhWZnBPM2tHWDZGSTJZc1JsMVN5QmR3U0huS1BrcDY5YVBrVzAweGR6?=
 =?utf-8?B?TzBGRnkvN3dUZm9ybGhNZzdsVTNaYkFSdWVYZ1lOak0rQzJ2VFR4TUVHMzh3?=
 =?utf-8?B?Ykl2Ti9LelBQdUxWUTFXM2h5SithNkFwT3RzRjJVM0J4b2Z2RDVBQW9McTNK?=
 =?utf-8?B?RWFsanVSNUtzMlFZQTByYWhEYk1VME40VXBOT3lEOVd2alVlT01xN2RMYXh3?=
 =?utf-8?B?OFJFdDA0RUN0TkVyRzBpQURjWUVJaEpidUw4b2pkUUt1QXlMWng0WVJ6UGI1?=
 =?utf-8?B?OVpuTEV5Uy9YNUJtbjdaTENKZEVyWUdtZkVYNUNtNnJyRi9UWkFobmFOZW5i?=
 =?utf-8?B?NmViRnZpd3pZbnBDdW05dGFOR3dNMllDMUhHeS9BWDF4bmp4bUhLMG0zdmlB?=
 =?utf-8?B?dU1Ja0lOeTJBdzFvNk9SZmFCZlNOLzhQNXhweC9PKzBZcGpJdmpIaC9YcjZY?=
 =?utf-8?B?MC9EOTZ2aXZNUjY5cUlEeTI1cGFvMU13aWRkNkZHOHg2WGpyaTdVaHZ1UjNh?=
 =?utf-8?B?NU1KcW4rY2piM1ZJOFVlWDB0VWZpMklZQXpOYndWanJYeWNxTU9nckJEdWNU?=
 =?utf-8?B?MHpMZDZ4RHJsaG5UK3lyUHVtUHVtSjBXcmlZRVpSZDMwditXdEFFSkdNemJ0?=
 =?utf-8?B?U2tYaTZ0Sjl3WDRzakJwOStjOXVBRHhRQm41UzVZRlVaYzZFQTZ3NWR0bHor?=
 =?utf-8?B?ajI0UVJuYkNPMjNaM0I0am1sRmVZa2NFUHhTQmZIU3gvUStnblg2dlUrRjdk?=
 =?utf-8?B?aUx4eG8wNEEvY2U2cHdQTEwxU0piazZBWGxVM1ZGZ2VxaDZqKzhHTnZRSENS?=
 =?utf-8?B?aEVIeW5nV3hxNWZScVhtNS9oc3BsdkxubjVOUVNUZXhQRlR5V0hKYU02U1RR?=
 =?utf-8?B?UmtLSVg4OUQ3OXdwaXo2V0NuTGYvRzM2QllRbXRuclpGNCt3Qk1JUmJhT2NF?=
 =?utf-8?B?RVQ0UDN3UmEzNWU5NGM5dnBxQVIxbHBrTlAzRGMwTXduTUVjYTRCdXhIamk4?=
 =?utf-8?Q?87EkRQt9Lwatk5kgztkFMhi0C?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	oWxC+W49GOhi/8ueIBijnThYHEgsOu3tmr9MnuZQyHxWZGFxeS0uWQAwS45a8sku1SQu7ICHPondq+hC8Wzm3pkmLcReq6JJ8ZkIzRFMqVZj1zsJC7BZze8Zp7BEFWlnetwaw16Qzwi3FnCQ1phhIEv+Fdvrx7Ynd+AcaDiFWWsiHlRRxDaZhbAIdjkEYQf8tukb7Q47XGaR6BDdwl2XE513P8dY8JyD2Hb8zUhQcA4wA4LYRHZdMe60WJPAZ52xWcAZ9xL1I5pU7Nb9jHmYTirpRrdpPjehu6LLqFPJ6chbp4abKuzbhCMtx1JwJK4HlFy7GEJAD0Ajciy05tuoTRRxIOvcFWkQqHHff7g78ZS66AtqHKM2SUiKyPxwaGNeAtnuYhkSRmA7rWSl7MQdwclErFho9WYdYh/kjyZuyqk4MSd3w5f6/6lNGLWrI4LRxmy7pI/0NNBNKJEW52wG95N3o6lfwVm6n1ENe3XiWt+U9cpdWD+pK1h5W1nDFsjfIQKIWL/pnG5uUaOrxCffW7LJJXdo7Qs+bxoPwg7t6Rn91e4mCEGxiumetidec+ugAnYkPCKtjwyEXWY7xQrqUP73stZivcGDIc42VIN+PkoAprB3VgTpYtIaAIEDAwMo
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11590.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37eab9f7-5060-41a3-4e2c-08ddcb45edbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 06:38:55.8240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EdnSsz5REVJ9oWy8ACCNKRanuT27rtO9y6ofgQq8JfRyiaBOVo1xcaQ9XBk8iEVfSOTibYYL9b136igRBs2Z2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5624
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 06:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220897

DQoNCj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPiDlj5Hku7bkuro6IE1hdGhpZXUgRHVib2lz
LUJyaWFuZCA8bWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPg0KPiDlj5HpgIHml7bp
l7Q6IDIwMjXlubQ35pyIMjPml6UgMTc6MzcNCj4g5pS25Lu25Lq6OiBMaXUsIFlpZGluZy/liJgg
5LmZ5LiBIDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiDkuLvpopg6IFJlOiBbT0UtY29yZV0gW1BBVENIIDA3LzEy
XSBsdHA6IHVwZ3JhZGUgMjAyNTAxMzAgLT4gMjAyNTA1MzANCj4gDQo+IE9uIFdlZCBKdWwgMjMs
IDIwMjUgYXQgMzowNiBBTSBDRVNULCBZaWRpbmcgTGl1IChGdWppdHN1KSB2aWENCj4gbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBDaGFuZ2Vsb2c6DQo+ID4gaHR0cHM6Ly9naXRo
dWIuY29tL2xpbnV4LXRlc3QtcHJvamVjdC9sdHAvcmVsZWFzZXMvdGFnLzIwMjUwNTMwDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMaXUgWWlkaW5nIDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPg0K
PiA+IC0tLQ0KPiANCj4gSGksDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUuDQo+IA0KPiBJ
dCBsb29rcyBsaWtlIHRoaXMgaXMgZmFpbGluZyBvbiB0aGUgYXV0b2J1aWxkZXI6DQo+IA0KPiBX
QVJOSU5HOiBjb3JlLWltYWdlLXNhdG8tMS4wLXIwIGRvX3Rlc3RpbWFnZTogQ29weSByZXR1cm5l
ZCBub24temVybyBleGl0DQo+IHN0YXR1cyAxOg0KPiBzY3A6IC9vcHQvbHRwL3Jlc3VsdHMvaXBj
OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+IFdBUk5JTkc6IGNvcmUtaW1hZ2Utc2F0by0x
LjAtcjAgZG9fdGVzdGltYWdlOiBGaWxlIGNvdWxkIG5vdCBiZSBjb3BpZWQuDQo+IE91dHB1dDog
c2NwOiAvb3B0L2x0cC9yZXN1bHRzL2lwYzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSBUcmFj
ZWJhY2sgKG1vc3QNCj4gcmVjZW50IGNhbGwgbGFzdCk6DQo+ICAgRmlsZQ0KPiAiL3Nydi9wb2t5
YnVpbGQveW9jdG8td29ya2VyL3FlbXVhcm02NC1sdHAvYnVpbGQvbWV0YS9saWIvb2VxYS9jb3Jl
L2RlY29yDQo+IGF0b3IvX19pbml0X18ucHkiLCBsaW5lIDM1LCBpbiB3cmFwcGVkX2YNCj4gICAg
IHJldHVybiBmdW5jKCphcmdzLCAqKmt3YXJncykNCj4gICAgICAgICAgICBeXl5eXl5eXl5eXl5e
Xl5eXl5eXl4NCj4gICBGaWxlDQo+ICIvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvcWVtdWFy
bTY0LWx0cC9idWlsZC9tZXRhL2xpYi9vZXFhL3J1bnRpbWUvY2FzDQo+IGVzL2x0cC5weSIsIGxp
bmUgMTI1LCBpbiB0ZXN0X2x0cF9ncm91cHMNCj4gICAgIHNlbGYucnVubHRwKGx0cF9ncm91cCkN
Cj4gICBGaWxlDQo+ICIvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvcWVtdWFybTY0LWx0cC9i
dWlsZC9tZXRhL2xpYi9vZXFhL3J1bnRpbWUvY2FzDQo+IGVzL2x0cC5weSIsIGxpbmUgOTgsIGlu
IHJ1bmx0cA0KPiAgICAgcmVzdWx0cywgc2VjdGlvbnMgID0gcGFyc2VyLnBhcnNlKGRzdCkNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eDQo+ICAgRmlsZQ0KPiAi
L3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FlbXVhcm02NC1sdHAvYnVpbGQvbWV0YS9saWIv
b2VxYS91dGlscy9sb2dwYXINCj4gc2VyLnB5IiwgbGluZSAxMjksIGluIHBhcnNlDQo+ICAgICB3
aXRoIG9wZW4obG9nZmlsZSwgZXJyb3JzPSJyZXBsYWNlIikgYXMgZjoNCj4gICAgICAgICAgXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXg0KPiBGaWxlTm90Rm91bmRFcnJvcjogW0Vycm5v
IDJdIE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rvcnk6DQo+ICcvc3J2L3Bva3lidWlsZC95b2N0by13
b3JrZXIvcWVtdWFybTY0LWx0cC9idWlsZC9idWlsZC90bXAvd29yay9xZW11YXJtNg0KPiA0LXBv
a3ktbGludXgvY29yZS1pbWFnZS1zYXRvLzEuMC90ZXN0aW1hZ2UvbHRwX2xvZy4yMDI1MDcyMzA3
MTA0NC9pcGMnDQo+IC4uLg0KPiBSRVNVTFRTIC0gbHRwLkx0cFRlc3QudGVzdF9sdHBfZ3JvdXBz
OiBFUlJPUiAoMTk5OS42MHMpDQo+IA0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVj
dC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy85OC9idWlsZHMvMTk0Ng0KPiBodHRwczovL2F1dG9i
dWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy82My9idWlsZHMvMTkx
NQ0KPiANCj4gQ2FuIHlvdSBoYXZlIGEgbG9vayBhdCB0aGVzZSBmYWlsdXJlcyBwbGVhc2U/DQpI
aSANCkkgaGF2ZSBzZW50IGEgcGF0Y2ggdG8gZml4IHRoaXMgaXNzdWUNCg0KW09FLWNvcmVdIFtQ
QVRDSF0gb2VxYS9ydW50aW1lL2x0cDogRHJvcCBpcGMgdGhhdCBpcyBtb3ZlZCBpbnRvIHN5c2Nh
bGxzIGluIG5ldyB2ZXJzaW9uDQoNClRoYW5rDQpZaWRpbmcNCj4gDQo+IA0KPiAtLQ0KPiBNYXRo
aWV1IER1Ym9pcy1CcmlhbmQsIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBl
bmdpbmVlcmluZw0KPiBodHRwczovL2Jvb3RsaW4uY29tDQoNCg==

