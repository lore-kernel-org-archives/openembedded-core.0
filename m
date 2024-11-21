Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2CAD7879B
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 17:17:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3876.1732209436853745145
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 09:17:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=105544ee82=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALCKHIg016884
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 17:17:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xgm0nvw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 17:17:15 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4ALHHF3p002750
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 17:17:15 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xgm0nvw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 17:17:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BE1LfALMxLaNEl9j3XVgkXbtWUZn1jEZOT+UeZS7NLTQVPPSTdET2ATczX7GcN6pwzgtItSxbN7v6m9PtDc+YFN/hcwY4k+Ucu/NmmIrvtWJYGcNURdiV0IZad6iUQiT0cDfg1O6x1k5znhyUWbjLVUBz/5mNhy+oRfx5WSk70IqxKl7xS4HmE+dig7lyqTfwQRPFABR7REdKYtxlDf5CCsJg9gC5w1x/CMqAdBNEMmw9YYMft5yZHZ+xM3bQAInyQ7QHC673WuBtsCqEeEnOSbWuaXw5/bAuMxqwP+5/3PuAFQfisQCxYlqcuysuRBkx9dPUpayeBmz/Jazb/53cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z94BLYynTwu9Tf1JTPQJy1LlUpr6w7QOOaZieCj2VhY=;
 b=TFUyJwZWmjrvwHvo4qE0mfQys/Vp895f+g9TzD4ewX9/8E7rmL5LPlfTasqM7oAxqTWUBF+zonPCdjefSpHeTwMoriikJknXNBASL6leneqheenbb74+7UaxeGbC3EWhhHCjrMJt5ue5tUSd5wlMi816ftbxYZbDWGH987Q+jj8s5odshgjZr7qDSg+3zDiSbFkZSRH+5Jlba/1FF7hslTW/C4RDbWcVGZFiYbfZPggoaqGM1gU0TI0HyVIuXTxYQUESrZGhdKauyfN/sT4H0uNZUNSO85ijrQu4Np5gNb+EgHu112gKA1FMGUMm23cMIIEGnAH0Gd22XS38XSDhTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SJ0PR11MB6766.namprd11.prod.outlook.com (2603:10b6:a03:47c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15; Thu, 21 Nov
 2024 17:17:09 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.8158.017; Thu, 21 Nov 2024
 17:17:05 +0000
From: "Jia, Hongxu" <Hongxu.Jia@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "JPEWhacker@gmail.com"
	<JPEWhacker@gmail.com>,
        "Jia, Hongxu" <Hongxu.Jia@windriver.com>
Subject: Re: [OE-core] [RR V2][NULL][0/3] SPDX 3.0: Reduce redundant
 spdxid-hash symlinks to save inode on host
Thread-Topic: [OE-core] [RR V2][NULL][0/3] SPDX 3.0: Reduce redundant
 spdxid-hash symlinks to save inode on host
Thread-Index: AQHbOxAv/gsOBpF5FEKVCNF+LB/+arLB/Dw6
Date: Thu, 21 Nov 2024 17:17:05 +0000
Message-ID: 
 <PH7PR11MB7608DA452240EF0350E296B294222@PH7PR11MB7608.namprd11.prod.outlook.com>
References: <180997414F6EBDC6.32520@lists.openembedded.org>
In-Reply-To: <180997414F6EBDC6.32520@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7608:EE_|SJ0PR11MB6766:EE_
x-ms-office365-filtering-correlation-id: 70d0612d-ef60-4cc0-ec38-08dd0a505296
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?6Q3geKw6YkZgjNXPz0CBsrUuEKq+ijtEYLUJYqoF0b7f9Kbyk39WSpVCAxVR?=
 =?us-ascii?Q?Ns+b/ZFN8LnaVNEeVcO2megV9EiA80JtFwa5jEk9n9kv2h+0RoxxnlbboGcR?=
 =?us-ascii?Q?cZ1UnZrX31IJCU48lKyq8fcvkwWj57J6Q5OC0W7kabBBu3qjNide7tnRAt1F?=
 =?us-ascii?Q?yi+RXIHs/YMZIIgYJUkeaQsmZqhMN3Ldci4jpXLb5bCF67WY1d+zoSYEHHw6?=
 =?us-ascii?Q?aTzIlKfhxIDnUvvbjJl/UdPeFrozjD0r6LPIsQIpqkXyDKQWDlob5RxNR/Sa?=
 =?us-ascii?Q?FyRocZ35PYsQSsjdK7wipBk+lRcRL/0em9Y3rQEnlwin8dmp7DcKRZ0yEgsC?=
 =?us-ascii?Q?NyVUR9PWzOg0SY4TGlsORMQnRkJiUgUNUVoDsjl4kfjEX1fXyu1cAHoB7Gyk?=
 =?us-ascii?Q?TJ5FRQ5zaHc5tuWPWyMovn13O7CHLQqer9f6/LQI/GQw73ZFMiGCo1SXlHEp?=
 =?us-ascii?Q?tFLZ1b7wANxnpe9oCSvaHtFLIOt1zUohHWT1KbL0ZjlpmWKquBSz7vhrR2kl?=
 =?us-ascii?Q?2KpThTTFJHbaDzrCwE6IoiiDKghQcU2e8KJG1xHfpD2zofOoLzHvMwO1AIEt?=
 =?us-ascii?Q?/cNmUwUKS6mJ5OdT0FTD2dyKZzLOI79IZiR5tfaJSvuBUDVHiJ5eruVpVjmv?=
 =?us-ascii?Q?liFlWK3eC3ePcfNg/0vwuWNWJXbs2hmxqD3KVvKxyNtd/0zfUJb4ILEx4Ao6?=
 =?us-ascii?Q?xBA6dhBciyrcE3Nt/+bT9+7fLI49w7w7opBGKsGJ/BYlXBh/7lfY3b92tALt?=
 =?us-ascii?Q?mQ2I66WPSaibGY3j7U6epV+kdyZ1HbV239gFtn7PzbO+U36KDwr+9dIN0S4S?=
 =?us-ascii?Q?dQxLfIJIqMEoBX0DD+1MO3q52drJdwWkkz7RgUwiUvj75eKBHYT8gvhC110O?=
 =?us-ascii?Q?RlUaY+PFJR3k9Ad85WjG+0eWL8XraAohgE9WzSrKQZzRDKeKfx0ZK4MY/TFp?=
 =?us-ascii?Q?HweBqL2uz6n+Jd73LVGGRLKQ4E/400eh1TELRSDJNlTKRxj5pjAXbkdsYaaB?=
 =?us-ascii?Q?IT2Ul2Mxtl/I5w8rnkYeg+bYGSmxKHbf4fccKKXfuBPNiAl16ULFgsbOTVxh?=
 =?us-ascii?Q?xu+j2QA40l/F961p7+akd9mh0heevb8eAWzOSGlSFhrZbb5PlTkHqCKPrQuX?=
 =?us-ascii?Q?UNdPt1Bu5ExEoeTLvvrOUvecdrUyvUqQe4H3LYVG1I+TfHe+agnFUyopB5kQ?=
 =?us-ascii?Q?bf4lXGo9PMMlA6MGApyPL02H5nco+EmDDQMfwDylMuWDpf1A/vcCljh4fDZV?=
 =?us-ascii?Q?CEfFpsYNG1LS1yMlnpKBpckhPnhZUJIe/9Kx+mEme5Q9rjMnz9tj8NLO1hWB?=
 =?us-ascii?Q?aOBQjzQ1Dz2lDRnFJxgAdxI9Np2WotFbSXYtWrGzOWsMhQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?sjcB8vqBb8elM1Vl2gURvM/fhQDjCO1YS/SIjoevwI7HZt+a4nzx/gkDPt+Q?=
 =?us-ascii?Q?S2k5UGF0YYczWTSwsGZThdtN30V14FNLDf+A2p7USJ+hePZDNqMfnxLGQSdT?=
 =?us-ascii?Q?eFhAodX8GzDbWFjDAoWN0EuTqZWCEGjp7L4t2482c9JHIfsGdw6hlveDbdfy?=
 =?us-ascii?Q?TSaqNelpPpHBMeGT0I2LUp8zp4oKrHwOJngt2/jjAuwEnDLd49yMynKRja+S?=
 =?us-ascii?Q?mmhpMeNk17Zb0ISoMRzYHx9rAJuRK2j3NeINmPfZJOzxhsdVnaVuk9ARwsrA?=
 =?us-ascii?Q?Du6vrF6O1IUI+ZOkfCNBY3+q9eMtnsnQ9SYSdq4bDxwR7xci1cZ6NsqX3xju?=
 =?us-ascii?Q?Icbmy45lzP13Te6TXDD/qrTlY0F6P6MGES++ZgDWkEVRqqL1S231v0M/96U9?=
 =?us-ascii?Q?jFZniEffe7XiEilXrhaZCaL1FyAE0FWKRCZMdYUlTg+a1VjNb12U66jWOKeP?=
 =?us-ascii?Q?o/Hagt9cHBBeS5MURshxnl2lnDkjcH1WKsh9YIgd2AQqFtNwidHuLWm/UfcI?=
 =?us-ascii?Q?0yEIDZcN//nOfFh4E2rCCyi/6W4dlg3Et3sMxBswDLkVz2dVI195Bre4iml/?=
 =?us-ascii?Q?FKS3P30O6i/i1XC90PF4ssQJHOoh/QNSC6w8VVCAFJMVd/bJmVpOxLuMRKKR?=
 =?us-ascii?Q?OnmwTwoLln6R0fWdwOweyjHBhctAjKUv/R/k/Doz13Is2BV9aWNTlqquKxs1?=
 =?us-ascii?Q?v2eW0fBfyEbgPDNFGbThGFB20WNBFSsWwf5LIvojx34+Yu6YXgPBj60WlfTU?=
 =?us-ascii?Q?2G+xrELSnAkhd7XCFbL7RuZyxPXBxLtzd6BG8KG8xWLIpYFMagFPua+h8VhT?=
 =?us-ascii?Q?S7+wmz8S2ofINn9qldcXYQgWs5jz3NM1N6Fkbh/dNPoBCg/0iuFi1i5zxjD/?=
 =?us-ascii?Q?/UiRN/gUHlIvdrbBwPLq02ze64RlInBgdXx1d6EY2KaoVzLQWLUXWedi8W4U?=
 =?us-ascii?Q?cTbHp/FmeUmXwY0ky7JgRtJ/5xaB0VvBtaivIH5Xy2MBUCMETOMAnsIGYToe?=
 =?us-ascii?Q?z6sNxkLwZdlyOpTu5vrDS3b3puqUkVG7XYTwh2pQvx0Bb5LGWp/aPV4Tar1g?=
 =?us-ascii?Q?AG1LT5TbADzMZbqFrjOqsd0VU5lwcHwvxN69rE1SJAFlj3IjFOXsjo30Jk2b?=
 =?us-ascii?Q?UPDl7nGZdFxf+lqJpU2XfVH2c28KBOEywZ72cbuAmayzqzjxdI3ZI+d8T728?=
 =?us-ascii?Q?ri0iQ95S4tyqaNweFy4w+eEWs5DmC5dNDpgzg+6hf1bHOqvATuB2WV/aY70h?=
 =?us-ascii?Q?1xKJO6OyYKZWDQBi8XUey664qr1dSD/FyUOFUllNcbQtYEZhwhD5+SC6Q1vP?=
 =?us-ascii?Q?GkKI4r/2VYEsB7Am2DAgcErcsbcER7xHMtT1vZqK+xTkoypifSJSFjkmbWm7?=
 =?us-ascii?Q?lT/t8v0DrEiBNP9R26MNmbuTZvJgxRMV1zLHYEBYLAEOvITVXVs382u1ejWf?=
 =?us-ascii?Q?n0/RriOU2JaFV34b/toSjdbeH1BmYm+U07kIkko1yvSSSPDidhxffKyPNpXz?=
 =?us-ascii?Q?2Wu4XFJbKI9+UJvQb7/BlHJEki3xHMC0+c16oHaKPvieo2GGEemEQE/ebuIe?=
 =?us-ascii?Q?5WbatY7V9IVSePqG4UAmqXCOUdnAXiOX9GbbhYl6?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB7608DA452240EF0350E296B294222PH7PR11MB7608namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d0612d-ef60-4cc0-ec38-08dd0a505296
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 17:17:05.5512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: btp4yecvNSqeVk5PPGnvx0hU7n0UE2QFQClhsC5GL5bRKztZB2/FO0who4Nk0yS1AgeHSdYdmhLqDRK5ajJLeZdYFh8yg8Qd9pp2mZRflJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6766
X-Proofpoint-ORIG-GUID: KnkF599Tn8uV-Sc_kR74psFheZsCnpzF
X-Proofpoint-GUID: yN3emYpaFRNWQPKZBzolpMWGQFuYuVYx
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=673f6b1b cx=c_pps a=eKE3A02riAhCxcKrmNn0fw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=24AZYWMyAAAA:8
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=eKv5sbFBo6EzjR2WmYIA:9 a=CjuIK1q_8ugA:10 a=OpJzUXAu2iv40wiL1hsA:9 a=WmKFyqVom9nkr4PL:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=bG88sKzkDEFeXWNnvthB:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_11,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411210131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 17:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207553

--_000_PH7PR11MB7608DA452240EF0350E296B294222PH7PR11MB7608namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping Joshua

//Hongxu

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of hongxu via lists.openembedded.org <hongxu.jia=
=3Deng.windriver.com@lists.openembedded.org>
Sent: Wednesday, November 20, 2024 1:50 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; JPEWhacker@gmail.com <JPEWhacker@gmail.com>; Jia, Hongxu <Hon=
gxu.Jia@windriver.com>
Subject: [OE-core] [RR V2][NULL][0/3] SPDX 3.0: Reduce redundant spdxid-has=
h symlinks to save inode on host

Summary: SPDX 3.0: Reduce redundant spdxid-hash symlinks to save inode on h=
ost

* Git logs
[oe-core]
commit 5ebf6f058259bc073e83bd2fa2b3b116e6156d60
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Sat Nov 9 17:16:31 2024 +0800

    oeqa/selftest: Add SPDX 3.0 include source cases for core_image_minimal=
 build

    $ oe-selftest -r spdx.SPDX30Check.test_core_image_minimal_include_sourc=
e
    2024-11-20 03:29:24,850 - oe-selftest - INFO - Adding layer libraries:
    2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/poky/meta/lib
    2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/poky/meta-yocto=
-bsp/lib
    2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/poky/meta-selft=
est/lib
    2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/meta-openembedd=
ed/meta-oe/lib
    2024-11-20 03:29:24,868 - oe-selftest - INFO - Checking base configurat=
ion is valid/parsable
    2024-11-20 03:29:27,317 - oe-selftest - INFO - Adding: "include selftes=
t.inc" in path-to/build_spdx3-st/conf/local.conf
    2024-11-20 03:29:27,317 - oe-selftest - INFO - Adding: "include bblayer=
s.inc" in bblayers.conf
    2024-11-20 03:29:27,317 - oe-selftest - INFO - test_core_image_minimal_=
include_source (spdx.SPDX30Check.test_core_image_minimal_include_source)
    2024-11-20 04:52:47,318 - oe-selftest - INFO - Keepalive message
    2024-11-20 05:14:08,115 - oe-selftest - INFO -  ... ok
    2024-11-20 05:21:12,798 - oe-selftest - INFO - ------------------------=
----------------------------------------------
    2024-11-20 05:21:12,798 - oe-selftest - INFO - Ran 1 test in 6706.271s
    2024-11-20 05:21:12,798 - oe-selftest - INFO - OK
    2024-11-20 05:21:32,026 - oe-selftest - INFO - RESULTS:
    2024-11-20 05:21:32,026 - oe-selftest - INFO - RESULTS - spdx.SPDX30Che=
ck.test_core_image_minimal_include_source: PASSED (6280.82s)
    2024-11-20 05:21:32,027 - oe-selftest - INFO - SUMMARY:
    2024-11-20 05:21:32,027 - oe-selftest - INFO - oe-selftest () - Ran 1 t=
est in 6706.272s
    2024-11-20 05:21:32,027 - oe-selftest - INFO - oe-selftest - OK - All r=
equired tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)

    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

commit 3753b084cffcbef374093a442d4e692821d1a29b
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Sat Nov 9 14:18:26 2024 +0800

    sbom30.py: reduce redundant spdxid symlinks to save inode on host

    In order to support all in-scope SPDX data within a single
    JSON-LD file for SPDX 3.0.1, Yocto's SBOM:
    - In native/target/nativesdk recipe, created spdxid-hash symlink
      for each element to point to the JSON-LD file that contains
      element details;
    - In image recipe, use spdxid-hash symlink to collect element
      details from varies of JSON-LD files

    While SPDX_INCLUDE_SOURCES =3D "1", it adds sources to JSON-LD file
    and create 2N+ spdxid-hash symlinks for N source files.
    (N for software_File, N for hasDeclaredLicense's Relationship)

    For large numbers of source files, adding an extra symlink -> real file
    will occupy one more inode (per file), which will need a slot in
    the OS's inode cache. In this situation, disk performance is slow
    and inode is used up quickly

    After commit [sbom30/spdx30: add link prefix and name to namespace
    of spdxId and alias] applied, the namespace of spdxId and alias in
    recipe and package jsonld differs. Use it to create symlink to jsonld,
    take recipe shadow, package shadow and package shadow-src for example:

    For recipe jsonld tmp/deploy/spdx/3.0.1/core2-64/recipes/shadow.spdx.js=
on

        spdxId: http://spdx.org/spdxdocs/recipe-shadow-xxx/...
        alias: recipe-shadow/UNIHASH/...
        symlink: tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-link/recipe-shado=
w.spdx.json -> ../recipes/shadow.spdx.json

    For package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow.spdx.=
json

        spdxId: http://spdx.org/spdxdocs/package-shadow-xxx/...
        alias: package-shadow/UNIHASH/...
        symlink: tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-link/package-shad=
ow.spdx.json -> ../packages/shadow.spdx.json

    In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow-src.sp=
dx.json

        spdxId: http://spdx.org/spdxdocs/package-shadow-src-xxx/...
        alias: package-shadow-src/UNIHASH/...
        symlink: tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-link/package-shad=
ow-src.spdx.json -> ../packages/shadow-src.spdx.json

    Build core-image-minimal with/without this commit, comparing the spdxid=
-link
    number, 7 281 824 -> 6 043

    echo 'SPDX_INCLUDE_SOURCES =3D "1"' >> local.conf

    Without this commit:
    $ time bitbake core-image-minimal
    real    100m17.769s
    user    0m24.516s
    sys     0m4.334s

    $ find tmp/deploy/spdx/3.0.1/*/by-spdxid-hash -name "*.json" |wc -l
    7281824

    With this commit:
    $ time bitbake core-image-minimal
    real    85m12.994s
    user    0m20.423s
    sys     0m4.228s

    $ find tmp/deploy/spdx/3.0.1/*/by-spdxid-link -name "*.json" |wc -l
    6043

    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

commit 0ea8bcaa9a8fe63f1935e02968fbaa541734024b
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Tue Nov 19 20:12:37 2024 +0800

    sbom30/spdx30: add link prefix and name to namespace of spdxId and alia=
s

    In order to simple reference the SPDX ID to instead of making jsonld ha=
sh
    path for each element, only creating one symlink for one file and refer=
encing
    it multiple times, add link prefix and name to the namespace of spdxId =
and alias
    to replace ${PN} to avoid namespace conflict between recipe, packages a=
nd images.

    Take recipe shadow, package shadow and package shadow-src for example:
    Without this commit, spdxId and alias in recipe and package jsonld have=
 the same
    namespace

        spdxId: http://spdx.org/spdxdocs/shadow-xxx/...
        alias: shadow/UNIHASH/...

    After apply this commit, the namespace of spdxId in recipe and package =
jsonld differs:
    In recipe jsonld tmp/deploy/spdx/3.0.1/core2-64/recipes/shadow.spdx.jso=
n

        spdxId: http://spdx.org/spdxdocs/recipe-shadow-xxx/...
        alias: recipe-shadow/UNIHASH/...

    In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow.spdx.j=
son

        spdxId: http://spdx.org/spdxdocs/package-shadow-xxx/...
        alias: package-shadow/UNIHASH/...

    In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow-src.sp=
dx.json

        spdxId: http://spdx.org/spdxdocs/package-shadow-src-xxx/...
        alias: package-shadow-src/UNIHASH/...

    Then will use namespace of spdxId and alias to create link for jsonld f=
ile,
    one symlink for one jsonld file, referenced by elements multiple times

    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>



=3D=3D=3D=3D=3D=3D Testing =3D=3D=3D=3D=3D=3D
* Commands

Build core-image-minimal with/without this commit, comparing the spdxid-lin=
k
number, 7 281 824 -> 6 043

echo 'SPDX_INCLUDE_SOURCES =3D "1"' >> local.conf

Without this commit:
$ time bitbake core-image-minimal
real    100m17.769s
user    0m24.516s
sys     0m4.334s

$ find tmp/deploy/spdx/3.0.1/*/by-spdxid-hash -name "*.json" |wc -l
7281824

With this commit:
$ time bitbake core-image-minimal
real    85m12.994s
user    0m20.423s
sys     0m4.228s

$ find tmp/deploy/spdx/3.0.1/*/by-spdxid-link -name "*.json" |wc -l
6043


$ oe-selftest -r spdx.SPDX30Check.test_core_image_minimal_include_source
2024-11-20 03:29:24,850 - oe-selftest - INFO - Adding layer libraries:
2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/poky/meta/lib
2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/poky/meta-yocto-bsp=
/lib
2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/poky/meta-selftest/=
lib
2024-11-20 03:29:24,850 - oe-selftest - INFO -  path-to/meta-openembedded/m=
eta-oe/lib
2024-11-20 03:29:24,868 - oe-selftest - INFO - Checking base configuration =
is valid/parsable
2024-11-20 03:29:27,317 - oe-selftest - INFO - Adding: "include selftest.in=
c" in path-to/build_spdx3-st/conf/local.conf
2024-11-20 03:29:27,317 - oe-selftest - INFO - Adding: "include bblayers.in=
c" in bblayers.conf
2024-11-20 03:29:27,317 - oe-selftest - INFO - test_core_image_minimal_incl=
ude_source (spdx.SPDX30Check.test_core_image_minimal_include_source)
2024-11-20 04:52:47,318 - oe-selftest - INFO - Keepalive message
2024-11-20 05:14:08,115 - oe-selftest - INFO -  ... ok
2024-11-20 05:21:12,798 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2024-11-20 05:21:12,798 - oe-selftest - INFO - Ran 1 test in 6706.271s
2024-11-20 05:21:12,798 - oe-selftest - INFO - OK
2024-11-20 05:21:32,026 - oe-selftest - INFO - RESULTS:
2024-11-20 05:21:32,026 - oe-selftest - INFO - RESULTS - spdx.SPDX30Check.t=
est_core_image_minimal_include_source: PASSED (6280.82s)
2024-11-20 05:21:32,027 - oe-selftest - INFO - SUMMARY:
2024-11-20 05:21:32,027 - oe-selftest - INFO - oe-selftest () - Ran 1 test =
in 6706.272s
2024-11-20 05:21:32,027 - oe-selftest - INFO - oe-selftest - OK - All requi=
red tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)



--_000_PH7PR11MB7608DA452240EF0350E296B294222PH7PR11MB7608namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Ping Joshua</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
//Hongxu</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of hongxu via lists.openembedded.org &lt;hongxu.jia=3Deng.windriver.com=
@lists.openembedded.org&gt;<br>
<b>Sent:</b> Wednesday, November 20, 2024 1:50 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; JPEWhacker@gmail.com &lt;JPEWhacker@gmail.com&gt=
;; Jia, Hongxu &lt;Hongxu.Jia@windriver.com&gt;<br>
<b>Subject:</b> [OE-core] [RR V2][NULL][0/3] SPDX 3.0: Reduce redundant spd=
xid-hash symlinks to save inode on host</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Summary: SPDX 3.0: Reduce redundant spdxid-hash sy=
mlinks to save inode on host<br>
<br>
* Git logs<br>
[oe-core]<br>
commit 5ebf6f058259bc073e83bd2fa2b3b116e6156d60<br>
Author: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
Date:&nbsp;&nbsp; Sat Nov 9 17:16:31 2024 +0800<br>
<br>
&nbsp;&nbsp;&nbsp; oeqa/selftest: Add SPDX 3.0 include source cases for cor=
e_image_minimal build<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; $ oe-selftest -r spdx.SPDX30Check.test_core_image_minima=
l_include_source<br>
&nbsp;&nbsp;&nbsp; 2024-11-20 03:29:24,850 - oe-selftest - INFO - Adding la=
yer libraries:<br>
&nbsp;&nbsp;&nbsp; 2024-11-20 03:29:24,850 - oe-selftest - INFO -&nbsp; pat=
h-to/poky/meta/lib<br>
&nbsp;&nbsp;&nbsp; 2024-11-20 03:29:24,850 - oe-selftest - INFO -&nbsp; pat=
h-to/poky/meta-yocto-bsp/lib<br>
&nbsp;&nbsp;&nbsp; 2024-11-20 03:29:24,850 - oe-selftest - INFO -&nbsp; pat=
h-to/poky/meta-selftest/lib<br>
&nbsp;&nbsp;&nbsp; 2024-11-20 03:29:24,850 - oe-selftest - INFO -&nbsp; pat=
h-to/meta-openembedded/meta-oe/lib<br>
&nbsp;&nbsp;&nbsp; 2024-11-20 03:29:24,868 - oe-selftest - INFO - Checking =
base configuration is valid/parsable<br>
&nbsp;&nbsp;&nbsp; 2024-11-20 03:29:27,317 - oe-selftest - INFO - Adding: &=
quot;include selftest.inc&quot; in path-to/build_spdx3-st/conf/local.conf<b=
r>
&nbsp;&nbsp;&nbsp; 2024-11-20 03:29:27,317 - oe-selftest - INFO - Adding: &=
quot;include bblayers.inc&quot; in bblayers.conf<br>
&nbsp;&nbsp;&nbsp; 2024-11-20 03:29:27,317 - oe-selftest - INFO - test_core=
_image_minimal_include_source (spdx.SPDX30Check.test_core_image_minimal_inc=
lude_source)<br>
&nbsp;&nbsp;&nbsp; 2024-11-20 04:52:47,318 - oe-selftest - INFO - Keepalive=
 message<br>
&nbsp;&nbsp;&nbsp; 2024-11-20 05:14:08,115 - oe-selftest - INFO -&nbsp; ...=
 ok<br>
&nbsp;&nbsp;&nbsp; 2024-11-20 05:21:12,798 - oe-selftest - INFO - ---------=
-------------------------------------------------------------<br>
&nbsp;&nbsp;&nbsp; 2024-11-20 05:21:12,798 - oe-selftest - INFO - Ran 1 tes=
t in 6706.271s<br>
&nbsp;&nbsp;&nbsp; 2024-11-20 05:21:12,798 - oe-selftest - INFO - OK<br>
&nbsp;&nbsp;&nbsp; 2024-11-20 05:21:32,026 - oe-selftest - INFO - RESULTS:<=
br>
&nbsp;&nbsp;&nbsp; 2024-11-20 05:21:32,026 - oe-selftest - INFO - RESULTS -=
 spdx.SPDX30Check.test_core_image_minimal_include_source: PASSED (6280.82s)=
<br>
&nbsp;&nbsp;&nbsp; 2024-11-20 05:21:32,027 - oe-selftest - INFO - SUMMARY:<=
br>
&nbsp;&nbsp;&nbsp; 2024-11-20 05:21:32,027 - oe-selftest - INFO - oe-selfte=
st () - Ran 1 test in 6706.272s<br>
&nbsp;&nbsp;&nbsp; 2024-11-20 05:21:32,027 - oe-selftest - INFO - oe-selfte=
st - OK - All required tests passed (successes=3D1, skipped=3D0, failures=
=3D0, errors=3D0)<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; Signed-off-by: Hongxu Jia &lt;hongxu.jia@windriver.com&g=
t;<br>
<br>
commit 3753b084cffcbef374093a442d4e692821d1a29b<br>
Author: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
Date:&nbsp;&nbsp; Sat Nov 9 14:18:26 2024 +0800<br>
<br>
&nbsp;&nbsp;&nbsp; sbom30.py: reduce redundant spdxid symlinks to save inod=
e on host<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; In order to support all in-scope SPDX data within a sing=
le<br>
&nbsp;&nbsp;&nbsp; JSON-LD file for SPDX 3.0.1, Yocto's SBOM:<br>
&nbsp;&nbsp;&nbsp; - In native/target/nativesdk recipe, created spdxid-hash=
 symlink<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for each element to point to the JSON-LD fil=
e that contains<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; element details;<br>
&nbsp;&nbsp;&nbsp; - In image recipe, use spdxid-hash symlink to collect el=
ement<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; details from varies of JSON-LD files<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; While SPDX_INCLUDE_SOURCES =3D &quot;1&quot;, it adds so=
urces to JSON-LD file<br>
&nbsp;&nbsp;&nbsp; and create 2N+ spdxid-hash symlinks for N source files.<=
br>
&nbsp;&nbsp;&nbsp; (N for software_File, N for hasDeclaredLicense's Relatio=
nship)<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; For large numbers of source files, adding an extra symli=
nk -&gt; real file<br>
&nbsp;&nbsp;&nbsp; will occupy one more inode (per file), which will need a=
 slot in<br>
&nbsp;&nbsp;&nbsp; the OS's inode cache. In this situation, disk performanc=
e is slow<br>
&nbsp;&nbsp;&nbsp; and inode is used up quickly<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; After commit [sbom30/spdx30: add link prefix and name to=
 namespace<br>
&nbsp;&nbsp;&nbsp; of spdxId and alias] applied, the namespace of spdxId an=
d alias in<br>
&nbsp;&nbsp;&nbsp; recipe and package jsonld differs. Use it to create syml=
ink to jsonld,<br>
&nbsp;&nbsp;&nbsp; take recipe shadow, package shadow and package shadow-sr=
c for example:<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; For recipe jsonld tmp/deploy/spdx/3.0.1/core2-64/recipes=
/shadow.spdx.json<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdxId: <a href=3D"http://spdx.o=
rg/spdxdocs/recipe-shadow-xxx/">http://spdx.org/spdxdocs/recipe-shadow-xxx/=
</a>...<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alias: recipe-shadow/UNIHASH/...=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; symlink: tmp/deploy/spdx/3.0.1/c=
ore2-64/by-spdxid-link/recipe-shadow.spdx.json -&gt; ../recipes/shadow.spdx=
.json<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; For package jsonld tmp/deploy/spdx/3.0.1/core2-64/packag=
es/shadow.spdx.json<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdxId: <a href=3D"http://spdx.o=
rg/spdxdocs/package-shadow-xxx/">http://spdx.org/spdxdocs/package-shadow-xx=
x/</a>...<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alias: package-shadow/UNIHASH/..=
.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; symlink: tmp/deploy/spdx/3.0.1/c=
ore2-64/by-spdxid-link/package-shadow.spdx.json -&gt; ../packages/shadow.sp=
dx.json<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; In package jsonld tmp/deploy/spdx/3.0.1/core2-64/package=
s/shadow-src.spdx.json<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdxId: <a href=3D"http://spdx.o=
rg/spdxdocs/package-shadow-src-xxx/">http://spdx.org/spdxdocs/package-shado=
w-src-xxx/</a>...<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alias: package-shadow-src/UNIHAS=
H/...<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; symlink: tmp/deploy/spdx/3.0.1/c=
ore2-64/by-spdxid-link/package-shadow-src.spdx.json -&gt; ../packages/shado=
w-src.spdx.json<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; Build core-image-minimal with/without this commit, compa=
ring the spdxid-link<br>
&nbsp;&nbsp;&nbsp; number, 7 281 824 -&gt; 6 043<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; echo 'SPDX_INCLUDE_SOURCES =3D &quot;1&quot;' &gt;&gt; l=
ocal.conf<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; Without this commit:<br>
&nbsp;&nbsp;&nbsp; $ time bitbake core-image-minimal<br>
&nbsp;&nbsp;&nbsp; real&nbsp;&nbsp;&nbsp; 100m17.769s<br>
&nbsp;&nbsp;&nbsp; user&nbsp;&nbsp;&nbsp; 0m24.516s<br>
&nbsp;&nbsp;&nbsp; sys&nbsp;&nbsp;&nbsp;&nbsp; 0m4.334s<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; $ find tmp/deploy/spdx/3.0.1/*/by-spdxid-hash -name &quo=
t;*.json&quot; |wc -l<br>
&nbsp;&nbsp;&nbsp; 7281824<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; With this commit:<br>
&nbsp;&nbsp;&nbsp; $ time bitbake core-image-minimal<br>
&nbsp;&nbsp;&nbsp; real&nbsp;&nbsp;&nbsp; 85m12.994s<br>
&nbsp;&nbsp;&nbsp; user&nbsp;&nbsp;&nbsp; 0m20.423s<br>
&nbsp;&nbsp;&nbsp; sys&nbsp;&nbsp;&nbsp;&nbsp; 0m4.228s<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; $ find tmp/deploy/spdx/3.0.1/*/by-spdxid-link -name &quo=
t;*.json&quot; |wc -l<br>
&nbsp;&nbsp;&nbsp; 6043<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; Signed-off-by: Hongxu Jia &lt;hongxu.jia@windriver.com&g=
t;<br>
<br>
commit 0ea8bcaa9a8fe63f1935e02968fbaa541734024b<br>
Author: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
Date:&nbsp;&nbsp; Tue Nov 19 20:12:37 2024 +0800<br>
<br>
&nbsp;&nbsp;&nbsp; sbom30/spdx30: add link prefix and name to namespace of =
spdxId and alias<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; In order to simple reference the SPDX ID to instead of m=
aking jsonld hash<br>
&nbsp;&nbsp;&nbsp; path for each element, only creating one symlink for one=
 file and referencing<br>
&nbsp;&nbsp;&nbsp; it multiple times, add link prefix and name to the names=
pace of spdxId and alias<br>
&nbsp;&nbsp;&nbsp; to replace ${PN} to avoid namespace conflict between rec=
ipe, packages and images.<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; Take recipe shadow, package shadow and package shadow-sr=
c for example:<br>
&nbsp;&nbsp;&nbsp; Without this commit, spdxId and alias in recipe and pack=
age jsonld have the same<br>
&nbsp;&nbsp;&nbsp; namespace<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdxId: <a href=3D"http://spdx.o=
rg/spdxdocs/shadow-xxx/">http://spdx.org/spdxdocs/shadow-xxx/</a>...<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alias: shadow/UNIHASH/...<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; After apply this commit, the namespace of spdxId in reci=
pe and package jsonld differs:<br>
&nbsp;&nbsp;&nbsp; In recipe jsonld tmp/deploy/spdx/3.0.1/core2-64/recipes/=
shadow.spdx.json<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdxId: <a href=3D"http://spdx.o=
rg/spdxdocs/recipe-shadow-xxx/">http://spdx.org/spdxdocs/recipe-shadow-xxx/=
</a>...<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alias: recipe-shadow/UNIHASH/...=
<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; In package jsonld tmp/deploy/spdx/3.0.1/core2-64/package=
s/shadow.spdx.json<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdxId: <a href=3D"http://spdx.o=
rg/spdxdocs/package-shadow-xxx/">http://spdx.org/spdxdocs/package-shadow-xx=
x/</a>...<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alias: package-shadow/UNIHASH/..=
.<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; In package jsonld tmp/deploy/spdx/3.0.1/core2-64/package=
s/shadow-src.spdx.json<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdxId: <a href=3D"http://spdx.o=
rg/spdxdocs/package-shadow-src-xxx/">http://spdx.org/spdxdocs/package-shado=
w-src-xxx/</a>...<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alias: package-shadow-src/UNIHAS=
H/...<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; Then will use namespace of spdxId and alias to create li=
nk for jsonld file,<br>
&nbsp;&nbsp;&nbsp; one symlink for one jsonld file, referenced by elements =
multiple times<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; Signed-off-by: Hongxu Jia &lt;hongxu.jia@windriver.com&g=
t;<br>
<br>
<br>
<br>
=3D=3D=3D=3D=3D=3D Testing =3D=3D=3D=3D=3D=3D<br>
* Commands<br>
<br>
Build core-image-minimal with/without this commit, comparing the spdxid-lin=
k<br>
number, 7 281 824 -&gt; 6 043<br>
<br>
echo 'SPDX_INCLUDE_SOURCES =3D &quot;1&quot;' &gt;&gt; local.conf<br>
<br>
Without this commit:<br>
$ time bitbake core-image-minimal<br>
real&nbsp;&nbsp;&nbsp; 100m17.769s<br>
user&nbsp;&nbsp;&nbsp; 0m24.516s<br>
sys&nbsp;&nbsp;&nbsp;&nbsp; 0m4.334s<br>
<br>
$ find tmp/deploy/spdx/3.0.1/*/by-spdxid-hash -name &quot;*.json&quot; |wc =
-l<br>
7281824<br>
<br>
With this commit:<br>
$ time bitbake core-image-minimal<br>
real&nbsp;&nbsp;&nbsp; 85m12.994s<br>
user&nbsp;&nbsp;&nbsp; 0m20.423s<br>
sys&nbsp;&nbsp;&nbsp;&nbsp; 0m4.228s<br>
<br>
$ find tmp/deploy/spdx/3.0.1/*/by-spdxid-link -name &quot;*.json&quot; |wc =
-l<br>
6043<br>
<br>
<br>
$ oe-selftest -r spdx.SPDX30Check.test_core_image_minimal_include_source<br=
>
2024-11-20 03:29:24,850 - oe-selftest - INFO - Adding layer libraries:<br>
2024-11-20 03:29:24,850 - oe-selftest - INFO -&nbsp; path-to/poky/meta/lib<=
br>
2024-11-20 03:29:24,850 - oe-selftest - INFO -&nbsp; path-to/poky/meta-yoct=
o-bsp/lib<br>
2024-11-20 03:29:24,850 - oe-selftest - INFO -&nbsp; path-to/poky/meta-self=
test/lib<br>
2024-11-20 03:29:24,850 - oe-selftest - INFO -&nbsp; path-to/meta-openembed=
ded/meta-oe/lib<br>
2024-11-20 03:29:24,868 - oe-selftest - INFO - Checking base configuration =
is valid/parsable<br>
2024-11-20 03:29:27,317 - oe-selftest - INFO - Adding: &quot;include selfte=
st.inc&quot; in path-to/build_spdx3-st/conf/local.conf<br>
2024-11-20 03:29:27,317 - oe-selftest - INFO - Adding: &quot;include bblaye=
rs.inc&quot; in bblayers.conf<br>
2024-11-20 03:29:27,317 - oe-selftest - INFO - test_core_image_minimal_incl=
ude_source (spdx.SPDX30Check.test_core_image_minimal_include_source)<br>
2024-11-20 04:52:47,318 - oe-selftest - INFO - Keepalive message<br>
2024-11-20 05:14:08,115 - oe-selftest - INFO -&nbsp; ... ok<br>
2024-11-20 05:21:12,798 - oe-selftest - INFO - ----------------------------=
------------------------------------------<br>
2024-11-20 05:21:12,798 - oe-selftest - INFO - Ran 1 test in 6706.271s<br>
2024-11-20 05:21:12,798 - oe-selftest - INFO - OK<br>
2024-11-20 05:21:32,026 - oe-selftest - INFO - RESULTS:<br>
2024-11-20 05:21:32,026 - oe-selftest - INFO - RESULTS - spdx.SPDX30Check.t=
est_core_image_minimal_include_source: PASSED (6280.82s)<br>
2024-11-20 05:21:32,027 - oe-selftest - INFO - SUMMARY:<br>
2024-11-20 05:21:32,027 - oe-selftest - INFO - oe-selftest () - Ran 1 test =
in 6706.272s<br>
2024-11-20 05:21:32,027 - oe-selftest - INFO - oe-selftest - OK - All requi=
red tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)<br>
<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH7PR11MB7608DA452240EF0350E296B294222PH7PR11MB7608namp_--

