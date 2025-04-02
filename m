Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74131C36018
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 02:04:41 +0000 (UTC)
Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com [68.232.159.87])
 by mx.groups.io with SMTP id smtpd.web11.4046.1743559473732275678
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 19:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=zM2F3Pe2;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.87, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1743559474; x=1775095474;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QYpOz9a/NxNi48G2zUmta7Bf/aO8dTrnD9QmIuHQeJA=;
  b=zM2F3Pe2OHmVODnl/sLhcaesvy10tqWRYoYPR6zdm1634lQrU4Xyl7W5
   MfuBpqpESU7Q22g6efO4l1AAI9NEIK3PAQPuEMvgS9M6IGdA56IDcUp0h
   xm84zdbGlVxCTygLr50xjEPHsIEI60nIRjV+c8/5MhL8EebmVjuFIoZcr
   oaIRzkewBqDBgyABSbulBZ8mX3FJwv6qo8yUWOp4i6VCBQQqLonV0aM3x
   DjcsX4SCA6ukhWdzP3HFdFtu33WEIZfdhOdwT4u1dSSxx2eXpkMe6q3D9
   HFIhxleQYFgoWue1534uBnFSeKraxGxfR5xMDQYIJT6xSxpmVoNqG/ZQT
   w==;
X-CSE-ConnectionGUID: 0mqLd34tTrKVuhA4sCz4zw==
X-CSE-MsgGUID: UbViIvfyT9+V7kqweANs1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="151473473"
X-IronPort-AV: E=Sophos;i="6.14,294,1736780400"; 
   d="scan'208";a="151473473"
Received: from mail-japaneastazlp17011027.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.27])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 11:04:30 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E4r2egYc1u3cDsyXoGX5n6OdqPn+qH3HTMZHdpKaNIoYNCyvIDmtkmylBwvS7+6MzKdCAtNcpikskppqiTNmtYQGL6FrPC4WfAhsWm5bEBurkdoQidb+be0wm/Rdy6VZ8e9OQDzSjzBB3hoJZ5BGaUvkR/p9Hvjo/MB9AcDfQBFnZkk6gzc1l2Em+/rOnR5x2/RjsE49gU0Qem8utXwa5nqM3MaQtgeNb5H4KSL20fFmqkuRYbdprKtVAvab++yugLxSe/dLsZsGlxoJ/AJE8ZQ974mhQQonUHci5UFCge7jH9us2NIKNFnqkXrLP3uKPSpt7rAIzRs9L6o0y87pPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYpOz9a/NxNi48G2zUmta7Bf/aO8dTrnD9QmIuHQeJA=;
 b=Mq/lZPVvy9BoP9H3xjS/pbNnut9yDLjMM9Gs5WabNBhStYdkvlWPC5QFsWtnZGoXU4RTB2sPLtqhyi55QiAi6cvxWUwccBuwBTqZJYH0FJt7lhTRAvEdesOwTsDcAahU+zgTWfBCM/QiAbQqmQrBt7e8j6AHmbh/GRYfnm5zaxYF8MxqJ78YlFfCwQ2EkLp33zbvfRnax9lTeUlUA2Sw23ve66q+T3q9HknDdnL3OzJTrlpSk62UEOF0sxh+pvnq4luuyRCj6Q6XlD0m+jIpiBB4/OakvX/mFNQLUSMCnDNGf5moMKmYRbEJBmKg/TNaXa+1pXl/BhQgp6OAlNdOJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by OS3PR01MB8665.jpnprd01.prod.outlook.com
 (2603:1096:604:19d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.37; Wed, 2 Apr
 2025 02:04:22 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc%3]) with mapi id 15.20.8583.033; Wed, 2 Apr 2025
 02:04:21 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Richard Purdie <rpurdie@rpsys.net>, "mathieu.dubois-briand@bootlin.com"
	<mathieu.dubois-briand@bootlin.com>, Jose Quaresma <quaresma.jose@gmail.com>
CC: Anuj Mittal <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [Patch v3 01/10] gst-devtools: upgrade 1.24.12 ->
 1.26.0
Thread-Topic: [OE-core] [Patch v3 01/10] gst-devtools: upgrade 1.24.12 ->
 1.26.0
Thread-Index: AQHbogkGJxz1EXBtJEyQiTQWqmrGHLOM/biAgAABbYCAAaaMAIAA8v3Q
Date: Wed, 2 Apr 2025 02:04:20 +0000
Message-ID: 
 <TY3PR01MB110560D5F9B9C65316DC067FFA0AF2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <20250331064844.2155-1-leimaohui@fujitsu.com>
	 <D8UCORYIOR2I.1Q2YNS35P7HHS@bootlin.com>
	 <D8UCSOK7M0KD.2FXD6KPWVXD95@bootlin.com>
 <9bb20616338ddfa915a7e2457858198fa4bdf6fc.camel@rpsys.net>
In-Reply-To: <9bb20616338ddfa915a7e2457858198fa4bdf6fc.camel@rpsys.net>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9ZDQyZTY2MzUtODE5Ni00ZGFmLTgxMGEtMzQ0ZmQyNjNm?=
 =?utf-8?B?NDhlO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA0LTAyVDAxOjI3OjIyWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|OS3PR01MB8665:EE_
x-ms-office365-filtering-correlation-id: 6dbdd1b7-1b51-4613-9004-08dd718aaed9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?QlQyREhyTEZQNjVMekJrb04vY1NqaHUvaWpyemZQNHlXZDRudENHdi9kTnJC?=
 =?utf-8?B?ZXM4VWgrbXVZekx2NGhURSsvL095NmxocHVBZ0M0YTVWVHA4c0U4RmtqcEZo?=
 =?utf-8?B?S01ORFh0YmZ3V2tNWWtHZTMrWm9GR2tWcDFsNEJFdDJKWUt6bXBJaFZmQVBU?=
 =?utf-8?B?eElPKzNncXpoVnJIRGZPQ3FjaWR6dFNEMzNmbzhQNkZCcmk2SWtKZlZ2UDFE?=
 =?utf-8?B?RUJiazNQZC84SEM2ODBDTFpLajdmelVCTWxFOXgwWk9iblNSd2FMMzlUZUJ6?=
 =?utf-8?B?cmtTRE5XaU4xaFAyYkNzR0g0Z08vUWdLTnNCUk9oRWxmYkdOdUFRYmFydHNM?=
 =?utf-8?B?c3U2SzhMSmZ6aFF5MnZGTENVMVNkN1lFdUFTOCtteGEzK0ZLTWVPRzVsam1l?=
 =?utf-8?B?Y25YM29RRTVKcXVtLzlUMmw5RWVleGhWUkMrek95L0F3allMczZvaU5Remt0?=
 =?utf-8?B?dU9vb3QxYTlLRXVsMVJlWWZoV0hoeUtDQ0pUOVFpTzVkVzcwZlUwZ0VZbzlR?=
 =?utf-8?B?Q2tEOXI5eGpQeWtWZGlOdjVhVzd5UnZpcWxoWFFRd1hmZjZMTnlYVnU1MHBa?=
 =?utf-8?B?QmxVY1ZzM2NFcFFmaml2d21OKzJoR2t0SlhPUEtyZkRiNlpuL1ZiSHlsRHV5?=
 =?utf-8?B?TDFuZ0xuWlltMi8vVmk3QzdSR1NKWVVHbjNUMDdFNEhJQzY2U2VraTZJQS9q?=
 =?utf-8?B?dUx0YXFPb0JKYkxkMjRjdmYzeFBNTkoveFRvYUJKOEo1bFg4UzU0OFdtK0Q2?=
 =?utf-8?B?YXJHSHZET1Q1VUw4WUhyc0p5dkg3THp4TFBoVEdaOU5LdzhKa3BQU2lUSjl6?=
 =?utf-8?B?UXIycyt2MmdDVWtkc0xFaUhvQXJWVVo0YU85a0NoODhKS1RoRW5XN2N1b25L?=
 =?utf-8?B?cCt5dTdFTy9jZE0vSFVGanR0MkowUTZySjRDZGRWTWhnQzA5NC9KT21jTzZu?=
 =?utf-8?B?Q21LVmxpYjV5UG4xYnNaSlNnbFpIN3dBWlZPUWl4alRvU0JuY1N5KzREUTRI?=
 =?utf-8?B?WTJSdlpDY2pnNTcxQ3JqL1lTUXk4aUk3aG12YndCL2YyNUtsRjY2ODlsNklJ?=
 =?utf-8?B?c2tkdHpTcituS2gyT1BVTWxHUURZV3lYV3lnMlR1NmR1Qmo0TUVhRGhIRWcz?=
 =?utf-8?B?RWxvS0V6V1hEUzlVeGZuMkdMRE8wSGJPbUp1RE5SempCYk91VHZ5RXFSd2pS?=
 =?utf-8?B?bndxdWdHZ0tBTVdabXNxTklNVWo0UHdhVFNWV1grYTdIYVdVT3N5SERuRFFG?=
 =?utf-8?B?NHBRVTh6VkRKcEVJeG9Rc0FaakZRVmlFKzlHLzlXRmJpcER1bEZSY01YZ2xB?=
 =?utf-8?B?SmxNeEg1MVpDQTlpUHQwUXdaSkozak9EQkdyZUhMTTEvVDFoVUQ5c0dpRit0?=
 =?utf-8?B?K0tYWTI1dmRveW01cGxlUTlNK1crRFN2Tjh1RnJ4enpzQ2ZLRlJOeEFnVjNV?=
 =?utf-8?B?aXVacUE3N1lNSzlWckRsU05xRkdoU1hYY0ZDNFYwamY0R2VWYittdUtqeTlx?=
 =?utf-8?B?Q1BCM1EwYlpPQmord2VRZjZ5MEpUcXJTQmV3WTY0OXVRVFY0eFVUN3k0bXli?=
 =?utf-8?B?djlBVnFIRUN0bWJlNS9TMmpUcnpqZEpOeERtTUQxMGxuTzhIb0FneWFnSVgw?=
 =?utf-8?B?eFMyZ2pVZWliTk5jajlCUGVmc2FrZDVkaGxwdFBuMWYycmpPeVdpWjJnTHFj?=
 =?utf-8?B?d0lydnpzeXdVcWFvL1Q5Sm1pVlBsK2kyWHBueFpqalVSQmQ1djdoWGgwNm5w?=
 =?utf-8?B?czFCL0wwYklteE9XazNSSldLNGh0UjFPalhubU1OVWoxenZlTmp2OE1VeUo4?=
 =?utf-8?B?RCt4K3kxVjBNYktqb2h5SENHTDJRMlVpNUwwSWkxb1JyaG55aTNUdmd0V09h?=
 =?utf-8?B?bDcwMlU3YU9MdHFzR1k3bjU1dTNmQWJxems3SktYbWJFM21Seis2WEVFZGlV?=
 =?utf-8?Q?G8MBbOwBGns=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UTh0WDdFKytta2M5VHFnK0E1VXZBWEFDTFFTMWZ5OVdrV05MVXRicklxUVlO?=
 =?utf-8?B?TUZ4Y1NrdS8wanJobEVidzd3NjRrZmpyR3FBRXYwdHFxREp3N29IanJzWFVi?=
 =?utf-8?B?a01qUTRXTzNtSGhnc2hjUnhXQ1ZwWUtWSS9UT0RKZlY2eUZqM2NOMmhNa2ZC?=
 =?utf-8?B?TmtnSzBGVi84VUZQOC9LVGQ3ZzA4NzRIeWRFQktGSTNGWG8vT1NXVktlejlB?=
 =?utf-8?B?OG8zeDhmWGhBTmQyWVltN3pvN1BSRHlTVmdVZjVkV2dmOFlNSkx6TjdiR1BH?=
 =?utf-8?B?blZmem92VU5NSE1vNUpLS1NhOVFnaXRtb2lSU3BzdS9XaEQxRGFCRFpJYUth?=
 =?utf-8?B?Z3RQWmhBWWxlK0g5NW8xQUFGWG0wR0dRdUNFQk1NWGZnYVlkTC9laFJDaHpT?=
 =?utf-8?B?dmJLQnRLOWljbmU2bzFjLzJzQWd5ajM5YUhKVnZ1ZFdmQUFwWGx4S0pmNHdn?=
 =?utf-8?B?K2pUTGxmZ21EQ2hBd21PYVlwSFA3TUx6WWxVbkUrN0RTOUFpRUpZQzhnVExU?=
 =?utf-8?B?aU14ZEptSHdxT0FFODMrQ083azd6K3lrY1BLc01kUGNzb1grNlczL01XR1Jl?=
 =?utf-8?B?amdlUkovZGs2VjBXWHpHNTdYekExLysxYVhmcm1PeDVSOVJFT1VickxmeGF0?=
 =?utf-8?B?QzZOZ2U2VjhTOTZOU1ZmakRIdnJMVmNNODlHOEtqTnY5bm9LalhLTlRHNVpX?=
 =?utf-8?B?Z3d5ZGwrY0RvTnlPMjFsclQ1RStuMG1kQTlxRjh3K3pDMVNnMEs2UktJTUhl?=
 =?utf-8?B?c3BocWlSS2F3bVhLVzR1OWgzZ1JNaDhteHQ1Snl4dFJ2T09qNGNpcDV2OHJT?=
 =?utf-8?B?OFFLaUNzdSswbURiQ0EraURjZEdZTjNBY3g0TCtsV1cwU0NnS0JHTEM1NWE4?=
 =?utf-8?B?cFdqNzlnYkdIWDBPRnVCN0JXNjNCRHhmN1Q0M1RBalVqNFhCRWU1a1hpSjNE?=
 =?utf-8?B?Sm50UFZ0cXlONDlHV0V6NTV3QmduVnFvYU1uTTRlYStQSEhUdWhvVTZ0S29u?=
 =?utf-8?B?T083cE5idURhb2UvWjEyNm9yYkJkYnRIMXhvbUlSR0JBNEJ1elMvS1ZBaEVw?=
 =?utf-8?B?djhJUFczendnajlHVWJQaGc4OWNsSXN2a1g5eS9WUmRRTmJHWlg4WXZyUUVp?=
 =?utf-8?B?dTd2b2p0MTljaXFoUFZ2cVBoeC9kM0VzY20rMjJ1RjZ2U0FIdm9sMDJDRnJZ?=
 =?utf-8?B?L1JhNllzbDVwNmZDc0hUVWpiclg2dGhSandsUldoby9MSTJpdGFuMUhMTWVI?=
 =?utf-8?B?SGJXaXptNkg4WkttaWlYZld1ckJoK3d6T2owZnd1UHBEYWowUUtkK0llZHVv?=
 =?utf-8?B?K3h5WUF6NlZRZWFkRG1nNWtaVzNNVWE5QVE2Wk5heFVCQUwrdTFMbTYwMnpE?=
 =?utf-8?B?ZE5JRVhZcUpRMjlyMGVBV2tYSnAva3dxSk4xSFl6ZFgvOTFrWWphRnJXWnFH?=
 =?utf-8?B?R1BIdkxWVCt2SXdSWHllZEhsMHpmUSticG1tUENxSXBoVkVzc0k1Qys1dE1s?=
 =?utf-8?B?SURUOStIcjNzdUMzZmlRQ3J6SFdZcUV0R092SVNUUHlRUVp0U1VVQS81cFZp?=
 =?utf-8?B?U1BMQXZjbG1qb1pXeVg4cEJlMzVYaDZ5SGpRYUhTMmtQUGNubUZYT2pvc2kx?=
 =?utf-8?B?SE9mQndPWHFHcmJuenhJcjZldjRnTHNUb3NmYnNkMjhZZFNQNldFNEQrNWlV?=
 =?utf-8?B?ZXQzN010K2dVZkdFK3hITXFYY2xYMXN1blZzZC82Z25JTGxqY2Z1dUthOC9M?=
 =?utf-8?B?TWFVRE5QRW5WOEhEMzRNV1FjNU9Bc0FybHVWcTBIZm9xSXdRNjVUNndkaitk?=
 =?utf-8?B?aEJYQWc4WnJZQVFVa1gxQ04rVmZFQ3l0Wm9oREkxQkkzcjBraDQzbU5RQlYv?=
 =?utf-8?B?b2l1Y3FuMWFPMHVUNUpva282b1Z3aUYweG9LZTJDanZJaHdGdmhzcjNDZS85?=
 =?utf-8?B?dG9heStoZ09VS0JtZC9nR04vZktLdnVWMkNFcVljNUV6alFicmpiNUVQWW8r?=
 =?utf-8?B?QW14dmF2cXdQME5Velp0d0FIWHdmSmYzQ2pNMFhmeSsrNVNXdzB4VWYyekQx?=
 =?utf-8?B?U1ZGbGNKaDdqdGJPMlJUZy9KV0huVjErdExONVRmOElOaGhYcU5yQU1zeDJK?=
 =?utf-8?Q?8L91ffDcj5DmD/+uhYHOO92Aa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	5kDIdWVuVfZqMOQqcep5Xs1DIJMe8POA9imfKHkaop6vBkYP/dstp1xuEnV5gvJeF1B4OcmPzUsX6vEoCv5Gt0EwKAkcMUJdSJaXUPp59bEDUSxhCBJcyyS8UxDtegTSRKnkF61oKd2JuE7Ub6TZNTtS9qxLpdLYsgFqqNhH926bI8fH/REJOG6+Q8ABC+K3k2Z4oaYpOoC/B8DTVJYDXRJHXpdYvi8yE5NdAuYe+b8uHKTfYUiADh0aVElmQIk4GZCkr27fEgBQ4yVAOXgRDSbNlor1J84lE67cePZALixZ02TyrlWf+VAH8YESjhev/VOjdMBbnvuVlHsIR6/qd7/dURGUtdiSq3lB/kOgEOSq/g0yM8yOHvnbS8ZwVEo4kCBd5l9LXo3Uj7nZVeUnZatwyttTA4BUjed7Qc9BGwb+tbPIVJEv6ORoIAUQUSAX0EY1SnhfJdpY9frgHoHVUNPfjipaGt52uHzkaiGWBDFIgjgyk/u5RrqPkam5wXlkGUOzcbkNBZvj65xmYe0exXJIndvOmcPdr4lSIVbNP5epR20ZwIsZ3PfX0ZORYybcwcdctPMf7Lu8uw/4ojYUK35ojVPXb+om9SYGDuyme6I8mZNhAGXLOlq2DsRZSdER
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dbdd1b7-1b51-4613-9004-08dd718aaed9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 02:04:20.8885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A9a2eCt8y4Cq0qo1kIwo71dnN/LNBCSTdlx0KXL8rbz+z2f144SC7N84nbdNycUP1yXQTVcBPNMHb1VOOUvPPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8665
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 02:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214165

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJwdXJkaWVAcnBzeXMubmV0Pg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAxLCAyMDI1IDY6NTgg
UE0NCj4gVG86IG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbTsgTGVpLCBNYW9odWkv
6Zu3IOiMguaFpw0KPiA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPjsgSm9zZSBRdWFyZXNtYSA8cXVh
cmVzbWEuam9zZUBnbWFpbC5jb20+DQo+IENjOiBBbnVqIE1pdHRhbCA8YW51ai5taXR0YWxAaW50
ZWwuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBT
dWJqZWN0OiBSZTogW09FLWNvcmVdIFtQYXRjaCB2MyAwMS8xMF0gZ3N0LWRldnRvb2xzOiB1cGdy
YWRlIDEuMjQuMTIgLT4gMS4yNi4wDQo+IA0KPiBPbiBNb24sIDIwMjUtMDMtMzEgYXQgMTE6NDUg
KzAyMDAsIE1hdGhpZXUgRHVib2lzLUJyaWFuZCB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyB3cm90ZToNCj4gPiBPbiBNb24gTWFyIDMxLCAyMDI1IGF0IDExOjQwIEFNIENFU1QsIE1hdGhp
ZXUgRHVib2lzLUJyaWFuZCB3cm90ZToNCj4gPiA+IE9uIE1vbiBNYXIgMzEsIDIwMjUgYXQgODo0
OCBBTSBDRVNULCBsZWltYW9odWkgdmlhDQo+ID4gPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdy
b3RlOg0KPiA+ID4gPiBEaXNhYmxlIG5ldyBtZXNvbiBvcHRpb24gZG90c192aWV3ZXINCj4gPiA+
ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3Uu
Y29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+DQo+ID4gPiBIaSBMZWksDQo+ID4gPg0KPiA+ID4gVGhh
bmtzIGZvciB5b3VyIHBhdGNoLg0KPiA+ID4NCj4gPiA+IEl0IGxvb2tzIGxpa2Ugd2UgZ2V0IHNv
bWUgbmV3IHB0ZXN0IGlzc3VlcyBvbiBnc3RyZWFtZXIgd2hlbg0KPiA+ID4gYnVpbGRpbmcgb24g
dGhlIGF1dG9idWlsZGVyOg0KPiA+ID4NCj4gPiA+IEZhaWxlZCBwdGVzdHM6DQo+ID4gPiB7J2dz
dHJlYW1lcjEuMCc6IFsnZ3N0cmVhbWVyL2VsZW1lbnRzX3F1ZXVlLnRlc3QnXX0NCj4gPiA+DQo+
ID4gPiBNb3JlIGRldGFpbHMgYWJvdXQgdGhlIHB0ZXN0cyBmYWlsdXJlcyBjYW4gYmUgc2VlbiBo
ZXJlOg0KPiA+ID4NCj4gPiA+IGh0dHBzOi8vdmFsa3lyaWUueW9jdG8uaW8vcHViL25vbi1yZWxl
YXNlLzIwMjUwMzMxLTUyL3Rlc3RyZXN1bHRzL3FlDQo+ID4gPiBtdXg4Ni02NC1wdGVzdC9jb3Jl
LWltYWdlLXB0ZXN0LWdzdHJlYW1lcjEuMC8NCj4gPiA+DQo+ID4gPiBDYW4geW91IGhhdmUgYSBs
b29rIGF0IHRoZXNlIGZhaWx1cmVzIHBsZWFzZT8NCj4gPg0KPiA+IEl0IGFsc28gbG9va3MgbGlr
ZSB3ZSBnZXQgYSBidWlsZGluZyBlcnJvciwgSSdtIG5vdCBzdXJlIHdoeSBpdCBvbmx5DQo+ID4g
aGFwcGVucyBvbiBzb21lIHBsYXRmb3JtczoNCj4gPg0KPiA+IEVSUk9SOiBnc3RyZWFtZXIxLjAt
MS4yNi4wLXIwIGRvX2NvbXBpbGU6IEV4ZWN1dGlvbiBvZg0KPiA+ICcvc3J2L3Bva3lidWlsZC95
b2N0by13b3JrZXIvcWVtdWFybXY1L2J1aWxkL2J1aWxkL3RtcC93b3JrL2FybXY1ZS0NCj4gPiBw
b2t5LWxpbnV4LWdudWVhYmkvZ3N0cmVhbWVyMS4wLzEuMjYuMC90ZW1wL3J1bi5kb19jb21waWxl
Ljk5ODk2Jw0KPiA+IGZhaWxlZCB3aXRoIGV4aXQgY29kZSAxDQo+ID4gLi4uDQo+ID4gPg0KPiAv
c3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvcWVtdWFybXY1L2J1aWxkL2J1aWxkL3RtcC93b3Jr
L2FybXY1ZS1wb2t5DQo+IC1saW51eC1nbnVlYWJpL2dzdHJlYW1lcjEuMC8xLjI2LjAvcmVjaXBl
LXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vYXJtLXBva3ktbGkNCj4gbnV4LWdudWVhYmkvLi4vLi4v
bGliZXhlYy9hcm0tcG9reS1saW51eC1nbnVlYWJpL2djYy9hcm0tcG9reS1saW51eC1nbnVlYWJp
DQo+IC8xNC4yLjAvbGQ6IGdzdC9saWJnc3RyZWFtZXItMS4wLnNvLjAuMjYwMC4wLnAvZ3N0YnVm
ZmVyLmMubzogaW4gZnVuY3Rpb24NCj4gYGdzdF9hdG9taWNfaW50NjRfaW5jJzoNCj4gPiA+IC91
c3Ivc3JjL2RlYnVnL2dzdHJlYW1lcjEuMC8xLjI2LjAvZ3N0L2dzdGJ1ZmZlci5jOjE4MDooLnRl
eHQrMHgzOGMNCj4gPiA+IDgpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2F0b21pY19mZXRj
aF9hZGRfOCcNCj4gPiA+IGNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJuZWQgMSBleGl0IHN0YXR1
cw0KPiA+DQo+ID4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmll
LyMvYnVpbGRlcnMvODAvYnVpbGRzLzEyMQ0KPiA+IDYNCj4gPg0KPiANCj4gVGhpcyBhbHNvIHBh
c3NlZCBpbiBteSB0ZXN0aW5nIHNvIEknbSBhIGJpdCB3b3JyaWVkIGFib3V0IHRoaXMuIFdlJ2xs
IGxpa2VseSBub3cNCj4gaGF2ZSB2YWxpZCBzc3RhdGUsIGp1c3QgdG8gY29tcGxpY2F0ZSB0aGlz
Lg0KDQpJIG5vdGljZWQgdGhpcyBpc3N1ZSByZXByb2R1Y2VkIGFnYWluIGluIGJ1aWxkDQpodHRw
czovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy84MC9i
dWlsZHMvMTIyNA0KDQpTaW5jZSBJIGRvbid0IGtub3cgaG93IHRvIHJlcHJvZHVjZSB0aGlzIGlz
c3VlLCBhbnkgc3VnZ2VzdGlvbnMgbm93Pw0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJk
DQo=

