Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 67329 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Feb 2019 08:56:34 UTC
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10060.outbound.protection.outlook.com [40.107.1.60])
	by mail.openembedded.org (Postfix) with ESMTP id 40D037CADF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 08:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-TopicProducts-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=aGz/SZdUlKk1/sdZ5uHMhh8SiyzsYYgwN0UD9ylojv0=;
	b=TpFsVIQ3KES+SJHzvMX7BIqU2DvloOiv216yO2LTxFD77y5Y+KifvGzfo1jXlXO5GiX+nNwa/EYk/cpqnWXRD6doZAXay2fTA73YsWkefY4bBT3q0x4KIG+RHI509SKGEAerpzypF4j+JYTJKK5i16ULPLW96O0polE/JcfZdCI=
Received: from HE1PR0402CA0029.eurprd04.prod.outlook.com (2603:10a6:7:7c::18)
	by DB6PR0401MB2581.eurprd04.prod.outlook.com (2603:10a6:4:3a::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1622.19;
	Wed, 20 Feb 2019 10:55:25 +0000
Received: from DB5EUR01FT030.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e02::200) by HE1PR0402CA0029.outlook.office365.com
	(2603:10a6:7:7c::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.14 via
	Frontend Transport; Wed, 20 Feb 2019 10:55:25 +0000
Authentication-Results: spf=pass (sender IP is 52.236.92.113)
	smtp.mailfrom=topicproducts.com; lists.openembedded.org;
	dkim=pass (signature
	was verified) header.d=topicbv.onmicrosoft.com; lists.openembedded.org; 
	dmarc=none action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
	designates 52.236.92.113 as permitted sender)
	receiver=protection.outlook.com; client-ip=52.236.92.113;
	helo=eu2-emailsignatures-cloud.codetwo.com;
Received: from eu2-emailsignatures-cloud.codetwo.com (52.236.92.113) by
	DB5EUR01FT030.mail.protection.outlook.com (10.152.4.254) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.1580.10 via Frontend Transport; Wed, 20 Feb 2019 10:55:25 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (104.47.1.56) by
	eu2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
	(TLS12) via SMTP; Wed, 20 Feb 2019 10:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-TopicProducts-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=aGz/SZdUlKk1/sdZ5uHMhh8SiyzsYYgwN0UD9ylojv0=;
	b=TpFsVIQ3KES+SJHzvMX7BIqU2DvloOiv216yO2LTxFD77y5Y+KifvGzfo1jXlXO5GiX+nNwa/EYk/cpqnWXRD6doZAXay2fTA73YsWkefY4bBT3q0x4KIG+RHI509SKGEAerpzypF4j+JYTJKK5i16ULPLW96O0polE/JcfZdCI=
Received: from DB7PR04MB5260.eurprd04.prod.outlook.com (20.176.236.92) by
	DB7PR04MB5404.eurprd04.prod.outlook.com (20.178.104.145) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.19; Wed, 20 Feb 2019 10:55:20 +0000
Received: from DB7PR04MB5260.eurprd04.prod.outlook.com
	([fe80::6d60:d2ab:9dc6:42b]) by DB7PR04MB5260.eurprd04.prod.outlook.com
	([fe80::6d60:d2ab:9dc6:42b%6]) with mapi id 15.20.1643.014;
	Wed, 20 Feb 2019 10:55:20 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: Leon Woestenberg <leon@sidebranch.com>, Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] wic creates ext4 images that read really slow in u-boot
Thread-Index: AQHUyEUhsy1Bylny30iv3ZodHjtW56XnXEKAgAAlsYCAABWTAIAA7XmA
Date: Wed, 20 Feb 2019 10:55:20 +0000
Message-ID: <5d6f25cb-e7fb-8306-5a6e-afe497620b9a@topic.nl>
References: <83ec17fa-88b0-04fa-adab-b402b10c6339@topic.nl>
	<CAMjhiJjO0+0=_6HOmVM67U0nnbW=iu-FiMTzJBe4ZCvceuguuA@mail.gmail.com>
	<CAJ86T=Vy6AMbJ0J23V_9K+GJxwCFjD-Gq7NQwZ7AeJSW5Lum_A@mail.gmail.com>
	<CAMjhiJgFxSH3Rz+ot6qAZN1LPF=WmZ1ySt0Y4TSCg0S0m7YsxQ@mail.gmail.com>
In-Reply-To: <CAMjhiJgFxSH3Rz+ot6qAZN1LPF=WmZ1ySt0Y4TSCg0S0m7YsxQ@mail.gmail.com>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
x-clientproxiedby: AM6P194CA0065.EURP194.PROD.OUTLOOK.COM
	(2603:10a6:209:84::42) To DB7PR04MB5260.eurprd04.prod.outlook.com
	(2603:10a6:10:21::28)
Authentication-Results-Original: spf=none (sender IP is )
	smtp.mailfrom=mike.looijmans@topicproducts.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.173.50.109]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d6922cb5-46c1-47fb-49fa-08d69721eaf6
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600110)(711020)(4605104)(2017052603328)(7153060)(7193020);
	SRVR:DB7PR04MB5404; 
X-MS-TrafficTypeDiagnostic: DB7PR04MB5404:|DB6PR0401MB2581:|DB6PR0401MB2581:
X-Microsoft-Exchange-Diagnostics-untrusted: =?utf-8?B?MTtEQjdQUjA0TUI1NDA0OzIzOks3amRqdTdGT2ZRSW8yYzZvSGJTZWd4Z0hk?=
	=?utf-8?B?NWo4ZmF6NkZuQ0xwaUkrSnJzRjAzZWZJYVNvVHdscVRLZTJGaVVHamNkd3RY?=
	=?utf-8?B?YlVqUTR5ay93cjhZM040WDErdzV1c2Q2VTVBeDdPWGhUSkZsa3N2Tms5czlv?=
	=?utf-8?B?OXRLYUgzdW5CRUlNT1VZM2ZCU0wxM2JGLzBxOXZMZy9aS0h4OHdEcXI0bDB3?=
	=?utf-8?B?VWtXTHBQU1V2Q3Urdkk0SDhJZEFZUzJRa0s0VkVCNkRMSTNGMDA2M1phR2xV?=
	=?utf-8?B?cUV6WDFZWmVoeTQ5NkpPU28xZGZhVHZENnVUNnMzVEJWSklOUEJielhZN2hV?=
	=?utf-8?B?VjhreTVnNElDWTdBNmJMeXNCQWlNUWh3TmdlU2llSDdneHNDQWxOenlyUEo3?=
	=?utf-8?B?RGRuS3F4NDBvNXRyeEF2U083WjlSbnlsSjFEelJRNkVjcDFuTXJBUThwRXZJ?=
	=?utf-8?B?YUdMeTZFUTErZ1BrZDlmaGF2S1l2YU9BTlQxNW5rdUNibk4yZzE0V1BEVysz?=
	=?utf-8?B?cUI0QklMN2VlTTVXUWtlN2xJeVpjSWwxY3BEQWFsNTRmR3NhS0ZBNjdHTW9h?=
	=?utf-8?B?c1BEd0dpb0RVT295V1kvMWtpZG93M1A4YVdWMkR2UzUzUFRaREtIbDZGMWRr?=
	=?utf-8?B?dlFWd2pSdkdyZG10NkYyeHAvZUFaVWVQb25HWjJ4RUttdjIyTXhuRExKZHVZ?=
	=?utf-8?B?cDNKTEs2L3BPb0Myb0lhdjBxNTc3djhGS1kvL2tqQW5nY09GeUZVeWZIeldF?=
	=?utf-8?B?L1J0dStMenpwY3g3SWR4bUR6NXI2aCtHeXd2UmkydGRFb2luc0NDckhTM3pk?=
	=?utf-8?B?NW5lNjRmaGpNRmM5ZVo0Z1BaZG1UT3Jrbi92TTFibkZSM3Q4TVByNU9nbUpW?=
	=?utf-8?B?ZHFtZis3TFJKTnRMRHlpV3ZXcVRHNUVPZXVBOG5LTDhxWG1zZHVNNDhwd1Zv?=
	=?utf-8?B?NUtxSmhxNFUyenA5by9CTThmVGh3SXFPY1UrUThnWTl0NUw4YWlmNFhNWEds?=
	=?utf-8?B?a0hibGZ0bFovdFhHejdCZDNSeWxZMzJma3dINXVHY05aQ1NWa3NjMm1tWGk3?=
	=?utf-8?B?c2ZMMGNtZVltRHJnN2dUc0ErOFh6UUxhYjNlcFhmR1JhWjJxZFJGb0FYck40?=
	=?utf-8?B?b0dsZ1hHL3VGRG1KZ3FNd2drOUsxUUQ1NmpybDV1OU9kb3UxdHArQUY5UWIw?=
	=?utf-8?B?UDROUm81Vm1ueTVpNjRJdzZzRWVQTDZXNHRZYXUvS0l0M2hHUXk2ZVFYMHE0?=
	=?utf-8?B?UjRzZXZoRjlJZStpL3QvdjNUVHAzZG9pUkhzWnQ0dENHRWU0cisrYjl4Wi80?=
	=?utf-8?B?aUhTd0UwUk5jb3FYYW5oMlF0VDYzc01zdWxVUGZwbC94R01MSjV4dm94WHJv?=
	=?utf-8?B?Sy96bnVNUzVjUUVMaWlmMUVvSi9JT0U1R09CRVg3andCczc5U1o5ejVIYWlz?=
	=?utf-8?B?RW12RnRMcFJuL25MdkhEVHF6SS8xTFVZMTVUQ2hWc0ZVN083TVRwOFJoZUZM?=
	=?utf-8?B?bjhHd20wUExZMTVyaXQzUGIxNDFuZ2FGaWEvK2JJWVFpaFBsNm5rVUlOWWF2?=
	=?utf-8?B?ZGVnYTNiVXdUUXloSjhkS1ZtTEcwUDd4MHlpWkxIYzJKQ2RzTk9xR1B0WWRr?=
	=?utf-8?B?UWI2REN4OE8yUmg3SWdZYk1IbXlUQmtYMnJMT3JsZ0lMWGp3bVFNSG5ndHlY?=
	=?utf-8?B?dkxsZnYrYmVTRFVFckptblczdkpZOWZ5OE5uVnR4eFpUSFhPRjFrK3N0ZVhP?=
	=?utf-8?B?cWIwU0RaenNma1FFK1VrdWhjMEJqWW5uUWQyOGgyajJsTkgzVUtyNUpYaDJO?=
	=?utf-8?B?dnJEUVJUWHdZd24yL3JsaHZpekY3SE5GNjB1cTBsc3lDaG1OMERzVmZPUjFw?=
	=?utf-8?B?ZEtjNTVTSjNWUjdLaDcwcGZqekhnRVBLY1FQelhLK051RHJjQzJiVTFFcWQx?=
	=?utf-8?Q?8PD2dlfzss8wcaZMdenPGMf8CBzuQ8=3D?=
X-Microsoft-Antispam-PRVS: <DB6PR0401MB258181E08B56949A331F1B77967D0@DB6PR0401MB2581.eurprd04.prod.outlook.com>
x-forefront-prvs: 0954EE4910
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(10009020)(366004)(376002)(136003)(396003)(346002)(39840400004)(189003)(199004)(74482002)(2906002)(105586002)(36756003)(106356001)(42882007)(44832011)(14454004)(486006)(446003)(476003)(2616005)(11346002)(102836004)(6506007)(386003)(31686004)(256004)(14444005)(26005)(71200400001)(186003)(6246003)(71190400001)(5660300002)(65826007)(97736004)(66066001)(65956001)(65806001)(4326008)(6116002)(64126003)(25786009)(53936002)(93886005)(31696002)(58126008)(316002)(8676002)(110136005)(8936002)(99286004)(81156014)(6486002)(508600001)(4744005)(6512007)(52116002)(6436002)(76176011)(68736007)(305945005)(7736002)(229853002)(81166006)(3846002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB5404;
	H:DB7PR04MB5260.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: topicproducts.com does not
	designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 06PmhKI0cSCK32X34AVW9/brdD7cH1qChGzwg5dMjLaaLwUEITtlSSrQ1PrP6iaQe4WmVpnn2rYMoSH+idqywhiOjXi9Eu/ABhfdwjxkSOBUr9K3mBH8jaq2A1uFZvIxk+YTBg3HtQtURzrGR9hNdmkFipfNkI2LVP6RPXdudSip9VrwycEWwzfvg4tPFW33udRETuT3Th/c6i+kPLntj5O3SLL7h5YHcTBq1UIZlgEOtocN8s2Ze1P4Jh54kuU0nPMQcJjlWpuG72QjAOo8N1bBz65MEx3mDIMuxeWEyoyFFDfaoTs+S9kOj87WxgmtjpR5z6BAeMYxVpqbRVg4NBY2/PpPrXMDxa/FwUDDyQb2u7cfh3iYwi8ubCOZq8557a7i41/MVAc3PKsEz6XcijtFn3dm2aj3Z7yZQJn/G38=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5404
X-CodeTwo-MessageID: 20190220105522.ca03c211-0f99-43a9-a1ba-46daa0a07a60@eu2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR01FT030.eop-EUR01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:52.236.92.113; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(136003)(376002)(396003)(39840400004)(2980300002)(189003)(199004)(106466001)(4326008)(356004)(26005)(36756003)(6486002)(50466002)(6246003)(74482002)(25786009)(5660300002)(65826007)(2906002)(4744005)(186003)(6512007)(93886005)(446003)(126002)(14444005)(436003)(11346002)(476003)(65956001)(6116002)(66066001)(486006)(2616005)(336012)(44832011)(58126008)(316002)(3846002)(65806001)(42882007)(31686004)(14454004)(76176011)(229853002)(7736002)(7636002)(31696002)(23676004)(2486003)(8936002)(508600001)(8676002)(106002)(64126003)(305945005)(99286004)(386003)(6506007)(246002)(102836004)(47776003)(7596002)(110136005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0401MB2581;
	H:eu2-emailsignatures-cloud.codetwo.com; FPR:; SPF:Pass; LANG:en;
	PTR:eu2-emailsignatures-cloud.codetwo.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 045dcffd-9c0f-4bb4-c7a0-08d69721e807
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600110)(710020)(711020)(4605104)(2017052603328)(7153060)(7193020);
	SRVR:DB6PR0401MB2581; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0401MB2581;
	20:EexOIKMF9jCKLlUpPBzqAP4xxIDVuGCby+TU8syN9NFUQDLbB268mG6IeYBOzKXRVIsccaHmhfREEC+O6P0k1mW3djccWu5vI8L45tdHM0QsVlotyD7JwlUrUXYeRACn/MfHi8uqVrFtriNEjGGsl9w8aaoZCXXjcMR2Nbibcu0=
X-Forefront-PRVS: 0954EE4910
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtEQjZQUjA0MDFNQjI1ODE7MjM6ZktzSC9CNkREYTNkdnM2eXZRUDlvTGla?=
	=?utf-8?B?T0NKNW5JSjM2YlhCM1p6ODNQRlV2OXQrMWhUUG9xUUZYK1FCUTV5NU9VOEpO?=
	=?utf-8?B?MHZFV3EyREVUTmw4WmlFd3h5N1B0NXRKdGZOT0lDc2IvekVIc2NNVFhOUUlm?=
	=?utf-8?B?cEZtYjZGeDk0dGxrMTNmMHVuTVZWaHhrWk0yODd4cGMwMGVyVFFnMDI0WmNX?=
	=?utf-8?B?VjJSb2pkSDVySTZuNXNGWVg0THoxSmRHR05LRTBIUGw2cGJ4OVZSOVBMemQx?=
	=?utf-8?B?Tkgwams3VXVMWkFyQ1NwU0lWSkJNbzk5Um9yZlVIZzhLVkNVcjJwdHZxTHgw?=
	=?utf-8?B?alVlRjZnZitjVTNNR05Wd1YwU0JmSmE0NzJEVFR2bGNDbGZMU2xUUk9NQUNP?=
	=?utf-8?B?N2tacW5UNEQ3SDc2VkZpNStGUGRGYlhPMlN0U28yaVdVUkxoR2VkWGZodFhx?=
	=?utf-8?B?Y2VUQVFVeGhGWVBLbml2dzVMWGxyQTFLU3EzWjlSMnlIZGcxNGxkRGl2QWZH?=
	=?utf-8?B?eHgrWXg4VERHcVJTbUZnM0pheUFSRWxSeHhDSjZYNTg2TWVrNFk3RHlkUHB0?=
	=?utf-8?B?WCt6dG1YVGpFMUgwNzFFd3N3WENHTGxBblhrWVVFeEtkK2lYU3lZV2wrQVQ4?=
	=?utf-8?B?VjN4c0xWbVVGaW1yWWYzZnJkUTUzM2tRMHMwSllwbE1OUlNhMzBrd0tha1Va?=
	=?utf-8?B?cUNUa3RqMjNlSGVmQ3gzMnMxRUlaRlVKakIxYkxoS3IvZ0pVQkZESml4dlBI?=
	=?utf-8?B?aVBHWW5pK0trNk10ekt4aHJXSldkTWVNVTcwbE1oNGw1UnlkYWJNclJVWWVv?=
	=?utf-8?B?ZWJqK0JKbndqUkNpRUN5K2prd1ZtWmFuREpQOGI4L3hBWTY4SXpqeVpHVm5H?=
	=?utf-8?B?dWZ4YSsvazdxK05ubzc1VStJYjl5RjJlNU5RaXRuRzl0WkZndXhCU0NDcnNi?=
	=?utf-8?B?OUg2L2FhZEZOeXVJS1pZc1dYbDlCOGwyZngvdnRIRmk4ZDZpVFl2TUY3Y2Vk?=
	=?utf-8?B?UmtmM3l5NFhoM2ZPSmdoN1BoMmMrR2J5UmluZzU2dGFnOEo2OTh5dkRNYU10?=
	=?utf-8?B?M2xtUTFQL293ZHZlYXRxR2x6TkR2QWQ5R0E1bU4vVVFPdUJIYXlWR0xFeW9a?=
	=?utf-8?B?NjdwRzBzRGkvUnUvNXJHSEJqczFqcjBzN2prTVNwRDhtdFpqaWt1S1JyOFZk?=
	=?utf-8?B?UTJxOENUMEhmUGtoYUFrYnc3Zjc1Y05CMWhPd3FRRnNLTEROMkUwbHo1MDFj?=
	=?utf-8?B?L2V2Z09LTmdtSndLQ1Q5N3QrNmd6S3Evd2hjUXlQdGx1TUsrSGFuU29rN3Rz?=
	=?utf-8?B?T2J5Sjd0SWcwYXNyTUpHSTVxT0NjNUp3VmI3TkN0a2VzUUlseTdXakFMYTRF?=
	=?utf-8?B?N0hFN0o1Wm5aT0Rqc05DdDNVVFVqMUNpbTM2eWdkNWxlc0xQM3cxVzNzWmdl?=
	=?utf-8?B?RzhOYnkySGFvalFqTSs3bDZvalgwRmkxM0Y0ZkE1VGFzYkN4TjM1Y21TTzBj?=
	=?utf-8?B?cXp5bHByUlJ6N1l3cXJ0bFlKcEt3MGc2elNlUjJOU2wzMTZubm5FcUR0K0Z1?=
	=?utf-8?B?cDJZaktUdDBzUVN6Y0I1bk8rOHltM3RPeVlLUG5qRTk3ODlPY1plOS9zUDRZ?=
	=?utf-8?B?b0RSaEZEQjRxME9ITm5pSDVUYzhwR3U4ZFhQa3p6aE12TE8vWVRUOUJjVHJp?=
	=?utf-8?B?SEhDeWVwZk5xQ1ZWNGtxSXkyRWlPT05XUXo4dGxBQ2JjN2dycE1oMmNDaGlh?=
	=?utf-8?B?cG1rS2oxWkRnN1l1Sldka0Y0ZG9oRWlsNDBoNVlGQWtjUkUxTHJ5VFdDTjJX?=
	=?utf-8?B?UmRobjJBdnBVQ2F2djBGU1NVNXNjTHNPWStHbStTcHlBK21kREdHbVZXN1d2?=
	=?utf-8?B?MjhHWE5YMlJTUmhmaks5ZTd2Zmt0NmRIM0U5SHJCeHo2aXY5OFVYbmNMNnF2?=
	=?utf-8?B?QTFJR1BXcDE3SXc9PQ==?=
X-Microsoft-Antispam-Message-Info: zOF+KgUoBXl3AI/9BmwMNgpt59fvCBOd73nyWK8f4pL8p277bBsK9MrQsJddt1fBdEGcqzacrJlUZAqt8t14rD5hLSgVxpqPZXoX7vpW2u4gFhflWGbk3h2SR/ls5NgzLFZ02Duv129mmTjgHfnpOjHZuIDB/VBwQygw39vdqi3Owtm/KyCI/WkQ1AAs+Nyui6YF3SCAchPDC9C8Jjp+4FjJI9nlygvEtIadnsn8OPzABVnyD9k1aEu/2yiuiuoasI846d+XpApUMf9cIIOqJYlUcnNTdZAKyGQivv8oukboYLz2mppj1aRXBNUGlm/9vfr48hunUnaGhZ1C0eI1LtWjCYRUQ+eOzOj3dUy0H/XLB1rUkvR8manuKi3P/vLJPRwbtHqjTihscbr1ku3QOINa0jAaMWZGppOm0YNy894=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2019 10:55:25.0957 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6922cb5-46c1-47fb-49fa-08d69721eaf6
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;
	Ip=[52.236.92.113]; Helo=[eu2-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2581
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0401MB2581;
	23:3LHvLMqoOR2wMwLcCgHyasfeU13HaGPMHWoJZ4I4gLam/EOUg00fzPW7bd8u31BPxhzrbq7q830Y7bWh8LhM1yKbKEspciBEHOh8EG94gwEy4ppmKdrQXa4kzTCf/t5dTMGFA9uYnitLxXaiFr8Mfw==
X-OriginatorOrg: topic.nl
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: wic creates ext4 images that read really slow in u-boot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2019 08:56:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A0B55EDDD1EE84690523B355CE8BBA7@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

Pj4+IEkgYW0gYXdhcmUgb2YgdHdvIGZpeGVzIGZvciBVLUJvb3QuIEkgd2lsbCBsb29rIHRoZW0g
dXAsIGFuZCByZXBseSBhZ2FpbiB0byB0aGlzIHRocmVhZC4NCg0KQnJvd3NpbmcgdGhyb3VnaCB1
LWJvb3QgY29tbWl0cywgSSBmb3VuZCB0aGlzIGdlbSB0aGF0J3MgZGlzYWJsZWQgYnkgZGVmYXVs
dDoNCg0KQ09ORklHX0JMT0NLX0NBQ0hFPXkNCg0KVGhlIGNvbW1pdCBpcyB0aGlzIG9uZToNCg0K
Y29tbWl0IGU0MGNmMzRhMjlmMWIyNDg2NDM3MzFhMTFmYjFjNmYwNTIwZDAxNmMNCkF1dGhvcjog
RXJpYyBOZWxzb24gPGVyaWNAbmVsaW50LmNvbT4NCkRhdGU6ICAgTW9uIE1hciAyOCAxMDowNTo0
NCAyMDE2IC0wNzAwDQoNCiAgICAgZHJpdmVyczogYmxvY2s6IGFkZCBibG9jayBkZXZpY2UgY2Fj
aGUNCg0KICAgICBBZGQgYSBibG9jayBkZXZpY2UgY2FjaGUgdG8gc3BlZWQgdXAgcmVwZWF0ZWQg
cmVhZHMgb2YgYmxvY2sgZGV2aWNlcyBieQ0KICAgICB2YXJpb3VzIGZpbGVzeXN0ZW1zLg0KDQog
ICAgIFRoaXMgc21hbGwgYW1vdW50IG9mIGNhY2hlIGNhbiBkcmFtYXRpY2FsbHkgc3BlZWQgdXAg
ZmlsZXN5c3RlbQ0KICAgICBvcGVyYXRpb25zIGJ5IHNraXBwaW5nIHJlcGVhdGVkIHJlYWRzIG9m
IGNvbW1vbiBhcmVhcyBvZiBhIGJsb2NrDQogICAgIGRldmljZSAodHlwaWNhbGx5IGRpcmVjdG9y
eSBzdHJ1Y3R1cmVzKS4NCg0KICAgICBUaGlzIGhhcyBzaG93biB0byBoYXZlIHNvbWUgYmVuZWZp
dCBvbiBGQVQgZmlsZXN5c3RlbSBvcGVyYXRpb25zIG9mDQogICAgIGxvYWRpbmcgYSBrZXJuZWwg
YW5kIFJBTSBkaXNrLCBidXQgbW9yZSBkcmFtYXRpYyBiZW5lZml0cyBvbiBleHQ0DQogICAgIGZp
bGVzeXN0ZW1zIHdoZW4gdGhlIGtlcm5lbCBhbmQvb3IgUkFNIGRpc2sgYXJlIHNwcmVhZCBhY3Jv
c3MNCiAgICAgbXVsdGlwbGUgZXh0ZW50IGhlYWRlciBzdHJ1Y3R1cmVzIGFzIGRlc2NyaWJlZCBp
biBjb21taXQgZmMwZmM1MC4NCi4uLg0KDQpJJ2xsIGJlIGdpdmluZyB0aGF0IGEgdGVzdCBkcml2
ZSBzb29uLi4uDQo=

