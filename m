Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F4FACCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:43:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15581.1762155814153304482
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=l0LJb2K5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=340267741b=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A35lDvH288993
	for <openembedded-core@lists.openembedded.org>; Sun, 2 Nov 2025 23:43:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=H9hBmD6qjvk4WD7xYLyKCriN4FQGvF7RURWtSfnW120=; b=
	l0LJb2K5MPQQfG0DTktM+i6AAbCB5HGPlxfQ/52dKn7dS3Pfj8lNOUFIURKlSHya
	tT9ub8XOwuR0laAhnI+v9hGA7QRzhMCPfHffC9HbNlLgOaQmzJNUk9LYtXmXpT4c
	shkWoNXaI3InqxRXXPZVNMAeGcN83ZJqkU3XjZUSyYX5AOegoY/L4MUe/Ju9+KLE
	MbilPOOHyIbjzl/3yqv17C6zVODi2LHs8RcgT4AgaQ5/IP1v0Ry24scO8LstKdq2
	SJuxytunssfoTvnxDCHzQc86gkXuPWgPccMOdznQtMtkhQ9Vqf/SqysU/HQYxOIb
	TaJmBgxiJmsqnVkj3dZQmg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012006.outbound.protection.outlook.com [40.93.195.6])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a5hqeh840-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 02 Nov 2025 23:43:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZeL8MwEVSpN/cc/iNFrplc16M0cwv2YFwVQ1cFa3GXgtvTKqbh6QY5AN4dWjVkFOby9LvJ2t1+7MUScDabask5SvKAWY3+BZqOvGseYltRtP50SRz1qVV0te7RpqQzYS4VueeZPuts9YYFrDMaSZD2J+/bAWY47nNnkc5W+m1xiY0cgdZ5bAkbJ7aahKn6NKUCp+XRdD805DnOqOQODV5/pUOTQfIA6eV/ncj0cPyIu+dcZlx0EZCQpJA242hRCXYxoQvhEqfKDvPObSfvipvEkfdZ7e48u/kQ1SsFtmPfl5oIUyPi22bsPhJ8KssEbpOlWoa2t3/EHVZzvxzv+b6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9hBmD6qjvk4WD7xYLyKCriN4FQGvF7RURWtSfnW120=;
 b=HJtfADn82CI1aO/8XQgWQhLjhbTicp7oeWANGUgPkCAwfOOHfE1SvsWkrvY78WkSF4TqfBVO8iq/gnwlmp3oFDjS1kjKs4dBm/0rLlxiMMYWoGKDJv3EFT4/b5geql+0mLSe104nCh7uFK3KwXyEtglNFRFj+VJ1ce2w9ARUiHGV4UzN37gtM6R7Je+axmUlZxB7sPJ5ah8fYa/hv5SSj7Zgj+EWQYOoVeetXzTLvmBUyM+52lSj9rykJN5/Z6Vq4D3DoHyFqWXbeXDzDGHFuxyzdAi7rF28uv1+7qb2UIsnfBzokf99J0ccFQ2ItkvMYgXj02Zf0W31WeM2JlbU3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA4PR11MB9420.namprd11.prod.outlook.com (2603:10b6:208:563::13)
 by SJ2PR11MB8499.namprd11.prod.outlook.com (2603:10b6:a03:578::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:43:30 +0000
Received: from IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e]) by IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e%4]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 07:43:29 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        "Ross.Burton@arm.com"
	<Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH v2] icu: use automake ptest output format
Thread-Topic: [PATCH v2] icu: use automake ptest output format
Thread-Index: AQHcSoO1bbM+K9cQZk+vcoRtJTxzarTglZHQ
Date: Mon, 3 Nov 2025 07:43:29 +0000
Message-ID: 
 <IA4PR11MB9420BF2FC72D6065D38EE70AB8C7A@IA4PR11MB9420.namprd11.prod.outlook.com>
References: <20251031064504.461920-1-jiaying.song.cn@windriver.com>
 <CANNYZj89C_tuh8Gcd-PoicmPigwHpmvfqya+A=GdybH=t1rKHA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj89C_tuh8Gcd-PoicmPigwHpmvfqya+A=GdybH=t1rKHA@mail.gmail.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=093b7c70-7cf9-4952-9630-efa9e8c7afff;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-11-03T07:41:43Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9420:EE_|SJ2PR11MB8499:EE_
x-ms-office365-filtering-correlation-id: 1bee9023-ff77-43ad-b32a-08de1aacae21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MXZlU1dHZ0o4ait0cHRPcU9sUGFsci9ialR3SWZLMXpvb0RaUEVUS2ZES3Zv?=
 =?utf-8?B?U3ZyVFRIRjZXZDRyNHJIT0FKYWMwakJkYzVFQTd6ZXJSQnZyOUJUY21SeTBj?=
 =?utf-8?B?cWlvMTN3cEtSZ2gxUmpHV20rQU15NFkzOWtKVlBsbEI0RnYyaURoa2xYdWc2?=
 =?utf-8?B?SC9Ob0kxejRtMFV5Q0lvN3lqMUtxMUU0VWxNUnJKcTFqUko2bCtDWGdlT1dx?=
 =?utf-8?B?aGtWZzdzeVVsVitKU0J1Wmx3UGQwSVpIeXlJS1l4ZlcxZ3lRM2swSkpSblFK?=
 =?utf-8?B?eWNzekt4ZjJDOTRYQU5lNWl2UTkxN3JnZ3VLUnNMQUp1UmVodW83bWZGMXo2?=
 =?utf-8?B?N3JIcFBqaUZDNEJpQWtBYUdKOGF5NTlUVmVYWkd0UTU5dFVVQmREMS9nKzJj?=
 =?utf-8?B?bSt0M0hoUnI5Mmp2b3pBZ2Q3VFhmeWhOVGZib3VESWZaMHJTSW1YNUloMlhJ?=
 =?utf-8?B?WWRGRCttRjQ4Mnd1ZkxHanZCL21iUW82Yk5kN21peFFrZ3JQQk9lQnFqQ0Fl?=
 =?utf-8?B?bEY3UGxiL3hBYmZiclIvTkNYVkJJV0hPYkE1SldyYU5SNGFIcWJ2SUQrNkJv?=
 =?utf-8?B?MlRqNHFmdFVONE10eHdMQURDTi93N1JXMXJWdE42cndwOVN4TVIzN3RRbCth?=
 =?utf-8?B?M25YYWxwZ1BzTCt3OE1XU0tyaTdmT0lwY3lta3UzSVhHTzhzeXVXS3MwUXZ2?=
 =?utf-8?B?SEkvUjJpU0xiWU0ySWJkWURIeUlNc0xWdW1hYThZNjJuNzFIZW1TUjM0bjFp?=
 =?utf-8?B?UGc1NTQvUnFGcTR5a1VTbWZ5TmtQR2V1VjlycmtObS9QcDJTdzRVSlE0YTRH?=
 =?utf-8?B?LzlsQUdGMGx4MVdPMytBTzhFU1JDRFZ1eE52Z3Q2MjVKNStPc3JCOTRQOE5I?=
 =?utf-8?B?VThxd3Rad1lraEJBR2VhbURmWXBTc1FqUHMwSk9WaVpRM2crQzF6K2tya3Qv?=
 =?utf-8?B?VUtGa0QyNElNT0F5RUZIZlNkOUNHUHdzTHg1aVhGN24rSlpDWC9lRVZXQURV?=
 =?utf-8?B?cUh4Nk85N3ZmOFd5WDY3YjRDbFpEakluMDZXb1hNdVV5QjVXbms5bCtNZGxS?=
 =?utf-8?B?R2ExNTdobnE5RTVTeGRPajd0eSs4eWVvWkc0RTdjeHdTSzU3MGhLUUFFdU9m?=
 =?utf-8?B?KzdMblFkeVp4NEhwYXVLc25hR0lPbzBNU1k1cWp3YUl0WW1LVnptRmpBbFhi?=
 =?utf-8?B?RDZ0RS8yUXVpZ0FQcU1vQy91RzZ3Zzlpc2t3V2I2d1VzYXViSDRPMmhyTHdJ?=
 =?utf-8?B?elZPbUNLRTRKTWVVQnVDM1hJVk1rSGZ0ZENtKzQxRHNMY0E1eE9YRTBtNTR2?=
 =?utf-8?B?bitOKzFYQVk5dmF0MUJJN3BaS04zd0RVZmxSR1V3NmpzUndKRUVCOXMvWmdB?=
 =?utf-8?B?U2pFQmFHeHE5ZDBMeVJOMnRRSCtiNWErTDZMNkQ0UU5GcllQd0ZxdEZhNXNy?=
 =?utf-8?B?dFY2K21YMUZrM0ZOWldZRGFBZ3NuRTdBQ0V3M1Y0VlcvbjY4NmJtZWxpTFBh?=
 =?utf-8?B?eG9HT3ZXa3J4anhGcGl2b0xZUEprMlF6Tkp5NFZ6am9XMlh2WWhwSmVzNENI?=
 =?utf-8?B?ZUhycmdrRFQ3eHZOWk54MTFNdGdqME1KczVCRFRreVQ0TE1FekZZem1aZ0Qx?=
 =?utf-8?B?OHhMbkZiWkN1RnNyWm9tSU9CT1BDbmpZaFJPQ2ZoajNYaGhOM0lJUGowSCtS?=
 =?utf-8?B?cmUwdmZhdDJoZzVOQnkyZWlFcjF6ZktsRnk2Q2hVQWVmU0hvQ1FrUUl5dVZy?=
 =?utf-8?B?V3hUaktOUCtON2ZLV2xTSGovVEM2RjZQaktkeS9JbEFLaWtFQmNwRDllUm96?=
 =?utf-8?B?U1lQQkpFa2tTWHdIaXc4VDI1ZncwMmFnMjdPOXBNUzhpUU9MVnFsVUtMT0JC?=
 =?utf-8?B?U0VldzhBcHNUUGxWb052ZkpMekVMdzFSVUl2bjJJTkluR0RYUkFrblFmWHl5?=
 =?utf-8?B?SEdTSWF4cmhPY0xBU29XQjF0RnhRUWdtTWRSU1l6SXV3ckFoL3Z2bmhnZU5V?=
 =?utf-8?B?b1pLTldKanhadnpmVndhT0JCOHU5K2tTR2ZoQTgzcmowOUF5ZUViMjM5SUlY?=
 =?utf-8?Q?q+mm7A?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR11MB9420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aHlWV1dBZktoOWhUM1g5dE1xemplMEpKYW1lMU9FTFJ3dzJzVnFpLzR0MStK?=
 =?utf-8?B?R3JKWjIrcGYvaG5xcXNTZE5QVEYrbTNsUWxqNXV6VEZUUzZObDlFdkV1MnBG?=
 =?utf-8?B?WHRGQ0g5T1lRQ1VKRVZSV3FnVEUyTlZGelZwdlgwRkNqby9FUWk2anBEYlNz?=
 =?utf-8?B?UHNRRS9wS2dYdzhEYWRsdDBReGZObEpDek9kNHpHNXZnYWdIMTAwelhKNThp?=
 =?utf-8?B?TWt5ZFZabzloMkdydTZPWERFTXBpUTh6UlVCcUVsSm4zNG1mendhNWZ6ZHVj?=
 =?utf-8?B?Tm9RcFZJTDRtekpMM1dBQ2oyZzI5a2lZbklJR2FYWGFGZmVJVXlEbkVZeGVm?=
 =?utf-8?B?eVhGRm1mbU9ncWNPSmY0U1NOQUh0WTE4ZXZOV0xCNEplQ1NuWFFYVDlBSEhl?=
 =?utf-8?B?V09LamtrRDNGdGFlSHZnQ25nclVtc3Q5dEJ3aGtWdjlRVmw3U1E4ZmllQ3Nm?=
 =?utf-8?B?T2VTbGlxNC9sM1dyMk8zenNSMzFYN3g3elI0bWFCUmVzY00vS1kxb1pVY0or?=
 =?utf-8?B?UnZCUXg3bWFWSFZNUXFnOVVmc3o2T1h2d1hlZHZpMVV2K1gyRVFmUnhJbFcy?=
 =?utf-8?B?dkpxUTI5ajhxOGs5Q0t3YmFXNGpZMXplTEdTbHhQS0dlVndiSWRTbUdLajBB?=
 =?utf-8?B?azRvWkZLN0JOQk8ycllQemZLNUpnOGx4bHBJV2NFS0JmR3V4SVdBTlgraGN0?=
 =?utf-8?B?TFhmV2hpWVU2dmQ4bUtaZlY3MEJjdUc4dTFjYXAzOTYxY3R3TXBhanNBSG9s?=
 =?utf-8?B?M2pwZUtaa1VseE4yMVgrM3piNityaUVWTlVvSnU1Ujh3VFNyVktsaC8xbVBL?=
 =?utf-8?B?TGc1WUtrdnpmbmgrUE8zRDFuWS8xMzgzd1cxRUNsczI3TDJsTUFpN05MYWY2?=
 =?utf-8?B?TTFtUmJ6b0Zvb0ZnNmJyNjI5OWtERFBMNTJ0RlBWTG5USFlzTmxteGtCOFZF?=
 =?utf-8?B?cDZJZ25tUXJVMGpWOCtzWmtFcFU3cFZuTmV3QzlraERLdms1MGdiSlNQeDlR?=
 =?utf-8?B?UDRuRC84NkNTcFFBZWNaalIwUmFLb0NxSGdyMWsxS1Q5Wmc2dnlHajdTMjZs?=
 =?utf-8?B?M1YxT1ZLdzVlZFV4U3VZK2FOVXJBWmx4WmlDZFU1V3ViVG1jME03aGhVM0dh?=
 =?utf-8?B?cEUrZEJZOExDc3hzQWhMOXhSWW8wMHd5MXc0YmlCYWNMZ2MzTmFHaW02NjNP?=
 =?utf-8?B?RDBhS3JCd2FHSkxid201bGhiTGpWNTFib3JRNHkzd3BmN0sxcmlVWi9FeFd5?=
 =?utf-8?B?S3JrbDN4dmFva1llaTZzaUNUa1kvZVdVclNtY3d3Q0l2QjBzdStVTUxkZGlR?=
 =?utf-8?B?TzRMcStYY0k5OFRZTmpDbUswWW5vdXQ1K3F0NU9lNG8xbEkxMVk2cmlkVmNp?=
 =?utf-8?B?MUM1Y2IxbWNuQ3paYWRkS2psZ2xHVTB0czNLejduREY2bmd0a3gyVnRQMnpo?=
 =?utf-8?B?ZnJ2dmhUOGRVc2V0bGM1djMzaTZvNEN0bkR5YUgyL3cyeDlsS2ZwWmJ4cXk2?=
 =?utf-8?B?Y0FSQ2Y4cXY5cVprcEQ2dFpZZHlUMnFZc1RIVXordUlKSnBTQUVob1YzOHBs?=
 =?utf-8?B?WklDQlJ5UlJLWUZ3RE02dEYrNjEyZy9oZDBLK2lyc0FCcThTVnphQUxVK3hH?=
 =?utf-8?B?Sm1VVytKY28yL1A5M21mTFovUW0vYnZEc21TZThyK29QTjhBdGp6ZXJzSVA1?=
 =?utf-8?B?WmJVUStIUnVldW1FSUlyR1NtdC94Vmd2UU5jenBVTkF0QTRWalZFZmlJQ2cv?=
 =?utf-8?B?eFNweEZaUmsrcFhVeHN5SENwRmZTcDhSTiswNWtsdUx6Vk5EZFUvdXdYYXVI?=
 =?utf-8?B?bjBCVXMrWmJlQmRHZXFJM2RSK2hEZmduMDN3eEhlTWFKUDF1YmhnQzcvNGhj?=
 =?utf-8?B?di84Sk4zTUswRnZjVThXWWpGWXM3Q2NHcks5TkIwRHE0bU0zbFFQT3NaS3F2?=
 =?utf-8?B?TnBWOVpjMW5GZDEvcDN1VHBWODhqQ0VUSE91dy9IWi82L0dKaFc1N054K3Qv?=
 =?utf-8?B?VXlDQzNhZXpPcGREa2o0anhMTU1QeUlBdk9yTS94MURSVkcyMmd6SXpmdVJS?=
 =?utf-8?B?MlR3bWFNdGxZejZZV2QrWUUyRkkrTUJtSnd0dDJjSmJLOUN0UTFaaWI3WXIv?=
 =?utf-8?B?TktjYTg5ZUwxa2lvdWlxWTV5cUJlcjlKa0FwSUttZWo0bXg3TW14cmxqaXBL?=
 =?utf-8?B?NkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bee9023-ff77-43ad-b32a-08de1aacae21
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 07:43:29.1222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l6Yjh97dt9GfUSAPa3kjX6dYP7fzHURBjJwEio5LSBMgCUsQJf5CCKRKRtEgGhTMU5n+k83oO/GGX1pX9Kd59OU306/em7Vj1KyA8Xv0UD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8499
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=HJPO14tv c=1 sm=1 tr=0 ts=69085d25 cx=c_pps
 a=NVT6GquIkcOJbfF4gP4t1A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: 6FdF0CilHGrVOkSmZbLz4V6lMaSYY2sO
X-Proofpoint-ORIG-GUID: TX2XycK5EfnMffqDKblpP20xkJXSZsu7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA3MSBTYWx0ZWRfX35eMIoJ5isa7
 XvDAZrTDO9DZ4Jxnv/FdolMUpDncS+xxqaOe1LqmxyMdCL881q06K+3IBvhgaX1Cs19+kj1L7ba
 zEhiLxXbIZulHBfq2HlMmnl/USrWIQRBcxdbcBLYKUcn1RFQnUKe+g6effh1GxPY3yeRZ3yEemh
 UZ1tnhtXbSnZnUIp7YGCv12tUcbUmusivI698OwNh7WgNlPuLWJPxDiCtZE8GwgvgcaNEuYuGhG
 hvKLxY90NYY9z0/u7AJUJBSueUu/FBX+dyd0f/43zSz1SsvBEP3irVEKQIYqlIN9EAVRTsLik6P
 Aac9GYxv6IiBDS27vJnJpyTwDToFeegRLlYFD0z12pkW+QkXNmPdgZwc3yqTNm07oN2Tb4LFXX6
 DZ1x3wS7mDJE+0PmqVJ6YH99GzoWtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225610

SGkgQWxleCwgUm9zcywNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQpJ4oCZdmUgc2VudCB2
MyB0byBhZGRyZXNzIHlvdXIgY29tbWVudHMuDQoNCkJlc3QgcmVnYXJkcywNCkppYXlpbmcNCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPiANClNlbnQ6IFNhdHVyZGF5LCBOb3ZlbWJlciAxLCAyMDI1IDEy
OjMwIEFNDQpUbzogU29uZywgSmlheWluZyAoQ04pIDxKaWF5aW5nLlNvbmcuQ05Ad2luZHJpdmVy
LmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJq
ZWN0OiBSZTogW1BBVENIIHYyXSBpY3U6IHVzZSBhdXRvbWFrZSBwdGVzdCBvdXRwdXQgZm9ybWF0
DQoNCkNBVVRJT046IFRoaXMgZW1haWwgY29tZXMgZnJvbSBhIG5vbiBXaW5kIFJpdmVyIGVtYWls
IGFjY291bnQhDQpEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQoN
Ck9uIEZyaSwgMzEgT2N0IDIwMjUgYXQgMDc6NDUsIDxqaWF5aW5nLnNvbmcuY25Ad2luZHJpdmVy
LmNvbT4gd3JvdGU6DQo+ICstIEFkanVzdCBpbmRlbnRhdGlvbiBhbmQgdGltaW5nIG91dHB1dCBm
b3JtYXR0aW5nDQoNClRoaXMgbmVlZHMgdG8gYmUgc2VwYXJhdGVseSBqdXN0aWZpZWQuIERvIHdl
IHJlYWxseSBuZWVkIHRob3NlIGV4dHJhIHR3ZWFrcywgb3IgY2FuIHRoZSBwYXRjaCBiZSBsaW1p
dGVkIHRvIGp1c3QgYWRkaW5nIFBBU1MgYW5kIEZBSUwgcHJpbnRzPyBBcmUgdGhvc2UgZXh0cmEg
dHdlYWtzIHN1aXRhYmxlIGZvciB1cHN0cmVhbSBzdWJtaXNzaW9uPw0KDQpOb3RlIHRoYXQgdGhl
IGxvbmdlciB0aGUgcGF0Y2gsIHRoZSBoaWdoZXIgdGhlIGxpa2VsaWhvb2QgdGhhdCBpdCB3aWxs
IGZhaWwgdG8gcmViYXNlIG9uIHZlcnNpb24gdXBkYXRlcywgYW5kIHJlcXVpcmUgdGVkaW91cyBt
YW51YWwgcmV3b3JrIGFnYWluc3QgdXBzdHJlYW0gY2hhbmdlcy4gUGF0Y2hlcyB0aGF0IHN0YXkg
aW4gb2UtY29yZSBmb3JldmVyIHNob3VsZCBiZSBhcyBzaG9ydCBhcyBwb3NzaWJsZS4NCg0KQWxl
eA0K

