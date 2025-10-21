Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FEDCCD1A7
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 06:46:42 +0000 (UTC)
Received: from esa15.fujitsucc.c3s2.iphmx.com (esa15.fujitsucc.c3s2.iphmx.com [68.232.156.107])
 by mx.groups.io with SMTP id smtpd.web11.5321.1761029193049487708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 23:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=X5OD8C4m;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=C/Tngp7o;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.107, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1761029194; x=1792565194;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=X1agkylx5W2FOsVA76v990H5sYhMhmXyqYbvkZUSg0M=;
  b=X5OD8C4mDgoLnBulXzhsXtzXMXIP9BPDrwqPPAfOHGVPViOzWtITfwc1
   1v4/QHspOZco2oF93Do0l6D+3nlar4djap1nA/6E7GDsAdO5wq83d4y24
   FQWs3J73kTmlR8cz2qzMGM25erSXu9wsloqTaxpJPTBH5h9JPaiMBTIHl
   ltVtnKD8XdkcrXiUo7pusV9jy+fpgCNhRjgJ2F+Lb/u/7mtM2kR61Awbn
   2hiLL1Ff/EAXYclXCZjJuWtV+kXvCWaxSncHfgiLj+ds8+z9gsbyLpYUm
   wo+AMdj69mEkjM6U0J3Esucih7Lak4FVFLZbRGcZkWBQnG4Uyq6c0W1BC
   Q==;
X-CSE-ConnectionGUID: IwQsr9KdS4yEFAevV0ygiA==
X-CSE-MsgGUID: BcKn/ekjQ7+2NQPv2E2QQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="172171806"
X-IronPort-AV: E=Sophos;i="6.19,244,1754924400"; 
   d="scan'208,217";a="172171806"
Received: from mail-japaneastazon11010062.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([52.101.229.62])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 15:46:31 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ao3ywntX6ntXmotaCaeC7y7WUA+jRO1R+PmErUE1o7v5VSTZ7Rg+VrRsP0Rmd6CansAuhbq3H2OB2eX5G9e7PLdwflX0Yg/RPkdByLL3BcrUGqolTpPeh0M15sMlhShdu3LpRmuXoyKTKJ85xHZVQsnUZfABn6ehgFN7nFS9tUOmlOxsiNrrlQhtguVmsyuOeraJGC7egRgDjrCA0kliM2t1+Dcd7T/FGet7p9zRQL3KK4DKnZeVIr/EhdagP8ch187+GMuHBcN6horBN274sj8jlqX2YRxEb3OIsT9NRyWCzeWW367TrXqbP7vRkX/xzKNEjhacaLo4uB/c0Hd7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1agkylx5W2FOsVA76v990H5sYhMhmXyqYbvkZUSg0M=;
 b=EqAN7VppXW6agXyUHD8X4h1OYjROBdaagaQmfE40dhSk73adOUuEvn6wdEkasMkY1bFioErdUCW50bpylqCP1VAIQXcGou6XCMW/gtty95syb7K34HGhF5kM0EdNv1isJoBPNFh/Es1woH9rUW/4s1emoAwNYLC60zT8ROIvgtTSofsNu9Zm/3aWQiDDIQN1e+h70+9Bp4Uw/EWnfgH3Rq+3QvbtvF7WxCklNLjDp7szoTeAhpkL2LCetXJA7i2C1iCQjTL1phG7sWOgmoo7lXM9JAlDjn+6ZhPqFtBPfbGmQRJRuy0eKkyfvE/atBREjZdJ+65G5UECEru0o20KwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1agkylx5W2FOsVA76v990H5sYhMhmXyqYbvkZUSg0M=;
 b=C/Tngp7ou5ci5kozqsWNtQMpzBe4XjOU1LvdO2HMRcV2k+cf8JI5i0Fs2xCuygtXzLWrWVoRI8RykIT9MSADrb7Qfbvpgr+ogSJ2uLqWnkMfxPSZxthaFb3l48FCZMn+9Ui8lBMSA4rFXad5qfdufIF7fWfH/UN6cs0Ya63MJkI53ZUayqPooIsbEUxDb2D2jY3lWmpkPZmHACn2/soRh2IlU4/jCWGvmFpsRJxuqUzVTr0ZwtKBXWLazpA4agJeeIUvGMl0Dv8h4nYDAL94p7Cssh/aPfeQS70wJyNoAgyWNZzJglbxZwyaQ+98ivVvlnWRG71w1eqemd+QPMC2mw==
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::12) by TYYPR01MB13968.jpnprd01.prod.outlook.com
 (2603:1096:405:19f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 06:46:25 +0000
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014]) by OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014%4]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 06:46:25 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Quentin Schulz <quentin.schulz@cherry.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?gb2312?B?u9i4tDogW09FLWNvcmVdW1BBVENIIDEvMl0ga2VhOiBmaXggRVhUUkFfT0Ug?=
 =?gb2312?Q?config_to_EXTRA=5FOEMESON?=
Thread-Topic: [OE-core][PATCH 1/2] kea: fix EXTRA_OE config to EXTRA_OEMESON
Thread-Index: AQHcQWrhwE06ZbxwukOycaxAp9D2BLTLRKsAgADdD2o=
Date: Tue, 21 Oct 2025 06:46:25 +0000
Message-ID: 
 <OSRPR01MB1159720651684F40F7339218E9BF2A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
References: <20251020023955.2962-1-liuyd.fnst@fujitsu.com>
 <20251020023955.2962-2-liuyd.fnst@fujitsu.com>
 <4ded0bd1-425a-4434-955b-c8ce480a01bd@cherry.de>
In-Reply-To: <4ded0bd1-425a-4434-955b-c8ce480a01bd@cherry.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-10-21T06:46:20.623Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSRPR01MB11597:EE_|TYYPR01MB13968:EE_
x-ms-office365-filtering-correlation-id: 8057ab4e-2f99-42ec-81a8-08de106d8e09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|7053199007|1580799027|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 =?gb2312?B?SlhDdCt3NkZQR3hmQkJEVXUyS1Flb25RcHlyWHZDUUZnajA2UDFVQVNUbXh1?=
 =?gb2312?B?Ui9NRjNtZkNmOUtYZ09ONFBZdWNqK2hrR2JzeXVwV2haM3NydFl6eWhpdUU3?=
 =?gb2312?B?NEF5V2NyUDlVUHYyK014Vmt4emR6d3h0bXpZMUhyRGI1S0pFN29QSHoya2hF?=
 =?gb2312?B?NU1wS1FJalNlMVlRM1YzL1JmVGFLZ05kc095R3VCaDJtYmhMOE1uS1kvcHU0?=
 =?gb2312?B?dkl0Tm1hMmlURnlZNU90ZlVBYnFtVDJhTTUwZXRzMUxBVFpwK3dFM3lDdkU0?=
 =?gb2312?B?VVBwMHBvYnUvWUovQzRkQnBuZDJ1VldOeEtkU0FjODgxOXdpT3NjRDhZL2NM?=
 =?gb2312?B?RDIrYitYd01rMlRra1ZtdFVPdkpUZWpoQm1mdE5tVEozbHIvTStWb09GcGho?=
 =?gb2312?B?cXFndWNFamVHb1NrVTVCZE9taytubkdmVnUweDB2RWo2N3I4SDdsb2RnTzR3?=
 =?gb2312?B?cjFvTy9OM2NNOURGMTVzNFJhT2IvbkNJOHpJM29iNElDSXpHbUJjOVVoYWVP?=
 =?gb2312?B?SXNPMEhDQUgybFFUeTJPUEhjbzU2a3UvQXp5cXV0eTJ4NzNOTEt6SDQydS9a?=
 =?gb2312?B?MG40YloraUp3c3ZEdEVxSys4MUl1d1lHWmZRK3pTMWJKV04zRGk2S2IwTksy?=
 =?gb2312?B?UGxHSDd3OGZ2SjYxV1Jla0VaL3d1QktzK2dJRHJnVUpRWUdmR3VNaFpRelZM?=
 =?gb2312?B?S2hqTy9LcEFsWXhUQktTanExY1lNS1U2ck1iakVtMnErTHd5ZmxhSnRPMk9j?=
 =?gb2312?B?TWx0L1F1ODRSRlNoVWNZWGF3TENxSlE4eE9JMEo2V2EvRnJjejlnM0RnU1Zq?=
 =?gb2312?B?K2lIMVVYSktySVJoT0tiVmV0ak1SSHpFU2RZc2lzWWMreERjZWJLMHNDWEhn?=
 =?gb2312?B?N00yUGp5WWNoc05BVmo1STBpY3VjbnhlTGRLU1VobXl3RjF1TWNaSDJZWHE3?=
 =?gb2312?B?ZG1sT0RZR2VoSURieE54N2pwRG9KeHNxSFoxVG1nVlNYR3NwQ3ZuYTJmRlFF?=
 =?gb2312?B?aUZSSDhUeU9vaTdEMlZseFNuTzBFOG5pdWhCaXRvQStQYjJhSHFHamhJTDhX?=
 =?gb2312?B?RkxsMGx5L1VwK0x5aC9nL3VRRGkvNDEvejEweHJ1a1ZrREdtSm8xbWJiS0FO?=
 =?gb2312?B?aDZ3cWpaSk5MMEJ5R1BydkNObFluSEZZN3RHWkNiUVdrVmJlcWkwU0twVkJV?=
 =?gb2312?B?M2ozY0F6Q1BrTXltcXg1TFdFV0NIaUQ2VzZldFRoNmZvNjNPQStXem5hUlEr?=
 =?gb2312?B?SDFZYnR5MmZ4bjZyMmh6OVZzV1VpeThMSm5FSXAzeitPcGdac1djNXV3Q3Jz?=
 =?gb2312?B?L2JLZElWa3hhQS8vblduT05IUlVaaEttNHFBeC8rS0FYN1NZR1RaWXl1VEZh?=
 =?gb2312?B?YWFuNUNoQkduUHFHQ3Bmc3g2citJdnkyUUtVN25DTXczNTUzMWMyK2pDekFM?=
 =?gb2312?B?VkhPZXNDalJCbzBHQkdEdGVWWFova2ljSEExU0xYcnJ0S1pNdmF4dHkwK1VE?=
 =?gb2312?B?Z0FObThaTnlrYTIvWWVGQUVSNFZoNE9wSjZhcWNXRVc5YUZPcmd2Sklha255?=
 =?gb2312?B?T3l4c1pONEFFcHJJNGVOVVhkU3lkZjJzMHJrL28zU0h0UTd3bkt6Yzg0Vlls?=
 =?gb2312?B?WStjVDFRMGJDem03WWZpUjE1NS9Dc3o2WjFobzcwMFhxSWl2Rmg0eXJDM0VK?=
 =?gb2312?B?VEduK05pL1RKTFhWS2t5MHhWRUl5ZTlqQWVyMmt1UUViZ1VkYnl1ME91MS9X?=
 =?gb2312?B?Z0NORlRLcnRSeng0bDlwVDJCcXRwN0h6dk1GZjVtajhET1I3NnY2TlVQU1J0?=
 =?gb2312?B?RTRwRXoveFEyVGU1VG9tSW9xd3Nrek12bEp0Q3lYYmpnU2pJL1lKY2pMRzdu?=
 =?gb2312?B?NDlYMjhGV0VXTVFBTlgwRG1tcUFUSVEySXVMRENISDRxZDhMdGUyUlZkMzE0?=
 =?gb2312?B?cE5WVDhWdjFSN2w2UGxCdlhSb0tid0ZNUWlsNHkwTmpNMklaaHB1dTRIR1FI?=
 =?gb2312?B?TnFxT01IY1VrL1Q1QlpjQUVGVU9VSVhuZit0cnprUTMyMUp1VFFLemhjRERj?=
 =?gb2312?B?YnZzc2xvQkhRUHYwUWxoR2Y0cTZ6NXNVdUFBdz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11597.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(7053199007)(1580799027)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?ZEdHK0pvN0VWYWV6VEdGdHlFM2xCRUxFT1pDOVNiM0VUZE56cksvekplanpq?=
 =?gb2312?B?cm1tWWx1Mm5zcWlQMGxDTjFUdXlZMzNla3JERGtYL0xaalNmNmwwZEY5cnFK?=
 =?gb2312?B?VDlWQlJEbnYvb1ZhSlg1SXJQTXR6emw5SmIyS3gwdjlURVNGUkdzbjg4WlNi?=
 =?gb2312?B?MS9ucW52eHZ5MXY0UTRiWlc0TkpCWG5EMCtUVGoxekVwL2NFZk5XRndkM1pl?=
 =?gb2312?B?RHBtS0x0cnU1aG1TSTd3aVZJNHlEaWJ4Q0hKWGlrSlY5RWcrbWxyQTNyemM4?=
 =?gb2312?B?RVdYWFRHSkZIYXgzZzhyajZoWEFBbHB4eWcyaEpOQ0FEcS9JZ2FVQ1llTVJ5?=
 =?gb2312?B?T29vZUo1c1F5aW1GS0gwOVpyT281b3RkSEV3RWhURS9ndTBjeVNEei9FLzRh?=
 =?gb2312?B?RjNyTi9HT3VMUERlcVlzL2JMQkRMcEE4NU9yczhYZkd2bmY0M2RNWGoyTHV1?=
 =?gb2312?B?S1dTYmVvUXl0MlRXQzhKM0plSGxpS0pHK2lPNkQ1bEFPeDVFUDNaamFmRHZ5?=
 =?gb2312?B?QldyckFJSytzVTVSSkdUa0hmQkhxZG54SnNtQmM0SzliWkVScW1GM0k0SzBv?=
 =?gb2312?B?bGZ2Q2FLRHk5YzNTZEpub0ZrWjV6dEM2bklJMmw4bjRrKzM1bmVrTkM3Wk5Q?=
 =?gb2312?B?WUZ3YlpqZUQyK1I0bDY2RUlqVDFqNE1zN2x6YzZRQmVoYmsyQmVYcUNkNERa?=
 =?gb2312?B?MExZR0k0bWFEZzFXemp2TWVFcjhlOWFFQ2MzYSt4cG5hdzVVZGFaL0dwRFdF?=
 =?gb2312?B?SDh5TlVXZmhSZWIxVXVTMEl2d015SnFxdi9VVEtpUFAvbGRsVVptSVhPYjht?=
 =?gb2312?B?aWxFaGUrdU54Nzhqb3BNUitvSTd1eUpRVG96Mk5ZbDdDNERIVzFCQmFiaWJK?=
 =?gb2312?B?anBiSGRiRWhNdVFtUmMvWFpWSW55ZCszN3JQbWduSXcrdzRLekNxVEpMc0ZQ?=
 =?gb2312?B?cVpyOGIzd3FQbTFwblZYOFVNVG5HNmRMUjBoSlJid1NuSjhkMzgzejl1RU1w?=
 =?gb2312?B?c29nMlhIdjNHbndjR2lJS0JUTVhGYlp4K1UxQkl3a1RCZ2tzZmNqclhsS2pO?=
 =?gb2312?B?aGxTcXJRKy9VM0cwSDRRS1dYNkNkS0huUGEvMmFBWnRyQUtDRnZnN1RabEc1?=
 =?gb2312?B?aGpxWmpUSVZYTXorcnhCY1c1cE5UNUJTUzRBV1JLZkhGbmhGUksxVDZnQmZh?=
 =?gb2312?B?TGNJb2EwUExJYjBBTit3WTZZN3NhZ2w0L2Q3TzRWUGtld1ZHUm9pNDF1cFpV?=
 =?gb2312?B?TVRCYmdZT2VKVmZYMUJUYTJEanI5dkJKMG5UWHNFeG1Ld3RSZWxzdGhqRHZh?=
 =?gb2312?B?T1pwdW9oYTJwM0hhMElzZDlEL2c5OE53MUtHWHpHQkxZajcvSDRmY0daWU1l?=
 =?gb2312?B?dC9kZUJPcDJRODErUFlvUXhmMktWcTNIZUNLdHBHU1JLelZpNE15d0FWRUMw?=
 =?gb2312?B?VnpzMlY3WTJVeC9qRUFIclhOcDFiZzE2SUxLckFram11eUNiU3ZEMmQ2Tk1Y?=
 =?gb2312?B?YkRsK0t3b0hiUDJLOFFMYUJxbUZ1aHlRM0dLb1gxanJqaXNHRnRjU2p2YUZt?=
 =?gb2312?B?WjM1dTh4NXJhVFEwZ0ZjNmlGbmxOZmRLRjdhTllGaGFhSFQ5anBUeWc4VFhN?=
 =?gb2312?B?NzV2NkN6QnA5QVlHc3hRRi8xVG9SN3dNakRMdmh0cGJJZnIrbk1MRFZBempq?=
 =?gb2312?B?RXdOTkFmOXVGWkphOE5QQlBoeXp0NmhOdGVMcnVyRTNGenhBK3ZuQkZxQjcz?=
 =?gb2312?B?VVZTVW1WakVWTlQ0Z3pNeHdmelIyNUxNREFqcmNoUEU0OFhWbWVrejJjeVlR?=
 =?gb2312?B?dlNkZGw4Ti9uNzdSYzFnRk10ODNhRkFBQUJwdEcyLzdZOHZ6dnhqWDkxd0R6?=
 =?gb2312?B?Mm5RM3pmNHlnZlV1WmVzQ29YRDdNLzV4RFh4eHM3N2lkRFZYbHo1TDlVWlhs?=
 =?gb2312?B?YmlIWDBMK2JZekxKZUtMMzdyRVpUczdaeXUzRzVYaFRoWGxjSUp5aXZEK29R?=
 =?gb2312?B?OGx5eHlXTmRmaCswZDR4WXp1aDh0YXBRbmVMY3QwNVBvcmZVT1Nuc3MxWGVN?=
 =?gb2312?B?M3R6aXgrMXhkMHpTNDJGNW5tN0R0cDNlVjRBUTVMcURjZVcxSHo3bVNNb0Nx?=
 =?gb2312?Q?JzwoODMbGl0qvSGCHvBayWdPN?=
Content-Type: multipart/alternative;
	boundary="_000_OSRPR01MB1159720651684F40F7339218E9BF2AOSRPR01MB11597jp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	4ucNCH05PG0s9zh5HFxww8J0xVuCpyPYhgZ0CcBsMiXUzm+31FjNsYhTRhMpYeGbnHo6wER+Df5zQRNHzB6vG/8vHjQLET66kpY6CmgmA8uM/QdU6XPqvF0iANSkLpnx1vYc8OyBUZld181/rq/g+oKTOSQIuFvrRcMyLCtQW9kMIMpgs8B6nFpnF3rkdIibZP0UoxXe3wVE7pjESWYSAgRWbNaLuZ615WXJjpBSVg+Bkd47pU7gcT1bPCaXhT4ypoZPbo115rBOkRET17002KeFTF8r5+Y9ErtVN9CixpMnfQ4ayCRqur6AFxJHtLoCWJ9YpG7oa/iN3xFCw/oNuzE+VJvB3EQbpUHSxUljmsS3vs1B+MNmCoEuChGK5QUCCFWd5CNQG8z1wfZ9qHSmS2ho6tmm5UfBrCtwAcG6OawiHW7U8N9oNkw5VjPYXlYFtyo930jaq9ZIFHBbXg6emwOezM38Eeen55hAGjnuCZq3pBJmwmld7gFj1N3oXk45SjMwMyQAfCLwij5sSKIZevewJwkTrHOq5c93cvShLL5H9K8aUWCymRlSFSSEn5wxj/CvzE26KY04GFTLQoupRzlMu0e/kNG8tUVcjDIyFj0oZp9z2bdf46JFQe/7K7N4
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8057ab4e-2f99-42ec-81a8-08de106d8e09
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 06:46:25.3208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 11n2pTrgY2gV+hdjZoUOh+NS51uZ7XavBc0PQBI8PsjMrOoblcvXufilHrnMzpYC1ZmTqYZ8UtmfxeL60SOy0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13968
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 06:46:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225144

--_000_OSRPR01MB1159720651684F40F7339218E9BF2AOSRPR01MB11597jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQ2hlZXJzDQogICAgV2hlbiBJIGNoYW5nZWQgdG8gRVhUUkFfT0VNRVNPTiwgLURydW5zdGF0
ZWRpcj0ke3J1bnRpbWVkaXJ9IHdpbGwgYmUgZW5hYmxlZCwNCmFuZCAgaXQgd2lsbCBwcm9kdWNl
IC9ydW4gZGlyZWN0b3J5IHdoaWNoIHdpbGwgY2F1c2UgZG9fcGFja2FnZSBRQSBFcnJvciBhcyBm
b2xsb3dzOg0KRVJST1I6IGtlYS0zLjAuMS1yMCBkb19wYWNrYWdlOiBRQSBJc3N1ZToga2VhOiBG
aWxlcy9kaXJlY3RvcmllcyB3ZXJlIGluc3RhbGxlZCBidXQgbm90IHNoaXBwZWQgaW4gYW55IHBh
Y2thZ2U6DQogIC9ydW4NCiAgL3J1bi9rZWENCg0KU28gSSByZW1vdmUgJHtydW50aW1lZGlyfSBi
ZWZvcmUgZG9fcGFja2FnZS4NCg0KTGl1DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0Kt6K8/sjLOiBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpAY2hlcnJ5LmRlPg0Kt6LL
zcqxvOQ6IDIwMjXE6jEw1MIyMcjVIDAxOjA1DQrK1bz+yMs6IExpdSwgWWlkaW5nL8H1INLStqEg
PGxpdXlkLmZuc3RAZnVqaXRzdS5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0K1vfM
4jogUmU6IFtPRS1jb3JlXVtQQVRDSCAxLzJdIGtlYTogZml4IEVYVFJBX09FIGNvbmZpZyB0byBF
WFRSQV9PRU1FU09ODQoNCltZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gcXVlbnRpbi5z
Y2h1bHpAY2hlcnJ5LmRlLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9h
a2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCg0KSGkgWWlkaW5nIExpdSwN
Cg0KT24gMTAvMjAvMjUgNDozOSBBTSwgWWlkaW5nIExpdSAoRnVqaXRzdSkgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IEFmdGVyIGtlYSBoYXMgYmVlbiB1cGdyYWRlIHRvIDMu
MC4xLHRoZSBidWlsZCBzeXN0ZW0gY2hhbmdlZCB0byBtZXNvbixidXQgdGhlIGNvbmZpZyBvZiBi
dWlsZCBzeXN0ZW0gaXMgc3RpbGwgYmUgRVhUUkFfT0VDT05GLiBTbyB0aGlzIGNvbW1pdCBmaXgg
aXQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IExpdSBZaWRpbmcgPGxpdXlkLmZuc3RAZnVqaXRzdS5j
b20+DQo+IC0tLQ0KPiAgIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2tlYV8zLjAuMS5i
YiB8IDMgKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEva2Vh
XzMuMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEva2VhXzMuMC4xLmJiDQo+
IGluZGV4IGNjMzRjMDUwOTMuLjA2ZjFhNWVkYzMgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkva2VhL2tlYV8zLjAuMS5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2tlYS9rZWFfMy4wLjEuYmINCj4gQEAgLTI2LDcgKzI2LDcgQEAgU1JDX1VSSVtz
aGEyNTZzdW1dID0gImVjODRmZWM0YmI3ZjZiOWQxNWE4MmU3NTVhNTcxZTkzNDhlYjRkNmZiYzYy
YmIzZjZmMTI5NmNkN2ENCj4NCj4gICBpbmhlcml0IG1lc29uIHBrZ2NvbmZpZyBzeXN0ZW1kIHVw
ZGF0ZS1yYy5kIHVwc3RyZWFtLXZlcnNpb24taXMtZXZlbg0KPg0KPiAtRVhUUkFfT0VDT05GICs9
ICItRGNyeXB0bz1vcGVuc3NsIC1EcnVuc3RhdGVkaXI9JHtydW50aW1lZGlyfSAtRGtyYjU9ZGlz
YWJsZWQgLURuZXRjb25mPWRpc2FibGVkIg0KPiArRVhUUkFfT0VNRVNPTiArPSAiLURjcnlwdG89
b3BlbnNzbCAtRHJ1bnN0YXRlZGlyPSR7cnVudGltZWRpcn0gLURrcmI1PWRpc2FibGVkIC1EbmV0
Y29uZj1kaXNhYmxlZCINCj4NCj4gICBJTklUU0NSSVBUX05BTUUgPSAia2VhLWRoY3A0LXNlcnZl
ciINCj4gICBJTklUU0NSSVBUX1BBUkFNUyA9ICJkZWZhdWx0cyAzMCINCj4gQEAgLTcyLDYgKzcy
LDcgQEAgZG9faW5zdGFsbDphcHBlbmQoKSB7DQo+ICAgICAgICAgICAgICAtZSAiczoke1N9OkBh
YnNfdG9wX3NyY2Rpcl9wbGFjZWhvbGRlckA6ZyIgXA0KPiAgICAgICAgICAgICAgJHtEfSR7c2Jp
bmRpcn0va2VhLWFkbWluDQo+ICAgICAgIHJtIC1yZiAke0R9JHtkYXRhZGlyfS8ke0JQTn0vbWVz
b24taW5mbw0KPiArICAgIHJtIC1yZiAke0R9JHtydW50aW1lZGlyfQ0KDQpUaGlzIGNoYW5nZSBz
ZWVtcyB1bnJlbGF0ZWQgdG8gdGhlIG1lc29uIGJ1aWxkIHN5c3RlbSBjaGFuZ2UgKG1heWJlIGl0
DQppc24ndD8pLiBDYW4geW91IGV4cGxhaW4gd2h5IHRoaXMgaXMgbmVlZGVkPw0KDQpDaGVlcnMs
DQpRdWVudGluDQo=

--_000_OSRPR01MB1159720651684F40F7339218E9BF2AOSRPR01MB11597jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0);" class=3D"elementToPro=
of">
<span style=3D"font-size: 12pt;">Hi </span><span style=3D"font-size: 11pt;"=
>Cheers</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; When I changed to EXTRA_OEMESON, -Drunstatedir=3D${runtimedir=
}&nbsp;will be enabled,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
and&nbsp; it will produce /run directory which will cause do_package QA Err=
or as follows:<br>
ERROR: kea-3.0.1-r0 do_package: QA Issue: kea: Files/directories were insta=
lled but not shipped in any package:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; /run</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; /run/kea<br>
<br>
So I remove ${runtimedir} before do_package.<br>
<br>
Liu</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Quentin=
 Schulz &lt;quentin.schulz@cherry.de&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2025=C4=EA10=D4=C221=C8=D5 01:05<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@f=
ujitsu.com&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [OE-core][PATCH 1/2] kea: fix EXTRA_OE config to E=
XTRA_OEMESON</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[You don't often get email from quentin.schulz@che=
rry.de. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
Hi Yiding Liu,<br>
<br>
On 10/20/25 4:39 AM, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:=
<br>
&gt; After kea has been upgrade to 3.0.1,the build system changed to meson,=
but the config of build system is still be EXTRA_OECONF. So this commit fix=
 it.<br>
&gt;<br>
&gt; Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; meta/recipes-connectivity/kea/kea_3.0.1.bb | 3 ++-<br>
&gt;&nbsp;&nbsp; 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes=
-connectivity/kea/kea_3.0.1.bb<br>
&gt; index cc34c05093..06f1a5edc3 100644<br>
&gt; --- a/meta/recipes-connectivity/kea/kea_3.0.1.bb<br>
&gt; +++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb<br>
&gt; @@ -26,7 +26,7 @@ SRC_URI[sha256sum] =3D &quot;ec84fec4bb7f6b9d15a82e7=
55a571e9348eb4d6fbc62bb3f6f1296cd7a<br>
&gt;<br>
&gt;&nbsp;&nbsp; inherit meson pkgconfig systemd update-rc.d upstream-versi=
on-is-even<br>
&gt;<br>
&gt; -EXTRA_OECONF +=3D &quot;-Dcrypto=3Dopenssl -Drunstatedir=3D${runtimed=
ir} -Dkrb5=3Ddisabled -Dnetconf=3Ddisabled&quot;<br>
&gt; +EXTRA_OEMESON +=3D &quot;-Dcrypto=3Dopenssl -Drunstatedir=3D${runtime=
dir} -Dkrb5=3Ddisabled -Dnetconf=3Ddisabled&quot;<br>
&gt;<br>
&gt;&nbsp;&nbsp; INITSCRIPT_NAME =3D &quot;kea-dhcp4-server&quot;<br>
&gt;&nbsp;&nbsp; INITSCRIPT_PARAMS =3D &quot;defaults 30&quot;<br>
&gt; @@ -72,6 +72,7 @@ do_install:append() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; -e &quot;s:${S}:@abs_top_srcdir_placeholder@:g&quot; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ${D}${sbindir}/kea-admin<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm -rf ${D}${datadir}/${BPN}/meson=
-info<br>
&gt; +&nbsp;&nbsp;&nbsp; rm -rf ${D}${runtimedir}<br>
<br>
This change seems unrelated to the meson build system change (maybe it<br>
isn't?). Can you explain why this is needed?<br>
<br>
Cheers,<br>
Quentin<br>
</div>
</span></font></div>
</body>
</html>

--_000_OSRPR01MB1159720651684F40F7339218E9BF2AOSRPR01MB11597jp_--

