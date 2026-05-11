Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DFBCD37BE
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 12:50:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48980.1778503831602119506
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 05:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PMsLAj/o;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9591002d8a=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5SWtq561992
	for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 05:50:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=qp7MVazAwm9Sq5+5m3ppp7
	Mwj5qjD2NedpqeMUNa+18=; b=PMsLAj/oEy9jdhLQhvusXwx+MYM8Sn7tNboJHr
	JIp2euexJhbyQVLzDJz6raUwKoD/g1D55g6sSHsSQNMsCUJt+eWCCW0J3pfoowkH
	QqYUMLrrDyaJM3DuowWqGmdHqHKVbuxMBkbj9BIHG8Y0Sn0nrvSPTBSPRo0DDx0C
	FAhm9JQPhDKMAP09bvuqL3eX0pruxUX6BPxILET0ElL3iLYPh7UHIwQHMyDOB1qc
	+MxM9PdYujh7L6Yw4FzPdXqKFO4ohCRKjHZuDr4d0O/XLzpChKag5ELDU5WKmwFL
	GJMtCcWGTcJxF3rYKVpia/SgdfBhGKbxEoID43+cKTpyXiyw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012016.outbound.protection.outlook.com [52.101.48.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e206xstu6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 05:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTaVhuiYONx71cSD6tNGWWILAk3mkDZ7PawPHRkuG7KBNI9arwCTRwWFMJdU7+jO3NyYokB8I2BKtxm1XilmaPaUZi2oCvrnQsyOK5IHJjk5CZnU8B0I6i6GOhAppAeTxk6H90JHJUJJjqOdWoKOMFTOEMI9yk/xhfOzS3L9tI2DOZ20MapcsaLljJ+b26GDj5ziWswjFCccMOw0fxZPIRt9tUuINazi3AIx8olRMO8k31MhuvS48xAhp550wHR6nKUD7HktIFNBO6MIm1CpFPMqKeJEHnbanYe0WuP+4HpsLuJH5QKfFUM36VtC9gV3nF8HfHBxarcrZy91wDZkCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qp7MVazAwm9Sq5+5m3ppp7Mwj5qjD2NedpqeMUNa+18=;
 b=Bcct8DqnSb/FiQ7K80QN1Ql0W7SVaT3demAGMqOwbHpqlR1t5IMQd6MeIxPyida2QVsxXh82gLoHq/w4GULqa/WKjw41RlT05xZh8AMLK9lrrEcVBcG3/c3JNz6vm8eJKc0lzmya38Aeipvln3fSDCokD9yaAfO/7nnpUKDxVpoD3ERwrUcSqjqnrTiWw/uMzOhxkEMZraAaqcM8ZFU9U+jEQEno9p6ICKqoPAUklgzgSWLy4NBeEL2bWpqKHdcToAF3kxYpu6pGPE1owpt77Q1LSGAJqGfHPuMa4jpLzmyqjBqVTujXBGqj6HDmcg1d8U4yV0oOL5O84lqNDiX+IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by SA1PR11MB8426.namprd11.prod.outlook.com
 (2603:10b6:806:38d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 12:50:26 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%8]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 12:50:26 +0000
From: "Chi, Zhixiong" <Zhixiong.Chi@windriver.com>
To: Yoann Congal <yoann.congal@smile.fr>
CC: "Zhang, Xiao" <xiao.zhang@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] oe-selftest: Add static postgres user/group
 for reproducible build test
Thread-Topic: [OE-core] [PATCH v2] oe-selftest: Add static postgres user/group
 for reproducible build test
Thread-Index: AQHc0V2LlOxVse6WfkC+td3rStoc+7XpJL8AgB+mNQCAABZggIAABKvj
Date: Mon, 11 May 2026 12:50:26 +0000
Message-ID: 
 <DS4PPF75D68BA1BA0D98FED384C3CC6E1059B382@DS4PPF75D68BA1B.namprd11.prod.outlook.com>
References: <20260421070646.1290375-1-xiao.zhang@windriver.com>
 <DHYO49JUR52Y.1OUCD7ZQJ693R@smile.fr>
 <d828c167-5671-4370-b122-b25f23003812@windriver.com>
 <CAMSfU+6fwoiPFXSFRU3MuDXizEbyjgu4gySeVx2gwdY9QDZJVQ@mail.gmail.com>
In-Reply-To: 
 <CAMSfU+6fwoiPFXSFRU3MuDXizEbyjgu4gySeVx2gwdY9QDZJVQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-05-11T12:50:25.799Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF75D68BA1B:EE_|SA1PR11MB8426:EE_
x-ms-office365-filtering-correlation-id: 32f9ea3f-3a0b-4217-16de-08deaf5bdfc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|8096899003|18002099003|11063799003|13003099007|38070700021|56012099003|22082099003;
x-microsoft-antispam-message-info: 
 MyusDQ9kH+9grNfw6mtQDGUUUkZ3nR4ZsZZftPu0KSSPYHE5ik6ZhupbUujVnMdOSsH0dOxeB6iuieSQvCCREi37NbRkDHaX1HjL9eD4gvAXmeuedZMtneBhL7Y3kl/0aEMuUZzng4lL278bU7vFGSqeHZmt4ivKn6osF6CpWGhF81Q4ByE+o7nekdvVhvIq/GZCSXk9hox+oefjot/ARslxJNwnt+/TvsJw3DVwvHrbb/mVxbjwW6F1jBiCpckOnV3uJNvUV2SfXtN9K6I6pocbmjWSIpv0ByIZlBmE7VVPGJfCDVBfkVAzzuxFUpbY+XoVeq6NlNv3s88kQk0Q64ynlF8Az/98u3G+O1zzU3yJvPJNWQe/JNezgxMR1MEuW2Jn+/TeQ6UbF1ORF36TMhZ7hOcHoHzJQFvIH383RKXEHCumjikmPWAeFT9cuuaWTbQiFEoebVIKmct/NIaS2NIfJhF9leheVxDNsjiT6l+MaHGa5ZltnZA0kivRVP6gRjxRfGYm7IWN9VqU6ruJfjDjxWrrGeZlo+ISCR3toLG1mhObDizyWMNij93dqKJg36Wx42qJGBldmao3xNfDbHhPUnq3GtBM71dQ/HI97lPBjpO5oc3sDPytLxGat896dayObXSebLjFX1iiLRcawflEfBU7gkTEJIbYTd0B+IaLVXwA4Qeb9qyxeN85WscB
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(8096899003)(18002099003)(11063799003)(13003099007)(38070700021)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?091noYnyorFg2Hfy1NSW24G8sRELRWCU4WQdvj3TlWACw1sp7GsOo5qwkf?=
 =?iso-8859-1?Q?gvK90+QYMaEj2GW6WA4AFQ3KqSrmTAVb3dhvbx6bk7TGHO88mON86IH3X5?=
 =?iso-8859-1?Q?N3I6yjAHSAA7bmp64PLOZFqzg0IOeBBIZfiJgX1BB2+j7IgKImFEG+HLbO?=
 =?iso-8859-1?Q?is+descnDoXudVAqPYkdtoeP/EP//oWqCvEepQb9rwsqJEmmMMcjXHHHSL?=
 =?iso-8859-1?Q?edabBQDfzCv0ztxX0Z3MfTwi5Agr+YNU6pvWN6ooPi9fbCw9y2DZ7o7S3A?=
 =?iso-8859-1?Q?MmrTqlp8In8kJrQ/ygLwKYUXuAroIJDZWDtVO/w9JEJKQOjPkWBS0sNWDA?=
 =?iso-8859-1?Q?vACFMCnNNRkYTyYENKQhi0AtUzVBozKacvGaXFjPME1C+7UDjI4klKvOWF?=
 =?iso-8859-1?Q?buaSs7w9Xml7Vw6NdFeJv3xWIorY+gNWFOn+W+b25cx8WWbKJJ2ymweeI7?=
 =?iso-8859-1?Q?bmgD5+Yc0MB4Gq3ZrEoX+PEBG8FVhUqTqEo+M4o4jyF5MALliWAogCPCUb?=
 =?iso-8859-1?Q?sgrc8rtSjWs2gSqck7uzfaZ4gxWTDXB+WZqbVfPnPPkoIAZVGgwnwHgZ/p?=
 =?iso-8859-1?Q?gbl+GHIRDIniVobRpSElr04TNX+Yxrpzy2wsARV1dOXQ1ZkQSOSAofEess?=
 =?iso-8859-1?Q?q1oJeAIn1buAIsSigx7LT0dixXcQgTE2m3uds1GJVYHXeAMwq9wnAszNs/?=
 =?iso-8859-1?Q?5G/uxru2mK5cXDUJf1T7ntXt4RNTvza+cWw0DLszqOzNDko/7mjYC829Q9?=
 =?iso-8859-1?Q?GRKxtDlmAUfRX5SxDnK3Jv3vU1CFFJvBjWgtgSZJk0Eo7e2+2ncAA+LCqb?=
 =?iso-8859-1?Q?gLFdvGz9cMkKScdhVlUzj9jSb3gZvNDx6ac68VQISnpjh/qcJgSOJhrKQm?=
 =?iso-8859-1?Q?+kmxSThTLs2dx3qL4711bf0A1AaNS/c/UjF0tkXqEJof1vNc1WwSmyIQwZ?=
 =?iso-8859-1?Q?jNNhnn0FErIlCDxECpJAIF3v0wfqz4DZDQwb8Ug4h+3L8Bn9f9Rp7+lnjs?=
 =?iso-8859-1?Q?pzEk6TELqVcWi9nyA+K3gLGjFUR2jVReoa+l68v13EPDpFQoJN/oomeiL9?=
 =?iso-8859-1?Q?2bmMCSOEYFVpUvFucE5/qZogH4+OIqdbEgiB8pcxqZOFqooHV6ttwcVakp?=
 =?iso-8859-1?Q?pr7u5koZsBe4cjj8EimXoAYDtuakBppycRO9LWLsFYCPe52DKQnlUZOKdF?=
 =?iso-8859-1?Q?B3jbnHArn/g84QWh1uInaXkQFGDKanwdu9trk6qKngLWzEHgEJxon8Ik+W?=
 =?iso-8859-1?Q?Jq/1KSZloHeajyyU1DGKdMqRG/HoXs0MAdprDWEFLiZaJaZyTnDea6+LJ9?=
 =?iso-8859-1?Q?L+cA+WZC/4Q/h8LAZupVxv9rPaMX3ttKJu/kxnUo7j/a4A8udY8dvrjtga?=
 =?iso-8859-1?Q?kwFPRm7plJIqFlmHl4/jEHBb4+KusUbW4FTnp55TgoRdZTlMk7BIm+AUkP?=
 =?iso-8859-1?Q?foOurUBudaghqbPexhm0qFzYrcu8CoEgGKnVZEAcKwQaKyQWcs1yeDvJ66?=
 =?iso-8859-1?Q?HSYTDOJLLRxqNjgSZ8pfKKXpnroVbp1s9uAXtMfMbl85zkN8O0ydGuWdaI?=
 =?iso-8859-1?Q?U34N6wHCiE5Zr1Y8fpHCngu0HLO9tNghnrlLhudqMmZp8ykwsY+Qqto0Mq?=
 =?iso-8859-1?Q?5uCD0I1I1FdPSINnoPLK6+ocKPKxyDKFLN1PAd52eN/Ywbassqz/gg1Htz?=
 =?iso-8859-1?Q?nAfQrMegmVCXmlRgF3Mi28l1qjoPMQVlzovsr+89WbuKECtS5x/w0qhpsc?=
 =?iso-8859-1?Q?RK9idDW8u+DCnh8R2JG899KmFH4Qk4Qt/1C6YoDhBxMWTTksBBqfruZDe0?=
 =?iso-8859-1?Q?jWhtcLqIOA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DS4PPF75D68BA1BA0D98FED384C3CC6E1059B382DS4PPF75D68BA1B_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	BUp6lS/MqVfKGVHuyzUBB2wtvL0f+PmYlwSXzvJzKAQtLtuHTeb5hZFJD6fdGRomj2BMAiBGwHroqWhUXfJ44g5Wjsizf1CPwDfDvD94m0baAIptsHdR6DPwOQSbvqBOeQBRVmGIVCU6fQDa2zaUQFgO5gqULF/3yTb5bFpZQZEU96GXcgs7x3yfxkcA6UTtHEmfwYMrhqkUlu9RoO16byynFEU+ooq2pQHdLYYQbo3IcFoY3olEBkJu3AXDTWeVV1AYPDL3pWMGBZ00pEwuFy+2Ekiu+uFjHlDbZLMV4AnEKJcf30gtbLsp/Mf9+pG2BtIkXpf7AylaHnu22i0KTw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f9ea3f-3a0b-4217-16de-08deaf5bdfc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 12:50:26.4101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0loEvt0L6lx/U5wMo5bdjhyvmYVS4ThoVAodYyEAr00CPxh7+SEfgVmc5ywzQbH+axKGZCWTFxe8221lJ8c34gevFyLcAUBD9asZRqBTxmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8426
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0MiBTYWx0ZWRfX8XFjA81qCTJ5
 9SX4vprGPRlu4tvsa1HyRHznquwHnL5WMqXJWwYlYQSYeB9ze5XXGPj4hIjwyT7nT8YVvNH49Dd
 tjTZFdHjjlEtfK2+4xIQ1Af9Gb7QRe5CVDMcrdDLjp2ZR94+HhlFDgUCrEExwAayEFjPKnp0BWb
 RkIZOaxaT3DHkpZfVCEoRpAjsoK9SKxC4yUJLfr8EB0Q/tdURkmd2hubCmrB1IFQHWDSiskeRi2
 +irCzQFdDNrlge3wu/hGwR4aPYUmWvTCn5l3f6gJtdexYX3v6o6CASZDHUF/yGYeYPh4iY0W8N5
 CyKy3N7U/X011oWwS66lAlynsemMYArKtkTeo8nAAmN0/3dGIjVOcNG3gHEg57iURwVRwqOccUO
 HhS/UsFLOndVRtdmH/I0yDbLPFYS1gRMi26nw2Jck8kvDJNnRZtkku3U/yv7OtbdYAfJIHec28u
 0/Fmv7ud60hVGm9ie9A==
X-Proofpoint-ORIG-GUID: otaXaXAPq8ETaeaq8FBcjDPvWVuekT0P
X-Authority-Analysis: v=2.4 cv=CJMamxrD c=1 sm=1 tr=0 ts=6a01d096 cx=c_pps
 a=V6LhDW2JNEJwPIi/f6b7qA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=t7CeM3EgAAAA:8 a=3Ws2gRySAAAA:8 a=Q4-j1AaZAAAA:8 a=VwQbUJbxAAAA:8
 a=52mdeZd8sWgJSgSe30wA:9 a=lqcHg5cX4UMA:10 a=wPNLvfGTeEIA:10
 a=UBFVfQAFWYhimOpKR3UA:9 a=l8yRxNEGv2IFvJik:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=3eSsqLBzZwREk8tP_468:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: hq2gDH7Js-Ka0T_zbYazYosiDwmJGOkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110142
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 12:50:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236812

--_000_DS4PPF75D68BA1BA0D98FED384C3CC6E1059B382DS4PPF75D68BA1B_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks for your detailed explanation in the two threads.


________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Monday, May 11, 2026 20:31
To: Chi, Zhixiong <Zhixiong.Chi@windriver.com>
Cc: Zhang, Xiao <xiao.zhang@windriver.com>; openembedded-core@lists.openemb=
edded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] oe-selftest: Add static postgres user/gro=
up for reproducible build test

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.
Le lun. 11 mai 2026 =E0 05:11, Chi, Zhixiong <zhixiong.chi@windriver.com<ma=
ilto:zhixiong.chi@windriver.com>> a =E9crit :

Hi Yoann,

Given only static-group and static-passwd are added at meta/lib/oeqa/selfte=
st/cases/reproducible.py<https://urldefense.com/v3/__http://reproducible.py=
__;!!AjveYdw8EvQ!Yt21GdLk9VztwQ8MtvSv8JVtmJIzN-WRvKtyQ1YyeSFO0k8VdjT96q8UoU=
UOicvYNdf-bPoUrmi76Q8IhRWyHrF6kx4OxA$> in oe-core

as the commit https://git.openembedded.org/openembedded-core/commit/meta/li=
b/oeqa/selftest/cases/reproducible.py?id=3D77397bace64dfd03e704400fea918d93=
f00d0bf7<https://urldefense.com/v3/__https://git.openembedded.org/openembed=
ded-core/commit/meta/lib/oeqa/selftest/cases/reproducible.py?id=3D77397bace=
64dfd03e704400fea918d93f00d0bf7__;!!AjveYdw8EvQ!Yt21GdLk9VztwQ8MtvSv8JVtmJI=
zN-WRvKtyQ1YyeSFO0k8VdjT96q8UoUUOicvYNdf-bPoUrmi76Q8IhRWyHrGSocaO2A$>,

the static-{group,passwd} in meta-openembedded/meta-* layers are not includ=
ed(eg: static-group-meta-oe/static-passwd-meta-oe).

I encounter the same issue during reproducible testing

So how to expand the USERADD_GID_TABLES and USERADD_UID_TABLES to add the s=
tatic files in meta-openembedded to avoid the static id not defined issue.

Generally I run "oe-selftest -r reproducible.ReproducibleTests.test_reprodu=
cible_builds", export the env variable USERADD_GID_TABLES and USERADD_UID_T=
ABLES or the other method we already have defined in yocto?

See my answer in another thread: https://lore.kernel.org/openembedded-devel=
/DIFRRVJB4CS3.23NBKWDDVT9ZB@smile.fr/T/#m79d4e29f5b1b2651cd9382b85e9b5d09f5=
465b0c<https://urldefense.com/v3/__https://lore.kernel.org/openembedded-dev=
el/DIFRRVJB4CS3.23NBKWDDVT9ZB@smile.fr/T/*m79d4e29f5b1b2651cd9382b85e9b5d09=
f5465b0c__;Iw!!AjveYdw8EvQ!Yt21GdLk9VztwQ8MtvSv8JVtmJIzN-WRvKtyQ1YyeSFO0k8V=
djT96q8UoUUOicvYNdf-bPoUrmi76Q8IhRWyHrF79dSvig$>

But, basically, you can write (in your local.conf or equivalent):
USERADD_UID_TABLES:append =3D ' files/static-passwd-meta-gnome'
USERADD_GID_TABLES:append =3D ' files/static-group-meta-networking'
USERADD_UID_TABLES:append =3D ' files/static-passwd-meta-networking'
USERADD_GID_TABLES:append =3D ' files/static-group-meta-oe'
USERADD_UID_TABLES:append =3D ' files/static-passwd-meta-oe'

Regards,


Thanks.

On 4/21/26 15:52, Yoann Congal via lists.openembedded.org<https://urldefens=
e.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!Yt21GdLk9VztwQ8Mtv=
Sv8JVtmJIzN-WRvKtyQ1YyeSFO0k8VdjT96q8UoUUOicvYNdf-bPoUrmi76Q8IhRWyHrERzLKMe=
g$> wrote:

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Tue Apr 21, 2026 at 9:06 AM CEST, ZhangXiao via lists.openembedded.org<h=
ttps://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!Yt=
21GdLk9VztwQ8MtvSv8JVtmJIzN-WRvKtyQ1YyeSFO0k8VdjT96q8UoUUOicvYNdf-bPoUrmi76=
Q8IhRWyHrERzLKMeg$> wrote:


This adds the static postgres UID/GID entries to static-passwd and
static-group, fixing the "Nothing PROVIDES 'postgresql'" error when
running reproducible test.

The selftest environment requires static system user IDs to ensure
build reproducibility, which was missing for the postgres user/group
before this change.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com><mailto:xiao.zhang@wind=
river.com>


Since this is a meta-oe recipe, shouldn't those static IDs be defined in
https://git.openembedded.org/meta-openembedded/tree/meta-oe/files/static-pa=
sswd-meta-oe<https://urldefense.com/v3/__https://git.openembedded.org/meta-=
openembedded/tree/meta-oe/files/static-passwd-meta-oe__;!!AjveYdw8EvQ!Yt21G=
dLk9VztwQ8MtvSv8JVtmJIzN-WRvKtyQ1YyeSFO0k8VdjT96q8UoUUOicvYNdf-bPoUrmi76Q8I=
hRWyHrGeam4qWg$>
https://git.openembedded.org/meta-openembedded/tree/meta-oe/files/static-gr=
oup-meta-oe<https://urldefense.com/v3/__https://git.openembedded.org/meta-o=
penembedded/tree/meta-oe/files/static-group-meta-oe__;!!AjveYdw8EvQ!Yt21GdL=
k9VztwQ8MtvSv8JVtmJIzN-WRvKtyQ1YyeSFO0k8VdjT96q8UoUUOicvYNdf-bPoUrmi76Q8IhR=
WyHrE0kNLQtQ$>
instead?

Regards,



---
 meta-selftest/files/static-group  | 1 +
 meta-selftest/files/static-passwd | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-=
group
index 6a9ece20a8..a08795c4ea 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -31,4 +31,5 @@ audio:x:532:
 empower:x:533:
 cmake-example:x:534:
 meson-example:x:535:
+postgres:x:536
 nogroup:x:65534:
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static=
-passwd
index 98017c8153..ba1dcd54d8 100644
--- a/meta-selftest/files/static-passwd
+++ b/meta-selftest/files/static-passwd
@@ -21,3 +21,4 @@ ptest:x:529:529::/:/bin/nologin
 xuser:x:530:530::/:/bin/nologin
 cmake-example:x:534:534::/var/lib/cmake-example:/bin/false
 meson-example:x:535:535::/var/lib/meson-example:/bin/false
+postgres:x:536:536::/:/bin/nologin


--
Yoann Congal
Smile ECS





-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#235603): https://lists.openembedded.org/g/openembedded-=
core/message/235603<https://urldefense.com/v3/__https://lists.openembedded.=
org/g/openembedded-core/message/235603__;!!AjveYdw8EvQ!Yt21GdLk9VztwQ8MtvSv=
8JVtmJIzN-WRvKtyQ1YyeSFO0k8VdjT96q8UoUUOicvYNdf-bPoUrmi76Q8IhRWyHrG4F2EVrA$=
>
Mute This Topic: https://lists.openembedded.org/mt/118934221/3618679<https:=
//urldefense.com/v3/__https://lists.openembedded.org/mt/118934221/3618679__=
;!!AjveYdw8EvQ!Yt21GdLk9VztwQ8MtvSv8JVtmJIzN-WRvKtyQ1YyeSFO0k8VdjT96q8UoUUO=
icvYNdf-bPoUrmi76Q8IhRWyHrEOSD1-Vg$>
Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openembe=
dded-core+owner@lists.openembedded.org>
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub<https=
://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/u=
nsub__;!!AjveYdw8EvQ!Yt21GdLk9VztwQ8MtvSv8JVtmJIzN-WRvKtyQ1YyeSFO0k8VdjT96q=
8UoUUOicvYNdf-bPoUrmi76Q8IhRWyHrHoYGqrKg$> [zhixiong.chi@windriver.com<mail=
to:zhixiong.chi@windriver.com>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-




--
Yoann Congal
Smile ECS

--_000_DS4PPF75D68BA1BA0D98FED384C3CC6E1059B382DS4PPF75D68BA1B_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks for your detailed explanation in the two threads.</div>
<div id=3D"appendonsend"></div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b>&nbsp;Monday, May 11, 2026 20:31<br>
<b>To:</b>&nbsp;Chi, Zhixiong &lt;Zhixiong.Chi@windriver.com&gt;<br>
<b>Cc:</b>&nbsp;Zhang, Xiao &lt;xiao.zhang@windriver.com&gt;; openembedded-=
core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt=
;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [PATCH v2] oe-selftest: Add static postg=
res user/group for reproducible build test
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"background-color: rgb(252, 252, 3); padding: 2pt; border-widt=
h: 1pt; border-style: solid; border-color: rgb(156, 101, 0);">
<span style=3D"font-size: 11pt; color: black;"><b>CAUTION: This email comes=
 from a non Wind River email account!</b></span><b><br>
</b><span style=3D"font-size: 10pt; color: black;"><b>Do not click links or=
 open attachments unless you recognize the sender and know the content is s=
afe.</b></span><b><br>
</b></div>
<div style=3D"direction: ltr;">Le&nbsp;lun. 11 mai 2026 =E0&nbsp;05:11, Chi=
, Zhixiong &lt;<a href=3D"mailto:zhixiong.chi@windriver.com" id=3D"OWA9019c=
4a1-2894-bb2f-b4c0-5111f9bb2bdb" class=3D"OWAAutoLink">zhixiong.chi@windriv=
er.com</a>&gt; a =E9crit&nbsp;:</div>
<blockquote style=3D"margin: 0px 0px 0px 0.8ex; padding-left: 1ex; border-l=
eft: 1px solid rgb(204, 204, 204);">
<div style=3D"padding-bottom: 1px;">
<p style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em;">Hi Yoann,=
</p>
<p style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em;">Given onl=
y static-group and static-passwd are added at meta/lib/oeqa/selftest/cases/=
<a href=3D"https://urldefense.com/v3/__http://reproducible.py__;!!AjveYdw8E=
vQ!Yt21GdLk9VztwQ8MtvSv8JVtmJIzN-WRvKtyQ1YyeSFO0k8VdjT96q8UoUUOicvYNdf-bPoU=
rmi76Q8IhRWyHrF6kx4OxA$" id=3D"OWA5b0d6dde-281c-6c56-40ac-87db204c06f1" cla=
ss=3D"OWAAutoLink" data-auth=3D"NotApplicable" style=3D"margin-top: 0px; ma=
rgin-bottom: 0px;">reproducible.py</a>&nbsp;in
 oe-core</p>
<p style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em;">as the co=
mmit <a href=3D"https://urldefense.com/v3/__https://git.openembedded.org/op=
enembedded-core/commit/meta/lib/oeqa/selftest/cases/reproducible.py?id=3D77=
397bace64dfd03e704400fea918d93f00d0bf7__;!!AjveYdw8EvQ!Yt21GdLk9VztwQ8MtvSv=
8JVtmJIzN-WRvKtyQ1YyeSFO0k8VdjT96q8UoUUOicvYNdf-bPoUrmi76Q8IhRWyHrGSocaO2A$=
" id=3D"OWA39cfdb3c-21d4-298e-a040-dade313bb709" class=3D"OWAAutoLink" data=
-auth=3D"NotApplicable" style=3D"margin-top: 0px; margin-bottom: 0px;">
https://git.openembedded.org/openembedded-core/commit/meta/lib/oeqa/selftes=
t/cases/reproducible.py?id=3D77397bace64dfd03e704400fea918d93f00d0bf7</a>,<=
/p>
<p style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em;">the stati=
c-{group,passwd} in meta-openembedded/meta-* layers are not included(eg: st=
atic-group-meta-oe/static-passwd-meta-oe).</p>
<p style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em;">I encount=
er the same issue during reproducible testing</p>
<p style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em;">So how to=
 expand the USERADD_GID_TABLES and USERADD_UID_TABLES to add the static fil=
es in meta-openembedded to avoid the static id not defined issue.</p>
<p style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em;">Generally=
 I run &quot;oe-selftest -r reproducible.ReproducibleTests.test_reproducibl=
e_builds&quot;, export the env variable USERADD_GID_TABLES and USERADD_UID_=
TABLES or the other method we already have defined
 in yocto?</p>
</div>
</blockquote>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;">See my answer in another thread: <a href=3D"=
https://urldefense.com/v3/__https://lore.kernel.org/openembedded-devel/DIFR=
RVJB4CS3.23NBKWDDVT9ZB@smile.fr/T/*m79d4e29f5b1b2651cd9382b85e9b5d09f5465b0=
c__;Iw!!AjveYdw8EvQ!Yt21GdLk9VztwQ8MtvSv8JVtmJIzN-WRvKtyQ1YyeSFO0k8VdjT96q8=
UoUUOicvYNdf-bPoUrmi76Q8IhRWyHrF79dSvig$" id=3D"OWAb4acc5c4-c470-21a3-9920-=
fca501f81912" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://lore.kernel.org/openembedded-devel/DIFRRVJB4CS3.23NBKWDDVT9ZB@smile=
.fr/T/#m79d4e29f5b1b2651cd9382b85e9b5d09f5465b0c</a><br>
</div>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;">But, basically, you can write (in your local=
.conf or equivalent):</div>
<div style=3D"direction: ltr;">USERADD_UID_TABLES:append =3D ' files/static=
-passwd-meta-gnome'<br>
USERADD_GID_TABLES:append =3D ' files/static-group-meta-networking'<br>
USERADD_UID_TABLES:append =3D ' files/static-passwd-meta-networking'<br>
USERADD_GID_TABLES:append =3D ' files/static-group-meta-oe'<br>
USERADD_UID_TABLES:append =3D ' files/static-passwd-meta-oe'</div>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;">Regards,</div>
<div style=3D"direction: ltr;"><br>
</div>
<blockquote style=3D"margin: 0px 0px 0px 0.8ex; padding-left: 1ex; border-l=
eft: 1px solid rgb(204, 204, 204);">
<div style=3D"padding-bottom: 1px;">
<p style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em;">Thanks.<b=
r>
</p>
<div style=3D"direction: ltr;">On 4/21/26 15:52, Yoann Congal via <a href=
=3D"https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8E=
vQ!Yt21GdLk9VztwQ8MtvSv8JVtmJIzN-WRvKtyQ1YyeSFO0k8VdjT96q8UoUUOicvYNdf-bPoU=
rmi76Q8IhRWyHrERzLKMeg$" id=3D"OWAfd6d6995-25c5-e8b8-1f7c-5adac232fc30" cla=
ss=3D"OWAAutoLink" data-auth=3D"NotApplicable">
lists.openembedded.org</a>&nbsp;wrote:<br>
</div>
<blockquote>
<pre><div style=3D"direction: ltr;">CAUTION: This email comes from a non Wi=
nd River email account!=0A=
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.=0A=
=0A=
On Tue Apr 21, 2026 at 9:06 AM CEST, ZhangXiao via <a href=3D"https://urlde=
fense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!Yt21GdLk9VztwQ=
8MtvSv8JVtmJIzN-WRvKtyQ1YyeSFO0k8VdjT96q8UoUUOicvYNdf-bPoUrmi76Q8IhRWyHrERz=
LKMeg$" id=3D"OWAf38bf1b1-0e18-389b-52af-b86ac239ca9b" class=3D"OWAAutoLink=
" data-auth=3D"NotApplicable">lists.openembedded.org</a> wrote:=0A=
</div></pre>
<blockquote>
<pre><div style=3D"direction: ltr;">This adds the static postgres UID/GID e=
ntries to static-passwd and=0A=
static-group, fixing the &quot;Nothing PROVIDES 'postgresql'&quot; error wh=
en=0A=
running reproducible test.=0A=
=0A=
The selftest environment requires static system user IDs to ensure=0A=
build reproducibility, which was missing for the postgres user/group=0A=
before this change.=0A=
=0A=
Signed-off-by: Zhang Xiao <a href=3D"mailto:xiao.zhang@windriver.com" id=3D=
"OWA9e17082d-d775-17ad-abe0-20a8e4264e20" class=3D"OWAAutoLink">&lt;xiao.zh=
ang@windriver.com&gt;</a>=0A=
</div></pre>
</blockquote>
<pre><div style=3D"direction: ltr;">Since this is a meta-oe recipe, shouldn=
't those static IDs be defined in=0A=
<a href=3D"https://urldefense.com/v3/__https://git.openembedded.org/meta-op=
enembedded/tree/meta-oe/files/static-passwd-meta-oe__;!!AjveYdw8EvQ!Yt21GdL=
k9VztwQ8MtvSv8JVtmJIzN-WRvKtyQ1YyeSFO0k8VdjT96q8UoUUOicvYNdf-bPoUrmi76Q8IhR=
WyHrGeam4qWg$" id=3D"OWAc383249a-5754-0872-3e59-90d8a9bdf252" class=3D"OWAA=
utoLink" data-auth=3D"NotApplicable">https://git.openembedded.org/meta-open=
embedded/tree/meta-oe/files/static-passwd-meta-oe</a>=0A=
<a href=3D"https://urldefense.com/v3/__https://git.openembedded.org/meta-op=
enembedded/tree/meta-oe/files/static-group-meta-oe__;!!AjveYdw8EvQ!Yt21GdLk=
9VztwQ8MtvSv8JVtmJIzN-WRvKtyQ1YyeSFO0k8VdjT96q8UoUUOicvYNdf-bPoUrmi76Q8IhRW=
yHrE0kNLQtQ$" id=3D"OWAb8ec5ec2-8073-2e86-0d1d-808ae9a4a946" class=3D"OWAAu=
toLink" data-auth=3D"NotApplicable">https://git.openembedded.org/meta-opene=
mbedded/tree/meta-oe/files/static-group-meta-oe</a>=0A=
instead?=0A=
=0A=
Regards,=0A=
=0A=
</div></pre>
<blockquote>
<pre><div style=3D"direction: ltr;">---=0A=
 meta-selftest/files/static-group &nbsp;| 1 +=0A=
 meta-selftest/files/static-passwd | 1 +=0A=
 2 files changed, 2 insertions(+)=0A=
=0A=
diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-=
group=0A=
index 6a9ece20a8..a08795c4ea 100644=0A=
--- a/meta-selftest/files/static-group=0A=
+++ b/meta-selftest/files/static-group=0A=
@@ -31,4 +31,5 @@ audio:x:532:=0A=
 empower:x:533:=0A=
 cmake-example:x:534:=0A=
 meson-example:x:535:=0A=
+postgres:x:536=0A=
 nogroup:x:65534:=0A=
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static=
-passwd=0A=
index 98017c8153..ba1dcd54d8 100644=0A=
--- a/meta-selftest/files/static-passwd=0A=
+++ b/meta-selftest/files/static-passwd=0A=
@@ -21,3 +21,4 @@ ptest:x:529:529::/:/bin/nologin=0A=
 xuser:x:530:530::/:/bin/nologin=0A=
 cmake-example:x:534:534::/var/lib/cmake-example:/bin/false=0A=
 meson-example:x:535:535::/var/lib/meson-example:/bin/false=0A=
+postgres:x:536:536::/:/bin/nologin=0A=
</div></pre>
</blockquote>
<pre><div style=3D"direction: ltr;">--=0A=
Yoann Congal=0A=
Smile ECS=0A=
=0A=
</div></pre>
<div style=3D"direction: ltr;"><br>
</div>
<fieldset></fieldset>
<pre><div style=3D"direction: ltr;">-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=0A=
Links: You receive all messages sent to this group.=0A=
View/Reply Online (#235603): <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-core/message/235603__;!!AjveYdw8EvQ!=
Yt21GdLk9VztwQ8MtvSv8JVtmJIzN-WRvKtyQ1YyeSFO0k8VdjT96q8UoUUOicvYNdf-bPoUrmi=
76Q8IhRWyHrG4F2EVrA$" id=3D"OWAf5e38292-638b-b43c-8016-7ffb7a178a6c" class=
=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://lists.openembedded.org=
/g/openembedded-core/message/235603</a>=0A=
Mute This Topic: <a href=3D"https://urldefense.com/v3/__https://lists.opene=
mbedded.org/mt/118934221/3618679__;!!AjveYdw8EvQ!Yt21GdLk9VztwQ8MtvSv8JVtmJ=
IzN-WRvKtyQ1YyeSFO0k8VdjT96q8UoUUOicvYNdf-bPoUrmi76Q8IhRWyHrEOSD1-Vg$" id=
=3D"OWA11d3b114-4c7a-08a6-ef85-536e3395a5fa" class=3D"OWAAutoLink" data-aut=
h=3D"NotApplicable">https://lists.openembedded.org/mt/118934221/3618679</a>=
=0A=
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg" id=3D"OWAf804e5e7-907b-909a-5bc6-fecb0ad603bf" class=3D"OWAAutoLink">op=
enembedded-core+owner@lists.openembedded.org</a>=0A=
Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://lists.openembed=
ded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!Yt21GdLk9VztwQ8MtvSv8JVtm=
JIzN-WRvKtyQ1YyeSFO0k8VdjT96q8UoUUOicvYNdf-bPoUrmi76Q8IhRWyHrHoYGqrKg$" id=
=3D"OWA21b811d8-8d63-414b-14aa-f843765e28bc" class=3D"OWAAutoLink" data-aut=
h=3D"NotApplicable">https://lists.openembedded.org/g/openembedded-core/unsu=
b</a> [<a href=3D"mailto:zhixiong.chi@windriver.com" id=3D"OWAd933c855-9d71=
-667f-1bea-031ba5dd16e8" class=3D"OWAAutoLink">zhixiong.chi@windriver.com</=
a>]=0A=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0A=
=0A=
</div></pre>
</blockquote>
</div>
</blockquote>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;"><br>
--<br>
</div>
<div style=3D"direction: ltr;"><span style=3D"font-family: Raleway, regular=
;">Yoann Congal</span>
</div>
<div style=3D"direction: ltr; font-family: Raleway, regular;">Smile ECS</di=
v>
</body>
</html>

--_000_DS4PPF75D68BA1BA0D98FED384C3CC6E1059B382DS4PPF75D68BA1B_--

