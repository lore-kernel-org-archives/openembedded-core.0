Return-Path: <PritamSrichandan.Sahoo@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2A8C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 13:01:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8657.1783602071924370312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 06:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LvWaMn4i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=16502cbfe2=pritamsrichandan.sahoo@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BPT3v2241599
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Jul 2026 13:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=zZgn6OoQkWK/NkKK2r706q
	COIvLrxJr898lkESBEnB4=; b=LvWaMn4imRvRXvelpkj1k/AwkvT9QpEMfLTYef
	ONWPsHC9u/Ga6/B/+TjdosVkP4AlssHJb0tEddZDD8b9317dz1dwoshxJXP/hLUa
	E39kglj8SDfOF9S1TJsE+jitB0PAtGYHHlniNF/hhyOe6nWLsRf16BUkKCkPmAxh
	H/CQMqkmmyZfWRyvJsBsI7b/OEMX3K44sItoyiNCHXA5Mj0YBL7j6TQtBOVkwlx0
	AcpaOYoTO+7F1mcfr6kS8RjsDVawdCmrbBRBWU5HBuU+4LW0s27WV9oI/oItuj++
	DqvAlAtUlNcfYqRfz2shrvTeKAKQ0PXGvBSFYfz5aziYk/5A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013069.outbound.protection.outlook.com [40.93.201.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fa1aq8x31-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 13:01:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VemxF35pIfRg4VD/6alPdYWbuijODTht+OYx/huI/Z52qUQa6UPjZPMr4sMWaUilAwVsPpPRN0UKE4jvjU9BNiMGbunwI4hI1+Yxu0tse8JOK9NIqsKfTdsBBroaE90roz8hJ7JmFNCv/LSZ//l0YRDEY87BvPFLLpXRjFW4sRUO4uPnn1ULg8c++/AMQJQXHiSiDLw5AEX/oMe9afq2zkO5wOC0Hqyz4w16/64CI5oKNw8X1jMcdXepGPXqLaFerAwcSXVMZmEbDW8ZQkwlHcrgkSiTUIE/h+ocZHAaeP2Ac9h0VVSWXXm9JPwmfqsT0xPVqhZDuHI9Ae8OG6/U5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZgn6OoQkWK/NkKK2r706qCOIvLrxJr898lkESBEnB4=;
 b=prGRkE9pr9c2Jiz9v3p8dez7MhaaSoOODvvQbRlO0DSfelO6smrH2wD6+ZblPkmwR3Q75GNTvE9woHX/p5GY4h9sNWDmTg89oRLbsCJ0XNO95IUlLYPX8zc3lXhnU2+2ymELoKOf/0nY+wfuL5j4dtTaTcGoZ+jy68lwasOiUAYw+K2lLK/qXmX3luLZENVq/MjkPNuprDBXk8CHWxBokBEmUWlTToF1vyP5hfpPA9rtgM7/jfvrVYTX0qNGT1u+8jvtsR8sfGCqpJDE/s83K4Ov8/mykCSnqRNUh+hhzEsezmgCynGs+3NqwTjf47EaB6/GDt8zT2loweDjgwk7Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB7372.namprd11.prod.outlook.com (2603:10b6:610:145::15)
 by IA3PR11MB9373.namprd11.prod.outlook.com (2603:10b6:208:57f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 13:01:02 +0000
Received: from CH3PR11MB7372.namprd11.prod.outlook.com
 ([fe80::172e:2e0:9ec1:b61e]) by CH3PR11MB7372.namprd11.prod.outlook.com
 ([fe80::172e:2e0:9ec1:b61e%7]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 13:01:02 +0000
From: "Sahoo, Pritam Srichandan" <PritamSrichandan.Sahoo@windriver.com>
To: Yoann Congal <yoann.congal@smile.fr>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "Term Zhao, Yi"
	<Yi.Zhao@windriver.com>,
        "Komati, Shiva" <Shiva.Komati@windriver.com>,
        "Term
 Chen, Qi" <Qi.Chen@windriver.com>,
        "Chen, Libo (CN)"
	<Libo.Chen.CN@windriver.com>,
        "Term Wang, Jinfeng (CN)"
	<Jinfeng.Wang.CN@windriver.com>,
        "Masih, Shailesh"
	<Shailesh.Masih@windriver.com>,
        "Holmberg, Tomas"
	<Tomas.Holmberg@windriver.com>,
        "Term Yan, Haixiao (CN)"
	<Haixiao.Yan.CN@windriver.com>
Subject: Re: [wrynose][PATCH v2 0/2] gnutls: fix CVE-2026-33846
Thread-Topic: [wrynose][PATCH v2 0/2] gnutls: fix CVE-2026-33846
Thread-Index: AQHdD2QsuvOR2/Kx9Eu9xaDYAMYenbZk3SgAgABJ4o8=
Date: Thu, 9 Jul 2026 13:01:02 +0000
Message-ID: 
 <CH3PR11MB7372DA5EE39BC4F2383F80439BFE2@CH3PR11MB7372.namprd11.prod.outlook.com>
References: <20260709053106.1630373-1-PritamSrichandan.Sahoo@windriver.com>
 <DJTWIYN2I01L.2JFKT13QMGQS6@smile.fr>
In-Reply-To: <DJTWIYN2I01L.2JFKT13QMGQS6@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-07-09T13:02:44.811Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7372:EE_|IA3PR11MB9373:EE_
x-ms-office365-filtering-correlation-id: f5b46e67-642b-4afd-803d-08deddba2128
x-ld-processed: 8ddb2873-a1ad-4a18-ae4e-4644631433be,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|10070799003|1800799024|23010399003|376014|38070700021|22082099003|18002099003|56012099006|4143699003|8096899003|11063799006|13003099007;
x-microsoft-antispam-message-info: 
 pEdeBDpVv0fCgR2gMqbQETvM/kxgSt08/CjZeSA43hCmFwc78WtXbGnbcl3f3BT3Enr7zrqgeAorGY3gaXQA4Nhs5+NhkenMcuaAboErx+LTaV5oO5MTKQTu1oQ7EWb/XP3+b3I443yxw8C6J1pABDXIFf27CVLhywOVyFl4pGux16/WfcjizwoB1LiplHK8LzFPzmIX44dvCSbEvfboj2q3bg2+0ExvReHpImHinHkT8oVPZGtSr8g6cl/Dr/EzIGSRpXSN7C0Gr5qyFJANx1+aIUWLxwOTbmZFFbfWJFZX1V4OSm8Q13QJtrLLOUU6Zpw8TphCKsT9zwk8A/FlsNnmDJxWfMIb2wWi7v0UyDZKZoOYS+0o1rrbeLKLIVE9Swnh49AS02TAOJtQDy1Lyyz+m9ypkzqydeT9+fIvBGXD4gwQ29k9QqFFfg9ZVKV4qTnV+Lb77ih73RQYLdFJ3FOp+pDt35IeQOalzLhlRs4nCGRD4kqPSoyy4rYTNTARlLNl28zk4ksIV3kknnWDZjkIBQEpEapZvzGHOhkOGzTqL5yLTiKlGw8mXt9NJrHTOwkpFXAVG6EAe8kDBqpaRoulaKWsDc3GeD3j5o4t7A1ATxXD/BvdewOOjVJEoVZ3nhXEEriT7Fs2HErti30hH4HbATVKBjZNJ205RYgzaG0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7372.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(23010399003)(376014)(38070700021)(22082099003)(18002099003)(56012099006)(4143699003)(8096899003)(11063799006)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Dpqx6aKelOwvEKmpttKf7Rz0tc/uQzRbjyIV0D6+q8heAxmOrLAEblHaHXxZ?=
 =?us-ascii?Q?RJMSyVQilsjzovyltml7dO298S6F7Ua9ay8Rzzw1XsyQba5kP3bJa/7EDCkr?=
 =?us-ascii?Q?XJV9LY+idk4OF/0Z7pxw9YOjF/cWwMivmZS7plJeu8cd5dN0PsnDtUCY2gIU?=
 =?us-ascii?Q?Ly9BMebZ8spDRei3OB5vgkc2PtS5eCDMXyS6wXFWw3E2OwDTYy1gmFKPs2Iw?=
 =?us-ascii?Q?FZdiZV8Cf0dzXJLWTcrV+PXx1CEMXPADzqByoVZfTkhhqiLjbSElgUcAxDMl?=
 =?us-ascii?Q?P4Ju1A+4iCFDOIpleE7SMS+cqh9/5jBBmwcpHKEHnKL71kRCWYyT4xlS4Yth?=
 =?us-ascii?Q?2EaskHFWt7jGWWkjrI22I6VpkbpoQdr6GYWG74FgmBQ50JZIkgL5Su6/A2H5?=
 =?us-ascii?Q?Tuqnmy+TTZcy+Rmmkzf0enavoSuICsplrpv8qkIzUphuNtXBbNpecA/nKJBR?=
 =?us-ascii?Q?OvwJydoiAIR3x0GkahJMunRmCCGKX5TaVqqMwIgfwvh+5MVbgxja51l4xGIL?=
 =?us-ascii?Q?+DBqhQ9jSoWzJLPN3jUjC0boVNpAdJWJ98onCuYo2yfp3KFYNWBs+pIvAb14?=
 =?us-ascii?Q?ORUJNCm75CTnKU254+oPEdFf7tUzJ1CdM7HHlVOLS7fVSrLdgk55ilciMuD5?=
 =?us-ascii?Q?0zpM62ENAuxhr7rLDrFizoXTZ6Fk4kjLvgzoxv2+/JIEZHmD7ewSC0tRvIwd?=
 =?us-ascii?Q?oC0IlJ5L6rT1r5/XUswlKhS838RzNidguoH0cbExBBTMQ83yfQxFXEESRsje?=
 =?us-ascii?Q?rQyDQxoudiuzu92MIztl8eFPt5XtHztlpiRM8E2lZc5GQdSrB3PlBtZLUi6o?=
 =?us-ascii?Q?47TPS/N1W1O6ESCvv9FROnqSfTDs/1aFprfAL63h+dApcY/rMisKRl7gh/Xh?=
 =?us-ascii?Q?taggENSuHa5KI3AjAygulBjel8WEMZ5MBEuQMTZbqZVyzJ8u5q6qKsgkoiJO?=
 =?us-ascii?Q?/zwQYxPm4ijrOTkRIiG+3+3PJsr35nmnTfhZ9IuqL31lhmPJPJoZK9tnCThp?=
 =?us-ascii?Q?wte16ts6fMEUm5vRISczD7c201OLRdkQGFKPP59AIBkYu9fyKKq7cGEg87+O?=
 =?us-ascii?Q?ZHyr8hfKgX9yfipmpjK0bUS5Ljt50Rvbh/ayaGl79n4XGwWCDgI+xvK7Yebc?=
 =?us-ascii?Q?Xfe3cwgKjZZwp/0mvyj0AtiEEf7XHJCBm7/ZAOaAzmIfbfs/L8Jueuw9Jxbu?=
 =?us-ascii?Q?4w/CAmwjhKWC9dzyyx4IBzzPsNw8NDgOvqHpqkU8vzSVy1cTpi46T6COHbbl?=
 =?us-ascii?Q?aTB3bzoN7tTMDGHYyEc+zmJemj+Or5cKcK57eOK8STcJsSIPjdJvSe27vxuy?=
 =?us-ascii?Q?VDSl/xESQl1H1qtCOtiLiTzAvvZXpbQgb3taefpoS3UUEvEhNWsGRP7lYohd?=
 =?us-ascii?Q?2IWAWqZfc+ACGmsplV9lUXfOXuIeq86Pp0WynjfBE4nEWVCxIhw6fgfN6/+D?=
 =?us-ascii?Q?V/yYeThSNoC6sA4f5vBtAbJyiWy25prDhquuNmQJc4YVx3QKKNCtfMJkg8Uw?=
 =?us-ascii?Q?WTl06SYheAo0ox9pwzFHX75Nb320kNPUqDBTaIGNJseceHcLXK83kSm1K5hD?=
 =?us-ascii?Q?cC+eDktjGu7Vifl06HTCTHVDtzwQYV3Kt0o3mEP3EpY9k0tG34EaQqXRksP0?=
 =?us-ascii?Q?++NsfWpZUL31kB4RoaMDnmeVU5dBl40BlwhORB6ohTDOG7lNLX4uy4aU0wAJ?=
 =?us-ascii?Q?AoDwXQybfIbDnQ11mE+ajbf/PgRCez1dh70fzeQPXzund0OFTeckx3zgwAO6?=
 =?us-ascii?Q?1eMSzkXtVWNuCJJgUgZm6w0qHWbA3gvtyMBIUJb50O3aG8upEqTEdeqLs8cI?=
x-ms-exchange-antispam-messagedata-1: V6HyWZFVlB0FhM1wE8FFx4BKU1Thc3OKumY=
Content-Type: multipart/alternative;
	boundary="_000_CH3PR11MB7372DA5EE39BC4F2383F80439BFE2CH3PR11MB7372namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	SW9z7UVrCSw2ZGttysAe9NKRO2dzvssaiY7/UEem+eMo+dtS7B/w8qY7ueiWBBwHJqPDA6TZg9BHedDqsgsQrBMcRw3ad7gh1TxIS2IyBtbgQ9TURE33qAWGDgcRXVD2mqRR6K0lkx33qCpwJR0aWdEKGiyvh316GZxPNqVViep0fFQAJb+/uFUtBqa5AjjfIBWImYOH6WFdUhfZi9hN7ulYbzebhn0Fi/yd8aS08ZX0IK32yCD9dOXIa+Sbc/fa2XKY2+Np2dvtCWRvYMXxsGz4ItAkEle6czZOVdS6cB5fiGT+VN37pd9uXP9RS4voYEto6ZF2Xjp9Ev9RsSawMQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b46e67-642b-4afd-803d-08deddba2128
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 13:01:02.1998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D9hXY+Cwmc2AT6Rl6hKIl22UaPr/oxeUP1K/b6tMj1SI7fL/vcEJqi7RxVU/Dv4ul7xlym4pUwYSagk8H58MBcI4eerfHYzSYAInCM5xN9c/9/jNnftEKCju9Zouahk9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9373
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: shFRKMOh3n53dRBV1RCYVTenSjXzuK1L
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyNiBTYWx0ZWRfX5bO+8MKAVQBi
 7dBZnLPOGTFn1f+P9LEd1tRJ7h9VkFpkpjZ2q1Cvq6IwNFhL3QXNIldHbDmG0H/oYwovjhBZJ/k
 aDC/UzW2Zk/K0x4bJUAuy0V9M52uIy/ZUxWMeg7hdaXrKjLOUsQT
X-Authority-Analysis: v=2.4 cv=XIkAjwhE c=1 sm=1 tr=0 ts=6a4f9b96 cx=c_pps
 a=/NeaHkXls/iJsjBnUIdqww==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9
 a=CjuIK1q_8ugA:10 a=H-DuLdEmo-TWDic6:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: cvtGmerIwXLGEvdCWRTzWCPt5Q-qtW_D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyNiBTYWx0ZWRfX9s+J6QHDz0ic
 RRPQI3Lv/Cx22S82vqcM5klMJauRKxicxbyH9OEZiHvzUqP+fhTmgexI8qzGiRP+/+F/LWgAt4p
 aov54WV+ip4yE9b0gbXOGf1EuY0GAN8Wwog1DHOFAJTPQAqiBjuXSviNC58/zSp2GZrxLHEe11A
 SAkm+2U9/LoLTEnK0HJS9TyrBUv0a19NapCVm3qtlDq2eICmRGeY6qjmifrM4B6T8LwNsXSdRrU
 ndbHRp0RkWEz5Wd/CGbht71eS0TZ7IZv1M1B6ys78kfS6yl9tO5ZRNln18bQRQMiSOQptxm+x9V
 6Al6kzHc7j4edQnJdDrdJppqFW0MzWG4oh15WlUDmki97/lizo+cWiA0OtfinP7kiJkM7ygmkEZ
 CyVdwj0SrTyvAVdeXrfqFbkhhSxJOcCBJN1h6snGwoAdw/rmBdjsTGBAVN2mDlh4a93i/BfKHn8
 gqiV863PEs1bbV/GA1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 13:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240580

--_000_CH3PR11MB7372DA5EE39BC4F2383F80439BFE2CH3PR11MB7372namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for letting me know. I've now subscribed to the list.

Thanks,
Pritam Srichandan Sahoo
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Thursday, July 9, 2026 14:06
To: Sahoo, Pritam Srichandan <PritamSrichandan.Sahoo@windriver.com>; openem=
bedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.or=
g>
Cc: MacLeod, Randy <Randy.MacLeod@windriver.com>; Term Zhao, Yi <Yi.Zhao@wi=
ndriver.com>; Komati, Shiva <Shiva.Komati@windriver.com>; Term Chen, Qi <Qi=
.Chen@windriver.com>; Chen, Libo (CN) <Libo.Chen.CN@windriver.com>; Term Wa=
ng, Jinfeng (CN) <Jinfeng.Wang.CN@windriver.com>; Masih, Shailesh <Shailesh=
.Masih@windriver.com>; Holmberg, Tomas <Tomas.Holmberg@windriver.com>; Term=
 Yan, Haixiao (CN) <Haixiao.Yan.CN@windriver.com>
Subject: Re: [wrynose][PATCH v2 0/2] gnutls: fix CVE-2026-33846

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Thu Jul 9, 2026 at 7:31 AM CEST, Pritam Srichandan Sahoo wrote:
> Changes in v2:
> - Added a separate commit to fix musl build failure for the
>   mini-dtls-fragments test (missing LDADD for gnulib).
>
> v1:
> - Only contained the CVE fix. The musl build failed due to
>   missing link to gnulib in the new test binary.
>
> v2:
> - Added the musl build fix as a separate commit. Build now
>   succeeds with musl.
>
> Tested with:
>   echo 'MACHINE =3D "qemuarm64"' >> conf/local.conf
>   echo 'TCLIBC =3D "musl"' >> conf/local.conf
>   bitbake gnutls
>
> Pritam Srichandan Sahoo (2):
>   gnutls: fix CVE-2026-33846
>   gnutls: link mini-dtls-fragments test to gnulib
>
>  ...ts-mini-dtls-framents-link-to-gnulib.patch |  25 +
>  .../gnutls/gnutls/CVE-2026-33846.patch        | 862 ++++++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   2 +
>  3 files changed, 889 insertions(+)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-mini-dt=
ls-framents-link-to-gnulib.patch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846.pat=
ch

Hello,

This series never reached lore
https://lore.kernel.org/all/20260709053106.1630373-1-PritamSrichandan.Sahoo=
@windriver.com/
And, by extention patchwork I use to track patch.

Before sending the upgraded version, please check that you are a member
of the list: https://lists.openembedded.org/g/openembedded-core sould
display " You are subscribed to this group."

Thanks!
--
Yoann Congal
Smile ECS


--_000_CH3PR11MB7372DA5EE39BC4F2383F80439BFE2CH3PR11MB7372namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks for letting me know. I've now subscribed to the list.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Pritam Srichandan Sahoo</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Thursday, July 9, 2026 14:06<br>
<b>To:</b> Sahoo, Pritam Srichandan &lt;PritamSrichandan.Sahoo@windriver.co=
m&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@lists=
.openembedded.org&gt;<br>
<b>Cc:</b> MacLeod, Randy &lt;Randy.MacLeod@windriver.com&gt;; Term Zhao, Y=
i &lt;Yi.Zhao@windriver.com&gt;; Komati, Shiva &lt;Shiva.Komati@windriver.c=
om&gt;; Term Chen, Qi &lt;Qi.Chen@windriver.com&gt;; Chen, Libo (CN) &lt;Li=
bo.Chen.CN@windriver.com&gt;; Term Wang, Jinfeng (CN) &lt;Jinfeng.Wang.CN@w=
indriver.com&gt;;
 Masih, Shailesh &lt;Shailesh.Masih@windriver.com&gt;; Holmberg, Tomas &lt;=
Tomas.Holmberg@windriver.com&gt;; Term Yan, Haixiao (CN) &lt;Haixiao.Yan.CN=
@windriver.com&gt;<br>
<b>Subject:</b> Re: [wrynose][PATCH v2 0/2] gnutls: fix CVE-2026-33846</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Thu Jul 9, 2026 at 7:31 AM CEST, Pritam Srichandan Sahoo wrote:<br>
&gt; Changes in v2:<br>
&gt; - Added a separate commit to fix musl build failure for the<br>
&gt;&nbsp;&nbsp; mini-dtls-fragments test (missing LDADD for gnulib).<br>
&gt;<br>
&gt; v1:<br>
&gt; - Only contained the CVE fix. The musl build failed due to<br>
&gt;&nbsp;&nbsp; missing link to gnulib in the new test binary.<br>
&gt;<br>
&gt; v2:<br>
&gt; - Added the musl build fix as a separate commit. Build now<br>
&gt;&nbsp;&nbsp; succeeds with musl.<br>
&gt;<br>
&gt; Tested with:<br>
&gt;&nbsp;&nbsp; echo 'MACHINE =3D &quot;qemuarm64&quot;' &gt;&gt; conf/loc=
al.conf<br>
&gt;&nbsp;&nbsp; echo 'TCLIBC =3D &quot;musl&quot;' &gt;&gt; conf/local.con=
f<br>
&gt;&nbsp;&nbsp; bitbake gnutls<br>
&gt;<br>
&gt; Pritam Srichandan Sahoo (2):<br>
&gt;&nbsp;&nbsp; gnutls: fix CVE-2026-33846<br>
&gt;&nbsp;&nbsp; gnutls: link mini-dtls-fragments test to gnulib<br>
&gt;<br>
&gt;&nbsp; ...ts-mini-dtls-framents-link-to-gnulib.patch |&nbsp; 25 +<br>
&gt;&nbsp; .../gnutls/gnutls/CVE-2026-33846.patch&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 862 ++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-support/gnutls/gnutls_3.8.12.bb&nbsp; |&nbsp;&nbsp;=
 2 +<br>
&gt;&nbsp; 3 files changed, 889 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests=
-mini-dtls-framents-link-to-gnulib.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3=
3846.patch<br>
<br>
Hello,<br>
<br>
This series never reached lore<br>
<a href=3D"https://lore.kernel.org/all/20260709053106.1630373-1-PritamSrich=
andan.Sahoo@windriver.com/">https://lore.kernel.org/all/20260709053106.1630=
373-1-PritamSrichandan.Sahoo@windriver.com/</a><br>
And, by extention patchwork I use to track patch.<br>
<br>
Before sending the upgraded version, please check that you are a member<br>
of the list: <a href=3D"https://lists.openembedded.org/g/openembedded-core"=
>https://lists.openembedded.org/g/openembedded-core</a> sould<br>
display &quot; You are subscribed to this group.&quot;<br>
<br>
Thanks!<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CH3PR11MB7372DA5EE39BC4F2383F80439BFE2CH3PR11MB7372namp_--

