Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D73C54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 06:51:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.45483.1748328686555085887
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 23:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7242e5e264=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R5lmYZ026289
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 06:51:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u5392b92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 06:51:25 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54R6pPbn027307;
	Tue, 27 May 2025 06:51:25 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2088.outbound.protection.outlook.com [40.107.95.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u5392b91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 06:51:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbYxjkF+IOTYpKz679EScFNonkR0VHT1lnIlaVxZOiD6OzvEgqQeCuYRRyj++GlYA4FJCLadn/JmcGr075+julAotq5koGo9XMZEuE+LtxwDpknes6gX5gGrLxW626L3hH6TDz55/ONi2cJIfbyGsmHRfGuNR7VJiOGY9EZ10mlBILnBemebLEnaxmgKQfP2imMj91sOjnsbrIU6PqrX9GbQp5RvYf2NGoavn8tu6oN/BiI7oRWEx6VdrSfR1iUKaQaPe4057mF1EltjQSZjN7aIaR/wzpQ2lEInWegAvex4H7XhUOhvgWf4/33i9GnwJ/0yJoPNEXVadg+XUYAfDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wizpLTS1gopZGFVZevu8f7RmZTkv3eHpVHxBIIxu8bE=;
 b=tTgSmEcuxihbsof2NvTzqBKTC/MuxCuyVPE2ywqbgrtSdNksQql/Hr5eEFUidgEFIUt7aMlNF+DlWULDBvxLk/G40w2hEFyVexm+XpPtu2p2Xw0//AiGzrtorLfj74UkLyPQcbI838Bu/263uzejFjKM1iIdqtcpFNgA4wJPyGe3BBNZb6YrJ47Ewcdzz9EF2S5oR4PouqlSq9ovqNy1j0An4XhIipVvi6/k9dTK1LGnHA6738yXTd2/iEGOjvG+DqyBA/h+gXRywsqbwn9sW04tOAJQmZbJZs26MEvpXn70AZ/TPsniZpkwNIFYSCsJYugBMlUKyoYTYuDMrXBKag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ2PR11MB8346.namprd11.prod.outlook.com (2603:10b6:a03:536::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 06:51:21 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 06:51:21 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH V2] util-linux/util-linux-libuuid: upgrade from
 2.40.4 to 2.41
Thread-Topic: [OE-core][PATCH V2] util-linux/util-linux-libuuid: upgrade from
 2.40.4 to 2.41
Thread-Index: AQHbzhd+2IddkNWoxkW2Q7H5+oFL6bPk1u2AgAE0HdA=
Date: Tue, 27 May 2025 06:51:21 +0000
Message-ID: 
 <CO6PR11MB560210D5550F6777919D582FED64A@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20250526082320.1176072-1-Qi.Chen@windriver.com>
 <DA63BFOBJH3N.1RPV4KZ1VUCP2@bootlin.com>
In-Reply-To: <DA63BFOBJH3N.1RPV4KZ1VUCP2@bootlin.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SJ2PR11MB8346:EE_
x-ms-office365-filtering-correlation-id: 3108a03a-e499-41e0-01f2-08dd9ceae390
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NGdJOGwzU2kyYkZnL0QyUHFBSlNZcm1zRTdIK091bE1VVjQ2M1dkVkVTSWU3?=
 =?utf-8?B?bE5GL0JRdjdHV0JjQXVncUNHR05CbmpycDYzS3VlY3V0TWVTazA5YnBZaTBu?=
 =?utf-8?B?RkUrNlRsajIrdSs0ck8zbWRXZElqL1hVUzZOdlR5aEY5ZS9ZcjkxbUtRc1Bh?=
 =?utf-8?B?cmUxcFEyR3hnM0hrdWI5azlYc085T1JXRWEvT3Jld3lBWG9Bc1JUazAyelk2?=
 =?utf-8?B?c3lhRTBxaVR1eWVoR3ZlOGVCR3IzMDVTOVAzSFNiSFlRSVFLdzVMaXdFT0Z5?=
 =?utf-8?B?dUpGZDRsTXp6RHdYa1JTdktsNkJZRllWOTNrd2o0R3RSYjNjeUlZcWpVT3l3?=
 =?utf-8?B?em9wS3BhY25yQUdSTnhBczRYeklWSXVXVGNFdzQ5bXhOdFRiaDBiR3BHNTRh?=
 =?utf-8?B?UW9ZUmtiNEdTSytsV0c0amt4OWlGNlhrNXkxVnN4cytpKzBSTWxmVzRHUmNG?=
 =?utf-8?B?VjgwQmdsZmZ6bGtXYUNOdjdLTkFhRlZUU0JrSURTbWRWTUtXVUU1R3V3cHJo?=
 =?utf-8?B?UE5DYThGUjk5K3h2aDdueUVXSDVlcmpKUzBUeFIvelJMa2w1K2Q2Qi93WnRR?=
 =?utf-8?B?UXc0ZTZGc3hId2NYY2RoT1hGRTFrcmpxbDhQejU1ZCtndWUxNzNoa1VFTUZB?=
 =?utf-8?B?bHpvTFNyUllRVWdmeFc4UHAyY0NtNEMrWTRFZW9KakJqcS9CSXBBYmRRd09O?=
 =?utf-8?B?SnZhZWdwYXl1K1lmSXppRmR6amRsd1d6dVc1cWtDWXZhUjE0MWsyTmNTcGhx?=
 =?utf-8?B?eGRIY3UrODM0c0JiS1pFdEFlbUVjWTkrWVlvc0NkR1U1ZVlRSG9WQTI0VWx4?=
 =?utf-8?B?YVZoenhXL2Z0dDBkNzIwbUhpM0thMmlWTGFxRWc4RDEzWHlqYUxTVmlXckpt?=
 =?utf-8?B?L2szSkNQdlNnYjlQK2ZYTjRYV2o3YjdrN3VwcWUxN0FiNTRuWmM1ZkxCQVJT?=
 =?utf-8?B?VUNWQ1dBeFROOGtlNmZpbVM3elA3N01XZUJSM2RJL1VvckVVeG5Xc1M1TTlV?=
 =?utf-8?B?eUtEQkoxVkR3Zk9LZndNUUV3OU5hRUxWNW45cksrdmFDTC9ubWtadk5Wa01s?=
 =?utf-8?B?QWZpK01rbHZkV0tDK0pIbW9kRHJvN1lsTTB6QjJzYnNyaVY4YU5oTVdQTWs5?=
 =?utf-8?B?ZW1NTklUTFM3Z240NDc5L0c4V29hTnJTcnhnZzBSVlYwOERoWWFHS2NONXF6?=
 =?utf-8?B?Z3UzR25aeVl4MjQzMjVNajZWNk0raW9CNEdSN1YzaUkyZERGQkNzZnhGVFBt?=
 =?utf-8?B?ZHdIOCtrNzdybUFpVldrMzZ0eXUveEl5eEFuM3crd1VhOHgwaEs3WmRlSFly?=
 =?utf-8?B?V1hrSFBMeW1mS09yb1RkTlY4bVFCNDgreXZ1VkNLRWc2ZGlYU3RHREc4MU43?=
 =?utf-8?B?VEM0S1U2TDBuMTl1S2tIQWU1bmc3Z0pBK1J3VlJES0NrLytiazBSUnBMNUQr?=
 =?utf-8?B?cmpFNVRLdm9oalZmYUMvWFZhUEd2cTlDL200ZXhVcUVaaktLN0c0U0ZtNXV3?=
 =?utf-8?B?SVRPclJERVJ4WkNCckhrNnpOaFd6M3hOUUFwUGVzOGc3NFNXSkdrMEhyNGhY?=
 =?utf-8?B?NVJMdFIxVWFUZ3lWUGhFQW1qQ2ZsTzlKQ3ZUK0UzUHhPSzNaZzQvcmtGanVF?=
 =?utf-8?B?K2NRRHE4Y2s4dzZtQlBmbVFXaVBNT29XM1pHcFYrZTJ6MFM2TUFDZ0QybC93?=
 =?utf-8?B?Qko0VG1pQ25zUU5GR3Z5SkVZTTRqRURoazFiY00wYmdMaU5pWktDNlI5SmRP?=
 =?utf-8?B?QUhqUzgxbFhYd2l0RDVvajlTeFVPbGM5aWdvaDFQWFFqeTlyZzE5WlNsbmdn?=
 =?utf-8?B?NUFoY2ZDRTBSYTdZeFVaUkk3SjNMSVZiTTBtYmRha0tmUjZPQTBKZlpXYjhV?=
 =?utf-8?B?R0RyckJKRmNCN3ZXemg3bDlnQmtlb2R5ek1HaFE3SDlQQWw5ZlN6NHFjek5L?=
 =?utf-8?Q?mM0Em/YGEhrT3UV9p/TEfgCOxTLZ1JXZ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aVJCYk9VditFd3BNN0RyRDJFcU9rd3NIQlRLMW5Wc054T2dlaTkzZ090eTRj?=
 =?utf-8?B?SC9RWG96OWtsb3VqQTVMMFRlUi9NWTA0WTVNT0dTRVNmcHZCVS9kbmp1V1F5?=
 =?utf-8?B?MUo4dmdiOGdaOG5GRmtFa2VlUHdOZHhWeFRabi9wOTcvc1ZkbFdUWDNpZzJL?=
 =?utf-8?B?WWEveTNmcTNINGhlZURydkUzTlRHeWdaeUhKTTN2dGRLTytLUG9tS1RqYWxy?=
 =?utf-8?B?UlZvZkQ0YlFWWnlkZ3k2RG5MNEFDaVJHUVlzbjRPSThxNGFnR2tOeStvOTFW?=
 =?utf-8?B?ZVBPVTNOQXc3VWZUQUJhck1uRm5vUEZVZExDcWZOby9pWEdaejNnNXRVMXRF?=
 =?utf-8?B?SnNDRVpuckY2d3BaMThmYUMzbVpDdkFtTHJ4MEM3cklVRzF5Mk1JOFJIVkRw?=
 =?utf-8?B?YTV2cWo1L3B5eW9CM2JPTXUwTkF1enVGdE40MWpkT2UvK1Y1K2FtaExRN1hZ?=
 =?utf-8?B?Zit6Y3B4Q0tKZVYyM3FtMnBZY2k0QzJJV3IweUh3NmZxOENMajJPOHFHdTJJ?=
 =?utf-8?B?KzFBbXd0Qnl3VXB3MEpsT3ZDTW5rSkdtRlZhU2JzU0JrWXZJWDV4WjNPeEls?=
 =?utf-8?B?Y3hSSWZ4ZTF2NTdGcGliWWFzNElWWVN6dktzaTNQRGtnR1hsOEY4NXJiZ3VN?=
 =?utf-8?B?dTU2NitqaGd1SVRRVEJwOTRvcjR5bVQxVGtaU0owc1FmTUJFN0VwSHhnMHh0?=
 =?utf-8?B?cEtXWU5MTGJqWksxeFNCUlkveFFPT3VVK0xSbVlwSFJWelN2NkFvaERqRXkz?=
 =?utf-8?B?SS9yaEZSVnFrSkdTZDAydFhXcnErTk9PV0FCMFdURlc3T2FVNXJ5c1lwaUNq?=
 =?utf-8?B?L3NEOHppMS9jZ2QyY1ZUNHd3d3M0U0I2Umg2c1ZwRkVKOVg5bU4rNS92c3kr?=
 =?utf-8?B?NFlCMVlQck0yeXhVMGJSZkdXdU9BUml2ODdhTFJSODVrclo2ci9kMVB0M1BI?=
 =?utf-8?B?R3RpZXJYZlhrd21wVFZub0VMVWNudEZ3L2NPVmJzc0ZmMDl6d3ZpUmxLdTU0?=
 =?utf-8?B?bmRoY25iK0NLdnM3TzlydmFMWjJaU2c2aUp5RDFGbVlJbnpDS01IdlJURjBy?=
 =?utf-8?B?Smx3NVNMZnhNNHJqNTlNU2cwKzdMNTFSc2V6Qm9sQkUyWlI0dnhPVU9nR3Q5?=
 =?utf-8?B?OW5wTjU0akN0NU0xRll5SGtFVllIZkhIVzhKemM1NnFxR3k0cGN4RzVRbXhI?=
 =?utf-8?B?K29rZ3pEYXcvUHFBWGZvZVpwUnBwUUsrMTNibWNldVBDUXZ3T1loQWFFWWN6?=
 =?utf-8?B?Rnp0OFhWTGx1Y3FaZis0dnBpMk13ZjBvWElSRk1wdWR5Mkl5d0g1MkMyOWMv?=
 =?utf-8?B?eTM2REtYVUdUbXIzdjY4QUFGcjZHTGtzYWFFRkd2SGY0d0hsS1pzdWlmTjZm?=
 =?utf-8?B?b0V3U0RmdjdRMTVHY3pCVUpJNDZ1V0svYmhqenpKUEdaWTJEL0dTQUZKaTJu?=
 =?utf-8?B?R1grcWkzeGdOK3VBcG5oTk1ZVWRITG12ZGViQ0cycW5JNnBmVVNndXhUUWFH?=
 =?utf-8?B?bUhqaGJRL05lSFFMVW5xQ2lvZ0Mrb0VjYU0wOC8wUVRtSmRQVmNjRWVMMTJl?=
 =?utf-8?B?NmwzbkdsVnM5QnFBL3JtRXp2VUV5WUZzWUtuajVEL2NLdVAwclY0Rml5Nkdo?=
 =?utf-8?B?UGZCdlV6ZUR4K2p3UFB6eG5rcHZQM2dPM3lqUEFiSksxTDNKRjc1dkdXT1J1?=
 =?utf-8?B?MlhaYlZKSlUzR0E4Sjc2c2ZqTjFUdU0vVXJyUXV2S0hiWlIzdUM3cG9Da01E?=
 =?utf-8?B?eDVRMWhkckF0RFdiODhVQjl4RFFPZ0cwb0pQWXdrNzZCS3QrRXA3WEtjc29Z?=
 =?utf-8?B?OWJBV0gwSk1Nc3Y2MjJPOThhd3JuOTZPODBKNzFaTU5MQndNUTNSWThCdGlO?=
 =?utf-8?B?WkluZ2FRNE1PVWtScVloM2FhZTB0bTBEZ1lEMXlQQnBQd1pwNDBwdkI5YUdN?=
 =?utf-8?B?Y2ZZRTJNUVBSTjZkYWZCbE5JOE9rcVdYeGgxblQ5RWhhQTMwVy9ZNVpEb1Jm?=
 =?utf-8?B?dGhkWnhyek1oYXEycXhrdmtMZVRsdFIrRzdzR3o5RHJVZWxxOWpxU3ArYytX?=
 =?utf-8?B?QWRZUU1jVjlCTWpwSFhOMUt3S2NSZUt2L2NhNURidEVkZzRUQmlUN0ZVZXpO?=
 =?utf-8?Q?Jk8fYg+paEGc9d6w6No6GT/5r?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3108a03a-e499-41e0-01f2-08dd9ceae390
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 06:51:21.0518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WxtFxkNgo2cYGk75bl0VzfRHt2pLrtTF+JKtdMA/WlFp1jq2fdkgH0RA8Yu5xUwMFfJ3kp/T8x+cnkUTbs8ZFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8346
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1NCBTYWx0ZWRfX7oQ3DntFZxGM X03k0hg92DZXFIYzzp8N3Q9MBTvMdEiRGSweRJ90TdMKK/Qb31of0MvgXeAC3xoA3XJEqAe7Dgv Hty7Wn5EmcG7UTLDBwkprVOoXt3XEVn/S4q5LYTK3hGDkZcDhKghHmP41XHIgYuw8G2vPPN/tEC
 9EhrHZuVAf/dW1XsQelzqbNe5cB/AFuPejnEb1bGDeCK9RGo7dEGv2BPceqomMF3A6WlRIpcaJE 8ciX4HjCwoY1e8PKxCADdDZfUUNkZHoX3AJw+1VI0NY5d4aiqqNuKodq7mOyOjBfEzvT9IZlLKS mqDF2NSbE7zcVOKqM1Fe2rtZAUOT4cXLjK2PQ3udtcDCTgID5fgSx091JsdNUe/JKnX/BVUI8hR
 nsxtQsc9IKxnr4E8szqf5mACluZ4wmPydrlESIOx+i/ZL6Tec1jEHv8DAu1fGpQDaud6Md/8
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=683560ed cx=c_pps a=aZuVfPrC45A246xPil/Ifw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=0ScOIq4UThbGigUfboYA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: 1TWTE7WEmFxxiqZSgk1rXenGqEk9SdmP
X-Proofpoint-GUID: tObdHpmmgFOR8osJlS7vBUtsOtmrXuJp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505270054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 06:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217283

SSBjYW4gcmVwcm9kdWNlIHRoZSBpc3N1ZSBieSBlbnN1cmluZyAncGFtJyBub3QgaW4gRElTVFJP
X0ZFQVRVUkVTLg0KSSdsbCBzZW5kIG91dCBhIG5ldyBwYXRjaCBzb29uLg0KDQpSZWdhcmRzLA0K
UWkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1hdGhpZXUgRHVib2lzLUJy
aWFuZCA8bWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPiANClNlbnQ6IE1vbmRheSwg
TWF5IDI2LCAyMDI1IDg6MjggUE0NClRvOiBDaGVuLCBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29t
Pjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6
IFtPRS1jb3JlXVtQQVRDSCBWMl0gdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWQ6IHVwZ3Jh
ZGUgZnJvbSAyLjQwLjQgdG8gMi40MQ0KDQpPbiBNb24gTWF5IDI2LCAyMDI1IGF0IDEwOjIzIEFN
IENFU1QsIENoZW4gUWkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IEZyb206
IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4NCj4NCj4gTGljZW5zZS1VcGRhdGU6IGFk
ZCBFVVBMLTEuMi4NCj4gU2VlIA0KPiBodHRwczovL2dpdGh1Yi5jb20vdXRpbC1saW51eC91dGls
LWxpbnV4L2NvbW1pdC83NGYzMjY1YjlhMDc5ZjlmNjBhZDZlDQo+IDYwNmQ3N2RlYWUwMDI5YTQz
YQ0KPg0KPiAwMDAxLXRlc3RzLXRzLWtpbGwtZGVjb2RlLWF2b2lkLXVzaW5nLXNoZWxsLWJ1aWx0
LWluLWtpbGwucGF0Y2ggaXMgYSANCj4gYmFja3BvcnRlZCBwYXRjaCB0byBmaXgga2lsbC9kZWNv
ZGUgdGVzdCBjYXNlLg0KPg0KPiAwMDAxLWxzZmQtbWtmZHMtZm9yZWlnbi1zb2NrZXRzLXNraXAt
d2hlbi1sYWNraW5nLXNvY2tfZGkucGF0Y2ggaXMgDQo+IHVzZWQgdG8gZml4IHRlc3RjYXNlIGZh
aWx1cmUgb2YgbHNmZC9ta2Zkcy1mb3JlaWduLXNvY2tldHMuDQo+DQo+IGxzZmQvb3B0aW9uLWlu
ZXQgaXMgcmVtb3ZlZCBvdXQgb2YgdGhlIGV4Y2x1ZGVkIGxpc3QgYmVjYXVzZSB1cHN0cmVhbSAN
Cj4gaGFzIGZpeGVkIHRoZSBpc3N1ZToNCj4gaHR0cHM6Ly9naXRodWIuY29tL3V0aWwtbGludXgv
dXRpbC1saW51eC9jb21taXQvZWFhMzg3MDg4MGFhYThkM2Q2YjFhYQ0KPiA4ZWE2YmIxOWE3MTc3
MDhiOGUNCj4NCj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29t
Pg0KPiAtLS0NCg0KSGkgQ2hlbiwNCg0KVGhhbmtzIGZvciB0aGUgdjIuDQoNCkl0IGxvb2tzIGxp
a2UgdXRpbC1saW51eCBwdGVzdHMgYXJlIGZhaWxpbmcgYWZ0ZXIgYXBwbHlpbmcgdGhpcyBwYXRj
aDoNCg0KRmFpbGVkIHB0ZXN0czoNCnsndXRpbC1saW51eCc6IFsnc3U6X2Vudmlyb24nXX0NCg0K
aHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMv
NjEvYnVpbGRzLzE1NjYNCmh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxr
eXJpZS8jL2J1aWxkZXJzLzczL2J1aWxkcy8xNTY3DQoNClB0ZXN0IGxvZ3MgY2FuIGJlIGZvdW5k
IGhlcmU6DQoNCmh0dHBzOi8vdmFsa3lyaWUueW9jdG8uaW8vcHViL25vbi1yZWxlYXNlLzIwMjUw
NTI2LTYzL3Rlc3RyZXN1bHRzL3FlbXVhcm02NC1wdGVzdC9jb3JlLWltYWdlLXB0ZXN0LXV0aWwt
bGludXgvDQpodHRwczovL3ZhbGt5cmllLnlvY3RvLmlvL3B1Yi9ub24tcmVsZWFzZS8yMDI1MDUy
Ni02My90ZXN0cmVzdWx0cy9xZW11eDg2LTY0LXB0ZXN0L2NvcmUtaW1hZ2UtcHRlc3QtdXRpbC1s
aW51eC8NCg0KQ2FuIHlvdSBoYXZlIGEgbG9vayBhdCB0aGVzZSBmYWlsdXJlcyBwbGVhc2U/DQoN
Ci0tDQpNYXRoaWV1IER1Ym9pcy1CcmlhbmQsIEJvb3RsaW4NCkVtYmVkZGVkIExpbnV4IGFuZCBL
ZXJuZWwgZW5naW5lZXJpbmcNCmh0dHBzOi8vYm9vdGxpbi5jb20NCg0K

