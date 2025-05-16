Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F028C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 09:23:24 +0000 (UTC)
Received: from esa20.fujitsucc.c3s2.iphmx.com (esa20.fujitsucc.c3s2.iphmx.com [216.71.158.65])
 by mx.groups.io with SMTP id smtpd.web10.9264.1747387400142771027
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 02:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=zK1zSi8B;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.65, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1747387401; x=1778923401;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Jr7b2vnhxV297K+M29+hc9wAoOQLlX+NX2vreXa8/2Y=;
  b=zK1zSi8BuSP6cKS5X/jwEmpAEFNqke9DtVPuSeFe4eXhNE4xotw+rKBk
   HQY+la1CV7ZUNT2DHTOSiD/QIGo6lwz3sUenOSqgihh3Bj4lYiZoLlawh
   RiymvalVRyS/Ut9Yk4Iakjk2FLYXgwqOBYOHIduNF0NsgOJphNOE1qe1Y
   uTrZOyu7g+1Id7R1HN5969c5o91ZLBl/Kh52ZQnS9u4v/gnp8NKe7MhMa
   JcDyOK66ZDjDk/mWwIfR7KvlqhMSYa+6O3Cfpvpk/9rA4or5ddLghn8Cm
   lECZQgd/2+rpLVP12WOQba5OsHw8TWk86JbLcN+mbwCYoBlYeDrgqCk02
   A==;
X-CSE-ConnectionGUID: 3uMwmrnXSqqtZuao+p9hRg==
X-CSE-MsgGUID: LBCdZZPvQSmj4k8A2+W5YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="155553736"
X-IronPort-AV: E=Sophos;i="6.15,293,1739804400"; 
   d="scan'208";a="155553736"
Received: from mail-japaneastazlp17011024.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.24])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 18:23:18 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+FSFXEj4asXzxULpUapG8EVsiL2uxhklpt9Dqd5+aKib73s1jR6A/gTFOUEj35uYgUcmASUz/tTpK+KUZzwIzjfoTREAGFG67UfKqPiruQkAN1an5ePtOnGtLyOurM5x57hT3LdDS4JK4Yk8umGUeJujhU8Splycd2mVO+n31/VjtBaBahV5+KF0pWyg2G2KcuSioft5VmkD1cB9++jopO/hLtAocYOXJmr1PTzOpxHtysZe2hzJysTJS+P67ocreD9qsgv/jtjoeiv31/61kmsWU3YMDYkVzRmLWnQgM/ddI54yD8x3Y1kWcyeCvmI3aq23/C38Zz4MNws2tqTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jr7b2vnhxV297K+M29+hc9wAoOQLlX+NX2vreXa8/2Y=;
 b=Fclocwf93pV0yyeSZQIZb9eP9u3XtVwh4V/ciuaIYruPiZPxkvjgo9wuEBn12JivZwtdnz5cF9E8qHq8E6Sm8qwfN4W5N2KVRgG/05JVTfPT9UUA6+hF4MZSDKYjApbFGGNlTkRyHOATSZGXR54m74wNDAupo4Xots6x5ZiLt3mPbGzaXECyLKkVvPbSUE9/xKwyHLtVHM8R6/oGH81NXOCsbjcz2rOmqFFnjKJgXVVe8xzv1SKvjRyYaC7AelFKPYclKLvK1t7NE0dr3aspMC11OgxBptW+9A+GzoqlpvhvasLOvplWYCi6uXVBePEzi/HJzBNe+UdfHkBULfprpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::12) by TYYPR01MB16312.jpnprd01.prod.outlook.com
 (2603:1096:405:2de::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 09:23:14 +0000
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014]) by OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014%5]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 09:23:13 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] libunwind: fix multilib conflict
Thread-Topic: [OE-core] [PATCH] libunwind: fix multilib conflict
Thread-Index: AQHbxUcxFU6Gnr0O3Uee9TdPHRpjH7PTqbaAgADxBAA=
Date: Fri, 16 May 2025 09:23:13 +0000
Message-ID: 
 <OSRPR01MB11597C144F01163CDF8E1E24D9B93A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
References: <20250515031214.924-1-liuyd.fnst@fujitsu.com>
 <CANNYZj_eu1vXmNaq1ehRJDM8VonWNmU=e+jBa4LerDnEWT7Yxw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_eu1vXmNaq1ehRJDM8VonWNmU=e+jBa4LerDnEWT7Yxw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9MDRlZTU0NTgtMDhiYS00ZjI5LThjMTEtOWU2MjBjMzAx?=
 =?utf-8?B?YmY0O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA1LTE2VDAzOjI4OjU1WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSRPR01MB11597:EE_|TYYPR01MB16312:EE_
x-ms-office365-filtering-correlation-id: 2fe8ea01-1892-40c5-54fd-08dd945b48b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TG5tekJJSG9MZFJrUjJ5Q2dNZkJJVmNncjdHK0ZaNG9tdDhacFpxWWJkZitx?=
 =?utf-8?B?NDg2aDNuQUFZaExZNkdNblB5QVpscXJETkpob2NMN1J5UU85d0h3VG02aCty?=
 =?utf-8?B?ZnUzU2hKS0xlNGZrNXlwYWtpSXVPM1dHSU9HaURYM3JCZDRoNzN1UDFHUkND?=
 =?utf-8?B?YU1Rczg2Q2tQSmVKTzdUYW92UVQ3VmdwUnRnTWY4L2QxMDZzZ3Qvc3NZd3J1?=
 =?utf-8?B?TDlWRmllY3ZrOWdNWkpoTjFHT0c0aGkraWRpZWpBeGtpMzVUTFpDZWZWZlN0?=
 =?utf-8?B?aGtMYU9DaGM2T0YxWUw2MlNKNFJib2NtbG1MU1FSdUU5SHRTeGNVZnRxYnVI?=
 =?utf-8?B?UkU2Rmt3VGR2Y1BpTXd4NnRncFZXVll2QU9vMmh3T0FqRGJPMk8rY0ZmVU1R?=
 =?utf-8?B?ZXRudHg3cC9iVDNXUjVBaXgzL3VZZXdzUFVoR1FJMlR4a2hzTEpKWi93Smt4?=
 =?utf-8?B?eEFyazRPSlRNK1pqdW1RbGtCbktOajM1Y1BqSGppOElrSmhhQWZaZTBZU1lN?=
 =?utf-8?B?anpRb0pPSno5SVZUMWNEMTUyUDZYRUd0TDVOVFRsMWhmNjNVK25GOERQNm1w?=
 =?utf-8?B?TklGdWVSZjNFR09mUzBPT1FvWE5hYmVaS05VQXl2QU1KLzVsTEtBNXZsUUFQ?=
 =?utf-8?B?SnlTZHp4dGpUSXhNaC9zT1dvNmdybXZTSEdqY2ZQeFJnVmMrZWNjR2YwMEQ3?=
 =?utf-8?B?VWV5Wi9vanRtZGZsM0RDSWcrYzlqeGNySUc5VjZna2hnMG9HdDlqbmV5SGxT?=
 =?utf-8?B?dmJEWGxlZllCN3RrMVpFWHc4eHRKUGlSc3Y2L0dHWGhRNHhscEZJeXUvblNm?=
 =?utf-8?B?YVpPelBBeFR0b0NlQ294UGY2alhLRTNFUkhHblAxazcxaDdxU2xMWDVneUQy?=
 =?utf-8?B?MEJldVpDK0xuamlFQnNub0JTL3dxT3c0VnFmNWd6bW94RnlUdHN0cG9lWWJk?=
 =?utf-8?B?WHhHRk9STzNwa3YxKzVLUzVXVm1Fa3dWWEZRTWlNYytCeGFlREw2UGlHbTl0?=
 =?utf-8?B?NG4zM1JnSmc0YVZaek9Md2VrY2V2MEE1MmQ1a0Jrb1JXUDVzcy9iK1dYRm1E?=
 =?utf-8?B?WVl0RmpRUzkyeHhtaWNhUjdpUGl6ZTZKb0dLMU5wdUVzTGNEN3VJd1hYTE1V?=
 =?utf-8?B?UUlGOUIxNEZDMm5Vdng0R2ZHTk5aUjJTT2VXbXFXdlhDa0ozZ1NHNEU5QVVI?=
 =?utf-8?B?eHVUYTNzTytaYS8wWWhQSWFSNnhxYkRXMi9FZXkwZlhpR1lFTlM4bTBqeDVO?=
 =?utf-8?B?Wm1xQ3g4RldrSVBmaStmdC9XVnRuRURrTEdyUjk0R1Y1Q1gvZHB0OThSdS9E?=
 =?utf-8?B?NnNDUDFVbjJGUmkzbk95VU5MMVVMWXY4MjQwcE1jZEZpQmNoUFN5aWp2VndW?=
 =?utf-8?B?L016bmYxM0FNSU9SbTVFMXVmNXE1ZTQvcS9SdFd6eDl2QW1lM3ZkaGJQZWE5?=
 =?utf-8?B?ZDJSd3F6TXdEYStSV0xsRmR6YUxHbDRwaUk0YkQwQ3N5V3VWUVJIVk9JdVRr?=
 =?utf-8?B?RmpPUk1LNEpXL25BZDBSMEd2M3BoL09tRlY3cjNzc3dhVTFRdzFWd1Uvbno1?=
 =?utf-8?B?MnRYWnFldTNheldINE1Ed2lMK3ZaNkt3L05IVjZybUFvYW1GZzFlb0R2WUhw?=
 =?utf-8?B?TGd1N3JoMFE2L011S2VCdFN5WFdiSlNaQVpKd3VORDE5NGo3S0FnR2gwLytN?=
 =?utf-8?B?ZTRlczBhblp3d3V4VXcxSW1iNWF6ZmtPTUh3SHdJWWVHcGZ1YlljcTlHanBy?=
 =?utf-8?B?Vnd6aEI4QUFOQ0FRc2ozOGlGMExwRllGd2xJTWlJNUJaQ2xneTlhZDJHbXJ6?=
 =?utf-8?B?eS93LzdzQytBcVdxKzBVeG96REYxYWNnOUJ3WXNlZWpRVlIvZ1FGR3pLckhK?=
 =?utf-8?B?OE1WL1BsTElVR1hmMktSclhWSnhLMmhCS08yNFRQbjgraFJFbTJ4TnJWOTg4?=
 =?utf-8?B?cE9OL0hIaUovTUQxWlFxT21UOU4wWTV2TU1TVlkvaVlqaklWWXNjSTlYT1RX?=
 =?utf-8?B?MzQwSHM4VW8rdHk1VDFycE14Lzc4MHE5M3lmRHltbHh1YzhsQUdkS2lrc2da?=
 =?utf-8?Q?vyYlq1?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11597.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TmRENXNQc2RsQm1BVlI4Nm4zZGNFbUZ0VWJHOWpleGxOSkE2RlVCNytsbHVF?=
 =?utf-8?B?L1FWU05tTkUrNkx2L1ZnWndwUURRVGhvOHI5T2lwYmhXVFZxS2pXWlFvSE5V?=
 =?utf-8?B?eEJYZWxPYTBvSjA2a0ZZMm1mY2h2aVJyYTBpRG9XRTdLVVl2ZUowS0pQVS9P?=
 =?utf-8?B?NmM0S204ZHhzMGEwZ0F2MmNjQ1RFOEQ3MjFZSHFFZzJYbzkrQkJSOE85Q2xw?=
 =?utf-8?B?QmxLU2F2U21RZHEvSERRY2ZKb2phM3VnblZ6c1NXUjRQQVlLdjNwcXNVK2tU?=
 =?utf-8?B?Y2p4Rk9IL2VtV3VSMVEyb0xRKzdycngwUFh0bStaaGdiUHhweC9DZDh3YTd5?=
 =?utf-8?B?SEg1THJORmFFVXJTTThpanFVMitOUUtFWFpDYitaM0poMXdRaEdYeHd4SHF0?=
 =?utf-8?B?VDNZRjRtU0lDQVhiRVhTdUxqMVc2SnhadFU4TlZlSUpZdkVoQ09JNHhjYjZ0?=
 =?utf-8?B?SnhZdVdCVndmNnBaeE9RUDBDdHRiR1JIZmljOVVyaGtaOUN6VFpkVEZQK0lJ?=
 =?utf-8?B?VGxORjFGQjZDVWxWK00zWS9UOW5DZ1JjNTNOUXB2UktYTG4zWXFQaDJsSDZq?=
 =?utf-8?B?WGZtZEZVVVlNUC93NVNCb2g3VzJRYUxHdUxDOXhENVRvM1BXVXBOKzZCTFBC?=
 =?utf-8?B?SUVvMC95Z1FiTXRDZWRPS1hpbGE5eDRwZzc0T1N5VmliRTBRNUtaYjhkMnlR?=
 =?utf-8?B?aTJHWkhld2hEZE1QUzM2VjZwMkJvZkI4d0lHZk50WWhlUm1ZOE43TjA3SWtm?=
 =?utf-8?B?NXFxdStCQUJMcWlxUW0vU2hDMjN5dkRiRXdQampwci9qNDRULy9XRzBZSlR6?=
 =?utf-8?B?V3NXZURGOXZXM0JkK0VMUjdSQlIxVEhoWFg1YldoZFg5RE5wS3FJSUxmU1Fo?=
 =?utf-8?B?TTZzN0x2SWh0S25qa1VHTSt4MFJ4dGk0UlU2OE9wZmI5V21rOVh4ZXh4RGt4?=
 =?utf-8?B?bFcwR3dhV2piZEtibXE4bGZrWkZzZmQ2Y1NaRmZGbm5LR0REeVN3WXpkTE5m?=
 =?utf-8?B?MFg5L1BLTEU2RWZ0NjNMNVdxTW1xRlljbHJOMGdPdHdja3hDSDJtSXBySCt1?=
 =?utf-8?B?QnZjUG5uZDNNa3B2WUtXRWZFa1JaMDFkb1dVeEFpbS9SbnNTNSsvZ1NwQmw5?=
 =?utf-8?B?dHNya0tOUG5kR29nQ2ViSFVudGYwelRTNll4blRlQmkrZjBkQzlHN1VRL3Jj?=
 =?utf-8?B?eWF1akllamljRDBBV2tSeGVoWDNOV3ZuWGxnZlAxQjhYUmU1QmRORXVZelNE?=
 =?utf-8?B?b0ZmZDV6RmdYWWkyUDVxTVI3WnRRTVpEdzZ3S3Z2Wm9oMitHQlZwQ3pCOXBu?=
 =?utf-8?B?TVpsdkNuOW9KeEZFcWs3cFRkRjh5cDl4cFkrUWF6SFA3eW1TeGdTYldwNHph?=
 =?utf-8?B?Z00rS0g3RVorQTF5WnFGWW5BMUVGbGJNYm41RDE3L2wrcHBrSUZwb1RCYzk1?=
 =?utf-8?B?U1lUTlNwbEtXcGlHRzYrSjlRWXFyQmtUN0tvSXZMTXJiTEFkaEU3Yk5hencz?=
 =?utf-8?B?aHdWaVB4d3R1TEFqT1lxckhXNXdFemltWlJqTDZJdTB2SDR6eW9FdkVJNnBI?=
 =?utf-8?B?RUpNZ1g1TndoY1hWTnJMMlc3RDZNOStTaVlXbUtzNjg1Mkg3bHEwdWZtOXAw?=
 =?utf-8?B?OVBjblZ3dlhGTVJTYnA2ckpGdHo5dzRBNTZVNTBoT2wrYkhjMWM1ajh6b1Nx?=
 =?utf-8?B?ai9DbXNaSzJQSHRQN1ZHWTU3VjhLcmxsRjYvYytITzJQTm1rVGI2SWxHQVdS?=
 =?utf-8?B?RVpHMEh5TmgwZlZMdHA2QldQV0hOR3dNUFd5dWZ1bDZhdnc2OWxwcjNTNGhu?=
 =?utf-8?B?UFI4dGtRL1VGQ0tod2RjU2tzNmE5UC9TWjZoOEUrdzNVMzM1a0FidXRLOUtT?=
 =?utf-8?B?SDBNelhTaFZESHRURzNXKzFvb2hHRXhXZ29nRlpmMFZOVkxiQ2QxN1ZzV2JF?=
 =?utf-8?B?bDd5R1F4K2JwQlJsUTkxWDViT3lZaTNKRkJ4bDBML2VpTlBiUzJ1M3RyYzlN?=
 =?utf-8?B?N3pGek9ZaFpiWnFnTTJ1a1VmOG9jMU9selIwUnY0MlM5elpmTm11cTRMbFZk?=
 =?utf-8?B?YnV6QWtudjFiUGhFcGllanVYNkt5NlBEOFRVTjRJMlVQSWhIZHBhay9ieERs?=
 =?utf-8?Q?ZoFEykJm3BJ0xNHc/q/outKzS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	v6IZJYuqAJTtCLopS1IiddKU+xWcPtMtTe+UD/JNjYBsTw75zKSscKhtWsJHg7FqR1JqbvP2xBwiBWxcd9GE/t4ogw9zI4dLRLBfCdaK31JLyjF1OAYjcTz98Z3JBBVd61EpG3v4eBBYZQwMhUbfd8l0FapB4WxwiOhFLcXugzOxjdpunl0bY3EbD2P+6SucDY4VAJpxrG5DuyLFO3pD8QV7elgYQ5R9ZxR+WlB0oxK/1ytOQTVUi55zODUdYszuyzk5GI+J/W2y2tF/H969B1rOA03UszmY2DFi/Oy5iYw3di0p3WczXFgXo+FdMXaNv2j+vaUW0pt+cEeRIoEKn60Dzt6IF056oQHObdUqvtoccrmyLtPKpOd7kAQNjEOyV5Vg3iOuIIGqug+AxXpIum3/HSLinrFAjv+3fh/4M+SLhe7p/7HUSezqeW5Kz6O08JBtIbVSwfhzeoE+aPxOIKF0jy34X9gHnrxZ1vwkk1gPTWq9mNnnOx7sd65GCpJu6//gQxM1F4/Zlsur8Y9Il3HVgRlUQenc81pfZNg/vVbj9M0kPR2FRVbhUOG7O6gse2LguaVzDKsqXkpP/po+SW26px2FuJ72qaTq+F9MR7N017LoNk2SVUw5GTV5H5uC
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe8ea01-1892-40c5-54fd-08dd945b48b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 09:23:13.9221
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rnsc36ZVIbHXT4dazg3rqJ/sIhpzQgVk7C9ColabNUV0sMN9S8/HDgz+Nziv4M3qhrtGBjtquXbA1uSgpwZSbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16312
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 09:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216728

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IDIwMjXlubQ15pyIMTXml6UgMjE6
MDYNCj4gVG86IExpdSwgWWlkaW5nL+WImCDkuZnkuIEgPGxpdXlkLmZuc3RAZnVqaXRzdS5jb20+
DQo+IENjOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwuY29tPjsNCj4gb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09F
LWNvcmVdIFtQQVRDSF0gbGlidW53aW5kOiBmaXggbXVsdGlsaWIgY29uZmxpY3QNCj4gDQo+IE9u
IFRodSwgMTUgTWF5IDIwMjUgYXQgMDU6MTIsIFlpZGluZyBMaXUgKEZ1aml0c3UpIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxsaXV5ZC5mbnN0PWZ1aml0c3UuY29tQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+DQo+IHdyb3RlOg0KPiA+IGZpeCBpc3N1ZSB0aGF0DQo+ID4gfCBFcnJvcjog
VHJhbnNhY3Rpb24gdGVzdCBlcnJvcjoNCj4gPiB8ICAgZmlsZSAvdXNyL2xpYmV4ZWMvbGlidW53
aW5kL2NoZWNrLW5hbWVzcGFjZS5zaCBjb25mbGljdHMgYmV0d2Vlbg0KPiBhdHRlbXB0ZWQgaW5z
dGFsbHMgb2YgbGlidW53aW5kLTEuOC4xLXIwLmNvcmUyXzY0IGFuZA0KPiBsaWIzMi1saWJ1bndp
bmQtMS44LjEtcjAuY29yZTJfMzINCj4gPiB8ICAgZmlsZSAvdXNyL2xpYmV4ZWMvbGlidW53aW5k
L3Rlc3QtcnVubmVyIGNvbmZsaWN0cyBiZXR3ZWVuDQo+ID4gfCBhdHRlbXB0ZWQgaW5zdGFsbHMg
b2YgbGlidW53aW5kLTEuOC4xLXIwLmNvcmUyXzY0IGFuZA0KPiA+IHwgbGliMzItbGlidW53aW5k
LTEuOC4xLXIwLmNvcmUyXzMyDQo+ID4NCj4gPiBQYXNzICR7bGliZGlyfSB0byBjb25maWd1cmUg
b3B0aW9uIC0tbGliZXhlY2RpciBvZiBsaWJ1bndpbmQgdGhhdCBpdCBpbnN0YWxscw0KPiA+ICAg
ICBwbHVnaW4gbGlicmFyaWVzIHRvIC91c3IvbGlieyw2NH0gcmF0aGVyIHRoYW4gL3Vzci9saWJl
eGVjLw0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTGl1IFlpZGluZyA8bGl1eWQuZm5zdEBmdWpp
dHN1LmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidW53aW5kL2xp
YnVud2luZF8xLjguMS5iYiB8IDIgKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlidW53aW5kL2xpYnVud2luZF8xLjguMS5iYg0KPiA+IGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlidW53aW5kL2xpYnVud2luZF8xLjguMS5iYg0KPiA+IGluZGV4IDY4ZDdhOThlZTQu
LjFkY2EzOWUxYjcgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidW53
aW5kL2xpYnVud2luZF8xLjguMS5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YnVud2luZC9saWJ1bndpbmRfMS44LjEuYmINCj4gPiBAQCAtMjgsNyArMjgsNyBAQCBQQUNLQUdF
Q09ORklHW2x6bWFdID0NCj4gIi0tZW5hYmxlLW1pbmlkZWJ1Z2luZm8sLS1kaXNhYmxlLW1pbmlk
ZWJ1Z2luZm8seHoiDQo+ID4gIFBBQ0tBR0VDT05GSUdbemxpYl0gPSAiLS1lbmFibGUtemxpYmRl
YnVnaW5mbywtLWRpc2FibGUtemxpYmRlYnVnaW5mbyx6bGliIg0KPiA+ICBQQUNLQUdFQ09ORklH
W2xhdGV4ZG9jc10gPSAiLS1lbmFibGUtZG9jdW1lbnRhdGlvbiwNCj4gLS1kaXNhYmxlLWRvY3Vt
ZW50YXRpb24sIGxhdGV4Mm1hbi1uYXRpdmUiDQo+ID4NCj4gPiAtRVhUUkFfT0VDT05GID0gIi0t
ZW5hYmxlLXN0YXRpYyINCj4gPiArRVhUUkFfT0VDT05GID0gIi0tZW5hYmxlLXN0YXRpYyAtLWxp
YmV4ZWNkaXI9JHtsaWJkaXJ9Ig0KPiANCj4gVGhpcyBkb2VzIG5vdCBsb29rIGxpa2UgYSBjb3Jy
ZWN0IGZpeC4gSGVscGVyIGV4ZWN1dGFibGVzIHNob3VsZCBub3QgZ28gdG8gbGliZGlyLA0KPiB0
aGV5IHNob3VsZCBpbmRlZWQgcmVtYWluIGluIGxpYmV4ZWNkaXIuDQo+IA0KPiBXaGVuIG11bHRp
bGliIGlzc3VlcyBoYXBwZW4sIHRoZXJlJ3MgYW4gdW5mb3J0dW5hdGUgdGVuZGVuY3kgdG8gbm90
IGxvb2sgaW50bw0KPiB3aGF0IHRoZSBkaWZmZXJlbmNlcyBhY3R1YWxseSBhcmUsIGFuZCB3aGVy
ZSB0aGV5IG9yaWdpbmF0ZS4NCj4gUGxlYXNlIGRvIHNvIGZpcnN0LCBhbmQgdGhlbiB3ZSdsbCB3
b3JrIHRvd2FyZHMgYSBmaXguDQoNClllcywgeW91IGFyZSByaWdodC4gRmlsZXMgdW5kZXIgL3Vz
ci9saWJleGVjIG9mIGxpYnVud2luZCBhcmUgYWxsIGhlbHBlciB0b29scy4gVGhleSBzaG91bGQN
CnJlbWFpbiBpbiAvdXNyL2xpYmV4ZWMuDQoNClRoZW4gaG93IGFib3V0IGZpeCBpdCB3aXRoIE1V
TFRJTElCX1NDUklQVFMsIEkgaGF2ZSBzZW5kIGEgVjIgcGF0Y2guIFBsZWFzZSByZXZpZXcgYWdh
aW4uDQo+IA0KPiBBbGV4DQo=

