Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11304C5AD4E
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 06:11:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23450.1786338583452954396
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 22:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mwsjyC0J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2682d7bd28=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A4F2mv1060555
	for <openembedded-core@lists.openembedded.org>; Sun, 9 Aug 2026 21:33:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:message-id:mime-version:subject:to;
	 s=PPS06212021; bh=8afW62/fnwCvLGwOsTBKtk1n6r2vxhbL8E+CbRsiixM=; b=
	mwsjyC0JrveSpQyujrIws5XSb/K/5ZsjdoIEP4W8hgto33leyZX1ejNkK3x5rIZm
	1dxmKInbH7SGT9QFf/do1RVIVbum2Z6GjF2rLt1swYhlsaRsXAzrTZY4Jp2TsA09
	pDyJ41gGAEwDUqkp/N6oI/LgCR5HMeoyW0gOuJptfUf/MeJZUE9H/NwdtcFhUi8b
	+Lb6yXQPEV47fD0wDHYpvDlNSATEhso7jVmu+hbJL6OJa4sHry28bupVXL20uwVO
	J4FKMcES24pv0XTcwTL781VHqC3ermP0Y8Jj5Tff7/2gMv9z3noTcUwGmz2ay1kh
	yC718U08EboWhRDFxKgfsA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013024.outbound.protection.outlook.com [40.93.201.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fx3yehequ-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 21:33:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ah5IdUltzaDaan0igr0r856qE3WGF82LwNmcGv2IyrgIBll85snxcZEUKZDHmQPP+JItEpG8Qbqbidlmm+OKJxUc6zSA/ICNZ9getzpDpUf6Bii2aFKXAG9EjD3FOhzuZrsiV7ooPW5gIi+MDb2n5VGX8YYJvGCeXHqI/4+oGWyOaghmXCc6hH+fO0PuDUkhwLWI2Ij7B6Z88EVByrOIc+WTthFhVB0xGBiyi8ngYfSrI5VuYWamyitxWE1lWQ/8Wq129O/qzJydxoFmIj6n5CnZYYi+xB2rFoLQosKJmEPkGmu6JxLgWGrg7I9hoEEHbPggV11FQ+8lWvM2IaRbkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8afW62/fnwCvLGwOsTBKtk1n6r2vxhbL8E+CbRsiixM=;
 b=FbL7ricZEgPXjD8cY6fj9NgPgVBLJCfTXm4EXAtuFF8/8HHiqxk+f77uiBdcla7aXrWG3a7akD5uUgJ9xSxLCTqpGdmYIR07pv+LbFRECiwjMH+CQN5ybmk7uY7stHloOPGq3c84fyVO29shJRu7d470eYl0i+j/wzu6EmZqYT8hAm4clwBw2a3ngRk5uYsnHRWCmoBFvbNsEVTq2jAJy7Iks3/YDmKpf9a/DNI9D2P7v0OQ2RYq/V6wHq7V8FMxetXS2U4SoRNaDPJTw73BDtDGGw4RCRJ6MjgP06Veip0lkk7y77gB2/fr4sz93ezOFW3KarzGB5KZ5tLTGotY4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15)
 by SJ0PR11MB4991.namprd11.prod.outlook.com (2603:10b6:a03:2df::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 04:33:49 +0000
Received: from CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec]) by CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 04:33:49 +0000
From: "Barde, Himani Ramesh" <HimaniRamesh.Barde@windriver.com>
To: "Barde, Himani Ramesh" <HimaniRamesh.Barde@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "Komati, Shiva"
	<Shiva.Komati@windriver.com>,
        Himani Barde <himani.barde@windriver.com>
Subject: Re: [PATCH] libarchive: backport fix for archive_read_append_filter test failure
Thread-Topic: [PATCH] libarchive: backport fix for archive_read_append_filter
 test failure
Thread-Index: AQHdKIFjTxoRmNVI7EOO5m29uMo1rA==
Date: Mon, 10 Aug 2026 04:33:49 +0000
Message-ID: 
 <CH3PR11MB87748BA4352AA4FB377928768FDE2@CH3PR11MB8774.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-08-10T04:33:48.358Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8774:EE_|SJ0PR11MB4991:EE_
x-ms-office365-filtering-correlation-id: 192c478e-9fb8-48c7-2f04-08def69892cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10070799003|12006099003|18002099003|11063799006|56012099006|8096899003|13003099007|38070700021|6133799003|16056099006|10067099003;
x-microsoft-antispam-message-info: 
 kDiXrT37Y9fLAFyE+OBTLsLWXYN0D3/Hqo3soiUHFcH4RfaZFFfPVUBRbPid7SDIy7K4zeid8VTiwDTTnbZx71kGDVCTSf/q6/jK+VRIYWPIQcmdeW1O31FeLUGILL0FguVLZSK7vKnDint59fXy8JaVZzwbx78DHyULsFDykWYpSb8CGMojzCVyrXPDZy6e4sWs5tZ3hvhVWduxa76o7IuKFbdihXy2wQEppiZFbhz9LkHxdcwi25POUBNcudf4KGY9k+h0N7Dl0/5KVtKNVTVRbtpp+sWoyDGPM2wr/pWi1SAFgtcghGtO43EiuAZVAilFKNTxkwbmM8ZL6ZGjJuuE+sJ1wx7XKlBfDfNPb1SitV1U92qA8yBnxatDkir4LVi8INeAAAtyiMSIAEPJyddfZPhDk6SYOYvLu7mr3xG0FMTqZ/zfVDl7cjdYqe4Bv3JblE325wR8cttQvc3ItEUrkrAhTnf+tT4Vk1PV+OUxcLKuzqZGRdTos8MbkcJpmPbMdLpPvjjQtorim5KV1GMJZgoLYSmP3x3SqNM2r7YYvaF/chwvA3bD2WHSPtsMfxTNC29tLzigpdYYMgnF4wxNCtRms4jkQZa3Ac1LKUgt2v4uESK1/CQycPGaX+IWjbkzLf8yhEIypoAVfL8Jy/yg9u7o4U+hnOrR0qTe38U=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8774.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10070799003)(12006099003)(18002099003)(11063799006)(56012099006)(8096899003)(13003099007)(38070700021)(6133799003)(16056099006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?YlZTCiBsZli9MT0aHU6TF0FD1d4Kja7Rd5743AQebiWaTs9M2LDRAK3v5n?=
 =?iso-8859-1?Q?NrfPdDLr4+CSk2U7uUEtGqnEMqmSNGw1URdviBx99QUaUCc8RwFnNUA/2w?=
 =?iso-8859-1?Q?/WDx/1+Vl4Vu9YErbQrpM6FSMTQqRLqM5HWoIGYm+ScV2LDEgB1Loesnx7?=
 =?iso-8859-1?Q?fh1s7K2XpLZ3r8HyBAxT8NdbkvJqxwCvfk6VtP3gosg+QLHG8ZnhkxnmQk?=
 =?iso-8859-1?Q?AYP3cYkzdJ/NAbQvw2wMHxUgsNalYzHAM8QsaTh8mTiy7b/dXS4Q+pAlHH?=
 =?iso-8859-1?Q?u7ieaC+EJfrYAEtZa56HpM0EdECuUFFroSgUgdN23MkrzuLcbdrcAgto0i?=
 =?iso-8859-1?Q?Ed1pCQAixX/GaueC/0+VnJXCo5U7JXH3QGdtP2AcY8Tt1GPAmam6PX3/z4?=
 =?iso-8859-1?Q?B388TyOnAJ6UFYk4Z/Njg99BQb1sHIBxloTxlT2bSkqfLBCAKb2MO2kTPH?=
 =?iso-8859-1?Q?/hb4yfF0a4xbG15TbKH+A/wEKC1qwb4+dMUkSies+3T+9sHqvZozMJJ67M?=
 =?iso-8859-1?Q?9NWXFe9xQuRtcnzDW6qGlXn2Kru7tEBG1uinKZ/Esvh242ru6zKQWujDwt?=
 =?iso-8859-1?Q?vxHtwtEyrT8MjRH3VGXXJN1jB2vNxkmSnE3WcNEJCwPZECALKKXnk1XbQ4?=
 =?iso-8859-1?Q?jle8HkqOFfMCEPODU9pu1D1tnX4SHHRmqlu5n2sboRw8eB+Hd0K6FjcZEk?=
 =?iso-8859-1?Q?WbRbeoR7YsyGE80CtrNfG/BuoI3mQexadud3OoLctTuHYamrmp0M/01iBK?=
 =?iso-8859-1?Q?Q8pbDB2b20KV8otPVI1cBXR3UTXj7vBzUjtE9/QZ25C7OY5sOzrkBv8vUC?=
 =?iso-8859-1?Q?+pZfPlWTlGGW2Xm6fDeupkq6aATJ+arnrnavongU9dX4J0mu1E2+aE8SY9?=
 =?iso-8859-1?Q?4pmhlxhrAaUSJj/otBdgZectFu3qbNT9O8obWjzClLeiGzyjxrTFTZkYF2?=
 =?iso-8859-1?Q?MP+Dt1QFfCEMBqxubYn59wO+ypXo6R4wJuYN6xPPorgDNNm2i0k7ZW3xcQ?=
 =?iso-8859-1?Q?hjjWDi+HSR8IxcMbKvOCOnUyBgZfk88XfMEE9nPAAotyt+qUlLFcss7nQU?=
 =?iso-8859-1?Q?JC0nUi+aLNdb64tum3AvkRI1+/5690BT7lSyW89pguPi2ogWC3GWsySNgM?=
 =?iso-8859-1?Q?RhxJuj72UjVp9YIuRgTO32ZmX6MTQJFKjzSyNeTpIFpB29oGSZsjkt0sTu?=
 =?iso-8859-1?Q?UKw+aNVjF0YHsBYYGcFKUabBtaIdIBlPDI6HiHI8AxT8QSyY30bR9IuVz4?=
 =?iso-8859-1?Q?gQBGer+Wq0J4c8cvPrCr1d55UKWdBqa8VxI86WoSMHhm3kaiovnyEgzMuD?=
 =?iso-8859-1?Q?zTFNqGUWhFaGLuGA5kiHZyFYNVd+1lNpzh84puwb44SGOTt9bGvsw3gKuc?=
 =?iso-8859-1?Q?+Oik4Ka8EC4p+XaRWBUG0IPULk0XFbqPqlV6hDU/0ACwbWkClPxf4U16C3?=
 =?iso-8859-1?Q?sCs4nAE7AQpu+JLYizbDSK3BZ+KcbH2w/om3nOjGZFk7aFQs8bvTaJx/qj?=
 =?iso-8859-1?Q?RALcdK+LOCXYzcQfbheCojk5o87F/NfxN1O51uKmKSdQTEPlo5DRePJ1CY?=
 =?iso-8859-1?Q?kVjdkzv1VtiL4gqAtuVrMMgd6gpnk03nvvBcGEAVdx4OJvKZifI2oD4Slj?=
 =?iso-8859-1?Q?lm5952weGevLpzAYKEYPrGcbJ1Vx/8enilbWNkHgAhRqhdTHtcWd+pXYQu?=
 =?iso-8859-1?Q?bUQwm+A7CYaZj+OEK493SEi//NmJ47ShFdz1dilQ9JMTnEmT5k/CS4Nu9i?=
 =?iso-8859-1?Q?EJDtvh+OwUuqHSRQEGEegPf1BwGD8cBfTJnRabXHsgashGE6qduN+mKaNJ?=
 =?iso-8859-1?Q?FresyHYe25BjDajnh4DkB35L1vP4cUcFBJsF4DJtzQt1HSICoHoX7hIrJj?=
 =?iso-8859-1?Q?cv?=
x-ms-exchange-antispam-messagedata-1: zdsmhllqGjHHz4LpJGoODPji24zVgFvswQA=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	kOnZXYkTX6HTNNKiJNickHIWJF4KeWce92BM+rXefARjMksEoM59QG8E2gNGjIe2ZLOp5oyYgk3Urh7Zsek0uz9Nkip2Ve28v6P9xGqcOnplWuiS4N2Uek25vjyz5A5MZEfCzS3aCHRCxLtWz7HIXyQUhdKQVNwneawY7mtkcEQPz5xoGnilFIgcNrtcUC4BW29IeP23ixOKJkucalW1BmYkF/aD737IzQ2AR0tZWltdu2WWSXyIMs/qUffMtYFJE09VyZDihPVAmaknRy5bsRO96SMrXVHWTz3nu6G6XX9VOYNkka+0yShCA64CCdpQqhlaTJCpTbJKJZTcX0oE2g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8774.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 192c478e-9fb8-48c7-2f04-08def69892cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2026 04:33:49.1278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z7GuD1s/a51uZ6l7yyNRF/MGw4lnYAH5L0EpGTd0aWDOjDjTGLgF/KgkSWceIU9H/6dAGUcCkwvy8kjvzLYRXpu11Yc+vXjQ3U3Lj7rPLzTAa4dN5dRHvw5NsPiCszme
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4991
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAzNSBTYWx0ZWRfXz3Ifft7M769J
 nOcCV1C5PKLfHv4yi5/zCv8zCWfbeDVLwXKANR+ETCLyLWeTfZXjOIsmxgEFLgAZxvMHAS/Ocsk
 QeEdir76sJOoAtYUaHztIVyVY9bZfIBopc1czXy88z93S1gmVuU9L6WL0q39gG5UYnD4Oa92BI5
 U0dBNYss2oxLtZwtMcPklWKPtu97qeUPcldaeA23Mifq5jVCONVyibBa0+mA7z4dLSRH8oXiR8M
 0jPy1MKom3JRRcYB6Xv/0w6PrCI7ZyPVS5X2EBYGPsDqHoTqNHKRazBdPIUdzR27jEeXyWbQAIo
 n78/6mDwAo59OE/7PVlkATVsRrJTR0Fpx58uj6uXoDP+7TDMPgImbp8keeuthANT5gNns0jrk//
 d2LuzWkX9GPXt1wAoinlaUMt4ai8WigFVjtQMeSLJqziqFvEweZohLROyv8SOY5sOMW4haht10H
 j/p3VlVx1qTQ9WZoVNg==
X-Authority-Analysis: v=2.4 cv=NbHWEWD4 c=1 sm=1 tr=0 ts=6a7954b0 cx=c_pps
 a=i9oGDAf80PfF53tpRsLhyQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=NEAV23lmAAAA:8 a=3uWsZ661AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=tyuvAb6jAAAA:8 a=KVw7aSyUq2OUZOWIxHEA:9 a=wPNLvfGTeEIA:10
 a=L4pqCS8NAZTdlyclMG0A:9 a=KWSyOgzDy7FW4_Nn:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=fYNom5PXsM5enKJDCoVv:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=vMd6T1JfvD_20K6YSfI9:22
X-Proofpoint-GUID: RbaeVEa3zfqKk6fOILsKFrHc9PsmmYVd
X-Proofpoint-ORIG-GUID: RbaeVEa3zfqKk6fOILsKFrHc9PsmmYVd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAzNSBTYWx0ZWRfX24JXj45nZ6d9
 UohbJB9rmAacl1gYsy+KDw/upLNEjJXfMpQhBi+DSOT7fAjSHoKNf7JVATu9Z0emV4einpJAgy3
 38CV/1r4TalNnCFFagaKeGzSSRHcHJWeZz64Vz47Dji6Qr2Ge/MK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100035
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CH3PR11MB87748BA4352AA4FB377928768FDE2CH3PR11MB8774namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 06:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243111

--_000_CH3PR11MB87748BA4352AA4FB377928768FDE2CH3PR11MB8774namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Apologies for the duplicate sends. I had an incorrect From email address in=
 my git config which caused delivery failures, so I re-sent after fixing it=
. I didn't realize the earlier attempts had gone through to the list.

Please ignore this version - the correct patch is the one with the updated =
From address.

I've verified that my git send-email configuration is now correct to avoid =
this in the future.

Sorry for the noise.

Thanks,
Himani

________________________________
From: Barde, Himani Ramesh
Sent: Friday, August 7, 2026 1:13 PM
To: openembedded-core@lists.openembedded.org
Cc: MacLeod, Randy; Komati, Shiva; Himani Barde
Subject: Re: [PATCH] libarchive: backport fix for archive_read_append_filte=
r test failure

From: Himani Barde <himani.barde@windriver.com>

Backport upstream commit 50b585bb ('append_filter: Use last bidder for
filter') to fix test_read_append_rpm_filter ptest failure.

The archive_read_append_filter() function used a name-based bidder
lookup loop that could fail to locate the correct bidder due to a
desync between the loop index and the bidder array. The fix replaces
this with get_last_bidder() which returns the most recently registered
bidder.

Upstream: https://github.com/libarchive/libarchive/commit/50b585bb

Signed-off-by: Himani Barde <himani.barde@windriver.com>
---
 ...nd_filter-Use-last-bidder-for-filter.patch | 188 ++++++++++++++++++
 .../libarchive/libarchive_3.8.9.bb            |   1 +
 2 files changed, 189 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append=
_filter-Use-last-bidder-for-filter.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-append_filter=
-Use-last-bidder-for-filter.patch b/meta/recipes-extended/libarchive/libarc=
hive/0001-append_filter-Use-last-bidder-for-filter.patch
new file mode 100644
index 0000000000..8e1eb0e938
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Use-la=
st-bidder-for-filter.patch
@@ -0,0 +1,188 @@
+From 50b585bb55484cdc70bd92852a477178dc43485c Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 2 Aug 2026 14:27:17 +0200
+Subject: [PATCH] append_filter: Use last bidder for filter
+
+Appending a filter implies appending a bidder. Always use the last added
+bidder, since it was just added. This avoids desync situations where
+previously added bidders could erroneously match.
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit=
/50b585bb]
+---
+ libarchive/archive_read_append_filter.c | 72 ++++++++-----------------
+ 1 file changed, 22 insertions(+), 50 deletions(-)
+
+diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_=
read_append_filter.c
+index 8de1b2ea..9dd9f536 100644
+--- a/libarchive/archive_read_append_filter.c
++++ b/libarchive/archive_read_append_filter.c
+@@ -33,14 +33,25 @@
+ #include "archive_private.h"
+ #include "archive_read_private.h"
+
++static struct archive_read_filter_bidder *
++get_last_bidder(struct archive_read *a)
++{
++  size_t i;
++
++  for (i =3D 0; i < sizeof(a->bidders) / sizeof(a->bidders[0]); i++)
++  {
++    if (a->bidders[i].vtable =3D=3D NULL)
++      break;
++  }
++
++  return a->bidders + (i - 1);
++}
++
+ int
+ archive_read_append_filter(struct archive *_a, int code)
+ {
+-  int r1, r2, number_bidders, i;
+-  const char *str;
+-  struct archive_read_filter_bidder *b;
+-  struct archive_read_filter *f;
+   struct archive_read *a =3D (struct archive_read *)_a;
++  int r1, r2;
+
+   r2 =3D (ARCHIVE_OK);
+   switch (code)
+@@ -53,15 +64,12 @@ archive_read_append_filter(struct archive *_a, int cod=
e)
+       r1 =3D (ARCHIVE_OK);
+       break;
+     case ARCHIVE_FILTER_GZIP:
+-      str =3D "gzip";
+       r1 =3D archive_read_support_filter_gzip(_a);
+       break;
+     case ARCHIVE_FILTER_BZIP2:
+-      str =3D "bzip2";
+       r1 =3D archive_read_support_filter_bzip2(_a);
+       break;
+     case ARCHIVE_FILTER_COMPRESS:
+-      str =3D "compress (.Z)";
+       r1 =3D archive_read_support_filter_compress(_a);
+       break;
+     case ARCHIVE_FILTER_PROGRAM:
+@@ -69,43 +77,33 @@ archive_read_append_filter(struct archive *_a, int cod=
e)
+           "Cannot append program filter using archive_read_append_filter"=
);
+       return (ARCHIVE_FATAL);
+     case ARCHIVE_FILTER_LZMA:
+-      str =3D "lzma";
+       r1 =3D archive_read_support_filter_lzma(_a);
+       break;
+     case ARCHIVE_FILTER_XZ:
+-      str =3D "xz";
+       r1 =3D archive_read_support_filter_xz(_a);
+       break;
+     case ARCHIVE_FILTER_UU:
+-      str =3D "uu";
+       r1 =3D archive_read_support_filter_uu(_a);
+       break;
+     case ARCHIVE_FILTER_RPM:
+-      str =3D "rpm";
+       r1 =3D archive_read_support_filter_rpm(_a);
+       break;
+     case ARCHIVE_FILTER_LZ4:
+-      str =3D "lz4";
+       r1 =3D archive_read_support_filter_lz4(_a);
+       break;
+     case ARCHIVE_FILTER_ZSTD:
+-      str =3D "zstd";
+       r1 =3D archive_read_support_filter_zstd(_a);
+       break;
+     case ARCHIVE_FILTER_LZIP:
+-      str =3D "lzip";
+       r1 =3D archive_read_support_filter_lzip(_a);
+       break;
+     case ARCHIVE_FILTER_LZOP:
+-      str =3D "lzop";
+       r1 =3D archive_read_support_filter_lzop(_a);
+       break;
+     case ARCHIVE_FILTER_LRZIP:
+-      str =3D "lrzip";
+       r1 =3D archive_read_support_filter_lrzip(_a);
+       break;
+     case ARCHIVE_FILTER_GRZIP:
+-      str =3D "grzip";
+       r1 =3D archive_read_support_filter_grzip(_a);
+       break;
+     default:
+@@ -114,22 +112,10 @@ archive_read_append_filter(struct archive *_a, int c=
ode)
+       return (ARCHIVE_FATAL);
+   }
+
+-  if (code !=3D ARCHIVE_FILTER_NONE)
++  if (r1 > ARCHIVE_FATAL && code !=3D ARCHIVE_FILTER_NONE)
+   {
+-    number_bidders =3D sizeof(a->bidders) / sizeof(a->bidders[0]);
+-
+-    b =3D a->bidders;
+-    for (i =3D 1; i < number_bidders; i++, b++)
+-    {
+-      if (!b->name || !strcmp(b->name, str))
+-        break;
+-    }
+-    if (!b->name || strcmp(b->name, str))
+-    {
+-      archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
+-          "Internal error: Unable to append filter");
+-      return (ARCHIVE_FATAL);
+-    }
++    struct archive_read_filter_bidder *b;
++    struct archive_read_filter *f;
+
+     f =3D calloc(1, sizeof(*f));
+     if (f =3D=3D NULL)
+@@ -137,6 +123,7 @@ archive_read_append_filter(struct archive *_a, int cod=
e)
+       archive_set_error(&a->archive, ENOMEM, "Out of memory");
+       return (ARCHIVE_FATAL);
+     }
++    b =3D get_last_bidder(a);
+     f->bidder =3D b;
+     f->archive =3D a;
+     f->upstream =3D a->filter;
+@@ -162,37 +149,22 @@ int
+ archive_read_append_filter_program_signature(struct archive *_a,
+   const char *cmd, const void *signature, size_t signature_len)
+ {
+-  int r, number_bidders, i;
++  struct archive_read *a =3D (struct archive_read *)_a;
+   struct archive_read_filter_bidder *b;
+   struct archive_read_filter *f;
+-  struct archive_read *a =3D (struct archive_read *)_a;
++  int r;
+
+   if (archive_read_support_filter_program_signature(_a, cmd, signature,
+     signature_len) !=3D (ARCHIVE_OK))
+     return (ARCHIVE_FATAL);
+
+-  number_bidders =3D sizeof(a->bidders) / sizeof(a->bidders[0]);
+-
+-  b =3D a->bidders;
+-  for (i =3D 0; i < number_bidders; i++, b++)
+-  {
+-    /* Program bidder name set to filter name after initialization */
+-    if (b->data && !b->name)
+-      break;
+-  }
+-  if (!b->data)
+-  {
+-    archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
+-        "Internal error: Unable to append program filter");
+-    return (ARCHIVE_FATAL);
+-  }
+-
+   f =3D calloc(1, sizeof(*f));
+   if (f =3D=3D NULL)
+   {
+     archive_set_error(&a->archive, ENOMEM, "Out of memory");
+     return (ARCHIVE_FATAL);
+   }
++  b =3D get_last_bidder(a);
+   f->bidder =3D b;
+   f->archive =3D a;
+   f->upstream =3D a->filter;
+--
+2.54.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.8.9.bb
index 63c66eea81..35b724ca39 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
@@ -31,6 +31,7 @@ EXTRA_OECONF +=3D "--enable-largefile --without-iconv"

 SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://run-ptest \
+           file://0001-append_filter-Use-last-bidder-for-filter.patch \
            file://0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypt=
o.patch \
           "
 UPSTREAM_CHECK_URI =3D "https://www.libarchive.org/"
--
2.54.0


--_000_CH3PR11MB87748BA4352AA4FB377928768FDE2CH3PR11MB8774namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Apologies for the duplicate sends. I had an incorrect From email address in=
 my git config which caused delivery failures, so I re-sent after fixing it=
. I didn't realize the earlier attempts had gone through to the list.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please ignore this version - the correct patch is the one with the updated =
From address.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I've verified that my git send-email configuration is now correct to avoid =
this in the future.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Sorry for the noise.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Himani</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Barde, Himani Ramesh<br>
<b>Sent:</b> Friday, August 7, 2026 1:13 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org<br>
<b>Cc:</b> MacLeod, Randy; Komati, Shiva; Himani Barde<br>
<b>Subject:</b> Re: [PATCH] libarchive: backport fix for archive_read_appen=
d_filter test failure
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">From: Himani Barde &lt;himani.barde@windriv=
er.com&gt;<br>
<br>
Backport upstream commit 50b585bb ('append_filter: Use last bidder for<br>
filter') to fix test_read_append_rpm_filter ptest failure.<br>
<br>
The archive_read_append_filter() function used a name-based bidder<br>
lookup loop that could fail to locate the correct bidder due to a<br>
desync between the loop index and the bidder array. The fix replaces<br>
this with get_last_bidder() which returns the most recently registered<br>
bidder.<br>
<br>
Upstream: <a href=3D"https://github.com/libarchive/libarchive/commit/50b585=
bb" target=3D"_blank" id=3D"OWA66187db6-07db-226b-1319-28b4d5e335ed" class=
=3D"OWAAutoLink" rel=3D"noopener noreferrer" data-auth=3D"NotApplicable">
https://github.com/libarchive/libarchive/commit/50b585bb</a><br>
<br>
Signed-off-by: Himani Barde &lt;himani.barde@windriver.com&gt;<br>
---<br>
&nbsp;...nd_filter-Use-last-bidder-for-filter.patch | 188 +++++++++++++++++=
+<br>
&nbsp;.../libarchive/libarchive_3.8.9.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&nbsp;2 files changed, 189 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-a=
ppend_filter-Use-last-bidder-for-filter.patch<br>
<br>
diff --git a/meta/recipes-extended/libarchive/libarchive/0001-append_filter=
-Use-last-bidder-for-filter.patch b/meta/recipes-extended/libarchive/libarc=
hive/0001-append_filter-Use-last-bidder-for-filter.patch<br>
new file mode 100644<br>
index 0000000000..8e1eb0e938<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Use-la=
st-bidder-for-filter.patch<br>
@@ -0,0 +1,188 @@<br>
+From 50b585bb55484cdc70bd92852a477178dc43485c Mon Sep 17 00:00:00 2001<br>
+From: Tobias Stoeckmann &lt;tobias@stoeckmann.org&gt;<br>
+Date: Sun, 2 Aug 2026 14:27:17 +0200<br>
+Subject: [PATCH] append_filter: Use last bidder for filter<br>
+<br>
+Appending a filter implies appending a bidder. Always use the last added<b=
r>
+bidder, since it was just added. This avoids desync situations where<br>
+previously added bidders could erroneously match.<br>
+<br>
+Signed-off-by: Tobias Stoeckmann &lt;tobias@stoeckmann.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/libarchive/libarc=
hive/commit/50b585bb" target=3D"_blank" id=3D"OWA5359e9d3-04be-ecb2-62df-86=
ddcfc6b9e4" class=3D"OWAAutoLink" rel=3D"noopener noreferrer" data-auth=3D"=
NotApplicable">https://github.com/libarchive/libarchive/commit/50b585bb</a>=
]<br>
+---<br>
+ libarchive/archive_read_append_filter.c | 72 ++++++++-----------------<br=
>
+ 1 file changed, 22 insertions(+), 50 deletions(-)<br>
+<br>
+diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_=
read_append_filter.c<br>
+index 8de1b2ea..9dd9f536 100644<br>
+--- a/libarchive/archive_read_append_filter.c<br>
++++ b/libarchive/archive_read_append_filter.c<br>
+@@ -33,14 +33,25 @@<br>
+ #include &quot;archive_private.h&quot;<br>
+ #include &quot;archive_read_private.h&quot;<br>
+<br>
++static struct archive_read_filter_bidder *<br>
++get_last_bidder(struct archive_read *a)<br>
++{<br>
++&nbsp; size_t i;<br>
++<br>
++&nbsp; for (i =3D 0; i &lt; sizeof(a-&gt;bidders) / sizeof(a-&gt;bidders[=
0]); i++)<br>
++&nbsp; {<br>
++&nbsp;&nbsp;&nbsp; if (a-&gt;bidders[i].vtable =3D=3D NULL)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
++&nbsp; }<br>
++<br>
++&nbsp; return a-&gt;bidders + (i - 1);<br>
++}<br>
++<br>
+ int<br>
+ archive_read_append_filter(struct archive *_a, int code)<br>
+ {<br>
+-&nbsp; int r1, r2, number_bidders, i;<br>
+-&nbsp; const char *str;<br>
+-&nbsp; struct archive_read_filter_bidder *b;<br>
+-&nbsp; struct archive_read_filter *f;<br>
+&nbsp;&nbsp; struct archive_read *a =3D (struct archive_read *)_a;<br>
++&nbsp; int r1, r2;<br>
+<br>
+&nbsp;&nbsp; r2 =3D (ARCHIVE_OK);<br>
+&nbsp;&nbsp; switch (code)<br>
+@@ -53,15 +64,12 @@ archive_read_append_filter(struct archive *_a, int cod=
e)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D (ARCHIVE_OK);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_GZIP:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;gzip&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_gz=
ip(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_BZIP2:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;bzip2&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_bz=
ip2(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_COMPRESS:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;compress (.Z)&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_co=
mpress(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_PROGRAM:<br>
+@@ -69,43 +77,33 @@ archive_read_append_filter(struct archive *_a, int cod=
e)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Cannot =
append program filter using archive_read_append_filter&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (ARCHIVE_FATAL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_LZMA:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;lzma&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_lz=
ma(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_XZ:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;xz&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_xz=
(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_UU:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;uu&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_uu=
(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_RPM:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;rpm&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_rp=
m(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_LZ4:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;lz4&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_lz=
4(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_ZSTD:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;zstd&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_zs=
td(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_LZIP:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;lzip&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_lz=
ip(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_LZOP:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;lzop&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_lz=
op(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_LRZIP:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;lrzip&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_lr=
zip(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case ARCHIVE_FILTER_GRZIP:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str =3D &quot;grzip&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r1 =3D archive_read_support_filter_gr=
zip(_a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
+@@ -114,22 +112,10 @@ archive_read_append_filter(struct archive *_a, int c=
ode)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (ARCHIVE_FATAL);<br>
+&nbsp;&nbsp; }<br>
+<br>
+-&nbsp; if (code !=3D ARCHIVE_FILTER_NONE)<br>
++&nbsp; if (r1 &gt; ARCHIVE_FATAL &amp;&amp; code !=3D ARCHIVE_FILTER_NONE=
)<br>
+&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp; number_bidders =3D sizeof(a-&gt;bidders) / sizeof(a-&g=
t;bidders[0]);<br>
+-<br>
+-&nbsp;&nbsp;&nbsp; b =3D a-&gt;bidders;<br>
+-&nbsp;&nbsp;&nbsp; for (i =3D 1; i &lt; number_bidders; i++, b++)<br>
+-&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!b-&gt;name || !strcmp(b-&gt;name, str=
))<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+-&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp; if (!b-&gt;name || strcmp(b-&gt;name, str))<br>
+-&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; archive_set_error(&amp;a-&gt;archive, ARCH=
IVE_ERRNO_PROGRAMMER,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Internal err=
or: Unable to append filter&quot;);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (ARCHIVE_FATAL);<br>
+-&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; struct archive_read_filter_bidder *b;<br>
++&nbsp;&nbsp;&nbsp; struct archive_read_filter *f;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; f =3D calloc(1, sizeof(*f));<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (f =3D=3D NULL)<br>
+@@ -137,6 +123,7 @@ archive_read_append_filter(struct archive *_a, int cod=
e)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; archive_set_error(&amp;a-&gt;archive,=
 ENOMEM, &quot;Out of memory&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (ARCHIVE_FATAL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; b =3D get_last_bidder(a);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; f-&gt;bidder =3D b;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; f-&gt;archive =3D a;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; f-&gt;upstream =3D a-&gt;filter;<br>
+@@ -162,37 +149,22 @@ int<br>
+ archive_read_append_filter_program_signature(struct archive *_a,<br>
+&nbsp;&nbsp; const char *cmd, const void *signature, size_t signature_len)=
<br>
+ {<br>
+-&nbsp; int r, number_bidders, i;<br>
++&nbsp; struct archive_read *a =3D (struct archive_read *)_a;<br>
+&nbsp;&nbsp; struct archive_read_filter_bidder *b;<br>
+&nbsp;&nbsp; struct archive_read_filter *f;<br>
+-&nbsp; struct archive_read *a =3D (struct archive_read *)_a;<br>
++&nbsp; int r;<br>
+<br>
+&nbsp;&nbsp; if (archive_read_support_filter_program_signature(_a, cmd, si=
gnature,<br>
+&nbsp;&nbsp;&nbsp;&nbsp; signature_len) !=3D (ARCHIVE_OK))<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return (ARCHIVE_FATAL);<br>
+<br>
+-&nbsp; number_bidders =3D sizeof(a-&gt;bidders) / sizeof(a-&gt;bidders[0]=
);<br>
+-<br>
+-&nbsp; b =3D a-&gt;bidders;<br>
+-&nbsp; for (i =3D 0; i &lt; number_bidders; i++, b++)<br>
+-&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp; /* Program bidder name set to filter name after initia=
lization */<br>
+-&nbsp;&nbsp;&nbsp; if (b-&gt;data &amp;&amp; !b-&gt;name)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+-&nbsp; }<br>
+-&nbsp; if (!b-&gt;data)<br>
+-&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp; archive_set_error(&amp;a-&gt;archive, ARCHIVE_ERRNO_PR=
OGRAMMER,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Internal error: Unable t=
o append program filter&quot;);<br>
+-&nbsp;&nbsp;&nbsp; return (ARCHIVE_FATAL);<br>
+-&nbsp; }<br>
+-<br>
+&nbsp;&nbsp; f =3D calloc(1, sizeof(*f));<br>
+&nbsp;&nbsp; if (f =3D=3D NULL)<br>
+&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; archive_set_error(&amp;a-&gt;archive, ENOMEM, &qu=
ot;Out of memory&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return (ARCHIVE_FATAL);<br>
+&nbsp;&nbsp; }<br>
++&nbsp; b =3D get_last_bidder(a);<br>
+&nbsp;&nbsp; f-&gt;bidder =3D b;<br>
+&nbsp;&nbsp; f-&gt;archive =3D a;<br>
+&nbsp;&nbsp; f-&gt;upstream =3D a-&gt;filter;<br>
+--<br>
+2.54.0<br>
+<br>
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.8.9.bb<br>
index 63c66eea81..35b724ca39 100644<br>
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb<br>
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb<br>
@@ -31,6 +31,7 @@ EXTRA_OECONF +=3D &quot;--enable-largefile --without-icon=
v&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI =3D &quot;https://libarchive.org/downloads/libarchive-${PV}.t=
ar.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://run-ptest" target=3D"_blank" id=3D"OWA18f2f085-a5f6-2736-dada-68=
c134b31c22" class=3D"OWAAutoLink" rel=3D"noopener noreferrer" data-auth=3D"=
NotApplicable">
file://run-ptest</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0001-append_filter-Use-last-bidder-for-filter.patch" target=3D"_blank"=
 id=3D"OWA15b0587a-ee0a-1cdc-da6e-a2b994977d9e" class=3D"OWAAutoLink" rel=
=3D"noopener noreferrer" data-auth=3D"NotApplicable">
file://0001-append_filter-Use-last-bidder-for-filter.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch"=
 target=3D"_blank" id=3D"OWA1ade2846-1155-441f-4b45-b8b97a8c2749" class=3D"=
OWAAutoLink" rel=3D"noopener noreferrer" data-auth=3D"NotApplicable">
file://0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://www.libarchive.org/" =
target=3D"_blank" id=3D"OWA122dce03-de43-4649-185e-e3a63a4bee0d" class=3D"O=
WAAutoLink" rel=3D"noopener noreferrer" data-auth=3D"NotApplicable">https:/=
/www.libarchive.org/</a>&quot;<br>
--<br>
2.54.0<br>
<br>
</div>
</body>
</html>

--_000_CH3PR11MB87748BA4352AA4FB377928768FDE2CH3PR11MB8774namp_--

